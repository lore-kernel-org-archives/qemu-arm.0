Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp442200wrd;
        Fri, 31 Aug 2018 03:40:06 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ7Ya3Q/TecjF8LdqhkPIbnBLdEM/Z3ZWrG5Dsp27q5yrMbW2fqKLEQ7Qykd7fkzunOQ43p
X-Received: by 2002:a37:283:: with SMTP id v3-v6mr15106973qkg.200.1535712006869;
        Fri, 31 Aug 2018 03:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535712006; cv=none;
        d=google.com; s=arc-20160816;
        b=xlK6ClZo+dlr07ITbiPFDAKWHdy9+Dxgf6QglHAtRKGUp9Y4CIWrdbKe1nZa8Fn/FR
         dLX0GXUU7goPPxXtgnKqzgUVL+J3w+mOoTbVNSb6IUdkniXdjgG7W0MFwuo7gOCJT03n
         k7E5W1mW8VxnPGzvoKx+Tl1BrRuk2rOgXbJ/T1M4Gi3XMNy4Pv5RMV5H+jWIA/YjOmav
         zMXS06mqzVJeCg/c8BemaFIwRypRqfuZ/s3SkJhX2dYF1BJjDmiGSJdMS7H5z6+k1ats
         /VvN54RUMQmVPQkwzFnc4apCyxDxzNR9wEFDkhPfhnCA3Nt60D7bC2/O3habOsvyLP/F
         Pt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=K9fpSrQ7Xv6XxDGitmNWsOa5Md5x0WKMwnu3sdhZUQg=;
        b=eBMGoSe84kcANhcUSuqmenXjWI4FsOiTcxI0jmgwlX9wr6J4jfrl5CAf7Dg9XyVJGy
         FRZoGdbLrtyxSjIEn+bamN+1taSPbDmiw5VV9D+Q2nfWdKlOCiH7qyb5vd3U8cunwFca
         s3H1n60WiGUtKmvmODHNoveeI2eJ3DPch79kZWV/j5BIPhZt//rcFbubv3KZqgxCMjnL
         puF/sb6tayt95F60BceOF5KZQwEE4+UnijO9AkSlk9hKImcHWO+JsV+nSf2jum5lO/Lq
         Gt083Soyz0x9ABiQlSsp+Jph+2MUdN9wmH3MgFZqju4eGRA7LDCyJmE85zlD34jN+Ixj
         3Hqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1-v6si1782584qvp.237.2018.08.31.03.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 03:40:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvgqU-0003Hh-AH
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 06:40:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgps-0003C0-La
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:39:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgpp-000295-Cz
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:39:28 -0400
Received: from 15.mo3.mail-out.ovh.net ([87.98.150.177]:47972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvgpp-00025B-2d
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:39:25 -0400
Received: from player168.ha.ovh.net (unknown [10.109.160.239])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id CEAB41CE7A9
	for <qemu-devel@nongnu.org>; Fri, 31 Aug 2018 12:39:18 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 83E4742008C;
	Fri, 31 Aug 2018 12:39:10 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 12:38:13 +0200
Message-Id: <20180831103816.13479-7-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831103816.13479-1-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1933733093798742848
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.150.177
Subject: [Qemu-devel] [PATCH 06/11] aspeed/smc: fix default read value
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
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HrdpZtZPeuxN

0xFFFFFFFF should be returned for non implemented registers.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 1270842dcf0c..6045ca11b969 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -665,12 +665,12 @@ static uint64_t aspeed_smc_read(void *opaque, hwadd=
r addr, unsigned int size)
         addr =3D=3D s->r_ce_ctrl ||
         addr =3D=3D R_INTR_CTRL ||
         (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slav=
es) ||
-        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)) {
+        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slaves=
)) {
         return s->regs[addr];
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
                       __func__, addr);
-        return 0;
+        return -1;
     }
 }
=20
--=20
2.17.1

