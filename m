Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp481028lfu;
        Sat, 30 Apr 2022 23:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2HmAPjYjBFrFjkrELVxWIBqT0mVsIeDtNygOeECsgfj8Ukkch4Sz6iMi+wukZg84lM35X
X-Received: by 2002:a37:c85:0:b0:69f:cdbd:a1f with SMTP id 127-20020a370c85000000b0069fcdbd0a1fmr2221195qkm.343.1651387217071;
        Sat, 30 Apr 2022 23:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651387217; cv=none;
        d=google.com; s=arc-20160816;
        b=ZetmuC7gZHMI2dbam5GUUXwY5yJn4uL4fYaVevH87QZPKhmai9wjibvXO4PWSbLW4s
         n9qecTRy2JFu69IpDAIxZs0bIfdwILQ0XNaBSxOUBay/kvyyRrQrJf0oumfWUQaeEd30
         qbqEZL+2ysjqDn7x7SJMu8THRCKctf4Y9eCjIjB0Md6fdbBtF4gdHFZ3aQvKPgFYGXGh
         wcQ/QVXwtnrrIk/u9QMo5QZKYY7yaj7CSpfazdj8YRS2Lznj8+T3jaTn61CVBjjIhC9o
         bOqfJy8OELA0ydb0UCrCbWgi1b26YsI+8ouXcFe9Y3soGkAP0gM0J5SLJpLA3BUWiMLN
         Vp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=89Nxo79E/u1S6zfSk3J+FzT8WNvYQHnxRQfRBu3u2Wc=;
        b=F+B8qkAp4xquNPrHgQ16vsDzTSzF6YOWZGyi1tO637rBUQ1qIgt9uEO5ex1Bk/4J85
         cY+H5i4M0jpGaSpg1TkDrJuzFCASgdMThwLAr5xIuAKGBbE8PRy8PzdRUMtWE1BZN9pj
         9RRXqMFDX0UGkDo7BpXUzD+NKB5+Pb7E86qXs4+poyurAC2v0cIac/eZfvR5L1YmNMs9
         kJr1x3cWx5ttKzt97iEXpRlTcbDyspzppKEMr8SkYcze7hIsJL6G/WQSlcTtWQDwsc+L
         QUnNt6cFPd7z3dSMGIp9CNkqk3Eodq3NC9/pS2pZicoOP8tbKbmfil85dnDJWEMVJL2o
         un0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oal+3fOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a0cf443000000b00443dbf49046si4810109qvm.424.2022.04.30.23.40.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:40:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oal+3fOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl3Fg-0008IA-GH
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tw-0006th-OI
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Ts-0001Kg-OK
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:54 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so10595941pjb.0
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89Nxo79E/u1S6zfSk3J+FzT8WNvYQHnxRQfRBu3u2Wc=;
 b=oal+3fOqvUiwxZaObLoAZyPYnfFMUoUk/FOFXzWZwdovXCG4xyYjg1xzTJzGSIWmof
 BLn+iDV0z3LkFdIotC+PRL+q0YWVJ1hTZuWpjfuQfqSmajubWQuaFx5Ud8tppfys2/47
 hJJP2c1rbwIHJ19s+zE3CfolCT6KAqa13qN0MmC/1l5+dICaXev1E93iBNU2q4LoVdoS
 ZA1fsW7Gc8GUZrdXl5o1mWMJhVHTrCshXGhuI4kQs74MTImWNTgxNZWqQMOut3KQrjXW
 WRlOOc4JFFkWuUCd2fDqK/RZSNFm4+oA5Ps9wIaJJqiex7sr1Yc2/laIPpHF8RJqUfHh
 +skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89Nxo79E/u1S6zfSk3J+FzT8WNvYQHnxRQfRBu3u2Wc=;
 b=kdBJQYN9hHpBYNpn+V66C0tcwVDUGIgm4r1uqt+muMIgJhO7eNFIN3ariMOXlrGuUA
 YJn8V754OEmjRGdP1PJJjtc09lQAGDoRqI+0rk0tiAyVGYyePFphu6PuzDem3OGSmoCb
 4qYGXNhy/xoMePM9MMdzpbHdICmjpGq43JlNbCI/eScsXCXvYyCY5nO1yBAz6osUNImL
 +yIzr7eKH3B7JxjIgxxoKtihWM5zMJdOUSsIFbU++RVIt3bHvAwBKnSFHtWvz1DeHyrm
 Fe7xXqdcvuEQC3NVV2T5iwjF1bGBtYXQPG/i8UFLZWO/0A6nsGwVGzRPUyWk+WIu/6VA
 eozw==
X-Gm-Message-State: AOAM533UsdDXg0OZDNg7cHleQaXBQaT9lQTOzqsWGmHz5BGF5mm+HtpE
 9EmuWtm6AKIbb+KHyTuiRFosgQ==
X-Received: by 2002:a17:902:d709:b0:155:d473:2be0 with SMTP id
 w9-20020a170902d70900b00155d4732be0mr6044014ply.151.1651384251552; 
 Sat, 30 Apr 2022 22:50:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/45] target/arm: Add isar predicates for FEAT_Debugv8p2
Date: Sat, 30 Apr 2022 22:50:05 -0700
Message-Id: <20220501055028.646596-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: scpfjJOCxIFP

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d1b558385c..7303103016 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3704,6 +3704,11 @@ static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4010,6 +4015,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
+}
+
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
@@ -4093,6 +4103,11 @@ static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
     return isar_feature_aa64_tts2uxn(id) || isar_feature_aa32_tts2uxn(id);
 }
 
+static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.34.1

