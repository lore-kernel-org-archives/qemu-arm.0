Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B04CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:19:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kDD-0003fw-SH; Fri, 17 Oct 2025 09:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kCi-00039u-Hk
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:10 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kCc-0004Wd-AZ
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-427084a641aso348773f8f.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706537; x=1761311337; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2dGA9E/7enUo1xiFtF4GoGzAAYgr7kkVUtVi1E8qaA=;
 b=if0W6DJA2t5Y6cMKo5hxCoH2aPkY6o8V689fz8pHM6/EVPF0OTg+nFz2/Hrdwo0PfF
 +Gyfyb3QCb4JLjL3wv6fNvp0XKxvZX9NHUFw1QDFfnqLfteudVkM6fM7On9IOdaw/jV3
 CVzU969WLTLChL9TSJIkOHx/+nuOWmsYzVc9IRTU/EtWgCULhZjSGlNVwTqzfRV6xjwN
 H3TsfSv3oMYd12PyzmZu73UHjlK93X8Z785NQheK+hcxs3JSqiMx/HYlQnnt93zFOBTs
 2pt4sJEEuAHaTPQ2OhVYv6bGAs/IM0NWjzmn/6KhB3h5KjL+hABYS9DU6ByDvtpB+sui
 c0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706537; x=1761311337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2dGA9E/7enUo1xiFtF4GoGzAAYgr7kkVUtVi1E8qaA=;
 b=krF1EB2hvqUwl9HZxnjXY98XLZ2AwhdlM8ELqMLqPQFWGDNJlmEzH5PRZ0x6p1SW1G
 9cPGIzuhmLSZ3i7+B24y0ix4t9OXnFd+bCNGEeAMlTrkbagU72oRhhOeZ6HK5O2IXpni
 uvdUaX0uDjg4FPG/nQF6dW2fUPwK5SXvSm8FO5nIp5Zi/UeUvAc45RL5ngp5RGZsLvjv
 4Xqvq2cpI/WN4a16f0M38v5Zjyau47vDr874lLWrSJZB2rLHhwcV8B5tBC2+V9dObqPn
 v/tdhFxBjNDeaHoXxS8tJfpHYLuhnZlSnCWbabFYyc5wI1J9kAGcosjfhzwawtZyot3k
 C/yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXngqNszDrp/Ll+/4l0j+o+mjgBlQHwZeEanntuyYrZyvaVYC8tsUVBerXrjpTGm3FUvnfG8imP4A==@nongnu.org
X-Gm-Message-State: AOJu0YydWUgxakCQoIPshTh2LrXizBl9QUWqw83HDp4E8du1MBwD7/yL
 Im4BAdnNf+fBecs07TxyVTUrBpOzz9UUWIjA/dlRcO+qKo0lbwKFQA1ggk9f7Sl82CE=
X-Gm-Gg: ASbGncsNV7ZTd5G5rIu+b5MvwKPgfUjkKhsJ7duugOue87hQFoOyn2GMHJh664vFyHT
 8OlWqWl29XD4KnbLlroUlGDv1HP+8PXlskWaVfcQCeBZ9MJqzie0zuPm1ep+Li/TSm+yAWwDFtV
 C4AphE0+I6az2AwX/Zx7b5ZBLXN8kvMmp80Myh8sQFOglOBBCeOZuwOmp9GpPJpYJAFX7IIYa+A
 6p/UPlFEgH3YZUmHJhBjqJ0zXuHncAm+JQ9OUzb53HV1i5TJaqScePSmSmtVD5swAb5mugEmuB8
 ayKDOKAoXCIoVq9ogKUetGoASVGu/0XB3JhglKxViF8QX7kKv0HA0FWyhKXsfB8FsIy31AdNfnv
 qLsLQxj08uJThNrhYsxMi8HAf9BScDvhS8FY3zKaczWmJ/gfiDGOB7Tk10acEk3Ye8KBCoWGFMm
 l4B/RZ8SMl2zLX5BqpF3+kkhNFcUasNG8Tcb0aqp1/PZba5/FmHs8t3f4YGK+o
X-Google-Smtp-Source: AGHT+IGZSyGz+jK3KDdFgnotj74SkNDWTBQJjwkvckB37chYrLjPq+t+RdEPCMd8CXleDIqd5D/2ew==
X-Received: by 2002:a05:6000:288b:b0:425:8133:df1b with SMTP id
 ffacd0b85a97d-42704daafd1mr2512089f8f.61.1760706537379; 
 Fri, 17 Oct 2025 06:08:57 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426d0d9050bsm38988119f8f.13.2025.10.17.06.08.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:08:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/20] hw/arm/virt: Remove deprecated virt-5.1 machine
Date: Fri, 17 Oct 2025 15:08:06 +0200
Message-ID: <20251017130821.58388-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 953b2e5a94f..b7ea180bcf0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3663,13 +3663,3 @@ static void virt_machine_5_2_options(MachineClass *mc)
     vmc->no_secure_gpio = true;
 }
 DEFINE_VIRT_MACHINE(5, 2)
-
-static void virt_machine_5_1_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_5_2_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
-    vmc->no_kvm_steal_time = true;
-}
-DEFINE_VIRT_MACHINE(5, 1)
-- 
2.51.0


