Received: by 10.223.159.74 with SMTP id f10csp5529825wrg;
        Wed, 13 Dec 2017 12:45:12 -0800 (PST)
X-Google-Smtp-Source: ACJfBosbNfP+uyoJbe6hJdli6pL+8B3uEdKGuEMULamzk8Srcx4Xs0kaoBXVtj1bEiLlPIh+57YQ
X-Received: by 10.37.91.215 with SMTP id p206mr2725817ybb.496.1513197912657;
        Wed, 13 Dec 2017 12:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513197912; cv=none;
        d=google.com; s=arc-20160816;
        b=yPuS3VuGBF6gJaGPmHTlLo8gSkQqhT7Uwt76zk61nXNhfYSMphaUnYORA52NkmZHay
         y48l+4fDf9EN5wXg92Ugm+5VMOBjVz+NzRr0p5jK8zM/uHdiOhUOpJscT2im9b1IdQhJ
         CNzmzDBIujGGpK3qxyM3+yZqZXuJp+DvOj1GwE/9j8eqhTz0LaxWsrVAeT0PPxJ2+xOf
         PXxV+7bzlKwHELx/ZItBnjg7qEu7SHon1L0wr/fLSS7JjZ+WcPTwqWkt7+LRv78G+0bS
         KBePmG5HWE5m3YS1fHjffIvkpDHPlevc9R7RQ2G2HylFWUYfBx+EquKXV7psd9FsdXpz
         MX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=uusbOje1ugUaVSnpWxmI218lFASBQsWnKg+P5h/6C8E=;
        b=V2jNb3HpOQ5BcMCStDns2JUM/9/YjXIJ8EWLrmkSoBCT0PpvPKkQkwayGWNSRhzOw5
         mmL259n98Gd70IqaNTm8nwqyxKr6jLBwIVdPFxKD632XTidw4I1a3DvHV41bCpygJcQP
         7wOCp/Yl4h/SyEmX5URveXlyP1tbZabwh6JtwoypOhXaUEPlmv/rsj2RGLP13cKCOGcx
         a/WHy81WDno4bdR42DNLpsx6Zle6Xer0f2JG8tBv8B2q2kUBHRl8gWo5s015q0TpUGpe
         hXwX6XDXhDJCnIXwfmeYLLCP00+JiyDJZoZuR88+TGZ4F7WY2S8h/8Foa9WOa7YcBBB4
         4i4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iLcGx1Lp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r190si502651ywf.647.2017.12.13.12.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 12:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iLcGx1Lp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePDtw-00041J-3l
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 15:45:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDtd-0003zb-Hy
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 15:44:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDtc-0006Ey-Hl
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 15:44:53 -0500
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:40731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDtY-0006B3-22; Wed, 13 Dec 2017 15:44:48 -0500
Received: by mail-qt0-x22f.google.com with SMTP id u42so5380934qte.7;
	Wed, 13 Dec 2017 12:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uusbOje1ugUaVSnpWxmI218lFASBQsWnKg+P5h/6C8E=;
	b=iLcGx1LpN5CpVhRLOzmrIR8WoYhFJ54UUshBhtHYw2QpBRkhC31hGetprnH3WMK3Xj
	ECto5E3WFmmvgRoFKDc3R3vMJPo4daeYBiUhPMAGZJipw2pMkFJWNpcx0zJPnL6gtX3O
	aDiYo2hgi1va3nehXldC0tTv5f4NPHAnamNYyU8dPqHnSC50uJUnnwC3wRc96mKhQf5Z
	cN61ZLTJQmVflehlbKbPJtI8s5MsQs9sKmj0vaujbC4+Wwi9oBI4Jpw/ENLONFeyzWJN
	8yntzaLHM8++h7a//Z6K+1qDB7qWwnmw+LQCVHCXCqDrkfjM2uVTQ5IKDh4xcYI8xA2x
	wejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=uusbOje1ugUaVSnpWxmI218lFASBQsWnKg+P5h/6C8E=;
	b=H7PHAVO1QbQBVLPeKNY3tVJl1fcVNKhaPy8vV/+L3O3asGG5WxRsB2EJZR2l7E/PvI
	aEGGyg6UJ18x3Cv6Gna8MkgJqhlWcnGR/jDqHsdO1j+rV5tsZjE63fzY0MQuwwE0ufOK
	eDWm8hwT6jGOi/0erNPRINN4UdtlGW4/lvHibqwgL/4N51KvHn7djJ88NWcN35mfr1+J
	JWC/jBJ+mr+nFdQpEgb9QmmeXtjelbef1jt1aHwoUMhLUcJRg8j0H3hSw9e60mJR1IJh
	vibP684+40yTFTezIxohRqKAOEXotFBUaVauhwpCOOdhBDsgujxEjj4izE1FqWD5tT3Z
	wtyg==
X-Gm-Message-State: AKGB3mJSv5tqizY2MuV7Gmj017YCzYFNb91uGmw/Lx1nCRKaDwViy+ZZ
	uYp4ijDV/aNIHp0qhv0C1xs=
X-Received: by 10.200.42.14 with SMTP id k14mr12696618qtk.20.1513197887299;
	Wed, 13 Dec 2017 12:44:47 -0800 (PST)
Received: from x1.local ([138.117.48.211]) by smtp.gmail.com with ESMTPSA id
	n64sm1507938qkd.97.2017.12.13.12.44.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 12:44:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Wed, 13 Dec 2017 17:44:25 -0300
Message-Id: <20171213204436.5379-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-arm] [PATCH 00/11] QOM'ify SDBus, housekeeping
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
Cc: Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PSRqFHo0su2H

Hi,

This series also refactor the SDBus codebase to ease further development/series.

- 1: we add another hexbuf_strdup() helper, hoping someone will come with a
     clever way to do the same :)
- 2,4,5: add a sdbus_create_bus(master) and sdbus_create_slave(bus) to use
     instead of the current qbus_create_inplace(),
- 3: we add some trace events which will result useful later,
- 6-10: we use the TYPE_INTERFACE to enforce a stricter QOM, this also allow us
     to remove duplicate types,
- 11: we let the Xilinx Zynq machine set the "sd-bus-name" property, so now a
     slave SDCard can be now hot-plugged in the second bus.

In a later series we will update the PL181 and BCM2835 devices, having them
implement the TYPE_SD_BUS_MASTER_INTERFACE.

Regards,

Phil.

Based-on: 20171213195852.30439-15-f4bug@amsat.org
          (SDHCI housekeeping)

Philippe Mathieu-Daudé (11):
  util/cutils: add qemu_hexbuf_strdup(), yet another hexdump()
  bcm2835_peripherals: move GPIO 'sdbus' property link from init() ->
    realize()
  sdbus: add trace events
  sdbus: add sdbus_create_bus() to replace qbus_create_inplace()
  sdbus: add sdbus_create_slave()
  sdbus: rename SDCardClass -> SDSlaveClass
  sdbus: add a SD_BUS_SLAVE interface
  sdbus: add a SD_BUS_MASTER interface
  sdhci: implement the SD_BUS_MASTER interface
  hw/sd/pxa2xx: implement the SD_BUS_MASTER interface
  hw/arm/xilinx_zynq: use sdbus_create_slave() to name the different SD
    busses

 include/hw/sd/sd.h           |  3 ++
 include/hw/sd/sdhci.h        |  3 +-
 include/qemu/cutils.h        |  3 ++
 hw/sd/sd-internal.h          | 14 ++++++---
 hw/arm/bcm2835_peripherals.c |  9 +++---
 hw/arm/xilinx_zynq.c         |  9 ++++--
 hw/sd/core.c                 | 74 +++++++++++++++++++++++++++++++++++++-------
 hw/sd/pxa2xx_mmci.c          | 36 +++++++--------------
 hw/sd/sd.c                   |  8 +++--
 hw/sd/sdhci.c                | 66 +++++++++++++++++----------------------
 util/hexdump.c               | 19 ++++++++++++
 hw/sd/trace-events           |  6 ++++
 12 files changed, 162 insertions(+), 88 deletions(-)

-- 
2.15.1

