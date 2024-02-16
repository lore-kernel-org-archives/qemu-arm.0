Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1151675ejb;
        Fri, 16 Feb 2024 03:05:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1shxCl3jtv8Ipi0cxJJxy1J54cmlSS8To5/vtiPmxDKC5kotgQfE19oifqQoFbFO7wkcbrEOztpXXZEfmAAXYIGJH7Zem
X-Google-Smtp-Source: AGHT+IGfTvxKdmxtAzQTePRMjMypkX3Z5pVuiIA2/XC8RgRsofRuT7Oqokl+t5/0UsDoQkt90K2v
X-Received: by 2002:ac8:59c3:0:b0:42d:b436:d319 with SMTP id f3-20020ac859c3000000b0042db436d319mr5750831qtf.24.1708081511261;
        Fri, 16 Feb 2024 03:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081511; cv=none;
        d=google.com; s=arc-20160816;
        b=K1SKZjJPxR86Fo1Qj34SN0K2FRseqm452wqOM+2nb+CaGymX/O+UqW1pnJNbF06Dv8
         tzjuA8TJbb8sYoSQYS0G7getwxitMR2qJFEFdF7R1u64A6SXbZxxYPearsuKRPKNCkq6
         nmd27/Tp2zZv3bt2KzlIM8qN4B5EaIq0Kk9iKZIZZR1nANNxB64oxzIYCUmSaYjloeWU
         nsAIZOAnw7YVCplS7E22dJjPRui953AYHFU7Tt250q4MVlqhnQgRIKtjDYAfMawGqPdb
         CvT050+0/LOieAEbFricRv2jN2fdWjrOT+9eBsqIghwbWNnAH3BUmc/siCliOqS8tH8N
         Xf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SDE/2ozeILt8icMDCEMhs9DK4Gx3Yb4arama1t6dDAI=;
        fh=1CsvuuPs9UPSTZuV1m9yFwpqVLOER2vpzJGWrJFmFxE=;
        b=Y9hLqlawEP9k/IEY+nqcA/c+MF+Iq4AKAmsKnk1BzejlBeAqnMKXZAsxMWRXpbqfqx
         /XCmpdU08Y6L//3q1Le8dlj79mY1IC+Z9Yn3n1Q7xf9Qfua1Y1hYpZidrYzrMrszRnvf
         RgxF5JSGlAi/WjmUMyUO3HKT6FOZlRG8p1K9HGKO4p6oNdSSgcs4oUqb+barcZ+MXvcU
         gr7Y8bTlJlRN4CY3YO97vchuA8V+yssJW8rktA0IQ9bvuuy+jVgbaJao5k86sdDcBMk0
         ef4LvcqNR34OFuRjach6Nxgf8IB/xxpk+hSYAYqctjr4/iPJDygBQ41gd4L//Ti6S7uU
         3ncQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zRnddEaP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20-20020ac87654000000b0042c80a273c5si3424270qtr.621.2024.02.16.03.05.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:05:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zRnddEaP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw1S-0008Jb-OU; Fri, 16 Feb 2024 06:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw1Q-0008Ii-Hw
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:04:48 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw1L-00017B-7o
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:04:48 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d09bdddfc9so23447021fa.2
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 03:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081481; x=1708686281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SDE/2ozeILt8icMDCEMhs9DK4Gx3Yb4arama1t6dDAI=;
 b=zRnddEaPVtVB3ljS8L4qwXg3FSFcOSNQNEZmwKN+dQ3hu6DVbC5oYtHoQ7atunkP+F
 sCmlXBhPEQPVjb4C2C+w/cGV8tO1aABftXwSMnQM0F3h7ky9mts1rzkmT6yRkepX2G1B
 jmHzrYz1ZREiP+ondn179HOmhdU+5xcPoZmxEUopslBQLVF1fdwbBQCy5Udtl6vLkfZx
 v3KOZq+F2/sni8rmSkKlGtfhb+l0fVyH2CmFNWDbUR9hH7G78+GxDbIf6tyP1T2A13rA
 d6DfZ1J3Z6l+/hjzZ1YG77ymj5pdx2XEE1O8t20ph21h1/x/LcELMWx+lnnJ6HiV29bo
 qLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081481; x=1708686281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SDE/2ozeILt8icMDCEMhs9DK4Gx3Yb4arama1t6dDAI=;
 b=S7sz9/3proohErWBteSmZasxXhibV2NcRm9ZnyS/6a44Q808ob2Zdzv7a7rQ6KLRSf
 hznNqi9CiV0uOcvKZcw0PKuurxji3+1FID8EUNaTq1jnbYSYnBeYi6tXpWS3PDCP2FiV
 ymROr/tztnL6dTRZQKZEAnSKQ+BmdXphgQ74L2EzKfZWgOGjVCzx3dmSh5CelR5S+bSu
 UgHNqyRbFlw+WF+msu+JwhjvtGzn0eKVbBBUWxKAChDTBVCDxcRU5Ar/swpDdNBTR/Go
 VanvXaAHnkSEYeVuUfpAZSakrEj5DYqBWQUJAFjyQw/s30QocaevTqBOxnkAw0ivrIbz
 NxfQ==
X-Gm-Message-State: AOJu0YyFLMmJsD6+Eh9i0vp5J6j7DCVO4PF7EQhNCb7D647tzSCbgo37
 oz9kX4bwm4oQwSVVf7TBvphCSDE3+zZr7e3RM81tV2ZoWI06soMze26uQWKtENs=
X-Received: by 2002:a2e:8950:0:b0:2d1:26f0:8167 with SMTP id
 b16-20020a2e8950000000b002d126f08167mr3170282ljk.35.1708081481655; 
 Fri, 16 Feb 2024 03:04:41 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a7bcc92000000b00411a0477755sm1963807wma.9.2024.02.16.03.04.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:04:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH 13/21] hw/pci-host/raven: Embedded OrIRQ in PRePPCIState
Date: Fri, 16 Feb 2024 12:03:04 +0100
Message-ID: <20240216110313.17039-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: qjo5epPV+RlW

Since we know the size of the OrIRQ object, we can initialize
it directly in place with object_initialize_child(). Doing so
we also set the QOM parent <-> child relationship.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/raven.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index c7a0a2878a..9e47caebc5 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -60,7 +60,7 @@ DECLARE_INSTANCE_CHECKER(PREPPCIState, RAVEN_PCI_HOST_BRIDGE,
 struct PRePPCIState {
     PCIHostState parent_obj;
 
-    OrIRQState *or_irq;
+    OrIRQState or_irq;
     qemu_irq pci_irqs[PCI_NUM_PINS];
     PCIBus pci_bus;
     AddressSpace pci_io_as;
@@ -249,14 +249,14 @@ static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
     } else {
         /* According to PReP specification section 6.1.6 "System Interrupt
          * Assignments", all PCI interrupts are routed via IRQ 15 */
-        s->or_irq = OR_IRQ(object_new(TYPE_OR_IRQ));
-        object_property_set_int(OBJECT(s->or_irq), "num-lines", PCI_NUM_PINS,
+        object_initialize_child(OBJECT(dev), "or-irq", &s->or_irq, TYPE_OR_IRQ);
+        object_property_set_int(OBJECT(&s->or_irq), "num-lines", PCI_NUM_PINS,
                                 &error_fatal);
-        qdev_realize(DEVICE(s->or_irq), NULL, &error_fatal);
-        sysbus_init_irq(dev, &s->or_irq->out_irq);
+        qdev_realize(DEVICE(&s->or_irq), NULL, &error_fatal);
+        sysbus_init_irq(dev, &s->or_irq.out_irq);
 
         for (i = 0; i < PCI_NUM_PINS; i++) {
-            s->pci_irqs[i] = qdev_get_gpio_in(DEVICE(s->or_irq), i);
+            s->pci_irqs[i] = qdev_get_gpio_in(DEVICE(&s->or_irq), i);
         }
     }
 
-- 
2.41.0

