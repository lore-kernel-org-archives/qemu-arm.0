Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2233119lfp;
        Mon, 20 Sep 2021 09:29:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm12wuUuARn88pPbLHsrkoG37Kbl6f/eTyjS0OdSjsAI4WKBwbU0AaLgCP66T0uttN+1ly
X-Received: by 2002:a67:d51d:: with SMTP id l29mr16335800vsj.46.1632155376169;
        Mon, 20 Sep 2021 09:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632155376; cv=none;
        d=google.com; s=arc-20160816;
        b=iqlhXwGnZvRCS/6sAjPZq9d7nsDOWbEolY21El8mYvtUxDAQjdfODJnVyKRjemVfq4
         C7mkkEYXsGMmnvFLbZdrLrXmcZSASESJkK6kz6apLszZ0ZR/pMInm5n5RxbW/aFWBkmQ
         /pYm74w6GmL90atZwQ+abAY0BJ27hS6gVWFLzQ4+Ivjpt1YEKJq6zvo/7yGsinN5i4kW
         IAI9JaFhSeiDNnZlBQD/ULZxjZG8zjOfys0t6aZd0IfP0V6O7Eqd35jpZGU0s7FM2iAZ
         gx7UVk6Y5oscqK6RCGOV59wtUaHIZpHJon419WPXiKAjGWwpp9UfLUPK2t88MNhh7qWi
         02Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=EJhp10D7CdEJAFDx4iA+2k3Ho966tZ8BD/+gwnJ9sI4=;
        b=N69T3g0CUqPw0yY8k1+SyKqIEHK931S8tYvPtHzi10zB5TaoXN/IGxpd2FvW+K7CGL
         P2Can19n3DbJ5O/eiT1r9a51P1Q0V/G3vWdGDXfbYFxpqov8sBVnIw4JKCyUeoqHbfED
         sBifjXg/sppV8WiennGPipEQpwdkfbAG1Pe5Tr3JKPO1Ovc2JgGeK4V50Dg8ylO9q9WU
         sof9GwKznoGQotIs8vGSpR0pPHCNlp2lY4mFLM7GJM+ZlejNSHuyMvHsM9WHaNOljmAg
         s94tuXPk1F5q8K9CZEP7R5yNG6P+aKIGl1ktcZ8PjUU+6+GDGX4U5MrJbXaRRjnE1F8J
         SnjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si4212174vsk.443.2021.09.20.09.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 09:29:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSMAh-00088p-Hq
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 12:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4h-0005rQ-KE
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:23 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:56647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4Z-0004BV-Bi
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C23C521105;
 Mon, 20 Sep 2021 16:23:13 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 18:23:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00590717bd4-180c-44fb-8f52-d5f1a4ed08fa,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/12] aspeed/smc: Remove the 'size' attribute from
 AspeedSMCFlash
Date: Mon, 20 Sep 2021 18:23:03 +0200
Message-ID: <20210920162309.1091711-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920162309.1091711-1-clg@kaod.org>
References: <20210920162309.1091711-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 06b2bcb9-70d4-45cd-a79a-798bb240de83
X-Ovh-Tracer-Id: 13074231196813462377
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rOYiGSXKwpJP

AspeedSMCFlash::size is only used to compute the initial size of the
boot_rom region. Not very useful, so directly call memory_region_size()
instead.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 1 -
 hw/arm/aspeed.c             | 7 ++++---
 hw/ssi/aspeed_smc.c         | 5 ++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index f32f66f9a838..097bb6aaf5f8 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -34,7 +34,6 @@ typedef struct AspeedSMCFlash {
     struct AspeedSMCState *controller;
 
     uint8_t id;
-    uint32_t size;
 
     MemoryRegion mmio;
 } AspeedSMCFlash;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 854413594d9e..f5916e81262e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -376,6 +376,7 @@ static void aspeed_machine_init(MachineState *machine)
     if (drive0) {
         AspeedSMCFlash *fl = &bmc->soc.fmc.flashes[0];
         MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
+        uint64_t size = memory_region_size(&fl->mmio);
 
         /*
          * create a ROM region using the default mapping window size of
@@ -385,15 +386,15 @@ static void aspeed_machine_init(MachineState *machine)
          */
         if (ASPEED_MACHINE(machine)->mmio_exec) {
             memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
-                                     &fl->mmio, 0, fl->size);
+                                     &fl->mmio, 0, size);
             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                         boot_rom);
         } else {
             memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
-                                   fl->size, &error_abort);
+                                   size, &error_abort);
             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                         boot_rom);
-            write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
+            write_boot_rom(drive0, FIRMWARE_ADDR, size, &error_abort);
         }
     }
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 5466be631719..3e4221311a6d 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1186,11 +1186,10 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
         fl->id = i;
         fl->controller = s;
-        fl->size = asc->segments[i].size;
         memory_region_init_io(&fl->mmio, OBJECT(s), &aspeed_smc_flash_ops,
-                              fl, name, fl->size);
+                              fl, name, asc->segments[i].size);
         memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
-        offset += fl->size;
+        offset += asc->segments[i].size;
     }
 
     /* DMA support */
-- 
2.31.1

