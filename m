Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp866030ejb;
        Sun, 22 Oct 2023 08:57:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuPQWO5SDBJmGm4rGgczxiACzbQe29y9NAKVuDB7glQo47QugUlEufg8NrYoQkMPtJo2kZ
X-Received: by 2002:ac8:7f82:0:b0:417:a862:4b with SMTP id z2-20020ac87f82000000b00417a862004bmr7352901qtj.33.1697990276319;
        Sun, 22 Oct 2023 08:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990276; cv=none;
        d=google.com; s=arc-20160816;
        b=kzahCVinXtXzAn7S6+/EtZndYkCliHwG+j+SUtp9HdOOlkZoFSFKRw+yJQ906JITQ4
         AVqlbnc/dcEFaxKNo78Qbl5HfMZym1I1QlMq70zJw4W8QYXdFZyPm1GE9auBAoL2p4XJ
         RhvZcIfTlsP8cadl3qMq+o/748aXa4yLXEp3DXMAA89cc8RbiriuWV2Ygt14nDDjgoXZ
         CBPQl3Mxo0+M6Gh71sVnQDJzQ/X1Nyxdjhx3bxEHjgllMKavTETDpBCyf/GHAgT6LM+E
         AI5pVPkXvU+4k2x8qJZqk1QLjbuD1zpsHpigiEBoC9g6AQU+Wpksxt/Zvni4MJIY7tD5
         MKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W0adFdXMEbi8j4klLNUE97TjOqmUyikyi07uSfzF8bk=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=bDeJvPf0gJsPrG4BarWagMfR5n75WZHLHUNZBsKasS6Xaf6d2gQZz1vmexTprN45z+
         YQTMU1lvMkLhlI+IX6gW0pDkJoy84kRCEx1R1azXuiA5ADtxO3gBH6A6BP3O6avGBpJh
         PsFwi6pU6x37ibr4dIJOxJIaOPauWJ1/YIM4EWjaHbqAAzLRgQEAlZ3ua8WvWms10KgR
         0U7CrEyTHqcyEcMQzc9/Vza1zjXVavkN91ZmYtULEcGpYITTfgtPlSWcU6bc3n7rwoqu
         mg7jkmxOno9dO+7s6hZXfJMYyllXXOdfepgSTIVx+qRaTLL5ViLlS5DhJvuuea8XFV+z
         S+zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=qpLAo7x6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s42-20020a05622a1aaa00b00410a249beecsi4212947qtc.277.2023.10.22.08.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 08:57:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=qpLAo7x6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quan4-0000Hs-8l; Sun, 22 Oct 2023 11:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1quamj-0008FE-In; Sun, 22 Oct 2023 11:54:40 -0400
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1quamg-0000Xv-0Q; Sun, 22 Oct 2023 11:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=W0adFdXMEbi8j4klLNUE97TjOqmUyikyi07uSfzF8bk=; b=qpLAo7x6BHsqRoyzs5LkZJVNpU
 rTqiz5+Kq2oN/1n+kFGKWDDux3umF5SQIwtEJ9v7BBHiQVLR1Rs0LiuNG7KzjEORDAW18ZjsxHFx1
 msfIqKZXpZQ6XCKXgGFOx0UssR8BTar+zheMXWCYmiI0eKjaP0RFd3ihZBF8VvbZFIQDWgCAT53Nr
 WIvL1++L7kuTZhujt3SbsK364oiN7GCurcqrSj1+0kBuQrk774oS0IKc8QvVEF3E8T9w41pygkm7U
 IkTBTSrjRSFNyGb1MkrMrvWdF6sIRhZbA9j//JaP7l1yDFWkVrcjaRZSkCT9kmW7nK1/1t/vDswLw
 Qu/TrZKg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakI-00DCml-0V; Sun, 22 Oct 2023 15:53:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakH-001qYo-1T; Sun, 22 Oct 2023 16:52:05 +0100
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
Subject: [PATCH 09/45] hw/arm/virt: use pci_init_nic_devices()
Date: Sun, 22 Oct 2023 16:51:24 +0100
Message-Id: <20231022155200.436340-10-dwmw2@infradead.org>
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
X-TUID: D0T2TXIvzKoU

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 15e74249f9..6b43b92b89 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1477,9 +1477,7 @@ static void create_pcie(VirtMachineState *vms)
     pci->bypass_iommu = vms->default_bus_bypass_iommu;
     vms->bus = pci->bus;
     if (vms->bus) {
-        for (i = 0; i < nb_nics; i++) {
-            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
-        }
+        pci_init_nic_devices(pci->bus, mc->default_nic);
     }
 
     nodename = vms->pciehb_nodename = g_strdup_printf("/pcie@%" PRIx64, base);
-- 
2.40.1

