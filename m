Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1025520ejc;
        Fri, 26 Jan 2024 09:37:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7arqU+T62gXFrhtsd/mt0Ng/GK4nt+qnwNOu5z9JMUQg6RM4JSwX82vG/BgPvpr420Rnw
X-Received: by 2002:a05:6122:792:b0:4bd:5edc:26c8 with SMTP id k18-20020a056122079200b004bd5edc26c8mr99023vkr.32.1706290648724;
        Fri, 26 Jan 2024 09:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290648; cv=none;
        d=google.com; s=arc-20160816;
        b=w4XkiBfTUrbITWTDcaRsNCxQxGl0iumw0ExiZEhYKY2lWyk2wngPhxDp9jlhyNfYp2
         zd3DqugNHUDchL5eNlaFGI8EgEcrDl9JkHZjEEwRFnJJSDHNyaR4D5TlP93mGvk+Cmfp
         hLtiqtSM/EgeBPLhKqv2hM93PdpiCOwCm0btyYvFhKIuU8gAiT/YNYBen6nEYb7/m8wx
         TY1XmTPY7O76WFlgSgKGrXoamxk+4W25CmVLIbVrqVj/6m5TkfVG2MPCfOSLnpY3N21x
         pzYAlRQEvzfNqUO5H0WMVRNo0zpXLokfhjBguWCDcto7ZFE2+wViQU3Y2mRxvEuyCdvq
         sibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KOJpufq4zmSAW4K5QRQS7wrF9AysmCJpGSwOq9y3MvE=;
        fh=4aUA0JPxoVvgInBmJ96rXkS+v1RtLmlfy0HlzHtXDaI=;
        b=as97fWUeg/x/h8jDctGcvx8nabUKB7N2TCfyOqp/AxT2NZejMyMI2v+2XySdB8MRCV
         1iqp9GJICqtctBfawV4ZvSWK+CIiLtrsgq38F6ElgxFEP0274KVX73N3vlf/8DMC2t5V
         n8D9Kk8GpMsT76G16e7fDFBQ9fTkew+8Yq/gEMcvV6o5wNNTlLw23S1nmrJZpN+ki6Bh
         TuwpfPGbeIrWq0RYAAzJQA92hCBbzKo9Rf8Wst/nmN+9806hPbQzDlL6+1xStPOI1H1r
         RmoD0ePHrOXhlPaTA1JIf9skJUWGE5KMAboL6WALIWe29yUfcljNditiShS3v4sNil3R
         Nx1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=Kkc6w4XB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o184-20020a1f73c1000000b004b71fb299desi254914vkc.33.2024.01.26.09.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 09:37:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=Kkc6w4XB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTQ6k-0004p4-D6; Fri, 26 Jan 2024 12:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rTQ5R-00009e-1L; Fri, 26 Jan 2024 12:33:55 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rTQ5O-0001jV-Ea; Fri, 26 Jan 2024 12:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KOJpufq4zmSAW4K5QRQS7wrF9AysmCJpGSwOq9y3MvE=; b=Kkc6w4XBr8jGCKymZ8GonYtRQf
 3nKIA1F+AOT0Y0gp30CLxWOk0LHUYyXz6gt/8Cin6mmr3eAbf8dzVvSbbBSk9KelfbaAnW5/yJe5U
 nExgrTMI7VIqwGLenUCm2tKd4kN7NVsljwGTI1S2gcurVCy29EA/XOYrAGr4SHtmhme8En06YvlVr
 QQ7FZZSbOFHL7aJJVndJra1TxvjTN0ZuzpRZjXwrL/D8VH3MWjr1xAvkOZuixFv0WeSruJKJnjXhB
 SsoUQflZFtcaIEQI2SjAQqIKU7bcTVOWPzAHCGgDGAHCbADyxPEJ1yXdQfbzyi0lulvFZ/ELgPpvK
 4BgnFm1Q==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ4A-000000069Un-1mvK; Fri, 26 Jan 2024 17:32:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ49-00000001emi-0XuV;
 Fri, 26 Jan 2024 17:32:33 +0000
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
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 24/47] hw/arm/fsl: use qemu_configure_nic_device()
Date: Fri, 26 Jan 2024 17:25:01 +0000
Message-ID: <20240126173228.394202-25-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: CYR32/O6/sKP

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
index af2e982b05..afe9a59a81 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -383,7 +383,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
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
2.43.0

