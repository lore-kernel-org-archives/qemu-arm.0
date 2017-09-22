Received: by 10.223.172.38 with SMTP id v35csp3340145wrc;
        Fri, 22 Sep 2017 10:16:08 -0700 (PDT)
X-Received: by 10.200.1.30 with SMTP id e30mr9079528qtg.232.1506100568095;
        Fri, 22 Sep 2017 10:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506100568; cv=none;
        d=google.com; s=arc-20160816;
        b=ew/j/2R7jkoQXySorX351j19/uPpQXymQDFwPOA6c+Y8VaD5zAyQ8CaBjOA8fPk9hL
         0FEl2zitp4tbgawjVzbeq+6UcuNg7RP+TbRQK4peTxSasfKOHV317qFZMFXl4kFc3ShP
         BRLD8hBjyHbAyDrd9czlDlIcpUf5Az6f6UyCJNhZ3PkmDhOhSetjWz9IaGxNHJualUe8
         ajpXqwHtYdi2VAWZOMCSV4j/GYD1ex4qPfCDE4EQnqHzrQVOL0g+CSszhMymxeenUqLv
         55U7P9Cjq9rbRZybtySVp5h1QKOFz4+ft/nfWtTn7He9hwQFfB6Oz0IXNguySBzkMk22
         31eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jCs+7aCSuo0aq+jzG5++EzGklGRDA53oMWn9sbBVFsw=;
        b=XAofkdAAy66ZAzke2vE4CUD0hfcW+4OIJ7JvngjLzvRN3uA8suTxuF6h7QFlqcjl73
         Ehku7GnANY9LkGTtRsjvYld686o5ZjivIFQglzKSv9sjnF6Pr/CuMgkT6nmIZ2VyKb6L
         WSvtpvSHTEeQBxT2v11eqSphlmUfEarE3YejrlEu4zryX+oTaVQOpgyvZGPgHsBXqUYH
         eCn6eD1+3omQV7ADrBgDVjRqK5EtYWa63/ODc2fyICcczM4Iqr0YNWLbIWMXO8FdwU7S
         gmLibO9iD3t2+mOUJ5746mlt2OAZ0wpqDnGwxaW5WLtxeBcGew/L9iboEyHQO3d0nvuP
         EiRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YLeeiRAm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y32si255794qtk.80.2017.09.22.10.16.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 10:16:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YLeeiRAm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvRYb-00059E-ND
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 13:16:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvRWQ-0003KE-BS
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 13:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvRWP-0003TU-3d
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 13:13:50 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37391)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvRWO-0003TF-Ur; Fri, 22 Sep 2017 13:13:49 -0400
Received: by mail-qt0-x243.google.com with SMTP id u48so1045059qtc.4;
	Fri, 22 Sep 2017 10:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jCs+7aCSuo0aq+jzG5++EzGklGRDA53oMWn9sbBVFsw=;
	b=YLeeiRAm0VUquG/5X8LwPPrSgjE97CwpNLDMl8nk+O+lJTez84dGyJSbOwKh4bSEYE
	Zzk5+LcVVrZdQ4qQ0WqUp9qRLmoTLYW4jrTonBl5io/+SHOq1oAzHyA54qKiXmfOEPp1
	Chue8LcGCZ6vPe0ZWkf+NaF0IdRMznFOvkn6DAGCR6itNo572eYJRbtOTCJEm2Fcu3dl
	O8/BpJTE3QAB8XVblnlpaJtNMRrrIYukepkgAeQfL61bBswu4iTXzga0gf/tPdTgLn1/
	uYYBuEUVqdrjmgZdg/mHmOY36bRhf7Qx28+GA403uazPHAPctlzx2y2pALDWBCzLEBj/
	rUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jCs+7aCSuo0aq+jzG5++EzGklGRDA53oMWn9sbBVFsw=;
	b=PTDz20lJS18CWKqDJxuhXxNUCSs87VoNtDQDwwmaUhZCS7BUpPM8e6zFPpA9ZqO2Bw
	iq8TNySi3qDTcqZqzTOH9o3Di7W31+dIR8Y82jktIE5noFR9uygTjltEq02NB/kMpBoE
	Q1wvHHwx80L0Ax3h0JtdoBs96hgkbvSK/RAhfEWAfIrzDWZOJQLDpdyxScc1FajaR/Iw
	wJpkb4etq0KOYRmfuBbTchZHVnEHqsIuFpsvk1aNmrvDFXTeT+wpFFTqpDjlXLbKWEVF
	Um2/dZsJi0WGn/aaGHC4jFIF3ZOPQ47eQVb9JhNqdjrg5xTcGznwyZIi2F5g7Kf8V1UG
	FE1Q==
X-Gm-Message-State: AHPjjUjQug8SpCSxt3XSgR/aFPmk7gaOpQBQDh1t3SpaJtnyuPMpaxo0
	fxrOPgT5lBHtJ3+4Ub0yP1Y=
X-Google-Smtp-Source: AOwi7QDVzy6vUZzcLCl9Od/fHGIiJ78o0vmMgVRtMESEj/wlmblcJcY78cDCs9Pd08/R9vysomowBw==
X-Received: by 10.200.33.131 with SMTP id 3mr7516611qty.177.1506100428426;
	Fri, 22 Sep 2017 10:13:48 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f69sm238468qke.27.2017.09.22.10.13.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 10:13:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Grant Likely <grant.likely@arm.com>, Jason Wang <jasowang@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Fam Zheng <famz@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Date: Fri, 22 Sep 2017 14:13:19 -0300
Message-Id: <20170922171323.10348-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922171323.10348-1-f4bug@amsat.org>
References: <20170922171323.10348-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v5 3/7] hw/mdio: Generalize phy initialization
 routine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pLu38FZ2S6na

From: Grant Likely <grant.likely@arm.com>

There really isn't anything tdk-specific about tdk_init() other than the
phy id registers. The function should instead be generalized for any
phy, at least as far as the ID registers are concerned. For the most
part the read/write behaviour should be very similar across PHYs.

This patch renames tdk_{read,write,init}() to mdio_phy_*() so it can be
used for any PHY.

More work definitely needs to be done here to make it easy to override
the default behaviour for specific PHYs, but this at least is a
reasonable start.

Signed-off-by: Grant Likely <grant.likely@arm.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: just rebased]
---
 include/hw/net/mdio.h   |  2 +-
 hw/net/etraxfs_eth.c    |  2 +-
 hw/net/mdio.c           | 14 +++++++-------
 hw/net/xilinx_axienet.c |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/net/mdio.h b/include/hw/net/mdio.h
index 7ffa4389b9..b3b4f497c0 100644
--- a/include/hw/net/mdio.h
+++ b/include/hw/net/mdio.h
@@ -86,7 +86,7 @@ struct qemu_mdio {
     struct qemu_phy *devs[32];
 };
 
-void tdk_init(struct qemu_phy *phy);
+void mdio_phy_init(struct qemu_phy *phy, uint16_t id1, uint16_t id2);
 void mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy,
                  unsigned int addr);
 uint16_t mdio_read_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req);
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index f8d8f8441d..4c5415771f 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -333,7 +333,7 @@ static int fs_eth_init(SysBusDevice *sbd)
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
 
-    tdk_init(&s->phy);
+    mdio_phy_init(&s->phy, 0x0300, 0xe400);
     mdio_attach(&s->mdio_bus, &s->phy, s->phyaddr);
     return 0;
 }
diff --git a/hw/net/mdio.c b/hw/net/mdio.c
index 3d70d99077..33bfbb4623 100644
--- a/hw/net/mdio.c
+++ b/hw/net/mdio.c
@@ -43,7 +43,7 @@
  * linux driver (PHYID and Diagnostics reg).
  * TODO: Add friendly names for the register nums.
  */
-static unsigned int tdk_read(struct qemu_phy *phy, unsigned int req)
+static unsigned int mdio_phy_read(struct qemu_phy *phy, unsigned int req)
 {
     int regnum;
     unsigned r = 0;
@@ -107,7 +107,7 @@ static unsigned int tdk_read(struct qemu_phy *phy, unsigned int req)
     return r;
 }
 
-static void tdk_write(struct qemu_phy *phy, unsigned int req, unsigned int data)
+static void mdio_phy_write(struct qemu_phy *phy, unsigned int req, unsigned int data)
 {
     int regnum;
 
@@ -120,18 +120,18 @@ static void tdk_write(struct qemu_phy *phy, unsigned int req, unsigned int data)
     }
 }
 
-void tdk_init(struct qemu_phy *phy)
+void mdio_phy_init(struct qemu_phy *phy, uint16_t id1, uint16_t id2)
 {
     phy->regs[PHY_CTRL] = 0x3100;
     /* PHY Id. */
-    phy->regs[PHY_ID1] = 0x0300;
-    phy->regs[PHY_ID2] = 0xe400;
+    phy->regs[PHY_ID1] = id1;
+    phy->regs[PHY_ID2] = id2;
     /* Autonegotiation advertisement reg. */
     phy->regs[PHY_AUTONEG_ADV] = 0x01e1;
     phy->link = 1;
 
-    phy->read = tdk_read;
-    phy->write = tdk_write;
+    phy->read = mdio_phy_read;
+    phy->write = mdio_phy_write;
 }
 
 void mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy, unsigned int addr)
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 1e859fdaae..408cd6e675 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -791,7 +791,7 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
                           object_get_typename(OBJECT(dev)), dev->id, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
-    tdk_init(&s->TEMAC.phy);
+    mdio_phy_init(&s->TEMAC.phy, 0x0300, 0xe400);
     mdio_attach(&s->TEMAC.mdio_bus, &s->TEMAC.phy, s->c_phyaddr);
 
     s->TEMAC.parent = s;
-- 
2.14.1

