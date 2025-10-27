Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FE1CCF9E5
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 12:38:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDMTZ-0005fN-JP; Mon, 27 Oct 2025 08:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDMTX-0005eZ-2J
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 08:37:28 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDMTM-0006Iy-4M
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 08:37:23 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso33825265e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761568630; x=1762173430; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=byf3wvrJPaiUb+20B8P2dJNrSEIy4cHbROmq/ZIrtd0=;
 b=f7gYOTKZGl20sj8R5yWHoYXo19HgdHL5aJrsticajMmyQZ9Hf0seRMBxXVvxXdUBKr
 VWdHxC53hn0HOfkP29PYETB+1ckT3o0MAuhXW2jWNEEqGqSqjA8Urvp3GbLkXJqjEEhM
 MYAZxov5dNs0qwOCiG9/OqmdekOvssoZrqTMB1/8PRAtnTPkQcsBAg+oQvab8EL8naTy
 5T4myDbXrneoQf7TfQ4mOsa69adE18EZRZzzfOO7KoVN5Kg0N2SBac75NZomvoiub7lM
 rURJa+jgD9Lp7Cnkl427QqpdsRu5v1Kq0BcvvB3VpRzaknPf1xc6rnddXi4cWL1YWATU
 CPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761568630; x=1762173430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=byf3wvrJPaiUb+20B8P2dJNrSEIy4cHbROmq/ZIrtd0=;
 b=Kys9q33aIpumAn0GiPXT/oCV1bJSuXsANBX8wbxv8DKsFDGi9c3zeUpOubIJhlN2W9
 AoDwivWBx7AZBDWB2JQkh7bO13QHkE+7CewD6JVNm9APaqxuw2DjnQ3jF9nARboUZKjH
 ginRazNTBlqxfp5cGkbabe0yXiCnCZ93+qYpyNa4rLRDZwAPjS6MsdnUhleqfzG6PxmU
 s02YvcvuVjNWhk7nBajAb8YGcscvA6IG+iq5Rjv6eCKMsIgMf0XPtp39eLxyn/j563Xd
 JLmReJcO+MKyFSGZfOQTd4trPtimbSdhvjsKb/vZIbIzden+ZzViV63wLosRj1VnZiHg
 MKxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOiozgW7Z2/di6bd1nH7SUNzwuu9dj3oDAvELA/8288U/aWJUArzw8La31PSDIZfFM5k/SEFmeDQ==@nongnu.org
X-Gm-Message-State: AOJu0YxLHbcidEuST35POUNde6WwpoIJjTZxQ5MSKtEIGI1/w8d6X20q
 iZKZhetgS2kfn7nyiR4v0rpgsJOikgcqDNFusZTWgCU4yPfZPY8y3DHjz2Z0jQLkz08=
X-Gm-Gg: ASbGnctyZoZsljojUHQ6ly7J528wH4iujMS1Lx9U/HK5r1U0ahl/ki8Bqykav3MDKsN
 zzcq91Cw9+K2H6bpySUv72Yp4cIGOEIccxk/7zHlTRiRFUqWeoKHFSftWHNyuSHXI0N6zTashY5
 8PTEMCdVHpaSJPZEPk7D/oPQ5mkyImPAKxY0YGxxLKegJoyWbCvzmni7AbbgO2uPKSJfdEstYYS
 UUMHUHK+VXByPsiav2hu40PRgZBRlmO0Jbxh6CkFg1/CW8YHd/kEOj/U6/RWMhGiS7hg15Hy8eo
 5VbM5eDp2jhkqTmEYKZy9yeaLYZ/3v26lAShYbv42evgDT99iD5slnUiXrSuruS6N1ltvRf23SM
 kZxT8RRB0mANI0ADNXfzWgd0Ec0MdMRzLY6EnTPrI1fWseWercX0rxDc6teMi80AfGvjFs91Tnq
 nUN3KX4Tx2UQyltn4sR3cz3IF3lvmlFY/WtYeVUlb/upp7/sScag==
X-Google-Smtp-Source: AGHT+IF0HM1WPelwexRRvaRYywTdAciouBmeE9MMLLDlaRyIPNrEjKd09Zq7ElpyHHwfs+kdey0Omw==
X-Received: by 2002:a05:600d:8317:b0:46f:a8fd:c0dc with SMTP id
 5b1f17b1804b1-475d2412e43mr75835965e9.3.1761568630468; 
 Mon, 27 Oct 2025 05:37:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd489fa4sm130398515e9.16.2025.10.27.05.37.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 05:37:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Helge Deller <deller@gmx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Peter Xu <peterx@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 2/6] hw/display/vga: Log unassigned MMIO accesses with
 unassigned_mem_ops
Date: Mon, 27 Oct 2025 13:36:39 +0100
Message-ID: <20251027123644.63487-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027123644.63487-1-philmd@linaro.org>
References: <20251027123644.63487-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Replace unassigned_io_ops -> unassigned_mem_ops to log
accesses as MMIO ones.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/bochs-display.c | 2 +-
 hw/display/vga-pci.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index ad2821c9745..9fa52234219 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -286,7 +286,7 @@ static void bochs_display_realize(PCIDevice *dev, Error **errp)
     memory_region_init_io(&s->qext, obj, &bochs_display_qext_ops, s,
                           "qemu extended regs", PCI_VGA_QEXT_SIZE);
 
-    memory_region_init_io(&s->mmio, obj, &unassigned_io_ops, NULL,
+    memory_region_init_io(&s->mmio, obj, &unassigned_mem_ops, NULL,
                           "bochs-display-mmio", PCI_VGA_MMIO_SIZE);
     memory_region_add_subregion(&s->mmio, PCI_VGA_BOCHS_OFFSET, &s->vbe);
     memory_region_add_subregion(&s->mmio, PCI_VGA_QEXT_OFFSET, &s->qext);
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index b81f7fd2d0f..583f5d5dee6 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -254,7 +254,7 @@ static void pci_std_vga_realize(PCIDevice *dev, Error **errp)
 
     /* mmio bar for vga register access */
     if (d->flags & (1 << PCI_VGA_FLAG_ENABLE_MMIO)) {
-        memory_region_init_io(&d->mmio, OBJECT(dev), &unassigned_io_ops, NULL,
+        memory_region_init_io(&d->mmio, OBJECT(dev), &unassigned_mem_ops, NULL,
                               "vga.mmio", PCI_VGA_MMIO_SIZE);
 
         if (d->flags & (1 << PCI_VGA_FLAG_ENABLE_QEXT)) {
@@ -285,7 +285,7 @@ static void pci_secondary_vga_realize(PCIDevice *dev, Error **errp)
     s->con = graphic_console_init(DEVICE(dev), 0, s->hw_ops, s);
 
     /* mmio bar */
-    memory_region_init_io(&d->mmio, OBJECT(dev), &unassigned_io_ops, NULL,
+    memory_region_init_io(&d->mmio, OBJECT(dev), &unassigned_mem_ops, NULL,
                           "vga.mmio", PCI_VGA_MMIO_SIZE);
 
     if (d->flags & (1 << PCI_VGA_FLAG_ENABLE_QEXT)) {
-- 
2.51.0


