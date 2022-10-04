Received: by 2002:a2e:b168:0:0:0:0:0 with SMTP id a8csp1280358ljm;
        Tue, 4 Oct 2022 00:43:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GJMgF5wewAILaAdOnJVJ1jB1zAfAx9601JoBn4ZRAHklR8dAZJRQzihImfY+MlgM88+Ut
X-Received: by 2002:ac8:59d5:0:b0:35b:ae59:c944 with SMTP id f21-20020ac859d5000000b0035bae59c944mr18629593qtf.474.1664869396664;
        Tue, 04 Oct 2022 00:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664869396; cv=none;
        d=google.com; s=arc-20160816;
        b=IGlLT+qqk5XwNWCgvL/Yu0v2mI8HmhgMBBj44MKh6VstN8XdXiUWLdXV49BkKX+4+3
         tZwytkqSjBgYVCyew9VvwVhLSObzoov29/UMShxu87Da6SnjgjfEx+nneieWAiypLOh7
         z4Fg9KRjXmRa8Ipr1q+ebZMfVHWppDBxqA6vWYcHo7Qwn3fidRE0Zoux/yzjDjJkRLh9
         4mMUAyPYLHTUOJtXGExxXrUdhM14fNUO7BL9JUP32PaWEdO7fuBDd3h/WeOkwBvf5v8Z
         Nhg76tsuPgl/QB6Uv46AWKtx1WjK0QrpwH54woQkCcr7NoLp4dEZQBdKFDQIaouBIkdp
         wgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7KxfoyuFQagqXmavj2v8+0ki0SqsX5n7Mp4v9IxaovY=;
        b=uHjA9nH0/V7IwErwnoVWvuuIfVzOFYUmrbNqu5S82/G9XuaehPvT5lP/JiEX6Jzgbl
         wBuKT+aPedLrjJpabmk/uZJufOgUpO3AsYTH/AG2tbL1chg0LKdJ7m/3Zh5DSxAFhuCr
         R5f85hARb2bMVwRBJXK2xn5Ps1UBWAZ4EGgNUabBUJdgpkpu9P2eAYYghjGSoaRtyN1H
         4xFeUjFy7EkyJB8du/tfR8/Xidc25rJAZGveZ8iPpFB+PopVRU8hCaGLUA2CLwwIkb9m
         KnvRaSsnjWio/f/H8W1nlWDcfJMfDBTLrOwAcMxLCAhJdSOmhfF2I3dkP6LUTt5J7GaO
         Ya7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZLBACt6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf18-20020a05622a401200b00354a03e4988si4932589qtb.753.2022.10.04.00.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 00:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZLBACt6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofcaA-0002oY-6x
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 03:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1ofcHu-0001EV-Is
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 03:24:25 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1ofcHq-0003Eb-UR
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 03:24:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 i83-20020a1c3b56000000b003bd44dc526fso238660wma.3
 for <qemu-arm@nongnu.org>; Tue, 04 Oct 2022 00:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=7KxfoyuFQagqXmavj2v8+0ki0SqsX5n7Mp4v9IxaovY=;
 b=qZLBACt6mWa8u7TbH1WkNZQhfKHmG+tPM2AvaUb52kdYE9dICPe019AqcwwIPm3mkA
 eYI0z727VbUdK2QZVpAlFOSIBzbAVJygm//xDtBoow3zBk4olJI3zfwO4Zco5uYM8Xkz
 twmFphDw2uiiaLBgzwGBKCbHtiRMljXwRC7K2HCTCqMlgWMEInU2FfMNTFVA3C3g/Po/
 EJBBRKneP7cWXO9ci/cUrZnfmEdx5ucuC5A6NiMA6pI09lEYgrgo0QfNfA6a00kXRLfr
 cwpH1COpoiR7QmRqXILGQ3a+HieoEDK/w/Shl3jL9zKtLGlS19kz/nqj7Yv0KK0PYNYY
 NosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=7KxfoyuFQagqXmavj2v8+0ki0SqsX5n7Mp4v9IxaovY=;
 b=XG1bhnQqLEdm9To3ACXE9zDkn4egMlpYk+TxuUpDO1jDyEb3cA1yE2eyqOmg2SBFCg
 ooiyKrpPzWni+IvnG9Ak/7P3RQclQ1iF8CsbncgEqCn0h2oM+PEJeUJJekRH7UsK1f8B
 07Vw6UrfBy7CyXOMwNtCqp6wo65oF7NQWvSTeMqVeDgYgS+2Y4HEr26eCmuik0HKkdR2
 ppBJHtHobedz/AEOxijDrBZvsFOvNbPyrkI/x6FPJ5s5UCGdh3jeZsjUfhPQ41ZEbSfC
 tgpKhO54p3mvPsZJRPZiJGhQ3jsEvT4PKMxjtBoQt5vIJI2GEBpW9vGewznYNwxdcu5v
 TB/Q==
X-Gm-Message-State: ACrzQf0jQr1PuJ+DqKPsiveD9/zQgBZnM2hC+K4HCzoWFveU3e5PoqPF
 SDIdQ1YMlz7/2/CsSH89/FHE2g==
X-Received: by 2002:a05:600c:474a:b0:3b4:cb3f:2f5f with SMTP id
 w10-20020a05600c474a00b003b4cb3f2f5fmr9186883wmo.8.1664868257123; 
 Tue, 04 Oct 2022 00:24:17 -0700 (PDT)
Received: from jerome-XPS-13-9310.localdomain
 (laubervilliers-657-1-83-120.w92-154.abo.wanadoo.fr. [92.154.90.120])
 by smtp.gmail.com with ESMTPSA id
 t187-20020a1c46c4000000b003b4a699ce8esm18795936wma.6.2022.10.04.00.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 00:24:16 -0700 (PDT)
From: Jerome Forissier <jerome.forissier@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jerome Forissier <jerome.forissier@linaro.org>, qemu-stable@nongnu.org
Subject: [PATCH] target/arm: allow setting SCR_EL3.EnTP2 when FEAT_SME is
 implemented
Date: Tue,  4 Oct 2022 09:23:54 +0200
Message-Id: <20221004072354.27037-1-jerome.forissier@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jerome.forissier@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZwnsEz161ZRL

Updates write_scr() to allow setting SCR_EL3.EnTP2 when FEAT_SME is
implemented. SCR_EL3 being a 64-bit register, valid_mask is changed
to uint64_t and the SCR_* constants in target/arm/cpu.h are extended
to 64-bit so that masking and bitwise not (~) behave as expected.

This enables booting Linux with Trusted Firmware-A at EL3 with
"-M virt,secure=on -cpu max".

Cc: qemu-stable@nongnu.org
Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 target/arm/cpu.h    | 54 ++++++++++++++++++++++-----------------------
 target/arm/helper.c |  5 ++++-
 2 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5168e3d837..d5e9949eb6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1653,33 +1653,33 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 
 #define HPFAR_NS      (1ULL << 63)
 
-#define SCR_NS                (1U << 0)
-#define SCR_IRQ               (1U << 1)
-#define SCR_FIQ               (1U << 2)
-#define SCR_EA                (1U << 3)
-#define SCR_FW                (1U << 4)
-#define SCR_AW                (1U << 5)
-#define SCR_NET               (1U << 6)
-#define SCR_SMD               (1U << 7)
-#define SCR_HCE               (1U << 8)
-#define SCR_SIF               (1U << 9)
-#define SCR_RW                (1U << 10)
-#define SCR_ST                (1U << 11)
-#define SCR_TWI               (1U << 12)
-#define SCR_TWE               (1U << 13)
-#define SCR_TLOR              (1U << 14)
-#define SCR_TERR              (1U << 15)
-#define SCR_APK               (1U << 16)
-#define SCR_API               (1U << 17)
-#define SCR_EEL2              (1U << 18)
-#define SCR_EASE              (1U << 19)
-#define SCR_NMEA              (1U << 20)
-#define SCR_FIEN              (1U << 21)
-#define SCR_ENSCXT            (1U << 25)
-#define SCR_ATA               (1U << 26)
-#define SCR_FGTEN             (1U << 27)
-#define SCR_ECVEN             (1U << 28)
-#define SCR_TWEDEN            (1U << 29)
+#define SCR_NS                (1ULL << 0)
+#define SCR_IRQ               (1ULL << 1)
+#define SCR_FIQ               (1ULL << 2)
+#define SCR_EA                (1ULL << 3)
+#define SCR_FW                (1ULL << 4)
+#define SCR_AW                (1ULL << 5)
+#define SCR_NET               (1ULL << 6)
+#define SCR_SMD               (1ULL << 7)
+#define SCR_HCE               (1ULL << 8)
+#define SCR_SIF               (1ULL << 9)
+#define SCR_RW                (1ULL << 10)
+#define SCR_ST                (1ULL << 11)
+#define SCR_TWI               (1ULL << 12)
+#define SCR_TWE               (1ULL << 13)
+#define SCR_TLOR              (1ULL << 14)
+#define SCR_TERR              (1ULL << 15)
+#define SCR_APK               (1ULL << 16)
+#define SCR_API               (1ULL << 17)
+#define SCR_EEL2              (1ULL << 18)
+#define SCR_EASE              (1ULL << 19)
+#define SCR_NMEA              (1ULL << 20)
+#define SCR_FIEN              (1ULL << 21)
+#define SCR_ENSCXT            (1ULL << 25)
+#define SCR_ATA               (1ULL << 26)
+#define SCR_FGTEN             (1ULL << 27)
+#define SCR_ECVEN             (1ULL << 28)
+#define SCR_TWEDEN            (1ULL << 29)
 #define SCR_TWEDEL            MAKE_64BIT_MASK(30, 4)
 #define SCR_TME               (1ULL << 34)
 #define SCR_AMVOFFEN          (1ULL << 35)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a..5cde8a0425 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1669,7 +1669,7 @@ static void vbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     /* Begin with base v8.0 state.  */
-    uint32_t valid_mask = 0x3fff;
+    uint64_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
 
     /*
@@ -1706,6 +1706,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_doublefault, cpu)) {
             valid_mask |= SCR_EASE | SCR_NMEA;
         }
+        if (cpu_isar_feature(aa64_sme, cpu)) {
+            valid_mask |= SCR_ENTP2;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
-- 
2.34.1

