Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4331537wrg;
        Sat, 25 May 2019 08:36:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybmeV8wC8o4Ze62X4/U44PLQAwm9kfeqTMsQWdod3y2BvujjPTGokoRPg1ypPt87mO+I/Z
X-Received: by 2002:a67:ea42:: with SMTP id r2mr29860267vso.207.1558798562950;
        Sat, 25 May 2019 08:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558798562; cv=none;
        d=google.com; s=arc-20160816;
        b=TF196Ub3u3I7R/dZ8ri4gZEHm0Uzol1oqyfLYM7YY2/2BhyWdRcetYs7mEGM0HkQNJ
         vg4UOVaP2n23jxemtcI06frs00SISv0M+LATZjhVeeYrelxJ8glpPrlRrhzKhm1wNJy2
         Dec/ZlQa7vrlamxK3NYwpt92k6ytDfjzJyY6Z7jsrx8+yKBqT5opBxRqiCpxMHNiB54s
         jx+ncn9A1eE9kE+b/7e1C9baTKeHXrWuCCk58iO4msI0NAilZoxwH+64SLz/dBJA+Qj4
         gxjMB7wbKt8ZjPlWLIAC+bwVpCrhQmuWe0sV07hfFOWMcJ3hhhkCTT0UP1SQeKwiuIIf
         fCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zgLI8uDTIVeoIl381UmO+MvG0wgMMt+3FXK/4cgVg1Y=;
        b=SwcaAdiKPohkQZXT3wRXhFAV8ABAidHOilYFuauEaFqGVHRydg8v3+N8WA+IB+fHqQ
         Qa4QNPnfuh70hKlJ5xNMc+wuqxefW8/kQO5H/riaHeTKEqBqO6fZIk4d3mwbo2Wo9/Kd
         y8jAiTOn+Sd1QkP31/plVAzbqu/dJwbidlmDeQwXro4VzvLvFyeW0Npmn4KApMTPtYEN
         jR7E4r0UnhrNW+Ftxf/3t46e50N0zEiClQPEw9yiJKkPXab8ifCV7Wn3JO2VgP/TRP0b
         8bxLuoWbRkj7WrQhdX/Z+DUYCaQhbzfLMQVY1Z6j999Og0EQQv9oov2rimZtDk9Nfjfv
         5yng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20si2357994uab.31.2019.05.25.08.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYiI-0002iO-El
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:36:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYdz-0007m2-Dm
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:31:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYNT-0002s5-OX
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:14:37 -0400
Received: from 10.mo3.mail-out.ovh.net ([87.98.165.232]:37576)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYNT-0002mh-6p
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:14:31 -0400
Received: from player698.ha.ovh.net (unknown [10.108.57.211])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id CB7572150F2
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 17:14:29 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id 7EB36625A865;
	Sat, 25 May 2019 15:14:23 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:36 +0200
Message-Id: <20190525151241.5017-15-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6617195229127478033
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.165.232
Subject: [Qemu-devel] [PATCH 14/19] aspeed: remove the "ram" link
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zJN0rNWErvcL

It has never been used as far as I can tell from the git history.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 004b0c318951..228fdbcf65e2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -193,8 +193,6 @@ static void aspeed_board_init(MachineState *machine,
     memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
     memory_region_add_subregion(get_system_memory(),
                                 sc->info->memmap[ASPEED_SDRAM], &bmc->ra=
m);
-    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
-                                   &error_abort);
=20
     max_ram_size =3D object_property_get_uint(OBJECT(&bmc->soc), "max-ra=
m-size",
                                             &error_abort);
--=20
2.20.1

