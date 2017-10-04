Received: by 10.223.197.9 with SMTP id q9csp5916566wrf;
        Wed, 4 Oct 2017 11:25:29 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBewMnUfOjrbm4L334wtpcd8D6UbxPO+sXljWxSMIZ8vNd8zdFsuXpfb0EfWMCsZ1wg0Z7Q
X-Received: by 10.55.91.199 with SMTP id p190mr24649899qkb.106.1507141529545;
        Wed, 04 Oct 2017 11:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507141529; cv=none;
        d=google.com; s=arc-20160816;
        b=qabSjzBl31iU3mIfVrQ/lePkxjbAj7DQI+dBg2OERJsbthccF17o04E9oScH9iTNqL
         kwhTa8xyDnlhCVn8iTJhA492goSvSPVxg+0bTjgI3Mhw7Y55OwAI3g5UK+ZGibmqLmsA
         Q4MGPOfr4OTTI/y2bnYZ7E0C4V7KEohsDyx2tYhq725ukx+a9e1yfHp8KnEGnRD6n/5c
         XA79H590USSpqfdsHGdLlXxOsTjjc5sU3qBswN5D7jbPkbggQ3vLYl3D8ab7FGEbIacM
         D/jKp/w6OoiKHeNzufkf+FJvHQYlguIsphXTYTcdG+9o8BisVfSaUeKqMgWarAaSmaaJ
         nFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:dkim-signature
         :message-id:content-disposition:content-transfer-encoding
         :mime-version:in-reply-to:references:user-agent:date:to:organization
         :from:arc-authentication-results;
        bh=v84aRQUNowh7qHbiqWQzXlZNIHwZvhS38JmtyCaVQ/4=;
        b=vGg6oIkGihQJAUkDGo3g/4Ds9CqYRPAZMmBPg+VpW3Qtr4MK55EljrFXuz1ynVobgR
         4k2vtFOhuN8E1h/D9WZBzmHktAzhu9hG8Nv5DY8Xh9ElIelZh60iD1yOTnQN+wAJQvbP
         WmFozrcYWhLjIKuDSwtCbVYGduPe/PvhdXIp+gDqScaodC7S3bYXFnSDE13RoCX16VQa
         HSGTYE5XjbvqbZOZkjbYK6B4AXeo/KEu1mTsrQEH+H7KWHxgUlvQcOJZvOvh3V35jikt
         HmO7KdhTAymTPv+R2xqtkmxAD53/JiT5bstV5CR42TaeTgkHRVRexKJgu2pJ2adxAQ+T
         EzaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@tiscali.it header.s=smtp header.b=4HEOnu78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tiscali.it
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2si942262qtj.341.2017.10.04.11.25.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:25:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@tiscali.it header.s=smtp header.b=4HEOnu78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tiscali.it
Received: from localhost ([::1]:36381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzoML-0004ZT-3D
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:25:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sacarde@tiscali.it>) id 1dzoME-0004ZB-H7
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:25:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sacarde@tiscali.it>) id 1dzoM9-0004Ad-EK
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:25:22 -0400
Received: from santino-notr.mail.tiscali.it ([213.205.33.215]:51316
	helo=smtp.tiscali.it)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sacarde@tiscali.it>) id 1dzoM8-0003s6-Tk
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:25:17 -0400
Received: from arch64 ([151.40.184.212]) by santino.mail.tiscali.it with 
	id HWQn1w00M4bNQ6n01WQw44; Wed, 04 Oct 2017 18:25:00 +0000
x-auth-user: sacarde@tiscali.it
From: sacarde <sacarde@tiscali.it>
Organization: sacarde
To: qemu-arm@nongnu.org
Date: Wed, 4 Oct 2017 20:24:43 +0200
User-Agent: KMail/1.9.10
References: <201709271753.25633.sacarde@tiscali.it>
In-Reply-To: <201709271753.25633.sacarde@tiscali.it>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201710042024.43908.sacarde@tiscali.it>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tiscali.it; s=smtp;
	t=1507141500; bh=v84aRQUNowh7qHbiqWQzXlZNIHwZvhS38JmtyCaVQ/4=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=4HEOnu78qdBqkM+2Y24baC81J9Qo0pB0tHt9tBLGJVHrcVn9r6tjP/bgmyYe/urzP
	8c2AUykeHmnz7tzJYtSUPtqztExlPB3glzLQA/os6DH9ZZLKqz2u3M2hs6kJw1PmJm
	W4IpKAF8R4SEdInQaq2Qk4Ky+zxXd6TxlV8QqmQc=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 213.205.33.215
Subject: Re: [Qemu-arm] lsusb on raspbian (qemu-arm)
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
X-TUID: ZGPT4wiMUCOF

>>Alle mercoled=EC 27 settembre 2017, sacarde ha scritto:

may be that kernel I use to run qemu is not the same that I use in the=20
system...

how can I use the same kernel ?


thanks

> hi,
>    I install in qemu-system-arm:
>
> 2017-04-10-raspbian-jessie-lite + kernelkernel-qemu-4.4.34-jessie
>
> I run:
> qemu-system-arm -kernel ./kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M
> versatilepb -serial stdio -append "root=3D/dev/sda2 rootfstype=3Dext4
> rw" -hda ./rasbian.img -redir tcp:5022::22 -no-reboot -k en-us -net nic
> -net tap,vlan=3D0,ifname=3Dtap0 -usbdevice host:0846:9030
>
>
> all works OK, but I dont view usb device
> when I run: "lsusb" I have:
>
> "unable to initialize libusb: -99"
>
>
> what I wrong?
>
>
>
>
> thank you
>
>
> sacared@tiscali.it


