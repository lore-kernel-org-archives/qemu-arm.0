Received: by 10.28.4.212 with SMTP id 203csp3697103wme;
        Mon, 23 Apr 2018 03:15:03 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqvBX/Cu4Az8XP/CviU3UVpM6kJFYSgW8eBfVL8E3JGgvXx38JU5NxAol5B/sFVTOkem5cw
X-Received: by 10.55.127.70 with SMTP id a67mr21754846qkd.328.1524478503271;
        Mon, 23 Apr 2018 03:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524478503; cv=none;
        d=google.com; s=arc-20160816;
        b=LY1mxObkaz4hqhfh2qwcaBn2VlhfoHwmltaZtaTnfg8OzKqRhgvNbxCYCRFNr8P12R
         ROQ+3wfmSXNuiexAX38NxZpNYtXeyPfMoEASG16zfP3VRRtJmoKH7oIH1Jqii8bsnPF+
         0n+ojfpfymd9oa41tTcg4McsxCW23W9nU/yDcajgIkkKiXcTHJeW7fvkTrzIYKFxJ/rf
         QEbJi78pnZi/pxF2dtVtORc8S9PCV4LqNypVTY1ZpO1GNUFhYFLA+KlEDTXEWP8JqBqg
         fctE1+5t/4n9nZvogjMX/KM0PWSf8VgHNO3rGxP0qU4ThKisY9WWnKo/zv4AHa/b6mSO
         3Rgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=LkfBOVyPBpc7jGiHEzN9hOgTBrXWcjfQuPa+oumhfmM=;
        b=HUx7Zf+K1mhzK5l62S//MT3iubZQEMgHFXoziNqyFKpJKBWShGhQV3/T9iO5ljTHtE
         ZhlTEOEblLtRQA+cewzVpQaprxwRCzU8dfeYhHjJia1ScPl1Z8aTy1weaZl4Rct0omJd
         Q8eOM0ObzI4LlY5Wg6R1bGHhFGRESsXfI76u9fJnA+lOIRnyBj0X3VTikREDCB5X+sYC
         AojGfHt9Olg76CVw+kwf31/O5OdCixzFhW+qcVGlV9nSVmVqGBZet48KOnf4XpfUfm/7
         KCE8TJ1PTjbEalvfMuIpFJEGUDTBQBtFAeaj55q46j3froY0oJX56gMEpL0ftMZ3j0Xt
         LdMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9si4498458qkm.247.2018.04.23.03.15.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 03:15:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAYUw-0000t1-Qs
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 06:15:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAYUo-0000sE-BB
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:14:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAYUl-0000YC-4e
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:14:54 -0400
Received: from 7.mo5.mail-out.ovh.net ([178.32.124.100]:41798)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fAYUk-0000Vo-TC
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:14:51 -0400
Received: from player774.ha.ovh.net (unknown [10.109.105.64])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 1F0FC1A4B61
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 12:14:49 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player774.ha.ovh.net (Postfix) with ESMTPSA id F262F400A2;
	Mon, 23 Apr 2018 12:14:42 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 23 Apr 2018 12:14:33 +0200
Message-Id: <20180423101433.17759-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 12833007138977319856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrkeeggddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.124.100
Subject: [Qemu-arm] [PATCH v2] timer/aspeed: fix vmstate version id
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vfgasNTsXZEc

commit 1d3e65aa7ac5 ("hw/timer: Add value matching support to
aspeed_timer") increased the vmstate version of aspeed.timer because
the state had changed, but it also bumped the version of the
VMSTATE_STRUCT_ARRAY under the aspeed.timerctrl which did not need to.

Change back this version to fix migration.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 To test on a 'palmetto-bmc' board, download the latest built OpenBMC
 flash image :

   wget https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3D=
palmetto/lastSuccessfulBuild/artifact/deploy/images/palmetto/flash-palmet=
to

 start two instances of QEMU with :

   qemu-system-arm -m 512 -M palmetto-bmc -drive file=3D./flash-palmetto,=
format=3Draw,if=3Dmtd -serial mon:stdio -nographic -nodefaults

 and :
=20
   qemu-system-arm -m 512 -M palmetto-bmc -drive file=3D./flash-palmetto,=
format=3Draw,if=3Dmtd -serial mon:stdio -nographic -nodefaults -incoming =
tcp::1234

 then, run migrate from the monitor:
=20
   (qemu) migrate tcp:localhost:1234


 Changes since v1:

 - change version of VMSTATE_STRUCT_ARRAY and not vmstate_aspeed_timer_st=
ate

 hw/timer/aspeed_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 50acbf530a3a..1e31e22b6f1f 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -504,7 +504,7 @@ static const VMStateDescription vmstate_aspeed_timer_=
state =3D {
         VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
         VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
         VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
-                             ASPEED_TIMER_NR_TIMERS, 2, vmstate_aspeed_t=
imer,
+                             ASPEED_TIMER_NR_TIMERS, 1, vmstate_aspeed_t=
imer,
                              AspeedTimer),
         VMSTATE_END_OF_LIST()
     }
--=20
2.13.6

