Received: by 10.25.0.198 with SMTP id 189csp1048644lfa;
        Sun, 7 May 2017 11:20:06 -0700 (PDT)
X-Received: by 10.200.57.34 with SMTP id s31mr50227589qtb.281.1494181206053;
        Sun, 07 May 2017 11:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494181206; cv=none;
        d=google.com; s=arc-20160816;
        b=ih6KeQOSCYFH5T0SYie6gGL1JQn9v8rpiy3pb+oFZWfg7ZrTEFjeS/IJ/Ewai3LsHZ
         O7/pQ+ARWCHeP3ZrJV3Rqb2pWL3xMk3FoaW2xq9HyzpYe4cJTFo4nKrDP49/mxE0t6hv
         wMi4pJOCkdQEExwsYuruoCMAiYArAvBJz1dPOeeGQuAF1E9YLEfZ8snloIXJAm/2zqDX
         lDi135WFU+SBKMBuqw6uDyIen4Nvob6XeJotdyrKfDevMWfSuawEkSSb41eSvPnnd7Rq
         euIp/Ta9TBBzeLwn/jqBNa7yK0yKuNCpCYD1WyzUv8dvbO0TFXu0+dfMpOlHCiwZeK5N
         O6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=O+MFaXjv/BjIIJs2p5gWrWL5szcduYQq8453kJ7LUiM=;
        b=uw+sZ7MClWMWjXJX97y17A45K945vx5nl9RgL+kVzJsh2wcwO5ePCmiV+xbM6wlKcw
         0QBBseCHON7fXKm7sriIl8oNgYO3HHZ38S7W2URAn70Dy/dsU3iFoBRiBEvHGgfoAoY0
         a8hEk7RhhgoyJLTbHBGtKaIY5b/cO6wEFMyvZe082kFm7NSijCZXfj6rxKsu/NV8R8O0
         A8V+KR6Dz18UTKunyS3F6QQsnC03xDSR6v0czEW+1ZYusZLQ7btJK2L2KF1ZZjGxtk6O
         Jr2xMUBnYFSJYaI7Oste7pWUoUEwAE1VSSepyk7Z78HXg+Yir6Dynl7srXMzfPeaIBU9
         9Tdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i34si10552346qti.333.2017.05.07.11.20.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 May 2017 11:20:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7Qmr-0001ey-GD
	for alex.bennee@linaro.org; Sun, 07 May 2017 14:20:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7Qmj-0001ek-MV
	for qemu-arm@nongnu.org; Sun, 07 May 2017 14:19:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7Qmg-0008UI-IP
	for qemu-arm@nongnu.org; Sun, 07 May 2017 14:19:57 -0400
Received: from mail.kernel.org ([198.145.29.136]:41956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1d7Qmg-0008Ta-CR; Sun, 07 May 2017 14:19:54 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id D4204203AE;
	Sun,  7 May 2017 18:19:51 +0000 (UTC)
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BFB13203DA;
	Sun,  7 May 2017 18:19:49 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun,  7 May 2017 20:19:37 +0200
Message-Id: <20170507181940.25882-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH v2 0/3] hw/arm/exynos: QOM-ify the SoC
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RHj7OGKPk1l1

Hi,

Changes since v1:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1. s/RAM/DRAM/ in commit msg of first patch (as suggested by Philippe).
2. Add Philippe's reviewed-by.


Convert the Exynos4210 SoC driver into QOM model.

No external dependencies, rebased on v2.9.0-363-g0de9191deb14.

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  hw/arm/exynos: Move DRAM initialization next boards
  hw/arm/exynos: Declare local variables in some order
  hw/arm/exynos: QOM-ify the SoC

 hw/arm/exynos4210.c         | 40 +++++++++++++++-------------------
 hw/arm/exynos4_boards.c     | 53 +++++++++++++++++++++++++++++++++++++++=
------
 include/hw/arm/exynos4210.h | 11 +++++-----
 3 files changed, 69 insertions(+), 35 deletions(-)

--=20
2.9.3

