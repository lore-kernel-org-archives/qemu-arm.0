Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1093530lfg;
        Mon, 24 Feb 2020 19:17:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhFufWN/Qc3CsRzzMfGYMIMfN7h5ZTnb8KRX/U1VRN4KwPgviqlmUVFoW5UuxJTCaMUOUh
X-Received: by 2002:a37:a8c3:: with SMTP id r186mr10460998qke.37.1582600624622;
        Mon, 24 Feb 2020 19:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582600624; cv=none;
        d=google.com; s=arc-20160816;
        b=XHqFxlpX1Kk3WlumbWqzjvQXKk37NLxzzAz1hJ6zWvuA8KxPjv2e8reaNgjn3kyRhn
         xvaETShqtY1DAmftH3gUsGAXbluq46Pwmrh+q5/NkCaYCv9vPHTmejsZul31sMI8i7MN
         Xpme+azXML9849dB3Ptqzm+cQ2kDyPEYKXmCaTUafkDljNYw5r/V21OskLUCjz5C0Loc
         gr1Qiqz+iC6gWsfnxWW+gIhnmc4zIzNw1ULIO4gtEEUayyXxRi1R6mCbc6a06bGq3wHj
         XB7nLD0dMgrc6RPe5sTsdhyAKVSTAvEdbPIeqzKSqLKTh87j4PMpwjKfaetFhgKALT9y
         382g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+H7GpCgYZHS/IW315wViv17HgfT/NtNKXlKqXRLBSps=;
        b=xf9PqdSrJp9lu6Yf+pin5eNw1xJeuCpHUI2ROTl5fb+iqwua2siHD2LdOozi4s+Xxb
         cJOAx+hRLRTuvxQFN5aVA+cKzQzWRGHPPUKf5KD4O1Da4KdFHubG7smdMBxKgXuiFPUr
         QQEgSQZilo2zKBf8LxFn7j2ep/i3L87GR2QNcXqMt9cvSDrb2glUWdICIJ2Tp3wSksV2
         kxEW3PmlHY4wjN4YV7GuRrFOxrz2pUTsHAamoRgKr2rWI9FFim6ipbBUrl8tYfSpxB7D
         T+ZyRYP5Ig6WKcJhcH93nE6OaHLZF+k4NrTLRceprQ+Shjj3NgxwHMNIWi88kqu/H473
         PDww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Te07B5xB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si7216986qtb.401.2020.02.24.19.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 19:17:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Te07B5xB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6QiV-0006J8-VS
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 22:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46471)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfw-0002ya-QH
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfv-0005Na-Ra
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:24 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38480)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6Qfv-0005ND-Lq
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:23 -0500
Received: by mail-pl1-x643.google.com with SMTP id p7so509368pli.5
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 19:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+H7GpCgYZHS/IW315wViv17HgfT/NtNKXlKqXRLBSps=;
 b=Te07B5xBZN1kP0q1x/cXkOyyjpYcyqFvd2MnJaUsHPx/z462Mr9BigvmgCaxVwSHjC
 7bilDqYP2cdo5M/W6PRdpwSF2rKCbjhGgReQS2uU/Rph6IV79bz3xRALh86X4U6XBMMw
 C2m7CGgiPOadoIGTPeS3Qxk4aDKFUB7+8jZCpuEIJqTjtz7ZGEhyGi7oxAMjuFITZwLA
 chURZGnTLA389QWQ5HxUY3Tv7WuSbMmmSFyp/BtWd3MQmA/JX1JNihtSSib5nJjDOUn6
 xy4Yye1JTPAkzWUJl6EMvLZbiOFr/YC1SlexMUwSotk8lFg0UyfC5rZahmHLUCoi9LfQ
 9MDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+H7GpCgYZHS/IW315wViv17HgfT/NtNKXlKqXRLBSps=;
 b=VMFXUGdDwI/FLc2ImwvTYikXgU8P/wp6cgLWxy6qVgRiyKezkXs0WZRfdQ3/FidR2a
 z/OLr5IMLwpqgrNv8JbpUj9Xzg5wNx0sJvWoQTKTvaleaByCDyqECMFhlhb041Jm97Tw
 tsk7wE3fEVzqUhTHtORGco7XZn6xrnHNaN7sJe3cZexpS4dlOMiaLRmxUBpTKjtxw/gf
 auqs0oqmy2/G2UEJ5KBO7ROcs1hlm+jOQ67fxQ0lFH+iyR3ukkTvJnsVeRXNCKl1Okly
 cYJEvDlnXp3cqZmulE74cEGP+Z7zWhVOQ9lokPVsW/NVW6ARxucq+disBLtQsdxGNwrw
 NwTQ==
X-Gm-Message-State: APjAAAWYysdILzr/eO7A5ca/EMU82s3I7SyFlRH7Dx9bnap99DAwYT35
 o8P6jP71xLdmW7krxEoOmLJNew==
X-Received: by 2002:a17:90a:af81:: with SMTP id
 w1mr2741808pjq.14.1582600462711; 
 Mon, 24 Feb 2020 19:14:22 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id q66sm14975242pfq.27.2020.02.24.19.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 19:14:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] target/arm: Check addresses for disabled regimes
Date: Mon, 24 Feb 2020 19:14:13 -0800
Message-Id: <20200225031414.15649-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225031414.15649-1-richard.henderson@linaro.org>
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-TUID: MJF22IV78ryR

We fail to validate the upper bits of a virtual address on a
translation disabled regime, as per AArch64.TranslateAddressS1Off.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7cf6642210..2867adea29 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11615,7 +11615,38 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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

