Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055B9C83F22
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Jul 2025 17:29:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uc5vq-0001va-LJ; Wed, 16 Jul 2025 13:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uc5vm-0001sr-Me
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 13:28:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uc5vl-0000Bp-1z
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 13:28:34 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so789295e9.1
 for <qemu-arm@nongnu.org>; Wed, 16 Jul 2025 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752686911; x=1753291711; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWQe0nwaHjFSPbzauTR/fxg60n5AbbyVfV/ixwGD2ZA=;
 b=joR7FKTo8VLlQrV//2eA0+ep+sNdHtOZvnZbJxl0kl4tFQ65bdsQwYNa75qZr4kyrD
 GoySaN+P21wck7cPBGDQrgNvOUeIp2lF19or2HRnTh07I6cPp44vcmWkpLBQVSfA3NBO
 YIVb5/ALUGrvuS3P6nxYS3u2kqSuCcIkEBAgnL6ROvzQvxhHBAZHYCq+GkgKulVoSoFi
 XZzc4xFk91Jgiesn9oOh3koQy/dhXPfbxTVcBCd9UWsIzQoKgy6h7E/x96XSp6sAq76X
 inrNUFLUNFnTZq2mY/bC4TaaFVRDceTL70R90NurYRtgGpkOaH1T7lwv2wVCLgOoojd1
 u1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752686911; x=1753291711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWQe0nwaHjFSPbzauTR/fxg60n5AbbyVfV/ixwGD2ZA=;
 b=hNNnB4E5NhJJCNo9cZpAeoufSCcE68zZwCLM/KpSK3vvWg5HLmrzAS+vB42v+E64yn
 eBSgW0JmMneF/VLd0Nkef3C27xTQ8PuClWKj4z0w575f8cF8eTQLXYCZPg79Fh8Qg4vg
 k4J67LAvPRqD+XDEX4BUaF+lbMzKBL4yePmFCU7rGxALnwUJ57jazWB70Cp5Nx//MgSE
 Ta4UgXrZW6Bw7euPyxfhlpXynjOfVP36Cl42/BQ+04NlkpwL9BoLWw++fcc4NDiJjXgU
 XPXw/xeQZ7sh862bGVQxx6Jbd3uPuihpuGEkf8JsoWJg/s0x7yDohCcMyP+W9lA5PCP0
 UTxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4txf0TF3ZFPBOvhWwZnOHVfq6TrLPbZ74jKcXVfY74aE4AffyvMxwXhCjU8ohswnLN0U4DbibCQ==@nongnu.org
X-Gm-Message-State: AOJu0YxxoAx6BGo5jBfRLKbHKk0vSkN54/0cnclYeaUlLneKHFOHRF5G
 6RJK+pT9ohhwazdap+3qL2+lb/DlcnPivtPbNSvcQmfu5vFcCOyR6VXMqps05n3PEBs=
X-Gm-Gg: ASbGncvjm1sFjPgQ5R0vfkaiUTYDyDbik5aewacqVa1a9KVsWwut7kfUBkFu4xR7Ltd
 3IzjEAaJxIpwM1GtWsRQ4pPVlMtcB9q1qIdvOJX+Tnnf7tBhOhlaF5/Emfyfz7sUPUDC+EWwGhT
 1EftV8m2AzAALkRDNqEVLVAnBGq/Q6+uYPpEmU9fDeAu46FL6RU74bi9CmwpTvhtN3xQcWy4ngy
 MmSgtNmA2JvxYFDvx4yFQHbix2rDva0rjyAymTya67huxEjkuxjYVnT5F+CY4DoSZnoJ3XIe6U5
 3nbMXY6XeMvpZDHkpLbWXMJ1ukAN46UFkxebMDi9QGFqiU9a21F1UKq3h42dt3rTYdcIt56o34g
 jMCFPQfffmxGZKCwCgqAhRvzXd+WeR54UfZp8jrqjWurz5ZuGCX5tMGGEoabPnrtc4uCm88Wl
X-Google-Smtp-Source: AGHT+IEjy5mT+VlMmimH2ItxJttWj0qTFpf6nuSVx7+W3QydPRBGRLmZ/xijNFByXbddHOJj4wQBww==
X-Received: by 2002:a05:600c:3496:b0:456:1b8b:b8c6 with SMTP id
 5b1f17b1804b1-4562edaa066mr35328655e9.14.1752686911508; 
 Wed, 16 Jul 2025 10:28:31 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e83c712sm26892265e9.33.2025.07.16.10.28.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 16 Jul 2025 10:28:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 3/3] hw/arm/virt: Warn when HVF doesn't report IPA
 bit length
Date: Wed, 16 Jul 2025 19:28:13 +0200
Message-ID: <20250716172813.73405-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716172813.73405-1-philmd@linaro.org>
References: <20250716172813.73405-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Emit a warning when HVF doesn't return the IPA bit length
and return -1 as "this accelerator is not usable", allowing
QEMU to try with the next one (when using '-accel hvf:tcg').

Reported-by: Ivan Krasilnikov
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2981
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ef6be3660f5..062812bf252 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3149,8 +3149,12 @@ static int virt_hvf_get_physical_address_range(MachineState *ms)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
 
-    int default_ipa_size = hvf_arm_get_default_ipa_bit_size();
-    int max_ipa_size = hvf_arm_get_max_ipa_bit_size();
+    uint32_t default_ipa_size = hvf_arm_get_default_ipa_bit_size();
+    uint32_t max_ipa_size = hvf_arm_get_max_ipa_bit_size();
+    if (!default_ipa_size || !max_ipa_size) {
+        warn_report("HVF didn't report IPA bit length");
+        return -1;
+    }
 
     /* We freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms, max_ipa_size);
-- 
2.49.0


