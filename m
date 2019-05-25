Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4330020wrg;
        Sat, 25 May 2019 08:34:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8BXKu49LhTrxTIMNIEta+aqHt0G8iexvIXinsLo/mBMHmPShgAXUm9c1ZmwTNCYgB/5ij
X-Received: by 2002:aed:22e2:: with SMTP id q31mr88248485qtc.238.1558798470970;
        Sat, 25 May 2019 08:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558798470; cv=none;
        d=google.com; s=arc-20160816;
        b=nfwLTROryQ4oXHDr27pW6OpYOdEV9f4A2BQNxd6LvafXD4JQ1lxldYFQXdOkhi6gHm
         gH3IubEC5RR5Wpcydqoy6rgkAyUlXHTbG+daIh0y9gu9ZMArBfpMhGwhoWrHGA+5/uOm
         uIU+B2a++yQOvIVT7t6eIGR9JaYhuHHI9RKld/HcEAgz2t0VNlNTEzcAKOUwo/qhk8Q+
         XwQ/FNoQT/EbmBmPkO3t1IYQoryMpvz3L/x0AlOTALXezBZN49wGnumivpEtaH8DflsF
         JoOKq9Mid54SyHla2OwgpjF2jHvVjV2CGFiwqU+wpDgWR+Oec6dpYK3NQLr2vMyIgkm4
         CgFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=xpp0On2qq+Yp2Bg7umq2NaTxl4lAqLSRMA2eOH8H4zQ=;
        b=auFStYLzdIY5+Y7ttNVhX8k7d2WQNR6Uu45z2JrIIDAekyJ9ZlZ4Eog97o03HKsw7/
         Cj/8v1qypLM1zfdpiB6K8fo1F+QXTwfPzlC3xmGHyEYyW+gNt7V0WmjbScq9W4J+D8Sa
         qPeCDUB1vzeqjOIOiOmkI7T3NJ3i3pIzLy30g2drYkORD/SpjNnOQiXBKVGsXMVqD/95
         XNyc+6YtmJ1l1APqBB6ReuyyyhZjXbjt7YED8dJrGacWf6o5AWC9dvaEEXU4JqKpHqQG
         8yuiDAtRWsIjAmGQ7l36Hfg1DiG9kkNySNalUQnsV8JbAzT1jWsGl93EtJZgWrqmgHPh
         ovVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si2919331qkg.48.2019.05.25.08.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYgo-0001hZ-G6
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:34:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYe4-0007i4-S0
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:31:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYNN-0002hL-K5
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:26 -0400
Received: from 1.mo69.mail-out.ovh.net ([178.33.251.173]:51569)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYNN-0002fW-1A
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:25 -0400
Received: from player698.ha.ovh.net (unknown [10.108.57.16])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 898235A153
	for <qemu-arm@nongnu.org>; Sat, 25 May 2019 17:14:23 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id F256B625A837;
	Sat, 25 May 2019 15:14:16 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:35 +0200
Message-Id: <20190525151241.5017-14-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6615506381132827409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.173
Subject: [Qemu-arm] [PATCH 13/19] aspeed/smc: add a 'sdram_base' propertie
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iPKqD49DUw5E

The DRAM address of a DMA transaction depends on the DRAM base address
of the SoC. Inform the SMC controller model of this value.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 3 +++
 hw/arm/aspeed_soc.c         | 6 ++++++
 hw/ssi/aspeed_smc.c         | 1 +
 3 files changed, 10 insertions(+)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 3b1e7fce6c86..591279ba1f43 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -97,6 +97,9 @@ typedef struct AspeedSMCState {
     uint8_t r_timings;
     uint8_t conf_enable_w0;
=20
+    /* for DMA support */
+    uint64_t sdram_base;
+
     AspeedSMCFlash *flashes;
=20
     uint8_t snoop_index;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 8cfe9e9515ed..65fbac896c85 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -326,6 +326,12 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
                        aspeed_soc_get_irq(s, ASPEED_I2C));
=20
     /* FMC, The number of CS is set at the board level */
+    object_property_set_int(OBJECT(&s->fmc), sc->info->memmap[ASPEED_SDR=
AM],
+                            "sdram-base", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->fmc), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index f1e66870d71f..4ff12f7b27fc 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -912,6 +912,7 @@ static const VMStateDescription vmstate_aspeed_smc =3D=
 {
=20
 static Property aspeed_smc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
+    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.20.1

