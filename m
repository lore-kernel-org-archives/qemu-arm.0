Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C861C5CFDB
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 20:45:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuFot-0003eH-Aq; Wed, 12 Aug 2026 16:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFoo-0003cR-Pn
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:58 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFom-0002Gp-OT
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:58 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-8485bd28dd0so1629936b3a.2
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 13:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786567495; x=1787172295; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ntj5Lj8a29J+b6NyiWqPDRme31w18TYsD1CXA/qiy8c=;
 b=pN3CdeaPokPCqQsaPEaUGFYx7hpvJj4Zo7lBqfWtCIv9rQAk/hBRZZlIy/mUKc3ALj
 3Q69ErgjwROqumcJbJt/ELNKYGN3LI+NckDC9tl9b3JwQOPQm+LFDMkn9/G8Rlt+lMmD
 AyRkP+2mhhZ9mYSrEPHRYU9X1YFsLmmsmDCf/v2QieeyLV37g+2oQGdKRi+6vSJ98iY7
 hGqJ+qUYSlpmF52wUb3NguS8XCRPINagf76OZxub1cJj+k54LY7dddOAI4it1ZEC/Egu
 RIghVs9vY94VRBWNosEDGfmKQ1grNiZ5op+PNw1y2r122+7b9BX/eXg+L7nJP5vqrsfY
 wLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786567495; x=1787172295;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ntj5Lj8a29J+b6NyiWqPDRme31w18TYsD1CXA/qiy8c=;
 b=JP+agOVAnUlxrwUeU2GFnyfubiU2CKNq7mBRqOe4hvGdDspjpapk2C9xADxM7KYQto
 GOBdS/A1rp31GVt2X6fItxo/aNwqR+fmY3yL3R0QdHzBeCZFG9PtRXrm94EniVXX1ZRW
 F9uCHf0V3hahS3Q1vvH3s37jOtbxuT6AhWjLML0xEYLcXSaKmmIlCtS37aPQe+3Q0CT4
 m7MlH7h40m7ta8f25mT73ioKZL0Q3ibnIYUw5T/y2NVav9/GiAW4/lRYyBwYvl1i6GRj
 AGeBLppqwvAHJS2XXbEwa2HJ1d7m74UTWnrxu+bhBgarpzP7Pmda6htvH7YSTGMMr/2c
 L44g==
X-Gm-Message-State: AOJu0YwgAduXGR145tJ9xKFrYnxnVO7f1BRb1z6dQF0PR29w5WC/EGi/
 YkjGtfK107aC/dkkm94kctUCoslaL+xZl/qKBzbxYaw6UpzVq6SetIIfrj22NtLZG5I=
X-Gm-Gg: AR+sD10BUOezjIpk2qMdv3btnOX7k8f+bEWrcvLF7T8E1uCO5p0HEgXJ6OjySn0M3hB
 M7Qyp8P9sjhS8NXwRWlKl81eC5eePezJ8sH5h5mb4oYoz/FsxBoxUURvgbh8Bkh+VXQgphitSrs
 F9fI/x0uYIrl6HpV2Z3k8t2EvFP5NaQBWcNey09P7CvOe238QVfKWDttFOGEE21VfgaA5NW5Vpn
 /b/S6GfGK+tQzq7Dymg3USu+8bDDtAy9RSbvCnpMrMBvXFO7LZq5L83rMrEAuBsrKJWRU5ELsg7
 F/grQLkgnVppfuEwkFGDO4FUqftBNxlW8krGvEUPUY4ntkv7Q53qSRxAGnD8ReFel70XjPuQppT
 elq2mUAzbDLUzm2hwkzdiVtdIis5UwCpME195WHbWH3AZLbj65VxFQNrp3nSlpqYMAeoq7E3wmD
 YGjhUoKvdD+QxCUy0az30tgUJ+SdG8vYgMwlTZPghxxjkjxSjsBeVKJ8hBSE1Unw/zBi1d3jZOn
 +lFnEzYN05nuyfos+uS
X-Received: by 2002:a05:6a00:1da5:b0:842:708f:39be with SMTP id
 d2e1a72fcca58-84fc744db5emr588175b3a.5.1786567495228; 
 Wed, 12 Aug 2026 13:44:55 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fc4787325sm125308b3a.23.2026.08.12.13.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 13:44:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 07/10] target/arm: Introduce cpu types max-v8 and max-v9
Date: Wed, 12 Aug 2026 13:44:32 -0700
Message-ID: <20260812204435.295067-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812204435.295067-1-richard.henderson@linaro.org>
References: <20260812204435.295067-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Introduce the names and allow them with the virt and sbsa-ref
machine types.  So far, the cpu types both exactly match "max".

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c      | 2 ++
 hw/arm/virt.c          | 2 ++
 target/arm/tcg/cpu64.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 484b90053e..56d08f605c 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -913,6 +913,8 @@ static void sbsa_ref_class_init(ObjectClass *oc, const void *data)
         ARM_CPU_TYPE_NAME("neoverse-v1"),
         ARM_CPU_TYPE_NAME("neoverse-n2"),
         ARM_CPU_TYPE_NAME("max"),
+        ARM_CPU_TYPE_NAME("max-v8"),
+        ARM_CPU_TYPE_NAME("max-v9"),
         NULL,
     };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 219597cabd..34cab9017c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -4143,6 +4143,8 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n2")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max-v8")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max-v9")));
     }
     if (target_aarch64()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a53")));
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 5649b853a7..967cde787e 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1463,6 +1463,8 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "neoverse-v1",        .initfn = aarch64_neoverse_v1_initfn },
     { .name = "neoverse-n2",        .initfn = aarch64_neoverse_n2_initfn },
+    { .name = "max-v8",             .initfn = aarch64_max_tcg_initfn },
+    { .name = "max-v9",             .initfn = aarch64_max_tcg_initfn },
 };
 
 static void aarch64_cpu_register_types(void)
-- 
2.43.0


