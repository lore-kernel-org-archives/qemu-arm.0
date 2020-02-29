Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1318624lfg;
        Fri, 28 Feb 2020 17:30:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwad+M88cr64RBwIr1GONNuoKpJdIFXxMXUgzXiqtp1aR0yxX38uA2KMPMOhmUW/9bTk2GY
X-Received: by 2002:a05:620a:99d:: with SMTP id x29mr7086446qkx.39.1582939822540;
        Fri, 28 Feb 2020 17:30:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582939822; cv=none;
        d=google.com; s=arc-20160816;
        b=GSKd1XRLlY5SZx8HHrqhRI5RjoZOjLFxKSdi5OmZK6vCr2IVOftP+sxK8p/6uGTERe
         DDSnUTLU5Cykc/mHIsip4TY5PQFNO4aM3j65BCkamncLo02GiiThaInqRIttwUvEsp9L
         sReX7KwQ38a2X9C4F/ILNvqEXY2sTW1cFrjaRg3To7Dy5gsDAAASzJgqTNaFBVFmo9Cz
         IDCYUnSvPJ8ZDh6boQqfFgVeMUhyQBLjzkWvs/57dmgCg4qenMY8L48NGa4GtTJvNK7B
         kdKKtw29nRWpm8fss/dnmFmSRYyq3mb0Qsr46pO7WAdatcjk5Q7bbyKVs/AwqJjVWQ4Y
         e+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QpMHNZIbcT5PzqjajR8IDp8eTMJQTzdyuvxjhrMoYDc=;
        b=iIdy5aDodp2w2cmv8JaSmRd8+UbYA8BZk9Lj06TlaCS+3n0NO4R6FsGj1SO5ZStBeG
         UXgGSsQXF3GC2UtXGSVB8T7Ba0uK4eQCrs/n5QIT/J04WBnexR9cwsdGisxB/b/0rk8J
         6QM5U1QHwjEyhObJXWwaDgxyovavs7BNtAY9RVmuJTDj4q99K4zdhAe+YyBxqNFpIUDG
         K2inpTDalNZwJhjyYVSRdyR9hjbN9QrydIlApfE2JqyIf8fs+5AAa7wfyLQc0XQfMjSx
         TXIWsrvDhuwDg4I0x1h6C+cHfWHVc2Z1i3g50FAyXr2S5VqihSiGW56GZQzQdZiWDIsQ
         qyzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YY2Mz0sz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si2207218qtp.76.2020.02.28.17.30.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 17:30:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YY2Mz0sz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7qxR-0000Wt-UO
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 20:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvX-0004ng-Qj
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvT-0005za-Nb
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:23 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:32789)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7qvT-0005yd-I3
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:19 -0500
Received: by mail-pj1-x1041.google.com with SMTP id m7so4734392pjs.0
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 17:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QpMHNZIbcT5PzqjajR8IDp8eTMJQTzdyuvxjhrMoYDc=;
 b=YY2Mz0sznUyzLkAu1ttdhi9ccja2VcdZ72zNGleYvo831HwzPkcs197oPmgr6em6O2
 LZJH/O75OrxN2+rDi1nF+8SgvkWTYd5qQpCArvjePBcriTVbzyLidObarP1f4M1+jcn/
 Y6PhNuae4pAmb56QmYcCVgpy7FzESM3dM7H5LCOStgueezcuczF2mTSszdceXTpUlYN1
 LeupHVsARLhHvRKtTZ7P8LZBoszOakQUg1se3av9J4n95a3xHEMB3joKVLtdQuyH8A+G
 3ED8dUat1+2kN1KLcCFtppx8Jf7p7OxzaZqbTqTQWkMOhCRtjuYNG4ZShvVPj+hlc5K0
 EXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QpMHNZIbcT5PzqjajR8IDp8eTMJQTzdyuvxjhrMoYDc=;
 b=gutcCiFX4TQ0Wx7o+2METuAY54XBOHf97S9mxtm0SE0qlKoTFgRIVN59/t6j/66QoH
 VY3XsEkfGQfEESpfiFK7zBTVYHLqhRbV7iPPkQ1vsQrXFFJ/2pyKiUBoB+x9av8QPf5r
 R9YW/hOdpAa+WYFexS2vGwt8O+gXYCyLv6de9svLeV1IeiB1HvqEo4WNwEekPlhH6C6X
 FUcquqTol0MT4dZi5V27BNO4Wzg5lWHF7Oip7MqPFGP++EIgEH8CpCA451P+Sild59NW
 C36cUPUIDc7GL7ZbAR+hBt2YiIipgnm4vr0F0TfCbhirJBjalRwohOReKEumih6KXNe1
 F2Vw==
X-Gm-Message-State: APjAAAVWl7yR8Wwy2uThca8aKRIrvoFLbWqiRVgesPN+uraLy+AHCB57
 861y/CV82UTqOD/zsa/lmHdCmw==
X-Received: by 2002:a17:90b:243:: with SMTP id
 fz3mr7826522pjb.29.1582939698546; 
 Fri, 28 Feb 2020 17:28:18 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 17:28:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/12] target/arm: Disable has_el2 and has_el3 for user-only
Date: Fri, 28 Feb 2020 17:28:02 -0800
Message-Id: <20200229012811.24129-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229012811.24129-1-richard.henderson@linaro.org>
References: <20200229012811.24129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-TUID: vG+SAYOmIM3e

In arm_cpu_reset, we configure many system registers so that user-only
behaves as it should with a minimum of ifdefs.  However, we do not set
all of the system registers as required for a cpu with EL2 and EL3.

Disabling EL2 and EL3 mean that we will not look at those registers,
which means that we don't have to worry about configuring them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e6016e33ce..33c28fe868 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1103,11 +1103,13 @@ static Property arm_cpu_reset_hivecs_property =
 static Property arm_cpu_rvbar_property =
             DEFINE_PROP_UINT64("rvbar", ARMCPU, rvbar, 0);
 
+#ifndef CONFIG_USER_ONLY
 static Property arm_cpu_has_el2_property =
             DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
 
 static Property arm_cpu_has_el3_property =
             DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
+#endif
 
 static Property arm_cpu_cfgend_property =
             DEFINE_PROP_BOOL("cfgend", ARMCPU, cfgend, false);
@@ -1222,25 +1224,25 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_rvbar_property);
     }
 
+#ifndef CONFIG_USER_ONLY
     if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
         /* Add the has_el3 state CPU property only if EL3 is allowed.  This will
          * prevent "has_el3" from existing on CPUs which cannot support EL3.
          */
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el3_property);
 
-#ifndef CONFIG_USER_ONLY
         object_property_add_link(obj, "secure-memory",
                                  TYPE_MEMORY_REGION,
                                  (Object **)&cpu->secure_memory,
                                  qdev_prop_allow_set_link_before_realize,
                                  OBJ_PROP_LINK_STRONG,
                                  &error_abort);
-#endif
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el2_property);
     }
+#endif
 
     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
         cpu->has_pmu = true;
-- 
2.20.1

