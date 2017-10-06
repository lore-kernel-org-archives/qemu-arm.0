Received: by 10.223.197.9 with SMTP id q9csp1846556wrf;
        Fri, 6 Oct 2017 09:49:33 -0700 (PDT)
X-Received: by 10.55.92.195 with SMTP id q186mr21258654qkb.154.1507308573183;
        Fri, 06 Oct 2017 09:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507308573; cv=none;
        d=google.com; s=arc-20160816;
        b=wkhwT5q8ishchdp4UWLseUb2KnVWQIhObYSAWUtnwSZk8CbLRfmWNxTZHh2rP0Y8c5
         IjpGAef6TR97p41aFDnl4nSA5oAbBas6aNCuyLOsrDW3M8ViC33ZFsW58c667j1Zf3lh
         TNWtJRmwMcf/bTnJATEOjr3Hpz9V8HdJBD2lm/x+GpAJWavQE8qr7XMwbipc5fdr0+Sw
         I3QBBXbQm06z9vPCKQyyNZvAqBJP553mrf1wWrO/IkSYstNdy06c+Uj7WiYYk1zsXRHn
         jM3uU6NC1mzjFqE4cLJFMX2naY6ToSFv16K3PejTZchn8lxXPpUzDrCN8v5hvfGhNgPb
         6uhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=GCn7rYsbZ3OK3fm2lPQEAGd3w3b5Cc8krFLnMQ50n8M=;
        b=mfODaMrHZBfY2FtFJz9klgqUIwXJWbfhX2yTn/HEiIvk9Ixo3QBG7l2dYMvYVpG4hE
         wks724apR0KTIpgoXWK1ht9EDi/l2qZQ45Za/Zd/q4WWPHsRrZ+ofoH4s6tQewWNQ/RZ
         6MkqZH8+s2zfOCEqO/gJ/Mm+DApqXRIT8s1Jx9HEFWjVOskKNZNc/S8zQUb8TsmmzElk
         qy5I1q8p7WC/VZO4uv7Nwv6Y0kOgYRSZZliSpXf0F67wlla/1neakAVxQ7aXJfs0yX9s
         rKwPaZyR7ck/Zd6PYPlwX0/u5NVYqP1c8MRRRdP73sVcmsyODmZeswcrbfcFgW7UNvDX
         YRAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aucklanduni.ac.nz header.s=google header.b=tSIzzeme;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k62si1273248qkb.492.2017.10.06.09.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 09:49:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aucklanduni.ac.nz header.s=google header.b=tSIzzeme;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0Voa-0006Jy-Jb
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 12:49:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hteh703@aucklanduni.ac.nz>) id 1e0UTn-0000LP-6Q
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 11:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hteh703@aucklanduni.ac.nz>) id 1e0UTm-0003Wy-1j
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 11:23:59 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:52607)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hteh703@aucklanduni.ac.nz>)
	id 1e0UTl-0003VV-Kb
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 11:23:57 -0400
Received: by mail-wr0-x22e.google.com with SMTP id k62so13264739wrc.9
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 08:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aucklanduni.ac.nz; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=GCn7rYsbZ3OK3fm2lPQEAGd3w3b5Cc8krFLnMQ50n8M=;
	b=tSIzzemewPzrojvx2M6tSE4/py4ZKy6SgqhaDs2IzL5HKJvVzm4ewCXp0yhaEyjXFJ
	hxKzFnlxcdiyP8nJv7QPp7MHXtYiMTaBijGDYvQh/3U2vchFrsNGJq6zPsqGsgjxmxiK
	lyvDWTR3ILzbZPE60SHYtfEO0+tbtDuHPo7ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GCn7rYsbZ3OK3fm2lPQEAGd3w3b5Cc8krFLnMQ50n8M=;
	b=ffnAcSKyPzqYKkVcvJMSRl7SaGfviB74KqrzDoUjaHg6KSPRFUQq84Dg8SZUiT7N3d
	0t2fZITuzzVtPyV2SYI30Ircp0aC7UUGAYTYwvM5eYhUnf6Dt2a93z2x4BsEDUjSc1b5
	e2fQl/otgyJzbJSYxKAh4smtxAAp9U/mZoiD2JIu/+UwXOrDfCfYSeqwNY+yNEDdiFor
	4V/asPU84L1tH3FIgvtYWb3zvCLs3qMfYBbbcNNNqylx8kkPbWuzS+6jL8HZ8MXxZj9K
	nu4KtLpzD/jznmMQNdYn4NguEzuXNU6GEMlMIQL7n74bZOJ0ZuA8sfyCm8DbFDR4MSC6
	N87w==
X-Gm-Message-State: AMCzsaX+3YCnggz2PGkr2RpE2RxP2gtYo430l6x2XOGn8DJeOnAa5GLc
	oCZwHpvj2aJsRMu85hUicEYby+zioB9wYovwtiuZncZf
X-Google-Smtp-Source: AOwi7QAhSl0VIkelKNZLdj1uoCTrJHiVxxuKusuT/OYVo5R7/DkwM0QizoZyZQB9Go+W8U7DrwAyt+YTckqVdM0UDkU=
X-Received: by 10.223.197.13 with SMTP id q13mr2650773wrf.272.1507303435968;
	Fri, 06 Oct 2017 08:23:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.155.66 with HTTP; Fri, 6 Oct 2017 08:23:55 -0700 (PDT)
From: Hui Yie Teh <hteh703@aucklanduni.ac.nz>
Date: Sat, 7 Oct 2017 04:23:55 +1300
Message-ID: <CAPLZ2xNh+JLByqo4zxHcVU4i6Srm+1ZchzqL2p8OD+WNrW5Q4Q@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="089e0826b234debe3b055ae26d31"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
X-Mailman-Approved-At: Fri, 06 Oct 2017 12:21:09 -0400
Subject: [Qemu-arm] LM3S6965evb RAM size
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
X-TUID: 77b2PWUIHHYm

--089e0826b234debe3b055ae26d31
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm wondering what the default RAM size for the board LM3S6965evb is?

I am trying to increase the size of the RAM using:

*qemu-system-arm -no-reboot -nographic -M lm3s6965evb -m 512M -kernel
o-optimize/test.exe*

and I've tried increasing it to -*m 1G *but I'm still getting errors for my
application for not having enough RAM size.

Any help would be much appreciated.

Cheers,
Yie

--089e0826b234debe3b055ae26d31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I&#39;m wondering what the default RAM size for=
 the board=C2=A0LM3S6965evb is?<br><br>I am trying to increase the size of =
the RAM using:<div><br></div><div><b><i>qemu-system-arm -no-reboot -nograph=
ic -M lm3s6965evb -m 512M -kernel o-optimize/test.exe</i></b></div><div><b>=
<i><br></i></b></div><div>and I&#39;ve tried increasing it to -<b><i>m 1G <=
/i></b>but I&#39;m still getting errors for my application for not having e=
nough RAM size.</div><div><br></div><div>Any help would be much appreciated=
.<br><br>Cheers,<br>Yie<br><br><br></div></div>

--089e0826b234debe3b055ae26d31--
