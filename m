Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp866012ejb;
        Sun, 22 Oct 2023 08:57:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVQUiJKBkDBJ0MvYIMb+35uBCckCLiztsbXF/dyS51Y7MN7K47zqFcSVUMhKh5Di+3dBAA
X-Received: by 2002:a05:6214:f6f:b0:66d:4bcb:c6f4 with SMTP id iy15-20020a0562140f6f00b0066d4bcbc6f4mr8869895qvb.44.1697990273439;
        Sun, 22 Oct 2023 08:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990273; cv=none;
        d=google.com; s=arc-20160816;
        b=zksoGupW+gHI33lhpkr7OzWMhrIgVFN56FqhJC56Wv1tWRIDbIhVfNGYb+3t3FFn10
         z6qIbWPDzsIXgC5TRqPpep9oMeciudQKYEm9csdvQDJN0THokQVn7m2k0mzJidpXfEZ+
         admwzUw8FGv6hv9ijDBVsUViSUqbrjppOcM5MBnPslBjJqllitzC5LnPChy4Y51ZWVN1
         0jzzU1nsBUr8aUdkBRtmgPDOW0gj5PDJcmZ93S8NJUho3wizw4zruz9W2/ypc/shccow
         4IbexgKAWRRCnQYLS7weSY9leEZ6wrBhhovgz0bZfBHHwdspPbSxN/96gk6EbZDUVB3F
         GpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oOd4742xrV3Y0XOyAJZySn8cRLGpoNriHOlI9x39KS0=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=U4idvN3/aTKR79/lrNruNKMhEq0FazYZd5Ctt0uJgT68PInNRRo20VWzMkhqiyApLW
         bJOEc9R15mrqCgjGIpsv0LeXCbEeZ+s7OEv+uymUeI5wqBgp+eLW5zTpMUvOCZAH8eJ5
         0dVkqPAktqVpxr7RXdt33yhtq8hg8NQ2y4PiCWjabMkvtsZx6vTBepB0bld/DuKUexB7
         vGryEhQamt6N9Owe+O0K/QwEiu0s4r2cMsmVJGsU4BgL/PsVX+qcte/LvrIQI5ZxHaUk
         XvijBwi2rsPHAJWzi5osWmxjfE9lK7S1jfXDtdJjNeW9kKDJpV7NmKI6fiE0Y7ja000O
         IDiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=YbTCMRd7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3-20020a05622a190300b00417f34c1f6bsi4394641qtc.576.2023.10.22.08.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 08:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=YbTCMRd7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qualQ-000543-UX; Sun, 22 Oct 2023 11:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qual4-0004ql-GM; Sun, 22 Oct 2023 11:52:54 -0400
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qual0-0000Ah-4A; Sun, 22 Oct 2023 11:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oOd4742xrV3Y0XOyAJZySn8cRLGpoNriHOlI9x39KS0=; b=YbTCMRd7hoqOTnIQMmaut6SKcP
 hqjRUOF9WHCogZj8TTzREvSMciRu/pS4D+ZFAsDqpL2Tn6+e4+eSO4y/iE57Roq06Hzm9KU4YXvQ6
 LPQ/D2iTkR5F+NfJfnJYfdMsDcBvvbJE4JYbLyCO7Bdr+BfUoYG8GiVOe/we0qZtLgZLmJkTbWxDk
 IqF/aZ92jUpOzOX03KVXmNpCy4SHjP/7lFm/mxv8uLPE9IxNSJJyZ3AcB7Dt9XY+kNXlLFrpNuttr
 v2ObvLfImy1Dru3PDM3/7/Fs8jitvY4M8YMzFmUh5pRxRNuII47bf4cB8Ac02Uhe0Kj7zQy7u8fLr
 C5+/kwrA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakJ-00DCmr-22; Sun, 22 Oct 2023 15:52:22 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakI-001qZH-12; Sun, 22 Oct 2023 16:52:06 +0100
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
Subject: [PATCH 16/45] hw/ppc/spapr: use qemu_get_nic_info() and
 pci_init_nic_devices()
Date: Sun, 22 Oct 2023 16:51:31 +0100
Message-Id: <20231022155200.436340-17-dwmw2@infradead.org>
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
X-TUID: L2VisMXNZedf

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
index cb840676d3..7db6c6641a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2775,6 +2775,7 @@ static void spapr_machine_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     long load_limit, fw_size;
     Error *resize_hpt_err = NULL;
+    NICInfo *nd;
 
     if (!filename) {
         error_report("Could not find LPAR firmware '%s'", bios_name);
@@ -2982,21 +2983,12 @@ static void spapr_machine_init(MachineState *machine)
 
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
+    while ((nd = qemu_get_nic_info("spapr-vlan", true, "ibmveth"))) {
+        spapr_vlan_create(spapr->vio_bus, nd);
     }
 
+    pci_init_nic_devices(phb->bus, NULL);
+
     for (i = 0; i <= drive_get_max_bus(IF_SCSI); i++) {
         spapr_vscsi_create(spapr->vio_bus);
     }
-- 
2.40.1

