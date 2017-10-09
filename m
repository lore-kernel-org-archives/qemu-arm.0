Received: by 10.223.197.9 with SMTP id q9csp2235522wrf;
        Mon, 9 Oct 2017 02:09:10 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDMwobPA+ACQPCbLnMz9trZQayMibVM9WHE2/3xqoaNLcqMlxmGrvh3VgD8uZxH3jDXVzbk
X-Received: by 10.55.150.69 with SMTP id y66mr8661481qkd.28.1507540150647;
        Mon, 09 Oct 2017 02:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507540150; cv=none;
        d=google.com; s=arc-20160816;
        b=TtFHncwfpaTw5P2P18y4FMW/LCJiLo8OFFuqIwnmimxnVUegEJ4YAQY+WTvmPZQ3rz
         u+QIHqWBmHQ3tuJV3e3K5+ssfj5RLUnW6dr9Vi9/3CB5EUeCqx2/JhQAJmq4Vn7zSqz4
         JqWiGdivZhz5weqEfkXC/A3hY2X1g41cvcYmOR2MftXJd7+8Ig7+PWXUdsSGTKNxiobQ
         gh6JaHiMuYzqyFCF6kNUk1ctDu6otwDN50eM7B+HRjvwc567dOJUWTLM4+jVD46FwJq3
         h1B07o+xUdli8T2f3ogbOIIDXk1xZESv4Uicdlae15oEtnELUYuWlS88RJhcyJNQYbef
         gf9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:dkim-signature
         :message-id:content-disposition:content-transfer-encoding
         :mime-version:in-reply-to:references:user-agent:date:to:organization
         :from:arc-authentication-results;
        bh=Pu4gfxe2gxqm+7MTA3CZdyw8Cpxu+BjP77hlm1ZV5Og=;
        b=MtZI28NYO9/8fU8MlP16T7ubGIs6/jTHrLO/s0iLcPBOiWnfdJAp0GApt9EVHFBEZd
         pBPVWAJ1yzZaEmZpkc67FNvBZaWAK+DahgAUHA5dQY+lkyIIZHc40zvM+4j8hAO2F0MD
         uCnQbmv08TvxrEWp804eiE/gLxfB/3wA4H+7oZ4qneDdrtf8DFzwHKUIk2YC9eeKq4Ck
         wWH6p/cyYTQtpAQJleKhYyfCiszf4ZHEQyQq1IzEoldby/xIauJj8QNl78Q3wdTYSijf
         PbiX6C7jsWDkH0h5svnAsyA64zoz94TwLCLJJfQ1ZkA3mAjKbA5aPd8rLl+GLMY30LAE
         LcMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@tiscali.it header.s=smtp header.b=PtRju/0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tiscali.it
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10si2816863qti.71.2017.10.09.02.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 02:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@tiscali.it header.s=smtp header.b=PtRju/0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tiscali.it
Received: from localhost ([::1]:56789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1U3i-0004hv-5o
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 05:09:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sacarde@tiscali.it>) id 1e1U3X-0004gk-9k
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 05:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sacarde@tiscali.it>) id 1e1U3U-0003wm-4i
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 05:08:59 -0400
Received: from santino-notr.mail.tiscali.it ([213.205.33.215]:35835
	helo=smtp.tiscali.it)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sacarde@tiscali.it>) id 1e1U3T-0003rv-On
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 05:08:56 -0400
Received: from arch64 ([151.40.181.42]) by santino.mail.tiscali.it with 
	id KM8d1w00i0vHC4f01M8dP3; Mon, 09 Oct 2017 09:08:38 +0000
x-auth-user: sacarde@tiscali.it
From: sacarde <sacarde@tiscali.it>
Organization: sacarde
To: qemu-arm@nongnu.org
Date: Mon, 9 Oct 2017 11:08:36 +0200
User-Agent: KMail/1.9.10
References: <201709271753.25633.sacarde@tiscali.it>
	<201710042024.43908.sacarde@tiscali.it>
In-Reply-To: <201710042024.43908.sacarde@tiscali.it>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201710091108.36983.sacarde@tiscali.it>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tiscali.it; s=smtp;
	t=1507540118; bh=Pu4gfxe2gxqm+7MTA3CZdyw8Cpxu+BjP77hlm1ZV5Og=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=PtRju/0dyw8qlJAVDgcBHKB8O+7j5UJ8ts3mYLsEHhm4bxU6+If8D/k9erWRpEWua
	PTciCUa013Y/x0wgO+y/wsdxZ2PFCEJQHtV/tv++GQF5z0H7/5BcL6MwKGHsroPUtT
	vKkvZK8jp1+ftiuAEO3MdFCrVmJHR/DdJReYJ5U0=
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
X-TUID: 2pmkDheYO+cQ

>>Alle mercoled=EC 4 ottobre 2017, sacarde ha scritto:
> >>Alle mercoled=EC 27 settembre 2017, sacarde ha scritto:

may be that qemu-system-arm not virtualize usb controller?

someone suggest me to use: -M virt
but I have error:

Error: no usb bus to attach usbdevice host, please try -machine usb=3Don an=
d=20
check that the machine model supports USB



thank you


sacarde@tiscali.it


> system...
>
> how can I use the same kernel ?
>
>
> thanks
>
> > hi,
> >    I install in qemu-system-arm:
> >
> > 2017-04-10-raspbian-jessie-lite + kernelkernel-qemu-4.4.34-jessie
> >
> > I run:
> > qemu-system-arm -kernel ./kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256
> > -M versatilepb -serial stdio -append "root=3D/dev/sda2 rootfstype=3Dext=
4 rw"
> > -hda ./rasbian.img -redir tcp:5022::22 -no-reboot -k en-us -net nic -net
> > tap,vlan=3D0,ifname=3Dtap0 -usbdevice host:0846:9030
> >
> >
> > all works OK, but I dont view usb device
> > when I run: "lsusb" I have:
> >
> > "unable to initialize libusb: -99"
> >
> >
> > what I wrong?
> >
> >
> >
> >
> > thank you
> >
> >
> > sacared@tiscali.it


