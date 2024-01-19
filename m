Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp879353ejg;
        Fri, 19 Jan 2024 03:38:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq1yIuQFRlumgZYHzqzPNB82U/J+SJD5dHdqneVov5KaC4PS1GP7JrtA4EO0OOJnS7QzCR
X-Received: by 2002:a05:6808:ec6:b0:3bd:9bbd:c221 with SMTP id q6-20020a0568080ec600b003bd9bbdc221mr2560887oiv.112.1705664295303;
        Fri, 19 Jan 2024 03:38:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664295; cv=none;
        d=google.com; s=arc-20160816;
        b=sFCMowyKdzK0Cb8RSXgTDl/P/uKdYVIcdn4U289jV0udtmeJhkrN0TS/CLjMFReb8M
         Auz2627TD1TlUChQsZmGQEdWNZgQId5k+5vNSHDkm0eOxkaHqBTCNT6c/GiSACK2OHyF
         1TYftPemwL4cKQ2Bx7bRz2FipX7QoE3WrRZv8nyGGJDIJwmc3wKgfwSS24HkC7l3rpq5
         Sh0/Ubrn1Ub4zD8WIBxr+IpfLEd9lRKorb6BD/haGLpVG6LGr9etVUV230N1biP340sX
         aua6SzZp6PB9MDIZoGHP+Y6gTD8FT6aK9o0Ta8/MB0SCSTXb0pJRw0+nuTKRKIMWAoNB
         R2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OAd+hsmqGnC7BEM4hV/k6DWbPNlhhbttEWZwCPVCQ9Y=;
        fh=AgN8TvM7pMmL5RKrQhAJxXwOmBywzcClhFxW1SQC+/4=;
        b=GMOPEcc6icVljy7EGHnPiZsU7AW3RZQYqfGisE3zgWn8yHTcgr1od2X67Vxxs8MXD7
         qO+dvmG4Em1owHK/t7mIbTMe/Fs1tEds+i3+QMqvamiogBRkWsGWNMz7pfUMS4vkKR3Z
         V5wB13PHDHIdfWxazayh9agnNBbounAGfCfp4Sn4vckjoYAdYqWt4fqrc+0/DJeIbZw6
         oKvrI+sZ2EtFGropN3fkmz20wIcq9nBQCHJcfFjlYa+N6eSpcwvPtUw6yEzRxHvMGTxQ
         zRL2QgaqBLo3OS7V+1ER7my84T81Y8PnG9dGpgfhFNIMTD60CNu7dbLBUatFU+k3CMCZ
         suZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n6xOaMdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05622a131300b0042a29523735si454031qtk.278.2024.01.19.03.38.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:38:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n6xOaMdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnBi-00075F-IZ; Fri, 19 Jan 2024 06:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBg-0006qe-JD
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:28 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBd-00032N-4h
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:28 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e76626170so7150615e9.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664243; x=1706269043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAd+hsmqGnC7BEM4hV/k6DWbPNlhhbttEWZwCPVCQ9Y=;
 b=n6xOaMdSS8y0qzi5fI0HInImnj5gJ+72vuHTDC0yA7lGP4Q49I738O3BJRhvzWFIbY
 Z8yyjC7MAE529qxGo+27gDKz/pI7AABnhs61gKoFcEZFvy+KdH0W4QggKju5Pww4nVd/
 mmKTgwWurKF+IaPjOYmcOyTiCAk6yDm9v7BKK9nGm4pZN2WnPbO0tD+epBZcDNs2kNLH
 53DVniaBokY+JG3HkonwgNdP5YIRz/4cVr9HjZ09cjTOYcKcYpOUH3wvSAK+z/PBcQvp
 tT5wypFdK7wg8XO1DSXsihrKpKHf8RSzbjuvJuDmXaZEdMQNn2C2RJLE2wm9pblQAl5X
 IeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664244; x=1706269044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAd+hsmqGnC7BEM4hV/k6DWbPNlhhbttEWZwCPVCQ9Y=;
 b=dJT/yJSBNUWKt+0c2QwUzS3b70gW+lMfgoxZs0lbAS9BzwxrGZWt37eSCWtZdIjZTk
 pemiw9S6RKnvflOELdU6dFNQ/LpP6P+ehPNPcWoni96I3JLAQq1yq9yh7cNQHXzSpLlJ
 OIAgxZsrTQk2TF3ZNTSwu/OQISr1871/m8CGhf5eB+O+y72TXW8fuFsSNlJhzQOsiT9+
 BGWDfr/z73A6C9dV8NScBjm3VsqfMLkMNZD3QGGTDJCFZY+4Q7t/rKBvJbFV4QTBv6HW
 RMr2e97oWB7OTJHmyKqOMr6bnHfDHSO4zFsS0l18oYVfzsvRjPfIfM7czDIrNlN7vMqB
 JmVg==
X-Gm-Message-State: AOJu0Ywxnx40FHocpJOFAdQgDQETysDiDAjZUWuas7jqm/sRk+3CVObY
 K5zX6r++6I3ca490hyIz/V2CqKUBhTMKc8BayKDv3of7GAUs1RF9GKxZlHdsSEY=
X-Received: by 2002:a7b:c3c7:0:b0:40e:5280:2ebc with SMTP id
 t7-20020a7bc3c7000000b0040e52802ebcmr1254778wmj.152.1705664243768; 
 Fri, 19 Jan 2024 03:37:23 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c4e8600b0040d6ffae526sm32950428wmq.39.2024.01.19.03.37.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PULL 30/36] hw/scsi/esp-pci: generate PCI interrupt from separate
 ESP and PCI sources
Date: Fri, 19 Jan 2024 12:34:59 +0100
Message-ID: <20240119113507.31951-31-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mjk3dCkwm1OI

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The am53c974/dc390 PCI interrupt has two separate sources: the first is from the
internal ESP device, and the second is from the PCI DMA transfer logic.

Update the ESP interrupt handler so that it sets DMA_STAT_SCSIINT rather than
driving the PCI IRQ directly, and introduce a new esp_pci_update_irq() function
to generate the correct PCI IRQ level. In particular this fixes spurious interrupts
being generated by setting DMA_STAT_DONE at the end of a transfer if DMA_CMD_INTE_D
isn't set in the DMA_CMD register.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20240112131529.515642-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/esp-pci.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 7117725371..15dc3c004d 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -77,6 +77,29 @@ struct PCIESPState {
     ESPState esp;
 };
 
+static void esp_pci_update_irq(PCIESPState *pci)
+{
+    int scsi_level = !!(pci->dma_regs[DMA_STAT] & DMA_STAT_SCSIINT);
+    int dma_level = (pci->dma_regs[DMA_CMD] & DMA_CMD_INTE_D) ?
+                    !!(pci->dma_regs[DMA_STAT] & DMA_STAT_DONE) : 0;
+    int level = scsi_level || dma_level;
+
+    pci_set_irq(PCI_DEVICE(pci), level);
+}
+
+static void esp_irq_handler(void *opaque, int irq_num, int level)
+{
+    PCIESPState *pci = PCI_ESP(opaque);
+
+    if (level) {
+        pci->dma_regs[DMA_STAT] |= DMA_STAT_SCSIINT;
+    } else {
+        pci->dma_regs[DMA_STAT] &= ~DMA_STAT_SCSIINT;
+    }
+
+    esp_pci_update_irq(pci);
+}
+
 static void esp_pci_handle_idle(PCIESPState *pci, uint32_t val)
 {
     ESPState *s = &pci->esp;
@@ -151,6 +174,7 @@ static void esp_pci_dma_write(PCIESPState *pci, uint32_t saddr, uint32_t val)
             /* clear some bits on write */
             uint32_t mask = DMA_STAT_ERROR | DMA_STAT_ABORT | DMA_STAT_DONE;
             pci->dma_regs[DMA_STAT] &= ~(val & mask);
+            esp_pci_update_irq(pci);
         }
         break;
     default:
@@ -161,17 +185,14 @@ static void esp_pci_dma_write(PCIESPState *pci, uint32_t saddr, uint32_t val)
 
 static uint32_t esp_pci_dma_read(PCIESPState *pci, uint32_t saddr)
 {
-    ESPState *s = &pci->esp;
     uint32_t val;
 
     val = pci->dma_regs[saddr];
     if (saddr == DMA_STAT) {
-        if (s->rregs[ESP_RSTAT] & STAT_INT) {
-            val |= DMA_STAT_SCSIINT;
-        }
         if (!(pci->sbac & SBAC_STATUS)) {
             pci->dma_regs[DMA_STAT] &= ~(DMA_STAT_ERROR | DMA_STAT_ABORT |
                                          DMA_STAT_DONE);
+            esp_pci_update_irq(pci);
         }
     }
 
@@ -350,6 +371,7 @@ static void esp_pci_command_complete(SCSIRequest *req, size_t resid)
     esp_command_complete(req, resid);
     pci->dma_regs[DMA_WBC] = 0;
     pci->dma_regs[DMA_STAT] |= DMA_STAT_DONE;
+    esp_pci_update_irq(pci);
 }
 
 static const struct SCSIBusInfo esp_pci_scsi_info = {
@@ -386,7 +408,7 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
                           "esp-io", 0x80);
 
     pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &pci->io);
-    s->irq = pci_allocate_irq(dev);
+    s->irq = qemu_allocate_irq(esp_irq_handler, pci, 0);
 
     scsi_bus_init(&s->bus, sizeof(s->bus), d, &esp_pci_scsi_info);
 }
-- 
2.41.0

