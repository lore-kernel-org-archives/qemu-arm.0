Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3201129lfi;
        Thu, 5 Mar 2020 09:57:09 -0800 (PST)
X-Google-Smtp-Source: ADFU+vue3vXNU/syiejb0hkjuqdXfHzt9gAzvRDAQbj6xnOamMrDBLJDaH4UHHnCHBPI0YXrqtYn
X-Received: by 2002:ac8:72d7:: with SMTP id o23mr8480546qtp.240.1583431029305;
        Thu, 05 Mar 2020 09:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583431029; cv=none;
        d=google.com; s=arc-20160816;
        b=iy/+D0WASGIFv6yqo/lyUN8NjHTVcu5DrUCz9umls2sYdoZ8/1ERiZhfwqgb+/MJHZ
         EY7lbA7/+3GtYdYOMThHXqrRFbs0eUk7xxlaF9nGdEfg8Es1jGoTpd0L1zGo48i9u8R2
         fvx9KB0P2/Ky36RvR73I8i5/By9y3LmY1vCIfIxJx2DCNMQ9+J285yB3i0cK7WfkXyRK
         yZM48DlawNRCSC8tQpbRJGTWf1LT/I/Sb19rdZeqbLCeuHDQtpmrZOamACHbNCjAvpo9
         Kb7ovM6yehe/1WJGu3QEhH7egHmwfBta2Thuuw6tv2hYsRfkbr7xSAqdHaC8syAhVrHI
         REfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LVNdqsgidxTOl/zf7lJCTVEB/6AAxpggw+CjoQVwh+A=;
        b=eCJOiouxiUkq1vWG5ogHZuUCOFjX/Po7T7oDnXriAZVdkM4ajZaTPbNYz6IUTYNyuL
         a/PUhRYpzFmlmnFLFVPUlJ4qf1PEjd/2euiM84IUA+6sK+sNkmwnvu1Nph+j68MlIn+i
         3RCvTaHW0v8uuScUpWIM5W+ti/lnb4wG7dCQHQlfe/rkEWVntBMcma2kpD5ryTtdoSmp
         3JqLhSLga6YL1fA0L/nb7aEl8+vPjJZLsW4poKGtZ6dRg54thb6sThkQwTJJ+MAKqPHB
         PtXvXEqDyAwgV11ZqlI/3RnKaVMwfnpYEzsVoENFYu/7waUGpiokQw2RiixRXwBJli26
         cVxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AlX+yJ5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si3148925qkh.5.2020.03.05.09.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 09:57:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AlX+yJ5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9uk8-00076U-OV
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 12:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46989)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9uk0-00075k-9r
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ujy-0002dN-N2
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:56:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50237
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ujy-0002cn-J5
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583431017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LVNdqsgidxTOl/zf7lJCTVEB/6AAxpggw+CjoQVwh+A=;
 b=AlX+yJ5wJPi4rQ62i1w9mSCgz/0F6Lt3P5tM+aA9iRmLty7Luagt9BY02tMwTZEgqQJB95
 HVFvEEsLgYz04iDneoF4qggc8ufXofNlXKuVYQOrCMCSP1xWJAAp+Vw03JZbTFhb4wXwwe
 6wVxAlp/5HHgWCeGVROhHARf/gVOkJ8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-zMQpYK7xNOqOUzxk8FTZfw-1; Thu, 05 Mar 2020 12:56:54 -0500
X-MC-Unique: zMQpYK7xNOqOUzxk8FTZfw-1
Received: by mail-wr1-f71.google.com with SMTP id n12so2586087wrp.19
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 09:56:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rXrFsYCbNITMAKKDyeFnLcrzD4LbTWQbaw3IfuF40i0=;
 b=ol7oKIpvQ5qERwZOnZNMFCrADKqk1vWtjTaM1KxC0DWSJij10tJNPvrQ23GBwg6phY
 3/15Fcf1JXEgpGbUJDNKB/uYnUnEHfXYAvw34R4uQFEQ1aRNINRglol83UbtbGC0sG3v
 IcEH8f7v8Vh7sef4v4PaYr2+jB7oF7t1bgEyiMO5b29x0lSNWkdOUxI/Tw5NhsMX0N90
 aSD7WFRKp0mLsoIZdonRnpZ8aqktDwZaH2euas10hEedkXw9y5Py43eRK86yY+fwnxFS
 t6X9sRlAmb6cqIyACadmmRLP1mvvQZ/aOij8693tPt/cxgeNffWOJ3+8lNNmO4KcGOiC
 0fBw==
X-Gm-Message-State: ANhLgQ1YneZu6/HpCHvopbUZem0eUPBOSkhti8THUugBr39swZfKnMRT
 2bIslAzD7NpNa9k8l45qjljmMoioJ+TBVES5AFlD8h3gJPfhzVpqKSJw/4iYA8DIS47NJtHtxia
 PbAiEA/E0ymtE
X-Received: by 2002:a5d:4389:: with SMTP id i9mr144696wrq.90.1583431013358;
 Thu, 05 Mar 2020 09:56:53 -0800 (PST)
X-Received: by 2002:a5d:4389:: with SMTP id i9mr144664wrq.90.1583431013103;
 Thu, 05 Mar 2020 09:56:53 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id q1sm3608381wrx.19.2020.03.05.09.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 09:56:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/net: Make Net/CanBus can_receive() handlers return a
 boolean
Date: Thu,  5 Mar 2020 18:56:44 +0100
Message-Id: <20200305175651.4563-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: qemu-ppc@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Joel Stanley <joel@jms.id.au>, Beniamino Galvani <b.galvani@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ztotyt0jjaI0

The Net/CanBus can_receive() handlers return whether
the network device can or can not receive new data.
Make it obvious by returning a boolean type

Philippe Mathieu-Daud=C3=A9 (6):
  hw/net/e1000e_core: Let e1000e_can_receive() return a boolean
  hw/net/smc91c111: Let smc91c111_can_receive() return a boolean
  hw/net/rtl8139: Simplify if/else statement
  hw/net/rtl8139: Update coding style to make checkpatch.pl happy
  hw/net: Make NetCanReceive() return a boolean
  hw/net/can: Make CanBusClientInfo::can_receive() return a boolean

 hw/net/can/can_sja1000.h |  2 +-
 hw/net/e1000e_core.h     |  2 +-
 hw/net/i82596.h          |  2 +-
 include/net/can_emu.h    |  2 +-
 include/net/net.h        |  2 +-
 hw/net/allwinner_emac.c  |  2 +-
 hw/net/cadence_gem.c     |  8 ++++----
 hw/net/can/can_sja1000.c |  8 ++++----
 hw/net/dp8393x.c         |  8 +++-----
 hw/net/e1000.c           |  2 +-
 hw/net/e1000e.c          |  2 +-
 hw/net/e1000e_core.c     |  2 +-
 hw/net/ftgmac100.c       |  6 +++---
 hw/net/i82596.c          | 10 +++++-----
 hw/net/imx_fec.c         |  2 +-
 hw/net/opencores_eth.c   |  5 ++---
 hw/net/rtl8139.c         | 22 ++++++++++++----------
 hw/net/smc91c111.c       | 10 +++++-----
 hw/net/spapr_llan.c      |  4 ++--
 hw/net/sungem.c          |  6 +++---
 hw/net/sunhme.c          |  4 ++--
 hw/net/virtio-net.c      | 10 +++++-----
 hw/net/xilinx_ethlite.c  |  2 +-
 net/can/can_socketcan.c  |  4 ++--
 net/filter-buffer.c      |  2 +-
 net/hub.c                |  6 +++---
 26 files changed, 67 insertions(+), 68 deletions(-)

--=20
2.21.1

