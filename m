Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4D7CA0EC4
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 17:09:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulVzn-0005BV-33; Mon, 11 Aug 2025 13:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVzR-0004zv-9k
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:07:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVzI-0001s1-Ob
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:07:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso45606085e9.2
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 10:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754932023; x=1755536823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXHYeE/dbTRdflhUmCNmx7Q9a47atxr+CRA/ufWMQVM=;
 b=SNku07GjtRGK5Zp5BGpsUb2eb3fJD/wrlu8en9z+x6mH1pzz0bLRmGgffnEKbipp0J
 cUMIIFvmbrZBMjaeVvgTbDKAhDbuG/Vy77kg8GqRG1yDW/AsYDIrIYBy9CytRViTipnZ
 eYiM+bI41NO7kYyT36qW7t/zRfqKzP+Yy3f+lpwI8ZMvydFr8EVVrmZ6GlIsdX6BpxUh
 MveaNjWsJG3epysNZRF8xVtMS72WDpRn7zcw6CfrZjAx+we2K4Ar6ia4zpMY+/9k3tgP
 9T5yNNGc2k8io/PME7LVx7wLTbapeOZuDXCoiXrMiZnW4NObtU5hDDpjaeuvJrBd08Xu
 4whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754932023; x=1755536823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wXHYeE/dbTRdflhUmCNmx7Q9a47atxr+CRA/ufWMQVM=;
 b=v/feeaCHF+n6hmDQWPPiC8tkA556xiJMdhsT+Q4+EfQXXE1lU0wFXwSXhUpoOyzstQ
 oNJLJq5gcVc59G/qQzdLfgi97qk+hA+jyzOrm2qjzpByguU+m2hNuR3zC17DiarcavdR
 8a4Ix3KQHIHNc4d96p4jhb3+oNW/IBOQ1r0DHppZBt6QBVc7jHtYxCAiv+n5i0JgvOZe
 irNAEqBJICahx+PM1V5aH5X7s9W+oPOfAz/Fp2EmBgtQs5eeO21UrqKc8n6Jdl8wHzuq
 AbnstmJl+3AqywB5rbi6LBkf6hu5EF5FiaAiNS2OHJ8qI3WWNqRmCJqEoa4NHFczNa/3
 JzFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Pnivmho+06mArHdW0W8oah4+/0+k22KiBdbz/88doHDRkML31Ntl3e/AVcpxsw91b79OrYkY/g==@nongnu.org
X-Gm-Message-State: AOJu0YzHK1hNzcPo3GIqANJBlDhiqbt30nbxONak9DVImJCwKyKIraOj
 XERO6YZSLvoI+wWcJ4nikyhRph5zTLz0CX/jzEmqyhMgqASjsGXVBSTpY7U8lNqIgsU=
X-Gm-Gg: ASbGnct3M/J1TLjz5lxdq/R09YOIAVtkIGKM4YSQ30EujgP04ognUqmYK/gJ3aNvWHA
 rluvVSYJs7wCyq8nYyYKH19XAJUjCWmVkluCEXwLnb9RvkvN00hvD3fCzAHWt5H5Ghnjk6+bpuz
 RDsp373Snsd1ZVJ7VG4851nLyajKgRh/ADL8+AAy366CzP914B39iFjdADerP1TRjOS4Slw67OI
 UAKZuL2FtIoxRLIbEXFB5ErOHfmKLbl78dYR24S0XqvOTddd3ehlo+XogxJlTpmbwu7MqHuoLpS
 ytiS1AorRhOdLMqEtiVendNV3ApXkyvMveWpAegJ8Kk4E4gZ30N+3CKJsdaJ/H03w1TQRskGmee
 VydqOZmO0XPBN4kYSIheuZ+kcZKkYDQ4aGmvRPRAhyUJhUNMwrpizekCUKy3bAaqWhCOXCCeo
X-Google-Smtp-Source: AGHT+IFUuly7Dqrg66psU4QHCuRXsJhkEzRy6aRPP2+eyqivHdPhhh2IohEjZISBtH74GHrPxa9how==
X-Received: by 2002:a05:6000:2c09:b0:3b7:806e:7773 with SMTP id
 ffacd0b85a97d-3b910fd97fbmr541303f8f.15.1754932022551; 
 Mon, 11 Aug 2025 10:07:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abf33sm41526775f8f.7.2025.08.11.10.07.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Aug 2025 10:07:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Miguel Luis <miguel.luis@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Haibo Xu <haibo.xu@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Mark Burton <mburton@qti.qualcomm.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 09/11] target/arm/hvf: Sync registers used at EL2
Date: Mon, 11 Aug 2025 19:06:09 +0200
Message-ID: <20250811170611.37482-10-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811170611.37482-1-philmd@linaro.org>
References: <20250811170611.37482-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Mohamed Mediouni <mohamed@unpredictable.fr>

When starting up the VM at EL2, more sysregs are available. Sync the state of those.

Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
[PMD: Adapted to host_cpu_feature_supported() API]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5174973991f..778dc3cedf7 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -400,6 +400,7 @@ static const struct hvf_reg_match hvf_fpreg_match[] = {
 struct hvf_sreg_match {
     int reg;
     uint32_t key;
+    bool el2;
     uint32_t cp_idx;
 };
 
@@ -545,6 +546,27 @@ static struct hvf_sreg_match hvf_sreg_match[] = {
     { HV_SYS_REG_CNTV_CTL_EL0, HVF_SYSREG(14, 3, 3, 3, 1) },
     { HV_SYS_REG_CNTV_CVAL_EL0, HVF_SYSREG(14, 3, 3, 3, 2) },
     { HV_SYS_REG_SP_EL1, HVF_SYSREG(4, 1, 3, 4, 0) },
+    /* EL2 */
+    { HV_SYS_REG_CPTR_EL2, HVF_SYSREG(1, 1, 3, 4, 2), .el2 = true },
+    { HV_SYS_REG_ELR_EL2, HVF_SYSREG(4, 0, 3, 4, 1), .el2 = true },
+    { HV_SYS_REG_ESR_EL2, HVF_SYSREG(5, 2, 3, 4, 0), .el2 = true },
+    { HV_SYS_REG_FAR_EL2, HVF_SYSREG(6, 0, 3, 4, 0), .el2 = true },
+    { HV_SYS_REG_HCR_EL2, HVF_SYSREG(1, 1, 3, 4, 0), .el2 = true },
+    { HV_SYS_REG_HPFAR_EL2, HVF_SYSREG(6, 0, 3, 4, 4), .el2 = true },
+    { HV_SYS_REG_MAIR_EL2, HVF_SYSREG(10, 2, 3, 4, 0), .el2 = true },
+    { HV_SYS_REG_MDCR_EL2, HVF_SYSREG(1, 1, 3, 4, 1), .el2 = true },
+    { HV_SYS_REG_SCTLR_EL2, HVF_SYSREG(1, 0, 3, 4, 0), .el2 = true },
+    { HV_SYS_REG_SPSR_EL2, HVF_SYSREG(4, 0, 3, 4, 0), .el2 = true },
+    { HV_SYS_REG_SP_EL2, HVF_SYSREG(4, 1, 3, 6, 0), .el2 = true},
+    { HV_SYS_REG_TCR_EL2, HVF_SYSREG(2, 0, 3, 4, 2), .el2 = true },
+    { HV_SYS_REG_TPIDR_EL2, HVF_SYSREG(13, 0, 3, 4, 2), .el2 = true },
+    { HV_SYS_REG_TTBR0_EL2, HVF_SYSREG(2, 0, 3, 4, 0), .el2 = true },
+    { HV_SYS_REG_TTBR1_EL2, HVF_SYSREG(2, 0, 3, 4, 1), .el2 = true },
+    { HV_SYS_REG_VBAR_EL2, HVF_SYSREG(12, 0, 3, 4, 0), .el2 = true },
+    { HV_SYS_REG_VMPIDR_EL2, HVF_SYSREG(0, 0, 3, 4, 5), .el2 = true },
+    { HV_SYS_REG_VPIDR_EL2, HVF_SYSREG(0, 0, 3, 4, 0), .el2 = true },
+    { HV_SYS_REG_VTCR_EL2, HVF_SYSREG(2, 1, 3, 4, 2), .el2 = true },
+    { HV_SYS_REG_VTTBR_EL2, HVF_SYSREG(2, 1, 3, 4, 0), .el2 = true },
 };
 
 int hvf_get_registers(CPUState *cpu)
@@ -588,6 +610,12 @@ int hvf_get_registers(CPUState *cpu)
             continue;
         }
 
+        if (hvf_sreg_match[i].el2
+            && arm_feature(env, ARM_FEATURE_EL2)
+            && !host_cpu_feature_supported(ARM_FEATURE_EL2, false)) {
+            continue;
+        }
+
         if (cpu->accel->guest_debug_enabled) {
             /* Handle debug registers */
             switch (hvf_sreg_match[i].reg) {
@@ -725,6 +753,12 @@ int hvf_put_registers(CPUState *cpu)
             continue;
         }
 
+        if (hvf_sreg_match[i].el2
+            && arm_feature(env, ARM_FEATURE_EL2)
+            && !host_cpu_feature_supported(ARM_FEATURE_EL2, false)) {
+            continue;
+        }
+
         if (cpu->accel->guest_debug_enabled) {
             /* Handle debug registers */
             switch (hvf_sreg_match[i].reg) {
-- 
2.49.0


