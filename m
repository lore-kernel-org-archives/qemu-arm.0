Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91BECCD199
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 09:40:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAmNY-0002di-9O; Mon, 20 Oct 2025 05:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAmNW-0002cy-3i
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 05:40:34 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAmNU-0000PS-2X
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 05:40:33 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso30832725e9.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760953229; x=1761558029; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hf/fX2rpCUP9IbKU00LmPKijOrrmaaRZ3WsqBQoJa5I=;
 b=twDX+FP+S1RRleobWNuibuXMmH8Kq1gWE+8BZQhx9b6khetwnKp0n0wJqe73JE4+NA
 KYRBOEZvwpsa4pzPI0jiwggm58uHx7abpzUj03iwoKxB46wo42jjFP7k+PVGyXiTAj1d
 65vxTWX5vaOIOY6pVxUbBRNWtuO0YK5wxVkVo7ExKslSma/dfVCK/G3TfEULlBM3Vatc
 A+MFp11I3qMF5ofFPailqHsukuZXQBjPE1bJwaQg9j82GbKeVzT7k5fmioeD5XeWJY8V
 KH//uhDuaeqpV5miWKVybHaVPX6Nrrr1+5ZijDvGTzuNtrT8LeHSkh/WOXpmVjRDWlGR
 VExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760953229; x=1761558029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hf/fX2rpCUP9IbKU00LmPKijOrrmaaRZ3WsqBQoJa5I=;
 b=SakWsXD20ZmEqpIvf87gv18fFyOnQ0+a+xJjrKvO/1MO60jAVplSmvqxHjAZWegVqP
 xzoGyBRCh9E6IeLrz6lI6mF/pSkQV4XRxOzihnndQedD16TLUf9xra1mCbTTLoesHHn+
 8ld1VJlyiYwOlrczGWH2W/+hQG6bJMFqhi0fZ1rb4YGdsQ+hzPiylV8D7vVZealxrj+e
 gsccHDJFwd2LhcIyzkER48RV97fJLeyiRiM00buoUz1TYOvfLAQbDKnG/0DN6E2EunPo
 ArsrWMHAQkVAvADPd1SIsw3UHLNyBC2m7X9dxhH7/LGVImWFgeikqTYwdDnF/10eL+Vg
 q9Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN7ZceDwszNoUznAWHdQjjnjfSxnxwUv9KUbRHZuA4ZiT/LD8Uif3fNmrSJ+l7RvhKk2lnkhc0Tw==@nongnu.org
X-Gm-Message-State: AOJu0YwIto8PM+cxZu8JUriWihDODG9nI0O54pExmkZwDIu5HJAumgym
 dC2JHen39rj9vAVvP95d9ga0v9+C3YgrUtGudVp7rDinCxQtcZ4jbKKKMhEYc0cD5AE=
X-Gm-Gg: ASbGncvtp+cZejVoqWHuBVWWuqVYsLaoluFd1j/NZbGrhz8n3oUKmfzMSDuwMJ7cKal
 8Dk051TzBda6Nbh2kvkn0Xd9P+xheh+DJ164hF3V1FokD2oVlWcKTYvJav5D5IVW2oCP9gwrHzj
 kNRQ3CIl6Dr3PHAh9fL4D406wETuv9p07MHmpk/zSTPaXdhCqHPPoBM3oFXZ6gogda54C716IRj
 GVl/xX0od+6NMRizfGgpNonzY6kPx1CacNn03KFoHw3VgmBm0/BdE6Cg6VGXGaGxqjiOJ1/zseR
 NVeN548rebUtaIAwuWANtKHh95VbCHeCiAhgZToCFAF5A5rG3LI7osW3WNa9A4wTFh+BAVkc2O/
 20jHqCBvvtBBToRWj/KyQ7cr9RXfQJXmkifJlZUtYhSyZ0utxXQgZUPXUijiZJxptOiCSSsc8cY
 MUFaLHXNP8A0AiTNIdHxybiFmahcQAnMy8msquRLPvucMf1sMegxW1KVA9chvFT/+podYcrVU=
X-Google-Smtp-Source: AGHT+IGG/e4K5kl2g5qaGWXZhXDf1jjqecL3qs0J0rSxamDS+7bc/p6tPrBO75/RwJziW0P/3ywZVg==
X-Received: by 2002:a05:6000:420e:b0:3ec:db8b:cbf1 with SMTP id
 ffacd0b85a97d-42704d900a9mr8415811f8f.24.1760953229168; 
 Mon, 20 Oct 2025 02:40:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a6c5sm14610953f8f.28.2025.10.20.02.40.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 02:40:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/4] hw/arm/virt: Remove deprecated virt-4.1 machine
Date: Mon, 20 Oct 2025 11:40:18 +0200
Message-ID: <20251020094022.68768-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020094022.68768-1-philmd@linaro.org>
References: <20251020094022.68768-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 175023897a7..ed81f3fe8d8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3701,14 +3701,3 @@ static void virt_machine_4_2_options(MachineClass *mc)
     vmc->kvm_no_adjvtime = true;
 }
 DEFINE_VIRT_MACHINE(4, 2)
-
-static void virt_machine_4_1_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_4_2_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len);
-    vmc->no_ged = true;
-    mc->auto_enable_numa_with_memhp = false;
-}
-DEFINE_VIRT_MACHINE(4, 1)
-- 
2.51.0


