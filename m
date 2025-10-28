Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CC6CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:42:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDodO-0004Y6-Jd; Tue, 28 Oct 2025 14:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoch-000435-Qx
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:40:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDocS-0005gc-4D
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:40:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4298b865f84so3447786f8f.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676822; x=1762281622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6mKiRR2Y6gxX/FAMko5pwvzjUpcIA3Fae2uarELE6Y=;
 b=a5OUm5rvAc2zT5YAl6qccxmd12IzXY6ConRlbtk/U3ECdgTXsadlp3XS3YNMb4fIi/
 DOuqMtmjw5s1gp3FcXAyLM6wUmVahgzuVQwvW21h5qI2SGGUQKMbavn0ths5ZLuwdFkN
 GhhaR0cIGca5k99xQkFWibX41aJPj7WlOtSGKxoDQvBWf+rVde5gzPlkvZRiLrxUUAQ5
 lXxT91l/mwxbxV9O+Zb8ukjWnzXZ1oHQyKp3S/dV1xdobILNZMmIdP5PkrNXVzYFx7XR
 d8Jde6jPkkgVRWyID7b4e31QwZT/gk49HdILFRNrqyW3FpiShLouHQ0EBfkrU3Suz8US
 fmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676822; x=1762281622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B6mKiRR2Y6gxX/FAMko5pwvzjUpcIA3Fae2uarELE6Y=;
 b=D9nl7Ly2YXigUe6Jdxc3aLorKG2Ceg0/KJ91rP6hvHWvX9g5sI3INKF46BxaE+4isV
 ayXJe3vdnyGpIgJn2N/SbfYafdCQg5kGdlG3M66Ea0pyX1wF29yS8kN2CFT0rRQlH2bA
 cqViCnjLILg3d+2U6/UwwllPV9dKQqQ6tQVdDkt2oTQ7asP2Rr2Uz7GPF/Ued01RXdd7
 l+53qIoA8WfCiknoH66Ufa25X8vHgdA5EWjmA+Z6toZ5JzsH0eFUE+UnGf4OWkUz6GWM
 1HHzOEbiWUkPT1LoDzu6+eRi5n5FqBfwQU5nIcguo+ouzN9gbvEwltVqJepkeKRrNwoH
 L+WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7PxszpJ9V6XmjBnMyPYjTtrtPkwv/FkVEEUyl2fqJ3WfNywIVEX3AfdUJxPwhKUSYZIQuUTwPVg==@nongnu.org
X-Gm-Message-State: AOJu0YwI1wKpNUpsliGumTE9Fw9u9Utrr6fM+eOY7IQ+Mxl9LlXYnR+d
 E1Tvec5PEvEE2cM4Q6MPbGk/EMiEan/MOA4jrr9efZAIoEdbZY1RHqr7gYovbk+0+Bk=
X-Gm-Gg: ASbGncvsXtM1P2ONya+3TgPkJaC01mHQ8Hnq2YE+itsr4b9LG8JQrrNCn0pPVkFKMAf
 ZBvhpVnZ9iVVI8Kbwg3CPSTjDDVpG8lc6y34xcb0f4xcOwxaN56kSmM6N4d1AHEPM26okiBtwpi
 7nqtD/cH5nlmYMzIik+Apvpw+x9/7k3vi2N5VevaqdHTg3AuGrRaa0z76GMj7GxIRFewHSijKRQ
 LoW87kdb4jCZs9W4cI652p3fWuJKISAUvbIbjUGGChYGgyebt5q2ntyrb0UuhaJt6jfNJTRfIUi
 B5YvFvSlLyvLWWuI4wunSzn2Jqt828gdCgv+HUKgxAbJ3ikbVYERoUpu4vIz7IHa4pgOdqVDbmH
 s7JK/0Sf0GZlXZnco1tO5D6wtEesNb4X6pOK674+1dy1BdijaQzZUWhUsczykfGfU7MxPCkG6hx
 HAe3Q47y3/0C00WxW8Mwrgbp1N5wK7+jEuoEWYeSV7v7iAPkO+NRi1oouC7BQx
X-Google-Smtp-Source: AGHT+IFZufGnD6vOxjoeW0cJzH3Qc5Y5bQi7vWtGrXP+qS8VWZFsyyYdyVamRJMlHNRGlbUSwVgg4w==
X-Received: by 2002:a05:6000:4382:b0:425:8559:5d17 with SMTP id
 ffacd0b85a97d-429aefb9a30mr54307f8f.30.1761676822404; 
 Tue, 28 Oct 2025 11:40:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb7e8sm22036083f8f.19.2025.10.28.11.40.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:40:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 24/25] hw/sysbus: Use memory_region_is_mapped() to check
 for mapped region
Date: Tue, 28 Oct 2025 19:12:58 +0100
Message-ID: <20251028181300.41475-25-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Check the region is mapped in the global system memory
with memory_region_is_mapped().

SysBusDevice::mmio[].addr is left unused, remove it.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---

RFC: Are we sysbus-mapping containers?

system/memory.c:2835:bool memory_region_is_mapped(MemoryRegion *mr)
system/memory.c-2836-{
system/memory.c-2837-    return !!mr->container || mr->mapped_via_alias;
system/memory.c-2838-}
---
 include/hw/sysbus.h | 1 -
 hw/core/sysbus.c    | 8 +-------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 69eb62e29c8..b2a2ea507ea 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -60,7 +60,6 @@ struct SysBusDevice {
 
     int num_mmio;
     struct {
-        hwaddr addr;
         MemoryRegion *memory;
     } mmio[QDEV_MAX_MMIO];
     int num_pio;
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index e6acf8dba3b..b3060e02484 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -127,15 +127,10 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
     assert(n >= 0 && n < dev->num_mmio);
     mr = dev->mmio[n].memory;
 
-    if (dev->mmio[n].addr == addr) {
-        /* ??? region already mapped here.  */
-        return;
-    }
-    if (dev->mmio[n].addr != (hwaddr)-1) {
+    if (memory_region_is_mapped(mr)) {
         /* Unregister previous mapping.  */
         memory_region_del_subregion(get_system_memory(), mr);
     }
-    dev->mmio[n].addr = addr;
     memory_region_add_subregion_overlap(get_system_memory(),
                                         addr, mr, priority);
 }
@@ -180,7 +175,6 @@ void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory)
 
     assert(dev->num_mmio < QDEV_MAX_MMIO);
     n = dev->num_mmio++;
-    dev->mmio[n].addr = -1;
     dev->mmio[n].memory = memory;
 }
 
-- 
2.51.0


