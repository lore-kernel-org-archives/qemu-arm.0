Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp42803lfg;
        Tue, 9 Mar 2021 16:30:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9KQ/ASXL6wOUYkX8+FnFuIb6zCcSCfak//VJat6Xh7cNUmUKx10K2pBp2nr1xyJplS/2g
X-Received: by 2002:a0c:b4a8:: with SMTP id c40mr545150qve.60.1615336211612;
        Tue, 09 Mar 2021 16:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615336211; cv=none;
        d=google.com; s=arc-20160816;
        b=CoHJfQ+sTi2ncNWn/jrRy+BvVVPachSdzRWXEu80qh9MQXcQiY9VqBR/1AlR34aVN+
         CYAjubwKsApUxGwWLoKQKh5MQhctOOSrWZwCxivcAE8x0XU55rxql/g9KR4xtoc8fJ0n
         hDzzn1fuMmQ7Yo2WSfA5uHTq4wG8GxMg8ljx6T4Dxp/fQZCFO1e1CgNCiXTigHHMm9xf
         8LiMR1igoQ/acrZWxdGCeQwDVWMswYnE2PPbox12E/HJ8e1ATh7eevHYs6FLTmUJqO1K
         P/sHJ/nNOnVic1k3NBVB65E54qfLF4OqCJc8jM0xsUgLrmOPA6LhUBAkvGbkBh4bjxRC
         3pUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ABbzHq/dojuUgxv8IlC5DB9LOuMI2xkumPREVmWvePA=;
        b=ZXgp/YuXtyLqdpewyUqKhDKgZaWKdLxDlxn0T97MS/snvFV3om6h0IyLBiAv+J2E/n
         pLV2VVLiE1oKz9LPIujo+afTEWBPMNFU04MhUyH2r+Cqn/5AXfv6CG8J/IGG7RImFFBh
         xmOsWIeC8hCTAGPQGT3AMjzQOF/EFD1dlSnr1Tf8p5DVkjscqMJKhNro6GyPp/tA3dWn
         N09Pj5FLMLvkVybL3UH3kAIMtCjmyeUL6+LjqA0dyHI1KFP6/Hur1rzZgdzU7gGvoWMa
         OHQkcbfDhX2cRyAK3JFxwB0HRce8PbfpfhqKTk5kwmO5mVtH2XS38JU4+cyYtnaAsocc
         MS+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=HLx47ODP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12si1137702qti.197.2021.03.09.16.30.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 16:30:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=HLx47ODP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJmjq-0000yu-Tv
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 19:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmjB-0000V7-P6
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 19:29:31 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:45918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmj7-0001I7-CG
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 19:29:29 -0500
Received: by mail-il1-x12c.google.com with SMTP id s1so13884697ilh.12
 for <qemu-arm@nongnu.org>; Tue, 09 Mar 2021 16:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ABbzHq/dojuUgxv8IlC5DB9LOuMI2xkumPREVmWvePA=;
 b=HLx47ODPMXqJz472Q6G4YBsQeRVDeUToMdAkTJjbzg0vMcpBs9JwRtTbI/sL2T8FJd
 eb52m093TwC1n9a0Hv7hf0U8hO1cm1mYYl98hYzgA+vIqRwAmMEQMFPRuy/6nG/bToQn
 jH2NMFmFc6qLYAdzLDjvAs+kMIO1CYgfsgigZr8XeYxLPzgHauUYBU5WFgCc8NwpjmQo
 DAijFjwu3yFhMxzL7g+tqo96AYbrjTWGgWU69ndoDXkdQ0TX9/zimZhecL8TMathSFT7
 RIA06OiFsWlvB6LEhO+I6EBB0dXtqigxNf+J8w4R6NYGJAOrfo3Fahh9Wr4pKl0dWEdX
 KrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ABbzHq/dojuUgxv8IlC5DB9LOuMI2xkumPREVmWvePA=;
 b=OxP1v7BsHlBom/cT+3tDSCOAL5xDhPJl2Zu1j0myoYPnuGIyTnoH/C18ihmNAPERqi
 pgYqx++pp2IDFS1gW3yKXJtDziQaTVGPcIgtJ4F/leW5QEE59bjz0ut9QTJkO6V7pjF0
 s6eYEjRYmK2WpPvw9LvRbIqoNkzIwT2Q1juZSyZBEQR01zyGePh821htFdTaSMKI+v8O
 eeoV9KhIYCa+XCpcXS7/XujE1G89hTcFl4SM19eD1sy2/dtveAns0sEynh0/4wwLLwPw
 ZzoRKjq24VLDfDNhlqYtSlPqk0UxBcFVwdXGry/Hd/VadwlWM2rUgayUMpn/eJ/GzvOV
 gftg==
X-Gm-Message-State: AOAM532m/z4QSpWPLpHoqFyo3RD0vCp1UfbaDcOILMYTRkSLhhV5YPKZ
 6slu8mG3dev4c38FfkAE5WOZvQ==
X-Received: by 2002:a92:6909:: with SMTP id e9mr673983ilc.34.1615336164183;
 Tue, 09 Mar 2021 16:29:24 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id h23sm8048808ila.15.2021.03.09.16.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 16:29:23 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v3 2/3] target/arm: Add support for FEAT_TLBIOS
Date: Tue,  9 Mar 2021 17:29:16 -0700
Message-Id: <20210310002917.8876-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310002917.8876-1-rebecca@nuviainc.com>
References: <20210310002917.8876-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: InKHN2bxWCX0

ARMv8.4 adds the mandatory FEAT_TLBIOS. It provides TLBI
maintenance instructions that extend to the Outer Shareable domain.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h    |  6 ++
 target/arm/helper.c | 75 ++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 32b78a4ef587..cf0801994a5f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4043,6 +4043,12 @@ static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
 }
 
+static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 1 ||
+           FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
+}
+
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ec81586d90dd..b1f634b0c897 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7165,6 +7165,78 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo tlbios_reginfo[] = {
+    { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAAE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 3,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+   { .name = "TLBI_RVALE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 5,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAALE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 7,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle2is_write },
+   { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_IPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 3,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_IPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 7,
+      .access = PL2_W, .type = ARM_CP_NOP },
+   { .name = "TLBI_RVAE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+   { .name = "TLBI_RVALE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+    { .name = "TLBI_ALLE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle3is_write },
+   { .name = "TLBI_RVAE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+   { .name = "TLBI_RVALE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 5, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+    REGINFO_SENTINEL
+};
+
 static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     Error *err = NULL;
@@ -8537,6 +8609,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_tlbirange, cpu)) {
         define_arm_cp_regs(cpu, tlbirange_reginfo);
     }
+    if (cpu_isar_feature(aa64_tlbios, cpu)) {
+        define_arm_cp_regs(cpu, tlbios_reginfo);
+    }
 #ifndef CONFIG_USER_ONLY
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
-- 
2.26.2

