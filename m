Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp9438ejs;
        Mon, 8 Jan 2024 13:02:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOtB+AVeI8V7fVMKT0EWiAP3kt1AtS5IJKhOwaiNKUrVepr3M8QT6y8W5Pok6m5PdWbK16
X-Received: by 2002:a05:622a:1041:b0:429:9eb9:d731 with SMTP id f1-20020a05622a104100b004299eb9d731mr907821qte.113.1704747771835;
        Mon, 08 Jan 2024 13:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747771; cv=none;
        d=google.com; s=arc-20160816;
        b=JFyN4tXiaGjQVhxQsE5RLffpb1EGwdBwRoBEKw5dx3020eF8dQL1zXgPCSekHCyIFM
         MezBg3pjNhQS1U5Iq8iNbirmGy/a+CTefbhWRUWrKsqOtdP3mGFHD+fZhLe4pA0RUur+
         uT4OtMRIDGgsYyZ2lICO69+Nbw+rEjzNCDfLBUufuJVZyBZ6m8x6wfPDh2sVYWHKRSj6
         j64/oggcPNnQNkzEiM/kgDhTiEEoj+wGSXvriAxgkfQ4srdfZuEalf+S6MnTS55wr9Rc
         yGNhvY5gAWKHPHDGrwrxhrP9mDNmQu2R5uBoCsBDDa6pltjyUAgphj6qiwopiz52iayS
         r3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oLriCfKbYL3o15M6kYDB7N5HJ+JVsRg5ZZIf/+DvLkY=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=EiIA40C2tLpDyAYGE8sliC+hLS4Up6+UDOc4looMbXfzhoolBMRp+LfzqP1i4MLHFK
         KTJhtQ9E9T6leshy0npNUD8/rVAl7yXpnv+MZGWZJdBVBAFBAXJOYUm1yeT6RQ0ZNaPp
         oBbwzvgHs4UetllGz4kE3HrPZTeapGUthpMIYBPaSLirjl7yxErfZdl8toIaqsvI8Wkl
         ngJCkXB2pKFQ9YVvwPhy/WEw+E0LaAAAKdTjTGp/udeqq5Xdp8W3EVCO9QQhpkJzDJbJ
         i8ViFZvWlW+TUswvZS8NafzNRG6c/ePadiR/UId40DArqi7x644Xwoo36v7G4gDiWKDp
         2LjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=E9vGlnFd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a05622a01c600b0042999b9ea6fsi599171qtw.429.2024.01.08.13.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 13:02:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=E9vGlnFd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMwbX-00005z-0X; Mon, 08 Jan 2024 15:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rMwaD-0004l3-3D; Mon, 08 Jan 2024 15:50:53 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rMwa9-00017T-41; Mon, 08 Jan 2024 15:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oLriCfKbYL3o15M6kYDB7N5HJ+JVsRg5ZZIf/+DvLkY=; b=E9vGlnFdFf3HV6UJCMFj6OIPyv
 rvc5QUWb96PKjF6mE2I11Rl8ZWztiHGTr4ZIo7q12V0DCVEmsB60Ufi/rY1P+ELqqdgw3ToQmvV0X
 cYttlyf1jmO2+WsWSZdZ7OMTG4bD+BSU8Qf4eQRS4DJo5cC40Xy8tqBwTCmaDN4xvZFyFKaHyyj8/
 pqA/OmtEMtGz+uKiP4c8FlJKQlj8Ecj+bxfaDB9iLh1I5ekySmusMa5lce2qxre3ohO4Dcezwy1Jb
 vMi8U49juUa0PUhxK/s7aT/B+0nveV59uDjFWnSair7sFYf0YKlXdlkmfvfK5/M0k14WMZ/VUlvYI
 cFAbgGaQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMwYm-007wXk-0J; Mon, 08 Jan 2024 20:49:53 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYk-002NGB-36; Mon, 08 Jan 2024 20:49:22 +0000
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
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3 31/46] hw/net/etraxfs-eth: use qemu_configure_nic_device()
Date: Mon,  8 Jan 2024 20:27:00 +0000
Message-ID: <20240108204909.564514-32-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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
X-TUID: tduDteROrzQf

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/cris/axis_dev88.c      | 9 ++++-----
 hw/net/etraxfs_eth.c      | 5 ++---
 include/hw/cris/etraxfs.h | 2 +-
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index d82050d927..5556634921 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -308,15 +308,14 @@ void axisdev88_init(MachineState *machine)
 
     /* Add the two ethernet blocks.  */
     dma_eth = g_malloc0(sizeof dma_eth[0] * 4); /* Allocate 4 channels.  */
-    etraxfs_eth_init(&nd_table[0], 0x30034000, 1, &dma_eth[0], &dma_eth[1]);
-    if (nb_nics > 1) {
-        etraxfs_eth_init(&nd_table[1], 0x30036000, 2, &dma_eth[2], &dma_eth[3]);
-    }
 
+    etraxfs_eth_init(0x30034000, 1, &dma_eth[0], &dma_eth[1]);
     /* The DMA Connector block is missing, hardwire things for now.  */
     etraxfs_dmac_connect_client(etraxfs_dmac, 0, &dma_eth[0]);
     etraxfs_dmac_connect_client(etraxfs_dmac, 1, &dma_eth[1]);
-    if (nb_nics > 1) {
+
+    if (qemu_find_nic_info("etraxfs-eth", true, "fseth")) {
+        etraxfs_eth_init(0x30036000, 2, &dma_eth[2], &dma_eth[3]);
         etraxfs_dmac_connect_client(etraxfs_dmac, 6, &dma_eth[2]);
         etraxfs_dmac_connect_client(etraxfs_dmac, 7, &dma_eth[3]);
     }
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index ba57a978d1..5faf20c782 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -647,15 +647,14 @@ static void etraxfs_eth_class_init(ObjectClass *klass, void *data)
 
 /* Instantiate an ETRAXFS Ethernet MAC.  */
 DeviceState *
-etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
+etraxfs_eth_init(hwaddr base, int phyaddr,
                  struct etraxfs_dma_client *dma_out,
                  struct etraxfs_dma_client *dma_in)
 {
     DeviceState *dev;
-    qemu_check_nic_model(nd, "fseth");
 
     dev = qdev_new("etraxfs-eth");
-    qdev_set_nic_properties(dev, nd);
+    qemu_configure_nic_device(dev, true, "fseth");
     qdev_prop_set_uint32(dev, "phyaddr", phyaddr);
 
     /*
diff --git a/include/hw/cris/etraxfs.h b/include/hw/cris/etraxfs.h
index 467b529dc0..012c4e9974 100644
--- a/include/hw/cris/etraxfs.h
+++ b/include/hw/cris/etraxfs.h
@@ -31,7 +31,7 @@
 #include "hw/sysbus.h"
 #include "qapi/error.h"
 
-DeviceState *etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
+DeviceState *etraxfs_eth_init(hwaddr base, int phyaddr,
                               struct etraxfs_dma_client *dma_out,
                               struct etraxfs_dma_client *dma_in);
 
-- 
2.41.0

