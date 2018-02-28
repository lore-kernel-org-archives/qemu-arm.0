Received: by 10.28.91.67 with SMTP id p64csp988462wmb;
        Wed, 28 Feb 2018 11:36:58 -0800 (PST)
X-Google-Smtp-Source: AG47ELv+6O0vZchj+/kyMng4yK0ak4XXWq5oZhx1dxwjGzBElcyAZwBuRAZbidbjham+a7byGtAj
X-Received: by 2002:a25:a545:: with SMTP id h63-v6mr11823736ybi.398.1519846618326;
        Wed, 28 Feb 2018 11:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846618; cv=none;
        d=google.com; s=arc-20160816;
        b=EEcWjU2vj5kLx9VDt3iU7lS+H8xZ/KUiMK7+HlgmOAZsO5Tw1l/FM3MdhTuW4j89U9
         +MhD+uPAy28QhU5Vsn6c5BKdS/FEbe8j5gj4Tm0SgTfkMEwqqeDrLBGMPyJ3AweW+HLa
         rS4HlOoXZkWMbKitzQlypDtaApqH17yk9a9/t2Tck9Q+McXMVWr7vqKJoeVJxJuyqJYE
         91fkFkMEdOscqalBwFJNkISiJ9gTf9x+cb2G6qg1SBNDGJX93/vdPCqaJ+GNaWBofvBu
         hnYemmFrzBRbWt9Y9LZk29QQ28SHkhz+HUB8sqpH+0XG+4w6rkrfmasItdnuZTQkoteC
         cG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=mQkoNHAW8gt1UnT6vN1GNxitBesZm1YW8MnE7dIye3Q=;
        b=weC8Jpvgsc4qR2iqehc2L8W1/6u9QpUlBN3J6qTgnRLOqXlFAnNoXg7XaJEGhZ5RN/
         vxydIk/tcTOJlojZ700lbFvywwZUro2KjSZw+oI1ad/6g1ZaDW9Kw8eccThdmCwipJ08
         2OP9/0CLt0tI5Ap9xSxyZ8vEc4RQu8oZYKwKfziKdzYQB5UQga53i9Rc+l1hypsL1rdb
         JYx3UtcsIWBT7F4COJKGFRXUhAGrgKzopCrtsML8iZ+4RachqyMlHl1k4deecugZux4v
         8V60pCPZXDfImElkcodKbVz695ftDP/0njOuHAg3Sm53x8VlMAbla2Z/TYiVBAc+PSjY
         VBeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eZ2//YmX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x125si367715ywe.482.2018.02.28.11.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:36:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eZ2//YmX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7X7-0007Jt-LU
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:36:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S1-0003O3-Vh
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S0-0006MD-Is
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:41 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:41272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7S0-0006Lb-CO
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:40 -0500
Received: by mail-pl0-x241.google.com with SMTP id k8-v6so2115980pli.8
	for <qemu-devel@nongnu.org>; Wed, 28 Feb 2018 11:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mQkoNHAW8gt1UnT6vN1GNxitBesZm1YW8MnE7dIye3Q=;
	b=eZ2//YmXUQMghhREthF7NmqfRxMsAfFBqLhefH70Vt/4y8zm+WTze3Z9mO3Y1Hsb2x
	M8e5GDrvjoiuR/lzCDs5qvMfNb2WGSEO8C3Td0ilr55eoiiCCUNKrQ2XUp0SQpqbW5zY
	+zH+ROusKT3zU7L3UmK8l1hRO3a09N3AAdXoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mQkoNHAW8gt1UnT6vN1GNxitBesZm1YW8MnE7dIye3Q=;
	b=S9EfU/SiTOmnRfbb2DdUXoq4Ovi3mMjHt9kiFAEuxbdmInYWtAIwM5FS0XTc4cxZl/
	KJvvvqU6tY6upSpGm68GzfggPVCkAeymy1lWtTZV9aSBm045K4vr88HqirRHowruHdI/
	78qiwUkQPe7lqFlLdaauI6UeH4i3W89BHCxR/mPiyKj8N3A+LqgSjeyAHho9B79PxpDO
	p4R7Qv+7dlHv4czSw4d6K9oh9kGbv+njtqi8FSvHn6uYv/p5B1c/YdksmuDlm5/tQx+W
	UnHfraGi2iqy3gBLmIMu1US5E2WQXXsRodDuUYnN7s1xFBGFT7LqlK5cU2/B5+zsTe/2
	ktkg==
X-Gm-Message-State: APf1xPDaNx0H26vGwpaByDidWE+Qz1YB83rihHCpotB1pkIiCyREapqt
	MZipzfn+KUsM2eZAmT/5lRhWKJXiw1Q=
X-Received: by 2002:a17:902:b183:: with SMTP id
	s3-v6mr14381385plr.108.1519846299135; 
	Wed, 28 Feb 2018 11:31:39 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:17 -0800
Message-Id: <20180228193125.20577-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-devel] [PATCH v3 08/16] target/arm: Decode aa32 armv8.1 two
 reg and a scalar
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: crtQ2Miv4ZSS

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 46 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 05fa6a53f9..9169b6b367 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -76,6 +76,10 @@ static const char *regnames[] =
     { "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
       "r8", "r9", "r10", "r11", "r12", "r13", "r14", "pc" };
 
+/* Function prototypes for gen_ functions calling Neon helpers.  */
+typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
+                                 TCGv_i32, TCGv_i32);
+
 /* initialize TCG globals.  */
 void arm_translate_init(void)
 {
@@ -6985,11 +6989,45 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         }
                         neon_store_reg64(cpu_V0, rd + pass);
                     }
-
-
                     break;
-                default: /* 14 and 15 are RESERVED */
-                    return 1;
+                case 14: /* VQRDMLAH scalar */
+                case 15: /* VQRDMLSH scalar */
+                    {
+                        NeonGenThreeOpEnvFn *fn;
+
+                        if (!arm_dc_feature(s, ARM_FEATURE_V8_RDM)) {
+                            return 1;
+                        }
+                        if (u && ((rd | rn) & 1)) {
+                            return 1;
+                        }
+                        if (op == 14) {
+                            if (size == 1) {
+                                fn = gen_helper_neon_qrdmlah_s16;
+                            } else {
+                                fn = gen_helper_neon_qrdmlah_s32;
+                            }
+                        } else {
+                            if (size == 1) {
+                                fn = gen_helper_neon_qrdmlsh_s16;
+                            } else {
+                                fn = gen_helper_neon_qrdmlsh_s32;
+                            }
+                        }
+
+                        tmp2 = neon_get_scalar(size, rm);
+                        for (pass = 0; pass < (u ? 4 : 2); pass++) {
+                            tmp = neon_load_reg(rn, pass);
+                            tmp3 = neon_load_reg(rd, pass);
+                            fn(tmp, cpu_env, tmp, tmp2, tmp3);
+                            tcg_temp_free_i32(tmp3);
+                            neon_store_reg(rd, pass, tmp);
+                        }
+                        tcg_temp_free_i32(tmp2);
+                    }
+                    break;
+                default:
+                    g_assert_not_reached();
                 }
             }
         } else { /* size == 3 */
-- 
2.14.3

