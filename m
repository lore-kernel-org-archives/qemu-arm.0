Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B0ECCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:47:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE11-0001pi-Ov; Wed, 29 Oct 2025 17:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE0x-0001oq-JU
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:47:32 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE0q-0006eR-0I
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:47:31 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-475e01db75aso2065675e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774436; x=1762379236; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0F9dkqnaiLK5i79x81WOHwn6K6egaqNgTaEtafHPCr0=;
 b=CUcbxd0VmdCEGMXEGe9+kFkiNY5/1kDB98HMmjRm1z4wCyz+/SXXLgInFotyppCapB
 R3amJOX34OYH2y/DfMtSGIxhSenNSMpuoaH1QT9Ht/gzzRLwbwEe3oy5HFNIZvETdgAF
 mUSYFSibvnuZ54+P5SqbiRKpejoVYuXbe9hzYEH2Ei54vtrp0uOR2g1GGGGIpfHnhtM1
 7vCtT853hetfj19/4lewGS6w8WHkEG4fZBdf8EHO5RnVnekolrDadxQWAITnNdcpOdNb
 ZHymE/KF6z6DhW14iAXjwbUr2vy/9SWRcjJxXy3SYvu1dCzS3XeXDcb46tg2RjK8mGR0
 V+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774436; x=1762379236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0F9dkqnaiLK5i79x81WOHwn6K6egaqNgTaEtafHPCr0=;
 b=wYWQZRx21eVzpKHFwAZoxXFMn72U1QDRHfkfd1cLKO628pxqyP5gVudPVTH6wqyAAF
 +cvR8tBDEX8VJh8IpL+iqokgH3Bl433MeMfRNlCUcfL1TTJCacEvX7AHuTs7dCBWHiZu
 V0XA6KLoelO22p/B6lBx/q0Utjz1jdXbzgOzXbe4UjmY+cSDdx9QAoGd1YMCx3X3eNs9
 Y4wkyBzS0wpn+RKn+LMHXCTNwBUKQOrKmgzndaWDQJsMXFytSvgoCE4k6F97n17pp73b
 JGRFm4P2KuMY4Dam0EMq3WZvyNc8Wbj40S1FqkFUX091Wtz27xQRiS8Cb/dHAwkCQ2oy
 hP2g==
X-Gm-Message-State: AOJu0YwRpR84SsXQ9SiFpvTJtudPC3iAjlT/VRyloNSJFf29QRosiJMR
 bTsS3TUVZLi2iAz+ZehWIXdCyr8SZo1bdhK3u+Fc6hCTD5raPTK/4u5vqwmZeNEBzIs=
X-Gm-Gg: ASbGncumcqVmepWzcSlDF6YuFwP8GrB8P6X6cI3CYg82P7zA9JIQrdfsZCY34+zpuRJ
 Jb1jbSlUcZ2VcF6ajrg9kPOX96Yx7AbJ8FGT+tMjcE+QjK4JI0zZkec5/dmb52JV6RgQL4V53JO
 /8uOoG6i/MPxIQu806dg5mPqg/Krb/oiLFh6hL4hGxnNQtqvX2QDOOkIOVfqCdEzOgpJc7gx6X/
 ZUJD6zFtpdoUyYtNSKpYZtUgqbKbpvbev7pRPDSUSnAYDa3q6DxcVKOtKSGD3T6ceMsKD/aRD02
 LDPkc3hC9i3HYdxmX0Euz76YqXmWh9oca6dzoE9NWLG26r+M1EhvGR8YgR0VHrrJiT8ybMSA7dc
 BLeLoGW2lYQ4HPr8c7WzsxhPh3ABgmqKasD2aqGsw3gXyag4xcq2ijshrQeTOq2XGznau1VPnfm
 yVlk73df2b2fOwDyp7rXQeF7w+xv9VqdqzjStCNF8o3WW0ewD/TS9/bExcQxuM
X-Google-Smtp-Source: AGHT+IGqU9counotP5u54GGujGRLojSBOi9LQfM5EnPd82R3Ph39GT9k8UzuoF1WJgfRtRZTGHql/w==
X-Received: by 2002:a05:6000:2f85:b0:3ff:17ac:a34b with SMTP id
 ffacd0b85a97d-429aefc03f0mr3717688f8f.42.1761774435935; 
 Wed, 29 Oct 2025 14:47:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289b3956sm4427905e9.10.2025.10.29.14.47.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:47:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 07/23] hw/arm/virt: Register valid CPU types dynamically
Date: Wed, 29 Oct 2025 22:39:44 +0100
Message-ID: <20251029214001.99824-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Replace the static array returned as MachineClass::valid_cpu_types[]
by a runtime one generated by MachineClass::get_valid_cpu_types()
once the machine is created (its options being processed).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021211135.61179-1-philmd@linaro.org>
---
 hw/arm/virt.c | 59 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 20e3f1094cb..e19da6fd901 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3256,36 +3256,41 @@ static int virt_hvf_get_physical_address_range(MachineState *ms)
     return requested_ipa_size;
 }
 
+static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
+{
+    GPtrArray *vct = g_ptr_array_new_with_free_func(g_free);
+
+#ifdef CONFIG_TCG
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a7")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a15")));
+#ifdef TARGET_AARCH64
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a35")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a55")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a72")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a76")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a710")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("a64fx")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n1")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v1")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n2")));
+#endif /* TARGET_AARCH64 */
+#endif /* CONFIG_TCG */
+#ifdef TARGET_AARCH64
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a53")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a57")));
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+            g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("host")));
+#endif /* CONFIG_KVM || CONFIG_HVF */
+#endif /* TARGET_AARCH64 */
+    g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max")));
+
+    return vct;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
-    static const char * const valid_cpu_types[] = {
-#ifdef CONFIG_TCG
-        ARM_CPU_TYPE_NAME("cortex-a7"),
-        ARM_CPU_TYPE_NAME("cortex-a15"),
-#ifdef TARGET_AARCH64
-        ARM_CPU_TYPE_NAME("cortex-a35"),
-        ARM_CPU_TYPE_NAME("cortex-a55"),
-        ARM_CPU_TYPE_NAME("cortex-a72"),
-        ARM_CPU_TYPE_NAME("cortex-a76"),
-        ARM_CPU_TYPE_NAME("cortex-a710"),
-        ARM_CPU_TYPE_NAME("a64fx"),
-        ARM_CPU_TYPE_NAME("neoverse-n1"),
-        ARM_CPU_TYPE_NAME("neoverse-v1"),
-        ARM_CPU_TYPE_NAME("neoverse-n2"),
-#endif /* TARGET_AARCH64 */
-#endif /* CONFIG_TCG */
-#ifdef TARGET_AARCH64
-        ARM_CPU_TYPE_NAME("cortex-a53"),
-        ARM_CPU_TYPE_NAME("cortex-a57"),
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-        ARM_CPU_TYPE_NAME("host"),
-#endif /* CONFIG_KVM || CONFIG_HVF */
-#endif /* TARGET_AARCH64 */
-        ARM_CPU_TYPE_NAME("max"),
-        NULL
-    };
 
     mc->init = machvirt_init;
     /* Start with max_cpus set to 512, which is the maximum supported by KVM.
@@ -3311,7 +3316,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
 #else
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
 #endif
-    mc->valid_cpu_types = valid_cpu_types;
+    mc->get_valid_cpu_types = virt_get_valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     mc->hvf_get_physical_address_range = virt_hvf_get_physical_address_range;
-- 
2.51.0


