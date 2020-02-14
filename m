Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2199439lfp;
        Fri, 14 Feb 2020 09:51:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqzBWMqbEOLtG+sZ14AO+dq9iJv2sDq/6Es3Z5X8AIglsKzj8C8GNkioOjNLd5kxe+p4jMY+
X-Received: by 2002:a05:6214:3d0:: with SMTP id ce16mr3254705qvb.72.1581702718703;
        Fri, 14 Feb 2020 09:51:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581702718; cv=none;
        d=google.com; s=arc-20160816;
        b=YWNCT4JRVLgfXHBfkVDpxYzS7GU5pSceY6/6HuRGyr2NJaYxTUh7D0l8u5KTKycsr5
         HhHTeyNZ7KpqILeR40agRd/K7gKiUVLY2eFlYcyxLyc+LX7getd+FtDUFKfh5iH/vLiC
         3oRYilIz2WGlJDdGdipcch0MLnc9s4TN3RWY2HvM+vkk21idMy1AzTLFFB+ZN+sir/DQ
         9kTau8uyBvfaNF1/fKXUU7Mhbmqw4Xhgmr2gbH8tQfz5F1zECp2YCcCX/ex7ahPRDVXi
         ha5/eieZ03revayQl5sB8oyFgXQ/roTwLo0q90M0qm4fjBC3dsScfZlykyF4pOOf7ccm
         KnMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=s9mIaxlTRZ5zTlxqg89/DuL6snOn9SxxzOctwBKWPcM=;
        b=Gp0THsauQBEztezEcncfsRJq2VOzJM3aIm11i+79jVRoiebZRVaGXC+uVHfwiMgIfi
         8fp43IkfmtXOrZiXR/nKt3GbYR5JeNzuh5TgIxywnQSU5TfjqFtS3nsTX2Kun9n6xgVy
         8WUL3ba2V76yY2BJDLzcjAh12b7BHtJRwJ4sHofFLSPVvwOACwAspqcskbHC2oPdGifE
         K2ZZQVezlQt5Z7iMHAwDOkHBRTKwxx5hr00U7WBcZ/bRuruUm9YWVfMkNA4M11uHS4ZT
         z2BJ/mA3KpAOYuOWUOoShYPOFDfEQD0Nug9xZ3/irLyBlRU+ZH+WV2UTSOBjVm66FIBO
         LBtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PhLe/1C/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25si3385895qko.367.2020.02.14.09.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:51:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PhLe/1C/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2f8A-0006Lz-35
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7g-0005nP-FT
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7e-0000hH-LS
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:28 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43005)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7e-0000gW-Fo
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:26 -0500
Received: by mail-wr1-x42b.google.com with SMTP id k11so11875659wrd.9
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9mIaxlTRZ5zTlxqg89/DuL6snOn9SxxzOctwBKWPcM=;
 b=PhLe/1C/I4v1Cb7dLryZk3KEi9Tx4DFExGHh+uNYmxxFrcafekGoV1iDQuzOakfQJ+
 uGxbwW7t/RF1rVsKcRkicSVdQ+LUklRjDNC4+AWLRG/TQtp9zemkgY3Z5TGWc06pqxpH
 dlgDpt+ONIXr1Cjp/x5Qn9ojeg86YfAySpzkI5fC3ctCGiY8jFCkzy0hN0zNy+uNjkUW
 lIjA0qk0/lHEvOSRnsy9rMs5G023FJYesKQtnCxJmUvwcFidJXdDM44p0jBM61i8goLd
 +SXYTrONEvP0zL+dm4VJG4jbdroH9kTLZJu3GcJ6UFhGNtjHWc9s/k5j7Opno/0jN6gC
 SUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s9mIaxlTRZ5zTlxqg89/DuL6snOn9SxxzOctwBKWPcM=;
 b=RsLhMYT4P1YOUqng5VjLwW1he+5LyYmsfEe+PoAw6JUVY56iM9du+gS8l+bYStac/i
 JxEPJ6k7c9U/uzMmux4WxrmS06Kv3GnDjO2yoJc+Vc508ggqPP5ka9HlLgzDULLURW7L
 +ZLhvTycIZn3csOf9BWDysuI+wNSRoA5t12uCFpj/SteRDzYWVbi1lFJDlZtB36bgTt+
 uYPmOd4+r69FoskpIgn0v/SaWhS0j1+/+MeRO5mVggE3OAKTqmaXzeKtJFALVlEaZPTp
 VfEAfIGCeHI/McjN3rx0k4SC7iuYCL/bY3R881q3xDMghdl48+pbDkN87TOXAG+1+wS8
 mjaQ==
X-Gm-Message-State: APjAAAUnXCMf0XU0f8n5ZEV6IjiZvdJdOXO6VPWgvi7n91ZnueoH4fjD
 VbIcTKj4M6l9WIg4JZjJpw68rZ4PDxs=
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr5464470wrx.210.1581702685128; 
 Fri, 14 Feb 2020 09:51:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/21] target/arm: Add isar_feature_any_fp16 and document
 naming/usage conventions
Date: Fri, 14 Feb 2020 17:50:58 +0000
Message-Id: <20200214175116.9164-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xh5S8rapwEDn

Our current usage of the isar_feature feature tests almost always
uses an _aa32_ test when the code path is known to be AArch32
specific and an _aa64_ test when the code path is known to be
AArch64 specific. There is just one exception: in the vfp_set_fpscr
helper we check aa64_fp16 to determine whether the FZ16 bit in
the FP(S)CR exists, but this code is also used for AArch32.
There are other places in future where we're likely to want
a general "does this feature exist for either AArch32 or
AArch64" check (typically where architecturally the feature exists
for both CPU states if it exists at all, but the CPU might be
AArch32-only or AArch64-only, and so only have one set of ID
registers).

Introduce a new category of isar_feature_* functions:
isar_feature_any_foo() should be tested when what we want to
know is "does this feature exist for either AArch32 or AArch64",
and always returns the logical OR of isar_feature_aa32_foo()
and isar_feature_aa64_foo().

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        | 19 ++++++++++++++++++-
 target/arm/vfp_helper.c |  2 +-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 37d40e57901..7ccd65bdce3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3328,7 +3328,16 @@ extern const uint64_t pred_esz_masks[4];
  * Naming convention for isar_feature functions:
  * Functions which test 32-bit ID registers should have _aa32_ in
  * their name. Functions which test 64-bit ID registers should have
- * _aa64_ in their name.
+ * _aa64_ in their name. These must only be used in code where we
+ * know for certain that the CPU has AArch32 or AArch64 respectively
+ * or where the correct answer for a CPU which doesn't implement that
+ * CPU state is "false" (eg when generating A32 or A64 code, if adding
+ * system registers that are specific to that CPU state, for "should
+ * we let this system register bit be set" tests where the 32-bit
+ * flavour of the register doesn't have the bit, and so on).
+ * Functions which simply ask "does this feature exist at all" have
+ * _any_ in their name, and always return the logical OR of the _aa64_
+ * and the _aa32_ function.
  */
 
 /*
@@ -3660,6 +3669,14 @@ static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
 }
 
+/*
+ * Feature tests for "does this exist in either 32-bit or 64-bit?"
+ */
+static inline bool isar_feature_any_fp16(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_fp16(id) || isar_feature_aa32_fp16_arith(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 0ae7d4f34a9..930d6e747f6 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -185,7 +185,7 @@ uint32_t vfp_get_fpscr(CPUARMState *env)
 void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
 {
     /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
-    if (!cpu_isar_feature(aa64_fp16, env_archcpu(env))) {
+    if (!cpu_isar_feature(any_fp16, env_archcpu(env))) {
         val &= ~FPCR_FZ16;
     }
 
-- 
2.20.1

