Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4227842wro;
        Mon, 29 Oct 2018 06:37:53 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cPIpcKyt2dXilpAdsmVrex0WaP/+tkUI/YYF8u9lIZC9uQMDXuQYVs8U48FF525CEZWdiU
X-Received: by 2002:a0c:b509:: with SMTP id d9-v6mr13399600qve.184.1540820273556;
        Mon, 29 Oct 2018 06:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540820273; cv=none;
        d=google.com; s=arc-20160816;
        b=iBjVKaQDorOaSo/g9Kts/cCFUJwNCdeZgrJA9oiHZhgmiYpaqF2shd3hhstMXaHB6h
         +EMjjuXxDU3gP6b+lYTopyffZNxAkbVnTaXSBqxlAsoYcVaw/QlKBFn5htdOKYcC0Yjq
         ZEj0UnBJp/wkCCBFcqIRC0i5zcHPM6zQ47i8btnFQQC4IyHzyzjihF61bonQfVmkdgMM
         rYhewaDwKnvfPZVi3VtBBvwvd1bEmrV6jOBhgOAo6/m4I9DnMpswWkYqJWyIova9DSiL
         YMxjRedl+zzfBJ5TKvk/iLRnXEbbR32oX2N66ixw5Bkrm5Vmmg6VVtxjRmys9vEJi0sj
         13QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=gblEr8Zhahzf+syY+yqoTilu0ZNBRDUNDSPO6fqjWyk=;
        b=T4iQl991uNFRQk3ZmfxKwyfJJEwkQiZcoT/wBAcgWL1OIwd/5rJlNB2gxv21GX8QPd
         VzPKQ36iZC8thxZU+DC3cEEH4UtR7qJyifJgCdKm3Ea3EoNXljjZcotaI9B753pnQHcb
         sdwmApLXcxUovXK16VdFUDeaZS+3+wlJIsm1N5djtXEPEZvO3NN7pdUIqhot+PmwW1tn
         osBbPF5B41DyBjKSwNH7OUSP6WAQBcmU9TEXDA6D1owEQCLjjK5J9JpyqZ6AQcRoWIyu
         O8rK8u4gqE0ic//VXMbaJrM4Nma2vt2j1Ur5ruxsp83vKLj3Y3CylXCqmddEmXB2X8s7
         GE5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s7si14982036qvm.72.2018.10.29.06.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 06:37:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45629 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gH7jt-00014n-1T
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 09:37:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH7jg-00012m-9S
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH7je-0004YM-FT
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:37:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59634)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gH7jY-0004UL-4s; Mon, 29 Oct 2018 09:37:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E5A9307CDC9;
	Mon, 29 Oct 2018 13:37:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7271C60C67;
	Mon, 29 Oct 2018 13:37:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9C8EBB3DC7; Mon, 29 Oct 2018 14:37:22 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Oct 2018 14:37:18 +0100
Message-Id: <20181029133722.12415-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 29 Oct 2018 13:37:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 0/4] Audio 20181029 patches
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
	Jan Kiszka <jan.kiszka@web.de>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yBDKAaFzyaaG

The following changes since commit 285278ca785f5fa9a570927e1c0958a2ca2b21=
50:

  Merge remote-tracking branch 'remotes/famz/tags/testing-pull-request' i=
nto staging (2018-10-27 19:55:08 +0100)

are available in the git repository at:

  git://git.kraxel.org/qemu tags/audio-20181029-pull-request

for you to fetch changes up to d436d4e7a50a7c4fddc0569c2107fe5eaf0e1fbc:

  audio: use TYPE_MV88W8618_AUDIO instead of hardcoded string (2018-10-29=
 13:50:15 +0100)

----------------------------------------------------------------
audio: qom cleanups.

----------------------------------------------------------------

Li Qiang (1):
  hw: AC97: make it more QOMconventional

Mao Zhongyi (3):
  audio: use TYPE_WM8750 instead of a hardcoded string
  audio: use object link instead of qdev property to pass wm8750
    reference
  audio: use TYPE_MV88W8618_AUDIO instead of hardcoded string

 include/hw/audio/wm8750.h  |  1 +
 hw/arm/musicpal.c          |  5 +++--
 hw/audio/ac97.c            | 12 ++++++++----
 hw/audio/marvell_88w8618.c | 14 ++++++--------
 4 files changed, 18 insertions(+), 14 deletions(-)

--=20
2.9.3

