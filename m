Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2048727lfe;
        Sat, 21 Mar 2020 04:46:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsmZJR8+kJ/j3WGl7zH//WL+4UrTgHIBooTw5AMIPgjGtCXhtLkK5NB5x//EAmYGxdiYaxu
X-Received: by 2002:aed:32e7:: with SMTP id z94mr12858043qtd.382.1584791208079;
        Sat, 21 Mar 2020 04:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791208; cv=none;
        d=google.com; s=arc-20160816;
        b=W2G+0RQkF6kTxLSvtwvvrgBZT3d6ZYGqe6liFMUJbWM3Zj4mYASwZLd7QwcshV6PHR
         396ySg8PnqLBPbzFLhLL9esGJw4wAN0dXXnBu6e8yo6hRkSLZ6v8ft/oxjdrLQh3fwO1
         5PJbwCEyWM1rXxUAVep0A3j47ScNsc4rvloDMig3XSjsSkLc6KdqkM2lxjPWLLnAmUGh
         zxmPNrS835JjMYuoGZYYoEfPQeS/ZJImNS4M7KzDFZYTKEXfJl+0a1SVQ0ULox5UpQS5
         eJvoeFKVWeV+kRjjLL4Ka4ZsneOjvxTBDUw1zJL+FcCZAnuYKyaXY6j5Iny7300WAEGq
         l4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=H/kvBiPyxCh595bpD+FYmGkaOOWay12gFZX+EGKqT6I=;
        b=PwKz+di6xZEit1lm4chbgGeHl1YtoQDn+y3zuZQOZxGcM9WaDLaW0+9Z5GnruBgIjZ
         Jd1VHnYw3XtCAdaQ75ztHxOExQM1f4lf9vZNnYrqBSarRNaefamZ/KgsJS/1In2Hm5iJ
         P5oZONzn+9fou1PXrEJQg2QjAJx4Nzkax+sykGhyTLMjt0as47NXskyzakggLnktnA2w
         c/oCTHJ+kJXlupqCxeLpiwaXumewSXff+KQSBYJJWS7GJ7DKhxRNOJ1ilmS6J5/c1gyS
         8D/gjUkqlAtD6auawgm7YIBNQKTetMsqKtOrxjgzt2tvibbkxZK7tZVnZW2bvUk0LgTN
         IElQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bxhXWukO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si4966379qtw.272.2020.03.21.04.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:46:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bxhXWukO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFcaV-0000Y5-E0
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcaE-0000Ec-UR
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:46:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcaE-0006Ha-23
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:46:30 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:39248)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcaD-0006HJ-Vc
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H/kvBiPyxCh595bpD+FYmGkaOOWay12gFZX+EGKqT6I=;
 b=bxhXWukO8nf6gtmes3giwOgmyGGkZEXOHeAV4+pAacpCMuDWJuwL3yY35K8BKuFrBX2cYG
 c2laRfnik/DZtr5Fo+B3UCxLj39x5WNS5JXe12w+Wz8yycb4ANrMsChbqD8m5gDO+glQ6Z
 USPfyrN7+r1eAgUauqLmXV2XJqpKpHM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-ikgjcyfsM-uwvuc01NDk4w-1; Sat, 21 Mar 2020 07:46:26 -0400
X-MC-Unique: ikgjcyfsM-uwvuc01NDk4w-1
Received: by mail-wr1-f71.google.com with SMTP id j12so333416wrr.18
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 04:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9dXP4N8TyULZAzjZYqxK/uANHHgjWwDCR4io6WeB96U=;
 b=DAxq6NeUW7LUBGbov8NE3WewurQSnt/T/j8YI7o/JhqL3NB12JpBvqLl74lyUFyiua
 EtqX4LkxQnmZo0WPGmzG+atvoG+aWkIsWWpzkH7632IyyndspvVlxjr0w3STUJC9Vjpk
 t8H/OPI6kbrd0idDKeLR/g8vACZsXZZa4YkM6gMR8roctxeyybBDDm2XotQ9DJAKh4v1
 ZmWy5/I+LqfM625axL5VJqBZE4mL7Wn/CrZhm+vQ57CvIj7oTT38uWWIQuBtVUixEojI
 L3so/Lu1dSTN1m47KFPxtZOhEfh+TrSv3uKHOyk94nmKQUjSlrswiePIsJTuuyPci6Bv
 2p9g==
X-Gm-Message-State: ANhLgQ27k3YrEAyOFHJr9qBw85J7PI4GBO52iZ0zj+NoLoqyldISxWkU
 kU6zkrOpwyPfEHzFlsg4sgn7m/bRVx7MGVJrIp5jmM5A7zL7KG6sbWSgAO+CgmVFasukka/AzM1
 +Ro++TsOHZ1ND
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr16445012wmk.160.1584791185140; 
 Sat, 21 Mar 2020 04:46:25 -0700 (PDT)
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr16444963wmk.160.1584791184820; 
 Sat, 21 Mar 2020 04:46:24 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id d21sm12882125wrb.51.2020.03.21.04.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:46:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 00/11] misc: Trivial static code analyzer fixes
Date: Sat, 21 Mar 2020 12:46:04 +0100
Message-Id: <20200321114615.5360-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ykjv669axjBQ

Fix trivial warnings reported by the Clang static code analyzer.

Philippe Mathieu-Daud=C3=A9 (11):
  block: Remove dead assignment
  blockdev: Remove dead assignment
  hw/i2c/pm_smbus: Remove dead assignment
  hw/input/adb-kbd: Remove dead assignment
  hw/ide/sii3112: Remove dead assignment
  hw/isa/i82378: Remove dead assignment
  hw/gpio/aspeed_gpio: Remove dead assignment
  hw/timer/exynos4210_mct: Remove dead assignments
  hw/timer/stm32f2xx_timer: Remove dead assignment
  hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning
  hw/scsi/esp-pci: Remove dead assignment

 block.c                    | 2 +-
 blockdev.c                 | 2 +-
 hw/gpio/aspeed_gpio.c      | 4 ++--
 hw/i2c/pm_smbus.c          | 1 -
 hw/ide/sii3112.c           | 2 +-
 hw/input/adb-kbd.c         | 1 -
 hw/isa/i82378.c            | 8 ++++----
 hw/scsi/esp-pci.c          | 1 -
 hw/timer/exynos4210_mct.c  | 3 ---
 hw/timer/pxa2xx_timer.c    | 1 +
 hw/timer/stm32f2xx_timer.c | 1 -
 11 files changed, 10 insertions(+), 16 deletions(-)

--=20
2.21.1

