Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AC2CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 08:05:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDegO-0006Bi-CW; Tue, 28 Oct 2025 04:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDegN-0006Ar-J3
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:03:55 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDegF-0000pw-D8
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:03:55 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-475de184058so12574665e9.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 01:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638624; x=1762243424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfFJAb/KcoEMKci+o785xcZsNgBjcX1J9BbfpmwSLMI=;
 b=OGoLgKdVoCaE2T3xH9wupfPbDGMJ/xnctBPlyqMa/y5KE3ZRjO17R2yQwWGaZrccvk
 kkedxlerr73yonHvcghIJQSmeqdHIUVdOkL4sZyNYASTCyChcjw5gn8lm3gQA7nvObRM
 TkkJzWmdDIRFJjEfrltjgewCliLbOI4tvplp8X11T6J8iCVerAmDxO7/IwU9ZuENAGxi
 4cxSwkPcFOzTJW7Xnm+1DStH7QFHJ9CunF5zsk1F/8fCuHMqKtmNLmK4yfIzuRSKUqgS
 g2WDwd4ctzPrhxiGS7DKICUT08J94XmNfoIkEZ1foULuUXvekmUQ9v2n2xQlMkAgNfp0
 TnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638624; x=1762243424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfFJAb/KcoEMKci+o785xcZsNgBjcX1J9BbfpmwSLMI=;
 b=CJrA89kutSFetAiaVNp33VZq+YbZhL8836x8Rcyr3N0kp+tbdBJGwdFln9Ivm+sYk+
 V6GxzCvic1OT9v9FBXzzzQoGmyR2WquhhbK94PuiSWywa+0mUkutT3RdiJrrQDqk0uqe
 dOsOwPXfM44iUnVpn9AGvRKdocPbYvMc1ixH6tTVeB2aB16nIW7LpaFGyX7adX3fiM56
 zAf+3Pc8D2cSNHfcUeSv2ksysxJ+BUxWgRjd5bZ2fOfDUAoF17ZzFL2CMv1G1ilS4sgd
 PWJQICpuFZhONY9UvEdf6ZcdvpUIdYVzKeKSTM1lltoHpiAM4Z9VDgz34ULR9T/h9Ap5
 h9bQ==
X-Gm-Message-State: AOJu0YzZC5NqVCXtnbazfetgKZRRPJME6CydfDsNtK5UvO9v+QBrzbKv
 JAc5ZEAdY+7870pGEwKuvFcrlP7sNOB7qzxUtDnG7/Sm3zlLyoLYmWHEKLxxlt/rG6i8KEWVet/
 vcN5blaY=
X-Gm-Gg: ASbGncsn5Os9ACo8aPNwoRcSHn1dw5Srz7zEWx54l+n3+3SrgQOsoNupLpeB9IvqYvC
 VmipBFDE/dy/UnTnkxqy3uTLHcQwbQrLb9JIpeohxWT6GhX9MTUybAeskWToHbRwLde2kIelr1T
 OxNlhZ92zRGRmXr3YzpViHhOgyGAM6bm+0aMlI3gE8BOlq2X03LFVVa4DrkYxrjy7VNkfOgU5Gy
 sNwsmpoTMyYbG5e8jGXhhSyNLEH8fIj3nmD4p2icFxhtrjs1E2KngKw3bETCBs2L6p+ddcK2NOt
 Mj2qzNdOE9wi+0AORCWyuyYwnDq2mOlocaH7OiB0z03eBHzagc/1AqTSXtDTS6dN8u0KDqYKlAO
 WfXovowegngjN8cxWpjSwAkN+Yq9P6dZi4bwPWdJAHaUnH3GsGd0n7VimOAcnnVl4wPNpuISTtN
 gPOfgEomD3YgeV8Aj1ZU+v9vMfkHWF/3Q0KNSuriixMRqmY9l8B9oobmw=
X-Google-Smtp-Source: AGHT+IHslOLt0A2dbjqzbLtEsNJtl3R3pIFza8TJNrv03AKv+l+uzukq9Z2XKJvp6fa0I0jvn6HcRA==
X-Received: by 2002:a05:600c:8b83:b0:475:daa7:ec60 with SMTP id
 5b1f17b1804b1-47717e522ecmr18646975e9.21.1761638623972; 
 Tue, 28 Oct 2025 01:03:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4924e2sm181628655e9.8.2025.10.28.01.03.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 01:03:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 2/7] hw/i386/microvm: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 09:02:52 +0100
Message-ID: <20251028080258.23309-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028080258.23309-1-philmd@linaro.org>
References: <20251028080258.23309-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/microvm-dt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index cb27dfd732e..d7f49bc1b5f 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -71,7 +71,8 @@ static void dt_add_virtio(MicrovmMachineState *mms, VirtIOMMIOProxy *mmio)
         return;
     }
 
-    hwaddr base = dev->mmio[0].addr;
+    MemoryRegion *mr = sysbus_mmio_get_region(dev, 0);
+    hwaddr base = mr->addr;
     hwaddr size = 512;
     unsigned index = (base - VIRTIO_MMIO_BASE) / size;
     uint32_t irq = mms->virtio_irq_base + index;
@@ -150,7 +151,8 @@ static void dt_add_pcie(MicrovmMachineState *mms)
 
 static void dt_add_ioapic(MicrovmMachineState *mms, SysBusDevice *dev)
 {
-    hwaddr base = dev->mmio[0].addr;
+    MemoryRegion *mr = sysbus_mmio_get_region(dev, 0);
+    hwaddr base = mr->addr;
     char *nodename;
     uint32_t ph;
     int index;
-- 
2.51.0


