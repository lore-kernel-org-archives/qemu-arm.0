Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4231ejs;
        Mon, 8 Jan 2024 12:51:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1P6zUY4wqvbx2CKRyjwzNpsCqBWWZLUQ1Xfg3Y1AMVoleYjPErWspzLyyKmGOODM+wHl7
X-Received: by 2002:a05:620a:1377:b0:783:1e4c:b601 with SMTP id d23-20020a05620a137700b007831e4cb601mr2795580qkl.25.1704747080396;
        Mon, 08 Jan 2024 12:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747080; cv=none;
        d=google.com; s=arc-20160816;
        b=vm0DfZP2z4rWjyt+EKE0Wwd6JO/Xd0HLKiEPaKcItCbqAm+gfp27RS9FKqylYIrLws
         RD0/mArjwCU/pVmcduaEe2dyHz0N2GxLRoVdJEmjsdq8/dcBLjRAf1RP5UW006AEz7GU
         CohUp7X0X7+OPeve+W1p6FsyjdeLMlImNxl4MpHnlIAYqmnVxpGDsN7CiPRQvAu/PGo4
         DQCNhytmrZrv36GmQuxIsqZ2Ve4iWzf/66GuZjzVRvptYd7RYuHPzb5KA62Lh6EWa4yK
         OoToKi7Ls8n1hpECtUOZtirvD5/TdJhNoN7QHmtcqW08HPU1nI1oDNU8dH9BR23CzYfe
         aryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uwihplmHUI41+5Uemb4Oxlu9ois5VtdRK79kjClcmBs=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=rgQ/e1EIR6FTWxpXobCo0DGYuCyfx0J3EaswXCc0Ymz679bmXkAR6+OqnWpJuz7rXK
         57mlyhyFnIL2RfPEa2U4/GbWJ6zrJ7deuc9Eu8hP35pO7DHxAgKqUpX5HBblSL/JxMWJ
         IXObUFfL7kR/wCnh2AZP3jnJRgsl5BHJIPK/d616G5ket95NhK7+0Q4EBfqKj/2mhbLx
         9yM/QtBlTJcdBuaDUAd9C9oApt1yWL3N6TrHo51ko9Eke02JlYrobGOF4kiydKzkd1Hh
         Wl1pSivN6EEqHDiJTlCn4rw/ihForpGLqX9fkYA+Gsuca3XQBZGAcD0p0GYQPpFJb6Zu
         izpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=p6PgkNTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5-20020a05620a094500b0078166136e7fsi471134qkw.598.2024.01.08.12.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 12:51:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=p6PgkNTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMwaT-0005jH-SC; Mon, 08 Jan 2024 15:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rMwZu-0003zq-KV; Mon, 08 Jan 2024 15:50:34 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rMwZq-0000v6-HU; Mon, 08 Jan 2024 15:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uwihplmHUI41+5Uemb4Oxlu9ois5VtdRK79kjClcmBs=; b=p6PgkNTxfh/p47j/keEJ/zN+yy
 usNAJIuqKp+Gu+QP+icK0HMBABsDJM88pOLXEG+UOnzlMuTCJYGnl9lfzioInaE5WmKW9ZayfCMR8
 PmUccMmmi670kLW4xnA7apD0p5dseWRD4ul//kN4FMyNcO/QiaKm7Md1DDvABPcQM00o7EXuuJaI0
 vjZpm36GvwmHLRnNt/X/uZn2ItRuKA5dZz7vhBbDmM4W6Co2I/uCyJEbunG4sYrE+L+LrJQqOd4cF
 ADsNugDqU0atiRLlo+JrOpPGiuRRI1gTRVn3DBWL3ltG+G3rXbqQ0NHYdQmwTFwn7+2jTUPePMfaU
 GAl/ul8w==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYj-008RPk-Eb; Mon, 08 Jan 2024 20:49:22 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYk-002NFK-0N; Mon, 08 Jan 2024 20:49:22 +0000
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
Subject: [PATCH v3 20/46] hw/xtensa/virt: use pci_init_nic_devices()
Date: Mon,  8 Jan 2024 20:26:49 +0000
Message-ID: <20240108204909.564514-21-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@casper.srs.infradead.org;
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
X-TUID: E66Atw5VCkm3

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xtensa/virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index a6cf646e99..5310a88861 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -102,9 +102,7 @@ static void create_pcie(MachineState *ms, CPUXtensaState *env, int irq_base,
 
     pci = PCI_HOST_BRIDGE(dev);
     if (pci->bus) {
-        for (i = 0; i < nb_nics; i++) {
-            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
-        }
+        pci_init_nic_devices(pci->bus, mc->default_nic);
     }
 }
 
-- 
2.41.0

