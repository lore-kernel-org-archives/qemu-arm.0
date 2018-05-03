Received: by 10.28.4.212 with SMTP id 203csp1660534wme;
        Thu, 3 May 2018 02:06:10 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo6B4CGgLvXAAvHZTJ0NpvQ0J2ZsJsazOfE/FavAiFGrXJgOdb1oKIvIdfxODin9X3LrrN1
X-Received: by 10.55.163.203 with SMTP id m194mr17685080qke.339.1525338370241;
        Thu, 03 May 2018 02:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525338370; cv=none;
        d=google.com; s=arc-20160816;
        b=Ydmtw3WEBovqY/Kb3e8FBByv1sHMQsOcQF9liM4obhuyH+WBI7p5po9Yj9lDmePQUR
         WToFTGDHYGiyNoXBa3I4coKTyZaDh2yRi/W1UgdYzCuvA8eZW4LAdyLHTrrA/OVgmkSx
         OMeeFXW50NXJYytPAmTeOYESuwA3l/g7ytk1GjK4zjcGpICIIN0XP9cyB8EF56293W5X
         LpkyVMZP0CFbHDtqoXAW+zd7jOveG2H3w2zEcetwrB+RrRmcoNojc7ll3t49Fpn8SPb2
         atYNQSqlGzsABLrGJv8xCtZcOEhuDIKGXxxZ+Q+YDY9KvwQaLEsCChzakNA9ELkDcMHo
         6GMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=4AfgIs7F3bf8grsVlBRm6zfi0oL6dZmZQ08cgELFcug=;
        b=dLtEs1JCLeJAEjZ8b3betxhaFqi96UA4LLxWc0FmSUcdqEWx/E+X8I0wiGwe7Fm/uE
         z8dnj2CTFnyCVlHxBTszMD6+bNaS8A7izZLYE9NWNMBaDmHa6FXH8Ri0OsguWOPfAVj1
         VVG9gmVMAKpY7LX4VnxkSL6gOrlk4vQKDWGMLSRkj8kaihdRRxGikR9yuVsRlk+G1jAc
         t+tCzwFdYeY4thPEyqS1/UtSdTcHhKfY8jG8bQL/gt98VTBfAofCY0Z3Et+7FFq4Zs0t
         yy1I/ihfCvxuC2c6evBOisXMoqZEdNJztfzTK3WbPnENRCZa68ONyMVLHhuswRVnBkRy
         f0rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JHVpxByj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15si586845qkm.26.2018.05.03.02.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 02:06:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JHVpxByj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEABl-0002FR-Mc
	for alex.bennee@linaro.org; Thu, 03 May 2018 05:06:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fEABT-0002Au-EV
	for qemu-arm@nongnu.org; Thu, 03 May 2018 05:05:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fEABS-0008Pi-Ia
	for qemu-arm@nongnu.org; Thu, 03 May 2018 05:05:51 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:43414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fEABM-0008KX-Bc; Thu, 03 May 2018 05:05:44 -0400
Received: by mail-pf0-x244.google.com with SMTP id b26so1428042pfi.10;
	Thu, 03 May 2018 02:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=4AfgIs7F3bf8grsVlBRm6zfi0oL6dZmZQ08cgELFcug=;
	b=JHVpxByjEOaL9XjsSf8bpVa15jnFhaHz06XsMF6UWL7//ejSKXV+wPoi0vwy0f3pzY
	pTfZpPG7w6MrlrwdfqTdThBHtGRrmp96Ss0IHOvPVaoVzznLCW/ta3UlyWm4KKWsAG7K
	52aFf2XgHsP0otOddTbgp052GO1Y0PVMxq53PN4eYD+SS44XRb/n16A8Ux5GaNbfFGCd
	k68BCdq6Bpa3c1JmW8FMJ0xj3V2jSP/RWCEA4DVwtL6vhKq1L6nNhi9q73deL8F/ZbS7
	uNo2RnKmwJOQ0ElSGRuh8qwPd+4d+ioewbNjQx1gUpjWKFkPbrNdRXZcBao4bKDojsJe
	lpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=4AfgIs7F3bf8grsVlBRm6zfi0oL6dZmZQ08cgELFcug=;
	b=Nj9ONEXJkzI0MFLMzRTfYYSXvW3Hwv8dPwThP4xqM6+mepFbZMacr5RuBGMk5hy5jC
	gYUNsgkiUipwSAjLpjIP3kagqMdeI4KtWoEcDzYuPDVmTBY4guusz61ViwGci4XkG7Wl
	SLXkdzOx478EGuG2ucq9P8WebBDfVoeNvQdVptOEFZ12JHW0NfjTyDF3UMB9qJw2+QS6
	E0RpvOSbjzjXMhBmM3gRkQEkaUNlI9rNrHwLVib3k1cKRZCb5bYzaxlqqVlzPenA0qYK
	nZl6dXZgVUc5xRafEExHImYaN9jOEy7BahBMtfySCvpRsBnLzEjWix891CNvNQh3mmc8
	03og==
X-Gm-Message-State: ALQs6tBD40oem8dvXtwrEtTNG8LRtb9qxWc0djBH9fdlIvUk1ogfmbPJ
	jwSOEJEdu6RYxuBivkKrWeA=
X-Received: by 2002:a65:4301:: with SMTP id
	j1-v6mr8928502pgq.356.1525338342811; 
	Thu, 03 May 2018 02:05:42 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	p126-v6sm21519858pga.28.2018.05.03.02.05.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 May 2018 02:05:42 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 03 May 2018 18:35:34 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  3 May 2018 18:35:30 +0930
Message-Id: <20180503090532.3113-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH 0/2] arm: Add nRF51 SoC and micro:bit machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Stefan Hajnoczi <stefanha@gmail.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h7ER7wbTGNKD

Hello,

This short series implements a minimal definition of the Nordic
Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
machine that will use this SoC.

This work will serve as the base for our Google Summer of Code and
Outreachy interns who will work on implementing a number of features on
top of this base.

I've tested this with a microbit micropython firmware, and checked that
it starts running by looking at it with gdb.

I chose to keep the nrf51 and the microbit seperate, to not confuse the
peripherals that are on the microbit but are not part of the nrf51, and
vice versa.

Please review!

Joel Stanley (2):
  arm: Add Nordic Semiconductor nRF51 SoC
  arm: Add BBC micro:bit machine

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/microbit.c               |  33 +++++++++++
 hw/arm/nrf51_soc.c              | 101 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  31 ++++++++++
 5 files changed, 167 insertions(+)
 create mode 100644 hw/arm/microbit.c
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

-- 
2.17.0

