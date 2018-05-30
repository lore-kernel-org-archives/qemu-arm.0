Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4382824wre;
        Tue, 29 May 2018 23:17:43 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL4kL5m8vbyfbV+c/h7M95hypVTSRjjbS5RuKVTQD4uMod01Xf/frUozR8r2vBCZ4F88ees
X-Received: by 2002:a37:10a4:: with SMTP id 36-v6mr1187364qkq.349.1527661063312;
        Tue, 29 May 2018 23:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527661063; cv=none;
        d=google.com; s=arc-20160816;
        b=pUYVgtP19PvCnKDnmFeCf/C/rhEI8IhTpavN6+1rYsa8ZxI4OnqAQU772gsARCFcJD
         bLYcxBo3v7TkJGxF41lDZLA6mSkImJ7A7qiIyKUAqi60HQhJk9p+j9fs8VK9dD//jVdV
         DklDSqJfob6T9/w6s2+HHmx0JtYZEJ3FMkHLTveXsLEP8tYgooinOaigMNG0zZu1y19O
         wXu94SQm3OjEm5/M5Q5VNncsbAoGBkLUPrUtxeaN6sfXM3Ycc9OaymzNGrl3cegEOLBQ
         K/R7ft4a8P/ccaAdWWVfMgGvnuo7QvZsEMipEk8TYarGoMM3Pmrnp25ZQtPOnP2OFUC6
         NS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=rryevtmpCo5rtBU81jmDg+hmak+EBvct30ixxBLAZks=;
        b=l9oQ5nqaBcc5UFD2v632qmqPacVQqSzKgyDsEsWb4KbnxHjT8RjaSve4d5IvyERyHq
         +KU/xW2+gIXhh+BK5glmT3vG5a5hh7SFjtbFZNseBPGFfvSZY4S78DUJm4kcAlk4zNtU
         yPRpfcHEADC5PB5egd21AJQfl1BguIIrwAaHiXLrf0v1kzqrW3krncs7jBeY720Y3itW
         05nDP06IhVGll2X84rZw+EvjURHYDxedL3A3QNmGRNX/4T2y7jw6t1/q/jMBabW8islZ
         59fx8iitWmmQ9Y0HIt+FW4kWENiJ8VfZkFxfeKdtL93sUYdinel3Kpk08U1qUdOhT2fV
         AfVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e48-v6si1124331qtc.97.2018.05.29.23.17.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:17:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNuQY-00021O-NB
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:17:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuQI-0001zn-7G
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:17:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuQF-00019b-21
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:17:26 -0400
Received: from 2.mo179.mail-out.ovh.net ([178.33.250.45]:40416)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNuQE-00017J-St
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:17:23 -0400
Received: from player718.ha.ovh.net (unknown [10.109.105.119])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 5E7E8C9076
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 08:17:21 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id 521414E00A5;
	Wed, 30 May 2018 08:17:15 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 May 2018 08:17:07 +0200
Message-Id: <20180530061711.23673-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4751579081886764031
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.250.45
Subject: [Qemu-arm] [PATCH v2 0/4] net: ftgmac100 enhancements
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oHfgxrAMU6mC

Hello,

Here is a couple of enhancements and fixes for the ftgmac100 NIC used
on the Aspeed SoC. It includes VLAN and multicast support.

Thanks,

C=C3=A9dric.

C=C3=A9dric Le Goater (4):
  ftgmac100: compute maximum frame size depending on the protocol
  ftgmac100: add IEEE 802.1Q VLAN support
  ftgmac100: fix multicast hash routine
  ftgmac100: remove check on runt messages

 include/hw/net/ftgmac100.h |  7 ++++-
 hw/net/ftgmac100.c         | 64 +++++++++++++++++++++++++++++++---------=
------
 2 files changed, 50 insertions(+), 21 deletions(-)

--=20
2.13.6

