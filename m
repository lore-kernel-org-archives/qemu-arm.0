Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp10404ejs;
        Mon, 8 Jan 2024 13:04:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbiAqzohtSAUF0Xw/LerYJPOk9Tg+Bsm9Nuib7saRm9JBGjbDtG7NUNG/VMkE/tDv7ZuQ4
X-Received: by 2002:a05:622a:229b:b0:429:99b9:d295 with SMTP id ay27-20020a05622a229b00b0042999b9d295mr1370963qtb.87.1704747737812;
        Mon, 08 Jan 2024 13:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747737; cv=none;
        d=google.com; s=arc-20160816;
        b=wv7ByaEXvn6Jl3qErge9nWrgWtRBHDhsGjj0Nib+Zd7/Xx0MBYuR7UHjwOQPjAOT+1
         pZT5rkg9Cm5BrmGmvqct0rTizvoBA8QCCWTqkumjzFVjUSB9F6V1rdckb53a2/3CabUD
         sXHkTaAhFrXLCk09tOE2qCkFuviOQW23IK/ph8pJ/szmnEMbLDKD3ZCHtVmy4Cldy1ku
         0xOExytMi7aIUqhsh6vQ+L3wX2siFVbrRbMF+d/RpDM/0GvB3V9O1S9aQnmLZIj8LW+v
         Li83wtOkQ8p8jobGajCASuyc8nLa6uCWOFH7Iugr/Tvh1WID8Uje0iv3YsMmAyRywAv5
         j5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fKzSEAzycsDrEiPWFhQoNqX9JuE8mZwP1mZzqxeZRVI=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=O1zF+WYRuSftXAcNfCat8Y5xPXYIN4tuKiiw7kb72+Iy9XblIkbU5F0Q/2q1iX3gGl
         5qtgYixv/nPn2LHy2svWjheY+5LpAcK6onAcYYwgwbe425NI9xMHqJnBZZfEbrQGvG50
         6LH2EhOdkahaJrwxAp6iV7qtcZwgHwXr5vDCpaIPuNFINdZDPF8kpDxkgsSsHEqNxFQN
         Iv/r1pU+TfwpazPwqK2moohHlHWfOxV2sP6nlHNIe+aFl5Wk1iP74n3F7a8Kzm2MIqm5
         1q1SEGSFVztUjQLIAh3o1lyNvCGfBtE3pWKSf8MbCcVKNjHd04wlA0m9TWySOj8cQ+Iq
         If6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=heBk2HKs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1-20020a05622a00c100b00427e7974452si557394qtw.719.2024.01.08.13.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 13:02:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=heBk2HKs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMwaV-0005mj-2q; Mon, 08 Jan 2024 15:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rMwZY-0003o9-QC; Mon, 08 Jan 2024 15:50:13 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rMwZF-00010D-PE; Mon, 08 Jan 2024 15:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fKzSEAzycsDrEiPWFhQoNqX9JuE8mZwP1mZzqxeZRVI=; b=heBk2HKstNixMCfGHrZOPLntIm
 3ER50x76sGFR2x/zM4Mdza3n/WZnJmR281mpL1waE6lKWCg4EGMPULgiMZDSOgSE5jEjG7O5BYpL5
 HPZF+v/DR9iBzkk7Rvd8f6AFxXoCJqlQSj5nfYekAsuL6wKs8mcZo/HvpRqcpeLT3Sg8wKV0euy8D
 MCyQ8ppYR8RIsBhycfsDqXle4/codF94H9ZCTKDfsqVlzP3RYLTfLPgJv4acCK5aORbytCwpsTAFq
 WF9F9NnrT/Iq0HqCfj/UIEYOXmtnOwbO7RzGBrfHRrGm5VL95TMhN64sMRjIsBT+OWZM4QMdqcIl9
 jV/d1MGA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMwYm-007wXt-0F; Mon, 08 Jan 2024 20:49:24 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYl-002NGd-0y; Mon, 08 Jan 2024 20:49:23 +0000
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
Subject: [PATCH v3 36/46] hw/mips/jazz: use qemu_find_nic_info()
Date: Mon,  8 Jan 2024 20:27:05 +0000
Message-ID: <20240108204909.564514-37-dwmw2@infradead.org>
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
X-TUID: aRvFsxgakBfa

From: David Woodhouse <dwmw@amazon.co.uk>

Extract the MAC address from the NICInfo, or generate one explicitly if
there was no corresponding NIC configuration, to put it in the PROM.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/mips/jazz.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 0d2348aa5a..5bf3e328db 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -119,15 +119,19 @@ static const MemoryRegionOps dma_dummy_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void mips_jazz_init_net(NICInfo *nd, IOMMUMemoryRegion *rc4030_dma_mr,
+static void mips_jazz_init_net(IOMMUMemoryRegion *rc4030_dma_mr,
                                DeviceState *rc4030, MemoryRegion *dp8393x_prom)
 {
     DeviceState *dev;
     SysBusDevice *sysbus;
     int checksum, i;
     uint8_t *prom;
+    NICInfo *nd;
 
-    qemu_check_nic_model(nd, "dp83932");
+    nd = qemu_find_nic_info("dp8393x", true, "dp82932");
+    if (!nd) {
+        return;
+    }
 
     dev = qdev_new("dp8393x");
     qdev_set_nic_properties(dev, nd);
@@ -324,12 +328,7 @@ static void mips_jazz_init(MachineState *machine,
     }
 
     /* Network controller */
-    if (nb_nics == 1) {
-        mips_jazz_init_net(&nd_table[0], rc4030_dma_mr, rc4030, dp8393x_prom);
-    } else if (nb_nics > 1) {
-        error_report("This machine only supports one NIC");
-        exit(1);
-    }
+    mips_jazz_init_net(rc4030_dma_mr, rc4030, dp8393x_prom);
 
     /* SCSI adapter */
     dev = qdev_new(TYPE_SYSBUS_ESP);
-- 
2.41.0

