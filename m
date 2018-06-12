Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4969663wrq;
        Tue, 12 Jun 2018 00:12:53 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIT4Hzei6ODMPuBFz5wqjwUhV9Va083BKfAEM1foMkXbFj88NzYXhitrzdyzkd7VA8w+yZ/
X-Received: by 2002:a0c:f647:: with SMTP id s7-v6mr2282834qvm.103.1528787573627;
        Tue, 12 Jun 2018 00:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528787573; cv=none;
        d=google.com; s=arc-20160816;
        b=KbB44fUGoSsNdhdZV672IwvWcOY5jFbMWnedsd3+BxyTVaVdPhJP17XTSEo0kJ/BXE
         9UJTiuFWF4wrr2DHzNE9ShAet93YyJXdkGjDrf9qE52KpXMpUU+mSACGRcY8eA0yzr0z
         tp5e8a3EqyuPvI8j5jLPmjcYAm4lQPtG0JULwASSFFibWa6ZXcZySOLjf7aSbib9xgqT
         wod1+ItAj3d4l3IPab94ud2zAldMdcwa6yyV+HUGnQC2tEpyBm0b+skKHO9fA3KJXQed
         N5uoSpM0DkYfhjSigFrzx9aFex3IlMDrkiucTbxKYYDToZzM8JL6NGA2k9XYmAzT6x0h
         oNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=cFA29+7ZmNtUwjqWNFIO0uAn7ZJslW3qFeq49yB7uv0=;
        b=vTf2lkREQ9UigRCnkVGWPD6en05XyLVGqhOBpbnFn74SUcqWWN/014a1FHQAfkp3Mg
         o+IaA6uJxtfZjSdhqfdjQR0NmjkyXWqrkm7jqnt+UcN0GzBybX1mba6SFMAiDcvX0cbN
         I9yqqJt/Ntm2VRCLRG3wXtEwq8gASD69OETExUZjjQrHY7YfLlWiiArPwprRgR0kKchj
         pUGcRjG2HMOoGaqjx061GeL9ZaTmh1d4ZW1b6yQ+GMRabMdyn0wi6C1q2o8/5a+xt3gq
         DCTn9FTIwJ79xef61b53vVLD25ETn7/4qwCur4Gi6NjCiNpnaZnaIk87szVj6Ksj5S1k
         Rp8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14-v6si218644qvl.202.2018.06.12.00.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 00:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSdU5-0000vS-2P
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 03:12:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fSdFS-0004h7-P7
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 02:57:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fSdFP-0001df-MS
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 02:57:46 -0400
Received: from 10.mo173.mail-out.ovh.net ([46.105.74.148]:48536)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fSdFP-0001d2-Fw
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 02:57:43 -0400
Received: from player797.ha.ovh.net (unknown [10.109.120.2])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id CE6A9C53E4
	for <qemu-arm@nongnu.org>; Tue, 12 Jun 2018 08:57:41 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player797.ha.ovh.net (Postfix) with ESMTPSA id 7B4A02E0094;
	Tue, 12 Jun 2018 08:57:35 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 08:57:15 +0200
Message-Id: <20180612065716.10587-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180612065716.10587-1-clg@kaod.org>
References: <20180612065716.10587-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7990793114734594880
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrkeeigdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.74.148
Subject: [Qemu-arm] [PATCH 2/3] aspeed/smc: fix HW strapping
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HyLMqfRPSGWX

Only the flash type is strapped by HW. The 4BYTE mode is set by
firmware when the flash device is detected.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index fce126e6ee92..b15370893583 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -639,23 +639,17 @@ static void aspeed_smc_reset(DeviceState *d)
             aspeed_smc_segment_to_reg(&s->ctrl->segments[i]);
     }
=20
-    /* HW strapping for AST2500 FMC controllers  */
+    /* HW strapping flash type for FMC controllers  */
     if (s->ctrl->segments =3D=3D aspeed_segments_ast2500_fmc) {
         /* flash type is fixed to SPI for CE0 and CE1 */
         s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0=
);
         s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1=
);
-
-        /* 4BYTE mode is autodetected for CE0. Let's force it to 1 for
-         * now */
-        s->regs[s->r_ce_ctrl] |=3D (1 << (CTRL_EXTENDED0));
     }
=20
     /* HW strapping for AST2400 FMC controllers (SCU70). Let's use the
      * configuration of the palmetto-bmc machine */
     if (s->ctrl->segments =3D=3D aspeed_segments_fmc) {
         s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0=
);
-
-        s->regs[s->r_ce_ctrl] |=3D (1 << (CTRL_EXTENDED0));
     }
 }
=20
--=20
2.13.6

