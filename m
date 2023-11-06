Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3005299eja;
        Mon, 6 Nov 2023 11:58:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2PGhiEjUmKM18fuA8eR25bpBaU30PSu87VttCIpSWndH3RU60RkMroDGVGSU8yIa72Zfh
X-Received: by 2002:a05:620a:2b82:b0:778:9713:9d7 with SMTP id dz2-20020a05620a2b8200b00778971309d7mr28431756qkb.77.1699300713169;
        Mon, 06 Nov 2023 11:58:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300713; cv=none;
        d=google.com; s=arc-20160816;
        b=PXsNov2iKW2hJxfDged2F0bLTpns034wKd0qBJGyQZUux38ukX3B/PpmVWXXCu8n/n
         75fy8AeiDX6tqkLsUkLHyD6lzTrUkIHNyF8GNNygUnkSYuh791JA3tR9NkvC+kWmh9go
         9m/joPX8zVyWP+QFD/6vNRm91DLu5BNZvqEHUW5144tSqbuDCNQDXN6kHuaNXmPwZVaX
         xP065/F848NH38Ep4IfxW/baEU79Ww/bBE0DoMIKjAU+NbkQymK86x6uuqT+zjuzywgl
         DX/f65L6+akcyajV1IwVd1FsFGuAgXZgWCwLfe/jEfiJtUun0VJfkbuoHn/aBfFnugJy
         D4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mKejtkSe+nFfQ0aoeWucod44zhEmF2o9bYQegdFzkdU=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=Rnbyk2Wj+aKFMvu1VomsKJkXcrdHq1ci08JWbZAAHkVAoY0Smlwutrv5Ey3qUN3f2s
         JmdXzvuP2kB1cFzdmcn2TD+nQW4p68y1uzCQ7AeTzVCMfK6tEacueL5V2xO5AQVJWa4Z
         Nw8/Y2nc5cbb07lizEMWihmFMGWOPOK8LAAKVNv61NVIreVgUdNLpzhuScl4E4E15Drs
         B9LsZ37sYBcTs0p0y5plKpd+au+cIDdA5/10YJYHdUQFOuIdVoWIJtZ4cNsd0v/AZuJs
         rqoo9GuYtCGaeh073yzkl8Filx9lBAJuJalVm9hSrQhnsRsMAqQItWu5ba7T7HK1Sq1m
         z2Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=Rk23+bVe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ox14-20020a05620a828e00b0077758455319si5485327qkn.764.2023.11.06.11.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 11:58:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=Rk23+bVe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r05gF-0005r3-3Z; Mon, 06 Nov 2023 14:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05g3-0005av-KH; Mon, 06 Nov 2023 14:54:27 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05fz-00066m-3c; Mon, 06 Nov 2023 14:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mKejtkSe+nFfQ0aoeWucod44zhEmF2o9bYQegdFzkdU=; b=Rk23+bVe1uIucZnhqpW349FZ+y
 COtS9j6HVINOASM87trkyxdyoXEKEExBGPZCo0r51i8vE9fdkBU4t5bDpimD0Z9xRnYrg+35a3s3n
 VEw62xkWw34eQptQZjbrnUCSIAzgj18Wr6p7Tw1s13pPMK5m8cgESyzOJZ6CAebER98ZMDSzDMTF8
 74m6OdxEHV2vTDtEsI9QtKc2jf2BGO77UaO9Tg7nOSZp4PWRa99idqW/BK0F9M5ou8UHXCaW4X0DP
 lZyWMgICBLhH1K5EaV8GegsYRSnlz+aymO6vQeWf9ko0nNiWSzNq6EZgQhXxAA730V15hB+c/yvRB
 TRQacxNw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fa-007taO-Kr; Mon, 06 Nov 2023 19:53:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fa-001GNn-33; Mon, 06 Nov 2023 19:53:58 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH for-8.3 v2 18/46] hw/sh4/r2d: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:23 +0000
Message-ID: <20231106195352.301038-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nEEUaQbtVt61

From: David Woodhouse <dwmw@amazon.co.uk>

Previously, the first PCI NIC would be assigned to slot 2 even if the
user override the model and made it something other than an rtl8139
which is the default. Everything else would be dynamically assigned.

Now, the first rtl8139 gets slot 2 and everything else is dynamic.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 hw/sh4/r2d.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 4944994e9c..e9f316a6ce 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -240,7 +240,6 @@ static void r2d_init(MachineState *machine)
     MemoryRegion *sdram = g_new(MemoryRegion, 1);
     qemu_irq *irq;
     DriveInfo *dinfo;
-    int i;
     DeviceState *dev;
     SysBusDevice *busdev;
     MemoryRegion *address_space_mem = get_system_memory();
@@ -309,9 +308,8 @@ static void r2d_init(MachineState *machine)
                           0x555, 0x2aa, 0);
 
     /* NIC: rtl8139 on-board, and 2 slots. */
-    for (i = 0; i < nb_nics; i++)
-        pci_nic_init_nofail(&nd_table[i], pci_bus,
-                            mc->default_nic, i == 0 ? "2" : NULL);
+    pci_init_nic_in_slot(pci_bus, mc->default_nic, NULL, "2");
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /* USB keyboard */
     usb_create_simple(usb_bus_find(-1), "usb-kbd");
-- 
2.41.0

