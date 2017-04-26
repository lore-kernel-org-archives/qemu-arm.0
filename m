Received: by 10.25.0.144 with SMTP id 138csp133529lfa;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
X-Received: by 10.55.124.66 with SMTP id x63mr31588148qkc.225.1493187812762;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id n15si20316748qkh.164.2017.04.25.23.23.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 67A4321B49;
	Wed, 26 Apr 2017 02:23:32 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 02:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=FA+
	e3Xv5AjO7YH2WX0VOsBB3hIAwoqYtkldFYtYp9nk=; b=afa0eokhX4S3N7prWwF
	9YvVD3m4YvaF2/F7zK8IrBsI7JbDXc+75vJev7kcloVduIL5weZvjpg0LrDOWVtl
	q7BF+a4+jvcW64KXIb1iA9Fvks/Kj0GHLj9DTbC8ziKoPec8R6xTa17yvNpsyPfS
	/6cwiHJo46gYbItlKPrDpX/s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=FA+e3Xv5AjO7YH2WX0VOsBB3hIAwoqYtkldFYtYp9
	nk=; b=fE6p0AfbU4vLHU5fdWHsWUFlbzCbvRNmayiBuE66e3cmVJwHpKQqP2IQI
	74EKY5R3yOyFOtEaNWSn56WzD8RIsqN0ZYE6w/JAAPClaWGfn4YolFwLlJqUxB1Y
	zmx3pLzZ6WuXKwsTW0J5sm9ILe3ldPJEH1C25mVtj793zolY82BBllGA5/fUYVUY
	bF5FqszUD5NeqJhtFMq6+lI/7SHf/VObT3U93T41wxqan3fef2NskS6Tx6EEY0JJ
	o8qkvVCr0//lNZWVFofrTIoYIyXEljdapT2WQkJl/uz4YRNeqJR4qv8Vf9KwwLx7
	BXxtwURq+APBpCnjhbZtJSkyByTdA==
X-ME-Sender: <xms:5DwAWdbxrZct5nhVbrNIRF6hhatH1idxZ911KAsNPh8Iqm-e6H6-NQ>
X-Sasl-enc: Zd1KxaOa7TbcVsY6SE7Kpg6aFgUTn+iC/4o4p4QXtsOo 1493187812
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 267C82469B;
	Wed, 26 Apr 2017 02:23:32 -0400 (EDT)
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
Subject: [PATCH v3 10/10] tb-hash: improve tb_jmp_cache hash function in user mode
Date: Wed, 26 Apr 2017 02:23:23 -0400
Message-Id: <1493187803-4510-11-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493187803-4510-1-git-send-email-cota@braap.org>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
X-TUID: V3UU8yYvK9FL

Optimizations to cross-page chaining and indirect branches make
performance more sensitive to the hit rate of tb_jmp_cache.
The constraint of reserving some bits for the page number
lowers the achievable quality of the hashing function.

However, user-mode does not have this requirement. Thus,
with this change we use for user-mode a hashing function that
is both faster and of better quality than the previous one.

Measurements:

Note: baseline (i.e. speedup == 1x) is QEMU v2.9.0.

-                           SPECint06 (test set), x86_64-linux-user. Host: Intel i7-6700K @ 4.00GHz

 2.2x +-+--------------------------------------------------------------------------------------------------------------+-+
      |                                                                                                                  |
      |         jr                                                                                                       |
   2x +jr+multhash        +....................................................+++++...................................+-+
      |    jr+hash                                                              |$$$                                     |
      |                                                                         |$+$                                     |
      |                                                                        ### $                                     |
 1.8x +-+......................................................................#|#.$...................................+-+
      |                                                                      ++#+# $                                     |
      |                                                                       |# # $                                     |
 1.6x +-+....................................................................***.#.$....................++$$$..........+-+
      |                                         $$$                          *+* # $                     |$+$            |
      |                       ++$$$           ### $                          * * # $                  +++|$ $            |
      |                     ++###+$           # # $                          * * # $           ###   ****## $            |
 1.4x +-+...................***+#.$.........***.#.$..........................*.*.#.$...........#+#$$.*++*|#.$..........+-+
      |                     *+* # $         * * # $                          * * # $           # # $ *  *+# $            |
      |                     * * # $   +++++ * * # $                          * * # $         *** # $ *  * # $   ###$$    |
 1.2x +-+...................*.*.#.$.***##$$.*.*.#.$..........................*.*.#.$.........*.*.#.$.*..*.#.$.***+#+$..+-+
      |                     * * # $ *+* # $ * * # $   +++                    * * # $ ++###$$ * * # $ *  * # $ * * # $    |
      |    ***##$$          * * # $ * * # $ * * # $ ***##$$          ++###   * * # $ *** #+$ * * # $ *  * # $ * * # $    |
      |    *+*+#+$ ***##$$$ * * # $ * * # $ * * # $ *+* # $ ++####$$ ***+#   * * # $ * * # $ * * # $ *  * # $ * * # $    |
   1x +-++-*+*+#+$+*+*+#-+$+*+*-#+$+*+*+#+$+*+*+#+$+*-*+#+$+***++#+$+*+*+#$$+*+*+#+$+*+*+#+$+*+*-#+$+*+-*+#+$+*+*+#+$-++-+
      |    * * # $ * * #  $ * * # $ * * # $ * * # $ * * # $ * *  # $ * * # $ * * # $ * * # $ * * # $ *  * # $ * * # $    |
      |    * * # $ * * #  $ * * # $ * * # $ * * # $ * * # $ * *  # $ * * # $ * * # $ * * # $ * * # $ *  * # $ * * # $    |
 0.8x +-+--***##$$-***##$$$-***##$$-***##$$-***##$$-***##$$-***###$$-***##$$-***##$$-***##$$-***##$$-****##$$-***##$$--+-+
         astar   bzip2      gcc   gobmk h264ref   hmmlibquantum      mcf omnetpperlbench   sjengxalancbmk   hmean
  png: http://imgur.com/4UXTrEc

Here I also tried the hash function suggested by Paolo ("multhash"):

  return ((uint64_t) (pc * 2654435761) >> 32) & (TB_JMP_CACHE_SIZE - 1);

As you can see it is just as good as the other new function ("hash"),
which is what I ended up going with.

-                          SPECint06 (train set), x86_64-linux-user. Host: Intel i7-6700K @ 4.00GHz

 2.6x +-+--------------------------------------------------------------------------------------------------------------+-+
      |                                                                                                                  |
      |     jr                                                                                           ###             |
 2.4x +jr+hash...........................................................................................#.#...........+-+
      |                                                                                                  # #             |
      |                                                                                                  # #             |
 2.2x +-+................................................................................................#.#...........+-+
      |                                                                                                  # #             |
      |                                                                                                  # #             |
   2x +-+................................................................................................#.#...........+-+
      |                                                                                               **** #             |
      |                                                                                               *  * #             |
 1.8x +-+.............................................................................................*..*.#...........+-+
      |                                                                         +++                   *  * #             |
      |                                                                         ####    ####          *  * #             |
 1.6x +-+......................................####.............................#..#.****..#..........*..*.#...........+-+
      |                        +++             #++#                          ****  # *  *  #    ####  *  * #             |
      |                        ###             #  #                          *  *  # *  *  #    #  #  *  * #             |
 1.4x +-+...................****+#..........****..#..........................*..*..#.*..*..#....#..#..*..*.#...........+-+
      |                     *++* #          *  *  #                          *  *  # *  *  #  ***  #  *  * #     ####    |
      |                     *  * #     #### *  *  #                          *  *  # *  *  #  * *  #  *  * #  ****  #    |
 1.2x +-+...................*..*.#..****++#.*..*..#..........................*..*..#.*..*..#..*.*..#..*..*.#..*..*..#..+-+
      |    ****###          *  * #  *  *  # *  *  #                          *  *  # *  *  #  * *  #  *  * #  *  *  #    |
      |    *  *  #  ***###  *  * #  *  *  # *  *  #                  ****##  *  *  # *  *  #  * *  #  *  * #  *  *  #    |
   1x +-+--****###--***###--****##--****###-****###--***###--***###--****##--****###-****###--***###--****##--****###--+-+
         astar   bzip2      gcc   gobmk h264ref   hmmlibquantum      mcf omnetpperlbench   sjengxalancbmk   hmean
  png: http://imgur.com/ArCbHqo

-                                    NBench, x86_64-linux-user. Host: Intel i7-6700K @ 4.00GHz

 1.12x +-+-------------------------------------------------------------------------------------------------------------+-+
       |                                                                                                                 |
       |     jr                                                           +++                                            |
  1.1x +jr+hash...........................................................####.........................................+-+
       |                                                               +++#| #                                           |
       |                                                                | #++#                                           |
 1.08x +-+................................+++................+++.+++..*****..#.........................................+-+
       |                                   |  +++             |   |   * | *  #                                           |
       |                                   |   |              |   |   *+++*  #                                           |
 1.06x +-+................................****###.............|...|...*...*..#.........................+++.............+-+
       |                                  *| * |#            ****###  *   *  #                          |                |
       |                                  *| *++#            *| * |#  *   *  #                        ####               |
 1.04x +-+................................*++*..#............*|.*.|#..*...*..#........................#.|#.............+-+
       |                                  *  *  #            *++*++#  *   *  #                     +++#++#               |
       |                                  *  *  #            *  *  #  *   *  #                      | #  #   +++####     |
 1.02x +-+................................*..*..#......+++...*..*..#..*...*..#.....................****..#..*****++#...+-+
       |         +++                      *  *  #   +++ |    *  *  #  *   *  #  +++                *| *  #  *+++*  #     |
       |      +++ |    +++ +++   ++++++   *  *  #  *****###  *  *  #  *   *  #   |  +++   ++++++   *++*  #  *   *  #     |
    1x +-++-+++++####++****###++++-+####+-*++*++#-+*+++*-+#++*++*++#++*+-+*++#+-+++####-+*****###++*++*++#++*+-+*++#+-++-+
       |     *****| #  *++* |#  *****| #  *  *  #  *   *++#  *  *  #  *   *  #  **** |#  *   *  #  *  *  #  *   *  #     |
       |     * | *| #  *  *++#  * | *++#  *  *  #  *   *  #  *  *  #  *   *  #  *| *++#  *   *  #  *  *  #  *   *  #     |
 0.98x +-+...*.|.*++#..*..*..#..*+++*..#..*..*..#..*...*..#..*..*..#..*...*..#..*++*..#..*...*..#..*..*..#..*...*..#...+-+
       |     *+++*  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
       |     *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
 0.96x +-+---*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###---+-+
       ASSIGNMENT BITFIELD   FOURFP EMULATION   HUFFMAN   LU DECOMPOSITIONEURAL NNUMERIC SOSTRING SORT     hmean
  png: http://imgur.com/ZXFX0hJ

-                                   NBench, arm-linux-user. Host: Intel i7-4790K @ 4.00GHz

  1.3x +-+-------------------------------------------------------------------------------------------------------------+-+
       |                            ####                                                                                 |
       |     jr                     #  #                                            +++                                  |
 1.25x +jr+hash.....................#..#...........................................####................................+-+
       |                            #  #                                           #  #                                  |
       |                            #  #                                           #  #                                  |
  1.2x +-+..........................#..#...........................................#..#................................+-+
       |                            #  #                                           #  #                                  |
       |                            #  #                                           #  #                                  |
 1.15x +-+..........................#..#...........................................#..#................................+-+
       |                            #  #                                  ####     #  #                                  |
       |                            #  #                                  #  #     #  #                                  |
  1.1x +-+..........................#..#..................................#..#.....#..#................................+-+
       |                            #  #                                  #  #     #  #                         +++      |
       |                            #  #               ####               #  #     #  #                         ####     |
 1.05x +-+..........................#..#...............#..#.....####......#..#.....#..#.........................#..#...+-+
       |                            #  #               #  #     #  #      #  #     #  #                +++      #  #     |
       |                   +++  *****  #     ####  *****  #     #  #   +++#  #  ****  #            ****###      #  #     |
    1x +-++-+*****###++****+++++*+-+*++#+-****++#-+*+++*-+#+++++#++#++*****++#+-*++*++#-+*****-++++*++*++#++*****++#+-++-+
       |     *   *  #  *  * |   *   *  #  *  *  #  *   *  #  ****  #  *   *  #  *  *  #  *   *###  *  *++#  *   *  #     |
       |     *   *  #  *  *###  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
 0.95x +-+...*...*..#..*..*.|#..*...*..#..*..*..#..*...*..#..*..*..#..*...*..#..*..*..#..*...*..#..*..*..#..*...*..#...+-+
       |     *   *  #  *  * |#  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
       |     *   *  #  *  * |#  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
  0.9x +-+---*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###---+-+
       ASSIGNMENT BITFIELD   FOURFP EMULATION   HUFFMAN   LU DECOMPOSITIONEURAL NNUMERIC SOSTRING SORT     hmean
  png: http://imgur.com/FfD27ey

Reviewed-by: Richard Henderson <rth@twiddle.net>
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
