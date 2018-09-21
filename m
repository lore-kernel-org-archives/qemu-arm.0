Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3327589wrd;
        Fri, 21 Sep 2018 09:21:22 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZsjoK0PFuhY9oOxz0cyKLYE317WdkYjJo5E1upRmItFbGAIT6zqBVQPBtD+c22KHFWBqwb
X-Received: by 2002:ac8:1ab1:: with SMTP id x46-v6mr32194846qtj.44.1537546882403;
        Fri, 21 Sep 2018 09:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537546882; cv=none;
        d=google.com; s=arc-20160816;
        b=YE5DjutGnwaDBAa/jVhqtrPhoIkpoJMTqWhmVzZOZk6Iw+88s62ls8M0mjyHYl8hfP
         x2owktrEhufE/OquHuFWOwip7od36TjBEHpks49jTf053zd4wuV2dApu65c8U5ac04Od
         1BZ3Nb9tRZak8z2HFywHOs3g/a0S63GfPzgEUwcpvpnJPvNW+AeElxqa05gFQf+oWNZF
         kf4Wo3+TY4Nj8056lzXZyH5qbXOQL/5F5PNibtIAo6Ary5DQkY9oaVfcHyk9aJ0Gji2J
         yyFmYY+gHRe8P6ueJBTCZ4ng5CA2/5kkaN3DrrpLdaPKd/dFIs4zwRrHtbeMPcjc0elX
         9paA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=VxSTyB+UuGvY8XPj4SKZ87L7IpBEXsknS2DIDez30OM=;
        b=Kbsrx9RfVY1HLN2gasj4yA1N436JRXJtctbXkwe4wjzXYWzVCAZj3DVRkqMb2/lDn1
         QSJOF3mNKNHA0DHTv3Z1rNpHTmEr/q6Pg6NNXl1anLabu9YpagwPDgz8wGLwaNCmlFxh
         zlTGRmUWhc7K+AhsnAtNt/zyjPt3Om/6U4TcxJv15NESm/Qd+mu5M2gTY4hR6soHafQL
         BkWzpENOaIY4pxXzHKKl3WfNW1Z1EmixEFluJ8myDh0oImr13+RU2dPmhbaKDMaQhz7f
         aveSmovkdAgsaTA05p9B8qbgnXNXgL51Jmgh4aXvgkb9MtecYxMIz6/rafui3VRhvbq+
         XyXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l62-v6si1185315qkb.0.2018.09.21.09.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OBF-0004Uc-Ti
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:21:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OB0-0004T8-8n
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:21:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAv-0004Ld-5T
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:21:04 -0400
Received: from 15.mo5.mail-out.ovh.net ([178.33.107.29]:39853)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OAr-0004Ic-Pj
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:21:00 -0400
Received: from player799.ha.ovh.net (unknown [10.109.160.143])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id A10E41F3513
	for <qemu-arm@nongnu.org>; Fri, 21 Sep 2018 18:20:53 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 4B1E9520093;
	Fri, 21 Sep 2018 18:20:44 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:34 +0200
Message-Id: <20180921161939.822-7-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1901926419541232448
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.107.29
Subject: [Qemu-arm] [PATCH v2 06/11] aspeed/smc: fix default read value
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
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4jY0MyiNtqO1

0xFFFFFFFF should be returned for non implemented registers.

Also, the model should expose one control register per possible CS
even if there is no flash device attached. When testing the validity
of the register number in the read operation, replace 's->num_cs' by
'ctrl->max_slaves' which represents the maximum number of flash
devices a controller can handle.

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

