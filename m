Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3005670eja;
        Mon, 6 Nov 2023 11:59:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFVzzd6uqCAU+9i17BM7bi+OI9wZzni89lJ7IrqT/3N2hjo/W1r1yDEvFTZgf7ShDl67H0
X-Received: by 2002:a25:b187:0:b0:d9d:12b7:52fe with SMTP id h7-20020a25b187000000b00d9d12b752femr28767297ybj.48.1699300767369;
        Mon, 06 Nov 2023 11:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300767; cv=none;
        d=google.com; s=arc-20160816;
        b=Pk8W6MOTOE0Wxr6mwMQPMqmicOdTMCJPB+8ZXZ//0hKCmgv9+Hx/6QoaZR2pMpNQgj
         emWGLAfKIlt1ipsxwVu2a8aiz22uRZ9a/RMKM4FSVOL9kU6mmLjNgOur2LYOcDDEKHCO
         uxF9CgmKdxjGkjbvj1uVpiHAj5E/1pcaVUvL0eiakEVx+di6kAUbcqAFPJoR5heLtE7E
         Kwr38sLzuYp3k2/C1YJTVt+RWobwWnYPrwYaGq6QepWBsP5MTQLjhhxloSognsevJi4o
         zgnyLwPu5jnYyKybT1K5RueuFDcZje9aqIpu+DMr8yvcLOeaaUCGa7DTFhTOUt3x5eki
         KVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IRrS1Ip1Y1CS4Hz1ksfmSuWNiYQxa0GsEECWORyCCB4=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=WjIiVAghhngS74pLyx3OG8z1kAp4sD9m25KNpsKDr9ADVjGiFFEMK6FA1I2xml3Hz0
         Uyi+GQDWZBBezX2QOdBpf5a0pjZggrDvW6H0NC30Jaf/ezb7uarYBgbVfLVngYIZ8S3P
         0j9hpGoXS3/Z9O5TW/CL64TRAmTK8kDkz5UJgwRlLAjAOwXy7LPTHs843PhRe/Ad/TiS
         6UcnRbvFubG8agTKC2f9crati/9ztVkbeTE7scuAgl3RR/FIXwi8MdPxvVJq9tVLPpYe
         N0XmgMXytcAK7JPua2bBFTWeVMUW6CcPWRSQeaDtUZ26fp6XZYGGqv7om26lEwV6+Hrx
         qS/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=fUutKnPv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc2-20020a056214174200b0066d06e685aasi5871235qvb.189.2023.11.06.11.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 11:59:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=fUutKnPv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r05hk-0001ho-6C; Mon, 06 Nov 2023 14:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05gy-0006OK-2u; Mon, 06 Nov 2023 14:55:25 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05gn-00066i-V9; Mon, 06 Nov 2023 14:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IRrS1Ip1Y1CS4Hz1ksfmSuWNiYQxa0GsEECWORyCCB4=; b=fUutKnPvhKKYNvPnaUSytK4Drp
 wIw63I9XKRhaK8DOjjloQB8quEVxhSV+OUywFeqHPnHW92zLDm/qClFUq0I426fxoCizket/1f2/1
 Pu1dxOWpnrPUrfydMjmyfwwL0e1koDvdIfEPwgK/hBjxovrWSY8VbkYrLfMDizwr6mFWlT8IMUaqM
 yXIa8MwsmIl9y7bjKwp/S5LWH73qH6GZr9diDz6/lJyjujD0+xuIjutKsuLRaLi55f4fSX/GJ2whN
 RmTarm+G02AnuZm54FvhFzuVAhNtho6uEMoKHgVnwm+qUVo1Pqy0h6css3kUKXUKqPlB/0lNP9mhI
 TshVueXQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fZ-007taG-R7; Mon, 06 Nov 2023 19:53:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fa-001GN8-0B; Mon, 06 Nov 2023 19:53:58 +0000
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
Subject: [PATCH for-8.3 v2 09/46] hw/arm/virt: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:14 +0000
Message-ID: <20231106195352.301038-10-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org;
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
X-TUID: KjtmOi/4C9Cz

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 92085d2d8f..61706bfcfc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1481,9 +1481,7 @@ static void create_pcie(VirtMachineState *vms)
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
2.41.0

