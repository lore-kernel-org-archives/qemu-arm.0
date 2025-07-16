Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA6CC83F22
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Jul 2025 17:29:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uc5vk-0001ou-GO; Wed, 16 Jul 2025 13:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uc5vh-0001mH-Pd
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 13:28:31 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uc5vg-00009U-3x
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 13:28:29 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso50632f8f.3
 for <qemu-arm@nongnu.org>; Wed, 16 Jul 2025 10:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752686907; x=1753291707; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ps+e7ssT12p6go031p/X+dV+am0FTNx9EebSq8FDbrI=;
 b=N6FXTTWLGG5YeXXELOO74tYoCVMA73dSGsfZj1p7L20KemmByQfU5K0EKr0Hdeoioh
 caiG9+OoaPH3VvIg51YL82IONQ8Q3Wt9KlCKbpT00bwhNjgdaJ0UPPvTfwXrL9zSBEju
 +6NupagxzwT1LhQma16ITh8oZ0LfslHYphgE6t24TmSu0nADJSAuPUesjL38vV3lHIba
 vyJHtfevqfAtwlmCRsrqf0XqxEVtJz5SopF/qykDzICYrK7UDgSnM2pDMMC2dP4BE6Cc
 jkl3xlXNcc7Frriot4m58QNheJK7FdfO+i74383MdchdZz3B2D4BPss1wxVd8u8gcWiO
 T62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752686907; x=1753291707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ps+e7ssT12p6go031p/X+dV+am0FTNx9EebSq8FDbrI=;
 b=DNWqiiOTsf2JXLQui0DpDlbocCf/+ik+EtpVC//4v8bine/mRN4B1JhMITpMo4aO1h
 2630/6IRUVJ9HRgFEIaK56U8AAEIXXmaZ5GPJOiVZr7avXb+YtOg/Np8aBcTDSrimBOE
 K8N5MjTm1mdGOsRFu9rjcXbynfCSriaMC8gZgy4nVPMav+zqryUDt5cDyq23JCubpJUH
 UcfKkL0r7dd0HUC+NTUwBdi9hxXRDT9/TPFaSIYJnlWIimcQhNLl75A9hE98W0GeZmK7
 bvHQRIGaX6sg7jLKPYm+hyUo4wT3fQltAIocXI/GpuD26TUHFcFV1yD6lnSWUDSG3Y9+
 AnDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjPhei3YrdG7oJxlf+1OTONKvruQB8Zb6LjuaKznEhqv7JngYzhs8YyUxKYWpLiq5VOFP+HX0NbA==@nongnu.org
X-Gm-Message-State: AOJu0Ywpj/JEtLImb93ncbO/HzUj6XF1EbYPQS1i/TcQWbcAx2nL/D5t
 nk3C1oCAdIYV7g7qms50fIP0tR95Iv/JXME8WczElQ7Wj4RKall3FKBgHsq1NHshfr0=
X-Gm-Gg: ASbGnctxrC1IGjVkaGehrmjVfBMEuui9wnyWMrxL97EaznSWnK6QVLdtZJxl37kxiAz
 t2QnB9IpN8igg4CT0Dz5zi+nJb4gNg6ft8saBxopfyKwXelT6KwIBiKbYQ2+VAoaoNGwoJrI5dt
 aNTYWk4XdH+C1LgAHSZi2WOrySbJrXSm/wyTalYXwoWs6kbIa5oUwxVXY6eV6D1q92ep2o0k3SF
 r715M1YdhfbMlqNqMYO8GOOCa/vI866UsCMCaEOlPlzNEJN+EY/PGPPm8fENjfl2BZqWu1k7/KT
 Plf2D/baM1V9NyatemXoSuG6X5o7MZjd1KgSqdLX+wbPzg9K6PhD2QgPjUj3sYYd8LQh7kyyOoJ
 0aDLa62GjvpbRv7O0rx7mRnD5R/uKklWl4rx19QhsntAxrS0FQmfB8xfxwSXGyqnr8aA46Pgo
X-Google-Smtp-Source: AGHT+IFte4bkpthavf7WGnbTSeu2PaFexmWzi13urEVA104uU+T2KnJRvcGU4bDaP/sF9cM3LdR4yQ==
X-Received: by 2002:a05:6000:12cf:b0:3a5:3b14:1ba3 with SMTP id
 ffacd0b85a97d-3b60dd89a00mr2708265f8f.49.1752686906526; 
 Wed, 16 Jul 2025 10:28:26 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0dc3esm18308292f8f.47.2025.07.16.10.28.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 16 Jul 2025 10:28:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 2/3] accel/hvf: Do not abort in
 hvf_arm_get_*_ipa_bit_size()
Date: Wed, 16 Jul 2025 19:28:12 +0200
Message-ID: <20250716172813.73405-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716172813.73405-1-philmd@linaro.org>
References: <20250716172813.73405-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Do not abort in hvf_arm_get_default_ipa_bit_size()
and hvf_arm_get_max_ipa_bit_size() when the IPA can
not be fetched. Return 0 (and document it).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf_arm.h | 11 +++++++++++
 target/arm/hvf/hvf.c |  8 ++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
index ea82f2691df..21a69e7d105 100644
--- a/target/arm/hvf_arm.h
+++ b/target/arm/hvf_arm.h
@@ -22,7 +22,18 @@ void hvf_arm_init_debug(void);
 
 void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
+/**
+ * hvf_arm_get_default_ipa_bit_size:
+ *
+ * Returns the default intermediate physical address bit length or 0 on error.
+ */
 uint32_t hvf_arm_get_default_ipa_bit_size(void);
+
+/**
+ * hvf_arm_get_max_ipa_bit_size:
+ *
+ * Returns the maximum intermediate physical address bit length or 0 on error.
+ */
 uint32_t hvf_arm_get_max_ipa_bit_size(void);
 
 #endif
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index c9cfcdc08bb..180fd94def2 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -943,24 +943,20 @@ uint32_t hvf_arm_get_default_ipa_bit_size(void)
 {
     uint32_t default_ipa_size;
     hv_return_t ret = hv_vm_config_get_default_ipa_size(&default_ipa_size);
-    assert_hvf_ok(ret);
-
-    return default_ipa_size;
+    return ret == HV_SUCCESS ? default_ipa_size : 0;
 }
 
 uint32_t hvf_arm_get_max_ipa_bit_size(void)
 {
     uint32_t max_ipa_size;
     hv_return_t ret = hv_vm_config_get_max_ipa_size(&max_ipa_size);
-    assert_hvf_ok(ret);
-
     /*
      * We clamp any IPA size we want to back the VM with to a valid PARange
      * value so the guest doesn't try and map memory outside of the valid range.
      * This logic just clamps the passed in IPA bit size to the first valid
      * PARange value <= to it.
      */
-    return round_down_to_parange_bit_size(max_ipa_size);
+    return ret == HV_SUCCESS ? round_down_to_parange_bit_size(max_ipa_size) : 0;
 }
 
 void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
-- 
2.49.0


