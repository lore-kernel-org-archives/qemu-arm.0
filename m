Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004397eja;
        Mon, 6 Nov 2023 11:56:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfIx0IjAZvMpsay0jxyCmASjm4jTIFpHaMdl+8i2HqcZwjh9nwgDdIpxQ2CCUIPH58Jo8a
X-Received: by 2002:a05:622a:164e:b0:412:c2a:eaef with SMTP id y14-20020a05622a164e00b004120c2aeaefmr36879170qtj.11.1699300583743;
        Mon, 06 Nov 2023 11:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300583; cv=none;
        d=google.com; s=arc-20160816;
        b=pKyNsoS5i6fo0ZtzcyBNS3IQ+Tau/QnzJj53hONL2R1MlwwHgqvmDQ6So/DoHTmjDP
         GGSNjnRfyv0Z+Ty/XyCdPCDncjlxfx3j1tJOXufe3b2pp6BKdINDbiwTbVEOysJUKgX6
         Z++JyP3DcmwZ+LB6OglfeA78ITWMs10S5h+g43+89yoMWxMgsCIjlaEs3qQvXrWM70kl
         pKnb+zzeMN6nOszG+yAi+qwcq4jI5Oi9/WMgxB99etnDhT8D3GetDTfIWw+N39xPIhXY
         nj7UygXhoo1HNW/eJAYmoq4qmQbkJ9hNgYstCVtMyuKEYq1F8fewHVzMyCc43O5+GOmG
         xsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O7+HX3w6XyECWcZnAzqqwZKvx1qj71QgIwZtZm02KnA=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=cFwToSPpngXSuqWdJweGi4bA0U6j9VofRHN8hjO7ZxWihyTBY7xJk2c5z+wECCq1TL
         /3UAeK77wEgmc+uBw3nJKNcBs/bDOwp0IxIjpOvkjj5xgtR1mIe3ZCgFrSYsWRbfYYZO
         xdK8EwpbjYNXDRP+uUZEFbuJdk/plkrwVTonQGj5+e05pKmLC+K1axEBGC/6y/p0zIh7
         bpjk7L3V6ov+SL6mxp0JYp5fC8rDze6RfucHS74zpN0DJm+ZDBcXFwuwSGZbkOmKfucS
         w+lFs73yewOcd+7BULeUYQLJN8AcGztpkrmXKzPcKdb6bRmmGzQxExr8QkbRbD7OvKo8
         Innw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=FYb1RUmF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a05622a138a00b0041e2342f335si6205433qtk.755.2023.11.06.11.56.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 11:56:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=FYb1RUmF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r05g4-0005bU-6u; Mon, 06 Nov 2023 14:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1r05g1-0005Xb-HB; Mon, 06 Nov 2023 14:54:25 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1r05fx-00065b-Ub; Mon, 06 Nov 2023 14:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=O7+HX3w6XyECWcZnAzqqwZKvx1qj71QgIwZtZm02KnA=; b=FYb1RUmFgC2o88t7cCEf/HK/k+
 xkOfAXzqneBS6o/ywK5HQaFPcCwcjcU7pTseyg6U7f0hvbWH1XdOXoCN9Db3kssQWHUTPgVeJ3UaX
 l9vRtYto0dT+2vRCliOYN05Jm0EnGuBMRSeAD6Rv6L5QQSKVaCn5xRMo4gI8GdDu4APmWCfwr3NlQ
 c4eiGjOG9KoBH/9Nj6q1vK7uNP2l/v+21L7oK4P5Y8mxkACz/c3ixumWvjQu5hW9YluKHnK3rLpM+
 bHdHiyy6YOdTMckCWVzCw0dR5aB+o1dTEsh9ZegMTqnhTiKmkaMX2twqS6fG8UhU1qQxTzdiP7spC
 rwzZiV3g==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fb-00AkFq-2b; Mon, 06 Nov 2023 19:54:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fa-001GNd-2K; Mon, 06 Nov 2023 19:53:58 +0000
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
Subject: [PATCH for-8.3 v2 16/46] hw/ppc/spapr: use qemu_get_nic_info() and
 pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:21 +0000
Message-ID: <20231106195352.301038-17-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org;
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
X-TUID: SK4NOhr12pqt

From: David Woodhouse <dwmw@amazon.co.uk>

Avoid directly referencing nd_table[] by first instantiating any
spapr-vlan devices using a qemu_get_nic_info() loop, then calling
pci_init_nic_devices() to do the rest.

No functional change intended.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/ppc/spapr.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index df09aa9d6a..3d8ad75790 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2796,6 +2796,7 @@ static void spapr_machine_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     long load_limit, fw_size;
     Error *resize_hpt_err = NULL;
+    NICInfo *nd;
 
     if (!filename) {
         error_report("Could not find LPAR firmware '%s'", bios_name);
@@ -2996,21 +2997,12 @@ static void spapr_machine_init(MachineState *machine)
 
     phb = spapr_create_default_phb();
 
-    for (i = 0; i < nb_nics; i++) {
-        NICInfo *nd = &nd_table[i];
-
-        if (!nd->model) {
-            nd->model = g_strdup("spapr-vlan");
-        }
-
-        if (g_str_equal(nd->model, "spapr-vlan") ||
-            g_str_equal(nd->model, "ibmveth")) {
-            spapr_vlan_create(spapr->vio_bus, nd);
-        } else {
-            pci_nic_init_nofail(&nd_table[i], phb->bus, nd->model, NULL);
-        }
+    while ((nd = qemu_find_nic_info("spapr-vlan", true, "ibmveth"))) {
+        spapr_vlan_create(spapr->vio_bus, nd);
     }
 
+    pci_init_nic_devices(phb->bus, NULL);
+
     for (i = 0; i <= drive_get_max_bus(IF_SCSI); i++) {
         spapr_vscsi_create(spapr->vio_bus);
     }
-- 
2.41.0

