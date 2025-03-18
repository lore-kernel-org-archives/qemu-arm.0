Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2918638njb;
        Tue, 18 Mar 2025 06:16:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaAoje0heDX+oxHq08tebO7YnC+GHa5kR5K030J2cAMSDG4caHaO8jdjG2QGbxSrI4Q3nLJORcfbWHUA==@linaro.org
X-Google-Smtp-Source: AGHT+IGVUhDCjCbMzvMO07oBZSAoDlWIkXSA7cYqySHIgolHW4ovJX5ZKtkvsYoOHZma1kdM+Jkh
X-Received: by 2002:a05:6000:2cf:b0:391:bed:ec9e with SMTP id ffacd0b85a97d-3996b3f25a2mr3081370f8f.0.1742303778400;
        Tue, 18 Mar 2025 06:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742303778; cv=none;
        d=google.com; s=arc-20240605;
        b=WKVzyc+B7xzGEruEzF74YmxQHdT/0AK7hkybKQYzjMZM0lD2gdTRH62l4i/8xCMhsg
         jzqV3gRsNo1r+Jrxvt/AZmFj3bVvE1/E/h31gBFe97zebKxPTpOHNlYWtK9L8lLZLu23
         7E5FzFsAH6hjnecKW0gBp7V7B5ZPB758tgGZo/XuEwh1L+qkNJ7EI4KhBnfgjzkgvsm5
         ga5cZ9B1CWLFW1qeL1EGFTFm2xuPN1ettdEOUH0zCgc5oh5XeesHy39ZMWbs2oaXzcIo
         PF8XGkndhk2dQMtrXIlpxNZm0Hkmvp5lyiVFqnq+wuzooMCs/sw52W+RnpslaKqsbQQq
         OTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SXfXuqOifdkruB2nrZjTD84VGmjUDrLwEA4V1suXy7k=;
        fh=1GfpQB8Gki0TjAX1ZTgBrXi3Kycx6t5DDhWjUnH3OL4=;
        b=lVPeLho9wTUcFeF4BWgCKm3kOpYOp5IzSI2Er2mvDda/X+d4TRoIGxslyqjfb3/1Lk
         4kcSgQwewiYjCx1n9yDPshwdxlqaxbKW6EkjgWI/OD/HxP0ll5F/XCJwF0BUrxtvMEYY
         Hh8td7ysopfGn7hXWgFDEyn78NJqbgyIKRXHNXmEmYmz43Gkb3DYYLyNjxAQQqI4uwe9
         BhWWxaaNiA73SYqLieTEUtwL2TQdclOVq9cNQjqjN4wEXTVWWukBuzAvBq7Lt/P/S/vB
         M54bBBhpxXXmWrP41qZ5guSsLglzz1uBRL/wTi8MuMWhHPOHR4KmO7IwoUvkKlkcQ7Ba
         vVAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=CIMHkLSu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-395ca77e001si11120126f8f.440.2025.03.18.06.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 06:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=CIMHkLSu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tuWkh-00034b-7m; Tue, 18 Mar 2025 09:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1tuWj1-0002Kf-85; Tue, 18 Mar 2025 09:11:32 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1tuWix-0003nr-K4; Tue, 18 Mar 2025 09:11:18 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so1252847966b.1; 
 Tue, 18 Mar 2025 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742303473; x=1742908273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SXfXuqOifdkruB2nrZjTD84VGmjUDrLwEA4V1suXy7k=;
 b=CIMHkLSu/Yy0FMVkSVD5Dr2lt0AZBVj7sCluDCPDFCpaPjANYWE/W/QriHZKeCia/U
 aldn+IEN3WU8kDNhbGZ2MPOjRo93jgjv7LdJLlTtfg5+8qO3f3pcHAEyR/3EDLo1Q2lB
 0EphX2Wl/OzhUOvxgCdGY0j84Jr2w9dyTeXR1c/QQwfR/cy1FST92+VTkss2dgfezqpL
 xURIcYh8uXGf7iy0TcNpTiNrmAjdh0Pj8aOh10MnKDH/Ff9BqLPHzB8cDdX66cL3yaxP
 77hOO4rpPk7S4nJQpoGsK89abAgESVKOaiWCO/IzoUTdeslRiTIrKX5am8kS0ed2zoSj
 bRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742303473; x=1742908273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SXfXuqOifdkruB2nrZjTD84VGmjUDrLwEA4V1suXy7k=;
 b=UwkshT8kiwRbig/iDGB7xSjOB59Hw/wqBMeB5IV+3P9cL+4327LRrQH4X4+f5CXJ3e
 P13GLYtfAaqjYwTjH2YtsIe1+RpsmdWj21gyJdU/qd0pbvm2vPyxMCaiVPCBCirrMNUs
 aVjyIGC0z71byeVbHUpxsZbE6jWgKGOcyuIpHEYt3G3+Hg+vsOQNKtpT72j6vd554cM4
 f8rnhh8C92IogcWhCDHA01Zc2SS7nSbYyY0Fj+o4Kma7D399TWBmIkcfn3/egR+zyyT0
 shLwJNIV58o5zltS3LjvW/SYUhIik43RX1BQKzMCvTud20RZcMc3+rlubHGlRKXP4cld
 rL3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3ZgrgyATkrnvBRwIrY7d8VMh8Gssh3lnkdJzHElHn169nBDc50D40YSY9hu8irKencxdjFaRrtw==@nongnu.org
X-Gm-Message-State: AOJu0YzUUVgMuV9Q17Rdlux8CN8xgwK3dD4mjgLg8IXgxZj9qkzIRFaN
 kwb4Avn4d2em8osOK88gG+Ar5jmdprnmlpw/2nug2u2ctLzkw1Gf3CWigdSs
X-Gm-Gg: ASbGncuVzwBqgaF8sOBiAmMs20rGNLSZQnULO9XHOPsvF2zRUfwrF1SnkQ29768iMUZ
 /qMj/W59CoJfpW8BxtafzgHiZYjInMAhfjipfYa/Jpmjxns5mXAuvhq+cFEHE03fpj3AbqPkNZS
 DP2XGvsjJ2BuvTYIITjvnMwlIYY8WA+gfXCM2uJip4gVo8cwPZf6Q5+apvrQ/S298GA7UL6Owxg
 EyNRdwlQotv1PDdGTnPjsfedZqhFi70eegz+LLbNI13aPM23K5RLKO281ckxilNV45wVVS5KQ66
 XN78JJtIAN18bV9RgpdAzOe5eDGek/lgqEX5WFng8zCFg//exHjq2i6RR1zwNsyWtrw=
X-Received: by 2002:a17:906:ee85:b0:ac3:4489:790f with SMTP id
 a640c23a62f3a-ac38d407bf4mr414434366b.24.1742303471954; 
 Tue, 18 Mar 2025 06:11:11 -0700 (PDT)
Received: from corvink-nb.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147f3101sm850678066b.69.2025.03.18.06.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 06:11:11 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 qemu-arm@nongnu.org
Cc: =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, YannickV <Y.Vossen@beckhoff.com>
Subject: [PATCH 13/21] hw/arm/beckhoff_CX7200: Remove second SD controller
Date: Tue, 18 Mar 2025 14:08:04 +0100
Message-ID: <20250318130817.119636-14-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318130817.119636-1-corvin.koehne@gmail.com>
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pB8wyKKGvGL8

From: YannickV <Y.Vossen@beckhoff.com>

The CX7200 has one SD controller connected to address 0xE0101000.
The controller connected to address 0xE0100000 can be removed.

Signed-off-by: Yannick Voßen <y.vossen@beckhoff.com>
---
 hw/arm/beckhoff_CX7200.c | 48 ++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/hw/arm/beckhoff_CX7200.c b/hw/arm/beckhoff_CX7200.c
index 89466cfdd8..bf3c66e5a4 100644
--- a/hw/arm/beckhoff_CX7200.c
+++ b/hw/arm/beckhoff_CX7200.c
@@ -207,11 +207,13 @@ static void beckhoff_cx7200_init(MachineState *machine)
     CX7200MachineState *cx7200_machine = CX7200_MACHINE(machine);
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
-    DeviceState *dev, *slcr;
+    DeviceState *carddev, *dev, *slcr;
     SysBusDevice *busdev;
     qemu_irq pic[64];
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
+    DriveInfo *di;
+    BlockBackend *blk;
 
     /* max 2GB ram */
     if (machine->ram_size > 2 * GiB) {
@@ -318,33 +320,25 @@ static void beckhoff_cx7200_init(MachineState *machine)
     gem_init(0xE000B000, pic[54 - IRQ_OFFSET]);
     gem_init(0xE000C000, pic[77 - IRQ_OFFSET]);
 
-    for (n = 0; n < 2; n++) {
-        int hci_irq = n ? 79 : 56;
-        hwaddr hci_addr = n ? 0xE0101000 : 0xE0100000;
-        DriveInfo *di;
-        BlockBackend *blk;
-        DeviceState *carddev;
+    /*
+     * Compatible with:
+     * - SD Host Controller Specification Version 2.0 Part A2
+     * - SDIO Specification Version 2.0
+     * - MMC Specification Version 3.31
+     */
+    dev = qdev_new(TYPE_SYSBUS_SDHCI);
+    qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+    qdev_prop_set_uint64(dev, "capareg", ZYNQ_SDHCI_CAPABILITIES);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[79 - IRQ_OFFSET]);
 
-        /*
-         * Compatible with:
-         * - SD Host Controller Specification Version 2.0 Part A2
-         * - SDIO Specification Version 2.0
-         * - MMC Specification Version 3.31
-         */
-        dev = qdev_new(TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
-        qdev_prop_set_uint64(dev, "capareg", ZYNQ_SDHCI_CAPABILITIES);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, hci_addr);
-        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[hci_irq - IRQ_OFFSET]);
-
-        di = drive_get(IF_SD, 0, n);
-        blk = di ? blk_by_legacy_dinfo(di) : NULL;
-        carddev = qdev_new(TYPE_SD_CARD);
-        qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
-        qdev_realize_and_unref(carddev, qdev_get_child_bus(dev, "sd-bus"),
-                               &error_fatal);
-    }
+    di = drive_get(IF_SD, 0, 0);
+    blk = di ? blk_by_legacy_dinfo(di) : NULL;
+    carddev = qdev_new(TYPE_SD_CARD);
+    qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
+    qdev_realize_and_unref(carddev, qdev_get_child_bus(dev, "sd-bus"),
+                       &error_fatal);
 
     dev = qdev_new(TYPE_ZYNQ_XADC);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-- 
2.49.0

