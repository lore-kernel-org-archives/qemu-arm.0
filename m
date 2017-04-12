Received: by 10.25.0.144 with SMTP id 138csp89169lfa;
        Tue, 11 Apr 2017 18:17:49 -0700 (PDT)
X-Received: by 10.55.101.11 with SMTP id z11mr29047187qkb.55.1491959869018;
        Tue, 11 Apr 2017 18:17:49 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id t63si1046061qtd.268.2017.04.11.18.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 18:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A1E3520B77;
	Tue, 11 Apr 2017 21:17:48 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 11 Apr 2017 21:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Mh0
	ya9PSTnUiWSVOAuPQqMNYf1lHJtq8eqF1Akv/HHI=; b=nomPzFv25frsswkv6Sy
	1mvanbBfJ4w8t6Ab/BQigQLy5Yay0SmWxrmt2GaXiLlRCBqrfYHPIjpoGb55eFxB
	muvQbhM3oiRSLreZu9SrsikOAjj2k0mvw16qk4ZY/5gqDtr8NS/RPeadXE6uMx/g
	rjpwttw6Rws0siX4hRFP2wEg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=Mh0ya9PSTnUiWSVOAuPQqMNYf1lHJtq8eqF1Akv/H
	HI=; b=d+YFxccPSfZF0v6G8Ek13e64lS5s22jhCSFKmFHP6LfmEEX7dV9u0hc4H
	H0U5ahYB8hx3ZDrPAZAaI/rn3+5OHtHiz/UMxAMvxvOokfAUfzvmKhwUGeKgy+Sp
	L74mVSCrDQRIlUr0SbAXL8JDvyMmfsEln+RQzZOm108LvHPOR9HlzWTUph/JcNaB
	OiU2FkDLe23LdIAPlAoCPjE6l2VMI43zuPtFkiwDhRWJVlZ4fggNHcXHE0plido/
	BWSWaH5ECn4szpJmxu9oJ5pagxRCvEpZyckFMhDinDbuMVKjEPVjvkjRXPmo4B6R
	rWXNfg8d4Kx8EvCzDLZxHUv4tYBlg==
X-ME-Sender: <xms:PIDtWJKuOxiU0dbFrbRXuWck-98I3h8KR8-0VAiWMBGBtnsB-qUXGQ>
X-Sasl-enc: JnWikoH95gmDlF90pyAA825Jx5d8cGmGMLLvPC+YIEX1 1491959868
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5FAD6241ED;
	Tue, 11 Apr 2017 21:17:48 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH 10/10] tb-hash: improve tb_jmp_cache hash function in user mode
Date: Tue, 11 Apr 2017 21:17:30 -0400
Message-Id: <1491959850-30756-11-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491959850-30756-1-git-send-email-cota@braap.org>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
X-TUID: VPb/4FPqLDkC

Optimizations to cross-page chaining and indirect jumps make
performance more sensitive to the hit rate of tb_jmp_cache.
The constraint of reserving some bits for the page number
lowers the achievable quality of the hashing function.

However, user-mode does not have this requirement. Thus,
with this change we use for user-mode a hashing function that
is both faster and of better quality than the previous one.

Measurements:

-    specINT 2006 (test set), x86_64-linux-user. Host: Intel i7-4790K @ 4.00GHz
                              Y axis: Speedup over 95b31d70

     1.3x+-+-------------------------------------------------------------+-+
         |        jr             $$                                        |
    1.25x+-+....  jr+xxhash      %%  ....................................+-+
         |        jr+hash+inline @@                 +++                    |
     1.2x+-+.............................................................+-+
         |                                          @@@                    |
         |                    +++@@               ++@:@       +++  @@+     |
    1.15x+-+..................$$$@@...............$$@.@.......@@...@@....+-+
         |                    $ $@@               $$@ @      %%@   @@      |
     1.1x+-+..................$.$@@...............$$@.@......%%@.$$@@....+-+
         |          +++@@+    $ $@@               $$@ @    ++%%@+$$@@   +++|
    1.05x+-+.........$$@@.....$.$@@...@@..........$$@.@..@@@.%%@.$$@@...@@-+
         |           $$@@     $ $@@$$$@@          $$% @$$@+@$$%@ $$@@+$$@@ |
         |+$$++++++++$$@@+++@@$ $@@$+$@@+++@@$$+@@$$% @$$@+@$$%@ $$%@ $$@@ |
       1x+-$$@@A$$%@R$$@@R$$@@$_$%@$_$%@$$s@@$$%%@$$%.@$$%.@$$%@.$$%@.$$%@-+
         | $$@@+$$%@ $$%@ $$@@$+$%@$ $%@$$%%@$$+%@$$% @$$% @$$%@ $$%@ $$%@ |
    0.95x+-$$%@.$$%@.$$%@.$$%@$.$%@$.$%@$$.%@$$.%@$$%.@$$%.@$$%@.$$%@.$$%@-+
         | $$%@ $$%@ $$%@ $$%@$ $%@$ $%@$$ %@$$ %@$$% @$$% @$$%@ $$%@ $$%@ |
     0.9x+-$$%@-$$%@-$$%@-$$%@$$$%@$$$%@$$%%@$$%%@$$%@@$$%@@$$%@-$$%@-$$%@-+
           astabzip2 gcc gobmh264rehmlibquantumcfomneperlbensjexalanchmean
  png: http://imgur.com/RiaBuIi

That is, a 6.45% hmean improvement for this commit. Note that this is the
test set, so some benchmarks take almost no time (and therefore aren't that
sensitive to changes here). See "train" results below.

Note also that hashing quality is not the only requirement: xxhash
gives on average the highest hit rates. However, the time spent computing
the hash negates the performance gains coming from the increase in hit rate.
Given these results, I dropped xxhash from subsequent experiments.

-   specINT 2006 (train set), x86_64-linux-user. Host: Intel i7-4790K @ 4.00GHz
                              Y axis: Speedup over 95b31d70

    1.4x+-+--------------------------------------------------------------+-+
        |    jr      $$                                           +++      |
        |    jr+hash %%                                            :       |
    1.3x+-+.......................................................%%%....+-+
        |                                               +++  +++  %:%      |
        |                      +++                      %%%   :   %+%      |
    1.2x+-+.....................%%......................%.%..%%%.$$.%....+-+
        |                     ++%%                 %%% $$+%  %:% $$+%      |
        |            +++      $$$%                $$+% $$ %  %:% $$ %      |
    1.1x+-+...........%%......$.$%................$$.%.$$.%.$$.%.$$.%..%%%-+
        |  +++        %%      $ $%            +++ $$ % $$ % $$ % $$ % +%+% |
        | ++%%  +++ ++%% ++%% $ $% $$$+ +++   %%% $$ % $$ % $$ % $$ % $$+% |
      1x+-$$$%RGR%%R$$$%H$$$%P$j$%h$s$%.$$%%..%.%.$$.%.$$.%.$$.%.$$.%.$$.%-+
        | $+$% $$$% $ $% $+$% $ $% $ $% $$+%  % % $$ % $$ % $$ % $$ % $$ % |
        | $ $% $ $% $ $% $ $% $ $% $ $% $$ %  % % $$ % $$ % $$ % $$ % $$ % |
    0.9x+-$.$%.$.$%.$.$%.$.$%.$.$%.$.$%.$$.%..%.%.$$.%.$$.%.$$.%.$$.%.$$.%-+
        | $ $% $ $% $ $% $ $% $ $% $ $% $$ % $$+% $$ % $$ % $$ % $$ % $$ % |
        | $ $% $ $% $ $% $ $% $ $% $ $% $$ % $$ % $$ % $$ % $$ % $$ % $$ % |
    0.8x+-$$$%-$$$%-$$$%-$$$%-$$$%-$$$%-$$%%-$$%%-$$%%-$$%%-$$%%-$$%%-$$%%-+
          astarbzip2 gcc gobmh264rehlibquantumcfomneperlbensjexalancbhmean
  png: http://imgur.com/55iJJgD

That is, a 10.19% hmean improvement for jr+hash (this commit).

-               NBench, arm-linux-user. Host: Intel i7-4790K @ 4.00GHz
                              Y axis: Speedup over 95b31d70

    1.35x+-+-------------------------------------------------------------+-+
         |               @@@   jr              $$                          |
     1.3x+-+.............@.@.  jr+inline       %%  ...@@@................+-+
         |               @ @   jr+inline+hash  @@     @ @                  |
         |               @ @                          @ @                  |
    1.25x+-+.............@.@..........................@.@................+-+
         |               @ @                    @@@   @ @                  |
     1.2x+-+.............@.@..................$$%.@...@.@................+-+
         |               @ @                  $$% @   @ @                  |
         |               @ @        %%@       $$% @  %% @                  |
    1.15x+-+.............@.@........%%@.......$$%.@$$$%.@................+-+
         |               @ @        %%@       $$% @$ $% @                  |
     1.1x+-+.............@.@......$$$%@.......$$%.@$.$%.@...............@@-+
         |               @ @      $ $%@       $$% @$ $% @               @@ |
         |               @ @      $ $%@ $$%%@ $$% @$ $% @            $$%%@ |
    1.05x+-+...........$$%.@$$$%@@$.$%@.$$.%@.$$%.@$.$%.@.........@@.$$.%@-+
         | $$%%@       $$% @$ $% @$ $%@ $$ %@ $$% @$ $% @       %%%@ $$ %@ |
       1x+-$$.%@AR%%%@R$$%B@$G$%P@$T$%@_$$+%@l$$%+@$s$%.@$$$%@.$$.%@.$$.%@-+
         +-$$%%@-$$%%@-$$%@@$$$%@@$$$%@-$$%%@-$$%@@$$$%@@$$$%@-$$%%@-$$%%@-+
        ASSIGNMBITFIELFOFP_EMULATHUFFMANLU_DECOMPNEURNUMERICSTRING_SOhmean
  png: http://imgur.com/i5e1gdY

That is, a 11% hmean perf gain--it almost doubles the perf gain
from implementing the jr optimization.

-              NBench, x86_64-linux-user. Host: Intel i7-4790K @ 4.00GHz

     1.1x+-+-------------------------------------------------------------+-+
         |         jr             $$                                       |
    1.08x+-+.....  jr+inline      %%  ...................................+-+
         |         jr+inline+hash @@                                       |
         | $$ @@                                                           |
    1.06x+-$$.@@.........................%%%.............................+-+
         | $$%%@                         % %                               |
    1.04x+-$$.%@.........................%.%.............................+-+
         | $$ %@         @@@            $$ %                   $$          |
         | $$ %@         @ @  %%        $$ %                   $$%%@       |
    1.02x+-$$.%@........%%.@$$$%@@......$$.%@..%%@@..%%........$$.%@.$$%%@-+
         | $$ %@    @@  %% @$ $% @$$$   $$ %@ $$% @  %%@@$$$%  $$ %@ $$ %@ |
       1x+-$$.%@A$$R@@RG%%B@$G$%P@$T$%P_$$T%@h$$%+@$$$%e@$.$%@.$$.%@.$$.%@-+
         | $$ %@ $$%%@ $$% @$ $% @$ $%  $$ %@ $$% @$ $% @$ $%@ $$ %@ $$ %@ |
    0.98x+-$$.%@.$$.%@.$$%.@$.$%.@$.$%@.$$.%@.$$%.@$.$%.@$.$%@.$$.%@.$$.%@-+
         | $$ %@ $$ %@ $$% @$ $% @$ $%@ $$ %@ $$% @$ $% @$ $%@ $$ %@ $$ %@ |
         | $$ %@ $$ %@ $$% @$ $% @$ $%@ $$ %@ $$% @$ $% @$ $%@ $$ %@ $$ %@ |
    0.96x+-$$.%@.$$.%@.$$%.@$.$%.@$.$%@.$$.%@.$$%.@$.$%.@$.$%@.$$.%@.$$.%@-+
         +-$$%%@-$$%%@-$$%@@$$$%@@$$$%@-$$%%@-$$%@@$$$%@@$$$%@-$$%%@-$$%%@-+
        ASSIGNMBITFIELFOFP_EMULATHUFFMANLU_DECOMPNEURNUMERICSTRING_SOhmean
  png: http://imgur.com/Xu0Owgu

The fact that NBench is not very sensitive to changes here was mentioned
in the previous commit's log. We get a very slight overall decrease in hmean
performance, although some workloads improve as well. Note that there are
no error bars: NBench re-runs itself until confidence on the stability of
the average is >= 95%, and it doesn't report the resulting stddev.

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
