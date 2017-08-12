Received: by 10.25.221.202 with SMTP id w71csp2137051lfi;
        Sat, 12 Aug 2017 06:39:31 -0700 (PDT)
X-Received: by 10.237.35.163 with SMTP id j32mr27434252qtc.29.1502545171453;
        Sat, 12 Aug 2017 06:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502545171; cv=none;
        d=google.com; s=arc-20160816;
        b=kqTkdbE1x4YjyrekzYwYe1CZi+MJrRf3//AO9d+0aGvMqqCsjAlBbDjH+EI+YnoZqp
         tmM7HydyQr2qEpghgO+wiqb5Xf7/WOVTI8lEVhzhc8Z6mHm6daGb8/my44SSsigQusM/
         XO+60UfolzuK4bQ3FYc8/PthnxcrW2k4gjW16MFgoYt8J1aUJB/4Hj0NryepuwZNSTKO
         8BOc/+9TBO87INcs0YbkO6jnURJ1B/6+CMqa5+XEWGuypBLRkCC9sWaaXJeJ1yL1GbCg
         4ETEzHyiaRx/7utLmUheqxhnCw58gqZL3hoeQRActZdSAPtQD8QPuAtXttiOFQHzqGiR
         sfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=sdGep+UrjQYFz7T/UR/0vg5c/iWjSzRjK99QBmL2ICc=;
        b=MVeVR9rNdOtrrOnBfmgrm3ivHRM+bmqu4e2zxI/UBJu7GMUZztVfuZgJkDy8CayT63
         s7yE0b9QBYT+bg25w8my6h5DQlA8CT6BzBlHh1JO6p1c8kpgmkK+OBoLZkzKXRkTokvu
         tAdEM4jy5LMAUQ8zmNi1Gto3T4eu3LqIhjkNuRDo2QxWKbL3ZAtFcFb1cgyuNphEQHcx
         hY7MNb6SHg5r8Hat4h5EZ7xmvr5cwJFgi3JtpRkLWyoWP/fGG+gF8JJlxdKB96UOej0W
         BEtOgoJp8/jEZ1JOHqge7IqsRy/mZWLlLecu9ITSWGoVc4/1FCsUvxxjRlR08BlEVJ+G
         jrBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YtNr5VqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v62si2785704qte.484.2017.08.12.06.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 06:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YtNr5VqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgWdU-0000zD-Rn
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 09:39:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ismiabidi@gmail.com>) id 1dgVkx-0006q5-Jt
	for Qemu-arm@nongnu.org; Sat, 12 Aug 2017 08:43:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ismiabidi@gmail.com>) id 1dgVkw-0001Ny-Dx
	for Qemu-arm@nongnu.org; Sat, 12 Aug 2017 08:43:07 -0400
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:32950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ismiabidi@gmail.com>) id 1dgVkw-0001Nb-8N
	for Qemu-arm@nongnu.org; Sat, 12 Aug 2017 08:43:06 -0400
Received: by mail-qk0-x231.google.com with SMTP id a77so32454632qkb.0
	for <Qemu-arm@nongnu.org>; Sat, 12 Aug 2017 05:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=sdGep+UrjQYFz7T/UR/0vg5c/iWjSzRjK99QBmL2ICc=;
	b=YtNr5VqSS/KEcl5NAg4C8HUACKdN6gPrz09zBL7tzsJmmpW0tX9uVKknpzfbfDPc9P
	0e8u7YDJmQWr8Gci2/VayI6DYnT1NrVVzb1u/cogRMEwhER6tV7PxhZOnPxoo8b4mQ8h
	kE/++YxL1rg+uqpF2rb4rOmkNvXY1P4e7MQ9VKxeA0+N0jLhcudMSQ7suuXB+0nrf0CP
	6SbSG21C2SG2R0X3fdl++DaK7FZFUH9QYnYMNXcWAe6VYoujgtODpvvKoliAp5eGn2go
	9qV2/k2vSRai2+jwY2P5uHJuveVTdFzKxM0yFqeN17lCglEB4VmfUFpORhDtW4NRUBGt
	Sz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=sdGep+UrjQYFz7T/UR/0vg5c/iWjSzRjK99QBmL2ICc=;
	b=Dvc17hzTWwDXALW/vHtBhOuzhq8+kOWDqILK6o86eLHw094BtzRMXudkMnKvTeAexL
	uku5vq+H497fGfIyiaRJSusHubRXmvjzhaoT8J6oodyuOQ1I81C6GEdmRJ51YfIm446s
	qslD9FIpr66+oR8+DRilbpKMz0E0ePcOfq2mYNPHTLK34PXhg5rRIpZw1UlHjto81kz3
	j9B54nxhFugpqpn2d3RGGtyz3+X77T5IxuGlwz+a7Xs93TNRBUtNojwLNqQrazE9PsiE
	xIGH7gbvvJzY0zhilV3m0dsK/l0mu4DF8htYKYS4g4uLtXC19KgYYXOdZwuILKCG+C8V
	TT1w==
X-Gm-Message-State: AHYfb5gKHM1Tfd1i69TFykKEwGYAXVAZZDGT8Z87CyCPGcIQq3co5oLn
	SC3MVxFzWefN3xA/yYuY70nC998qQ+69
X-Received: by 10.55.157.135 with SMTP id g129mr25146358qke.241.1502541783699; 
	Sat, 12 Aug 2017 05:43:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.34.174 with HTTP; Sat, 12 Aug 2017 05:43:03 -0700 (PDT)
From: Ismi Abidi <ismiabidi@gmail.com>
Date: Sat, 12 Aug 2017 18:13:03 +0530
Message-ID: <CAAyELwux+80o47HX8dWg-2VTDjZgKD9KmqXiy66VODt=yO6YpQ@mail.gmail.com>
To: Qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="94eb2c0654c847171a05568dc5a7"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::231
X-Mailman-Approved-At: Sat, 12 Aug 2017 09:39:25 -0400
Subject: [Qemu-arm] Instruction trace for ARM
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
X-TUID: /bUnvJN9W6a4

--94eb2c0654c847171a05568dc5a7
Content-Type: text/plain; charset="UTF-8"

Hi,

I would like to generate an instruction trace for ARM architecture having
instruction code with its parameters and the instruction address. I am new
to Qemu so can anybody give me some pointers from where should I start. The
patch link given in thread
https://lists.gnu.org/archive/html/qemu-devel/2008-04/msg00038.html is
dead.

Thanks,
Abidi

--94eb2c0654c847171a05568dc5a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>I would like to generate a=
n instruction trace for ARM architecture having instruction code with its p=
arameters and the instruction address. I am new to Qemu so can anybody give=
 me some pointers from where should I start. The patch link given in thread=
 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2008-04/msg00038.=
html">https://lists.gnu.org/archive/html/qemu-devel/2008-04/msg00038.html</=
a> is dead. <br><br></div>Thanks,<br></div><div>Abidi<br></div></div>

--94eb2c0654c847171a05568dc5a7--
