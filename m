Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1495772lfg;
        Fri, 12 Mar 2021 10:47:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUt6hwQIpArgAdK21g1jg53g+8WBtCZNFMD4611SJRyGrL4D3VzGTHkeHaS7euiUfZy13u
X-Received: by 2002:a05:6602:21cd:: with SMTP id c13mr477994ioc.44.1615574828142;
        Fri, 12 Mar 2021 10:47:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615574828; cv=none;
        d=google.com; s=arc-20160816;
        b=lEhisaRMuuv4gkWXPuposumEFF0PokDZhkpulQzNLPyubLrYcNLWn2LPaI4dhaHjqR
         JIm5+0lSv9jKF3nOu7X9Umebh/4ekINLt5VZiEc4zVa8JyMws4tfWx5f+EzbwjZZband
         FAN0yi/Kt+v+/J3NGopFH6a0t7dm4jJUBF6jA8fZi+xsVjOX7w6oIIbmjidpu71bzmpG
         L4f+BIGxQ3p9rHFQwjyplMgUf76D73tKqW+wCB7X9R5VzqaEkZ3jIcf32fwUT9xvnqkC
         yXJJ5BJ0130xQjrx4Qs4MNN8AMcY1jEydWKEopfqDzIEdclwCG/EOTtaUkVrx+NdoBcL
         U7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qIcXZtBMSY7WdLGhZgrXmgrdR0gt1Xm1ku0prQAncBw=;
        b=S4YSD9TADJDT2xIR9rTRSZBl5ZWQMeGdYfnc7kWnD3tjDTpbXgF9W3SStyseRTORO9
         e0cusvK4j3Trcuz7d87oCvOZaLAjqCaaUnXw5rUkPiWUZkz5TAUWo13i9kcLQDWmjJwp
         i2wV78RI9I/7g6IXTmtwqZioK5JSQ2l3HKv30E/qoT40X8NzZnwD1eZP1pOjU2ky1q5S
         ryw/L3If6Bmk+4I3uayEyMkiYs9lxwHhZYGuhgT5BsvCmg9fnO69TrVZyuiSqe2KRZ0z
         +YVdklUoTyWnakx5r/TRtSNyxJAI62DM0mRvdY7GEhZp9NcjpbyxKLW9CDpUtm+7dDY3
         mM4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=upx6kE0F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si5399124iow.35.2021.03.12.10.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 10:47:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=upx6kE0F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKmoV-0001AQ-Cl
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 13:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmXB-0005mW-Vp; Fri, 12 Mar 2021 13:29:14 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmXA-000529-D6; Fri, 12 Mar 2021 13:29:13 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so15734078wmi.3; 
 Fri, 12 Mar 2021 10:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qIcXZtBMSY7WdLGhZgrXmgrdR0gt1Xm1ku0prQAncBw=;
 b=upx6kE0FvZScn1zsi7b3F3azwotDuEqN1ElJX4jYPvwGCAzXROnzixckn55/tjiIyt
 gZSEYgxJwQQ8Eyq8WjBT7Rp5xSUbvaIXJQfAuOFhyCW6KgWYiopY83igYv/XM9cW6i0t
 HcBYIQ8HJoCK7jkF03HlBEPXjPRHsl0arQZP5MmarUejKHWPWyIGDXA4XtAegSNB7+wH
 DSJ/mIbYyW/24VZbZ8eCtc6zGNUuMtNAfepNKHrodzcl625iAUPE1MKFlvP1ZuIuYKSt
 0+iGbVl5L25w/CbuU2RYzlkLvvI+2O19mS5LYw0O9OP+sPxaMpXSpcnig7P+CppIT+bG
 biBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qIcXZtBMSY7WdLGhZgrXmgrdR0gt1Xm1ku0prQAncBw=;
 b=c2TwfEFv6Dl1NQcM4mY6tmkVsbolmM1KhEJgsKeVTDBVTANlUj8tP4WNvxd7wkEYbg
 TwlP8FNPvCexTv/ztD1rdRwTz2PdC1JH6foi4H1zEFaeL3nMecv2WEt8rVrPx4njT8Ob
 7Wi8sTyyQIRIPSdrJw0fQNYxWweEKlREGdfOoLoVO3JqJ0MEh/IMlS21FXZlgHnu6fJr
 XWaAhWaqxy28w8xFIilGMAwLKMqzGg1EN68IXzBOaZDFXXaMzqef2ibmMXRLcrVtd1k2
 2nWTQDz5akKmihpUumlu0w8IBeW4BO8ivQ+98abhrA2LW0I+GCtp6zwj3xV69noBLXlr
 /RvQ==
X-Gm-Message-State: AOAM530kJTrVxUW6bR/YqLIzs8OjB/0UN20vzSqXnqXFsYi841QL9aaF
 N3vJk5EJKp9ogWvlozyC8esYtyDZMQo=
X-Received: by 2002:a1c:2857:: with SMTP id o84mr14286897wmo.181.1615573750064; 
 Fri, 12 Mar 2021 10:29:10 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j14sm8946589wrw.69.2021.03.12.10.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 10:29:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/pci-host/prep: Remove unuseful memory region mapping
Date: Fri, 12 Mar 2021 19:28:49 +0100
Message-Id: <20210312182851.1922972-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312182851.1922972-1-f4bug@amsat.org>
References: <20210312182851.1922972-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V3m6vNGls0zP

The pci_io_non_contiguous region is mapped on top of pci_io
with higher priority, but simply dispatch into this region
address space. Simplify by directly registering the former
region in place, and adapt the address space dispatch offsets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/prep.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 0a9162fba97..00a28c2d18c 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -159,8 +159,7 @@ static uint64_t raven_io_read(void *opaque, hwaddr addr,
     uint8_t buf[4];
 
     addr = raven_io_address(s, addr);
-    address_space_read(&s->pci_io_as, addr + 0x80000000,
-                       MEMTXATTRS_UNSPECIFIED, buf, size);
+    address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, buf, size);
 
     if (size == 1) {
         return buf[0];
@@ -191,8 +190,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
         g_assert_not_reached();
     }
 
-    address_space_write(&s->pci_io_as, addr + 0x80000000,
-                        MEMTXATTRS_UNSPECIFIED, buf, size);
+    address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, buf, size);
 }
 
 static const MemoryRegionOps raven_io_ops = {
@@ -294,9 +292,8 @@ static void raven_pcihost_initfn(Object *obj)
     address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
 
     /* CPU address space */
-    memory_region_add_subregion(address_space_mem, 0x80000000, &s->pci_io);
-    memory_region_add_subregion_overlap(address_space_mem, 0x80000000,
-                                        &s->pci_io_non_contiguous, 1);
+    memory_region_add_subregion(address_space_mem, 0x80000000,
+                                &s->pci_io_non_contiguous);
     memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
     pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
                              &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
-- 
2.26.2

