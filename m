Received: by 10.28.4.212 with SMTP id 203csp3539958wme;
        Sun, 22 Apr 2018 23:41:08 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49C/RCwIVza+TOzyHhrnw3LzG1w3ePGIi9X3KLRCLo2CdyYJFSuSQcOjWf5EaemtIZH5XrN
X-Received: by 10.55.77.207 with SMTP id a198mr22144814qkb.241.1524465668173;
        Sun, 22 Apr 2018 23:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524465668; cv=none;
        d=google.com; s=arc-20160816;
        b=BlTLLNeWOLOaNATNrWhbYYHeiDsAsi+dEh2Y2pLB8oQAYj29iDAWLHlZ3O8OYGBuE3
         lF8Z4q/MVHFo+CYPf97icw6O390cSWrWDORQy+39kE9lqnekJB9obrcROTvtNyBOV0Su
         s/Fv2jBbXX20Z8Vn/EB+pBxMKdXcXxex+E4PMrYMYluF6FoZ1MHyTj14E08CFIVHmVP2
         Nixoq7MPlEw2CtjpIpCvSo79RUXV7uu/jzuO92+JsvzfrfMkW9jlqVrzNCALdb6lGf/g
         h24xNTspmXoAMNTy/W2WaME5wTeIpybFmhgyxi3oCj3dX+mkB0axAnZdqxcHEPD1m2IK
         Lu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=1FOwbCiw/sdaZ5Aiqnjr3j684D/rKtu4bxodfI1WMOw=;
        b=GW9lmkXZtIvFSCxUAEjig2rRikIWlE+0v5XfYGDuqi8oW8cruh5u4T4QblrcovAyFL
         rJsa6lknr3OG0NP44QRGuZcV/hHi8BND1JYpibeqwF3LcbkkOVZXojajn7afzL8K8Q/z
         4MSy1hMSxlVrFPr1izeEoo93b8CbhYBhioyPbn5xKyWEs1T2EN/guNnIGYIwCMLBpHcr
         cHqdh/z0SPWRfj+hT5aeDYt2MfGbFh+0M7HIoS3VpB9uyr1o3Y37U0o2hRrkwCZuUiVt
         B86JhH+Kqryw6vSnXR04+BkADtfK3M3d1Z/DEM4PanxjVkppdbedyIk+aR2YxFpSerMH
         GY/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d56-v6si361138qtf.395.2018.04.22.23.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Apr 2018 23:41:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAV9v-0007uT-LE
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 02:41:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAV9g-0007st-QK
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 02:40:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAV9c-0005jQ-EI
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 02:40:52 -0400
Received: from 9.mo5.mail-out.ovh.net ([178.32.96.204]:45541)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fAV9c-0005du-7d
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 02:40:48 -0400
Received: from player737.ha.ovh.net (unknown [10.109.105.64])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id EE7A41A0BC3
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 08:40:36 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player737.ha.ovh.net (Postfix) with ESMTPSA id CBE30E00C3;
	Mon, 23 Apr 2018 08:40:30 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 23 Apr 2018 08:40:20 +0200
Message-Id: <20180423064020.25434-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 9215490739963792304
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrkeefgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfeehmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.96.204
Subject: [Qemu-arm] [PATCH] timer/aspeed: fix vmstate version id
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
X-TUID: F857i6RLQ2pm

commit 1d3e65aa7ac5 ("hw/timer: Add value matching support to
aspeed_timer") increased the vmstate version of the timers array but
doing so, it broke migration. To fix, we also need to change the
vmstate version of the aspeed timer controller model.

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

 hw/timer/aspeed_timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 50acbf530a3a..7df19bd9df91 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -498,8 +498,8 @@ static const VMStateDescription vmstate_aspeed_timer =
=3D {
=20
 static const VMStateDescription vmstate_aspeed_timer_state =3D {
     .name =3D "aspeed.timerctrl",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
         VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
--=20
2.13.6

