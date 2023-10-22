Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp865468ejb;
        Sun, 22 Oct 2023 08:56:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNk9FqWZ5wf0GkFlNelqCOZ4xAGn0hjRb4CnP0Ua4LfLqxGgyLF7dSPuwF8LiKXNBDn8TI
X-Received: by 2002:a05:620a:2584:b0:779:dc90:ba1d with SMTP id x4-20020a05620a258400b00779dc90ba1dmr23014qko.14.1697990173696;
        Sun, 22 Oct 2023 08:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990173; cv=none;
        d=google.com; s=arc-20160816;
        b=iBospJnTZ3RlaOjS1n0sMg0Gv0lgCfiqwQQVAEWOzB0wsj96f2zAvdGGGsuLOFGpCA
         pGI1Grw7tLOqW2udPRTMvgQORmyVHAAvacPGs3SzC55qaDx76uEYWoj0zhcW1XbgijSg
         RMqE7+L7/g42GhUHR3+00SYOlNnmGsMHlt/gGTZ0P5RGncyARBPTmlczBvmsLK8jekQ8
         JVrlWrHIwt8zuqMemyne1F+Eb+2P9STiGfhh5qbJurnk0cWFFxCWO0hj3pNmnVKRmJ2Y
         vTR0IEQVBRNE0mWeRESn0NH4IJAgS53K1D+I44pg8g4UVwgE2qeeGJR4VKb0m2jdalIO
         Xxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+bWR+4W0QySPA6dDThhvaIVgU90LGPZKdMQCWNuwJ7c=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=S5xrqZgQaaCZeDdGmFeMhe1Lh12iv7xRdcaXdKCbmSHT5OV3q+LYNQ/QZdPFY0aDx7
         7bmgaVGq0gVGnH3rbmH/Nz0g3tc54nG7e12teTKH1qRAreGlVevDy5qJ6NQROT3hWGr4
         NghDt+hjO16a52jCrO0s3F2Ep9OHYhE+RiuhQWRV5CMnxiRq/pEMGiJRb26hvPW4qb/0
         pOHyx2Yu8B5l9EX9l5xf4+EQ1/Jrd/sHW6EFzyOrdmR8ruKl8CXjpvKdmbBF1M++8qgf
         GdAyIgBH8qjlDC4QrKr5hPXycBjLKgtxn95tG2CaGjJmYUcgtte1RV8aKXumfr8f3w0i
         w8ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=Jkj4zt57;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj17-20020a05620a191100b007788f266816si4275441qkb.278.2023.10.22.08.56.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 08:56:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=Jkj4zt57;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qualw-0006OS-Od; Sun, 22 Oct 2023 11:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qualt-0006Ir-06; Sun, 22 Oct 2023 11:53:45 -0400
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qualr-0000Xe-D1; Sun, 22 Oct 2023 11:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+bWR+4W0QySPA6dDThhvaIVgU90LGPZKdMQCWNuwJ7c=; b=Jkj4zt574pDV5MVV3UJFRstXCu
 0z+H5/fKv6CVRFEd/rzZi+JSbHvN4lNF3JE5gM7ujHkf0rziZIGjNXunYN/qXxdxRoUzjsN2iozPr
 pgm6p6Mgl1QXkKZz5PBasdEWZd+KB8bTzF+8bY4rFsARFhUGkMHZFV8HXBz8+lW5CccULZi0bXbrX
 lRHjKaMkiKD5JaAjdyym9t0UOK5odXY4i2jnB0ivkGdDX085Hcmv+CFPoRv1PQpwpUwg6WCCSfk+f
 oodoncuiqMwaGpIFmW8Crn4461eqZDXRdDcBr2YBaVEmh7pIs9s7KHQoiogJ2ePWrFOrd10H11tC7
 255Rxlqg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakJ-00DCms-21; Sun, 22 Oct 2023 15:53:37 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakI-001qZL-1Q; Sun, 22 Oct 2023 16:52:06 +0100
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
Subject: [PATCH 17/45] hw/ppc: use pci_init_nic_devices()
Date: Sun, 22 Oct 2023 16:51:32 +0100
Message-Id: <20231022155200.436340-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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
X-TUID: szfJUE/79DyK

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/ppc/e500.c          |  4 +---
 hw/ppc/mac_newworld.c  |  4 +---
 hw/ppc/mac_oldworld.c  |  4 +---
 hw/ppc/ppc440_bamboo.c | 13 +++++--------
 4 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index e04114fb3c..f62eeb3411 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1075,9 +1075,7 @@ void ppce500_init(MachineState *machine)
 
     if (pci_bus) {
         /* Register network interfaces. */
-        for (i = 0; i < nb_nics; i++) {
-            pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-        }
+        pci_init_nic_devices(pci_bus, mc->default_nic);
     }
 
     /* Register spinning region */
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 535710314a..b36dbaf2b6 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -444,9 +444,7 @@ static void ppc_core99_init(MachineState *machine)
         graphic_depth = 15;
     }
 
-    for (i = 0; i < nb_nics; i++) {
-        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-    }
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /* The NewWorld NVRAM is not located in the MacIO device */
     if (kvm_enabled() && qemu_real_host_page_size() > 4096) {
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 9acc7adfc9..1981d3d8f6 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -277,9 +277,7 @@ static void ppc_heathrow_init(MachineState *machine)
 
     pci_vga_init(pci_bus);
 
-    for (i = 0; i < nb_nics; i++) {
-        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-    }
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /* MacIO IDE */
     ide_drive_get(hd, ARRAY_SIZE(hd));
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 45f409c838..e63289144a 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -235,14 +235,11 @@ static void bamboo_init(MachineState *machine)
     }
 
     if (pcibus) {
-        /* Register network interfaces. */
-        for (i = 0; i < nb_nics; i++) {
-            /*
-             * There are no PCI NICs on the Bamboo board, but there are
-             * PCI slots, so we can pick whatever default model we want.
-             */
-            pci_nic_init_nofail(&nd_table[i], pcibus, mc->default_nic, NULL);
-        }
+        /*
+         * There are no PCI NICs on the Bamboo board, but there are
+         * PCI slots, so we can pick whatever default model we want.
+         */
+        pci_init_nic_devices(pcibus, mc->default_nic);
     }
 
     /* Load kernel. */
-- 
2.40.1

