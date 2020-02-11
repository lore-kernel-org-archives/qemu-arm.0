Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5352908lfp;
        Tue, 11 Feb 2020 09:37:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQDXD12PxZYYzgru+xcRW3LSB4+uiW3sRssYo8+hetVWvK3F31Ydb5A9RkqvUEoXQOcz7a
X-Received: by 2002:ac8:2939:: with SMTP id y54mr3447277qty.109.1581442674823;
        Tue, 11 Feb 2020 09:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581442674; cv=none;
        d=google.com; s=arc-20160816;
        b=iMxmIDNxrZH4OpPpk8yz3mjZ1y+yuLprdojDMtq2yB9OcsSF6omaq7Zux9WygrrWzU
         lN6Qqj6jXNEjoGhAcqkEMtAciSvmvBGQtCY46wqikXPQEzFhVH69XjY0BOwtOkiux7TY
         jHQh4VunYH1rAk2FPpKWFSdEbP6273PcOD6zHDjy9LwxF1fpBA4i0hoeB8lHOzkEfv69
         N9NUrE2c1acYeDYw7aFb4ykcuCUq8AQ+rs4RO/zE7VAgltlAEk4yZmJaTmRaZT9/RiGg
         Rjpue/3h4GAIS9Kd9WWlTacdJKKaX8E9NlJ9vhSHns49ja96YXgeLTrSBirukxbtAk2e
         bthw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Gu4Ok/18d9t4bS+gGDbkd/ibAEuGshhJuDPzFWbBLFg=;
        b=cJgR+5q6keIa7QZ+IFyOrIEfdvpL3wesKByfFdi8mN72bdnfdM59fEHd3LtXJjlIbO
         Yo86EOyW+gi+q7LWOluqF/WXdVYiHynh1lX7JdmbZPLtjruaiOoUXWUPuhwUfGssZdm3
         RoZD7EZrsezLTsgDu2BsIzcmy4q8gGDmg1vcK0VPbTt8xJUbrEnbykKkMXsiqlFZCBTx
         3/YOz+P9FFLXu9MXAK2P2SA3cn9mfEvtdP5ybMm8N9Gbo89JM2RZut9fKX88U8S6SDxf
         hwgFVbbAxNvCu/p/BKXZV3+HazPYciGk2bxDuY0h113O4kTBg71w7Spbi35lAfMOsq/J
         RvuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QeptztjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j25si2182688qtp.306.2020.02.11.09.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 09:37:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QeptztjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1ZTu-0005lQ-6h
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 12:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTh-0005hK-89
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTf-00043K-9m
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:40 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40396)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1ZTc-0003y3-F9
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:36 -0500
Received: by mail-wr1-x444.google.com with SMTP id t3so13488450wru.7
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 09:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gu4Ok/18d9t4bS+gGDbkd/ibAEuGshhJuDPzFWbBLFg=;
 b=QeptztjYmsEtwOMPBO1gx3GM1omBAVUTTQiGSINmsShZFPYKPIFkS8QWky51611EO6
 F8MRQmNEOUrP52u6mOqMNBTHXF17GU7r6dcLzcxe7DoxvTCoid1RyLaMmlnbwoh3xMeH
 cclwaFtf3ZRlHQboaoISYlUxVk/1S0DX6KINECo7VvlGrgyu0YISVbLYLeuOR6kUnw9R
 +knYmlTyBoHMr6itQR4rxKbvhITXE82ElRcQi1cp6tV8AsXPs6jyR4+AoO/Q6o/93jLl
 sjopF2H1WKFNKVz7gRJLyleSO8NB3MhT9TdONFtAWOtUPiTUKB5yn/wjd/bPVYhW1wnA
 gRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gu4Ok/18d9t4bS+gGDbkd/ibAEuGshhJuDPzFWbBLFg=;
 b=SrbuDDzdrjsSOtlPUi/+Cq87gCZKUt08HTGD6hjvCtKtoa/BSXPoUvncGPooOiRZwG
 2pwNVGReThRsi6HIlVYvUrEhmWmqp4hCgFSzQccKUZffj2UsXefZt+Y9wKxRQqc6lXWn
 yNNTh9Xo1z2JNnj5uFejI2LXi1Q5IKwlOSrEqwWW10TbhVBTd7YKTFtWPjfudE1PgL1e
 0hRSo9DvCyp5Dd+7uGoJ6ZWOFKsAiyNaxBPMZsPNJOnkN5ucEx0w9uM6xlsS+DVIBX64
 9LLxJc5mxE4rNVAzqfS8N5ePokxI5MevsgCu6Ggak+jDG4oX9nb6Lz/Q6CylTkHT3eKX
 UZAw==
X-Gm-Message-State: APjAAAWNIoPUKKDkOkjioauT8qmKtGdPBfIICi2QaTYiDHRUzoUgeDIz
 g3i4PiUlRfCNGVgujdHuViMx5wgDJlg=
X-Received: by 2002:a5d:4b03:: with SMTP id v3mr10073902wrq.178.1581442653418; 
 Tue, 11 Feb 2020 09:37:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm6109675wrq.16.2020.02.11.09.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 09:37:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/13] target/arm: Define and use any_predinv isar_feature test
Date: Tue, 11 Feb 2020 17:37:16 +0000
Message-Id: <20200211173726.22541-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200211173726.22541-1-peter.maydell@linaro.org>
References: <20200211173726.22541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ki77ojYX8dmP

Instead of open-coding "ARM_FEATURE_AARCH64 ? aa64_predinv: aa32_predinv",
define and use an any_predinv isar_feature test function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 5 +++++
 target/arm/helper.c | 9 +--------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ac4b7950166..b1f3ecfd942 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3719,6 +3719,11 @@ static inline bool isar_feature_any_fp16(const ARMISARegisters *id)
     return isar_feature_aa64_fp16(id) || isar_feature_aa32_fp16_arith(id);
 }
 
+static inline bool isar_feature_any_predinv(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_predinv(id) || isar_feature_aa32_predinv(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ddfd0183d98..bf083c369fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7116,14 +7116,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #endif /*CONFIG_USER_ONLY*/
 #endif
 
-    /*
-     * While all v8.0 cpus support aarch64, QEMU does have configurations
-     * that do not set ID_AA64ISAR1, e.g. user-only qemu-arm -cpu max,
-     * which will set ID_ISAR6.
-     */
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
-        ? cpu_isar_feature(aa64_predinv, cpu)
-        : cpu_isar_feature(aa32_predinv, cpu)) {
+    if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
     }
 }
-- 
2.20.1

