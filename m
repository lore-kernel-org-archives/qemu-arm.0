Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp864274ejb;
        Sun, 22 Oct 2023 08:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4GlV/FQQgGzLz1Zv0hKHGUz23Kfqsd/BhnJY8lcWMTcj+LWkQfHrBB2kjUKsp6LGVMdFi
X-Received: by 2002:a05:622a:14c7:b0:418:1059:dfb9 with SMTP id u7-20020a05622a14c700b004181059dfb9mr7323599qtx.1.1697990001429;
        Sun, 22 Oct 2023 08:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990001; cv=none;
        d=google.com; s=arc-20160816;
        b=HhdsNEjSFUr3E5k+MNQaw+/I2MfBmfH0y3QpTBwIoIxqENW2i4ZJoK4jj3r34yoZWo
         8Lq1Mg+pitnypN6vO7ic9osQ37oWTc4l4ymOseffK14sA8LaDudQYYjU7Ni76Bqn78zT
         rLQWaccncfibNSddIrhPNX0mfGBzAIf4gT8k6GgWTDktrqiKliMZLxn9KY1KCWztTxYL
         I0SFH21y0JAwBqI4+a3FrA7GRQa2Y8fOGGG0aEZrLQMT9VyhQyJRx2QgRrDc/aAS/K1k
         jFCHuGC3No5sMIVN6tIC90EckvTwzNospsftyWJT1k1aI/yVF/GBZOhighqJj2b8Papl
         nPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=khyoXveG/BzHXWd28g0ECVTdEF2TXXqaXCqlRIzwomY=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=D4yi+cndXE47tJuoXKx9z5ghu96RfxGd8p31HETS3wPnOkQ2yzbq2zep02SEeBVicN
         1xbq49PlA/YuJPoBkct3B1rsMTPHD1HK2OGqtlNNOaZuie6O5j95CrBhWSDqvnydMmOG
         loTCzxVFXEK9irunIikDlkpa9I92maVyiYw0tSpGrOxWqbuilpnpLgNK6TOIFCTMEhvZ
         GEjpw7SV0Jju4o5/ylcpivlvDAAY2xKfZplqbqv8XKuZlc1xRrRH7IMx3gqL9rGJtn9H
         2hcE0yov7jXMwrq1zQjz7YK84LPABukMZI7F2pyuz2zz36kX74iGt4/Td9Oz826lhg+B
         UPQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=pddXftyc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05622a019300b00417dc02ee2fsi4301300qtw.462.2023.10.22.08.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 08:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=pddXftyc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1quaku-0004mg-GF; Sun, 22 Oct 2023 11:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1quakn-0004jm-Ch; Sun, 22 Oct 2023 11:52:40 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1quakj-0008WK-FW; Sun, 22 Oct 2023 11:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=khyoXveG/BzHXWd28g0ECVTdEF2TXXqaXCqlRIzwomY=; b=pddXftyc1ckCsPadnXZvUQT0bW
 M5Ptl/u0mEOZM6a8arO++FndlfmK/9In3Y97NEiNvV6S/gnoMc4rPMktdQsqrpE8ITBGZJbN9YP+h
 7WXXezLpKgcUU6qsBUYt55PTO8nrIX1XqBdlBWxj+18Iu4HEasNRQpUygH0u4uQXNqaYtF60lY4tL
 2m5FzcX/XbiRWZ/oyNZkKLHejWh2LoySZb1SG5qDHBrUfq3SzhLhWqh128Iuw4s8tFqGtH7/LW26M
 dH0EP2RhBj/PoLPN9AezB/IU1DfNzJ769NI+o+uIhQ8Ac7QVnflEBlQ/DmyiYcCPxCUv9Jyt8FKH2
 ON7Jh9Sw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakK-008TGm-Ep; Sun, 22 Oct 2023 15:52:08 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakJ-001qaY-36; Sun, 22 Oct 2023 16:52:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
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
Subject: [PATCH 33/45] hw/m68k/q800: use qemu_configure_nic_device()
Date: Sun, 22 Oct 2023 16:51:48 +0100
Message-Id: <20231022155200.436340-34-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4r2fHFJggiil

From: David Woodhouse <dwmw@amazon.co.uk>

Then fetch the MAC that was assigned, if any. And assign one if not,
ensuring that it uses the Apple OUI.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/m68k/q800.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1d7cd5ff1c..94e7c0dd60 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -271,6 +271,7 @@ static void q800_machine_init(MachineState *machine)
     BusState *adb_bus;
     NubusBus *nubus;
     DriveInfo *dinfo;
+    MACAddr mac;
     uint8_t rng_seed[32];
 
     linux_boot = (kernel_filename != NULL);
@@ -371,13 +372,6 @@ static void q800_machine_init(MachineState *machine)
 
     /* MACSONIC */
 
-    if (nb_nics > 1) {
-        error_report("q800 can only have one ethernet interface");
-        exit(1);
-    }
-
-    qemu_check_nic_model(&nd_table[0], "dp83932");
-
     /*
      * MacSonic driver needs an Apple MAC address
      * Valid prefix are:
@@ -387,14 +381,22 @@ static void q800_machine_init(MachineState *machine)
      * 08:00:07 Apple
      * (Q800 use the last one)
      */
-    nd_table[0].macaddr.a[0] = 0x08;
-    nd_table[0].macaddr.a[1] = 0x00;
-    nd_table[0].macaddr.a[2] = 0x07;
-
     object_initialize_child(OBJECT(machine), "dp8393x", &m->dp8393x,
                             TYPE_DP8393X);
     dev = DEVICE(&m->dp8393x);
-    qdev_set_nic_properties(dev, &nd_table[0]);
+    if (qemu_configure_nic_device(dev, TYPE_DP8393X, true, "dp83932")) {
+        gchar *macstr = object_property_get_str(OBJECT(dev));
+        if (macstr) {
+            net_parse_macaddr(mac.a, macstr);
+            g_free(macstr);
+        }
+    }
+    qemu_macaddr_default_if_unset(&mac);
+    mac.a[0] = 0x08;
+    mac.a[1] = 0x00;
+    mac.a[2] = 0x07;
+    qemu_prop_set_macaddr(dev, "mac", &mac.a);
+
     qdev_prop_set_uint8(dev, "it_shift", 2);
     qdev_prop_set_bit(dev, "big_endian", true);
     object_property_set_link(OBJECT(dev), "dma_mr",
@@ -415,7 +417,7 @@ static void q800_machine_init(MachineState *machine)
     prom = memory_region_get_ram_ptr(dp8393x_prom);
     checksum = 0;
     for (i = 0; i < 6; i++) {
-        prom[i] = revbit8(nd_table[0].macaddr.a[i]);
+        prom[i] = revbit8(mac.a[i]);
         checksum ^= prom[i];
     }
     prom[7] = 0xff - checksum;
-- 
2.40.1

