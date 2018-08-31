Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp443797wrd;
        Fri, 31 Aug 2018 03:42:12 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYcmv5mmh/cwTFWBGa1x+p6VRpBtKYeJGE6TIA50Fr+Prt1bBtjrJVRvAHEqVsg82JbMXF5
X-Received: by 2002:a37:98c1:: with SMTP id a184-v6mr14877762qke.328.1535712132846;
        Fri, 31 Aug 2018 03:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535712132; cv=none;
        d=google.com; s=arc-20160816;
        b=STb5YMb9EtSw6LydYTGT1kS/LAHXwpZ0M5CIvYk74C4okekUWemeR4KE2vzDlvuBHV
         nNSZV96BpljurLs88aWATb0tXoTZTOqNkkxUgrVE7ZzTWp83IORALn3Y0feKG0YxabMr
         iUsy4EREsmgWRar+PfQ9u9HxqaDFj/uJ4/ZwbyYJklkqscp2zgcf7gJxRL+QsmXhKlN7
         +NajRqldrbznc7mZPCFf1kZQNrsI3c6pGxi4sRWrvwGyDXT+VVYZA21t1v0xJBvaIG/a
         pEkHwxOThbLMotZv5ITaiz5GfsQX+rga16oGdFM4edwl44HkZjg5L7NETAt+FpPCzjEE
         m/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=y6+FQ+BwFNwRm7naewvzdmWcxRdpg/BRPG0fXxjas+w=;
        b=cDA/iWsNK5wVq60QwVRSNEmQbEPdK+JiWzo49h7bZ70Z7ZZaSWHxy2pem44V5hhRBu
         4WosUWwMVxIj0lTsOOwMIqxstvjkEz+WsgQqxO5VGGqKbx7xHkrrSD/KcB0UcKtZYdc3
         J6MYNu8wHNMzEQX6bfYYBCT1s4ftxTBl7oZDKivEKGabtKPRgL9M34SiEN5z/776O5Jd
         YAqf5j0ONY3+JRvUHrUgn09RTlNLwviZAPP16TCPs/HMBstpplODdoECz2NW8Y/PbAbG
         DFNrdaoYe5XiTRtHHiC39eF8pSFg1nWbLNN1aZ3JObPPSwktiQ2uwXdFT/ScDB70f6Jj
         4nXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h8-v6si7497133qvb.169.2018.08.31.03.42.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 03:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvgsW-0005PG-8I
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 06:42:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgpp-00038J-0E
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:39:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgpj-000255-0V
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:39:24 -0400
Received: from 10.mo69.mail-out.ovh.net ([46.105.73.241]:51034)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvgpd-00020b-Lb
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:39:15 -0400
Received: from player168.ha.ovh.net (unknown [10.109.146.173])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id E40142695D
	for <qemu-arm@nongnu.org>; Fri, 31 Aug 2018 12:39:10 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 3A9614200BB;
	Fri, 31 Aug 2018 12:39:02 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 12:38:12 +0200
Message-Id: <20180831103816.13479-6-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831103816.13479-1-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1931481293511756608
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.73.241
Subject: [Qemu-arm] [PATCH 05/11] aspeed/smc: fix some alignment issues
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wdFwnJ5YvgtK

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
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

