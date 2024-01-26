Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1023686ejc;
        Fri, 26 Jan 2024 09:33:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGv1Z/DRW/UN5YJ1irRWsFOOko5RpGJVFvAzBPyf9ml+68IQj80hNBGcboPyYc5E9hC5P5/
X-Received: by 2002:a05:620a:1099:b0:781:1c15:6992 with SMTP id g25-20020a05620a109900b007811c156992mr1758313qkk.26.1706290438010;
        Fri, 26 Jan 2024 09:33:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290437; cv=none;
        d=google.com; s=arc-20160816;
        b=N3Lria75xBq2ZZBm1/+XSjdNWud0oFofZB4MOYnM+ujYbBBXxpZ7W0fVFsl6T1VaSA
         4Llk/rVh0Zup9neinpuU6WoGPNb0/0XF9dTAKyzDn8y7dhojtMlr8iH4at5iOT3JZYxT
         euznZoRHvzCHDRyR2S6hT9Ja2Tp7cnm0AKHD9AgPIjj8K4wKSA7AUmTUHeqfx0E4ac4U
         xVK4CPC8iuiXAGcrX0qQz61xqKAhgq02Nrc0wz/byAN5gro1xO3yU/grGiZFBSevJx6a
         NpmLc117ilgquSFM3aBmaW2Pv/puTv9cvHiAosQqqOxSQJCVCPMtu+tQaE80UzJc8/s/
         cfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mlzjYpSZjZYD2hYts+UpgvgXir7egBvmFzjPnPYKEbw=;
        fh=4aUA0JPxoVvgInBmJ96rXkS+v1RtLmlfy0HlzHtXDaI=;
        b=yKTS5ezjSm+wlSi/KoLfYAXvivFYHxB4FIkLH5njX0qaPZuXCQULHz5LHK2iJ+PQae
         b5QhmpbHS3jeS7qP5S0jSM5ZkN9YUjS1vErrMWJICXFpBPoyO64EIMFcVcJbI1zI+B/Y
         WpHa6dwwtRgT35Rmp3XJBD0E0Bb2G9ylWYAOcCJ4RGw6V0SzAW7m8t72zQBNI2/bg04M
         pKB9W/zdAqXigT1AlOxCB2J0vGi/w7kojcrnNgL5NA5H5Gx3DJlIExiHxNFMpofVN0I6
         Da54w1Sm+4Jnx2dA9oayQQnsW6nQ2xHOyOX3iLtVH8UMHmGNNRjdQPhs/t5PJFqk+ZaS
         8AAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=qlhRo9i8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k21-20020a05620a415500b00783673d394bsi1899810qko.155.2024.01.26.09.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 09:33:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=qlhRo9i8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTQ4a-00076K-7g; Fri, 26 Jan 2024 12:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rTQ4N-00071Z-Vb; Fri, 26 Jan 2024 12:32:48 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rTQ4K-0001ce-Iw; Fri, 26 Jan 2024 12:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mlzjYpSZjZYD2hYts+UpgvgXir7egBvmFzjPnPYKEbw=; b=qlhRo9i8k117Zm8HSNvaw8uaTn
 njG4DzpUgoeqvAPkmQsWrCknlgqB0K0WLuGwpGTb5DCch+LgSX6v3EAcD0XQrb0ZFEJ5O64RqPuUP
 6Bfvec+jIbg6FRkcQuxva8bWqFUF7mww9Dusx8/GItRfSPekwDpuvguN2DoAToQqtF5qMsb87IOyK
 QJhDHMeIVGdDlZIVY9Zc7MPN7kEQiZGSbX2Aqs53XK/HIqzhkx3hkNgBe01lrKiIguTJ2c6XoQuif
 XQ4e4jmdF1/lrt4jB1YhMGLVEDKcdwMEK13TxAC1R9GDHcaek9yYobNbxtBK0vdSZxV8/3enPv1JC
 MP5+wlIg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ48-0000000EKUH-0gwd; Fri, 26 Jan 2024 17:32:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ47-00000001elh-3JDA;
 Fri, 26 Jan 2024 17:32:31 +0000
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
Subject: [PATCH v4 10/47] hw/hppa: use pci_init_nic_devices()
Date: Fri, 26 Jan 2024 17:24:47 +0000
Message-ID: <20240126173228.394202-11-dwmw2@infradead.org>
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
X-TUID: a186xk0KWduD

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/hppa/machine.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 9e611620cc..a1045b48cc 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -342,7 +342,6 @@ static void machine_HP_common_init_tail(MachineState *machine, PCIBus *pci_bus,
     uint64_t kernel_entry = 0, kernel_low, kernel_high;
     MemoryRegion *addr_space = get_system_memory();
     MemoryRegion *rom_region;
-    long i;
     unsigned int smp_cpus = machine->smp.cpus;
     SysBusDevice *s;
 
@@ -368,10 +367,8 @@ static void machine_HP_common_init_tail(MachineState *machine, PCIBus *pci_bus,
                         qdev_get_gpio_in(lasi_dev, LASI_IRQ_LAN_HPA));
     }
 
-    for (i = 0; i < nb_nics; i++) {
-        if (!enable_lasi_lan()) {
-            pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-        }
+    if (!enable_lasi_lan()) {
+        pci_init_nic_devices(pci_bus, mc->default_nic);
     }
 
     /* BMC board: HP Powerbar SP2 Diva (with console only) */
-- 
2.43.0

