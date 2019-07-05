Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3269568wru;
        Fri, 5 Jul 2019 08:09:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZ+8ZrWrgKe5zf8N3rfpXh4WgcpKYh9f2qx4AJq8XgoxDpusKZb4A5U9VIg/bK+mMO8keA
X-Received: by 2002:a50:976d:: with SMTP id d42mr5092331edb.77.1562339359735;
        Fri, 05 Jul 2019 08:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562339359; cv=none;
        d=google.com; s=arc-20160816;
        b=TwAr0L6AOE6dsW8wnU9p2ElI/VcneQV1pDRP4tP/y+6fwOmlS7B2s+e0qrGLoS/7PY
         8s/q9C/y2GUF9HK97nOG3RbwzMChS/gmzREpdDQDBbBI51FzqXRFpXw2xSolF0/05448
         l4fMGl0ENYwRx3/z8CyJhAOxpvD5RUaWp6vIH6LqHK6SNvYfhD3vJxnuINEeeLq4hBdK
         SJ+kx3UyoFLTTvO2v/kKFGSO34Q00DvdIq40FBX+86G6IvCap/zj4A+xGkhd+cvyxik2
         t2qKAouOwgv/BfaxQkbIoRSvU4kJQXl38jAoWBZ1aPwh4g7Hbz8s+dUsabK0g4v7c+KL
         QHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=rnYIfY/pudrmDbJ2ZGOy7ARaHA6MfWXB7BGmiTFEAEs=;
        b=ZH9UizLCPIA6qEjewJYtaHpbxBYkS/sS9CXciB54fTzn4Sh9qcxjy6n7lRohp2ECj9
         5BS42Z6kQFxFXc3Q9WvluEiiX1NUQgsyDHXU0RkWw7zMjIOzEQlpfmfpF2GK5ev8Z0mC
         oSuFeWXipEAo5gPe9h8qYOR2fjjc7FiRDdx5Yfe9A+b0z58HDzVJVA4Loba0e5P6aSG5
         ClwkQb9n1X0fs82ZIDX0RXaz6hSmkeTO0O+CKr/wUOq7a3pkorNvgt2rMcOV3/tJ8MrJ
         2pT7JXkiYoSK+7otKHCPRIaZpEILGw7QJ7ZpWlMHCSNfMylTWrdLJslg/TSd9MfCtK/8
         ELsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 30si7140654edu.170.2019.07.05.08.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 08:09:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjPpt-0001cq-HT
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 11:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57711)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjPpf-0001ZU-EJ
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 11:09:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjPpc-0008Ep-BG
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 11:09:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42522)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hjPpc-00086I-5U; Fri, 05 Jul 2019 11:09:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 851CE30C1CC1;
 Fri,  5 Jul 2019 15:08:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-45.brq.redhat.com [10.40.204.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0BF18000;
 Fri,  5 Jul 2019 15:08:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 17:08:48 +0200
Message-Id: <20190705150850.4967-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 05 Jul 2019 15:08:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 0/2] hw/ssi/xilinx_spips: Avoid NULL pointer
 deference
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xghagIImb1H7

v1: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01238.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01586.html
v3: Return MEMTX_ERROR instead of MEMTX_DECODE_ERROR

Philippe Mathieu-Daud=C3=A9 (2):
  hw/ssi/xilinx_spips: Convert lqspi_read() to read_with_attrs
  hw/ssi/xilinx_spips: Avoid AXI writes to the LQSPI linear memory

 hw/ssi/xilinx_spips.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

--=20
2.20.1

