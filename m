Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3014613lfc;
        Mon, 18 Oct 2021 06:34:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlofu5Ta2usX8ORl/bu7AT68Blb3QPufrQc5D6KLIDTSHHviud3VFDo0xr0WKDkynvB/Kq
X-Received: by 2002:a05:6102:c87:: with SMTP id f7mr8058387vst.37.1634564066007;
        Mon, 18 Oct 2021 06:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634564066; cv=none;
        d=google.com; s=arc-20160816;
        b=w80vzzm+x3RgEfS9L/Z+cZP/uSL4+YXt8fgMI2ZB35F6qRPKomeUNIZDJUZEcr1+PO
         FA/BW4OnDXXc+iwP51cuFE84656E1hMCggGuOaoDymkh+odSue/1X2qtHHg1R1PMzFWE
         oFgIKSZGxJ0u98EfDEa809P15XmnHr0kThGCEi1A/67qaIdiaQSqvjf5knzSmcujX8mA
         tEjDnwwkU6MeV5Izj8IgjS0FI4cPqyYHjA5iWRO94tmeX8HrDCUxaf16k9bF3qazMmuG
         5E1vD8VOILceC3jsk/ci0616iT97yd29j2q3XPFEWkcSQBQIOreTUh6LLYSRFrHjlKq7
         1XDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=I/kIjcY3npW248P7dc/NezNGtDU1wV2N5fOjeX5UdIw=;
        b=M/CjD2HVXkF8UR8bfZfi2ozqIRh5s58rJ0W3njJ+Tqc80PFlVkxxO2/AmxqVazt2SO
         gvcKEzYj6ECHhl5JLJAZoGBTx168GAP9DTDvjVKCGYNBw+CKXINeI3okQmFXPWus0scf
         bOz6xhuT5uavVFffxA7oBr+/IsZOHjTRRhB7WmMQoT7z53Kd4MFd8JBHd7EEHdFZaDAp
         Xcuf96BkFhMxyBMhAy+AZUFCH1T93LPhwbiFbf+NXA7uB1TwbaPeC7xjT4YCo2hIJ8IA
         ia0xur+zEZ3/IslJtmUuexJ7uHVqqkRslERhgUvCwjZZfx6yjMVNXR1kqR18ndAS1PDE
         d3Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14si6058930uaj.150.2021.10.18.06.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 06:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcSmX-0006wj-2E
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 09:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSek-0002wp-Ax
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 09:26:23 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:50585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSef-0006Dh-Ll
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 09:26:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4A3032052D;
 Mon, 18 Oct 2021 13:26:14 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 15:26:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001068ba90d-1e75-41cd-920c-601283f517b7,
 F07B6F3C357710E32BAB16EB0BBFA04B60198819) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 4/5] aspeed/smc: Use a container for the flash mmio address
 space
Date: Mon, 18 Oct 2021 15:26:08 +0200
Message-ID: <20211018132609.160008-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018132609.160008-1-clg@kaod.org>
References: <20211018132609.160008-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 62602c3c-167e-46a2-b393-916f0c15173c
X-Ovh-Tracer-Id: 8499699873454525292
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mkz2LPDJnjE4

Because AddressSpaces must not be sysbus-mapped, commit e9c568dbc225
("hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use
alias") introduced an alias for the flash mmio region.

Using a container is cleaner.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/ssi/aspeed_smc.c         | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index ad3c80f2d809..61d23ec1f13e 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -52,8 +52,8 @@ struct AspeedSMCState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
+    MemoryRegion mmio_flash_container;
     MemoryRegion mmio_flash;
-    MemoryRegion mmio_flash_alias;
 
     qemu_irq irq;
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 1770985230b0..d4f03881ddf5 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1218,14 +1218,17 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
      * window in which the flash modules are mapped. The size and
      * address depends on the SoC model and controller type.
      */
+    memory_region_init(&s->mmio_flash_container, OBJECT(s),
+                       TYPE_ASPEED_SMC ".container",
+                       asc->flash_window_size);
+    sysbus_init_mmio(sbd, &s->mmio_flash_container);
+
     memory_region_init_io(&s->mmio_flash, OBJECT(s),
                           &aspeed_smc_flash_default_ops, s,
                           TYPE_ASPEED_SMC ".flash",
                           asc->flash_window_size);
-    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s),
-                             TYPE_ASPEED_SMC ".flash",
-                             &s->mmio_flash, 0, asc->flash_window_size);
-    sysbus_init_mmio(sbd, &s->mmio_flash_alias);
+    memory_region_add_subregion(&s->mmio_flash_container, 0x0,
+                                &s->mmio_flash);
 
     /*
      * Let's create a sub memory region for each possible peripheral. All
-- 
2.31.1

