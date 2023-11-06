Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3005873eja;
        Mon, 6 Nov 2023 11:59:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnOAB3NzYRWyza4BJY97S0NqgEwfdnIvpWmFTEzOWmpzAj4EsYTcufvMU3tHwGMwF0te6P
X-Received: by 2002:a67:e042:0:b0:45d:b9d4:9ba9 with SMTP id n2-20020a67e042000000b0045db9d49ba9mr4525094vsl.29.1699300790999;
        Mon, 06 Nov 2023 11:59:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300790; cv=none;
        d=google.com; s=arc-20160816;
        b=P8QBpQJg5ySACfavHty/u6ZB7F0M3LWJ0Bb4P0h37nPwXAm8O68txnfWPwVeMQ7FsC
         AInAWTMdp4qh4AIQSV9ZPh6M+LNgXnsVhNkgudhPMu8J01lbgjc+wuBOunCGfOC6TADy
         /bM7Q8nQmoUDZdkD+yJ8B+7mohmSE4o9zFH0he+wNjQuesgcHHCGBiGszSTYbS9Pvx6Y
         9v+HJdhtbbfAUw5YUZesh3aIV+40PdVD7MiUJsYhfZPBAsqISGoIcGckxJXjCw4PcOkD
         fMn1NzaWHOlQpd+4D/F44hlBnQ8ACqkPr2SFiEZhfjfrKywFUUM/WDUYTM3DBOeyik4w
         MXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=L5VhMhMWWBNBbH2l848PbF3Scoxc1bNY0ufdNZIbk1U=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=BaxGkJzJnANvQdQ/tQbS+dep+HZISuoECyhYoEb88RsshfEAdOkmy64DHWUcCkYf56
         c0Zsfvusdt3Q60sRmy6FagRNhDzRP81ANTXQHVK6vhfFv8GAWxp7RksDpHZZ5whTqUdM
         JJoqdhkD2j3KNFTjNYZv4slX34UcnVYf54ILzmX/JaPhL4nP6FVTfPAh5VHs23M0I5V9
         gnCQTJHxM2ITc4nAQ0f36E5gAdL7GCI4vzFdZr71iu2WkeQpNTY++HaBp91RY6JcnVuq
         wqtDZqzzbN97f5ViI/FGcCuoO92i3MCCNsJJAeFVek9rKkDLzWI3Rp6TjK7rXcbkH7Qe
         9LSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=iGwdZ+aC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020ac8584c000000b0041973635d5dsi6020316qth.489.2023.11.06.11.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 11:59:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=iGwdZ+aC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r05g8-0005iG-EM; Mon, 06 Nov 2023 14:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05g3-0005aP-7z; Mon, 06 Nov 2023 14:54:27 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05fy-00066w-NI; Mon, 06 Nov 2023 14:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=L5VhMhMWWBNBbH2l848PbF3Scoxc1bNY0ufdNZIbk1U=; b=iGwdZ+aCxnLlfra+boD9l6BbR5
 ZecLaYSnhd2Mj6VGcRr5cKFp3OHC4upiyzuowHAzrNm+l9PPjYHAkA4bsuk85Y4nKk52kzr3+zyEd
 WnS0EyMGlN6ZDfyfDTmHT/OpldPg+ZJbZZPEcHW5jilZh/O9C382WNiPYOg9DNJ13rHwCLDxJFCPm
 Y+L4+sh6q+geRp+KAezyv3Z+Nb5xjuNyuOBLWRC7q+PqKSiqxSUwzaBCQGXmBFP4ccIZe+YhY+YYX
 TdkNjwVq2/Gm1+kB1qfNHER9XVHZDiq28bZA9sEfSnKDxSIznvYI5NHm4VScCILsu+ZnzaauwqDEy
 7knI7PNw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fc-007tah-BC; Mon, 06 Nov 2023 19:54:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fc-001GP5-1u; Mon, 06 Nov 2023 19:54:00 +0000
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
Subject: [PATCH for-8.3 v2 35/46] hw/mips/mipssim: use qemu_create_nic_device()
Date: Mon,  6 Nov 2023 19:49:40 +0000
Message-ID: <20231106195352.301038-36-dwmw2@infradead.org>
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
X-TUID: 0ckEaM9yJ45j

From: David Woodhouse <dwmw@amazon.co.uk>

The MIPS SIM platform instantiates its NIC only if a corresponding
configuration exists for it. Use qemu_create_nic_device() function for
that.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/mips/mipssim.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 4f743f37eb..d930526fd6 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -110,13 +110,15 @@ static void main_cpu_reset(void *opaque)
     }
 }
 
-static void mipsnet_init(int base, qemu_irq irq, NICInfo *nd)
+static void mipsnet_init(int base, qemu_irq irq)
 {
     DeviceState *dev;
     SysBusDevice *s;
 
-    dev = qdev_new("mipsnet");
-    qdev_set_nic_properties(dev, nd);
+    dev = qemu_create_nic_device("mipsnet", true, NULL);
+    if (!dev) {
+        return;
+    }
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -217,9 +219,8 @@ mips_mipssim_init(MachineState *machine)
                       sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
     }
 
-    if (nd_table[0].used)
-        /* MIPSnet uses the MIPS CPU INT0, which is interrupt 2. */
-        mipsnet_init(0x4200, env->irq[2], &nd_table[0]);
+    /* MIPSnet uses the MIPS CPU INT0, which is interrupt 2. */
+    mipsnet_init(0x4200, env->irq[2]);
 }
 
 static void mips_mipssim_machine_init(MachineClass *mc)
-- 
2.41.0

