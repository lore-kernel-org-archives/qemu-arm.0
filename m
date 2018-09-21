Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3332827wrd;
        Fri, 21 Sep 2018 09:26:15 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY6hcdPWG0INBqw2MONGz719se8wncqnvCW0ttSF+PRjCX3+wdiAMTKV96kHaUPF+PrXFnd
X-Received: by 2002:aed:25ea:: with SMTP id y39-v6mr32786181qtc.217.1537547175265;
        Fri, 21 Sep 2018 09:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537547175; cv=none;
        d=google.com; s=arc-20160816;
        b=Bh+G/yAKRP0xcIj2TD36tVaifgzS91IW6c2P3F52z9oXioA814hJMTJ3wO88d1SFBM
         9aIhgUeWOX4SmMjoydo2aTO2/Htw3X2zh1MHxDvyk0F8EPqOoZplapysvbjawGabU4je
         aNlF4muAD+DGrSm8Emd5h86FN9icm+KG4seYdDWjAnpGoFdEoXW8zfEzz4jcrECUlDAI
         N6vay6IUXEAoC+FNGijwhD8ITdvkNKIsvkYbQjO4qQ+WOFGzOfmvRU0SfonutfsBR7Gx
         T2xPyYtKZwQwKZYmc7CZIJ8H6tOyjJUJupPt2tmzPZb3NtEa9U2sVeV2L1omJc3YhtXM
         kAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=GVdvjyViAC3sRRGeLEh4P23jQZXgRhb3qKom6pqYMZ4=;
        b=AaapiXR+5hWMvK8D1jfa4Tm4a9Eh302d7j41ZUpNvfPvraie5eixvS3nDN+ezC4g8+
         OFCciMHg0bgmvKxM87bAyIff64ezTV2mOsdE2X4EPQuf5oVSdsXiqPR/4wYP9o9SO+4/
         utDLDA7pGbWyM8fB28wz5a+8aUh85HODddp/VGBmfaJSTtgc1LMgAG/n3pYgC8B26tBo
         q5hxpWO292zzXAegLfuHwLslb5drJ+L1ZjKzKrDzJiyhxoAb0q8BDahI72kS1VeopUZG
         FhAnUxcs0xZvrC6+v8bOgGyx2fPmoTSDMNWy4tB+hqnc+VO/f7wHWaEMu5RCTLqO0PF1
         sy/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i12-v6si28221qkm.224.2018.09.21.09.26.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OFy-00082e-PD
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:26:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAn-0004K4-LF
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:20:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAf-0004BU-Qf
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:20:49 -0400
Received: from 2.mo3.mail-out.ovh.net ([46.105.75.36]:46289)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OAf-000480-IM
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:20:45 -0400
Received: from player799.ha.ovh.net (unknown [10.109.159.159])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 4C1151D723E
	for <qemu-devel@nongnu.org>; Fri, 21 Sep 2018 18:20:44 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id EA1AF5200AE;
	Fri, 21 Sep 2018 18:20:34 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:33 +0200
Message-Id: <20180921161939.822-6-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1899393145862589248
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.75.36
Subject: [Qemu-devel] [PATCH v2 05/11] aspeed/smc: fix some alignment issues
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SmQXHsSfrRnn

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/ssi/aspeed_smc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index b29bfd3124a9..1270842dcf0c 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -388,8 +388,8 @@ static uint64_t aspeed_smc_flash_default_read(void *o=
paque, hwaddr addr,
 static void aspeed_smc_flash_default_write(void *opaque, hwaddr addr,
                                            uint64_t data, unsigned size)
 {
-   qemu_log_mask(LOG_GUEST_ERROR, "%s: To 0x%" HWADDR_PRIx " of size %u:=
 0x%"
-                 PRIx64 "\n", __func__, addr, size, data);
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: To 0x%" HWADDR_PRIx " of size %u=
: 0x%"
+                  PRIx64 "\n", __func__, addr, size, data);
 }
=20
 static const MemoryRegionOps aspeed_smc_flash_default_ops =3D {
@@ -529,7 +529,7 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *fl=
, uint32_t addr)
      */
     if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_FREADMODE) {
         for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
-                ssi_transfer(fl->controller->spi, 0xFF);
+            ssi_transfer(fl->controller->spi, 0xFF);
         }
     }
 }
@@ -567,7 +567,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, h=
waddr addr, unsigned size)
 }
=20
 static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t d=
ata,
-                           unsigned size)
+                                   unsigned size)
 {
     AspeedSMCFlash *fl =3D opaque;
     AspeedSMCState *s =3D fl->controller;
--=20
2.17.1

