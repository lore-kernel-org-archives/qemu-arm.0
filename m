Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9850DE66884
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Dec 2025 19:11:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWfqr-0000i1-5k; Fri, 19 Dec 2025 14:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vWfqV-0000aP-Fh
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 14:08:59 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vWfqS-0006oU-RN
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 14:08:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so1213945f8f.0
 for <qemu-arm@nongnu.org>; Fri, 19 Dec 2025 11:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766171335; x=1766776135; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fK0KW0TMYcgxgeLwnEP5U3w++5XTKKD1u9IZq89pD2g=;
 b=vqTujmtCfIyBNcQeg7L86RHFmifIo+ZJaMLcFuuGp27h5aApSyquyqUUYzjSpbJ+L/
 lwTNkGdUGc2xe43ZsfvzUgPt+Ca98uztNpXg6H5+Qp2G5W/9QH5XJQOQ/jSjH4H8cDAe
 pxccQh2qm+lL/PYPV1IQXz4Ai2W6PhCpnzqpbxKA2/jT3FbNoRfcyX8rgg65J9pwB5k+
 po112F4lbSnKQRv19Sxq5gOC7D79zGhJS0zQhQyCObS6lyKLtPHsiSxH51t7bHjlMlD/
 nGavTZGBU123lxY8cuz30KHi8pO8xNJ/CkJbTUXfWFRXdCqWr6/s+YLjGlcu9Yf3KQw+
 3+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766171335; x=1766776135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fK0KW0TMYcgxgeLwnEP5U3w++5XTKKD1u9IZq89pD2g=;
 b=jbnW9elAot58J7ksL2bxrW79j1sLBCr3KQ1P4WTD4Ndl6KSskLIoYie1ions+EiieX
 R0P1XvKRLJMOPoDyAwKWlPyaoGjUQTFi2xfVtcAB0aoM3U9XUZiFUJQJTzb1VcgcdyVq
 Y6nH949pYpkAN2r9Q9IUyYY5d+6AOy2p9Qx4UwTQtUyL1K0uw6AAPW1+Cr0two7FwgZd
 B4DBapS9+HiS/ax5OVudFhzraZehnaZv1PV9CfzljaOKOGlyWDGN9xceCqm7+TZ242zR
 Wziz5xsNxPumzhUFRwACaBNfbZTwj1x/C3R3+33zZE77w0JBZuB+Gww0ZN3eNQ8aovEh
 to5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWPf3TCKiUDRXCT5vfdrDCavH/YS5cWTODoWqaLXE7yW/jMvGrpQbHHk+TROU69sQApmpLgQIRGw==@nongnu.org
X-Gm-Message-State: AOJu0Yx4CFbzUV9737Ah1D87Het57LJpkXDg5CHzVQmpqeVpgQleQlfp
 u1bPDF+AjbspwCFj29mWZRe/xS7pP045Fhd1fz5HQc9xXo3MVJvmR765Xmlw8cp0TXw=
X-Gm-Gg: AY/fxX5VA55TXN1aMQc1JZ9NzTpTonIHm8+mTZ8TlQbGtt7Ciy8UPc0rub63h+uSKoI
 e4kC5oVqdrDJlKygc1d/yFzGvHMU5IxL7PyTfXCxkArSLLue8agXOqjI4LXN8ehXqwmxdBP4UMw
 DkUX5MKzcLqW1XC3b0NGYXXmxqr6mqpBvsKFShjyGx4UZ7NsBJqMMTsJeMQsFnIB6SOpPCUcX2A
 bTe2LnJDrxB4us5m+t7uZP+dwup+b4EAk4udWVrOgGvkS45HbHLllnSvXw/jJUiD/Om7PCd1hLm
 GAzRRn7g4Uh0KY2+D8m75ZmjiC6Or0aEfb+dWk6UZ1LLuDwVNspT2iQD8ysC4MxUCE2Mv7nMFik
 8MZTg3Z6fem/abBnB894p9XQjd267zu+rzmlbq41v/Cu0RXjDF83b+mo+CsEa6797pnWHDyj4s6
 95Th9mRxOntT0=
X-Google-Smtp-Source: AGHT+IEPonMigDhcyUb/rkjFjALC1EHAb9+cuZxjPKGSGDhXmrLZ4qFLqKwCHLvibLsksBtqozcbXg==
X-Received: by 2002:a05:6000:178e:b0:425:769e:515a with SMTP id
 ffacd0b85a97d-4324e50b8fdmr4442888f8f.42.1766171334811; 
 Fri, 19 Dec 2025 11:08:54 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea82e9fsm6786272f8f.26.2025.12.19.11.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 11:08:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E33E7601A9;
 Fri, 19 Dec 2025 19:08:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alwalid Salama <asalama@qti.qualcomm.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Mark Burton <mburton@qti.qualcomm.com>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 10/12] target/arm: defer creation of gdb register until
 machine created
Date: Fri, 19 Dec 2025 19:08:47 +0000
Message-ID: <20251219190849.238323-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219190849.238323-1-alex.bennee@linaro.org>
References: <20251219190849.238323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

When running machine emulation we may create additional cp_regs for
things like the GIC interface. To include them for gdbstub and plugins
defer the creation until the machine is finalized.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 39292fb9bc1..81997bac06a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -41,6 +41,7 @@
 #ifdef CONFIG_TCG
 #include "hw/intc/armv7m_nvic.h"
 #endif /* CONFIG_TCG */
+#include "system/system.h"
 #endif /* !CONFIG_USER_ONLY */
 #include "system/tcg.h"
 #include "system/qtest.h"
@@ -1535,6 +1536,23 @@ static void arm_cpu_post_init(Object *obj)
     qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property);
 }
 
+#ifndef CONFIG_USER_ONLY
+static void arm_finalize_gdb_regs(Notifier *notifier, void *unused)
+{
+    CPUState *cs;
+
+    CPU_FOREACH(cs) {
+        ARMCPU *cpu = ARM_CPU(cs);
+        arm_cpu_register_gdb_regs_for_features(cpu);
+        arm_cpu_register_gdb_commands(cpu);
+    }
+}
+
+static Notifier arm_machine_setup_gdb_notify = {
+    .notify = arm_finalize_gdb_regs,
+};
+#endif
+
 static void arm_cpu_finalizefn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -2138,8 +2156,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 #endif
 
     register_cp_regs_for_features(cpu);
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * For system emulation not everything is done yet - see
+     * arm_machine_setup_gdb_notify
+     */
     arm_cpu_register_gdb_regs_for_features(cpu);
     arm_cpu_register_gdb_commands(cpu);
+#endif
 
     arm_init_cpreg_list(cpu);
 
@@ -2392,6 +2417,14 @@ static void arm_cpu_class_init(ObjectClass *oc, const void *data)
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
+    /*
+     * For system emulation we defer setting up GDB registers until
+     * the whole machine in setup. This is because we may still have
+     * some to define for emulated HW (e.g. the GIC).
+     */
+    qemu_add_machine_init_done_notifier(&arm_machine_setup_gdb_notify);
+#else
+
 #endif
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_core_xml_file = arm_gdb_get_core_xml_file;
-- 
2.47.3


