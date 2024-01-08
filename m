Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4607ejs;
        Mon, 8 Jan 2024 12:52:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEh157kycGknPaZ1C5alikB1jebJYmFv0eiMVmVN4tDgE+1F2FErCrEvz7hnxB/G026+OC+
X-Received: by 2002:a05:6870:c115:b0:204:9066:c34f with SMTP id f21-20020a056870c11500b002049066c34fmr8107111oad.5.1704747138431;
        Mon, 08 Jan 2024 12:52:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747138; cv=none;
        d=google.com; s=arc-20160816;
        b=V7WsnL9uNOOIPG1QR8bq8bOw/H+tCY8UrpH36GO3rtJKjTzS2vrs+kjSItynr9A8TT
         89sqcNXqvcUJTiTcRI+v8uPQoQ2C7qE7w5nb+NW3XKt1qP40z3/4HuGG7JbOlr1E9xVN
         G/6ocvrOWD8fFAqpMWDxQ3VnOHwuo5hqpe0Awz2TYV3XIMSy3Pk7zGYsTauXSH7mBEzl
         LIgvTwSPaIcbFcl4ro31kZiny0q+NO+OmQTVSCC6+xzuBtoL9Fy/WoujVLY9eVlDftKH
         Yuyy/q3+GLS+T2/5+lnJdO1MWEveIpb4TNpZJGvZAtBc3uglW6ho0CxlcrQ2gTGV9pIE
         m2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=8zuRre35272BYJVRGd9RIb87z+uvpwtc4RlOpE6V4GU=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=TWaz6yEG/+3RZaO8jvhNZ5JG3wSi/oRuqG+35dvF0KydeV6w8uvlfY0+Q04pi7d9MJ
         rrb5aiJqbtH+65vD721S7QV9b5OBUfZBOn1LvP1eySIPeAj3YH0FPs3u+SFgvEEUxEpR
         mLj4gmTHJiEgwjpTKAo5yigK2zaGVaf77cbyVcKFOqiZ4dA7fa2XmckJ8IaCzHP0hy78
         XIizNnh0lXWiT3yy9iBjuIIsx0JVIhdqqrwrsHv2kuGZPHFGd72NGhMduzPjFkMe8KVK
         OOJ6MDPS9fTqI0shwJhiPhoj+sMlAGKjFje+9TYvkm6sK5W5q3GYDk49DFyClqMKbXwb
         STUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=b+e5pHRN;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id br30-20020a05620a461e00b007832bf78aeasi406379qkb.546.2024.01.08.12.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:52:18 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=b+e5pHRN;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.663896.1033817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaM-0000j8-IF; Mon, 08 Jan 2024 20:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663896.1033817; Mon, 08 Jan 2024 20:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaM-0000j0-AA; Mon, 08 Jan 2024 20:51:02 +0000
Received: by outflank-mailman (input) for mailman id 663896;
 Mon, 08 Jan 2024 20:51:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrlO=IS=casper.srs.infradead.org=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaK-0000R5-Qn
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:00 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dc8b3e6-ae67-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 21:50:55 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYj-008RPt-Rr; Mon, 08 Jan 2024 20:49:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYk-002NFc-1T; Mon, 08 Jan 2024 20:49:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: 9dc8b3e6-ae67-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8zuRre35272BYJVRGd9RIb87z+uvpwtc4RlOpE6V4GU=; b=b+e5pHRNHzAKqZDt2JN3LRQAy/
	bLs2U1SXGlCjRJKJipRex6dDaZp+CkBO/dgYwcdJfyt6yseiya5dFWEK5KYJUcFEkskgKtwgAouUh
	yd2pjryXltEkLU0KbkXN0wJpTw7lcyuNtVo4HMqEG2UE3q6djj3wI7+Tz2u4QfUuprPPrdD0YAIRG
	d2gRpO6/uOZYE5d0xc9sBHYVyLKWMooQA+EkAdTUpzPJDMyVPWKHHkKmLPNSAXfaDEehr/q3qZ68K
	fh7wmhbbIFQRCKfRzskDaIgPNxMlGxMYiQNkkOPzdVoLTSj8ogm6JAkqmlhTcLiE9WXS0hyv2qQ/D
	2c35O4/Q==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Helge Deller <deller@gmx.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Thomas Huth <huth@tuxfamily.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jason Wang <jasowang@redhat.com>,
	Jia Liu <proljc@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3 24/46] hw/arm/fsl: use qemu_configure_nic_device()
Date: Mon,  8 Jan 2024 20:26:53 +0000
Message-ID: <20240108204909.564514-25-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: 8i3Hy18cTLJk

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/fsl-imx25.c  | 2 +-
 hw/arm/fsl-imx6.c   | 2 +-
 hw/arm/fsl-imx6ul.c | 2 +-
 hw/arm/fsl-imx7.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 9d2fb75a68..a24fa7b443 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -170,7 +170,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
 
     object_property_set_uint(OBJECT(&s->fec), "phy-num", s->phy_num,
                              &error_abort);
-    qdev_set_nic_properties(DEVICE(&s->fec), &nd_table[0]);
+    qemu_configure_nic_device(DEVICE(&s->fec), true, NULL);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fec), errp)) {
         return;
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index b2153022c0..02f3024090 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -380,7 +380,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
     object_property_set_uint(OBJECT(&s->eth), "phy-num", s->phy_num,
                              &error_abort);
-    qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
+    qemu_configure_nic_device(DEVICE(&s->eth), true, NULL);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->eth), errp)) {
         return;
     }
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index e37b69a5e1..ca3dd439ec 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -442,7 +442,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                                  s->phy_num[i], &error_abort);
         object_property_set_uint(OBJECT(&s->eth[i]), "tx-ring-num",
                                  FSL_IMX6UL_ETH_NUM_TX_RINGS, &error_abort);
-        qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
+        qemu_configure_nic_device(DEVICE(&s->eth[i]), true, NULL);
         sysbus_realize(SYS_BUS_DEVICE(&s->eth[i]), &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0,
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 474cfdc87c..1acbe065db 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -446,7 +446,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
                                  s->phy_num[i], &error_abort);
         object_property_set_uint(OBJECT(&s->eth[i]), "tx-ring-num",
                                  FSL_IMX7_ETH_NUM_TX_RINGS, &error_abort);
-        qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
+        qemu_configure_nic_device(DEVICE(&s->eth[i]), true, NULL);
         sysbus_realize(SYS_BUS_DEVICE(&s->eth[i]), &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0, FSL_IMX7_ENETn_ADDR[i]);
-- 
2.41.0

