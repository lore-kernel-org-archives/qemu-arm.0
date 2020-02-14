Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2200844lfp;
        Fri, 14 Feb 2020 09:53:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxlP8Hcb2pcXXOodPCNeygXqFD4H1aAM4SHdl8bos+1Nl6/Wm1zmHy/uWGH9iSszWvphcI
X-Received: by 2002:a05:620a:1641:: with SMTP id c1mr3619733qko.69.1581702810174;
        Fri, 14 Feb 2020 09:53:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581702810; cv=none;
        d=google.com; s=arc-20160816;
        b=xIXI8Pi20g0+sVpVfxIacUODFXnTvR2Ob2cD+45mliFcw1UM/qdi6RePS4GBuVjlzF
         Y8sxl46ldoPuokVQPKz+Qs2zSb/sVb5zdOia2MlxYQNdsmXC92xPOkeylHHQ1F0k7NYg
         oojIQF+p7LjxMu6CFTuejhLix459jPPR5y6hFqrnxBPeHiHY0u10S/JEggm+1xdBxBen
         e7IZAswbctWWt5IHsIUhcPf/CGxm7DbSzyvTWrHVzDypUHTCXdPt756Pxx2ZvBuoVD4T
         JgVuNAtRgRpC+L05fH53770U5iNz5iS+SkwHZFpHJu6zg38F+Jhe36SJgoCwIQEfn1JC
         uq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5yFL6qJIGrr6vMsTkdaf8oL+HzuN+eqpKkJ6fDD8yLs=;
        b=RocjytWVPQPGiBMblngJ6oaZgY2ykype7LV8W8oiv+8uWHzH6ux+R1mVMhvskRHBmQ
         r6S+Zx3X7MfAoSyCsYwuzQJFD/PwxkSrYPi3CfqwMki4lkDGiof+a6AWJhYiojq1V6lB
         WA92/QEoEBrCVbs2FhFbDgKksZ+reYNBJy/Jzvb+kOmVqemvE6FxsFpNemUsoMOWtGgA
         KOpA41Kls/WiuVJcY4x0uyH1YvB0TwGrCP8qJxmCy9Ot0PBEdkpwBIXNBGiaXD4oZsI3
         mXGzVjVyY3nBTT27tTrrxQzvKScaBD906SwjzXLDRxjOpcRA5onvb6kDMFDSlpcPMp/T
         Vbmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IYCp5AzT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 85si3403275qkg.249.2020.02.14.09.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:53:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IYCp5AzT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2f9d-0001of-KE
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7j-0005qT-8w
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7i-0000jk-8r
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:31 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43205)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7g-0000hU-DZ
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:29 -0500
Received: by mail-wr1-x442.google.com with SMTP id r11so11854548wrq.10
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yFL6qJIGrr6vMsTkdaf8oL+HzuN+eqpKkJ6fDD8yLs=;
 b=IYCp5AzTtdyojqddY7SiOZHntlgKyZ3KYGFsC69DYHBgd6uzM0lTbYhCcM0+E4dxg4
 9ZyceTGxmOGIM3eaQlaWbt6OK1lyhYcVdTT+KY1aRhxDnJdUCrRDCxUQkW4SLkYwn4cW
 Xq9wWEo4kt3UpUi+Or2rVPWLUljpKBY8Jq0A/HitrCP2NuH96gNLzhf2lO+sRBF+VhN/
 3QeeJ7kKFrkoJ3KI1KfC0oxHUGJtzguiNPJLhnnqsayN0RYNCWJy0iM5MF1e+b8JR068
 DBTN7NY5gK4FqFfaNoz80rAsWEUmyG2PBVG2cyhyCRWriWVsup/6QV15gkK3f9fpisNy
 Igwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yFL6qJIGrr6vMsTkdaf8oL+HzuN+eqpKkJ6fDD8yLs=;
 b=bgzFTZ9kFWKy4GjzXDp3zORYkRZjDvQ2QRfj9VB4ny1i4HShqZxCDnqDpCHkBKdNfw
 9HrjBI2WRWDevE8PETVHrjehWKIbyigQVDpjs7BnsIt3NuwtEqasmg+sjnnco5LHG2Z7
 Wi2xIjvagGuuwMauR0SMsg8ew5nG4CIhKgt+8ZeANuOBD2es4SVR3kNuzDgbnschAxRj
 dbt2eKjLnwaULFnfWAqSyXBG3M1wvTUMDDomFgxESw3HtGFjY1EUznpWBR2CXN9v9Q9T
 Vf7FUQc0uGT3Z5g7/bn0Cafa+NOv6Xnv0QXi2GX+7Ix9fxu6kjQmrA4axnSWNdFvlgeQ
 Galw==
X-Gm-Message-State: APjAAAX2TanZpboLAMQEgF9XIDR6ISOx9pzd9nj2Q/ASYPQaJcSl2/Ei
 +w1bBC1Eli+ftbh9WWkPcru22d3/wmA=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr5381955wre.372.1581702686270; 
 Fri, 14 Feb 2020 09:51:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/21] target/arm: Define and use any_predinv isar_feature
 test
Date: Fri, 14 Feb 2020 17:50:59 +0000
Message-Id: <20200214175116.9164-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
X-TUID: kGMoHBkbxs37

Instead of open-coding "ARM_FEATURE_AARCH64 ? aa64_predinv: aa32_predinv",
define and use an any_predinv isar_feature test function.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 5 +++++
 target/arm/helper.c | 9 +--------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7ccd65bdce3..ef0feb228ab 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3677,6 +3677,11 @@ static inline bool isar_feature_any_fp16(const ARMISARegisters *id)
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
index d4ed52981fa..b3ced7f78ba 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7721,14 +7721,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
 
-- 
2.20.1

