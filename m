Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3005964eja;
        Mon, 6 Nov 2023 11:59:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBqSbW4LFpz4B6MiC3fx2wMeAdpWHkZym+SLvBmSufkJepX7kweBUQGc+xFJb6+pW0YVl9
X-Received: by 2002:a05:620a:4454:b0:76a:db80:121d with SMTP id w20-20020a05620a445400b0076adb80121dmr31266557qkp.6.1699300799663;
        Mon, 06 Nov 2023 11:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300799; cv=none;
        d=google.com; s=arc-20160816;
        b=didctFAz28YHKCpz5ZP6OL5oiRO82wqdkjNmseXa4tWJ8ijvpV09oW6VND9y43Xl0J
         Y2Dri5kL8dRpWWHa+fciif4riHun11H1scftN2gOzjvzJXILXo0VoyIetzmLkcNcwoRg
         U6BYBhU4SDzpOE4p2rykvo7ncutW7YmWHyxqS+VtPUxbNGy1tm8UiXXMyhFFNGJzRRQs
         ScYFftVqRCmzmVpiRtWxJ+uz5eiLDjqckVtFpkR1apxw3EzFR6oKYbDJaeSDx/GXMV6Y
         Xym1UFv5n1nBB0BJu/dm/gV1Bb4FeoGe7JxKRTwO+Y7mY1okIyK9gAuLwZ1eKox3v/b9
         NE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gF9acMYW8IKLrRRq9sLrR6j7pHNgn6jgFhPV981Epmk=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=wfrzwED+lvpGPNAA3VuTv+Kvy+GllPt09sQ6pvYb4wYx8BNRj0aPIuvEqhjl3M4OPg
         n9dSuqt/1m3BjgX+gtL8j543nFppobmsG0qvOrQx+v33/Sqb8RtvADy90cUggfeufuxO
         3UI/57cdA/HiNHXpjxH1Yiid78NfOxWRDW5xJsu2g+ClBavduHdbvfeR7SK3LHEAyW8P
         XGbvi1ytKLI3fGDTFkXfX5pCWKzsXD1A+qLe1gdsb+lIXEScIQ6HP+bGYZqMFw6alzrl
         4CwmNbd5oYOpRZPdq9qYmGO3NuwC/SAb58VH3O2pecy2nz0ENukbohqu0EyrxM2tKjLm
         ktjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=iMqGFzb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020a05620a278900b0077573d5c234si6409294qkp.456.2023.11.06.11.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 11:59:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=iMqGFzb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r05i5-0002Ub-Ip; Mon, 06 Nov 2023 14:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05gx-0006OG-Lw; Mon, 06 Nov 2023 14:55:25 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05gm-00066z-QP; Mon, 06 Nov 2023 14:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gF9acMYW8IKLrRRq9sLrR6j7pHNgn6jgFhPV981Epmk=; b=iMqGFzb1iZ6zDzbxEiqOxE4h/M
 Ezsel84Uh0IKL/u2eWooTe7azkHFwbVCSnEv4G6BlGdhvV7cuDJBN7ABxSiUo1u+05rJIT1Hdmu2H
 xquye/LNQ2Y6lK5A3AOJio4QcfmFeRcfU5YCk9dQVgfQHyuGv9CgCgfNvxb4GaMS+XfcaBL8/Ao2o
 rqgSG3ZHK9AY6CXVI1l9HOLW0bbKrs974cQ5q9p3VNurTXB/Tilja2hOcVuQ4nnGchEz49P6zidU6
 6KVJaJFGpJYBj7K/aUnq/kNZg6MmJ4g2Bv9+up8Vm6GhE+/R7utSmV/ImClJfINyGcKuO7QVZNXb5
 GbbmSeEA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fc-007tap-QA; Mon, 06 Nov 2023 19:54:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fc-001GPX-35; Mon, 06 Nov 2023 19:54:00 +0000
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
Subject: [PATCH for-8.3 v2 40/46] hw/s390x/s390-virtio-ccw: use
 qemu_create_nic_device()
Date: Mon,  6 Nov 2023 19:49:45 +0000
Message-ID: <20231106195352.301038-41-dwmw2@infradead.org>
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
X-TUID: pcySUd8Ur1D8

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/s390x/s390-virtio-ccw.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 7262725d2e..69d6852840 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -221,16 +221,9 @@ static void s390_init_ipl_dev(const char *kernel_filename,
 
 static void s390_create_virtio_net(BusState *bus, const char *name)
 {
-    int i;
-
-    for (i = 0; i < nb_nics; i++) {
-        NICInfo *nd = &nd_table[i];
-        DeviceState *dev;
-
-        qemu_check_nic_model(nd, "virtio");
+    DeviceState *dev;
 
-        dev = qdev_new(name);
-        qdev_set_nic_properties(dev, nd);
+    while ((dev = qemu_create_nic_device(name, true, "virtio"))) {
         qdev_realize_and_unref(dev, bus, &error_fatal);
     }
 }
-- 
2.41.0

