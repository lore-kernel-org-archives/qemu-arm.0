Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp95770wrx;
        Thu, 11 Apr 2019 21:20:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwW9rzHM6Ed1qd+57a+YNAWh30kxWniYJucDxvinoY7cCNWX9qUSAJj3nJY8vHEJnsvTyHo
X-Received: by 2002:adf:ee91:: with SMTP id b17mr31485799wro.234.1555042801172;
        Thu, 11 Apr 2019 21:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555042801; cv=none;
        d=google.com; s=arc-20160816;
        b=L1O3lH6v0le6WVrNQ6JIitTyVb3OBl79lRP8ZOR5gML67lYEWpCdP8yWwksugbVRox
         +q+JLtN364JWouVOUAlUeLZ3oYXIjMT7jOSkVkag6JulbU1/s2I/0a8h9nXpNewG0qXd
         oeXM/cjgco50VYDYxsUoyzR26JJxgu2XpYZyxDG4pL0wroBSSbh/BCRfYaxYx8+HvzbX
         NvoygY7FSzzvvWKA7qUh2wD7VxcwcDeMLMej5al/jNXTvlfdinGuHQRw1t9X6Zj3rw3g
         cVIt0ylW5HUIKyw4BoSq3skIVuauvb2BFT8H25u/4Ld/2BszMBsnKSqeurz38Ieo6Oup
         nAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=YIqMqtEzrgSvWYDYEAl/QC/5QT6B2u4URO5jB7ldbP0=;
        b=yvjp46q1usxWghIJkYThenrYG4WR2IPv3XhyzYwiYla54HbVcMsyg5J1Cub+UvrVSp
         tXPgKqiod0awEGZ7TTCuklQo52yJl1Fk/zjeSFue0yTO9lXO64J2j7xXO8Gaor1/2//k
         YL7hhdoHqiLW66ATGCcIu+xZ11K7jC3LfFEfNb84u2J1Z5T03yZBRCdmXWVtt4FtbB7x
         WSQOwQK80HW7bdwdubHcK18zqk45ObqRiYkciV7EzoRxaoXjBBsacinKtCq8ybqEWAVv
         gtQ9GKsbWfCz1IK4rRN+kZVxssY/29smASvI4MGig5YF1uQqSYl2lkDF3HpmMZpdwsyw
         bZLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aDtK6uEr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si25410274wre.404.2019.04.11.21.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 21:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aDtK6uEr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:58634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEnfU-0006YH-86
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 00:20:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hEnfJ-0006Xv-7j
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 00:19:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hEnfI-0005Cv-9J
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 00:19:49 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hEnfH-0005CY-Vf; Fri, 12 Apr 2019 00:19:48 -0400
Received: by mail-pf1-x443.google.com with SMTP id 10so4488572pfo.5;
	Thu, 11 Apr 2019 21:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YIqMqtEzrgSvWYDYEAl/QC/5QT6B2u4URO5jB7ldbP0=;
	b=aDtK6uErx+iRnBMvRL+uxaQbXT8Z1xgKYjqlOY0ogkAdxGjEFUMFOyySa3Iem8tr2m
	EXFBlMQwUpBEzqe9FjyP+EBGXbdFK118S+iyKyWGwstZfp+u0GaMuOZZpD+7fnlv0vu4
	3+nxIi+nwsv0EBFGLATqrGP2GYZC/vVcCfKm7jq84TVWT55X2NS23KiSgJnTNXCqx6Yr
	/TDoZcqxn00j4i5HDqvcDdwxvLM3lkZpaWFo/NW/yamvrLC8U/bAXJPCI2y44HVSTgD0
	SO7m6aA/z9ovZjFeg4QvjRssgSDtM2oc6J5jprNCRr5ICrTknnb93Fk669ZuuvnFquO1
	aVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=YIqMqtEzrgSvWYDYEAl/QC/5QT6B2u4URO5jB7ldbP0=;
	b=K0mEc0cUcUpuluRpXY2p3YkOUcktBAhN0i12/8uQ5+XhZK4qU5Hvfc+rjreJXehCQ3
	tZ56ineUhZQG5Ph1QwtYK81mVJUkH8U8wpMANmsWAYqIYwvTwIKAjaIznpK7ycebn+hv
	DZzjR5pL6TEy7WNW2TyeE5rPCzpv0Td5O8IzXEvt00ucpog5sQ8kiE7FAn3r0YrXsg6x
	3Y1nUHYLHwRLvzPuZfuPTU+9UPELd8f1Kcz0vIICTbLBlM0QWhOjOCi2lX0Z9GLYmoFY
	LkIBuvu8mwXKFG+b1hf0M+X/RJYU3FzTyrLDD3KPmGHLr+ihZac9YJPFm3CoiAXN1zxa
	Xr5Q==
X-Gm-Message-State: APjAAAXu8Op3QPaSxaNYO+xyp2IYD4bBMQMmtoh99iK+Sj3trMzmvfNA
	SAW844U5DcDSKNvMYWT2cFg=
X-Received: by 2002:a63:6907:: with SMTP id e7mr42890931pgc.209.1555042785929; 
	Thu, 11 Apr 2019 21:19:45 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
	by smtp.gmail.com with ESMTPSA id
	p14sm40590727pfa.26.2019.04.11.21.19.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Apr 2019 21:19:45 -0700 (PDT)
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
	Fri, 12 Apr 2019 13:49:38 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 12 Apr 2019 13:49:31 +0930
Message-Id: <20190412041933.12264-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v2 0/2] arm: aspeed: Add RTC Model
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SjNBjS1Bq76N

v2: Minor fixes, added vmstate and reset, and rebased on Cédric's series

Based-on: 20190411161013.4514-4-clg@kaod.org
[PATCH 3/3] aspeed: use sysbus_init_child_obj() to initialize children

A model for the ASPEED BMC real time clock (RTC). The model is sufficient
for running the guest Linux kernel driver, and ticks in time with the
host when programmed.

It does not implement the alarm functionality, which includes the
interrupt.

Joel Stanley (2):
  hw: timer: Add ASPEED RTC device
  hw/arm/aspeed: Add RTC to SoC

 hw/arm/aspeed_soc.c           |  13 +++
 hw/timer/Makefile.objs        |   2 +-
 hw/timer/aspeed_rtc.c         | 180 ++++++++++++++++++++++++++++++++++
 hw/timer/trace-events         |   4 +
 include/hw/arm/aspeed_soc.h   |   2 +
 include/hw/timer/aspeed_rtc.h |  31 ++++++
 6 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100644 hw/timer/aspeed_rtc.c
 create mode 100644 include/hw/timer/aspeed_rtc.h

-- 
2.20.1

