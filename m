Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830B0CD3427
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:54:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJvZs-0000xy-8z; Mon, 04 May 2026 11:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZp-0000wX-Te
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:21 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZo-0006DH-C8
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:21 -0400
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-512f09ecc67so7184831cf.3
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777909879; x=1778514679; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0ay7sf63ql1pC4xkROjc2QEdokR4pUfgyF6xPuvXHyY=;
 b=jpwFhAQA3H8TNCe2Lhuf0sYa58r8ZWVFwhKwdMSkFpKu3jBs7zo0jyyQwoSJJp66CY
 MuIDp3IwkBjbDZgs7XzT/aiLis5tsWWtgctyk/5ZhxIBwCX8Xhdt+AZxgUVfyJv245d+
 1HW8dRGlXWpoU3JTveVyUeloF8AT4F8r6OAu5nAgYpeBN7/jYpiRf6wlcTKoY/q9MXXj
 fMya8z4xfsjZMcJlZ9Z6ANW1f84CqHeK84mDJKOrKTPEATL1wgX7MU4gSGlWPPld3hQ8
 o+FqlEaXhuxrUnDVal9q/pRAAieZwmP/4F9J29NEpYUEAjnVBFwIwh1F5YRROr+wt9nn
 Tdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777909879; x=1778514679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0ay7sf63ql1pC4xkROjc2QEdokR4pUfgyF6xPuvXHyY=;
 b=C5bvGBorb4R5M32VMcstPRbC6Mtn+FRvsH6Rl+uppF1CK/V13ny+efnS4SYdaeXAPE
 55F4O1OJ3pg+eEzlLhafiL8APU8iKTvbmugMb0sEaVgH9REjaHXYDzA6+bt37kJWBAsp
 jtf/47eM+9B524nh61JmfB8/Z3Z8E923119ibHIuk8CeLlzF33q6CFo9W/pFcwmc90Qm
 5J18lvmWW5ODMlgp3vlyK8zLvOqmw/MPSnhS7SlNEBW3pyoFEVnaRrZIQ0WMVMmPpYqN
 mzQu4msMu4FrZ9kg31va41xh9YAsWdjcagCXcq/A0lOExn/QlIXVH/bp9kBFVW5KJJD/
 s5Bw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0EzjnzJTtm0LNMsgO+vgogtkt7puaSb5MjLWdIXM+XUN2d9uYdjaoUv1xCxLFiU95GgguY9FgVQ==@nongnu.org
X-Gm-Message-State: AOJu0YyrZjmK8sceYsQwn9mpQyeM7sEdy8//OPdc3oQ+VVAGBRTfjzjn
 x4iNYG/IyVhNbqgApFGKxY+R9MorGjVMm8sESnzBZzwGSTjXSR9rebKO
X-Gm-Gg: AeBDieuefgS9JuDek1EI3HapOl9r2phqSNIg9zs7e4NzQw2SaxOcNJ4aVEaLW/gAvvd
 GNqLFhbye9OZ8E3cSI4IMP64vDfK1gXbviHYvgFuEGhsQhwsf/yXsOiD5AYhBGznCU+tV3LwHPY
 uAUXZdrQvu0dlP0baxchjCoJ76bjbhiJIjk+RWjvl1ZtJ4kkPs3z9SRhtFTKwkNnh606LxRJ8z3
 5K8LFQSkQcMloH1mRNccFISwhH5bA3boWE7Vo3u+26kMDGruNXm8FqB7EhHIc7M3fBAjCQrAa3F
 nFyP+QEAX+sCnxGSF/cjkz1rgnT/PblEoN2SnWVmLMMyE8UvkvPPkf3ocFRBvmJtkJNCK9SwMeE
 pkIk20Dc2dhFvI36Me0Cb98RkJ35K5DMtWnmHxsxb+HpZJSd41jFSIZ64qB441mxwsCHtHPod4m
 bgGUYx9wTo+Mb++cjgeoe7D/4PrHUj0ODpBuTA2erI1BC4mURUQ3A=
X-Received: by 2002:ac8:6f1b:0:b0:50f:ec27:5d05 with SMTP id
 d75a77b69052e-5104be42610mr172075511cf.10.1777909879198; 
 Mon, 04 May 2026 08:51:19 -0700 (PDT)
Received: from [192.168.1.164] ([2600:1009:a021:c665:5296:905f:3e4a:eb90])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51040931552sm99599011cf.12.2026.05.04.08.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 08:51:18 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 04 May 2026 11:50:40 -0400
Subject: [PATCH v5 07/15] target/arm: add canonical tag check, mtx helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-feat-mte4-v5-7-232a648e63c6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777909867; l=1931;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=jN08kl5XFA9CgTscW9ExtHRwdhxwVdpjf5wqgUQUKtk=;
 b=WqGzwxpPuHocytpfhoh8lD7CZ/MuIC67VGaB9ynLdUiRiOcFSfl5c2s3SCyWcOOaP9d1RpNl6
 +ouCCAjjmCPAIHNCUBGvzQyPsLMalFgOshfYl3mACOX8DgU130ZPcsA
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add a helper that checks whether mtx is active from MTEDESC and a
helper that checks whether a tag matches the selector bit. These
helpers will be used for the subsequent commits.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/internals.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6df2c547c5..779eafabc8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1629,6 +1629,12 @@ static inline uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
     return deposit64(ptr, 56, 4, rtag);
 }
 
+/* Return true if mtx bits mean that the access is canonically checked.  */
+static inline bool mtx_check(uint32_t desc, int bit55)
+{
+    return (desc >> (R_MTEDESC_MTX_SHIFT + bit55)) & 1;
+}
+
 /* Return true if tbi or mtx bits mean that the access is tag checked.  */
 static inline bool tbi_or_mtx_check(uint32_t desc, int bit55)
 {
@@ -1636,6 +1642,12 @@ static inline bool tbi_or_mtx_check(uint32_t desc, int bit55)
     return desc & (mask << bit55);
 }
 
+/* Return whether or not the second nibble of a VA matches bit 55.  */
+static inline bool tag_is_canonical(int ptr_tag, int bit55)
+{
+    return ((ptr_tag + bit55) & 0xf) == 0;
+}
+
 /* Return true if tcma bits mean that the access is unchecked.  */
 static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
 {
@@ -1643,7 +1655,7 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
      * We had extracted bit55 and ptr_tag for other reasons, so fold
      * (ptr<59:55> == 00000 || ptr<59:55> == 11111) into a single test.
      */
-    bool match = ((ptr_tag + bit55) & 0xf) == 0;
+    bool match = tag_is_canonical(ptr_tag, bit55);
     bool tcma = (desc >> (R_MTEDESC_TCMA_SHIFT + bit55)) & 1;
     return tcma && match;
 }

-- 
2.54.0


