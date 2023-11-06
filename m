Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004498eja;
        Mon, 6 Nov 2023 11:56:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeQJ0uDpjLhHPaLc+7FOizutHYg8PyVkneq4vWiWiQ14EXaMSQjFTTH3vP07qoXgUAJYsm
X-Received: by 2002:ac8:5c96:0:b0:41b:806e:81c7 with SMTP id r22-20020ac85c96000000b0041b806e81c7mr31943451qta.32.1699300596718;
        Mon, 06 Nov 2023 11:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300596; cv=none;
        d=google.com; s=arc-20160816;
        b=dU9EO1HFHRX7qShTiWbKS9EebpseNoPXNzR4GZWQC4U2MGdlK1511CXeRuWssH8lBR
         FDVHuGlEl7saADrb/432x3fEEKSXs9iSrDsUhZOCBUZCIHtHwcNfHGuAxpSrR6Hi6oV4
         +gm0iv8k4WuaJrsvqNdg1TlaT+Jcv9DhesnqpbpXk4nQuw1XbZAkGjlzMSSwryDWm5qE
         9JIqUEWmcmB2TLzjF7NTelfPg38bbF/miV5WL7QpWQfbJ0piHl6xQL3IDGK1no5mTEMq
         rkAXIoAXpE1/YKBg9xgRDLyxmXXNQAuX9WAJBhapdZ7PP6vtK6r2HqYJ61VZr2Yr0EfX
         tvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6GcIfEqXlcnmmpl6cCrOJJoCYIHAK8lem5JXl9qMtnE=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=0MINGtkgGqxT6jyJ7B+J+yAJUwEWXrtISnsLJI7viLS8JgMXkyE67mcVvALCaMn1ot
         tfmQCwbCYtZfspcjg/lF+CE8INgTA8KD/+6xvrDJrLQXA/ikMuIdJ2VfCFt3QNOy/oMP
         gaO6a9luX25DnbOnQOTd+XyfWGEvXg/lwQuF/zDZjsFeI7Ie1F8M7/kGpLiMsdjSqQF0
         tem5RKhpgK+19996o1MNu5QZB6EstC3+lwfTg/Ddh79WaXgjCf7J76vh/i53R4FXl1K1
         Hc8PYcTbJS3W/l0iENmxbKxllh3wS8MWKNXqYVJ9Ez4HZKqhwe2n963AzEoY6p83D21I
         x90w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=QgCulFrk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a05622a14c900b0040fdcdae9d5si5765618qtx.4.2023.11.06.11.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 11:56:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=QgCulFrk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r05hl-0001of-03; Mon, 06 Nov 2023 14:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05gt-0006Ne-54; Mon, 06 Nov 2023 14:55:23 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05gm-00066c-Sb; Mon, 06 Nov 2023 14:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6GcIfEqXlcnmmpl6cCrOJJoCYIHAK8lem5JXl9qMtnE=; b=QgCulFrknk++puvIc8xv05TqtR
 ADnGU4Ge42C6n3KqRuee9qIvAs4ZgXlXooWWLWMPSbZ/lpLi9+wE9xe6GVO/4BsLlBskszEcJDK6u
 b3d3S2TxMQMhgXjUfJSAK3IwaTpeS/1SRYzaDnHN9cZiwTGqPEWhM1EqUxQvMij3D08njv1hf5zLa
 E/lM25PmshZs8n2z0u4s3k7l0k1+QXsNOATEHgXW/QoH3JjQt3ZgoUN3i4Gchyr+zQsq5GJvdqmij
 X3sRfxM531p1pPRUzK4tX06o2kILA2Ha9sZbaHB9lPivmaGLCN9QJ0WqbYR+xL7WDMzqWR4T7rmwY
 KJ2AyMOQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fb-007taR-5p; Mon, 06 Nov 2023 19:53:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fb-001GO5-1B; Mon, 06 Nov 2023 19:53:59 +0000
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
Subject: [PATCH for-8.3 v2 22/46] hw/arm/aspeed: use
 qemu_configure_nic_device()
Date: Mon,  6 Nov 2023 19:49:27 +0000
Message-ID: <20231106195352.301038-23-dwmw2@infradead.org>
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
X-TUID: /If7a1FS9S8I

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/aspeed.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cc59176563..bed5e4f40b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -356,7 +356,6 @@ static void aspeed_machine_init(MachineState *machine)
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCClass *sc;
     int i;
-    NICInfo *nd = &nd_table[0];
 
     bmc->soc = ASPEED_SOC(object_new(amc->soc_name));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(bmc->soc));
@@ -371,10 +370,10 @@ static void aspeed_machine_init(MachineState *machine)
                              &error_fatal);
 
     for (i = 0; i < sc->macs_num; i++) {
-        if ((amc->macs_mask & (1 << i)) && nd->used) {
-            qemu_check_nic_model(nd, TYPE_FTGMAC100);
-            qdev_set_nic_properties(DEVICE(&bmc->soc->ftgmac100[i]), nd);
-            nd++;
+        if ((amc->macs_mask & (1 << i)) &&
+            !qemu_configure_nic_device(DEVICE(&bmc->soc->ftgmac100[i]),
+                                       true, NULL)) {
+            break; /* No configs left; stop asking */
         }
     }
 
-- 
2.41.0

