Received: by 10.25.0.144 with SMTP id 138csp1748212lfa;
        Tue, 25 Apr 2017 00:54:19 -0700 (PDT)
X-Received: by 10.55.214.76 with SMTP id t73mr16688072qki.279.1493106859379;
        Tue, 25 Apr 2017 00:54:19 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id o78si21160310qka.51.2017.04.25.00.54.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 162EC21F23;
	Tue, 25 Apr 2017 03:54:06 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=s+8
	HEVymHu6nfiCAkM0PAl2FnRIyZUoKX9jfN3mgt+Q=; b=zS1LDyX8toH3qVlHjmR
	IHnfYRAhb2t52Rwb2p2owrXPSCBlEEg4jvWlz0kVr/uH7pb109P6vRhyshJuL8iO
	NWJXssimwcxkIMJ0mjKFxtHw8VWuQW78gp895bUVMuXPW5xPFw7i86GWFWXBjFGC
	U1OHWqiRZWQq23mLmWmOJUhw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=s+8HEVymHu6nfiCAkM0PAl2FnRIyZUoKX9jfN3mgt
	+Q=; b=X3bjEFQggqU/IuXquvm6KdZ7RF7IqYhY4sIhe5GinZ4sbi9EnDFYrMn64
	P/gDXZjYEYrXz5pRHGBse6umyRUPc8S4c39sbLYsoyJseDW5SQxK53pFJDn1of4U
	oEgfKlvP4QomRlnchqEfFIA0m4F8js5YLRC0N/e1lWGOzxdBfPg57BZCZS1jZ1KT
	mYKB8JG+LA/A1OXxHykltEcjpRbAhH7m/sQKQN3+NtiXbfUp7xLQOmROIHX5w6m1
	eUGiz0dvELvGwwLoq2vW9wGN3o42pDS411I8iIfbL72247uNvvLOkaCcA9396xxb
	4HZaoGSaMpuHfcdcsjS/dZvPH0FEA==
X-ME-Sender: <xms:nQD_WLjJmQYhEclEkI-fZWldS1g-wDVwiXlbECQC4UlxPMW0WQ6uDA>
X-Sasl-enc: AXHJjJjw3ssMIwSD2NFrtHWprVzUq/D0sPaU5F1VjIJR 1493106845
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id BC4BD7E0EE;
	Tue, 25 Apr 2017 03:54:05 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH v2 13/13] tb-hash: improve tb_jmp_cache hash function in user mode
Date: Tue, 25 Apr 2017 03:53:59 -0400
Message-Id: <1493106839-10438-14-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: /mxG/BXS37Ce

Optimizations to cross-page chaining and indirect branches make
performance more sensitive to the hit rate of tb_jmp_cache.
The constraint of reserving some bits for the page number
lowers the achievable quality of the hashing function.

However, user-mode does not have this requirement. Thus,
with this change we use for user-mode a hashing function that
is both faster and of better quality than the previous one.

Measurements:

Note: baseline (i.e. speedup == 1x) is QEMU v2.9.0.

-                            SPECint06 (test set), x86_64-linux-user. Host: Intel i7-6700K @ 4.00GHz

   2x +-+--------------------------------------------------------------------------------------------------------------+-+
      |                                                                         +++++                                    |
      |       jr+noinline                                                        | |                                     |
      |         jr+inline                                                      ++%%@                                     |
 1.8x +-+jr+hash+noinline        +..............................................|%%@...................................+-+
      |jr+multhash+inline                                                       |%%@+                                    |
      |    jr+hash+inline                                                     +$$$%@                                     |
      |                                                                     ++##|$%@                      +++            |
 1.6x +-+....................................................................|##|$%@....................+%%%...........+-+
      |                                          @@+                         **#+$%@                    $$+%             |
      |                                       $$$%@+                        +**#+$%@             ++++ ++$$+%@            |
      |                        ++++           $ $%@                          **# $%@           +$$%@@+++$$ %@            |
 1.4x +-+.....................+%%%@..........##+$%@..........................**#.$%@...........+$$%.@***$$.%@..........+-+
      |                     ++$$+%@          ##+$%@                          **# $%@            $$% @* *#$+%@            |
      |                    ***#$ %@        +**# $%@                          **# $%@         +###$% @* *#$ %@            |
      |                    *+*#$ %@    +%%@+**# $%@                          **# $%@         **+#$% @*+*#$ %@   +%%%@+   |
 1.2x +-+..................*.*#$.%@***#$$%@+**#.$%@..........................**#.$%@.........**.#$%.@*.*#$.%@***#$+%@+.+-+
      |     +++            * *#$ %@* *# $%@ **# $%@ +++++++                  **# $%@  +++%%@@** #$% @* *#$ %@*+*#$ %@    |
      |   ++###$%+         * *#$ %@* *# $%@ **# $%@ **##$%@@                 **# $%@+**#$$%+@** #$% @* *#$ %@* *#$ %@    |
      |   +**+#$%@@ ++$$@@@* *#$ %@* *# $%@ **# $%@ ** #$% @+###++@@++++%%%+ **# $%@ **# $% @** #$% @* *#$ %@* *#$ %@    |
   1x +-++-**+#$%-@**##$%+@*+*#$+%@*+*#+$%@+**#+$%@+**+#$%+@**+#$+@@***#$+%@+**#+$%@+**#+$%+@**+#$%+@*+*#$+%@*-*#$+%@-++-+
      |    ** #$% @** #$% @* *#$ %@* *# $%@ **# $%@ ** #$% @** #$%%@* *#$ %@ **# $%@ **# $% @** #$% @* *#$ %@* *#$ %@    |
      |    ** #$% @** #$% @* *#$ %@* *# $%@ **# $%@ ** #$% @** #$+%@* *#$ %@ **# $%@ **# $% @** #$% @* *#$ %@* *#$ %@    |
      |    ** #$% @** #$% @* *#$ %@* *# $%@ **# $%@ ** #$% @** #$ %@* *#$ %@ **# $%@ **# $% @** #$% @* *#$ %@* *#$ %@    |
 0.8x +-+--**##$%@@**##$%@@***#$%%@***#$$%@-**#$$%@-**##$%@@**##$%%@***#$%%@-**#$$%@-**#$$%@@**##$%@@***#$%%@***#$%%@--+-+
         astar   bzip2      gcc   gobmk h264ref   hmmlibquantum      mcf omnetpperlbench   sjengxalancbmk   hmean
  png: http://imgur.com/1ZJGjzV

Here I also tried the hash function suggested by Paolo ("multhash"):
  return ((uint64_t) (pc * 2654435761) >> 32) & ();
As you can see it is just as good as the other new function ("hash"),
but I kept "hash" because with it all benchmarks have speedup > 1.

-                          SPECint06 (train set), x86_64-linux-user. Host: Intel i7-6700K @ 4.00GHz

 2.6x +-+--------------------------------------------------------------------------------------------------------------+-+
      |                                                                                                                  |
      |     jr+inline                                                                                                    |
 2.4x +jr+inline+hash....................................................................................###...........+-+
      |                                                                                                  # #             |
      |                                                                                                  # #             |
 2.2x +-+................................................................................................#.#...........+-+
      |                                                                                                  # #             |
      |                                                                                                  # #             |
   2x +-+................................................................................................#.#...........+-+
      |                                                                                                  # #             |
      |                                                                                               **** #             |
 1.8x +-+.............................................................................................*..*.#...........+-+
      |                                                                         +++     ####          *  * #             |
      |                                                                         #### ****++#          *  * #             |
 1.6x +-+......................................+++...........................****..#.*++*..#..........*..*.#...........+-+
      |                                        ####                          *++*  # *  *  #     +++  *  * #             |
      |                        +++           ++#++#                          *  *  # *  *  #    ####  *  * #             |
 1.4x +-+...................+++###..........****..#..........................*..*..#.*..*..#....#..#..*..*.#...........+-+
      |                     ****+#          *  *  #                          *  *  # *  *  #  ***  #  *  * #     ####    |
      |                     *++* #     +++  *  *  #                          *  *  # *  *  #  *+*  #  *  * #  ****++#    |
 1.2x +-+...................*..*.#..****###.*..*..#..........................*..*..#.*..*..#..*.*..#..*..*.#..*..*..#..+-+
      |    ****###     +++  *  * #  *  *  # *  *  #                          *  *  # *  *  #  * *  #  *  * #  *  *  #    |
      |    *  *++#  ***###  *  * #  *  *  # *  *  #                          *  *  # *  *  #  * *  #  *  * #  *  *  #    |
   1x +-+--****###--***###--****##--****###-****###--***###--***###--****##--****###-****###--***###--****##--****###--+-+
         astar   bzip2      gcc   gobmk h264ref   hmmlibquantum      mcf omnetpperlbench   sjengxalancbmk   hmean
  png: http://imgur.com/1D2VFze

-                                   NBench, x86_64-linux-user. Host: Intel i7-6700K @ 4.00GHz

  1.1x +-+-------------------------------------------------------------------------------------------------------------+-+
       |                                                                                                                 |
       |       jr+inline                                                                                                 |
 1.08x +jr+hash+noinline        +..............................+++.....................................................+-+
       |  jr+hash+inline                                        |                                                        |
       |                                                     +++|                                                        |
       |                                                      | |+++                                                     |
 1.06x +-+....................................................|.|.|....................................................+-+
       |                                                      |###|                                  +++++               |
       |                                                      |#|#|                                  ###$$$              |
 1.04x +-+.........................+++....+++.+++.............|#|#$$$..............................++#|#++$............+-+
       |                            |+++   |+++|            ****|#| $           +++                 |#+#  $              |
       |                            | |    | | |            * |*+#| $            |+++             **** #  $              |
       |     +++                +++ | |  ****| |            * |* #++$            | |+++           * |* #  $              |
 1.02x +-+....|..................|####$$.*.|*|$$$$.++++++++.*.|*.#..$..........****|.|............*++*.#..$.++++++++...+-+
       |     ***+++              |# |#|$ * |*##| $  |  | |  * |* #  $          * |*| |      +++   *  * #  $ ***###$$     |
       |     *|* |+++  +++ +++  *** |#|$ * |*|#| $ ***###$$ *++* #  $      +++ * |*##$$$   ####++ *  * #  $ *+*++# $     |
    1x +-++-+*+*###+++****-$$$$+*+*++#+$+*++*+#++$+*+*++#+$+*++*-#++$+++-++$$$+*++*+#++$+***++#$$+*++*-#++$+*+*++#+$+-++-+
       |     * *++#$$ *++*|$++$ *|*++# $ *  *+#++$ *+*++#|$ *  * #  $ *** |$+$ *  *|#| $ *+*  #+$ *  * #  $ * *  # $     |
       |     * *  #+$ *  *##  $ *+*  # $ *  * #  $ * *  #+$ *  * #  $ *+*### $ *  *|#++$ * *  # $ *  * #  $ * *  # $     |
       |     * *  # $ *  *|#  $ * *  # $ *  * #  $ * *  # $ *  * #  $ * *++# $ *  *+#  $ * *  # $ *  * #  $ * *  # $     |
 0.98x +-+...*.*..#.$.*..*+#..$.*.*..#.$.*..*.#..$.*.*..#.$.*..*.#..$.*.*..#.$.*..*.#..$.*.*..#.$.*..*.#..$.*.*..#.$...+-+
       |     * *  # $ *  * #  $ * *  # $ *  * #  $ * *  # $ *  * #  $ * *  # $ *  * #  $ * *  # $ *  * #  $ * *  # $     |
       |     * *  # $ *  * #  $ * *  # $ *  * #  $ * *  # $ *  * #  $ * *  # $ *  * #  $ * *  # $ *  * #  $ * *  # $     |
 0.96x +-+---***###$$-****##$$$-***###$$-****##$$$-***###$$-****##$$$-***###$$-****##$$$-***###$$-****##$$$-***###$$---+-+
       ASSIGNMENT BITFIELD   FOURFP EMULATION   HUFFMAN   LU DECOMPOSITIONEURAL NNUMERIC SOSTRING SORT     hmean
  png: http://imgur.com/xK9YfOB

-                                    NBench, arm-linux-user. Host: Intel i7-4790K @ 4.00GHz

  1.3x +-+-------------------------------------------------------------------------------------------------------------+-+
       |                            ####                                            +++                                  |
       |     jr+inline              #++#                                           ####                                  |
 1.25x +jr+hash+inline..............#..#...........................................#++#................................+-+
       |                            #  #                                           #  #                                  |
       |                            #  #                                           #  #                                  |
       |                            #  #                                           #  #                                  |
  1.2x +-+..........................#..#..................................####.....#..#................................+-+
       |                            #  #                               +++#++#     #  #                                  |
       |                            #  #                              *****  #     #  #                                  |
 1.15x +-+..........................#..#..............................*+++*..#.....#..#................................+-+
       |                            #  #                              *   *  #  ****  #                                  |
       |                            #  #                              *   *  #  *++*  #                                  |
       |                            #  #                              *   *  #  *  *  #                                  |
  1.1x +-+..........................#..#...............+++............*...*..#..*..*..#................................+-+
       |                            #  #            +++####           *   *  #  *  *  #                         ####     |
       |                            #  #           *****  #           *   *  #  *  *  #                         #  #     |
 1.05x +-+..........................#..#...........*...*..#...........*...*..#..*..*..#...............####......#..#...+-+
       |                            #  #  +++      *   *  #           *   *  #  *  *  #               #++#  *****  #     |
       |                         +++#  #  ****###  *   *  #  ****###  *   *  #  *  *  #            +++#  #  *   *  #     |
       |      ++++++   ****###  *****  #  *++*++#  *   *  #  *++*++#  *   *  #  *  *  #   ++++++   ****  #  *   *  #     |
    1x +-++-+*****###++*++*++#++*+-+*++#+-*++*++#-+*+++*-+#++*++*++#++*+-+*++#+-*++*++#-+*****###++*++*++#++*+-+*++#+-++-+
       |     *+++*++#  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
       |     *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
 0.95x +-+---*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###---+-+
       ASSIGNMENT BITFIELD   FOURFP EMULATION   HUFFMAN   LU DECOMPOSITIONEURAL NNUMERIC SOSTRING SORT     hmean
  png: http://imgur.com/uhIEOA1

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 include/exec/tb-hash.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/exec/tb-hash.h b/include/exec/tb-hash.h
index 2c27490..b1fe2d0 100644
--- a/include/exec/tb-hash.h
+++ b/include/exec/tb-hash.h
@@ -22,6 +22,8 @@
 
 #include "exec/tb-hash-xx.h"
 
+#ifdef CONFIG_SOFTMMU
+
 /* Only the bottom TB_JMP_PAGE_BITS of the jump cache hash bits vary for
    addresses on the same page.  The top bits are the same.  This allows
    TLB invalidation to quickly clear a subset of the hash table.  */
@@ -45,6 +47,16 @@ static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
            | (tmp & TB_JMP_ADDR_MASK));
 }
 
+#else
+
+/* In user-mode we can get better hashing because we do not have a TLB */
+static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
+{
+    return (pc ^ (pc >> TB_JMP_CACHE_BITS)) & (TB_JMP_CACHE_SIZE - 1);
+}
+
+#endif /* CONFIG_SOFTMMU */
+
 static inline
 uint32_t tb_hash_func(tb_page_addr_t phys_pc, target_ulong pc, uint32_t flags)
 {
-- 
2.7.4
