Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9D0CCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:09:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kCV-0002zf-Nh; Fri, 17 Oct 2025 09:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kCU-0002yo-1A
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:08:54 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kCL-0004TW-Qg
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:08:53 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4710ff3ae81so7300445e9.0
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706522; x=1761311322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMr/2c1ZyUR1WtFjcqaeRtpWLOfNiCEfccz8VtRx1vQ=;
 b=wSsPwnEA29L1P8MsvjLpF8yR5K5LginK9OEhbCZL+WJpk41UJK0jIPimnFMH7AGAvc
 Z5ahcj8e+mvkFWFl4IXAbB/fkers21W2iu3s1JrH87YzlfAUKqLzXesoQDGN0H8umiSY
 F/polZ9W4hi8iPUJ+P6WD17551u3jSz7nSKX78RnziBBeju+f/zSvgTk4KPA4TBX31cA
 unxjRG0IE9ERTdo2vhWWe2W5h9YpijGRVHHmnKejdQw9hXtXSHlpM6sNyHSisLHKESvu
 hhC6mGTO08i6vUpZuwjUgKasaD7Gp/PVk6aMiNLZOP2ZWbR/T/2oi1VzfdQkMyjzq5Bs
 v34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706522; x=1761311322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IMr/2c1ZyUR1WtFjcqaeRtpWLOfNiCEfccz8VtRx1vQ=;
 b=QdxLnQYdyXeJF9Re9U9ugqxabjkV9bVLpOX7DXxml1NKYS2+NoxXi12Cnm+EKxXq2i
 ee9f2IluvUwlRZGLAbMFMARjUyUPdBEYw2XYCKdz9KSBMF0/ixiO+hATCblZDM+/EkRT
 ZBVcKuwZ2GyGGEatbjTn0HaJXFRugq53EukAoczMMckaSUfyOyIsSlmNPNAH19BjQ/69
 +Rjqt7pJ386UngfOGjTgzZh0q7PAneYoTUtYFllmoSXWtYvk+3bAU3wLXtI4344AsYY9
 BgY9b4JLUhXc+S3msrUEppqlfJz6rIVYKj2gUGCEpcl+taV2DZUwkhJz8y1m7vPuVeNQ
 V6KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuIFQW52IzJHaaEIwp35c/OgCpu/OCc8gAsXZFJY5YKF5P0inzhYcnZir8RPuarfLPQYnAObUY9A==@nongnu.org
X-Gm-Message-State: AOJu0Yx+rX8hpU5FalNi0L7ILK+TEds8h8Ujv2EWNUL7c+MtAssEI1q8
 4yIWQyL1QwrsaytYebWPt2gGUwUq5d2T8xm9BYBuOu6gHX1DWCxcYzywITkqpzTf+eg=
X-Gm-Gg: ASbGncsF9pBtWxa3hqCbTMj7vzVpSlWSmtx7eaZYZ2R5sSvfLykjMGJWc38H6pCTH8Q
 jtGU7YR8l4USYagdmaxcmOZ0CJM0RJbnFg2sZyIvLxoNsSxiu9v5OcQ6zkC6pI1qrUKajpj3BK2
 4qWPuKgoSzCyV0ACRw8v1I/JFtGJ+RF6hF2ddtST90NlDVyvru30Tgy+Mw4SukpYPul/GOk5A2M
 d0fC6cq5C+wGm9fX8/8SFl/PymBVp6qr5yt3j1Aw5qfHa3lhvO+8vWHNvwe5oN9bJo+eXnKSm4X
 GpRVhAh2jvHyBbkLdSzYw9ZYMfiG0r88AkzXzK+JjSRVRjAkh3aMDUpmwui+zx2bMlus/lNaoMG
 p9O8Irj3QViO+lSp85sraSTi5ktSS1PQ9oToUFeTohKaJO+bZDk94S4LbiqHYbgAkfzD+hy3O5O
 wu9t7yWoR29bfiTYsaczVYVsNTa7+B4COotbzG/l4uDH0v9+YSlQ==
X-Google-Smtp-Source: AGHT+IEzqMZQO9uN7eVD6cRn1TCm0ymzUhC0f00xNCKJ6M9hqkNJ/FbPg4i2NvlkzlrXe9fJG4FKeA==
X-Received: by 2002:a05:600c:8b0c:b0:471:1717:41c with SMTP id
 5b1f17b1804b1-471179121f4mr23658115e9.24.1760706522091; 
 Fri, 17 Oct 2025 06:08:42 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711441f6afsm83736665e9.1.2025.10.17.06.08.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:08:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/20] hw/arm/virt: Remove VirtMachineClass::kvm_no_adjvtime
 field
Date: Fri, 17 Oct 2025 15:08:03 +0200
Message-ID: <20251017130821.58388-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

The VirtMachineClass::kvm_no_adjvtime field was only used by the
virt-4.2 machine, which got removed. Remove it as now unused, but
keep the ARMCPU homonym property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h | 1 -
 hw/arm/virt.c         | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 993872bb680..c77a33f6df2 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -123,7 +123,6 @@ struct VirtMachineClass {
     MachineClass parent;
     bool no_tcg_its;
     bool no_highmem_compact;
-    bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
     bool no_secure_gpio;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b781a218019..ffbddb711f6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2362,11 +2362,6 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el2", false, NULL);
         }
 
-        if (vmc->kvm_no_adjvtime &&
-            object_property_find(cpuobj, "kvm-no-adjvtime")) {
-            object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
-        }
-
         if (vmc->no_kvm_steal_time &&
             object_property_find(cpuobj, "kvm-steal-time")) {
             object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
-- 
2.51.0


