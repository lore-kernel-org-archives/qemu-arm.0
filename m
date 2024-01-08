Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp8483ejs;
        Mon, 8 Jan 2024 13:01:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3Ie9YUQn4yqO4I1aS1fjJBvtlQ90quNZ9IS8PcKoO/L6nr8DLpRvZkFyek/YvL0r25vid
X-Received: by 2002:a05:620a:468e:b0:783:2a04:5a98 with SMTP id bq14-20020a05620a468e00b007832a045a98mr611438qkb.52.1704747688754;
        Mon, 08 Jan 2024 13:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747688; cv=none;
        d=google.com; s=arc-20160816;
        b=lXx2cEJZ6pwpLHQopiJTYZ8kkxUl+4q4sOMHKJCtHZD2vJPKB9Pspe7dP9aewDMfqw
         hkPgMeB/FR7WWbJrGvhOa4GC2Mv3ogO5XtyykwW/JoHUEuUOr/7QWTAEoiNVPH5Jlpep
         rShJcCa7vqZBCxeI4msEPtZDMlIXldO/HDE8pNFr6JRYu2duW41URfO0fhvgbe3IkA6z
         t1WICnseCucqNFFfNqrgrdgZ7lIvgFQECjkrlKNNZfx/n/kUoBCbUkwddPO6ezFtkSHh
         1tP3E07yir35wp83TOCuMZtcd414kLQHtBdYyNg7zAY4w9uyHhpO9LM0b7/p3gDxmbRB
         Lf2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b/4LHUVwE3s/LELrt+0ER1ploJUp0OvQT5xXzN2r1Zo=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=0s6WKx8mUrtIRUix+oma2KjVZud/Qz1f2PX6BWeukIUGISHNZBUYdTnWJzGjBfOoBZ
         nixh3r5H6b5GFPrMXZ2dPnzuLgR9Ug7SQ4GqTP9iE/HQR0dI4cIgApawPeojt2tqRLv2
         m8TU7zAmvXYyPbDLZvBTG+bfk4WCHT/E9dcYioWMMjOhmq7sse/tz6gIsTStITXBKE2C
         4WfTACrYcqCXtounKbLMa7u6teOt174TOipH3nakTKATK00laBFpP8CvvyvQsyXHSm/Z
         Yx70rV4PKmlvD0HEuJB1awDETr6Ne9GdGW1RNArL78qTsDtmVun1Uq60Cp6SpOoikDCj
         Swrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=R+9UIqnO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az37-20020a05620a172500b0078323633126si566549qkb.242.2024.01.08.13.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 13:01:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=R+9UIqnO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMwaV-0005o0-FS; Mon, 08 Jan 2024 15:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rMwZa-0003oj-3z; Mon, 08 Jan 2024 15:50:19 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rMwZF-000109-7V; Mon, 08 Jan 2024 15:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=b/4LHUVwE3s/LELrt+0ER1ploJUp0OvQT5xXzN2r1Zo=; b=R+9UIqnOpvziyuI2TUeYql4ANg
 NMsdk2/5xD7D9MlhuZHmIJshIziQqnGJtDHoW4juLDKVPAZkt6w3zK9xTk6L6jFAOzTTVcUuJEzbQ
 vVIoJKEujwUoDk+eRueZjnMO/yg1smyRp20TqQaT2SOON5sjvgNVD78pTYk6hzXjh9UXi705rgHZO
 cRP9+ZpBnCLmZBLdC1SOZJugbwehOlmlLqd6eRUBtQWfqP/9rNCd7Q9MPhrQcqTgiRqZgAdV7eX5h
 GHjiFsyayTuk2CwPmAB5b0G+B3QxnPunBG+WrdLoYj494gfueuQxkVScypeDuhGbyxIWbNdpVNgrf
 0vzFTh4g==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMwYk-007wXW-33; Mon, 08 Jan 2024 20:49:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYk-002NFY-1E; Mon, 08 Jan 2024 20:49:22 +0000
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
Subject: [PATCH v3 23/46] hw/arm/exynos4: use qemu_create_nic_device()
Date: Mon,  8 Jan 2024 20:26:52 +0000
Message-ID: <20240108204909.564514-24-dwmw2@infradead.org>
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
X-TUID: qiZrdZV2TcOH

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/exynos4_boards.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index b0e13eb4f0..003992189b 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -76,10 +76,8 @@ static void lan9215_init(uint32_t base, qemu_irq irq)
     SysBusDevice *s;
 
     /* This should be a 9215 but the 9118 is close enough */
-    if (nd_table[0].used) {
-        qemu_check_nic_model(&nd_table[0], "lan9118");
-        dev = qdev_new(TYPE_LAN9118);
-        qdev_set_nic_properties(dev, &nd_table[0]);
+    dev = qemu_create_nic_device(TYPE_LAN9118, true, NULL);
+    if (dev) {
         qdev_prop_set_uint32(dev, "mode_16bit", 1);
         s = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(s, &error_fatal);
-- 
2.41.0

