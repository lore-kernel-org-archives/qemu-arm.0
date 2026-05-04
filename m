Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C469FFF885A
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:53:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJvZs-0000yX-O7; Mon, 04 May 2026 11:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZr-0000xb-Gc
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:23 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZp-0006Dd-SU
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:23 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-900fa9f178dso191343985a.1
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777909881; x=1778514681; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=seR931FbrhAdb+NYhAMGgy6RPmH0udBjx5jaRmN1ITA=;
 b=Qhfm84CAQWS9N7Loi2NByK6AG3ZtcNFUfIeK9omwsWMKRn3RvJbdWfgFSbps9+xxxJ
 p4IVbNePAKXQews+v7Yg3ZFhuEmf5QD+ekfNvltBQwHIRyyLYgxTeeHJgNJ7qMeF7aqB
 JKknViiUBObau8em6Kl5FdqPNKYvChpLLWDIilb62DfloTVBcAw77639PD3FKV+P5iZK
 0bH9YCqIVUOafQZlCUVOQV1eIclNu0zJS3FJ9nYrcy7OOQ+HQ/vts6ZGp0NhjcJHyRBT
 9WTqFcoKsQDb3jbDecPuw/a9NDD/qLz4MvO7x2bdJxmMmuYv/4qkStKM58tD3lb0Ma5M
 wf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777909881; x=1778514681;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=seR931FbrhAdb+NYhAMGgy6RPmH0udBjx5jaRmN1ITA=;
 b=l+8oR0oI1QEFz3psO9NioWg7NOq3Y6caKAOL1liPT18wagKKfVaQJeRvIa7E8dm0AF
 B6jVC0PUIxgxvR2gZUY3ujzBS013sOjiDUkg3ZzSy8DkCy2cWTgFqZn4FnSfzJVzBPCU
 qgfsXie2vCAJMndlYhQlqsgoQyRkNQ11/emyC4SvxVA3hRbowUcKFI4awSTANiffiSZd
 Xo+XVviHinB+uHU5vn/JwggBn+3IGWaX7hZ1utlTnLVs/QFvFch/5j1fU93xTCi7WfQU
 e8H3JUTz4s0zISH57BwcEgmM9ObsyqwbC+5e4EbyqF8QoM+VfjXvA/LpZhWdF4+3xbsH
 G7vQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9pXMpqFhXdlZsqvcE1cmpqh426uVJRbnB3tR3FGOyGHwUvq20+G/kzN9kS/lyiz1LR9w0XfDuZmQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEwC29cckMLCrkf55tT5tkJ2qcKrXASl+mqSDzZ0BAS8TOXQMB
 Q1+KtqoFyITkJIO1+5KmocYETdTG2hiEz47YPStkC6r1un8gxdGf9ZtR
X-Gm-Gg: AeBDieve8nXY0oCqx6HRALdgpQeM7Xv6IPnPZBczcDj7TXRZz6g0vx+cdzY9hSbnwj0
 cwVOfh19vQ6Xv9NdnaqOPKdmmB3MbqAhVUPax3Xtk61PnflnQRgVLaDPpnOPV801+eMKwGR6/qm
 caDrVi9FzB8t3JcTDG9VuEWANzc6IDopVnjZfHVHdark03nutPl53M6RY8BcKGBm8etBnXr+UhA
 8gb9S3tBFITYMSWLdh1JXUpWubOSbrYZoJPknE4v1DgD4vcLMZxbpjo5uCy+D3sklkdN6ZvMW1V
 Wzf18S8bexlXKkpCY4JpprRRGo+y1H7yH8TI5Ai/+Yd0AM9nvK/4b8ujENCLQJdQ5cS0GGRwxqW
 /Zx2Qammc42/ibN7mwRu0l6G+fq9R12mUD9HahMdAuRoDwnIzMD/jLPRtXq3UbEuC/skkVewmkN
 dOr1oTGRY1gJpugSlg3TwMsEGiZiSG8M49TLGziNZa/K3lSUlqdIE=
X-Received: by 2002:a05:622a:54e:b0:50f:be4f:465d with SMTP id
 d75a77b69052e-5104bf50838mr143748111cf.46.1777909880546; 
 Mon, 04 May 2026 08:51:20 -0700 (PDT)
Received: from [192.168.1.164] ([2600:1009:a021:c665:5296:905f:3e4a:eb90])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51040931552sm99599011cf.12.2026.05.04.08.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 08:51:20 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 04 May 2026 11:50:41 -0400
Subject: [PATCH v5 08/15] target/arm: add canonical MTE check logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-feat-mte4-v5-8-232a648e63c6@gmail.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
In-Reply-To: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777909867; l=3050;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=taM0bnxg3Adu1LAuHiTNsQ5a1pkgBVcVSoxgQ7RpzL8=;
 b=PXd9SOLs+rn6qhmUWlWvmWQWAVLFXXbh9o9n60RMRL4bdcbQfcALc5MMOxfMDTMctJ4H5y8ei
 ExvE4fUmm9aCFso3sEwdLDg4d+v+1Xc/dWwrfr/AbUj31gMayUIFC/u
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

With MTX active, address tag bits are checked for canonicity if the
corresponding memory regions are not allocation tagged. See
AArch64_CheckTag.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/tcg/mte_helper.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 61cdf92c54..d35e3ef04d 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -858,6 +858,14 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, sizem1 + 1,
                                   MMU_DATA_LOAD, ra);
         if (!mem1) {
+            /*
+             * If mtx is enabled, then the access is MemTag_CanonicallyTagged,
+             * otherwise it is Untagged. See AArch64.S1DecodeMemAttrs and
+             * AArch64.S1DisabledOutput.
+             */
+            if (mtx_check(desc, bit55)) {
+                return tag_is_canonical(ptr_tag, bit55);
+            }
             return 1;
         }
         /* Perform all of the comparisons. */
@@ -873,18 +881,24 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
 
         /*
          * Perform all of the comparisons.
-         * Note the possible but unlikely case of the operation spanning
-         * two pages that do not both have tagging enabled.
+         * Note the possible but unlikely case of the operation spanning two
+         * pages that do not both have allocation tagging enabled. This can
+         * happen with or without mtx (canonical tagging) enabled.
          */
         n = c = (next_page - tag_first) / TAG_GRANULE;
         if (mem1) {
             n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, c);
+        } else if (mtx_check(desc, bit55) &&
+                   !tag_is_canonical(ptr_tag, bit55)) {
+            return 0;
         }
         if (n == c) {
-            if (!mem2) {
+            if (mem2) {
+                n += checkN(mem2, 0, ptr_tag, tag_count - c);
+            } else if (!mtx_check(desc, bit55) ||
+                       tag_is_canonical(ptr_tag, bit55)) {
                 return 1;
             }
-            n += checkN(mem2, 0, ptr_tag, tag_count - c);
         }
     }
 
@@ -999,6 +1013,14 @@ uint64_t HELPER(mte_check_zva)(CPUARMState *env, uint32_t desc, uint64_t ptr)
     mem = allocation_tag_mem(env, mmu_idx, align_ptr, MMU_DATA_STORE,
                              dcz_bytes, MMU_DATA_LOAD, ra);
     if (!mem) {
+        /*
+         * If mtx is enabled, then the access is MemTag_CanonicallyTagged,
+         * otherwise it is Untagged. See AArch64.S1DecodeMemAttrs and
+         * AArch64.S1DisabledOutput.
+         */
+        if (mtx_check(desc, bit55) && !tag_is_canonical(ptr_tag, bit55)) {
+            mte_check_fail(env, desc, ptr, ra);
+        }
         goto done;
     }
 

-- 
2.54.0


