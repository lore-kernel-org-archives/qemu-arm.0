Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp865497ejb;
        Sun, 22 Oct 2023 08:56:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE40vCc2QwN0iB7kmBBeQZWyL+MqNuGQTiWQDxcDUJjozVRZcpQoC/BXb77NkvNQGBddiw
X-Received: by 2002:a0c:cb14:0:b0:66d:968b:40ed with SMTP id o20-20020a0ccb14000000b0066d968b40edmr6422745qvk.41.1697990177428;
        Sun, 22 Oct 2023 08:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990177; cv=none;
        d=google.com; s=arc-20160816;
        b=pqyR40wGxoFR0d6IyYZxt9Tw965ZtQyby9fp9WhRT2mEyo5eamuud1dw91F2z3gIaA
         76gwGQM5WDLbToWSWqK4UFf55RaOcvO0skr2COYkv5qPQpxK8mFDuYmusPAuI1JOI0tB
         OP4ud4muV5/kkNGXQWluiJ/8UznXPZERDh4uJ9bsirjOm0fMHfDa7/9tIQ/LR/2tRs9g
         GK5dr8YF0+kHHBqLAWp37G2O0Ms1KlLwtWOBprE6lrHPLfW9nZeVu00surV0XaZQY2YR
         DpLdpi1EudfZbade4pXrj32XVt3REalzqY1O8UX1tKdfeWWcDXWWpbQ5K95iMZ/3XkTy
         mULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/SS3XxTtYZBPNCPAcNZJPqZKxgPyT87SCot5d6FzLcg=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=A4VdTsjESWaea6K7Nt+gPHkY+9il3Dno7xPENywiCOZqb6yzQ6mIzwK+yaYQ0zarwC
         MNLiUBB1bkfZtUcAP3f1sAMLCkGReTS2ahQ7dN/nSyYDTagO6cyINaTcwbDG2O40Zp8w
         FGIATSeuueam3QtqaxG7iLJRLkeM2zDey/RdsrSXdKHr8TKi6SO3DzKxMr/ZYMFTfQ79
         akcHT4St9BBsoZKm/22CQhqo3w1yMpZ9rNbBppyep5sgPVXEN7Vb9cFYIT+jz2Xb4UKF
         oQWuhW+TIArHJoqpTeJ0hjUbX2LloBtpg7g9pzQcIPnDOr/jx1glV3evsUW6aQOiWu+L
         Mwkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=BWWF1Tj2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oh8-20020a056214438800b0066d1385b824si4447502qvb.544.2023.10.22.08.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 08:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=BWWF1Tj2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qualx-0006QG-00; Sun, 22 Oct 2023 11:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1quala-0005Qb-ST; Sun, 22 Oct 2023 11:53:26 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1qualT-00004u-Jq; Sun, 22 Oct 2023 11:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/SS3XxTtYZBPNCPAcNZJPqZKxgPyT87SCot5d6FzLcg=; b=BWWF1Tj2ZCbw+Xl6/033gmXZ+h
 Qbn1OwrLbxPN5PvM19w75h6Icum5qoEOCDZJBV3jl545rM5RztpKW3lW/cPlOixSPELghzN8el1fR
 QDR9o9gJrrMiezrmi3cNZg94OZ0RXgWukT2Vi/XnWaoVlH8IntvKSfC8lHymx5IE0gaUdamHDRBh3
 h1qvWBwsVasZQgjnQvUSlmQWL38MlDGIjulgv8fP6LpvUTnU58ChCV7MtVxJbobhRJcaFJ85p5fiF
 ZKsoSQ7HXfmsdR+chBYDgW10xfrlksoh+WvYvQ9EfDLVz3iHINQfjPfGVqXRwEg0M7gH7Sb+/dNpf
 fBAQq70Q==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakI-008TGL-9l; Sun, 22 Oct 2023 15:52:06 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakH-001qZ5-32; Sun, 22 Oct 2023 16:52:05 +0100
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
Subject: [PATCH 13/45] hw/mips/malta: use pci_init_nic_devices()
Date: Sun, 22 Oct 2023 16:51:28 +0100
Message-Id: <20231022155200.436340-14-dwmw2@infradead.org>
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
X-TUID: wV05Ir/31IXl

From: David Woodhouse <dwmw@amazon.co.uk>

The Malta board setup code would previously place the first NIC into PCI
slot 11 if was a PCNet card, and the rest (including the first if it was
anything other than a PCNet card) would be dynamically assigned.

Now it will place any PCNet NIC into slot 11, and then anything else will
be dynamically assigned.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/mips/malta.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index dac27fad9d..9357cb4c91 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -606,18 +606,9 @@ static MaltaFPGAState *malta_fpga_init(MemoryRegion *address_space,
 /* Network support */
 static void network_init(PCIBus *pci_bus)
 {
-    int i;
-
-    for (i = 0; i < nb_nics; i++) {
-        NICInfo *nd = &nd_table[i];
-        const char *default_devaddr = NULL;
-
-        if (i == 0 && (!nd->model || strcmp(nd->model, "pcnet") == 0))
-            /* The malta board has a PCNet card using PCI SLOT 11 */
-            default_devaddr = "0b";
-
-        pci_nic_init_nofail(nd, pci_bus, "pcnet", default_devaddr);
-    }
+    /* The malta board has a PCNet card using PCI SLOT 11 */
+    pci_init_nic_in_slot(pci_bus, "pcnet", NULL, "0b");
+    pci_init_nic_devices(pci_bus, "pcnet");
 }
 
 static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
-- 
2.40.1

