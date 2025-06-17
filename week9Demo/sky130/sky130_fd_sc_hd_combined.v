/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A2111O_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A2111O_FUNCTIONAL_PP_V

/**
 * a2111o: 2-input AND into first input of 4-input OR.
 *
 *         X = ((A1 & A2) | B1 | C1 | D1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a2111o (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    D1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  D1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A1, A2               );
    or                                 or0         (or0_out_X        , C1, B1, and0_out, D1 );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A2111O_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A2111O_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A2111O_FUNCTIONAL_V

/**
 * a2111o: 2-input AND into first input of 4-input OR.
 *
 *         X = ((A1 & A2) | B1 | C1 | D1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a2111o (
    X ,
    A1,
    A2,
    B1,
    C1,
    D1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;
    input  D1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A1, A2              );
    or  or0  (or0_out_X, C1, B1, and0_out, D1);
    buf buf0 (X        , or0_out_X           );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A2111O_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A2111OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A2111OI_FUNCTIONAL_PP_V

/**
 * a2111oi: 2-input AND into first input of 4-input NOR.
 *
 *          Y = !((A1 & A2) | B1 | C1 | D1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a2111oi (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    D1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  D1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A1, A2                );
    nor                                nor0        (nor0_out_Y       , B1, C1, D1, and0_out  );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A2111OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A2111OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A2111OI_FUNCTIONAL_V

/**
 * a2111oi: 2-input AND into first input of 4-input NOR.
 *
 *          Y = !((A1 & A2) | B1 | C1 | D1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a2111oi (
    Y ,
    A1,
    A2,
    B1,
    C1,
    D1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;
    input  D1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A1, A2              );
    nor nor0 (nor0_out_Y, B1, C1, D1, and0_out);
    buf buf0 (Y         , nor0_out_Y          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A2111OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A211O_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A211O_FUNCTIONAL_PP_V

/**
 * a211o: 2-input AND into first input of 3-input OR.
 *
 *        X = ((A1 & A2) | B1 | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a211o (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A1, A2               );
    or                                 or0         (or0_out_X        , and0_out, C1, B1     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A211O_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A211O_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A211O_FUNCTIONAL_V

/**
 * a211o: 2-input AND into first input of 3-input OR.
 *
 *        X = ((A1 & A2) | B1 | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a211o (
    X ,
    A1,
    A2,
    B1,
    C1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A1, A2          );
    or  or0  (or0_out_X, and0_out, C1, B1);
    buf buf0 (X        , or0_out_X       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A211O_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A211OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A211OI_FUNCTIONAL_PP_V

/**
 * a211oi: 2-input AND into first input of 3-input NOR.
 *
 *         Y = !((A1 & A2) | B1 | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a211oi (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A1, A2                );
    nor                                nor0        (nor0_out_Y       , and0_out, B1, C1      );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A211OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A211OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A211OI_FUNCTIONAL_V

/**
 * a211oi: 2-input AND into first input of 3-input NOR.
 *
 *         Y = !((A1 & A2) | B1 | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a211oi (
    Y ,
    A1,
    A2,
    B1,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A1, A2          );
    nor nor0 (nor0_out_Y, and0_out, B1, C1);
    buf buf0 (Y         , nor0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A211OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A21BO_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A21BO_FUNCTIONAL_PP_V

/**
 * a21bo: 2-input AND into first input of 2-input OR,
 *        2nd input inverted.
 *
 *        X = ((A1 & A2) | (!B1_N))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a21bo (
    X   ,
    A1  ,
    A2  ,
    B1_N,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out        ;
    wire nand1_out_X      ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out        , A2, A1                 );
    nand                               nand1       (nand1_out_X      , B1_N, nand0_out        );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, nand1_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A21BO_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A21BO_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A21BO_FUNCTIONAL_V

/**
 * a21bo: 2-input AND into first input of 2-input OR,
 *        2nd input inverted.
 *
 *        X = ((A1 & A2) | (!B1_N))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a21bo (
    X   ,
    A1  ,
    A2  ,
    B1_N
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;

    // Local signals
    wire nand0_out  ;
    wire nand1_out_X;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out  , A2, A1         );
    nand nand1 (nand1_out_X, B1_N, nand0_out);
    buf  buf0  (X          , nand1_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A21BO_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A21BOI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A21BOI_FUNCTIONAL_PP_V

/**
 * a21boi: 2-input AND into first input of 2-input NOR,
 *         2nd input inverted.
 *
 *         Y = !((A1 & A2) | (!B1_N))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a21boi (
    Y   ,
    A1  ,
    A2  ,
    B1_N,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire b                ;
    wire and0_out         ;
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (b                , B1_N                  );
    and                                and0        (and0_out         , A1, A2                );
    nor                                nor0        (nor0_out_Y       , b, and0_out           );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A21BOI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A21BOI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A21BOI_FUNCTIONAL_V

/**
 * a21boi: 2-input AND into first input of 2-input NOR,
 *         2nd input inverted.
 *
 *         Y = !((A1 & A2) | (!B1_N))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a21boi (
    Y   ,
    A1  ,
    A2  ,
    B1_N
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;

    // Local signals
    wire b         ;
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    not not0 (b         , B1_N           );
    and and0 (and0_out  , A1, A2         );
    nor nor0 (nor0_out_Y, b, and0_out    );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A21BOI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A21O_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A21O_FUNCTIONAL_PP_V

/**
 * a21o: 2-input AND into first input of 2-input OR.
 *
 *       X = ((A1 & A2) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a21o (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A1, A2               );
    or                                 or0         (or0_out_X        , and0_out, B1         );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A21O_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A21O_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A21O_FUNCTIONAL_V

/**
 * a21o: 2-input AND into first input of 2-input OR.
 *
 *       X = ((A1 & A2) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a21o (
    X ,
    A1,
    A2,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A1, A2         );
    or  or0  (or0_out_X, and0_out, B1   );
    buf buf0 (X        , or0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A21O_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A21OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A21OI_FUNCTIONAL_PP_V

/**
 * a21oi: 2-input AND into first input of 2-input NOR.
 *
 *        Y = !((A1 & A2) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a21oi (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A1, A2                );
    nor                                nor0        (nor0_out_Y       , B1, and0_out          );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A21OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A21OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A21OI_FUNCTIONAL_V

/**
 * a21oi: 2-input AND into first input of 2-input NOR.
 *
 *        Y = !((A1 & A2) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a21oi (
    Y ,
    A1,
    A2,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A1, A2         );
    nor nor0 (nor0_out_Y, B1, and0_out   );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A21OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A221O_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A221O_FUNCTIONAL_PP_V

/**
 * a221o: 2-input AND into first two inputs of 3-input OR.
 *
 *        X = ((A1 & A2) | (B1 & B2) | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a221o (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire and1_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , B1, B2                );
    and                                and1        (and1_out         , A1, A2                );
    or                                 or0         (or0_out_X        , and1_out, and0_out, C1);
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND );
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A221O_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A221O_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A221O_FUNCTIONAL_V

/**
 * a221o: 2-input AND into first two inputs of 3-input OR.
 *
 *        X = ((A1 & A2) | (B1 & B2) | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a221o (
    X ,
    A1,
    A2,
    B1,
    B2,
    C1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;

    // Local signals
    wire and0_out ;
    wire and1_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , B1, B2                );
    and and1 (and1_out , A1, A2                );
    or  or0  (or0_out_X, and1_out, and0_out, C1);
    buf buf0 (X        , or0_out_X             );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A221O_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A221OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A221OI_FUNCTIONAL_PP_V

/**
 * a221oi: 2-input AND into first two inputs of 3-input NOR.
 *
 *         Y = !((A1 & A2) | (B1 & B2) | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a221oi (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire and1_out         ;
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , B1, B2                );
    and                                and1        (and1_out         , A1, A2                );
    nor                                nor0        (nor0_out_Y       , and0_out, C1, and1_out);
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A221OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A221OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A221OI_FUNCTIONAL_V

/**
 * a221oi: 2-input AND into first two inputs of 3-input NOR.
 *
 *         Y = !((A1 & A2) | (B1 & B2) | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a221oi (
    Y ,
    A1,
    A2,
    B1,
    B2,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;

    // Local signals
    wire and0_out  ;
    wire and1_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , B1, B2                );
    and and1 (and1_out  , A1, A2                );
    nor nor0 (nor0_out_Y, and0_out, C1, and1_out);
    buf buf0 (Y         , nor0_out_Y            );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A221OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A222OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A222OI_FUNCTIONAL_PP_V

/**
 * a222oi: 2-input AND into all inputs of 3-input NOR.
 *
 *         Y = !((A1 & A2) | (B1 & B2) | (C1 & C2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a222oi (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    C1  ,
    C2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  C1  ;
    input  C2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out        ;
    wire nand1_out        ;
    wire nand2_out        ;
    wire and0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out        , A2, A1                         );
    nand                               nand1       (nand1_out        , B2, B1                         );
    nand                               nand2       (nand2_out        , C2, C1                         );
    and                                and0        (and0_out_Y       , nand0_out, nand1_out, nand2_out);
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, and0_out_Y, VPWR, VGND         );
    buf                                buf0        (Y                , pwrgood_pp0_out_Y              );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A222OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A222OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A222OI_FUNCTIONAL_V

/**
 * a222oi: 2-input AND into all inputs of 3-input NOR.
 *
 *         Y = !((A1 & A2) | (B1 & B2) | (C1 & C2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a222oi (
    Y ,
    A1,
    A2,
    B1,
    B2,
    C1,
    C2
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;
    input  C2;

    // Local signals
    wire nand0_out ;
    wire nand1_out ;
    wire nand2_out ;
    wire and0_out_Y;

    //   Name   Output      Other arguments
    nand nand0 (nand0_out , A2, A1                         );
    nand nand1 (nand1_out , B2, B1                         );
    nand nand2 (nand2_out , C2, C1                         );
    and  and0  (and0_out_Y, nand0_out, nand1_out, nand2_out);
    buf  buf0  (Y         , and0_out_Y                     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A222OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A22O_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A22O_FUNCTIONAL_PP_V

/**
 * a22o: 2-input AND into both inputs of 2-input OR.
 *
 *       X = ((A1 & A2) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a22o (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire and1_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , B1, B2               );
    and                                and1        (and1_out         , A1, A2               );
    or                                 or0         (or0_out_X        , and1_out, and0_out   );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A22O_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A22O_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A22O_FUNCTIONAL_V

/**
 * a22o: 2-input AND into both inputs of 2-input OR.
 *
 *       X = ((A1 & A2) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a22o (
    X ,
    A1,
    A2,
    B1,
    B2
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;

    // Local signals
    wire and0_out ;
    wire and1_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , B1, B2            );
    and and1 (and1_out , A1, A2            );
    or  or0  (or0_out_X, and1_out, and0_out);
    buf buf0 (X        , or0_out_X         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A22O_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A22OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A22OI_FUNCTIONAL_PP_V

/**
 * a22oi: 2-input AND into both inputs of 2-input NOR.
 *
 *        Y = !((A1 & A2) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a22oi (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out        ;
    wire nand1_out        ;
    wire and0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out        , A2, A1                );
    nand                               nand1       (nand1_out        , B2, B1                );
    and                                and0        (and0_out_Y       , nand0_out, nand1_out  );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, and0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A22OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A22OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A22OI_FUNCTIONAL_V

/**
 * a22oi: 2-input AND into both inputs of 2-input NOR.
 *
 *        Y = !((A1 & A2) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a22oi (
    Y ,
    A1,
    A2,
    B1,
    B2
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;

    // Local signals
    wire nand0_out ;
    wire nand1_out ;
    wire and0_out_Y;

    //   Name   Output      Other arguments
    nand nand0 (nand0_out , A2, A1              );
    nand nand1 (nand1_out , B2, B1              );
    and  and0  (and0_out_Y, nand0_out, nand1_out);
    buf  buf0  (Y         , and0_out_Y          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A22OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A2BB2O_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A2BB2O_FUNCTIONAL_PP_V

/**
 * a2bb2o: 2-input AND, both inputs inverted, into first input, and
 *         2-input AND into 2nd input of 2-input OR.
 *
 *         X = ((!A1 & !A2) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a2bb2o (
    X   ,
    A1_N,
    A2_N,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire nor0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , B1, B2               );
    nor                                nor0        (nor0_out         , A1_N, A2_N           );
    or                                 or0         (or0_out_X        , nor0_out, and0_out   );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A2BB2O_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A2BB2O_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A2BB2O_FUNCTIONAL_V

/**
 * a2bb2o: 2-input AND, both inputs inverted, into first input, and
 *         2-input AND into 2nd input of 2-input OR.
 *
 *         X = ((!A1 & !A2) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a2bb2o (
    X   ,
    A1_N,
    A2_N,
    B1  ,
    B2
);

    // Module ports
    output X   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;

    // Local signals
    wire and0_out ;
    wire nor0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , B1, B2            );
    nor nor0 (nor0_out , A1_N, A2_N        );
    or  or0  (or0_out_X, nor0_out, and0_out);
    buf buf0 (X        , or0_out_X         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A2BB2O_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A2BB2OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A2BB2OI_FUNCTIONAL_PP_V

/**
 * a2bb2oi: 2-input AND, both inputs inverted, into first input, and
 *          2-input AND into 2nd input of 2-input NOR.
 *
 *          Y = !((!A1 & !A2) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a2bb2oi (
    Y   ,
    A1_N,
    A2_N,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire nor0_out         ;
    wire nor1_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , B1, B2                );
    nor                                nor0        (nor0_out         , A1_N, A2_N            );
    nor                                nor1        (nor1_out_Y       , nor0_out, and0_out    );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor1_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A2BB2OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A2BB2OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A2BB2OI_FUNCTIONAL_V

/**
 * a2bb2oi: 2-input AND, both inputs inverted, into first input, and
 *          2-input AND into 2nd input of 2-input NOR.
 *
 *          Y = !((!A1 & !A2) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a2bb2oi (
    Y   ,
    A1_N,
    A2_N,
    B1  ,
    B2
);

    // Module ports
    output Y   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;

    // Local signals
    wire and0_out  ;
    wire nor0_out  ;
    wire nor1_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , B1, B2            );
    nor nor0 (nor0_out  , A1_N, A2_N        );
    nor nor1 (nor1_out_Y, nor0_out, and0_out);
    buf buf0 (Y         , nor1_out_Y        );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A2BB2OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A311O_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A311O_FUNCTIONAL_PP_V

/**
 * a311o: 3-input AND into first input of 3-input OR.
 *
 *        X = ((A1 & A2 & A3) | B1 | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a311o (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A3, A1, A2           );
    or                                 or0         (or0_out_X        , and0_out, C1, B1     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A311O_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A311O_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A311O_FUNCTIONAL_V

/**
 * a311o: 3-input AND into first input of 3-input OR.
 *
 *        X = ((A1 & A2 & A3) | B1 | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a311o (
    X ,
    A1,
    A2,
    A3,
    B1,
    C1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  C1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A3, A1, A2      );
    or  or0  (or0_out_X, and0_out, C1, B1);
    buf buf0 (X        , or0_out_X       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A311O_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A311OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A311OI_FUNCTIONAL_PP_V

/**
 * a311oi: 3-input AND into first input of 3-input NOR.
 *
 *         Y = !((A1 & A2 & A3) | B1 | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a311oi (
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A3, A1, A2            );
    nor                                nor0        (nor0_out_Y       , and0_out, B1, C1      );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A311OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A311OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A311OI_FUNCTIONAL_V

/**
 * a311oi: 3-input AND into first input of 3-input NOR.
 *
 *         Y = !((A1 & A2 & A3) | B1 | C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a311oi (
    Y ,
    A1,
    A2,
    A3,
    B1,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  C1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A3, A1, A2      );
    nor nor0 (nor0_out_Y, and0_out, B1, C1);
    buf buf0 (Y         , nor0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A311OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A31O_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A31O_FUNCTIONAL_PP_V

/**
 * a31o: 3-input AND into first input of 2-input OR.
 *
 *       X = ((A1 & A2 & A3) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a31o (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A3, A1, A2           );
    or                                 or0         (or0_out_X        , and0_out, B1         );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A31O_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A31O_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A31O_FUNCTIONAL_V

/**
 * a31o: 3-input AND into first input of 2-input OR.
 *
 *       X = ((A1 & A2 & A3) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a31o (
    X ,
    A1,
    A2,
    A3,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A3, A1, A2     );
    or  or0  (or0_out_X, and0_out, B1   );
    buf buf0 (X        , or0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A31O_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A31OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A31OI_FUNCTIONAL_PP_V

/**
 * a31oi: 3-input AND into first input of 2-input NOR.
 *
 *        Y = !((A1 & A2 & A3) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a31oi (
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A3, A1, A2            );
    nor                                nor0        (nor0_out_Y       , B1, and0_out          );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A31OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A31OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A31OI_FUNCTIONAL_V

/**
 * a31oi: 3-input AND into first input of 2-input NOR.
 *
 *        Y = !((A1 & A2 & A3) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a31oi (
    Y ,
    A1,
    A2,
    A3,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A3, A1, A2     );
    nor nor0 (nor0_out_Y, B1, and0_out   );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A31OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A32O_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A32O_FUNCTIONAL_PP_V

/**
 * a32o: 3-input AND into first input, and 2-input AND into
 *       2nd input of 2-input OR.
 *
 *       X = ((A1 & A2 & A3) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a32o (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire and1_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A3, A1, A2           );
    and                                and1        (and1_out         , B1, B2               );
    or                                 or0         (or0_out_X        , and1_out, and0_out   );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A32O_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A32O_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A32O_FUNCTIONAL_V

/**
 * a32o: 3-input AND into first input, and 2-input AND into
 *       2nd input of 2-input OR.
 *
 *       X = ((A1 & A2 & A3) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a32o (
    X ,
    A1,
    A2,
    A3,
    B1,
    B2
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  B2;

    // Local signals
    wire and0_out ;
    wire and1_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A3, A1, A2        );
    and and1 (and1_out , B1, B2            );
    or  or0  (or0_out_X, and1_out, and0_out);
    buf buf0 (X        , or0_out_X         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A32O_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A32OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A32OI_FUNCTIONAL_PP_V

/**
 * a32oi: 3-input AND into first input, and 2-input AND into
 *        2nd input of 2-input NOR.
 *
 *        Y = !((A1 & A2 & A3) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a32oi (
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out        ;
    wire nand1_out        ;
    wire and0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out        , A2, A1, A3            );
    nand                               nand1       (nand1_out        , B2, B1                );
    and                                and0        (and0_out_Y       , nand0_out, nand1_out  );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, and0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A32OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A32OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A32OI_FUNCTIONAL_V

/**
 * a32oi: 3-input AND into first input, and 2-input AND into
 *        2nd input of 2-input NOR.
 *
 *        Y = !((A1 & A2 & A3) | (B1 & B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a32oi (
    Y ,
    A1,
    A2,
    A3,
    B1,
    B2
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  B2;

    // Local signals
    wire nand0_out ;
    wire nand1_out ;
    wire and0_out_Y;

    //   Name   Output      Other arguments
    nand nand0 (nand0_out , A2, A1, A3          );
    nand nand1 (nand1_out , B2, B1              );
    and  and0  (and0_out_Y, nand0_out, nand1_out);
    buf  buf0  (Y         , and0_out_Y          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A32OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A41O_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A41O_FUNCTIONAL_PP_V

/**
 * a41o: 4-input AND into first input of 2-input OR.
 *
 *       X = ((A1 & A2 & A3 & A4) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a41o (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    A4  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  A4  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A1, A2, A3, A4       );
    or                                 or0         (or0_out_X        , and0_out, B1         );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A41O_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A41O_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A41O_FUNCTIONAL_V

/**
 * a41o: 4-input AND into first input of 2-input OR.
 *
 *       X = ((A1 & A2 & A3 & A4) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a41o (
    X ,
    A1,
    A2,
    A3,
    A4,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  A4;
    input  B1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A1, A2, A3, A4 );
    or  or0  (or0_out_X, and0_out, B1   );
    buf buf0 (X        , or0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A41O_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A41OI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__A41OI_FUNCTIONAL_PP_V

/**
 * a41oi: 4-input AND into first input of 2-input NOR.
 *
 *        Y = !((A1 & A2 & A3 & A4) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__a41oi (
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    A4  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  A4  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out         ;
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out         , A1, A2, A3, A4        );
    nor                                nor0        (nor0_out_Y       , B1, and0_out          );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A41OI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__A41OI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__A41OI_FUNCTIONAL_V

/**
 * a41oi: 4-input AND into first input of 2-input NOR.
 *
 *        Y = !((A1 & A2 & A3 & A4) | B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__a41oi (
    Y ,
    A1,
    A2,
    A3,
    A4,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  A4;
    input  B1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A1, A2, A3, A4 );
    nor nor0 (nor0_out_Y, B1, and0_out   );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__A41OI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__AND2_FUNCTIONAL_PP_V

/**
 * and2: 2-input AND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__and2 (
    X   ,
    A   ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out_X       , A, B                  );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND2_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND2_FUNCTIONAL_V
`define SKY130_FD_SC_HD__AND2_FUNCTIONAL_V

/**
 * and2: 2-input AND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__and2 (
    X,
    A,
    B
);

    // Module ports
    output X;
    input  A;
    input  B;

    // Local signals
    wire and0_out_X;

    //  Name  Output      Other arguments
    and and0 (and0_out_X, A, B           );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND2_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND2B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__AND2B_FUNCTIONAL_PP_V

/**
 * and2b: 2-input AND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__and2b (
    X   ,
    A_N ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A_N ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , A_N                   );
    and                                and0        (and0_out_X       , not0_out, B           );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND2B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND2B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__AND2B_FUNCTIONAL_V

/**
 * and2b: 2-input AND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__and2b (
    X  ,
    A_N,
    B
);

    // Module ports
    output X  ;
    input  A_N;
    input  B  ;

    // Local signals
    wire not0_out  ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    not not0 (not0_out  , A_N            );
    and and0 (and0_out_X, not0_out, B    );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND2B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND3_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__AND3_FUNCTIONAL_PP_V

/**
 * and3: 3-input AND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__and3 (
    X   ,
    A   ,
    B   ,
    C   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out_X       , C, A, B               );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND3_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND3_FUNCTIONAL_V
`define SKY130_FD_SC_HD__AND3_FUNCTIONAL_V

/**
 * and3: 3-input AND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__and3 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire and0_out_X;

    //  Name  Output      Other arguments
    and and0 (and0_out_X, C, A, B        );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND3_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND3B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__AND3B_FUNCTIONAL_PP_V

/**
 * and3b: 3-input AND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__and3b (
    X   ,
    A_N ,
    B   ,
    C   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A_N ;
    input  B   ;
    input  C   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , A_N                   );
    and                                and0        (and0_out_X       , C, not0_out, B        );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND3B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND3B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__AND3B_FUNCTIONAL_V

/**
 * and3b: 3-input AND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__and3b (
    X  ,
    A_N,
    B  ,
    C
);

    // Module ports
    output X  ;
    input  A_N;
    input  B  ;
    input  C  ;

    // Local signals
    wire not0_out  ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    not not0 (not0_out  , A_N            );
    and and0 (and0_out_X, C, not0_out, B );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND3B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND4_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__AND4_FUNCTIONAL_PP_V

/**
 * and4: 4-input AND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__and4 (
    X   ,
    A   ,
    B   ,
    C   ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    and                                and0        (and0_out_X       , A, B, C, D            );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND4_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND4_FUNCTIONAL_V
`define SKY130_FD_SC_HD__AND4_FUNCTIONAL_V

/**
 * and4: 4-input AND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__and4 (
    X,
    A,
    B,
    C,
    D
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    input  D;

    // Local signals
    wire and0_out_X;

    //  Name  Output      Other arguments
    and and0 (and0_out_X, A, B, C, D     );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND4_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND4B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__AND4B_FUNCTIONAL_PP_V

/**
 * and4b: 4-input AND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__and4b (
    X   ,
    A_N ,
    B   ,
    C   ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A_N ;
    input  B   ;
    input  C   ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , A_N                   );
    and                                and0        (and0_out_X       , not0_out, B, C, D     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND4B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND4B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__AND4B_FUNCTIONAL_V

/**
 * and4b: 4-input AND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__and4b (
    X  ,
    A_N,
    B  ,
    C  ,
    D
);

    // Module ports
    output X  ;
    input  A_N;
    input  B  ;
    input  C  ;
    input  D  ;

    // Local signals
    wire not0_out  ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    not not0 (not0_out  , A_N              );
    and and0 (and0_out_X, not0_out, B, C, D);
    buf buf0 (X         , and0_out_X       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND4B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND4BB_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__AND4BB_FUNCTIONAL_PP_V

/**
 * and4bb: 4-input AND, first two inputs inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__and4bb (
    X   ,
    A_N ,
    B_N ,
    C   ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A_N ;
    input  B_N ;
    input  C   ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nor0_out         ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    nor                                nor0        (nor0_out         , A_N, B_N              );
    and                                and0        (and0_out_X       , nor0_out, C, D        );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND4BB_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__AND4BB_FUNCTIONAL_V
`define SKY130_FD_SC_HD__AND4BB_FUNCTIONAL_V

/**
 * and4bb: 4-input AND, first two inputs inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__and4bb (
    X  ,
    A_N,
    B_N,
    C  ,
    D
);

    // Module ports
    output X  ;
    input  A_N;
    input  B_N;
    input  C  ;
    input  D  ;

    // Local signals
    wire nor0_out  ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out  , A_N, B_N       );
    and and0 (and0_out_X, nor0_out, C, D );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__AND4BB_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__BUF_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__BUF_FUNCTIONAL_PP_V

/**
 * buf: Buffer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__buf (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__BUF_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__BUF_FUNCTIONAL_V
`define SKY130_FD_SC_HD__BUF_FUNCTIONAL_V

/**
 * buf: Buffer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__buf (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__BUF_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__BUFBUF_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__BUFBUF_FUNCTIONAL_PP_V

/**
 * bufbuf: Double buffer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__bufbuf (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__BUFBUF_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__BUFBUF_FUNCTIONAL_V
`define SKY130_FD_SC_HD__BUFBUF_FUNCTIONAL_V

/**
 * bufbuf: Double buffer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__bufbuf (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__BUFBUF_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__BUFINV_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__BUFINV_FUNCTIONAL_PP_V

/**
 * bufinv: Buffer followed by inverter.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__bufinv (
    Y   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out_Y       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, not0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__BUFINV_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__BUFINV_FUNCTIONAL_V
`define SKY130_FD_SC_HD__BUFINV_FUNCTIONAL_V

/**
 * bufinv: Buffer followed by inverter.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__bufinv (
    Y,
    A
);

    // Module ports
    output Y;
    input  A;

    // Local signals
    wire not0_out_Y;

    //  Name  Output      Other arguments
    not not0 (not0_out_Y, A              );
    buf buf0 (Y         , not0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__BUFINV_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKBUF_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__CLKBUF_FUNCTIONAL_PP_V

/**
 * clkbuf: Clock tree buffer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__clkbuf (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKBUF_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKBUF_FUNCTIONAL_V
`define SKY130_FD_SC_HD__CLKBUF_FUNCTIONAL_V

/**
 * clkbuf: Clock tree buffer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__clkbuf (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKBUF_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKDLYBUF4S15_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__CLKDLYBUF4S15_FUNCTIONAL_PP_V

/**
 * clkdlybuf4s15: Clock Delay Buffer 4-stage 0.15um length inner stage
 *                gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__clkdlybuf4s15 (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKDLYBUF4S15_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKDLYBUF4S15_FUNCTIONAL_V
`define SKY130_FD_SC_HD__CLKDLYBUF4S15_FUNCTIONAL_V

/**
 * clkdlybuf4s15: Clock Delay Buffer 4-stage 0.15um length inner stage
 *                gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__clkdlybuf4s15 (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKDLYBUF4S15_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKDLYBUF4S18_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__CLKDLYBUF4S18_FUNCTIONAL_PP_V

/**
 * clkdlybuf4s18: Clock Delay Buffer 4-stage 0.18um length inner stage
 *                gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__clkdlybuf4s18 (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKDLYBUF4S18_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKDLYBUF4S18_FUNCTIONAL_V
`define SKY130_FD_SC_HD__CLKDLYBUF4S18_FUNCTIONAL_V

/**
 * clkdlybuf4s18: Clock Delay Buffer 4-stage 0.18um length inner stage
 *                gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__clkdlybuf4s18 (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKDLYBUF4S18_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKDLYBUF4S25_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__CLKDLYBUF4S25_FUNCTIONAL_PP_V

/**
 * clkdlybuf4s25: Clock Delay Buffer 4-stage 0.25um length inner stage
 *                gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__clkdlybuf4s25 (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKDLYBUF4S25_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKDLYBUF4S25_FUNCTIONAL_V
`define SKY130_FD_SC_HD__CLKDLYBUF4S25_FUNCTIONAL_V

/**
 * clkdlybuf4s25: Clock Delay Buffer 4-stage 0.25um length inner stage
 *                gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__clkdlybuf4s25 (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKDLYBUF4S25_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKDLYBUF4S50_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__CLKDLYBUF4S50_FUNCTIONAL_PP_V

/**
 * clkdlybuf4s50: Clock Delay Buffer 4-stage 0.59um length inner stage
 *                gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__clkdlybuf4s50 (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKDLYBUF4S50_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKDLYBUF4S50_FUNCTIONAL_V
`define SKY130_FD_SC_HD__CLKDLYBUF4S50_FUNCTIONAL_V

/**
 * clkdlybuf4s50: Clock Delay Buffer 4-stage 0.59um length inner stage
 *                gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__clkdlybuf4s50 (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKDLYBUF4S50_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKINV_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__CLKINV_FUNCTIONAL_PP_V

/**
 * clkinv: Clock tree inverter.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__clkinv (
    Y   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out_Y       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, not0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKINV_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKINV_FUNCTIONAL_V
`define SKY130_FD_SC_HD__CLKINV_FUNCTIONAL_V

/**
 * clkinv: Clock tree inverter.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__clkinv (
    Y,
    A
);

    // Module ports
    output Y;
    input  A;

    // Local signals
    wire not0_out_Y;

    //  Name  Output      Other arguments
    not not0 (not0_out_Y, A              );
    buf buf0 (Y         , not0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKINV_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKINVLP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__CLKINVLP_FUNCTIONAL_PP_V

/**
 * clkinvlp: Lower power Clock tree inverter.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__clkinvlp (
    Y   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out_Y       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, not0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKINVLP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CLKINVLP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__CLKINVLP_FUNCTIONAL_V

/**
 * clkinvlp: Lower power Clock tree inverter.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__clkinvlp (
    Y,
    A
);

    // Module ports
    output Y;
    input  A;

    // Local signals
    wire not0_out_Y;

    //  Name  Output      Other arguments
    not not0 (not0_out_Y, A              );
    buf buf0 (Y         , not0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CLKINVLP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CONB_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__CONB_FUNCTIONAL_PP_V

/**
 * conb: Constant value, low, high outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_g/sky130_fd_sc_hd__udp_pwrgood_pp_g.v"
`include "../../models/udp_pwrgood_pp_p/sky130_fd_sc_hd__udp_pwrgood_pp_p.v"

`celldefine
module sky130_fd_sc_hd__conb (
    HI  ,
    LO  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output HI  ;
    output LO  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire pullup0_out_HI  ;
    wire pulldown0_out_LO;

    //                                Name         Output            Other arguments
    pullup                            pullup0     (pullup0_out_HI  );
    sky130_fd_sc_hd__udp_pwrgood_pp$P pwrgood_pp0 (HI              , pullup0_out_HI, VPWR  );
    pulldown                          pulldown0   (pulldown0_out_LO);
    sky130_fd_sc_hd__udp_pwrgood_pp$G pwrgood_pp1 (LO              , pulldown0_out_LO, VGND);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CONB_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__CONB_FUNCTIONAL_V
`define SKY130_FD_SC_HD__CONB_FUNCTIONAL_V

/**
 * conb: Constant value, low, high outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__conb (
    HI,
    LO
);

    // Module ports
    output HI;
    output LO;

    //       Name       Output
    pullup   pullup0   (HI    );
    pulldown pulldown0 (LO    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__CONB_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DECAP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DECAP_FUNCTIONAL_PP_V

/**
 * decap: Decoupling capacitance filler.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__decap (
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    input VPWR;
    input VGND;
    input VPB ;
    input VNB ;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DECAP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DECAP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DECAP_FUNCTIONAL_V

/**
 * decap: Decoupling capacitance filler.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__decap ();
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DECAP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFBBN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DFBBN_FUNCTIONAL_PP_V

/**
 * dfbbn: Delay flop, inverted set, inverted reset, inverted clock,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_nsr_pp_pg_n/sky130_fd_sc_hd__udp_dff_nsr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dfbbn (
    Q      ,
    Q_N    ,
    D      ,
    CLK_N  ,
    SET_B  ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  CLK_N  ;
    input  SET_B  ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET;
    wire SET  ;
    wire CLK  ;
    wire buf_Q;

    //                                   Delay       Name  Output  Other arguments
    not                                              not0 (RESET , RESET_B                         );
    not                                              not1 (SET   , SET_B                           );
    not                                              not2 (CLK   , CLK_N                           );
    sky130_fd_sc_hd__udp_dff$NSR_pp$PG$N `UNIT_DELAY dff0 (buf_Q , SET, RESET, CLK, D, , VPWR, VGND);
    buf                                              buf0 (Q     , buf_Q                           );
    not                                              not3 (Q_N   , buf_Q                           );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFBBN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFBBN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DFBBN_FUNCTIONAL_V

/**
 * dfbbn: Delay flop, inverted set, inverted reset, inverted clock,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_nsr/sky130_fd_sc_hd__udp_dff_nsr.v"

`celldefine
module sky130_fd_sc_hd__dfbbn (
    Q      ,
    Q_N    ,
    D      ,
    CLK_N  ,
    SET_B  ,
    RESET_B
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  CLK_N  ;
    input  SET_B  ;
    input  RESET_B;

    // Local signals
    wire RESET;
    wire SET  ;
    wire CLK  ;
    wire buf_Q;

    //                           Delay       Name  Output  Other arguments
    not                                      not0 (RESET , RESET_B           );
    not                                      not1 (SET   , SET_B             );
    not                                      not2 (CLK   , CLK_N             );
    sky130_fd_sc_hd__udp_dff$NSR `UNIT_DELAY dff0 (buf_Q , SET, RESET, CLK, D);
    buf                                      buf0 (Q     , buf_Q             );
    not                                      not3 (Q_N   , buf_Q             );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFBBN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFBBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DFBBP_FUNCTIONAL_PP_V

/**
 * dfbbp: Delay flop, inverted set, inverted reset,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_nsr_pp_pg_n/sky130_fd_sc_hd__udp_dff_nsr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dfbbp (
    Q      ,
    Q_N    ,
    D      ,
    CLK    ,
    SET_B  ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  CLK    ;
    input  SET_B  ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET;
    wire SET  ;
    wire buf_Q;

    //                                   Delay       Name  Output  Other arguments
    not                                              not0 (RESET , RESET_B                         );
    not                                              not1 (SET   , SET_B                           );
    sky130_fd_sc_hd__udp_dff$NSR_pp$PG$N `UNIT_DELAY dff0 (buf_Q , SET, RESET, CLK, D, , VPWR, VGND);
    buf                                              buf0 (Q     , buf_Q                           );
    not                                              not2 (Q_N   , buf_Q                           );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFBBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFBBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DFBBP_FUNCTIONAL_V

/**
 * dfbbp: Delay flop, inverted set, inverted reset,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_nsr/sky130_fd_sc_hd__udp_dff_nsr.v"

`celldefine
module sky130_fd_sc_hd__dfbbp (
    Q      ,
    Q_N    ,
    D      ,
    CLK    ,
    SET_B  ,
    RESET_B
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  CLK    ;
    input  SET_B  ;
    input  RESET_B;

    // Local signals
    wire RESET;
    wire SET  ;
    wire buf_Q;

    //                           Delay       Name  Output  Other arguments
    not                                      not0 (RESET , RESET_B           );
    not                                      not1 (SET   , SET_B             );
    sky130_fd_sc_hd__udp_dff$NSR `UNIT_DELAY dff0 (buf_Q , SET, RESET, CLK, D);
    buf                                      buf0 (Q     , buf_Q             );
    not                                      not2 (Q_N   , buf_Q             );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFBBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFRBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DFRBP_FUNCTIONAL_PP_V

/**
 * dfrbp: Delay flop, inverted reset, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_pr_pp_pg_n/sky130_fd_sc_hd__udp_dff_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dfrbp (
    Q      ,
    Q_N    ,
    CLK    ,
    D      ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire buf_Q;
    wire RESET;

    //                                  Delay       Name  Output  Other arguments
    not                                             not0 (RESET , RESET_B                    );
    sky130_fd_sc_hd__udp_dff$PR_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, CLK, RESET, , VPWR, VGND);
    buf                                             buf0 (Q     , buf_Q                      );
    not                                             not1 (Q_N   , buf_Q                      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFRBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFRBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DFRBP_FUNCTIONAL_V

/**
 * dfrbp: Delay flop, inverted reset, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_pr/sky130_fd_sc_hd__udp_dff_pr.v"

`celldefine
module sky130_fd_sc_hd__dfrbp (
    Q      ,
    Q_N    ,
    CLK    ,
    D      ,
    RESET_B
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;

    // Local signals
    wire buf_Q;
    wire RESET;

    //                          Delay       Name  Output  Other arguments
    not                                     not0 (RESET , RESET_B        );
    sky130_fd_sc_hd__udp_dff$PR `UNIT_DELAY dff0 (buf_Q , D, CLK, RESET  );
    buf                                     buf0 (Q     , buf_Q          );
    not                                     not1 (Q_N   , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFRBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFRTN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DFRTN_FUNCTIONAL_PP_V

/**
 * dfrtn: Delay flop, inverted reset, inverted clock,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_pr_pp_pg_n/sky130_fd_sc_hd__udp_dff_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dfrtn (
    Q      ,
    CLK_N  ,
    D      ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  CLK_N  ;
    input  D      ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire buf_Q ;
    wire RESET ;
    wire intclk;

    //                                  Delay       Name  Output  Other arguments
    not                                             not0 (RESET , RESET_B                       );
    not                                             not1 (intclk, CLK_N                         );
    sky130_fd_sc_hd__udp_dff$PR_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, intclk, RESET, , VPWR, VGND);
    buf                                             buf0 (Q     , buf_Q                         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFRTN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFRTN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DFRTN_FUNCTIONAL_V

/**
 * dfrtn: Delay flop, inverted reset, inverted clock,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_pr/sky130_fd_sc_hd__udp_dff_pr.v"

`celldefine
module sky130_fd_sc_hd__dfrtn (
    Q      ,
    CLK_N  ,
    D      ,
    RESET_B
);

    // Module ports
    output Q      ;
    input  CLK_N  ;
    input  D      ;
    input  RESET_B;

    // Local signals
    wire buf_Q ;
    wire RESET ;
    wire intclk;

    //                          Delay       Name  Output  Other arguments
    not                                     not0 (RESET , RESET_B         );
    not                                     not1 (intclk, CLK_N           );
    sky130_fd_sc_hd__udp_dff$PR `UNIT_DELAY dff0 (buf_Q , D, intclk, RESET);
    buf                                     buf0 (Q     , buf_Q           );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFRTN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFRTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DFRTP_FUNCTIONAL_PP_V

/**
 * dfrtp: Delay flop, inverted reset, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_pr_pp_pg_n/sky130_fd_sc_hd__udp_dff_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dfrtp (
    Q      ,
    CLK    ,
    D      ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire buf_Q;
    wire RESET;

    //                                  Delay       Name  Output  Other arguments
    not                                             not0 (RESET , RESET_B                    );
    sky130_fd_sc_hd__udp_dff$PR_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, CLK, RESET, , VPWR, VGND);
    buf                                             buf0 (Q     , buf_Q                      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFRTP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFRTP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DFRTP_FUNCTIONAL_V

/**
 * dfrtp: Delay flop, inverted reset, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_pr/sky130_fd_sc_hd__udp_dff_pr.v"

`celldefine
module sky130_fd_sc_hd__dfrtp (
    Q      ,
    CLK    ,
    D      ,
    RESET_B
);

    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;

    // Local signals
    wire buf_Q;
    wire RESET;

    //                          Delay       Name  Output  Other arguments
    not                                     not0 (RESET , RESET_B        );
    sky130_fd_sc_hd__udp_dff$PR `UNIT_DELAY dff0 (buf_Q , D, CLK, RESET  );
    buf                                     buf0 (Q     , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFRTP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFSBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DFSBP_FUNCTIONAL_PP_V

/**
 * dfsbp: Delay flop, inverted set, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_ps_pp_pg_n/sky130_fd_sc_hd__udp_dff_ps_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dfsbp (
    Q    ,
    Q_N  ,
    CLK  ,
    D    ,
    SET_B,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    output Q    ;
    output Q_N  ;
    input  CLK  ;
    input  D    ;
    input  SET_B;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire buf_Q;
    wire SET  ;

    //                                  Delay       Name  Output  Other arguments
    not                                             not0 (SET   , SET_B                    );
    sky130_fd_sc_hd__udp_dff$PS_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, CLK, SET, , VPWR, VGND);
    buf                                             buf0 (Q     , buf_Q                    );
    not                                             not1 (Q_N   , buf_Q                    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFSBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFSBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DFSBP_FUNCTIONAL_V

/**
 * dfsbp: Delay flop, inverted set, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_ps/sky130_fd_sc_hd__udp_dff_ps.v"

`celldefine
module sky130_fd_sc_hd__dfsbp (
    Q    ,
    Q_N  ,
    CLK  ,
    D    ,
    SET_B
);

    // Module ports
    output Q    ;
    output Q_N  ;
    input  CLK  ;
    input  D    ;
    input  SET_B;

    // Local signals
    wire buf_Q;
    wire SET  ;

    //                          Delay       Name  Output  Other arguments
    not                                     not0 (SET   , SET_B          );
    sky130_fd_sc_hd__udp_dff$PS `UNIT_DELAY dff0 (buf_Q , D, CLK, SET    );
    buf                                     buf0 (Q     , buf_Q          );
    not                                     not1 (Q_N   , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFSBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFSTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DFSTP_FUNCTIONAL_PP_V

/**
 * dfstp: Delay flop, inverted set, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_ps_pp_pg_n/sky130_fd_sc_hd__udp_dff_ps_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dfstp (
    Q    ,
    CLK  ,
    D    ,
    SET_B,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    output Q    ;
    input  CLK  ;
    input  D    ;
    input  SET_B;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire buf_Q;
    wire SET  ;

    //                                  Delay       Name  Output  Other arguments
    not                                             not0 (SET   , SET_B                    );
    sky130_fd_sc_hd__udp_dff$PS_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, CLK, SET, , VPWR, VGND);
    buf                                             buf0 (Q     , buf_Q                    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFSTP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFSTP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DFSTP_FUNCTIONAL_V

/**
 * dfstp: Delay flop, inverted set, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_ps/sky130_fd_sc_hd__udp_dff_ps.v"

`celldefine
module sky130_fd_sc_hd__dfstp (
    Q    ,
    CLK  ,
    D    ,
    SET_B
);

    // Module ports
    output Q    ;
    input  CLK  ;
    input  D    ;
    input  SET_B;

    // Local signals
    wire buf_Q;
    wire SET  ;

    //                          Delay       Name  Output  Other arguments
    not                                     not0 (SET   , SET_B          );
    sky130_fd_sc_hd__udp_dff$PS `UNIT_DELAY dff0 (buf_Q , D, CLK, SET    );
    buf                                     buf0 (Q     , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFSTP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFXBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DFXBP_FUNCTIONAL_PP_V

/**
 * dfxbp: Delay flop, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_p_pp_pg_n/sky130_fd_sc_hd__udp_dff_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dfxbp (
    Q   ,
    Q_N ,
    CLK ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Q   ;
    output Q_N ;
    input  CLK ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf_Q;

    //                                 Delay       Name  Output  Other arguments
    sky130_fd_sc_hd__udp_dff$P_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, CLK, , VPWR, VGND);
    buf                                            buf0 (Q     , buf_Q               );
    not                                            not0 (Q_N   , buf_Q               );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFXBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFXBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DFXBP_FUNCTIONAL_V

/**
 * dfxbp: Delay flop, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_p/sky130_fd_sc_hd__udp_dff_p.v"

`celldefine
module sky130_fd_sc_hd__dfxbp (
    Q  ,
    Q_N,
    CLK,
    D
);

    // Module ports
    output Q  ;
    output Q_N;
    input  CLK;
    input  D  ;

    // Local signals
    wire buf_Q;

    //                         Delay       Name  Output  Other arguments
    sky130_fd_sc_hd__udp_dff$P `UNIT_DELAY dff0 (buf_Q , D, CLK         );
    buf                                    buf0 (Q     , buf_Q          );
    not                                    not0 (Q_N   , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFXBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFXTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DFXTP_FUNCTIONAL_PP_V

/**
 * dfxtp: Delay flop, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_p_pp_pg_n/sky130_fd_sc_hd__udp_dff_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dfxtp (
    Q   ,
    CLK ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Q   ;
    input  CLK ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf_Q;

    //                                 Delay       Name  Output  Other arguments
    sky130_fd_sc_hd__udp_dff$P_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, CLK, , VPWR, VGND);
    buf                                            buf0 (Q     , buf_Q               );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFXTP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DFXTP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DFXTP_FUNCTIONAL_V

/**
 * dfxtp: Delay flop, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_p/sky130_fd_sc_hd__udp_dff_p.v"

`celldefine
module sky130_fd_sc_hd__dfxtp (
    Q  ,
    CLK,
    D
);

    // Module ports
    output Q  ;
    input  CLK;
    input  D  ;

    // Local signals
    wire buf_Q;

    //                         Delay       Name  Output  Other arguments
    sky130_fd_sc_hd__udp_dff$P `UNIT_DELAY dff0 (buf_Q , D, CLK         );
    buf                                    buf0 (Q     , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DFXTP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DIODE_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DIODE_FUNCTIONAL_PP_V

/**
 * diode: Antenna tie-down diode.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__diode (
    DIODE,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    input DIODE;
    input VPWR ;
    input VGND ;
    input VPB  ;
    input VNB  ;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DIODE_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DIODE_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DIODE_FUNCTIONAL_V

/**
 * diode: Antenna tie-down diode.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__diode (
    DIODE
);

    // Module ports
    input DIODE;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DIODE_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLCLKP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLCLKP_FUNCTIONAL_PP_V

/**
 * dlclkp: Clock gate.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dlclkp (
    GCLK,
    GATE,
    CLK ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output GCLK;
    input  GATE;
    input  CLK ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire m0  ;
    wire clkn;

    //                                    Name     Output  Other arguments
    not                                   not0    (clkn  , CLK                     );
    sky130_fd_sc_hd__udp_dlatch$P_pp$PG$N dlatch0 (m0    , GATE, clkn, , VPWR, VGND);
    and                                   and0    (GCLK  , m0, CLK                 );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLCLKP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLCLKP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLCLKP_FUNCTIONAL_V

/**
 * dlclkp: Clock gate.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p/sky130_fd_sc_hd__udp_dlatch_p.v"

`celldefine
module sky130_fd_sc_hd__dlclkp (
    GCLK,
    GATE,
    CLK
);

    // Module ports
    output GCLK;
    input  GATE;
    input  CLK ;

    // Local signals
    wire m0  ;
    wire clkn;

    //                            Name     Output  Other arguments
    not                           not0    (clkn  , CLK            );
    sky130_fd_sc_hd__udp_dlatch$P dlatch0 (m0    , GATE, clkn     );
    and                           and0    (GCLK  , m0, CLK        );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLCLKP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLRBN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLRBN_FUNCTIONAL_PP_V

/**
 * dlrbn: Delay latch, inverted reset, inverted enable,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_pr_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dlrbn (
    Q      ,
    Q_N    ,
    RESET_B,
    D      ,
    GATE_N ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  RESET_B;
    input  D      ;
    input  GATE_N ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET  ;
    wire intgate;
    wire buf_Q  ;

    //                                     Delay       Name     Output   Other arguments
    not                                                not0    (RESET  , RESET_B                        );
    not                                                not1    (intgate, GATE_N                         );
    sky130_fd_sc_hd__udp_dlatch$PR_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q  , D, intgate, RESET, , VPWR, VGND);
    buf                                                buf0    (Q      , buf_Q                          );
    not                                                not2    (Q_N    , buf_Q                          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLRBN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLRBN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLRBN_FUNCTIONAL_V

/**
 * dlrbn: Delay latch, inverted reset, inverted enable,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_pr/sky130_fd_sc_hd__udp_dlatch_pr.v"

`celldefine
module sky130_fd_sc_hd__dlrbn (
    Q      ,
    Q_N    ,
    RESET_B,
    D      ,
    GATE_N
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  RESET_B;
    input  D      ;
    input  GATE_N ;

    // Local signals
    wire RESET  ;
    wire intgate;
    wire buf_Q  ;

    //                             Delay       Name     Output   Other arguments
    not                                        not0    (RESET  , RESET_B          );
    not                                        not1    (intgate, GATE_N           );
    sky130_fd_sc_hd__udp_dlatch$PR `UNIT_DELAY dlatch0 (buf_Q  , D, intgate, RESET);
    buf                                        buf0    (Q      , buf_Q            );
    not                                        not2    (Q_N    , buf_Q            );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLRBN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLRBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLRBP_FUNCTIONAL_PP_V

/**
 * dlrbp: Delay latch, inverted reset, non-inverted enable,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_pr_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dlrbp (
    Q      ,
    Q_N    ,
    RESET_B,
    D      ,
    GATE   ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  RESET_B;
    input  D      ;
    input  GATE   ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET;
    wire buf_Q;

    //                                     Delay       Name     Output  Other arguments
    not                                                not0    (RESET , RESET_B                     );
    sky130_fd_sc_hd__udp_dlatch$PR_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q , D, GATE, RESET, , VPWR, VGND);
    buf                                                buf0    (Q     , buf_Q                       );
    not                                                not1    (Q_N   , buf_Q                       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLRBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLRBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLRBP_FUNCTIONAL_V

/**
 * dlrbp: Delay latch, inverted reset, non-inverted enable,
 *        complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_pr/sky130_fd_sc_hd__udp_dlatch_pr.v"

`celldefine
module sky130_fd_sc_hd__dlrbp (
    Q      ,
    Q_N    ,
    RESET_B,
    D      ,
    GATE
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  RESET_B;
    input  D      ;
    input  GATE   ;

    // Local signals
    wire RESET;
    wire buf_Q;

    //                             Delay       Name     Output  Other arguments
    not                                        not0    (RESET , RESET_B        );
    sky130_fd_sc_hd__udp_dlatch$PR `UNIT_DELAY dlatch0 (buf_Q , D, GATE, RESET );
    buf                                        buf0    (Q     , buf_Q          );
    not                                        not1    (Q_N   , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLRBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLRTN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLRTN_FUNCTIONAL_PP_V

/**
 * dlrtn: Delay latch, inverted reset, inverted enable, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_pr_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dlrtn (
    Q      ,
    RESET_B,
    D      ,
    GATE_N ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  RESET_B;
    input  D      ;
    input  GATE_N ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET  ;
    wire intgate;
    wire buf_Q  ;

    //                                     Delay       Name     Output   Other arguments
    not                                                not0    (RESET  , RESET_B                        );
    not                                                not1    (intgate, GATE_N                         );
    sky130_fd_sc_hd__udp_dlatch$PR_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q  , D, intgate, RESET, , VPWR, VGND);
    buf                                                buf0    (Q      , buf_Q                          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLRTN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLRTN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLRTN_FUNCTIONAL_V

/**
 * dlrtn: Delay latch, inverted reset, inverted enable, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_pr/sky130_fd_sc_hd__udp_dlatch_pr.v"

`celldefine
module sky130_fd_sc_hd__dlrtn (
    Q      ,
    RESET_B,
    D      ,
    GATE_N
);

    // Module ports
    output Q      ;
    input  RESET_B;
    input  D      ;
    input  GATE_N ;

    // Local signals
    wire RESET  ;
    wire intgate;
    wire buf_Q  ;

    //                             Delay       Name     Output   Other arguments
    not                                        not0    (RESET  , RESET_B          );
    not                                        not1    (intgate, GATE_N           );
    sky130_fd_sc_hd__udp_dlatch$PR `UNIT_DELAY dlatch0 (buf_Q  , D, intgate, RESET);
    buf                                        buf0    (Q      , buf_Q            );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLRTN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLRTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLRTP_FUNCTIONAL_PP_V

/**
 * dlrtp: Delay latch, inverted reset, non-inverted enable,
 *        single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_pr_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dlrtp (
    Q      ,
    RESET_B,
    D      ,
    GATE   ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  RESET_B;
    input  D      ;
    input  GATE   ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET;
    wire buf_Q;

    //                                     Delay       Name     Output  Other arguments
    not                                                not0    (RESET , RESET_B                     );
    sky130_fd_sc_hd__udp_dlatch$PR_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q , D, GATE, RESET, , VPWR, VGND);
    buf                                                buf0    (Q     , buf_Q                       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLRTP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLRTP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLRTP_FUNCTIONAL_V

/**
 * dlrtp: Delay latch, inverted reset, non-inverted enable,
 *        single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_pr/sky130_fd_sc_hd__udp_dlatch_pr.v"

`celldefine
module sky130_fd_sc_hd__dlrtp (
    Q      ,
    RESET_B,
    D      ,
    GATE
);

    // Module ports
    output Q      ;
    input  RESET_B;
    input  D      ;
    input  GATE   ;

    // Local signals
    wire RESET;
    wire buf_Q;

    //                             Delay       Name     Output  Other arguments
    not                                        not0    (RESET , RESET_B        );
    sky130_fd_sc_hd__udp_dlatch$PR `UNIT_DELAY dlatch0 (buf_Q , D, GATE, RESET );
    buf                                        buf0    (Q     , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLRTP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLXBN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLXBN_FUNCTIONAL_PP_V

/**
 * dlxbn: Delay latch, inverted enable, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dlxbn (
    Q     ,
    Q_N   ,
    D     ,
    GATE_N,
    VPWR  ,
    VGND  ,
    VPB   ,
    VNB
);

    // Module ports
    output Q     ;
    output Q_N   ;
    input  D     ;
    input  GATE_N;
    input  VPWR  ;
    input  VGND  ;
    input  VPB   ;
    input  VNB   ;

    // Local signals
    wire GATE ;
    wire buf_Q;

    //                                    Delay       Name     Output  Other arguments
    not                                               not0    (GATE  , GATE_N               );
    sky130_fd_sc_hd__udp_dlatch$P_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q , D, GATE, , VPWR, VGND);
    buf                                               buf0    (Q     , buf_Q                );
    not                                               not1    (Q_N   , buf_Q                );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLXBN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLXBN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLXBN_FUNCTIONAL_V

/**
 * dlxbn: Delay latch, inverted enable, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p/sky130_fd_sc_hd__udp_dlatch_p.v"

`celldefine
module sky130_fd_sc_hd__dlxbn (
    Q     ,
    Q_N   ,
    D     ,
    GATE_N
);

    // Module ports
    output Q     ;
    output Q_N   ;
    input  D     ;
    input  GATE_N;

    // Local signals
    wire GATE ;
    wire buf_Q;

    //                            Delay       Name     Output  Other arguments
    not                                       not0    (GATE  , GATE_N         );
    sky130_fd_sc_hd__udp_dlatch$P `UNIT_DELAY dlatch0 (buf_Q , D, GATE        );
    buf                                       buf0    (Q     , buf_Q          );
    not                                       not1    (Q_N   , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLXBN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLXBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLXBP_FUNCTIONAL_PP_V

/**
 * dlxbp: Delay latch, non-inverted enable, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dlxbp (
    Q   ,
    Q_N ,
    D   ,
    GATE,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Q   ;
    output Q_N ;
    input  D   ;
    input  GATE;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf_Q;

    //                                    Delay       Name     Output  Other arguments
    sky130_fd_sc_hd__udp_dlatch$P_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q , D, GATE, , VPWR, VGND);
    buf                                               buf0    (Q     , buf_Q                );
    not                                               not0    (Q_N   , buf_Q                );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLXBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLXBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLXBP_FUNCTIONAL_V

/**
 * dlxbp: Delay latch, non-inverted enable, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p/sky130_fd_sc_hd__udp_dlatch_p.v"

`celldefine
module sky130_fd_sc_hd__dlxbp (
    Q   ,
    Q_N ,
    D   ,
    GATE
);

    // Module ports
    output Q   ;
    output Q_N ;
    input  D   ;
    input  GATE;

    // Local signals
    wire buf_Q;

    //                            Delay       Name     Output  Other arguments
    sky130_fd_sc_hd__udp_dlatch$P `UNIT_DELAY dlatch0 (buf_Q , D, GATE        );
    buf                                       buf0    (Q     , buf_Q          );
    not                                       not0    (Q_N   , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLXBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLXTN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLXTN_FUNCTIONAL_PP_V

/**
 * dlxtn: Delay latch, inverted enable, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dlxtn (
    Q     ,
    D     ,
    GATE_N,
    VPWR  ,
    VGND  ,
    VPB   ,
    VNB
);

    // Module ports
    output Q     ;
    input  D     ;
    input  GATE_N;
    input  VPWR  ;
    input  VGND  ;
    input  VPB   ;
    input  VNB   ;

    // Local signals
    wire GATE ;
    wire buf_Q;

    //                                    Name     Output  Other arguments
    not                                   not0    (GATE  , GATE_N               );
    sky130_fd_sc_hd__udp_dlatch$P_pp$PG$N dlatch0 (buf_Q , D, GATE, , VPWR, VGND);
    buf                                   buf0    (Q     , buf_Q                );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLXTN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLXTN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLXTN_FUNCTIONAL_V

/**
 * dlxtn: Delay latch, inverted enable, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p/sky130_fd_sc_hd__udp_dlatch_p.v"

`celldefine
module sky130_fd_sc_hd__dlxtn (
    Q     ,
    D     ,
    GATE_N
);

    // Module ports
    output Q     ;
    input  D     ;
    input  GATE_N;

    // Local signals
    wire GATE ;
    wire buf_Q;

    //                            Name     Output  Other arguments
    not                           not0    (GATE  , GATE_N         );
    sky130_fd_sc_hd__udp_dlatch$P dlatch0 (buf_Q , D, GATE        );
    buf                           buf0    (Q     , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLXTN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLXTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLXTP_FUNCTIONAL_PP_V

/**
 * dlxtp: Delay latch, non-inverted enable, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__dlxtp (
    Q   ,
    D   ,
    GATE,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Q   ;
    input  D   ;
    input  GATE;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf_Q;

    //                                    Name     Output  Other arguments
    sky130_fd_sc_hd__udp_dlatch$P_pp$PG$N dlatch0 (buf_Q , D, GATE, , VPWR, VGND);
    buf                                   buf0    (Q     , buf_Q                );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLXTP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLXTP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLXTP_FUNCTIONAL_V

/**
 * dlxtp: Delay latch, non-inverted enable, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p/sky130_fd_sc_hd__udp_dlatch_p.v"

`celldefine
module sky130_fd_sc_hd__dlxtp (
    Q   ,
    D   ,
    GATE
);

    // Module ports
    output Q   ;
    input  D   ;
    input  GATE;

    // Local signals
    wire buf_Q;

    //                            Name     Output  Other arguments
    sky130_fd_sc_hd__udp_dlatch$P dlatch0 (buf_Q , D, GATE        );
    buf                           buf0    (Q     , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLXTP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYGATE4SD1_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLYGATE4SD1_FUNCTIONAL_PP_V

/**
 * dlygate4sd1: Delay Buffer 4-stage 0.15um length inner stage gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__dlygate4sd1 (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYGATE4SD1_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYGATE4SD1_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLYGATE4SD1_FUNCTIONAL_V

/**
 * dlygate4sd1: Delay Buffer 4-stage 0.15um length inner stage gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__dlygate4sd1 (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYGATE4SD1_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYGATE4SD2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLYGATE4SD2_FUNCTIONAL_PP_V

/**
 * dlygate4sd2: Delay Buffer 4-stage 0.18um length inner stage gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__dlygate4sd2 (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYGATE4SD2_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYGATE4SD2_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLYGATE4SD2_FUNCTIONAL_V

/**
 * dlygate4sd2: Delay Buffer 4-stage 0.18um length inner stage gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__dlygate4sd2 (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYGATE4SD2_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYGATE4SD3_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLYGATE4SD3_FUNCTIONAL_PP_V

/**
 * dlygate4sd3: Delay Buffer 4-stage 0.50um length inner stage gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__dlygate4sd3 (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYGATE4SD3_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYGATE4SD3_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLYGATE4SD3_FUNCTIONAL_V

/**
 * dlygate4sd3: Delay Buffer 4-stage 0.50um length inner stage gates.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__dlygate4sd3 (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYGATE4SD3_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYMETAL6S2S_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLYMETAL6S2S_FUNCTIONAL_PP_V

/**
 * dlymetal6s2s: 6-inverter delay with output from 2nd stage on
 *               horizontal route.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__dlymetal6s2s (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYMETAL6S2S_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYMETAL6S2S_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLYMETAL6S2S_FUNCTIONAL_V

/**
 * dlymetal6s2s: 6-inverter delay with output from 2nd stage on
 *               horizontal route.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__dlymetal6s2s (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYMETAL6S2S_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYMETAL6S4S_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLYMETAL6S4S_FUNCTIONAL_PP_V

/**
 * dlymetal6s4s: 6-inverter delay with output from 4th inverter on
 *               horizontal route.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__dlymetal6s4s (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYMETAL6S4S_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYMETAL6S4S_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLYMETAL6S4S_FUNCTIONAL_V

/**
 * dlymetal6s4s: 6-inverter delay with output from 4th inverter on
 *               horizontal route.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__dlymetal6s4s (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYMETAL6S4S_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYMETAL6S6S_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__DLYMETAL6S6S_FUNCTIONAL_PP_V

/**
 * dlymetal6s6s: 6-inverter delay with output from 6th inverter on
 *               horizontal route.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__dlymetal6s6s (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYMETAL6S6S_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__DLYMETAL6S6S_FUNCTIONAL_V
`define SKY130_FD_SC_HD__DLYMETAL6S6S_FUNCTIONAL_V

/**
 * dlymetal6s6s: 6-inverter delay with output from 6th inverter on
 *               horizontal route.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__dlymetal6s6s (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__DLYMETAL6S6S_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__EBUFN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__EBUFN_FUNCTIONAL_PP_V

/**
 * ebufn: Tri-state buffer, negative enable.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__ebufn (
    Z   ,
    A   ,
    TE_B,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Z   ;
    input  A   ;
    input  TE_B;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire pwrgood_pp0_out_A  ;
    wire pwrgood_pp1_out_teb;

    //                                 Name         Output               Other arguments
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_A  , A, VPWR, VGND                         );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp1 (pwrgood_pp1_out_teb, TE_B, VPWR, VGND                      );
    bufif0                             bufif00     (Z                  , pwrgood_pp0_out_A, pwrgood_pp1_out_teb);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__EBUFN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__EBUFN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__EBUFN_FUNCTIONAL_V

/**
 * ebufn: Tri-state buffer, negative enable.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__ebufn (
    Z   ,
    A   ,
    TE_B
);

    // Module ports
    output Z   ;
    input  A   ;
    input  TE_B;

    //     Name     Output  Other arguments
    bufif0 bufif00 (Z     , A, TE_B        );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__EBUFN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__EDFXBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__EDFXBP_FUNCTIONAL_PP_V

/**
 * edfxbp: Delay flop with loopback enable, non-inverted clock,
 *         complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p_pp_pg_n/sky130_fd_sc_hd__udp_dff_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__edfxbp (
    Q   ,
    Q_N ,
    CLK ,
    D   ,
    DE  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Q   ;
    output Q_N ;
    input  CLK ;
    input  D   ;
    input  DE  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf_Q  ;
    wire mux_out;

    //                                 Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1                  mux_2to10 (mux_out, buf_Q, D, DE              );
    sky130_fd_sc_hd__udp_dff$P_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, , VPWR, VGND);
    buf                                            buf0      (Q      , buf_Q                     );
    not                                            not0      (Q_N    , buf_Q                     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__EDFXBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__EDFXBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__EDFXBP_FUNCTIONAL_V

/**
 * edfxbp: Delay flop with loopback enable, non-inverted clock,
 *         complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p/sky130_fd_sc_hd__udp_dff_p.v"

`celldefine
module sky130_fd_sc_hd__edfxbp (
    Q  ,
    Q_N,
    CLK,
    D  ,
    DE
);

    // Module ports
    output Q  ;
    output Q_N;
    input  CLK;
    input  D  ;
    input  DE ;

    // Local signals
    wire buf_Q  ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, buf_Q, D, DE   );
    sky130_fd_sc_hd__udp_dff$P    `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK   );
    buf                                       buf0      (Q      , buf_Q          );
    not                                       not0      (Q_N    , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__EDFXBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__EDFXTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__EDFXTP_FUNCTIONAL_PP_V

/**
 * edfxtp: Delay flop with loopback enable, non-inverted clock,
 *         single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p_pp_pg_n/sky130_fd_sc_hd__udp_dff_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__edfxtp (
    Q   ,
    CLK ,
    D   ,
    DE  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Q   ;
    input  CLK ;
    input  D   ;
    input  DE  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf_Q  ;
    wire mux_out;

    //                                 Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1                  mux_2to10 (mux_out, buf_Q, D, DE              );
    sky130_fd_sc_hd__udp_dff$P_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, , VPWR, VGND);
    buf                                            buf0      (Q      , buf_Q                     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__EDFXTP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__EDFXTP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__EDFXTP_FUNCTIONAL_V

/**
 * edfxtp: Delay flop with loopback enable, non-inverted clock,
 *         single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p/sky130_fd_sc_hd__udp_dff_p.v"

`celldefine
module sky130_fd_sc_hd__edfxtp (
    Q  ,
    CLK,
    D  ,
    DE
);

    // Module ports
    output Q  ;
    input  CLK;
    input  D  ;
    input  DE ;

    // Local signals
    wire buf_Q  ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, buf_Q, D, DE   );
    sky130_fd_sc_hd__udp_dff$P    `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK   );
    buf                                       buf0      (Q      , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__EDFXTP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__EINVN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__EINVN_FUNCTIONAL_PP_V

/**
 * einvn: Tri-state inverter, negative enable.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__einvn (
    Z   ,
    A   ,
    TE_B,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Z   ;
    input  A   ;
    input  TE_B;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire pwrgood_pp0_out_A  ;
    wire pwrgood_pp1_out_teb;

    //                                 Name         Output               Other arguments
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_A  , A, VPWR, VGND                         );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp1 (pwrgood_pp1_out_teb, TE_B, VPWR, VGND                      );
    notif0                             notif00     (Z                  , pwrgood_pp0_out_A, pwrgood_pp1_out_teb);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__EINVN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__EINVN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__EINVN_FUNCTIONAL_V

/**
 * einvn: Tri-state inverter, negative enable.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__einvn (
    Z   ,
    A   ,
    TE_B
);

    // Module ports
    output Z   ;
    input  A   ;
    input  TE_B;

    //     Name     Output  Other arguments
    notif0 notif00 (Z     , A, TE_B        );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__EINVN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__EINVP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__EINVP_FUNCTIONAL_PP_V

/**
 * einvp: Tri-state inverter, positive enable.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__einvp (
    Z   ,
    A   ,
    TE  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Z   ;
    input  A   ;
    input  TE  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire pwrgood_pp0_out_A ;
    wire pwrgood_pp1_out_TE;

    //                                 Name         Output              Other arguments
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_A , A, VPWR, VGND                        );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp1 (pwrgood_pp1_out_TE, TE, VPWR, VGND                       );
    notif1                             notif10     (Z                 , pwrgood_pp0_out_A, pwrgood_pp1_out_TE);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__EINVP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__EINVP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__EINVP_FUNCTIONAL_V

/**
 * einvp: Tri-state inverter, positive enable.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__einvp (
    Z ,
    A ,
    TE
);

    // Module ports
    output Z ;
    input  A ;
    input  TE;

    //     Name     Output  Other arguments
    notif1 notif10 (Z     , A, TE          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__EINVP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__FA_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__FA_FUNCTIONAL_PP_V

/**
 * fa: Full adder.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__fa (
    COUT,
    SUM ,
    A   ,
    B   ,
    CIN ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;
    input  CIN ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out             ;
    wire and0_out            ;
    wire and1_out            ;
    wire and2_out            ;
    wire nor0_out            ;
    wire nor1_out            ;
    wire or1_out_COUT        ;
    wire pwrgood_pp0_out_COUT;
    wire or2_out_SUM         ;
    wire pwrgood_pp1_out_SUM ;

    //                                 Name         Output                Other arguments
    or                                 or0         (or0_out             , CIN, B                  );
    and                                and0        (and0_out            , or0_out, A              );
    and                                and1        (and1_out            , B, CIN                  );
    or                                 or1         (or1_out_COUT        , and1_out, and0_out      );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_COUT, or1_out_COUT, VPWR, VGND);
    buf                                buf0        (COUT                , pwrgood_pp0_out_COUT    );
    and                                and2        (and2_out            , CIN, A, B               );
    nor                                nor0        (nor0_out            , A, or0_out              );
    nor                                nor1        (nor1_out            , nor0_out, COUT          );
    or                                 or2         (or2_out_SUM         , nor1_out, and2_out      );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp1 (pwrgood_pp1_out_SUM , or2_out_SUM, VPWR, VGND );
    buf                                buf1        (SUM                 , pwrgood_pp1_out_SUM     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__FA_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__FA_FUNCTIONAL_V
`define SKY130_FD_SC_HD__FA_FUNCTIONAL_V

/**
 * fa: Full adder.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__fa (
    COUT,
    SUM ,
    A   ,
    B   ,
    CIN
);

    // Module ports
    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;
    input  CIN ;

    // Local signals
    wire or0_out     ;
    wire and0_out    ;
    wire and1_out    ;
    wire and2_out    ;
    wire nor0_out    ;
    wire nor1_out    ;
    wire or1_out_COUT;
    wire or2_out_SUM ;

    //  Name  Output        Other arguments
    or  or0  (or0_out     , CIN, B            );
    and and0 (and0_out    , or0_out, A        );
    and and1 (and1_out    , B, CIN            );
    or  or1  (or1_out_COUT, and1_out, and0_out);
    buf buf0 (COUT        , or1_out_COUT      );
    and and2 (and2_out    , CIN, A, B         );
    nor nor0 (nor0_out    , A, or0_out        );
    nor nor1 (nor1_out    , nor0_out, COUT    );
    or  or2  (or2_out_SUM , nor1_out, and2_out);
    buf buf1 (SUM         , or2_out_SUM       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__FA_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__FAH_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__FAH_FUNCTIONAL_PP_V

/**
 * fah: Full adder.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__fah (
    COUT,
    SUM ,
    A   ,
    B   ,
    CI  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;
    input  CI  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire xor0_out_SUM        ;
    wire pwrgood_pp0_out_SUM ;
    wire a_b                 ;
    wire a_ci                ;
    wire b_ci                ;
    wire or0_out_COUT        ;
    wire pwrgood_pp1_out_COUT;

    //                                 Name         Output                Other arguments
    xor                                xor0        (xor0_out_SUM        , A, B, CI                );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_SUM , xor0_out_SUM, VPWR, VGND);
    buf                                buf0        (SUM                 , pwrgood_pp0_out_SUM     );
    and                                and0        (a_b                 , A, B                    );
    and                                and1        (a_ci                , A, CI                   );
    and                                and2        (b_ci                , B, CI                   );
    or                                 or0         (or0_out_COUT        , a_b, a_ci, b_ci         );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp1 (pwrgood_pp1_out_COUT, or0_out_COUT, VPWR, VGND);
    buf                                buf1        (COUT                , pwrgood_pp1_out_COUT    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__FAH_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__FAH_FUNCTIONAL_V
`define SKY130_FD_SC_HD__FAH_FUNCTIONAL_V

/**
 * fah: Full adder.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__fah (
    COUT,
    SUM ,
    A   ,
    B   ,
    CI
);

    // Module ports
    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;
    input  CI  ;

    // Local signals
    wire xor0_out_SUM;
    wire a_b         ;
    wire a_ci        ;
    wire b_ci        ;
    wire or0_out_COUT;

    //  Name  Output        Other arguments
    xor xor0 (xor0_out_SUM, A, B, CI       );
    buf buf0 (SUM         , xor0_out_SUM   );
    and and0 (a_b         , A, B           );
    and and1 (a_ci        , A, CI          );
    and and2 (b_ci        , B, CI          );
    or  or0  (or0_out_COUT, a_b, a_ci, b_ci);
    buf buf1 (COUT        , or0_out_COUT   );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__FAH_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__FAHCIN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__FAHCIN_FUNCTIONAL_PP_V

/**
 * fahcin: Full adder, inverted carry in.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__fahcin (
    COUT,
    SUM ,
    A   ,
    B   ,
    CIN ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;
    input  CIN ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire ci                  ;
    wire xor0_out_SUM        ;
    wire pwrgood_pp0_out_SUM ;
    wire a_b                 ;
    wire a_ci                ;
    wire b_ci                ;
    wire or0_out_COUT        ;
    wire pwrgood_pp1_out_COUT;

    //                                 Name         Output                Other arguments
    not                                not0        (ci                  , CIN                     );
    xor                                xor0        (xor0_out_SUM        , A, B, ci                );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_SUM , xor0_out_SUM, VPWR, VGND);
    buf                                buf0        (SUM                 , pwrgood_pp0_out_SUM     );
    and                                and0        (a_b                 , A, B                    );
    and                                and1        (a_ci                , A, ci                   );
    and                                and2        (b_ci                , B, ci                   );
    or                                 or0         (or0_out_COUT        , a_b, a_ci, b_ci         );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp1 (pwrgood_pp1_out_COUT, or0_out_COUT, VPWR, VGND);
    buf                                buf1        (COUT                , pwrgood_pp1_out_COUT    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__FAHCIN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__FAHCIN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__FAHCIN_FUNCTIONAL_V

/**
 * fahcin: Full adder, inverted carry in.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__fahcin (
    COUT,
    SUM ,
    A   ,
    B   ,
    CIN
);

    // Module ports
    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;
    input  CIN ;

    // Local signals
    wire ci          ;
    wire xor0_out_SUM;
    wire a_b         ;
    wire a_ci        ;
    wire b_ci        ;
    wire or0_out_COUT;

    //  Name  Output        Other arguments
    not not0 (ci          , CIN            );
    xor xor0 (xor0_out_SUM, A, B, ci       );
    buf buf0 (SUM         , xor0_out_SUM   );
    and and0 (a_b         , A, B           );
    and and1 (a_ci        , A, ci          );
    and and2 (b_ci        , B, ci          );
    or  or0  (or0_out_COUT, a_b, a_ci, b_ci);
    buf buf1 (COUT        , or0_out_COUT   );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__FAHCIN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__FAHCON_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__FAHCON_FUNCTIONAL_PP_V

/**
 * fahcon: Full adder, inverted carry in, inverted carry out.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__fahcon (
    COUT_N,
    SUM   ,
    A     ,
    B     ,
    CI    ,
    VPWR  ,
    VGND  ,
    VPB   ,
    VNB
);

    // Module ports
    output COUT_N;
    output SUM   ;
    input  A     ;
    input  B     ;
    input  CI    ;
    input  VPWR  ;
    input  VGND  ;
    input  VPB   ;
    input  VNB   ;

    // Local signals
    wire xor0_out_SUM         ;
    wire pwrgood_pp0_out_SUM  ;
    wire a_b                  ;
    wire a_ci                 ;
    wire b_ci                 ;
    wire or0_out_coutn        ;
    wire pwrgood_pp1_out_coutn;

    //                                 Name         Output                 Other arguments
    xor                                xor0        (xor0_out_SUM         , A, B, CI                 );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_SUM  , xor0_out_SUM, VPWR, VGND );
    buf                                buf0        (SUM                  , pwrgood_pp0_out_SUM      );
    nor                                nor0        (a_b                  , A, B                     );
    nor                                nor1        (a_ci                 , A, CI                    );
    nor                                nor2        (b_ci                 , B, CI                    );
    or                                 or0         (or0_out_coutn        , a_b, a_ci, b_ci          );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp1 (pwrgood_pp1_out_coutn, or0_out_coutn, VPWR, VGND);
    buf                                buf1        (COUT_N               , pwrgood_pp1_out_coutn    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__FAHCON_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__FAHCON_FUNCTIONAL_V
`define SKY130_FD_SC_HD__FAHCON_FUNCTIONAL_V

/**
 * fahcon: Full adder, inverted carry in, inverted carry out.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__fahcon (
    COUT_N,
    SUM   ,
    A     ,
    B     ,
    CI
);

    // Module ports
    output COUT_N;
    output SUM   ;
    input  A     ;
    input  B     ;
    input  CI    ;

    // Local signals
    wire xor0_out_SUM ;
    wire a_b          ;
    wire a_ci         ;
    wire b_ci         ;
    wire or0_out_coutn;

    //  Name  Output         Other arguments
    xor xor0 (xor0_out_SUM , A, B, CI       );
    buf buf0 (SUM          , xor0_out_SUM   );
    nor nor0 (a_b          , A, B           );
    nor nor1 (a_ci         , A, CI          );
    nor nor2 (b_ci         , B, CI          );
    or  or0  (or0_out_coutn, a_b, a_ci, b_ci);
    buf buf1 (COUT_N       , or0_out_coutn  );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__FAHCON_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__FILL_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__FILL_FUNCTIONAL_PP_V

/**
 * fill: Fill cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__fill (
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    input VPWR;
    input VGND;
    input VPB ;
    input VNB ;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__FILL_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__FILL_FUNCTIONAL_V
`define SKY130_FD_SC_HD__FILL_FUNCTIONAL_V

/**
 * fill: Fill cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__fill ();

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__FILL_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__HA_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__HA_FUNCTIONAL_PP_V

/**
 * ha: Half adder.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__ha (
    COUT,
    SUM ,
    A   ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire and0_out_COUT       ;
    wire pwrgood_pp0_out_COUT;
    wire xor0_out_SUM        ;
    wire pwrgood_pp1_out_SUM ;

    //                                 Name         Output                Other arguments
    and                                and0        (and0_out_COUT       , A, B                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_COUT, and0_out_COUT, VPWR, VGND);
    buf                                buf0        (COUT                , pwrgood_pp0_out_COUT     );
    xor                                xor0        (xor0_out_SUM        , B, A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp1 (pwrgood_pp1_out_SUM , xor0_out_SUM, VPWR, VGND );
    buf                                buf1        (SUM                 , pwrgood_pp1_out_SUM      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__HA_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__HA_FUNCTIONAL_V
`define SKY130_FD_SC_HD__HA_FUNCTIONAL_V

/**
 * ha: Half adder.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__ha (
    COUT,
    SUM ,
    A   ,
    B
);

    // Module ports
    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;

    // Local signals
    wire and0_out_COUT;
    wire xor0_out_SUM ;

    //  Name  Output         Other arguments
    and and0 (and0_out_COUT, A, B           );
    buf buf0 (COUT         , and0_out_COUT  );
    xor xor0 (xor0_out_SUM , B, A           );
    buf buf1 (SUM          , xor0_out_SUM   );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__HA_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__INV_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__INV_FUNCTIONAL_PP_V

/**
 * inv: Inverter.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__inv (
    Y   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out_Y       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, not0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__INV_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__INV_FUNCTIONAL_V
`define SKY130_FD_SC_HD__INV_FUNCTIONAL_V

/**
 * inv: Inverter.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__inv (
    Y,
    A
);

    // Module ports
    output Y;
    input  A;

    // Local signals
    wire not0_out_Y;

    //  Name  Output      Other arguments
    not not0 (not0_out_Y, A              );
    buf buf0 (Y         , not0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__INV_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/

`ifndef SKY130_FD_SC_HD__LPFLOW_BLEEDER_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_BLEEDER_FUNCTIONAL_PP_V

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_bleeder (
    SHORT,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    input SHORT;
    inout VPWR ;
    input VGND ;
    input VPB  ;
    input VNB  ;

endmodule
`endcelldefine

`default_nettype wire
`endif	// SKY130_FD_SC_HD__LPFLOW_BLEEDER_FUNCTIONAL_PP_V
/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/

`ifndef SKY130_FD_SC_HD__LPFLOW_BLEEDER_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_BLEEDER_FUNCTIONAL_V

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_bleeder (
    SHORT
);

    input SHORT;

endmodule
`endcelldefine

`default_nettype wire
`endif SKY130_FD_SC_HD__LPFLOW_BLEEDER_FUNCTIONAL_V
/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_CLKBUFKAPWR_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_CLKBUFKAPWR_FUNCTIONAL_PP_V

/**
 * lpflow_clkbufkapwr: Clock tree buffer on keep-alive power rail.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__lpflow_clkbufkapwr (
    X    ,
    A    ,
    KAPWR,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    output X    ;
    input  A    ;
    input  KAPWR;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire buf0_out_X    ;
    wire pwrgood0_out_X;

    //                                   Name      Output          Other arguments
    buf                                  buf0     (buf0_out_X    , A                      );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood0 (pwrgood0_out_X, buf0_out_X, KAPWR, VGND);
    buf                                  buf1     (X             , pwrgood0_out_X         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_CLKBUFKAPWR_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_CLKBUFKAPWR_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_CLKBUFKAPWR_FUNCTIONAL_V

/**
 * lpflow_clkbufkapwr: Clock tree buffer on keep-alive power rail.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_clkbufkapwr (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_CLKBUFKAPWR_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_CLKINVKAPWR_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_CLKINVKAPWR_FUNCTIONAL_PP_V

/**
 * lpflow_clkinvkapwr: Clock tree inverter on keep-alive rail.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__lpflow_clkinvkapwr (
    Y    ,
    A    ,
    KAPWR,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    output Y    ;
    input  A    ;
    input  KAPWR;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire not0_out_Y    ;
    wire pwrgood0_out_Y;

    //                                   Name      Output          Other arguments
    not                                  not0     (not0_out_Y    , A                      );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood0 (pwrgood0_out_Y, not0_out_Y, KAPWR, VGND);
    buf                                  buf0     (Y             , pwrgood0_out_Y         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_CLKINVKAPWR_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_CLKINVKAPWR_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_CLKINVKAPWR_FUNCTIONAL_V

/**
 * lpflow_clkinvkapwr: Clock tree inverter on keep-alive rail.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_clkinvkapwr (
    Y,
    A
);

    // Module ports
    output Y;
    input  A;

    // Local signals
    wire not0_out_Y;

    //  Name  Output      Other arguments
    not not0 (not0_out_Y, A              );
    buf buf0 (Y         , not0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_CLKINVKAPWR_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_DECAPKAPWR_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_DECAPKAPWR_FUNCTIONAL_PP_V

/**
 * lpflow_decapkapwr: Decoupling capacitance filler on keep-alive
 *                    rail.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_decapkapwr (
    VPWR ,
    KAPWR,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    input VPWR ;
    input KAPWR;
    input VGND ;
    input VPB  ;
    input VNB  ;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_DECAPKAPWR_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_DECAPKAPWR_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_DECAPKAPWR_FUNCTIONAL_V

/**
 * lpflow_decapkapwr: Decoupling capacitance filler on keep-alive
 *                    rail.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_decapkapwr ();
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_DECAPKAPWR_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_INPUTISO0N_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_INPUTISO0N_FUNCTIONAL_PP_V

/**
 * lpflow_inputiso0n: Input isolator with inverted enable.
 *
 *                    X = (A & SLEEP_B)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__lpflow_inputiso0n (
    X      ,
    A      ,
    SLEEP_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output X      ;
    input  A      ;
    input  SLEEP_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire and0_out_X;

    //                                   Name      Output      Other arguments
    and                                  and0     (and0_out_X, A, SLEEP_B            );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood0 (X         , and0_out_X, VPWR, VGND);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_INPUTISO0N_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_INPUTISO0N_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_INPUTISO0N_FUNCTIONAL_V

/**
 * lpflow_inputiso0n: Input isolator with inverted enable.
 *
 *                    X = (A & SLEEP_B)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_inputiso0n (
    X      ,
    A      ,
    SLEEP_B
);

    // Module ports
    output X      ;
    input  A      ;
    input  SLEEP_B;

    //  Name  Output  Other arguments
    and and0 (X     , A, SLEEP_B     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_INPUTISO0N_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_INPUTISO0P_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_INPUTISO0P_FUNCTIONAL_PP_V

/**
 * lpflow_inputiso0p: Input isolator with non-inverted enable.
 *
 *                    X = (A & !SLEEP_B)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__lpflow_inputiso0p (
    X    ,
    A    ,
    SLEEP,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    output X    ;
    input  A    ;
    input  SLEEP;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire sleepn    ;
    wire and0_out_X;

    //                                   Name      Output      Other arguments
    not                                  not0     (sleepn    , SLEEP                 );
    and                                  and0     (and0_out_X, A, sleepn             );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood0 (X         , and0_out_X, VPWR, VGND);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_INPUTISO0P_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_INPUTISO0P_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_INPUTISO0P_FUNCTIONAL_V

/**
 * lpflow_inputiso0p: Input isolator with non-inverted enable.
 *
 *                    X = (A & !SLEEP_B)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_inputiso0p (
    X    ,
    A    ,
    SLEEP
);

    // Module ports
    output X    ;
    input  A    ;
    input  SLEEP;

    // Local signals
    wire sleepn;

    //  Name  Output  Other arguments
    not not0 (sleepn, SLEEP          );
    and and0 (X     , A, sleepn      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_INPUTISO0P_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_INPUTISO1N_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_INPUTISO1N_FUNCTIONAL_PP_V

/**
 * lpflow_inputiso1n: Input isolation, inverted sleep.
 *
 *                    X = (A & SLEEP_B)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__lpflow_inputiso1n (
    X      ,
    A      ,
    SLEEP_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output X      ;
    input  A      ;
    input  SLEEP_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire SLEEP    ;
    wire or0_out_X;

    //                                   Name      Output     Other arguments
    not                                  not0     (SLEEP    , SLEEP_B              );
    or                                   or0      (or0_out_X, A, SLEEP             );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood0 (X        , or0_out_X, VPWR, VGND);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_INPUTISO1N_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_INPUTISO1N_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_INPUTISO1N_FUNCTIONAL_V

/**
 * lpflow_inputiso1n: Input isolation, inverted sleep.
 *
 *                    X = (A & SLEEP_B)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_inputiso1n (
    X      ,
    A      ,
    SLEEP_B
);

    // Module ports
    output X      ;
    input  A      ;
    input  SLEEP_B;

    // Local signals
    wire SLEEP;

    //  Name  Output  Other arguments
    not not0 (SLEEP , SLEEP_B        );
    or  or0  (X     , A, SLEEP       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_INPUTISO1N_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_INPUTISO1P_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_INPUTISO1P_FUNCTIONAL_PP_V

/**
 * lpflow_inputiso1p: Input isolation, noninverted sleep.
 *
 *                    X = (A & !SLEEP)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__lpflow_inputiso1p (
    X    ,
    A    ,
    SLEEP,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    output X    ;
    input  A    ;
    input  SLEEP;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire or0_out_X;

    //                                   Name      Output     Other arguments
    or                                   or0      (or0_out_X, A, SLEEP             );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood0 (X        , or0_out_X, VPWR, VGND);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_INPUTISO1P_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_INPUTISO1P_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_INPUTISO1P_FUNCTIONAL_V

/**
 * lpflow_inputiso1p: Input isolation, noninverted sleep.
 *
 *                    X = (A & !SLEEP)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_inputiso1p (
    X    ,
    A    ,
    SLEEP
);

    // Module ports
    output X    ;
    input  A    ;
    input  SLEEP;

    //  Name  Output  Other arguments
    or  or0  (X     , A, SLEEP       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_INPUTISO1P_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_INPUTISOLATCH_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_INPUTISOLATCH_FUNCTIONAL_PP_V

/**
 * lpflow_inputisolatch: Latching input isolator with inverted enable.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_lp_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_lp_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__lpflow_inputisolatch (
    Q      ,
    D      ,
    SLEEP_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  D      ;
    input  SLEEP_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire buf_Q;

    //                                     Name     Output  Other arguments
    sky130_fd_sc_hd__udp_dlatch$lP_pp$PG$N dlatch0 (buf_Q , D, SLEEP_B, 1'b0, VPWR, VGND);
    buf                                    buf0    (Q     , buf_Q                       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_INPUTISOLATCH_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_INPUTISOLATCH_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_INPUTISOLATCH_FUNCTIONAL_V

/**
 * lpflow_inputisolatch: Latching input isolator with inverted enable.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_lp/sky130_fd_sc_hd__udp_dlatch_lp.v"

`celldefine
module sky130_fd_sc_hd__lpflow_inputisolatch (
    Q      ,
    D      ,
    SLEEP_B
);

    // Module ports
    output Q      ;
    input  D      ;
    input  SLEEP_B;

    // Local signals
    wire buf_Q;

    //                             Name     Output  Other arguments
    sky130_fd_sc_hd__udp_dlatch$lP dlatch0 (buf_Q , D, SLEEP_B     );
    buf                            buf0    (Q     , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_INPUTISOLATCH_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_ISOBUFSRC_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_ISOBUFSRC_FUNCTIONAL_PP_V

/**
 * lpflow_isobufsrc: Input isolation, noninverted sleep.
 *
 *                   X = (!A | SLEEP)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg_s/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg_s.v"

`celldefine
module sky130_fd_sc_hd__lpflow_isobufsrc (
    X    ,
    SLEEP,
    A    ,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    output X    ;
    input  SLEEP;
    input  A    ;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire not0_out      ;
    wire and0_out_X    ;
    wire pwrgood0_out_X;

    //                                     Name      Output          Other arguments
    not                                    not0     (not0_out      , SLEEP                        );
    and                                    and0     (and0_out_X    , not0_out, A                  );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG$S pwrgood0 (pwrgood0_out_X, and0_out_X, VPWR, VGND, SLEEP);
    buf                                    buf0     (X             , pwrgood0_out_X               );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_ISOBUFSRC_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_ISOBUFSRC_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_ISOBUFSRC_FUNCTIONAL_V

/**
 * lpflow_isobufsrc: Input isolation, noninverted sleep.
 *
 *                   X = (!A | SLEEP)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_isobufsrc (
    X    ,
    SLEEP,
    A
);

    // Module ports
    output X    ;
    input  SLEEP;
    input  A    ;

    // Local signals
    wire not0_out  ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    not not0 (not0_out  , SLEEP          );
    and and0 (and0_out_X, not0_out, A    );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_ISOBUFSRC_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_ISOBUFSRCKAPWR_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_ISOBUFSRCKAPWR_FUNCTIONAL_PP_V

/**
 * lpflow_isobufsrckapwr: Input isolation, noninverted sleep on
 *                        keep-alive power rail.
 *
 *                        X = (!A | SLEEP)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg.v"
`include "../../models/udp_pwrgood_l_pp_pg_s/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg_s.v"

`celldefine
module sky130_fd_sc_hd__lpflow_isobufsrckapwr (
    X    ,
    SLEEP,
    A    ,
    KAPWR,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    output X    ;
    input  SLEEP;
    input  A    ;
    input  KAPWR;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire not0_out       ;
    wire and0_out_X     ;
    wire pwrgood0_out_X ;
    wire pwrgood1_out_x2;

    //                                     Name      Output           Other arguments
    not                                    not0     (not0_out       , SLEEP                        );
    and                                    and0     (and0_out_X     , not0_out, A                  );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG$S pwrgood0 (pwrgood0_out_X , and0_out_X, VPWR, VGND, SLEEP);
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG   pwrgood1 (pwrgood1_out_x2, pwrgood0_out_X, KAPWR, VGND  );
    buf                                    buf0     (X              , pwrgood1_out_x2              );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_ISOBUFSRCKAPWR_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_ISOBUFSRCKAPWR_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_ISOBUFSRCKAPWR_FUNCTIONAL_V

/**
 * lpflow_isobufsrckapwr: Input isolation, noninverted sleep on
 *                        keep-alive power rail.
 *
 *                        X = (!A | SLEEP)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_isobufsrckapwr (
    X    ,
    SLEEP,
    A
);

    // Module ports
    output X    ;
    input  SLEEP;
    input  A    ;

    // Local signals
    wire not0_out  ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    not not0 (not0_out  , SLEEP          );
    and and0 (and0_out_X, not0_out, A    );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_ISOBUFSRCKAPWR_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_HL_ISOWELL_TAP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_HL_ISOWELL_TAP_FUNCTIONAL_PP_V

/**
 * lpflow_lsbuf_lh_hl_isowell_tap: Level-shift buffer, low-to-high,
 *                                 isolated well on input buffer,
 *                                 vpb/vnb taps, double-row-height
 *                                 cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__lpflow_lsbuf_lh_hl_isowell_tap (
    X     ,
    A     ,
    VPWRIN,
    VPWR  ,
    VGND  ,
    VPB
);

    // Module ports
    output X     ;
    input  A     ;
    input  VPWRIN;
    input  VPWR  ;
    input  VGND  ;
    input  VPB   ;

    // Local signals
    wire pwrgood0_out_A;
    wire buf0_out_X    ;

    //                                   Name      Output          Other arguments
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood0 (pwrgood0_out_A, A, VPWRIN, VGND       );
    buf                                  buf0     (buf0_out_X    , pwrgood0_out_A        );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood1 (X             , buf0_out_X, VPWR, VGND);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_HL_ISOWELL_TAP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_HL_ISOWELL_TAP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_HL_ISOWELL_TAP_FUNCTIONAL_V

/**
 * lpflow_lsbuf_lh_hl_isowell_tap: Level-shift buffer, low-to-high,
 *                                 isolated well on input buffer,
 *                                 vpb/vnb taps, double-row-height
 *                                 cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_lsbuf_lh_hl_isowell_tap (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    //  Name  Output  Other arguments
    buf buf0 (X     , A              );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_HL_ISOWELL_TAP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_FUNCTIONAL_PP_V

/**
 * lpflow_lsbuf_lh_isowell: Level-shift buffer, low-to-high, isolated
 *                          well on input buffer, no taps,
 *                          double-row-height cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__lpflow_lsbuf_lh_isowell (
    X       ,
    A       ,
    LOWLVPWR,
    VPWR    ,
    VGND    ,
    VPB     ,
    VNB
);

    // Module ports
    output X       ;
    input  A       ;
    input  LOWLVPWR;
    input  VPWR    ;
    input  VGND    ;
    input  VPB     ;
    input  VNB     ;

    // Local signals
    wire pwrgood0_out_A;
    wire buf0_out_X    ;

    //                                   Name      Output          Other arguments
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood0 (pwrgood0_out_A, A, LOWLVPWR, VGND     );
    buf                                  buf0     (buf0_out_X    , pwrgood0_out_A        );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood1 (X             , buf0_out_X, VPWR, VGND);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_FUNCTIONAL_V

/**
 * lpflow_lsbuf_lh_isowell: Level-shift buffer, low-to-high, isolated
 *                          well on input buffer, no taps,
 *                          double-row-height cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_lsbuf_lh_isowell (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    //  Name  Output  Other arguments
    buf buf0 (X     , A              );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_TAP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_TAP_FUNCTIONAL_PP_V

/**
 * lpflow_lsbuf_lh_isowell_tap: Level-shift buffer, low-to-high,
 *                              isolated well on input buffer, vpb/vnb
 *                              taps, double-row-height cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_l_pp_pg/sky130_fd_sc_hd__udp_pwrgood_l_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__lpflow_lsbuf_lh_isowell_tap (
    X       ,
    A       ,
    LOWLVPWR,
    VPWR    ,
    VGND    ,
    VPB
);

    // Module ports
    output X       ;
    input  A       ;
    input  LOWLVPWR;
    input  VPWR    ;
    input  VGND    ;
    input  VPB     ;

    // Local signals
    wire pwrgood0_out_A;
    wire buf0_out_X    ;

    //                                   Name      Output          Other arguments
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood0 (pwrgood0_out_A, A, LOWLVPWR, VGND     );
    buf                                  buf0     (buf0_out_X    , pwrgood0_out_A        );
    sky130_fd_sc_hd__udp_pwrgood$l_pp$PG pwrgood1 (X             , buf0_out_X, VPWR, VGND);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_TAP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_TAP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_TAP_FUNCTIONAL_V

/**
 * lpflow_lsbuf_lh_isowell_tap: Level-shift buffer, low-to-high,
 *                              isolated well on input buffer, vpb/vnb
 *                              taps, double-row-height cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__lpflow_lsbuf_lh_isowell_tap (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    //  Name  Output  Other arguments
    buf buf0 (X     , A              );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_LSBUF_LH_ISOWELL_TAP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__MACRO_SPARECELL_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__MACRO_SPARECELL_FUNCTIONAL_PP_V

/**
 * macro_sparecell: Macro cell for metal-mask-only revisioning,
 *                  containing inverter, 2-input NOR, 2-input NAND,
 *                  and constant cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../conb/sky130_fd_sc_hd__conb.v"
`include "../nor2/sky130_fd_sc_hd__nor2.v"
`include "../inv/sky130_fd_sc_hd__inv.v"
`include "../nand2/sky130_fd_sc_hd__nand2.v"

`celldefine
module sky130_fd_sc_hd__macro_sparecell (
    LO  ,
    VGND,
    VNB ,
    VPB ,
    VPWR
);

    // Module ports
    output LO  ;
    input  VGND;
    input  VNB ;
    input  VPB ;
    input  VPWR;

    // Local signals
    wire nor2left ;
    wire invleft  ;
    wire nor2right;
    wire invright ;
    wire nd2left  ;
    wire nd2right ;
    wire tielo    ;
    wire net7     ;

    //                       Name    Output         Other arguments
    sky130_fd_sc_hd__inv_2   inv0   (.A(nor2left) , .Y(invleft), .VPWR(VPWR), .VGND(VGND), .VNB(VNB), .VPB(VPB)                );
    sky130_fd_sc_hd__inv_2   inv1   (.A(nor2right), .Y(invright), .VPWR(VPWR), .VGND(VGND), .VNB(VNB), .VPB(VPB)               );
    sky130_fd_sc_hd__nor2_2  nor20  (.B(nd2left)  , .A(nd2left), .Y(nor2left), .VPWR(VPWR), .VGND(VGND), .VNB(VNB), .VPB(VPB)  );
    sky130_fd_sc_hd__nor2_2  nor21  (.B(nd2right) , .A(nd2right), .Y(nor2right), .VPWR(VPWR), .VGND(VGND), .VNB(VNB), .VPB(VPB));
    sky130_fd_sc_hd__nand2_2 nand20 (.B(tielo)    , .A(tielo), .Y(nd2right), .VPWR(VPWR), .VGND(VGND), .VNB(VNB), .VPB(VPB)    );
    sky130_fd_sc_hd__nand2_2 nand21 (.B(tielo)    , .A(tielo), .Y(nd2left), .VPWR(VPWR), .VGND(VGND), .VNB(VNB), .VPB(VPB)     );
    sky130_fd_sc_hd__conb_1  conb0  (.LO(tielo)   , .HI(net7), .VPWR(VPWR), .VGND(VGND), .VNB(VNB), .VPB(VPB)                  );
    buf                      buf0   (LO           , tielo                                                                      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__MACRO_SPARECELL_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__MACRO_SPARECELL_FUNCTIONAL_V
`define SKY130_FD_SC_HD__MACRO_SPARECELL_FUNCTIONAL_V

/**
 * macro_sparecell: Macro cell for metal-mask-only revisioning,
 *                  containing inverter, 2-input NOR, 2-input NAND,
 *                  and constant cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../conb/sky130_fd_sc_hd__conb.v"
`include "../nor2/sky130_fd_sc_hd__nor2.v"
`include "../inv/sky130_fd_sc_hd__inv.v"
`include "../nand2/sky130_fd_sc_hd__nand2.v"

`celldefine
module sky130_fd_sc_hd__macro_sparecell (
    LO
);

    // Module ports
    output LO;

    // Local signals
    wire nor2left ;
    wire invleft  ;
    wire nor2right;
    wire invright ;
    wire nd2left  ;
    wire nd2right ;
    wire tielo    ;
    wire net7     ;

    //                       Name    Output         Other arguments
    sky130_fd_sc_hd__inv_2   inv0   (.A(nor2left) , .Y(invleft)                );
    sky130_fd_sc_hd__inv_2   inv1   (.A(nor2right), .Y(invright)               );
    sky130_fd_sc_hd__nor2_2  nor20  (.B(nd2left)  , .A(nd2left), .Y(nor2left)  );
    sky130_fd_sc_hd__nor2_2  nor21  (.B(nd2right) , .A(nd2right), .Y(nor2right));
    sky130_fd_sc_hd__nand2_2 nand20 (.B(tielo)    , .A(tielo), .Y(nd2right)    );
    sky130_fd_sc_hd__nand2_2 nand21 (.B(tielo)    , .A(tielo), .Y(nd2left)     );
    sky130_fd_sc_hd__conb_1  conb0  (.LO(tielo)   , .HI(net7)                  );
    buf                      buf0   (LO           , tielo                      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__MACRO_SPARECELL_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__MAJ3_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__MAJ3_FUNCTIONAL_PP_V

/**
 * maj3: 3-input majority vote.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__maj3 (
    X   ,
    A   ,
    B   ,
    C   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire and0_out         ;
    wire and1_out         ;
    wire or1_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , B, A                 );
    and                                and0        (and0_out         , or0_out, C           );
    and                                and1        (and1_out         , A, B                 );
    or                                 or1         (or1_out_X        , and1_out, and0_out   );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or1_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__MAJ3_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__MAJ3_FUNCTIONAL_V
`define SKY130_FD_SC_HD__MAJ3_FUNCTIONAL_V

/**
 * maj3: 3-input majority vote.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__maj3 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire or0_out  ;
    wire and0_out ;
    wire and1_out ;
    wire or1_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out  , B, A              );
    and and0 (and0_out , or0_out, C        );
    and and1 (and1_out , A, B              );
    or  or1  (or1_out_X, and1_out, and0_out);
    buf buf0 (X        , or1_out_X         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__MAJ3_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__MUX2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__MUX2_FUNCTIONAL_PP_V

/**
 * mux2: 2-input multiplexer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__mux2 (
    X   ,
    A0  ,
    A1  ,
    S   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A0  ;
    input  A1  ;
    input  S   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire mux_2to10_out_X  ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    sky130_fd_sc_hd__udp_mux_2to1      mux_2to10   (mux_2to10_out_X  , A0, A1, S                  );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, mux_2to10_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__MUX2_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__MUX2_FUNCTIONAL_V
`define SKY130_FD_SC_HD__MUX2_FUNCTIONAL_V

/**
 * mux2: 2-input multiplexer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"

`celldefine
module sky130_fd_sc_hd__mux2 (
    X ,
    A0,
    A1,
    S
);

    // Module ports
    output X ;
    input  A0;
    input  A1;
    input  S ;

    // Local signals
    wire mux_2to10_out_X;

    //                            Name       Output           Other arguments
    sky130_fd_sc_hd__udp_mux_2to1 mux_2to10 (mux_2to10_out_X, A0, A1, S      );
    buf                           buf0      (X              , mux_2to10_out_X);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__MUX2_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__MUX2I_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__MUX2I_FUNCTIONAL_PP_V

/**
 * mux2i: 2-input multiplexer, output inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"
`include "../../models/udp_mux_2to1_n/sky130_fd_sc_hd__udp_mux_2to1_n.v"

`celldefine
module sky130_fd_sc_hd__mux2i (
    Y   ,
    A0  ,
    A1  ,
    S   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A0  ;
    input  A1  ;
    input  S   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire mux_2to1_n0_out_Y;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    sky130_fd_sc_hd__udp_mux_2to1_N    mux_2to1_n0 (mux_2to1_n0_out_Y, A0, A1, S                    );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, mux_2to1_n0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y            );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__MUX2I_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__MUX2I_FUNCTIONAL_V
`define SKY130_FD_SC_HD__MUX2I_FUNCTIONAL_V

/**
 * mux2i: 2-input multiplexer, output inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1_n/sky130_fd_sc_hd__udp_mux_2to1_n.v"

`celldefine
module sky130_fd_sc_hd__mux2i (
    Y ,
    A0,
    A1,
    S
);

    // Module ports
    output Y ;
    input  A0;
    input  A1;
    input  S ;

    // Local signals
    wire mux_2to1_n0_out_Y;

    //                              Name         Output             Other arguments
    sky130_fd_sc_hd__udp_mux_2to1_N mux_2to1_n0 (mux_2to1_n0_out_Y, A0, A1, S        );
    buf                             buf0        (Y                , mux_2to1_n0_out_Y);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__MUX2I_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__MUX4_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__MUX4_FUNCTIONAL_PP_V

/**
 * mux4: 4-input multiplexer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"
`include "../../models/udp_mux_4to2/sky130_fd_sc_hd__udp_mux_4to2.v"

`celldefine
module sky130_fd_sc_hd__mux4 (
    X   ,
    A0  ,
    A1  ,
    A2  ,
    A3  ,
    S0  ,
    S1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A0  ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  S0  ;
    input  S1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire mux_4to20_out_X  ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    sky130_fd_sc_hd__udp_mux_4to2      mux_4to20   (mux_4to20_out_X  , A0, A1, A2, A3, S0, S1     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, mux_4to20_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__MUX4_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__MUX4_FUNCTIONAL_V
`define SKY130_FD_SC_HD__MUX4_FUNCTIONAL_V

/**
 * mux4: 4-input multiplexer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_4to2/sky130_fd_sc_hd__udp_mux_4to2.v"

`celldefine
module sky130_fd_sc_hd__mux4 (
    X ,
    A0,
    A1,
    A2,
    A3,
    S0,
    S1
);

    // Module ports
    output X ;
    input  A0;
    input  A1;
    input  A2;
    input  A3;
    input  S0;
    input  S1;

    // Local signals
    wire mux_4to20_out_X;

    //                            Name       Output           Other arguments
    sky130_fd_sc_hd__udp_mux_4to2 mux_4to20 (mux_4to20_out_X, A0, A1, A2, A3, S0, S1);
    buf                           buf0      (X              , mux_4to20_out_X       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__MUX4_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NAND2_FUNCTIONAL_PP_V

/**
 * nand2: 2-input NAND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nand2 (
    Y   ,
    A   ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out_Y      , B, A                   );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND2_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND2_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NAND2_FUNCTIONAL_V

/**
 * nand2: 2-input NAND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nand2 (
    Y,
    A,
    B
);

    // Module ports
    output Y;
    input  A;
    input  B;

    // Local signals
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out_Y, B, A           );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND2_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND2B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NAND2B_FUNCTIONAL_PP_V

/**
 * nand2b: 2-input NAND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nand2b (
    Y   ,
    A_N ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A_N ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire or0_out_Y        ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , B                    );
    or                                 or0         (or0_out_Y        , not0_out, A_N        );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, or0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND2B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND2B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NAND2B_FUNCTIONAL_V

/**
 * nand2b: 2-input NAND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nand2b (
    Y  ,
    A_N,
    B
);

    // Module ports
    output Y  ;
    input  A_N;
    input  B  ;

    // Local signals
    wire not0_out ;
    wire or0_out_Y;

    //  Name  Output     Other arguments
    not not0 (not0_out , B              );
    or  or0  (or0_out_Y, not0_out, A_N  );
    buf buf0 (Y        , or0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND2B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND3_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NAND3_FUNCTIONAL_PP_V

/**
 * nand3: 3-input NAND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nand3 (
    Y   ,
    A   ,
    B   ,
    C   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out_Y      , B, A, C                );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND3_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND3_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NAND3_FUNCTIONAL_V

/**
 * nand3: 3-input NAND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nand3 (
    Y,
    A,
    B,
    C
);

    // Module ports
    output Y;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out_Y, B, A, C        );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND3_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND3B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NAND3B_FUNCTIONAL_PP_V

/**
 * nand3b: 3-input NAND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nand3b (
    Y   ,
    A_N ,
    B   ,
    C   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A_N ;
    input  B   ;
    input  C   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , A_N                    );
    nand                               nand0       (nand0_out_Y      , B, not0_out, C         );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND3B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND3B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NAND3B_FUNCTIONAL_V

/**
 * nand3b: 3-input NAND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nand3b (
    Y  ,
    A_N,
    B  ,
    C
);

    // Module ports
    output Y  ;
    input  A_N;
    input  B  ;
    input  C  ;

    // Local signals
    wire not0_out   ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    not  not0  (not0_out   , A_N            );
    nand nand0 (nand0_out_Y, B, not0_out, C );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND3B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND4_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NAND4_FUNCTIONAL_PP_V

/**
 * nand4: 4-input NAND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nand4 (
    Y   ,
    A   ,
    B   ,
    C   ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out_Y      , D, C, B, A             );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND4_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND4_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NAND4_FUNCTIONAL_V

/**
 * nand4: 4-input NAND.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nand4 (
    Y,
    A,
    B,
    C,
    D
);

    // Module ports
    output Y;
    input  A;
    input  B;
    input  C;
    input  D;

    // Local signals
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out_Y, D, C, B, A     );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND4_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND4B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NAND4B_FUNCTIONAL_PP_V

/**
 * nand4b: 4-input NAND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nand4b (
    Y   ,
    A_N ,
    B   ,
    C   ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A_N ;
    input  B   ;
    input  C   ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , A_N                    );
    nand                               nand0       (nand0_out_Y      , D, C, B, not0_out      );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND4B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND4B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NAND4B_FUNCTIONAL_V

/**
 * nand4b: 4-input NAND, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nand4b (
    Y  ,
    A_N,
    B  ,
    C  ,
    D
);

    // Module ports
    output Y  ;
    input  A_N;
    input  B  ;
    input  C  ;
    input  D  ;

    // Local signals
    wire not0_out   ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    not  not0  (not0_out   , A_N              );
    nand nand0 (nand0_out_Y, D, C, B, not0_out);
    buf  buf0  (Y          , nand0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND4B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND4BB_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NAND4BB_FUNCTIONAL_PP_V

/**
 * nand4bb: 4-input NAND, first two inputs inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nand4bb (
    Y   ,
    A_N ,
    B_N ,
    C   ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A_N ;
    input  B_N ;
    input  C   ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out        ;
    wire or0_out_Y        ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out        , D, C                 );
    or                                 or0         (or0_out_Y        , B_N, A_N, nand0_out  );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, or0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND4BB_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NAND4BB_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NAND4BB_FUNCTIONAL_V

/**
 * nand4bb: 4-input NAND, first two inputs inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nand4bb (
    Y  ,
    A_N,
    B_N,
    C  ,
    D
);

    // Module ports
    output Y  ;
    input  A_N;
    input  B_N;
    input  C  ;
    input  D  ;

    // Local signals
    wire nand0_out;
    wire or0_out_Y;

    //   Name   Output     Other arguments
    nand nand0 (nand0_out, D, C               );
    or   or0   (or0_out_Y, B_N, A_N, nand0_out);
    buf  buf0  (Y        , or0_out_Y          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NAND4BB_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NOR2_FUNCTIONAL_PP_V

/**
 * nor2: 2-input NOR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nor2 (
    Y   ,
    A   ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nor                                nor0        (nor0_out_Y       , A, B                  );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR2_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR2_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NOR2_FUNCTIONAL_V

/**
 * nor2: 2-input NOR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nor2 (
    Y,
    A,
    B
);

    // Module ports
    output Y;
    input  A;
    input  B;

    // Local signals
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out_Y, A, B           );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR2_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR2B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NOR2B_FUNCTIONAL_PP_V

/**
 * nor2b: 2-input NOR, first input inverted.
 *
 *        Y = !(A | B | C | !D)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nor2b (
    Y   ,
    A   ,
    B_N ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B_N ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire and0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , A                     );
    and                                and0        (and0_out_Y       , not0_out, B_N         );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, and0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR2B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR2B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NOR2B_FUNCTIONAL_V

/**
 * nor2b: 2-input NOR, first input inverted.
 *
 *        Y = !(A | B | C | !D)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nor2b (
    Y  ,
    A  ,
    B_N
);

    // Module ports
    output Y  ;
    input  A  ;
    input  B_N;

    // Local signals
    wire not0_out  ;
    wire and0_out_Y;

    //  Name  Output      Other arguments
    not not0 (not0_out  , A              );
    and and0 (and0_out_Y, not0_out, B_N  );
    buf buf0 (Y         , and0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR2B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR3_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NOR3_FUNCTIONAL_PP_V

/**
 * nor3: 3-input NOR.
 *
 *       Y = !(A | B | C | !D)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nor3 (
    Y   ,
    A   ,
    B   ,
    C   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nor                                nor0        (nor0_out_Y       , C, A, B               );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR3_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR3_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NOR3_FUNCTIONAL_V

/**
 * nor3: 3-input NOR.
 *
 *       Y = !(A | B | C | !D)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nor3 (
    Y,
    A,
    B,
    C
);

    // Module ports
    output Y;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out_Y, C, A, B        );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR3_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR3B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NOR3B_FUNCTIONAL_PP_V

/**
 * nor3b: 3-input NOR, first input inverted.
 *
 *        Y = (!(A | B)) & !C)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nor3b (
    Y   ,
    A   ,
    B   ,
    C_N ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  C_N ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nor0_out         ;
    wire and0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nor                                nor0        (nor0_out         , A, B                  );
    and                                and0        (and0_out_Y       , C_N, nor0_out         );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, and0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR3B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR3B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NOR3B_FUNCTIONAL_V

/**
 * nor3b: 3-input NOR, first input inverted.
 *
 *        Y = (!(A | B)) & !C)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nor3b (
    Y  ,
    A  ,
    B  ,
    C_N
);

    // Module ports
    output Y  ;
    input  A  ;
    input  B  ;
    input  C_N;

    // Local signals
    wire nor0_out  ;
    wire and0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out  , A, B           );
    and and0 (and0_out_Y, C_N, nor0_out  );
    buf buf0 (Y         , and0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR3B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR4_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NOR4_FUNCTIONAL_PP_V

/**
 * nor4: 4-input NOR.
 *
 *       Y = !(A | B | C | D)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nor4 (
    Y   ,
    A   ,
    B   ,
    C   ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nor                                nor0        (nor0_out_Y       , A, B, C, D            );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR4_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR4_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NOR4_FUNCTIONAL_V

/**
 * nor4: 4-input NOR.
 *
 *       Y = !(A | B | C | D)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nor4 (
    Y,
    A,
    B,
    C,
    D
);

    // Module ports
    output Y;
    input  A;
    input  B;
    input  C;
    input  D;

    // Local signals
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out_Y, A, B, C, D     );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR4_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR4B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NOR4B_FUNCTIONAL_PP_V

/**
 * nor4b: 4-input NOR, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nor4b (
    Y   ,
    A   ,
    B   ,
    C   ,
    D_N ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  D_N ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire nor0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , D_N                   );
    nor                                nor0        (nor0_out_Y       , A, B, C, not0_out     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR4B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR4B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NOR4B_FUNCTIONAL_V

/**
 * nor4b: 4-input NOR, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nor4b (
    Y  ,
    A  ,
    B  ,
    C  ,
    D_N
);

    // Module ports
    output Y  ;
    input  A  ;
    input  B  ;
    input  C  ;
    input  D_N;

    // Local signals
    wire not0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    not not0 (not0_out  , D_N              );
    nor nor0 (nor0_out_Y, A, B, C, not0_out);
    buf buf0 (Y         , nor0_out_Y       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR4B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR4BB_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__NOR4BB_FUNCTIONAL_PP_V

/**
 * nor4bb: 4-input NOR, first two inputs inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__nor4bb (
    Y   ,
    A   ,
    B   ,
    C_N ,
    D_N ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  C_N ;
    input  D_N ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nor0_out         ;
    wire and0_out_Y       ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nor                                nor0        (nor0_out         , A, B                  );
    and                                and0        (and0_out_Y       , nor0_out, C_N, D_N    );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, and0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR4BB_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__NOR4BB_FUNCTIONAL_V
`define SKY130_FD_SC_HD__NOR4BB_FUNCTIONAL_V

/**
 * nor4bb: 4-input NOR, first two inputs inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__nor4bb (
    Y  ,
    A  ,
    B  ,
    C_N,
    D_N
);

    // Module ports
    output Y  ;
    input  A  ;
    input  B  ;
    input  C_N;
    input  D_N;

    // Local signals
    wire nor0_out  ;
    wire and0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out  , A, B              );
    and and0 (and0_out_Y, nor0_out, C_N, D_N);
    buf buf0 (Y         , and0_out_Y        );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__NOR4BB_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O2111A_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O2111A_FUNCTIONAL_PP_V

/**
 * o2111a: 2-input OR into first input of 4-input AND.
 *
 *         X = ((A1 | A2) & B1 & C1 & D1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o2111a (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    D1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  D1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1                );
    and                                and0        (and0_out_X       , B1, C1, or0_out, D1   );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O2111A_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O2111A_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O2111A_FUNCTIONAL_V

/**
 * o2111a: 2-input OR into first input of 4-input AND.
 *
 *         X = ((A1 | A2) & B1 & C1 & D1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o2111a (
    X ,
    A1,
    A2,
    B1,
    C1,
    D1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;
    input  D1;

    // Local signals
    wire or0_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1             );
    and and0 (and0_out_X, B1, C1, or0_out, D1);
    buf buf0 (X         , and0_out_X         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O2111A_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O2111AI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O2111AI_FUNCTIONAL_PP_V

/**
 * o2111ai: 2-input OR into first input of 4-input NAND.
 *
 *          Y = !((A1 | A2) & B1 & C1 & D1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o2111ai (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    D1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  D1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1                 );
    nand                               nand0       (nand0_out_Y      , C1, B1, D1, or0_out    );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O2111AI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O2111AI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O2111AI_FUNCTIONAL_V

/**
 * o2111ai: 2-input OR into first input of 4-input NAND.
 *
 *          Y = !((A1 | A2) & B1 & C1 & D1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o2111ai (
    Y ,
    A1,
    A2,
    B1,
    C1,
    D1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;
    input  D1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1             );
    nand nand0 (nand0_out_Y, C1, B1, D1, or0_out);
    buf  buf0  (Y          , nand0_out_Y        );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O2111AI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O211A_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O211A_FUNCTIONAL_PP_V

/**
 * o211a: 2-input OR into first input of 3-input AND.
 *
 *        X = ((A1 | A2) & B1 & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o211a (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1                );
    and                                and0        (and0_out_X       , or0_out, B1, C1       );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O211A_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O211A_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O211A_FUNCTIONAL_V

/**
 * o211a: 2-input OR into first input of 3-input AND.
 *
 *        X = ((A1 | A2) & B1 & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o211a (
    X ,
    A1,
    A2,
    B1,
    C1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Local signals
    wire or0_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1         );
    and and0 (and0_out_X, or0_out, B1, C1);
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O211A_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O211AI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O211AI_FUNCTIONAL_PP_V

/**
 * o211ai: 2-input OR into first input of 3-input NAND.
 *
 *         Y = !((A1 | A2) & B1 & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o211ai (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1                 );
    nand                               nand0       (nand0_out_Y      , C1, or0_out, B1        );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O211AI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O211AI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O211AI_FUNCTIONAL_V

/**
 * o211ai: 2-input OR into first input of 3-input NAND.
 *
 *         Y = !((A1 | A2) & B1 & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o211ai (
    Y ,
    A1,
    A2,
    B1,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1         );
    nand nand0 (nand0_out_Y, C1, or0_out, B1);
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O211AI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O21A_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O21A_FUNCTIONAL_PP_V

/**
 * o21a: 2-input OR into first input of 2-input AND.
 *
 *       X = ((A1 | A2) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o21a (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1                );
    and                                and0        (and0_out_X       , or0_out, B1           );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O21A_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O21A_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O21A_FUNCTIONAL_V

/**
 * o21a: 2-input OR into first input of 2-input AND.
 *
 *       X = ((A1 | A2) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o21a (
    X ,
    A1,
    A2,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;

    // Local signals
    wire or0_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1         );
    and and0 (and0_out_X, or0_out, B1    );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O21A_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O21AI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O21AI_FUNCTIONAL_PP_V

/**
 * o21ai: 2-input OR into first input of 2-input NAND.
 *
 *        Y = !((A1 | A2) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o21ai (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1                 );
    nand                               nand0       (nand0_out_Y      , B1, or0_out            );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O21AI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O21AI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O21AI_FUNCTIONAL_V

/**
 * o21ai: 2-input OR into first input of 2-input NAND.
 *
 *        Y = !((A1 | A2) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o21ai (
    Y ,
    A1,
    A2,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1         );
    nand nand0 (nand0_out_Y, B1, or0_out    );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O21AI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O21BA_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O21BA_FUNCTIONAL_PP_V

/**
 * o21ba: 2-input OR into first input of 2-input AND,
 *        2nd input inverted.
 *
 *        X = ((A1 | A2) & !B1_N)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o21ba (
    X   ,
    A1  ,
    A2  ,
    B1_N,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nor0_out         ;
    wire nor1_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    nor                                nor0        (nor0_out         , A1, A2                );
    nor                                nor1        (nor1_out_X       , B1_N, nor0_out        );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, nor1_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O21BA_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O21BA_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O21BA_FUNCTIONAL_V

/**
 * o21ba: 2-input OR into first input of 2-input AND,
 *        2nd input inverted.
 *
 *        X = ((A1 | A2) & !B1_N)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o21ba (
    X   ,
    A1  ,
    A2  ,
    B1_N
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;

    // Local signals
    wire nor0_out  ;
    wire nor1_out_X;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out  , A1, A2         );
    nor nor1 (nor1_out_X, B1_N, nor0_out );
    buf buf0 (X         , nor1_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O21BA_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O21BAI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O21BAI_FUNCTIONAL_PP_V

/**
 * o21bai: 2-input OR into first input of 2-input NAND, 2nd iput
 *         inverted.
 *
 *         Y = !((A1 | A2) & !B1_N)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o21bai (
    Y   ,
    A1  ,
    A2  ,
    B1_N,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire b                ;
    wire or0_out          ;
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    not                                not0        (b                , B1_N                   );
    or                                 or0         (or0_out          , A2, A1                 );
    nand                               nand0       (nand0_out_Y      , b, or0_out             );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O21BAI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O21BAI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O21BAI_FUNCTIONAL_V

/**
 * o21bai: 2-input OR into first input of 2-input NAND, 2nd iput
 *         inverted.
 *
 *         Y = !((A1 | A2) & !B1_N)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o21bai (
    Y   ,
    A1  ,
    A2  ,
    B1_N
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;

    // Local signals
    wire b          ;
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    not  not0  (b          , B1_N           );
    or   or0   (or0_out    , A2, A1         );
    nand nand0 (nand0_out_Y, b, or0_out     );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O21BAI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O221A_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O221A_FUNCTIONAL_PP_V

/**
 * o221a: 2-input OR into first two inputs of 3-input AND.
 *
 *        X = ((A1 | A2) & (B1 | B2) & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o221a (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire or1_out          ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , B2, B1                );
    or                                 or1         (or1_out          , A2, A1                );
    and                                and0        (and0_out_X       , or0_out, or1_out, C1  );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O221A_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O221A_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O221A_FUNCTIONAL_V

/**
 * o221a: 2-input OR into first two inputs of 3-input AND.
 *
 *        X = ((A1 | A2) & (B1 | B2) & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o221a (
    X ,
    A1,
    A2,
    B1,
    B2,
    C1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;

    // Local signals
    wire or0_out   ;
    wire or1_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , B2, B1              );
    or  or1  (or1_out   , A2, A1              );
    and and0 (and0_out_X, or0_out, or1_out, C1);
    buf buf0 (X         , and0_out_X          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O221A_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O221AI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O221AI_FUNCTIONAL_PP_V

/**
 * o221ai: 2-input OR into first two inputs of 3-input NAND.
 *
 *         Y = !((A1 | A2) & (B1 | B2) & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o221ai (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire or1_out          ;
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , B2, B1                 );
    or                                 or1         (or1_out          , A2, A1                 );
    nand                               nand0       (nand0_out_Y      , or1_out, or0_out, C1   );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O221AI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O221AI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O221AI_FUNCTIONAL_V

/**
 * o221ai: 2-input OR into first two inputs of 3-input NAND.
 *
 *         Y = !((A1 | A2) & (B1 | B2) & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o221ai (
    Y ,
    A1,
    A2,
    B1,
    B2,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;

    // Local signals
    wire or0_out    ;
    wire or1_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , B2, B1              );
    or   or1   (or1_out    , A2, A1              );
    nand nand0 (nand0_out_Y, or1_out, or0_out, C1);
    buf  buf0  (Y          , nand0_out_Y         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O221AI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O22A_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O22A_FUNCTIONAL_PP_V

/**
 * o22a: 2-input OR into both inputs of 2-input AND.
 *
 *       X = ((A1 | A2) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o22a (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire or1_out          ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1                );
    or                                 or1         (or1_out          , B2, B1                );
    and                                and0        (and0_out_X       , or0_out, or1_out      );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O22A_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O22A_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O22A_FUNCTIONAL_V

/**
 * o22a: 2-input OR into both inputs of 2-input AND.
 *
 *       X = ((A1 | A2) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o22a (
    X ,
    A1,
    A2,
    B1,
    B2
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;

    // Local signals
    wire or0_out   ;
    wire or1_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1          );
    or  or1  (or1_out   , B2, B1          );
    and and0 (and0_out_X, or0_out, or1_out);
    buf buf0 (X         , and0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O22A_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O22AI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O22AI_FUNCTIONAL_PP_V

/**
 * o22ai: 2-input OR into both inputs of 2-input NAND.
 *
 *        Y = !((A1 | A2) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o22ai (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nor0_out         ;
    wire nor1_out         ;
    wire or0_out_Y        ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nor                                nor0        (nor0_out         , B1, B2               );
    nor                                nor1        (nor1_out         , A1, A2               );
    or                                 or0         (or0_out_Y        , nor1_out, nor0_out   );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, or0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O22AI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O22AI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O22AI_FUNCTIONAL_V

/**
 * o22ai: 2-input OR into both inputs of 2-input NAND.
 *
 *        Y = !((A1 | A2) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o22ai (
    Y ,
    A1,
    A2,
    B1,
    B2
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;

    // Local signals
    wire nor0_out ;
    wire nor1_out ;
    wire or0_out_Y;

    //  Name  Output     Other arguments
    nor nor0 (nor0_out , B1, B2            );
    nor nor1 (nor1_out , A1, A2            );
    or  or0  (or0_out_Y, nor1_out, nor0_out);
    buf buf0 (Y        , or0_out_Y         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O22AI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O2BB2A_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O2BB2A_FUNCTIONAL_PP_V

/**
 * o2bb2a: 2-input NAND and 2-input OR into 2-input AND.
 *
 *         X = (!(A1 & A2) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o2bb2a (
    X   ,
    A1_N,
    A2_N,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out        ;
    wire or0_out          ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out        , A2_N, A1_N            );
    or                                 or0         (or0_out          , B2, B1                );
    and                                and0        (and0_out_X       , nand0_out, or0_out    );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O2BB2A_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O2BB2A_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O2BB2A_FUNCTIONAL_V

/**
 * o2bb2a: 2-input NAND and 2-input OR into 2-input AND.
 *
 *         X = (!(A1 & A2) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o2bb2a (
    X   ,
    A1_N,
    A2_N,
    B1  ,
    B2
);

    // Module ports
    output X   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;

    // Local signals
    wire nand0_out ;
    wire or0_out   ;
    wire and0_out_X;

    //   Name   Output      Other arguments
    nand nand0 (nand0_out , A2_N, A1_N        );
    or   or0   (or0_out   , B2, B1            );
    and  and0  (and0_out_X, nand0_out, or0_out);
    buf  buf0  (X         , and0_out_X        );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O2BB2A_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O2BB2AI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O2BB2AI_FUNCTIONAL_PP_V

/**
 * o2bb2ai: 2-input NAND and 2-input OR into 2-input NAND.
 *
 *          Y = !(!(A1 & A2) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o2bb2ai (
    Y   ,
    A1_N,
    A2_N,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out        ;
    wire or0_out          ;
    wire nand1_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out        , A2_N, A1_N             );
    or                                 or0         (or0_out          , B2, B1                 );
    nand                               nand1       (nand1_out_Y      , nand0_out, or0_out     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand1_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O2BB2AI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O2BB2AI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O2BB2AI_FUNCTIONAL_V

/**
 * o2bb2ai: 2-input NAND and 2-input OR into 2-input NAND.
 *
 *          Y = !(!(A1 & A2) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o2bb2ai (
    Y   ,
    A1_N,
    A2_N,
    B1  ,
    B2
);

    // Module ports
    output Y   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;

    // Local signals
    wire nand0_out  ;
    wire or0_out    ;
    wire nand1_out_Y;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out  , A2_N, A1_N        );
    or   or0   (or0_out    , B2, B1            );
    nand nand1 (nand1_out_Y, nand0_out, or0_out);
    buf  buf0  (Y          , nand1_out_Y       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O2BB2AI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O311A_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O311A_FUNCTIONAL_PP_V

/**
 * o311a: 3-input OR into 3-input AND.
 *
 *        X = ((A1 | A2 | A3) & B1 & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o311a (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1, A3            );
    and                                and0        (and0_out_X       , or0_out, B1, C1       );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O311A_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O311A_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O311A_FUNCTIONAL_V

/**
 * o311a: 3-input OR into 3-input AND.
 *
 *        X = ((A1 | A2 | A3) & B1 & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o311a (
    X ,
    A1,
    A2,
    A3,
    B1,
    C1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  C1;

    // Local signals
    wire or0_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1, A3     );
    and and0 (and0_out_X, or0_out, B1, C1);
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O311A_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O311AI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O311AI_FUNCTIONAL_PP_V

/**
 * o311ai: 3-input OR into 3-input NAND.
 *
 *         Y = !((A1 | A2 | A3) & B1 & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o311ai (
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    C1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1, A3             );
    nand                               nand0       (nand0_out_Y      , C1, or0_out, B1        );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O311AI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O311AI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O311AI_FUNCTIONAL_V

/**
 * o311ai: 3-input OR into 3-input NAND.
 *
 *         Y = !((A1 | A2 | A3) & B1 & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o311ai (
    Y ,
    A1,
    A2,
    A3,
    B1,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  C1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1, A3     );
    nand nand0 (nand0_out_Y, C1, or0_out, B1);
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O311AI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O31A_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O31A_FUNCTIONAL_PP_V

/**
 * o31a: 3-input OR into 2-input AND.
 *
 *       X = ((A1 | A2 | A3) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o31a (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1, A3            );
    and                                and0        (and0_out_X       , or0_out, B1           );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O31A_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O31A_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O31A_FUNCTIONAL_V

/**
 * o31a: 3-input OR into 2-input AND.
 *
 *       X = ((A1 | A2 | A3) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o31a (
    X ,
    A1,
    A2,
    A3,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Local signals
    wire or0_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1, A3     );
    and and0 (and0_out_X, or0_out, B1    );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O31A_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O31AI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O31AI_FUNCTIONAL_PP_V

/**
 * o31ai: 3-input OR into 2-input NAND.
 *
 *        Y = !((A1 | A2 | A3) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o31ai (
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1, A3             );
    nand                               nand0       (nand0_out_Y      , B1, or0_out            );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O31AI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O31AI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O31AI_FUNCTIONAL_V

/**
 * o31ai: 3-input OR into 2-input NAND.
 *
 *        Y = !((A1 | A2 | A3) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o31ai (
    Y ,
    A1,
    A2,
    A3,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1, A3     );
    nand nand0 (nand0_out_Y, B1, or0_out    );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O31AI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O32A_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O32A_FUNCTIONAL_PP_V

/**
 * o32a: 3-input OR and 2-input OR into 2-input AND.
 *
 *       X = ((A1 | A2 | A3) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o32a (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire or1_out          ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A2, A1, A3            );
    or                                 or1         (or1_out          , B2, B1                );
    and                                and0        (and0_out_X       , or0_out, or1_out      );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O32A_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O32A_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O32A_FUNCTIONAL_V

/**
 * o32a: 3-input OR and 2-input OR into 2-input AND.
 *
 *       X = ((A1 | A2 | A3) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o32a (
    X ,
    A1,
    A2,
    A3,
    B1,
    B2
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  B2;

    // Local signals
    wire or0_out   ;
    wire or1_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1, A3      );
    or  or1  (or1_out   , B2, B1          );
    and and0 (and0_out_X, or0_out, or1_out);
    buf buf0 (X         , and0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O32A_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O32AI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O32AI_FUNCTIONAL_PP_V

/**
 * o32ai: 3-input OR and 2-input OR into 2-input NAND.
 *
 *        Y = !((A1 | A2 | A3) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o32ai (
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    B2  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nor0_out         ;
    wire nor1_out         ;
    wire or0_out_Y        ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    nor                                nor0        (nor0_out         , A3, A1, A2           );
    nor                                nor1        (nor1_out         , B1, B2               );
    or                                 or0         (or0_out_Y        , nor1_out, nor0_out   );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, or0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O32AI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O32AI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O32AI_FUNCTIONAL_V

/**
 * o32ai: 3-input OR and 2-input OR into 2-input NAND.
 *
 *        Y = !((A1 | A2 | A3) & (B1 | B2))
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o32ai (
    Y ,
    A1,
    A2,
    A3,
    B1,
    B2
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  B2;

    // Local signals
    wire nor0_out ;
    wire nor1_out ;
    wire or0_out_Y;

    //  Name  Output     Other arguments
    nor nor0 (nor0_out , A3, A1, A2        );
    nor nor1 (nor1_out , B1, B2            );
    or  or0  (or0_out_Y, nor1_out, nor0_out);
    buf buf0 (Y        , or0_out_Y         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O32AI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O41A_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O41A_FUNCTIONAL_PP_V

/**
 * o41a: 4-input OR into 2-input AND.
 *
 *       X = ((A1 | A2 | A3 | A4) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o41a (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    A4  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  A4  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire and0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A4, A3, A2, A1        );
    and                                and0        (and0_out_X       , or0_out, B1           );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, and0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O41A_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O41A_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O41A_FUNCTIONAL_V

/**
 * o41a: 4-input OR into 2-input AND.
 *
 *       X = ((A1 | A2 | A3 | A4) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o41a (
    X ,
    A1,
    A2,
    A3,
    A4,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  A4;
    input  B1;

    // Local signals
    wire or0_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A4, A3, A2, A1 );
    and and0 (and0_out_X, or0_out, B1    );
    buf buf0 (X         , and0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O41A_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O41AI_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__O41AI_FUNCTIONAL_PP_V

/**
 * o41ai: 4-input OR into 2-input NAND.
 *
 *        Y = !((A1 | A2 | A3 | A4) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__o41ai (
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    A4  ,
    B1  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  A4  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out          ;
    wire nand0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out          , A4, A3, A2, A1         );
    nand                               nand0       (nand0_out_Y      , B1, or0_out            );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O41AI_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__O41AI_FUNCTIONAL_V
`define SKY130_FD_SC_HD__O41AI_FUNCTIONAL_V

/**
 * o41ai: 4-input OR into 2-input NAND.
 *
 *        Y = !((A1 | A2 | A3 | A4) & B1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__o41ai (
    Y ,
    A1,
    A2,
    A3,
    A4,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  A4;
    input  B1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A4, A3, A2, A1 );
    nand nand0 (nand0_out_Y, B1, or0_out    );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__O41AI_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__OR2_FUNCTIONAL_PP_V

/**
 * or2: 2-input OR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__or2 (
    X   ,
    A   ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out_X        , B, A                 );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR2_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR2_FUNCTIONAL_V
`define SKY130_FD_SC_HD__OR2_FUNCTIONAL_V

/**
 * or2: 2-input OR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__or2 (
    X,
    A,
    B
);

    // Module ports
    output X;
    input  A;
    input  B;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, B, A           );
    buf buf0 (X        , or0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR2_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR2B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__OR2B_FUNCTIONAL_PP_V

/**
 * or2b: 2-input OR, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__or2b (
    X   ,
    A   ,
    B_N ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B_N ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , B_N                  );
    or                                 or0         (or0_out_X        , not0_out, A          );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR2B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR2B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__OR2B_FUNCTIONAL_V

/**
 * or2b: 2-input OR, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__or2b (
    X  ,
    A  ,
    B_N
);

    // Module ports
    output X  ;
    input  A  ;
    input  B_N;

    // Local signals
    wire not0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    not not0 (not0_out , B_N            );
    or  or0  (or0_out_X, not0_out, A    );
    buf buf0 (X        , or0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR2B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR3_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__OR3_FUNCTIONAL_PP_V

/**
 * or3: 3-input OR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__or3 (
    X   ,
    A   ,
    B   ,
    C   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out_X        , B, A, C              );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR3_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR3_FUNCTIONAL_V
`define SKY130_FD_SC_HD__OR3_FUNCTIONAL_V

/**
 * or3: 3-input OR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__or3 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, B, A, C        );
    buf buf0 (X        , or0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR3_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR3B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__OR3B_FUNCTIONAL_PP_V

/**
 * or3b: 3-input OR, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__or3b (
    X   ,
    A   ,
    B   ,
    C_N ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C_N ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , C_N                  );
    or                                 or0         (or0_out_X        , B, A, not0_out       );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR3B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR3B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__OR3B_FUNCTIONAL_V

/**
 * or3b: 3-input OR, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__or3b (
    X  ,
    A  ,
    B  ,
    C_N
);

    // Module ports
    output X  ;
    input  A  ;
    input  B  ;
    input  C_N;

    // Local signals
    wire not0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    not not0 (not0_out , C_N            );
    or  or0  (or0_out_X, B, A, not0_out );
    buf buf0 (X        , or0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR3B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR4_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__OR4_FUNCTIONAL_PP_V

/**
 * or4: 4-input OR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__or4 (
    X   ,
    A   ,
    B   ,
    C   ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    or                                 or0         (or0_out_X        , D, C, B, A           );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR4_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR4_FUNCTIONAL_V
`define SKY130_FD_SC_HD__OR4_FUNCTIONAL_V

/**
 * or4: 4-input OR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__or4 (
    X,
    A,
    B,
    C,
    D
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    input  D;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, D, C, B, A     );
    buf buf0 (X        , or0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR4_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR4B_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__OR4B_FUNCTIONAL_PP_V

/**
 * or4b: 4-input OR, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__or4b (
    X   ,
    A   ,
    B   ,
    C   ,
    D_N ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  D_N ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire not0_out         ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    not                                not0        (not0_out         , D_N                  );
    or                                 or0         (or0_out_X        , not0_out, C, B, A    );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR4B_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR4B_FUNCTIONAL_V
`define SKY130_FD_SC_HD__OR4B_FUNCTIONAL_V

/**
 * or4b: 4-input OR, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__or4b (
    X  ,
    A  ,
    B  ,
    C  ,
    D_N
);

    // Module ports
    output X  ;
    input  A  ;
    input  B  ;
    input  C  ;
    input  D_N;

    // Local signals
    wire not0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    not not0 (not0_out , D_N              );
    or  or0  (or0_out_X, not0_out, C, B, A);
    buf buf0 (X        , or0_out_X        );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR4B_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR4BB_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__OR4BB_FUNCTIONAL_PP_V

/**
 * or4bb: 4-input OR, first two inputs inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__or4bb (
    X   ,
    A   ,
    B   ,
    C_N ,
    D_N ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C_N ;
    input  D_N ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire nand0_out        ;
    wire or0_out_X        ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    nand                               nand0       (nand0_out        , D_N, C_N             );
    or                                 or0         (or0_out_X        , B, A, nand0_out      );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, or0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR4BB_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR4BB_FUNCTIONAL_V
`define SKY130_FD_SC_HD__OR4BB_FUNCTIONAL_V

/**
 * or4bb: 4-input OR, first two inputs inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__or4bb (
    X  ,
    A  ,
    B  ,
    C_N,
    D_N
);

    // Module ports
    output X  ;
    input  A  ;
    input  B  ;
    input  C_N;
    input  D_N;

    // Local signals
    wire nand0_out;
    wire or0_out_X;

    //   Name   Output     Other arguments
    nand nand0 (nand0_out, D_N, C_N       );
    or   or0   (or0_out_X, B, A, nand0_out);
    buf  buf0  (X        , or0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR4BB_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__PROBEC_P_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__PROBEC_P_FUNCTIONAL_PP_V

/**
 * probec_p: Virtual current probe point.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__probec_p (
    X   ,
    A   ,
    VGND,
    VNB ,
    VPB ,
    VPWR
);

    // Module ports
    output X   ;
    input  A   ;
    input  VGND;
    input  VNB ;
    input  VPB ;
    input  VPWR;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__PROBEC_P_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__PROBEC_P_FUNCTIONAL_V
`define SKY130_FD_SC_HD__PROBEC_P_FUNCTIONAL_V

/**
 * probec_p: Virtual current probe point.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__probec_p (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__PROBEC_P_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__PROBE_P_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__PROBE_P_FUNCTIONAL_PP_V

/**
 * probe_p: Virtual voltage probe point.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__probe_p (
    X   ,
    A   ,
    VGND,
    VNB ,
    VPB ,
    VPWR
);

    // Module ports
    output X   ;
    input  A   ;
    input  VGND;
    input  VNB ;
    input  VPB ;
    input  VPWR;

    // Local signals
    wire buf0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    buf                                buf0        (buf0_out_X       , A                     );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, buf0_out_X, VPWR, VGND);
    buf                                buf1        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__PROBE_P_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__PROBE_P_FUNCTIONAL_V
`define SKY130_FD_SC_HD__PROBE_P_FUNCTIONAL_V

/**
 * probe_p: Virtual voltage probe point.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__probe_p (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__PROBE_P_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFBBN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SDFBBN_FUNCTIONAL_PP_V

/**
 * sdfbbn: Scan delay flop, inverted set, inverted reset, inverted
 *         clock, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_nsr_pp_pg_n/sky130_fd_sc_hd__udp_dff_nsr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sdfbbn (
    Q      ,
    Q_N    ,
    D      ,
    SCD    ,
    SCE    ,
    CLK_N  ,
    SET_B  ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  CLK_N  ;
    input  SET_B  ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET  ;
    wire SET    ;
    wire CLK    ;
    wire buf_Q  ;
    wire mux_out;

    //                                   Delay       Name       Output   Other arguments
    not                                              not0      (RESET  , RESET_B                               );
    not                                              not1      (SET    , SET_B                                 );
    not                                              not2      (CLK    , CLK_N                                 );
    sky130_fd_sc_hd__udp_mux_2to1                    mux_2to10 (mux_out, D, SCD, SCE                           );
    sky130_fd_sc_hd__udp_dff$NSR_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , SET, RESET, CLK, mux_out, , VPWR, VGND);
    buf                                              buf0      (Q      , buf_Q                                 );
    not                                              not3      (Q_N    , buf_Q                                 );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFBBN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFBBN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SDFBBN_FUNCTIONAL_V

/**
 * sdfbbn: Scan delay flop, inverted set, inverted reset, inverted
 *         clock, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_nsr/sky130_fd_sc_hd__udp_dff_nsr.v"

`celldefine
module sky130_fd_sc_hd__sdfbbn (
    Q      ,
    Q_N    ,
    D      ,
    SCD    ,
    SCE    ,
    CLK_N  ,
    SET_B  ,
    RESET_B
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  CLK_N  ;
    input  SET_B  ;
    input  RESET_B;

    // Local signals
    wire RESET  ;
    wire SET    ;
    wire CLK    ;
    wire buf_Q  ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    not                                       not0      (RESET  , RESET_B                 );
    not                                       not1      (SET    , SET_B                   );
    not                                       not2      (CLK    , CLK_N                   );
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, D, SCD, SCE             );
    sky130_fd_sc_hd__udp_dff$NSR  `UNIT_DELAY dff0      (buf_Q  , SET, RESET, CLK, mux_out);
    buf                                       buf0      (Q      , buf_Q                   );
    not                                       not3      (Q_N    , buf_Q                   );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFBBN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFBBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SDFBBP_FUNCTIONAL_PP_V

/**
 * sdfbbp: Scan delay flop, inverted set, inverted reset, non-inverted
 *         clock, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_nsr_pp_pg_n/sky130_fd_sc_hd__udp_dff_nsr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sdfbbp (
    Q      ,
    Q_N    ,
    D      ,
    SCD    ,
    SCE    ,
    CLK    ,
    SET_B  ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  CLK    ;
    input  SET_B  ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET  ;
    wire SET    ;
    wire buf_Q  ;
    wire mux_out;

    //                                   Delay       Name       Output   Other arguments
    not                                              not0      (RESET  , RESET_B                               );
    not                                              not1      (SET    , SET_B                                 );
    sky130_fd_sc_hd__udp_mux_2to1                    mux_2to10 (mux_out, D, SCD, SCE                           );
    sky130_fd_sc_hd__udp_dff$NSR_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , SET, RESET, CLK, mux_out, , VPWR, VGND);
    buf                                              buf0      (Q      , buf_Q                                 );
    not                                              not2      (Q_N    , buf_Q                                 );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFBBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFBBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SDFBBP_FUNCTIONAL_V

/**
 * sdfbbp: Scan delay flop, inverted set, inverted reset, non-inverted
 *         clock, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_nsr/sky130_fd_sc_hd__udp_dff_nsr.v"

`celldefine
module sky130_fd_sc_hd__sdfbbp (
    Q      ,
    Q_N    ,
    D      ,
    SCD    ,
    SCE    ,
    CLK    ,
    SET_B  ,
    RESET_B
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  CLK    ;
    input  SET_B  ;
    input  RESET_B;

    // Local signals
    wire RESET  ;
    wire SET    ;
    wire buf_Q  ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    not                                       not0      (RESET  , RESET_B                 );
    not                                       not1      (SET    , SET_B                   );
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, D, SCD, SCE             );
    sky130_fd_sc_hd__udp_dff$NSR  `UNIT_DELAY dff0      (buf_Q  , SET, RESET, CLK, mux_out);
    buf                                       buf0      (Q      , buf_Q                   );
    not                                       not2      (Q_N    , buf_Q                   );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFBBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFRBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SDFRBP_FUNCTIONAL_PP_V

/**
 * sdfrbp: Scan delay flop, inverted reset, non-inverted clock,
 *         complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_pr_pp_pg_n/sky130_fd_sc_hd__udp_dff_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sdfrbp (
    Q      ,
    Q_N    ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire buf_Q  ;
    wire RESET  ;
    wire mux_out;

    //                                  Delay       Name       Output   Other arguments
    not                                             not0      (RESET  , RESET_B                          );
    sky130_fd_sc_hd__udp_mux_2to1                   mux_2to10 (mux_out, D, SCD, SCE                      );
    sky130_fd_sc_hd__udp_dff$PR_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, RESET, , VPWR, VGND);
    buf                                             buf0      (Q      , buf_Q                            );
    not                                             not1      (Q_N    , buf_Q                            );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFRBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFRBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SDFRBP_FUNCTIONAL_V

/**
 * sdfrbp: Scan delay flop, inverted reset, non-inverted clock,
 *         complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_pr/sky130_fd_sc_hd__udp_dff_pr.v"

`celldefine
module sky130_fd_sc_hd__sdfrbp (
    Q      ,
    Q_N    ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;

    // Local signals
    wire buf_Q  ;
    wire RESET  ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    not                                       not0      (RESET  , RESET_B            );
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, D, SCD, SCE        );
    sky130_fd_sc_hd__udp_dff$PR   `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, RESET);
    buf                                       buf0      (Q      , buf_Q              );
    not                                       not1      (Q_N    , buf_Q              );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFRBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFRTN_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SDFRTN_FUNCTIONAL_PP_V

/**
 * sdfrtn: Scan delay flop, inverted reset, inverted clock,
 *         single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_pr_pp_pg_n/sky130_fd_sc_hd__udp_dff_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sdfrtn (
    Q      ,
    CLK_N  ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  CLK_N  ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire buf_Q  ;
    wire RESET  ;
    wire intclk ;
    wire mux_out;

    //                                  Delay       Name       Output   Other arguments
    not                                             not0      (RESET  , RESET_B                             );
    not                                             not1      (intclk , CLK_N                               );
    sky130_fd_sc_hd__udp_mux_2to1                   mux_2to10 (mux_out, D, SCD, SCE                         );
    sky130_fd_sc_hd__udp_dff$PR_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, intclk, RESET, , VPWR, VGND);
    buf                                             buf0      (Q      , buf_Q                               );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFRTN_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFRTN_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SDFRTN_FUNCTIONAL_V

/**
 * sdfrtn: Scan delay flop, inverted reset, inverted clock,
 *         single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_pr/sky130_fd_sc_hd__udp_dff_pr.v"

`celldefine
module sky130_fd_sc_hd__sdfrtn (
    Q      ,
    CLK_N  ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B
);

    // Module ports
    output Q      ;
    input  CLK_N  ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;

    // Local signals
    wire buf_Q  ;
    wire RESET  ;
    wire intclk ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    not                                       not0      (RESET  , RESET_B               );
    not                                       not1      (intclk , CLK_N                 );
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, D, SCD, SCE           );
    sky130_fd_sc_hd__udp_dff$PR   `UNIT_DELAY dff0      (buf_Q  , mux_out, intclk, RESET);
    buf                                       buf0      (Q      , buf_Q                 );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFRTN_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFRTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SDFRTP_FUNCTIONAL_PP_V

/**
 * sdfrtp: Scan delay flop, inverted reset, non-inverted clock,
 *         single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_pr_pp_pg_n/sky130_fd_sc_hd__udp_dff_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sdfrtp (
    Q      ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire buf_Q  ;
    wire RESET  ;
    wire mux_out;

    //                                  Delay       Name       Output   Other arguments
    not                                             not0      (RESET  , RESET_B                          );
    sky130_fd_sc_hd__udp_mux_2to1                   mux_2to10 (mux_out, D, SCD, SCE                      );
    sky130_fd_sc_hd__udp_dff$PR_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, RESET, , VPWR, VGND);
    buf                                             buf0      (Q      , buf_Q                            );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFRTP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFRTP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SDFRTP_FUNCTIONAL_V

/**
 * sdfrtp: Scan delay flop, inverted reset, non-inverted clock,
 *         single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_pr/sky130_fd_sc_hd__udp_dff_pr.v"

`celldefine
module sky130_fd_sc_hd__sdfrtp (
    Q      ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B
);

    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;

    // Local signals
    wire buf_Q  ;
    wire RESET  ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    not                                       not0      (RESET  , RESET_B            );
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, D, SCD, SCE        );
    sky130_fd_sc_hd__udp_dff$PR   `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, RESET);
    buf                                       buf0      (Q      , buf_Q              );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFRTP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFSBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SDFSBP_FUNCTIONAL_PP_V

/**
 * sdfsbp: Scan delay flop, inverted set, non-inverted clock,
 *         complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_ps_pp_pg_n/sky130_fd_sc_hd__udp_dff_ps_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sdfsbp (
    Q    ,
    Q_N  ,
    CLK  ,
    D    ,
    SCD  ,
    SCE  ,
    SET_B,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    output Q    ;
    output Q_N  ;
    input  CLK  ;
    input  D    ;
    input  SCD  ;
    input  SCE  ;
    input  SET_B;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire buf_Q  ;
    wire SET    ;
    wire mux_out;

    //                                  Delay       Name       Output   Other arguments
    not                                             not0      (SET    , SET_B                          );
    sky130_fd_sc_hd__udp_mux_2to1                   mux_2to10 (mux_out, D, SCD, SCE                    );
    sky130_fd_sc_hd__udp_dff$PS_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, SET, , VPWR, VGND);
    buf                                             buf0      (Q      , buf_Q                          );
    not                                             not1      (Q_N    , buf_Q                          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFSBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFSBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SDFSBP_FUNCTIONAL_V

/**
 * sdfsbp: Scan delay flop, inverted set, non-inverted clock,
 *         complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_ps/sky130_fd_sc_hd__udp_dff_ps.v"

`celldefine
module sky130_fd_sc_hd__sdfsbp (
    Q    ,
    Q_N  ,
    CLK  ,
    D    ,
    SCD  ,
    SCE  ,
    SET_B
);

    // Module ports
    output Q    ;
    output Q_N  ;
    input  CLK  ;
    input  D    ;
    input  SCD  ;
    input  SCE  ;
    input  SET_B;

    // Local signals
    wire buf_Q  ;
    wire SET    ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    not                                       not0      (SET    , SET_B            );
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, D, SCD, SCE      );
    sky130_fd_sc_hd__udp_dff$PS   `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, SET);
    buf                                       buf0      (Q      , buf_Q            );
    not                                       not1      (Q_N    , buf_Q            );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFSBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFSTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SDFSTP_FUNCTIONAL_PP_V

/**
 * sdfstp: Scan delay flop, inverted set, non-inverted clock,
 *         single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_ps_pp_pg_n/sky130_fd_sc_hd__udp_dff_ps_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sdfstp (
    Q    ,
    CLK  ,
    D    ,
    SCD  ,
    SCE  ,
    SET_B,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);

    // Module ports
    output Q    ;
    input  CLK  ;
    input  D    ;
    input  SCD  ;
    input  SCE  ;
    input  SET_B;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;

    // Local signals
    wire buf_Q  ;
    wire SET    ;
    wire mux_out;

    //                                  Delay       Name       Output   Other arguments
    not                                             not0      (SET    , SET_B                          );
    sky130_fd_sc_hd__udp_mux_2to1                   mux_2to10 (mux_out, D, SCD, SCE                    );
    sky130_fd_sc_hd__udp_dff$PS_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, SET, , VPWR, VGND);
    buf                                             buf0      (Q      , buf_Q                          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFSTP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFSTP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SDFSTP_FUNCTIONAL_V

/**
 * sdfstp: Scan delay flop, inverted set, non-inverted clock,
 *         single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_ps/sky130_fd_sc_hd__udp_dff_ps.v"

`celldefine
module sky130_fd_sc_hd__sdfstp (
    Q    ,
    CLK  ,
    D    ,
    SCD  ,
    SCE  ,
    SET_B
);

    // Module ports
    output Q    ;
    input  CLK  ;
    input  D    ;
    input  SCD  ;
    input  SCE  ;
    input  SET_B;

    // Local signals
    wire buf_Q  ;
    wire SET    ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    not                                       not0      (SET    , SET_B            );
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, D, SCD, SCE      );
    sky130_fd_sc_hd__udp_dff$PS   `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, SET);
    buf                                       buf0      (Q      , buf_Q            );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFSTP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFXBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SDFXBP_FUNCTIONAL_PP_V

/**
 * sdfxbp: Scan delay flop, non-inverted clock, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p_pp_pg_n/sky130_fd_sc_hd__udp_dff_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sdfxbp (
    Q   ,
    Q_N ,
    CLK ,
    D   ,
    SCD ,
    SCE ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Q   ;
    output Q_N ;
    input  CLK ;
    input  D   ;
    input  SCD ;
    input  SCE ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf_Q  ;
    wire mux_out;

    //                                 Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1                  mux_2to10 (mux_out, D, SCD, SCE               );
    sky130_fd_sc_hd__udp_dff$P_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, , VPWR, VGND);
    buf                                            buf0      (Q      , buf_Q                     );
    not                                            not0      (Q_N    , buf_Q                     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFXBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFXBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SDFXBP_FUNCTIONAL_V

/**
 * sdfxbp: Scan delay flop, non-inverted clock, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p/sky130_fd_sc_hd__udp_dff_p.v"

`celldefine
module sky130_fd_sc_hd__sdfxbp (
    Q  ,
    Q_N,
    CLK,
    D  ,
    SCD,
    SCE
);

    // Module ports
    output Q  ;
    output Q_N;
    input  CLK;
    input  D  ;
    input  SCD;
    input  SCE;

    // Local signals
    wire buf_Q  ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, D, SCD, SCE    );
    sky130_fd_sc_hd__udp_dff$P    `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK   );
    buf                                       buf0      (Q      , buf_Q          );
    not                                       not0      (Q_N    , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFXBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFXTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SDFXTP_FUNCTIONAL_PP_V

/**
 * sdfxtp: Scan delay flop, non-inverted clock, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p_pp_pg_n/sky130_fd_sc_hd__udp_dff_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sdfxtp (
    Q   ,
    CLK ,
    D   ,
    SCD ,
    SCE ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Q   ;
    input  CLK ;
    input  D   ;
    input  SCD ;
    input  SCE ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf_Q  ;
    wire mux_out;

    //                                 Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1                  mux_2to10 (mux_out, D, SCD, SCE               );
    sky130_fd_sc_hd__udp_dff$P_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, , VPWR, VGND);
    buf                                            buf0      (Q      , buf_Q                     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFXTP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDFXTP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SDFXTP_FUNCTIONAL_V

/**
 * sdfxtp: Scan delay flop, non-inverted clock, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p/sky130_fd_sc_hd__udp_dff_p.v"

`celldefine
module sky130_fd_sc_hd__sdfxtp (
    Q  ,
    CLK,
    D  ,
    SCD,
    SCE
);

    // Module ports
    output Q  ;
    input  CLK;
    input  D  ;
    input  SCD;
    input  SCE;

    // Local signals
    wire buf_Q  ;
    wire mux_out;

    //                            Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, D, SCD, SCE    );
    sky130_fd_sc_hd__udp_dff$P    `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK   );
    buf                                       buf0      (Q      , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDFXTP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDLCLKP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SDLCLKP_FUNCTIONAL_PP_V

/**
 * sdlclkp: Scan gated clock.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p_pp_pg_n/sky130_fd_sc_hd__udp_dlatch_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sdlclkp (
    GCLK,
    SCE ,
    GATE,
    CLK ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output GCLK;
    input  SCE ;
    input  GATE;
    input  CLK ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire m0      ;
    wire m0n     ;
    wire clkn    ;
    wire SCE_GATE;

    //                                    Name     Output    Other arguments
    not                                   not0    (m0n     , m0                          );
    not                                   not1    (clkn    , CLK                         );
    nor                                   nor0    (SCE_GATE, GATE, SCE                   );
    sky130_fd_sc_hd__udp_dlatch$P_pp$PG$N dlatch0 (m0      , SCE_GATE, clkn, , VPWR, VGND);
    and                                   and0    (GCLK    , m0n, CLK                    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDLCLKP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SDLCLKP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SDLCLKP_FUNCTIONAL_V

/**
 * sdlclkp: Scan gated clock.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p/sky130_fd_sc_hd__udp_dlatch_p.v"

`celldefine
module sky130_fd_sc_hd__sdlclkp (
    GCLK,
    SCE ,
    GATE,
    CLK
);

    // Module ports
    output GCLK;
    input  SCE ;
    input  GATE;
    input  CLK ;

    // Local signals
    wire m0      ;
    wire m0n     ;
    wire clkn    ;
    wire SCE_GATE;

    //                            Name     Output    Other arguments
    not                           not0    (m0n     , m0             );
    not                           not1    (clkn    , CLK            );
    nor                           nor0    (SCE_GATE, GATE, SCE      );
    sky130_fd_sc_hd__udp_dlatch$P dlatch0 (m0      , SCE_GATE, clkn );
    and                           and0    (GCLK    , m0n, CLK       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SDLCLKP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SEDFXBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SEDFXBP_FUNCTIONAL_PP_V

/**
 * sedfxbp: Scan delay flop, data enable, non-inverted clock,
 *          complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p_pp_pg_n/sky130_fd_sc_hd__udp_dff_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sedfxbp (
    Q   ,
    Q_N ,
    CLK ,
    D   ,
    DE  ,
    SCD ,
    SCE ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Q   ;
    output Q_N ;
    input  CLK ;
    input  D   ;
    input  DE  ;
    input  SCD ;
    input  SCE ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf_Q  ;
    wire mux_out;
    wire de_d   ;

    //                                 Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1                  mux_2to10 (mux_out, de_d, SCD, SCE            );
    sky130_fd_sc_hd__udp_mux_2to1                  mux_2to11 (de_d   , buf_Q, D, DE              );
    sky130_fd_sc_hd__udp_dff$P_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, , VPWR, VGND);
    buf                                            buf0      (Q      , buf_Q                     );
    not                                            not0      (Q_N    , buf_Q                     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SEDFXBP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SEDFXBP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SEDFXBP_FUNCTIONAL_V

/**
 * sedfxbp: Scan delay flop, data enable, non-inverted clock,
 *          complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p/sky130_fd_sc_hd__udp_dff_p.v"

`celldefine
module sky130_fd_sc_hd__sedfxbp (
    Q  ,
    Q_N,
    CLK,
    D  ,
    DE ,
    SCD,
    SCE
);

    // Module ports
    output Q  ;
    output Q_N;
    input  CLK;
    input  D  ;
    input  DE ;
    input  SCD;
    input  SCE;

    // Local signals
    wire buf_Q  ;
    wire mux_out;
    wire de_d   ;

    //                            Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, de_d, SCD, SCE );
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to11 (de_d   , buf_Q, D, DE   );
    sky130_fd_sc_hd__udp_dff$P    `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK   );
    buf                                       buf0      (Q      , buf_Q          );
    not                                       not0      (Q_N    , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SEDFXBP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SEDFXTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__SEDFXTP_FUNCTIONAL_PP_V

/**
 * sedfxtp: Scan delay flop, data enable, non-inverted clock,
 *          single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p_pp_pg_n/sky130_fd_sc_hd__udp_dff_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hd__sedfxtp (
    Q   ,
    CLK ,
    D   ,
    DE  ,
    SCD ,
    SCE ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Q   ;
    input  CLK ;
    input  D   ;
    input  DE  ;
    input  SCD ;
    input  SCE ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire buf_Q  ;
    wire mux_out;
    wire de_d   ;

    //                                 Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1                  mux_2to10 (mux_out, de_d, SCD, SCE            );
    sky130_fd_sc_hd__udp_mux_2to1                  mux_2to11 (de_d   , buf_Q, D, DE              );
    sky130_fd_sc_hd__udp_dff$P_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, , VPWR, VGND);
    buf                                            buf0      (Q      , buf_Q                     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SEDFXTP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__SEDFXTP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__SEDFXTP_FUNCTIONAL_V

/**
 * sedfxtp: Scan delay flop, data enable, non-inverted clock,
 *          single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_hd__udp_mux_2to1.v"
`include "../../models/udp_dff_p/sky130_fd_sc_hd__udp_dff_p.v"

`celldefine
module sky130_fd_sc_hd__sedfxtp (
    Q  ,
    CLK,
    D  ,
    DE ,
    SCD,
    SCE
);

    // Module ports
    output Q  ;
    input  CLK;
    input  D  ;
    input  DE ;
    input  SCD;
    input  SCE;

    // Local signals
    wire buf_Q  ;
    wire mux_out;
    wire de_d   ;

    //                            Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to10 (mux_out, de_d, SCD, SCE );
    sky130_fd_sc_hd__udp_mux_2to1             mux_2to11 (de_d   , buf_Q, D, DE   );
    sky130_fd_sc_hd__udp_dff$P    `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK   );
    buf                                       buf0      (Q      , buf_Q          );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__SEDFXTP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__TAP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__TAP_FUNCTIONAL_PP_V

/**
 * tap: Tap cell with no tap connections (no contacts on metal1).
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__tap (
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    input VPWR;
    input VGND;
    input VPB ;
    input VNB ;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__TAP_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__TAP_FUNCTIONAL_V
`define SKY130_FD_SC_HD__TAP_FUNCTIONAL_V

/**
 * tap: Tap cell with no tap connections (no contacts on metal1).
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__tap ();
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__TAP_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__TAPVGND_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__TAPVGND_FUNCTIONAL_PP_V

/**
 * tapvgnd: Tap cell with tap to ground, isolated power connection 1
 *          row down.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__tapvgnd (
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    input VPWR;
    input VGND;
    input VPB ;
    input VNB ;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__TAPVGND_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__TAPVGND_FUNCTIONAL_V
`define SKY130_FD_SC_HD__TAPVGND_FUNCTIONAL_V

/**
 * tapvgnd: Tap cell with tap to ground, isolated power connection 1
 *          row down.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__tapvgnd ();
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__TAPVGND_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__TAPVGND2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__TAPVGND2_FUNCTIONAL_PP_V

/**
 * tapvgnd2: Tap cell with tap to ground, isolated power connection 2
 *           rows down.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__tapvgnd2 (
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    input VPWR;
    input VGND;
    input VPB ;
    input VNB ;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__TAPVGND2_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__TAPVGND2_FUNCTIONAL_V
`define SKY130_FD_SC_HD__TAPVGND2_FUNCTIONAL_V

/**
 * tapvgnd2: Tap cell with tap to ground, isolated power connection 2
 *           rows down.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__tapvgnd2 ();
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__TAPVGND2_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__TAPVPWRVGND_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__TAPVPWRVGND_FUNCTIONAL_PP_V

/**
 * tapvpwrvgnd: Substrate and well tap cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__tapvpwrvgnd (
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    input VPWR;
    input VGND;
    input VPB ;
    input VNB ;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__TAPVPWRVGND_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__TAPVPWRVGND_FUNCTIONAL_V
`define SKY130_FD_SC_HD__TAPVPWRVGND_FUNCTIONAL_V

/**
 * tapvpwrvgnd: Substrate and well tap cell.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__tapvpwrvgnd ();
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__TAPVPWRVGND_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__XNOR2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__XNOR2_FUNCTIONAL_PP_V

/**
 * xnor2: 2-input exclusive NOR.
 *
 *        Y = !(A ^ B)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__xnor2 (
    Y   ,
    A   ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output Y   ;
    input  A   ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire xnor0_out_Y      ;
    wire pwrgood_pp0_out_Y;

    //                                 Name         Output             Other arguments
    xnor                               xnor0       (xnor0_out_Y      , A, B                   );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_Y, xnor0_out_Y, VPWR, VGND);
    buf                                buf0        (Y                , pwrgood_pp0_out_Y      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__XNOR2_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__XNOR2_FUNCTIONAL_V
`define SKY130_FD_SC_HD__XNOR2_FUNCTIONAL_V

/**
 * xnor2: 2-input exclusive NOR.
 *
 *        Y = !(A ^ B)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__xnor2 (
    Y,
    A,
    B
);

    // Module ports
    output Y;
    input  A;
    input  B;

    // Local signals
    wire xnor0_out_Y;

    //   Name   Output       Other arguments
    xnor xnor0 (xnor0_out_Y, A, B           );
    buf  buf0  (Y          , xnor0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__XNOR2_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__XNOR3_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__XNOR3_FUNCTIONAL_PP_V

/**
 * xnor3: 3-input exclusive NOR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__xnor3 (
    X   ,
    A   ,
    B   ,
    C   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire xnor0_out_X      ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    xnor                               xnor0       (xnor0_out_X      , A, B, C                );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, xnor0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X      );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__XNOR3_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__XNOR3_FUNCTIONAL_V
`define SKY130_FD_SC_HD__XNOR3_FUNCTIONAL_V

/**
 * xnor3: 3-input exclusive NOR.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__xnor3 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire xnor0_out_X;

    //   Name   Output       Other arguments
    xnor xnor0 (xnor0_out_X, A, B, C        );
    buf  buf0  (X          , xnor0_out_X    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__XNOR3_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__XOR2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__XOR2_FUNCTIONAL_PP_V

/**
 * xor2: 2-input exclusive OR.
 *
 *       X = A ^ B
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__xor2 (
    X   ,
    A   ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire xor0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    xor                                xor0        (xor0_out_X       , B, A                  );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, xor0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__XOR2_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__XOR2_FUNCTIONAL_V
`define SKY130_FD_SC_HD__XOR2_FUNCTIONAL_V

/**
 * xor2: 2-input exclusive OR.
 *
 *       X = A ^ B
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__xor2 (
    X,
    A,
    B
);

    // Module ports
    output X;
    input  A;
    input  B;

    // Local signals
    wire xor0_out_X;

    //  Name  Output      Other arguments
    xor xor0 (xor0_out_X, B, A           );
    buf buf0 (X         , xor0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__XOR2_FUNCTIONAL_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__XOR3_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HD__XOR3_FUNCTIONAL_PP_V

/**
 * xor3: 3-input exclusive OR.
 *
 *       X = A ^ B ^ C
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hd__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hd__xor3 (
    X   ,
    A   ,
    B   ,
    C   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Local signals
    wire xor0_out_X       ;
    wire pwrgood_pp0_out_X;

    //                                 Name         Output             Other arguments
    xor                                xor0        (xor0_out_X       , A, B, C               );
    sky130_fd_sc_hd__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_X, xor0_out_X, VPWR, VGND);
    buf                                buf0        (X                , pwrgood_pp0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__XOR3_FUNCTIONAL_PP_V/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__XOR3_FUNCTIONAL_V
`define SKY130_FD_SC_HD__XOR3_FUNCTIONAL_V

/**
 * xor3: 3-input exclusive OR.
 *
 *       X = A ^ B ^ C
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__xor3 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire xor0_out_X;

    //  Name  Output      Other arguments
    xor xor0 (xor0_out_X, A, B, C        );
    buf buf0 (X         , xor0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__XOR3_FUNCTIONAL_V