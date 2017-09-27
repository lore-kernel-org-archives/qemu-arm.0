Received: by 10.223.173.107 with SMTP id p98csp142727wrc;
        Wed, 27 Sep 2017 14:01:25 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDL3A7Ivty9sILcQHyTILtzKwnKVob5l9/fDmel9QwY2bK+SerJDxVYx8pHn7zP9OoWMo4F
X-Received: by 10.55.22.146 with SMTP id 18mr2223154qkw.281.1506546085130;
        Wed, 27 Sep 2017 14:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506546085; cv=none;
        d=google.com; s=arc-20160816;
        b=zWiYI9IEKhPs4ZXyeYIykZoEkK51+d1DN8Sy60dvrqCCF93rM8WvYHQK+ZxR/70Qd4
         w01MLgdifAtHrJLu/FuoaDBpThpoew/j+8ZbzscqaSdHLcCjM9JDOnGgRfCEqQ/NKMnt
         qXirYT5xYV8/IyTqRA5bdTh2ZvEG+ZIbHmR8oDT7tCTCuZhXmgPEzw9CGCmNY3yog1OF
         qdqz4D8uJrxhBLqPIYn/wNGK9/9yndEWXfV41d7O3aN89WWHGUieKi9nN6qa/8j5XCIp
         uNSVCsdRBWcCU0NEtW0kU2tdlImmk9CVvylWw1zSJs9VgySlrZGm04uoQn8QNCbUPROT
         f3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:dkim-signature
         :message-id:content-disposition:content-transfer-encoding
         :mime-version:user-agent:date:to:organization:from
         :arc-authentication-results;
        bh=GbVLg8VWt1vIe4VKShAZoEKTTdu3ie5bq+qU4MSgpn8=;
        b=0fDgjubc8s9FYbV+GF43WzLZpr9sNBS6sH2gU7+iMbak7T0ySYijZzCR3S9zwQS/hC
         qWUoaeg2hBmK/+P6ox8nOC19xHHNuzaSzm67If9XT0Ri3B5PT8CPA4bVPvUXgmg0wbIB
         oyOTFvdGngLm0tPD0WYmpUTmOcKr7UrISUqgax2TFzoDb29Ze64xQInUJL6bmXUOjMiI
         dNiltIKOzIgDVeG3BoXL/YYceXEalVeuHI0jFVXU9ZsC+gf4zBprUejbfg6O3QQbDNVH
         Cf6ckWpjDEqjR4lttLfve8rzjoEzbkoyrtLusuNftrDqHP2u0pjBpgl36tdrKw2j/yyU
         KT3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@tiscali.it header.s=smtp header.b=ztqF6xlp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=tiscali.it
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l27si6749129qtl.35.2017.09.27.14.01.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 14:01:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@tiscali.it header.s=smtp header.b=ztqF6xlp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=tiscali.it
Received: from localhost ([::1]:56337 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxJSM-0007s9-Vs
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 17:01:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sacarde@tiscali.it>) id 1dxEeh-0003iM-Nh
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 11:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sacarde@tiscali.it>) id 1dxEee-0002sS-Ly
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 11:53:47 -0400
Received: from santino-notr.mail.tiscali.it ([213.205.33.215]:55201
	helo=smtp.tiscali.it)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sacarde@tiscali.it>) id 1dxEee-0002iR-9w
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 11:53:44 -0400
Received: from arch64 ([151.40.185.125]) by santino.mail.tiscali.it with 
	id EftR1w01Z2ilCvr01ftSyg; Wed, 27 Sep 2017 15:53:27 +0000
x-auth-user: sacarde@tiscali.it
From: sacarde <sacarde@tiscali.it>
Organization: sacarde
To: qemu-arm@nongnu.org
Date: Wed, 27 Sep 2017 17:53:25 +0200
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201709271753.25633.sacarde@tiscali.it>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tiscali.it; s=smtp;
	t=1506527607; bh=GbVLg8VWt1vIe4VKShAZoEKTTdu3ie5bq+qU4MSgpn8=;
	h=From:To:Subject:Date;
	b=ztqF6xlpmSxR9LF0OgU2u5sTOx2SFStQufF+dfPQl88esBs46yYnnsAM/pyzmxzPp
	jK6lhyAaRCEnch+oZHbVO+MVr9SqMfZSgGuckrOEfIe6SEf3srX49v6I7eouoIxX/T
	+7ktEGDvJzc/bWZfas2bieLjWsb0aZJcY9mUL11U=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 213.205.33.215
X-Mailman-Approved-At: Wed, 27 Sep 2017 17:01:12 -0400
Subject: [Qemu-arm] lsusb on raspbian (qemu-arm)
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3aAtzLYYz1U3

hi,
   I install in qemu-system-arm:

2017-04-10-raspbian-jessie-lite + kernelkernel-qemu-4.4.34-jessie

I run:
qemu-system-arm -kernel ./kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M 
versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 
rw" -hda ./rasbian.img -redir tcp:5022::22 -no-reboot -k en-us -net nic -net 
tap,vlan=0,ifname=tap0 -usbdevice host:0846:9030


all works OK, but I dont view usb device
when I run: "lsusb" I have:

"unable to initialize libusb: -99"


what I wrong?




thank you


sacared@tiscali.it
