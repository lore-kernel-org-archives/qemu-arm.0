Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2713105lfg;
        Mon, 2 Mar 2020 10:00:48 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuVnY5RJNVOyDy3IavCWUm0oOEOlFJxQHde+R+p5lmbag5wCLx9LBdlLjxXdN9vM6DosYC2
X-Received: by 2002:ad4:4444:: with SMTP id l4mr568116qvt.33.1583172048650;
        Mon, 02 Mar 2020 10:00:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583172048; cv=none;
        d=google.com; s=arc-20160816;
        b=Qwky5pbEQQ2yFHsdCqB82+nLUJEDZDdCfxGGrheQPjpe/lmXMABFCFcdj66tOYst4v
         //GAcaopxQMrXIl6eGYeMCyV5IO3qKoJtz/wOVtFb/tbWFXw3Zz/qadJ3iwkJKLA9mI0
         7u2e6A6PsKPwOoBG4VquKobcfvuHIX20rZ6Ba03X2nlNst00RoGydu49PX+cdu/zCAoy
         bXeSHSD7/gByV4EajAV3k2a/EHwvY2KTZJe0OlT6j9w36phWNIAknElyjLzDlUA0CqKJ
         rZIQtEoRODe/57oO5X3owRHKHCSpzDHGhSUoMogc7NBjkaa1ERHnF1Pt/flHiTvMu+97
         Dw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dr35bRmDl5K2ZK/zV6tEHz3P5CK2kUhrH8hqSGr33Rw=;
        b=HrKCQYLDI6EwoLIVXoqO2FmFSqDtc+wZQyUuuAduPHzgwBcl3JFS2863EQQX4Ja4Bi
         TaOesMyXOlW+huqqEebHDn16Kny2UfMd2+/+kiaei7dqo5t5U0F8yzxkROBofD+7HSWU
         y/InANMSPTBFu+StMgafad8aES+i3mMVj4xOYRgSgXh1frb1t/4h6S314smLrB2sqM1N
         snqT8KjGfjogTmOzOfer+Me1Uot4NKyf0LbtCqGbzPsS4l42cIFLyIkNlb5gdCZZF78K
         /PobnkxllcM7FKVH7U4RoHfJktPAwnopbFBCajnYabPps3cGy28CR43vF4jjoOpvHkWe
         QKcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZJ0/OEYL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si6286888qto.55.2020.03.02.10.00.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 10:00:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZJ0/OEYL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pN1-0002SK-VM
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 13:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pL1-0006ms-Df
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pL0-0007cA-CY
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:43 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43098)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8pL0-0007bd-6t
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:42 -0500
Received: by mail-pf1-x441.google.com with SMTP id s1so73821pfh.10
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 09:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dr35bRmDl5K2ZK/zV6tEHz3P5CK2kUhrH8hqSGr33Rw=;
 b=ZJ0/OEYLqfjbDLH2HPXWjjFaocOmukBiVGnzk0V+U8OA7hE/kfZ68Gr/1lSpMROAFk
 pRJKWCQxNS2/QIjxSFwbS60hW2/8hgQVGzJ+HYitny4NgKJec0USwyK6z0jMVKPHmS0Y
 Sm5ao3zmmc12Nw9vumEe9JcG/wPKSFjiOiasKfYEiTdNoK9JBVX9/LdpttrrDM9B+nuF
 ZDDnG9rMyp4g3fkU6g20pbGSK4pl7siJ3vRDjPSeDFYkR7QTxtBEE1L6w5hwKW9MgCsF
 PQH9aerx8NzYc2WB9Gk0QWHs4oZv+oxICiBhKl+uG1/z9Tm6qbU+NvexHSw74WUWlayl
 doYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dr35bRmDl5K2ZK/zV6tEHz3P5CK2kUhrH8hqSGr33Rw=;
 b=YlBNhQnLPTsarDx/qNcmDLB2STTWG6XNytgeVGwKI7VHHHgyFIqiGvaROtpf41xsIO
 Cse/0WaENtVakLUIEfewKrLnw4TwRAWaT0ZcbVhyMTLMuaCrqpebc1KyWo98vDSxUm4V
 n9fj6i4KDf3Uti+k8+GtwCMtcYfs6tsR3k9rzR0aSeYRo1mN/fNabcznhW9Q9fmRS/5Z
 +bpjaTQtwCBlBKK00lPFuLA4i4VK6P0xa7hzIBfTeXe5mbqcFMTL3kVoebtXOUOsR+CK
 S3WmGXX+gqBSJW5C4txtzqsRlV9RgATQxHXoiN/toJA8UJqug92rKed2LdNeFVwVFLGV
 ev/A==
X-Gm-Message-State: ANhLgQ3Qac56U/74OcxziTuZTbd8HA37Kmr87KuhNLs2aHYyPFU24mu2
 NvW+kBRLdR/67baXmL3kCSYhaw==
X-Received: by 2002:aa7:80d1:: with SMTP id a17mr209275pfn.143.1583171921259; 
 Mon, 02 Mar 2020 09:58:41 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id s18sm99510pjp.24.2020.03.02.09.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 09:58:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] target/arm: Check addresses for disabled regimes
Date: Mon,  2 Mar 2020 09:58:28 -0800
Message-Id: <20200302175829.2183-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302175829.2183-1-richard.henderson@linaro.org>
References: <20200302175829.2183-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q+vTQurgkR3g

We fail to validate the upper bits of a virtual address on a
translation disabled regime, as per AArch64.TranslateAddressS1Off.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index addbec91d8..0ef32d3c24 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11634,7 +11634,38 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     /* Definitely a real MMU, not an MPU */
 
     if (regime_translation_disabled(env, mmu_idx)) {
-        /* MMU disabled. */
+        /*
+         * MMU disabled.  S1 addresses are still checked for bounds.
+         * C.f. AArch64.TranslateAddressS1Off.
+         */
+        if (is_a64(env) && mmu_idx != ARMMMUIdx_Stage2) {
+            int pamax = arm_pamax(env_archcpu(env));
+            uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+            int addrtop, tbi;
+
+            tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+            if (access_type == MMU_INST_FETCH) {
+                tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+            }
+            tbi = (tbi >> extract64(address, 55, 1)) & 1;
+            addrtop = (tbi ? 55 : 63);
+
+            if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
+                fi->type = ARMFault_AddressSize;
+                fi->level = 0;
+                fi->stage2 = false;
+                return 1;
+            }
+
+            /*
+             * The ARM pseudocode copies bits [51:0] to addrdesc.paddress.
+             * Except for TBI, we've just validated everything above PAMax
+             * is zero.  So we only need to drop TBI.
+             */
+            if (tbi) {
+                address = extract64(address, 0, 56);
+            }
+        }
         *phys_ptr = address;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         *page_size = TARGET_PAGE_SIZE;
-- 
2.20.1

