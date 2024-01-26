Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1024295ejc;
        Fri, 26 Jan 2024 09:35:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtRlTIiRw2yoUDygg3ls8ftpoub+ScnWFSAuqJPHfcaHcwLusNr98jocYx5vOQxupKFi1F
X-Received: by 2002:a05:6214:23c9:b0:680:b7fd:e3c0 with SMTP id hr9-20020a05621423c900b00680b7fde3c0mr213770qvb.130.1706290501423;
        Fri, 26 Jan 2024 09:35:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290501; cv=none;
        d=google.com; s=arc-20160816;
        b=zJF93DcJslBXafz0wwWW5dWEH/+MdDg8QQeSu9VbOvIzVXiLXPMEAdiGQB2XOFlxXE
         K7ic02TnUsakNkKUtRvKDjNgkkVk9no7zcJ2ZxehBES5fQByCE0eGJbUsaKNrcJGrPUK
         Ps8oi0Y04+ToTH4K3cFLQp/mMcInvn8v990pVw/xdUO7F6hZYd5kEK21YhKDZh9UgYVy
         2MZ25XFdnZ5fF/gRGp8vy2Sgsb06Sv3KSQIRvShmg5kDexUHymhcvj1csh1Km+wdF6BU
         S9s5iW6g+YDULjAjz6lqlmWqOmmoDVc6augTNB6vRgIcIH7DvBbPRnPc6eIkJLa+zmKo
         u7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RalmZg2g2HcWNPspE1WbCMjLC5xu8xXxgPEaYu8kgcA=;
        fh=4aUA0JPxoVvgInBmJ96rXkS+v1RtLmlfy0HlzHtXDaI=;
        b=d6GH1wsEsZXMKcDIvWmuC8DmgL9qVs0jNiZgL03+TsfHjOk4b6+7h/TQjtPkUNi6AM
         OqqKhaokg3FuUUOkof01KZ9ljz/FSe8GMfHf2AfnG3IbD/4fE5CoJ5oITISU4uD0n777
         nU3AMH6QCF9o7NqggwjNsdFVH3ILfLbCt2ZSHbUxiByEI7S9GGQ/PwP+GaC4bnwsAdcs
         Cgu1vTgyReKoV8YglOv6q2mhVk/dMjGcP6nWvJXP2zefw9MSeCCVn8UQtqHv/5dK+ySE
         RDyHReJpEYetJBfG+t4GLD5antJzMk0BsEDLPe3EWsyTKCZ73SDo2pvtiWdVjBnwwIIE
         wnaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=E5mQKWR4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu2-20020ad45cc2000000b0067ed2267b72si1750618qvb.275.2024.01.26.09.35.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 09:35:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=E5mQKWR4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTQ5E-0008Gz-04; Fri, 26 Jan 2024 12:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rTQ5A-0008AZ-Va; Fri, 26 Jan 2024 12:33:36 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rTQ57-0001cg-W9; Fri, 26 Jan 2024 12:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RalmZg2g2HcWNPspE1WbCMjLC5xu8xXxgPEaYu8kgcA=; b=E5mQKWR4z4aHkGBp7qVHFzw67C
 v5wpWOcAtFcL6EkJiTQAISbFdVRSj2uOXmFt3yxiz2bdgjWcIy8+LJVGopK1l7o+Rbnwd+2nWkMYG
 oIlroP1+I+949w2ebYVnJMwaCjTNv8hFsvAmC/MQ1tQjJJ1u/CGn5MWPPB7AOz+02tR7o0Ze+U7C4
 JnUu2L1rG9U5mLFmVmv+Dvy5uXqsOlGL1qUQ32dy1gg508bL9gVJu8cL6oKbqdxodIXzXojp9Fq25
 VnC9u6fY29dh8CbDgYiBQNL4vetAuKC9EhtiJZDBjVdfo9mOKEoWtD6k03kl1X0hLFRbwVi8eMjVx
 tG0btbuA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ49-0000000EKUi-0YRl; Fri, 26 Jan 2024 17:32:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ4A-00000001enU-00UM;
 Fri, 26 Jan 2024 17:32:34 +0000
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
Subject: [PATCH v4 34/47] hw/microblaze: use qemu_configure_nic_device()
Date: Fri, 26 Jan 2024 17:25:11 +0000
Message-ID: <20240126173228.394202-35-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org;
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
X-TUID: HLM2gFIMPhGa

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/microblaze/petalogix_ml605_mmu.c      | 3 +--
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index fb7889cf67..0f5fabc32e 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -133,7 +133,6 @@ petalogix_ml605_init(MachineState *machine)
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[TIMER_IRQ]);
 
     /* axi ethernet and dma initialization. */
-    qemu_check_nic_model(&nd_table[0], "xlnx.axi-ethernet");
     eth0 = qdev_new("xlnx.axi-ethernet");
     dma = qdev_new("xlnx.axi-dma");
 
@@ -145,7 +144,7 @@ petalogix_ml605_init(MachineState *machine)
                                   "axistream-connected-target", NULL);
     cs = object_property_get_link(OBJECT(dma),
                                   "axistream-control-connected-target", NULL);
-    qdev_set_nic_properties(eth0, &nd_table[0]);
+    qemu_configure_nic_device(eth0, true, NULL);
     qdev_prop_set_uint32(eth0, "rxmem", 0x1000);
     qdev_prop_set_uint32(eth0, "txmem", 0x1000);
     object_property_set_link(OBJECT(eth0), "axistream-connected", ds,
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 505639c298..dad46bd7f9 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -114,9 +114,8 @@ petalogix_s3adsp1800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, TIMER_BASEADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[TIMER_IRQ]);
 
-    qemu_check_nic_model(&nd_table[0], "xlnx.xps-ethernetlite");
     dev = qdev_new("xlnx.xps-ethernetlite");
-    qdev_set_nic_properties(dev, &nd_table[0]);
+    qemu_configure_nic_device(dev, true, NULL);
     qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
     qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-- 
2.43.0

