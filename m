Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp7207ejs;
        Mon, 8 Jan 2024 12:59:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Qm/l0a51iZm6utNI7L0KGTePU/iDhd7jcDzYI3tMDOD86qYuWtFZn+H+Rv43+kkaq3Sm
X-Received: by 2002:a05:6214:2a8a:b0:680:ff78:8114 with SMTP id jr10-20020a0562142a8a00b00680ff788114mr3946943qvb.25.1704747572602;
        Mon, 08 Jan 2024 12:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747572; cv=none;
        d=google.com; s=arc-20160816;
        b=ePT9Vh7UBht1tE8VNpJuSHr2VvXNSvaDQN82JiCZN9pT24JAGve0r84Y71LJplJWfl
         kETSqomeAxQnWQWFUUwd/Gtkegfeid+85MdZXE1NPyXUAMIpYcu59+p7VA1RcEcIQ3P8
         ckp6qy7+Cqq3P3J3g89LbR4q76l//a8uj0B323UwdRT5k+haTpsIgBiRmaAvRdhl3dnd
         N5MRnvAlXl+KSfKlxFLV112YYbiiLAzTg61f7zEP8AUtn2LyDzWBe2J24EcLf7N2MLMA
         mxwyfr74MWSZKcp7kWA4nsCiwg4c1XKMWJb7Ce1UhaMG3vHHJaFLK/VDluKEE5ADeatN
         90BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BtvYxQZMYQ5MtHfC35lrWkDioorml/mWOUj6/4zttrw=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=htnrzFMGANdVjx97PbcSQUbkG5l976jqNLh7rJDd2qkcavpOVtkqp/gQhvmXZEWQD1
         kYsBKDuxV0D781Aip22I0GNXJWuidXqOTRTZtOvR4xry37qwQEJv0bxpm4BHCGXG9c7u
         oOVdOW/xDaD5ShjDAPoBwQKSa1i8NVqexfuUXMizkxX7D6h27iqEq7YMrWX0MbMXr/Aw
         o25NhEqaahufqKqMIT8K2jQSf9PxfP8kj6p4ckVcbeZEpc4vlpzILAmn8PkS/r5558R6
         ACwKAr3S4oJqrCQ3aXdYj6rM1dX56LSmEF2lP9xE40JLse5X8Es6DF5frCm9XJq7OxY9
         FeQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=KzthCYmv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020a0ccc06000000b0067f16519ee6si762192qvk.230.2024.01.08.12.59.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 12:59:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=KzthCYmv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMwbc-0000ZI-S6; Mon, 08 Jan 2024 15:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rMwa6-0004PE-RF; Mon, 08 Jan 2024 15:50:46 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rMwa3-00010Q-Gy; Mon, 08 Jan 2024 15:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BtvYxQZMYQ5MtHfC35lrWkDioorml/mWOUj6/4zttrw=; b=KzthCYmv36IOd+nEGzae8t//5x
 aZNckAiZq8hq4xQ4zUDuO4RpNZugkCDA0mN/hLSXw4jkkqU5sqOYKqVYoxoF6B9xG8lJAZfsLzRiX
 ZNtW/GOZwEjZpvpU+NUCVGhZ0X4nqoTP7YNiqbMToJi6+oFkPcZMzHBFymAyrpafD1bvdXDu5m5+V
 jH0T9mXe6bVEX9a7iPPQj3ng2bU3thCGWZBwlu6+w2IFo0kO5vPmjymu8qT+Uhi3rtVmuTZ9kc/Mv
 Smvgse0U7ri8rkrUae4HJCP80WS2hX0+Pew5M791YwiVkxozSzgWu8VPZ4uWJaWNZvteiogHXLn4D
 OdwV4dyA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMwYj-007wXN-2o; Mon, 08 Jan 2024 20:49:22 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYj-002NEV-0d; Mon, 08 Jan 2024 20:49:21 +0000
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
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3 09/46] hw/arm/virt: use pci_init_nic_devices()
Date: Mon,  8 Jan 2024 20:26:38 +0000
Message-ID: <20240108204909.564514-10-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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
X-TUID: W/6LPHTJpcjp

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2793121cb4..8cf9237001 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1454,9 +1454,7 @@ static void create_pcie(VirtMachineState *vms)
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

