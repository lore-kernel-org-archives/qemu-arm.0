Received: by 10.25.205.13 with SMTP id d13csp9945271lfg;
        Thu, 5 Jan 2017 13:18:47 -0800 (PST)
X-Received: by 10.200.51.6 with SMTP id t6mr58368192qta.75.1483651127315;
        Thu, 05 Jan 2017 13:18:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si48496508qtw.58.2017.01.05.13.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jan 2017 13:18:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@dgtlrift-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPFQq-0008OW-L7
	for alex.bennee@linaro.org; Thu, 05 Jan 2017 16:18:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cPFQm-0008ON-LD
	for qemu-arm@nongnu.org; Thu, 05 Jan 2017 16:18:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cPFQl-0001Gn-Su
	for qemu-arm@nongnu.org; Thu, 05 Jan 2017 16:18:40 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:34352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jhanley@dgtlrift.com>)
	id 1cPFQl-0001GW-NJ
	for qemu-arm@nongnu.org; Thu, 05 Jan 2017 16:18:39 -0500
Received: by mail-vk0-x235.google.com with SMTP id x186so306111813vkd.1
	for <qemu-arm@nongnu.org>; Thu, 05 Jan 2017 13:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dgtlrift-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=OdOplVjbhoFr0hxoyIX64KsmZv2rO8AMSEeXnfmwIfs=;
	b=qwejPnxFV7oQocs2OZxAeAeZIWBmFEprFq8CLnItCu8BHnJG6uDLGhj0TJUhaNJHqN
	M2iXA0RBia03LrJWKbbtpDc0eiiaS/Oeux18g3DCvJ565+5DRSdzZoNzITdupn86OBub
	bybIn0n2RMrDtHrNhi5qk0Znr7uojUorXW2LCy9L4qN4T/gXLU5AXL+taX921YZ0u8UR
	O5PiaCSkuAwPUbT7kC2xexQ+TVCKTJ9XeazZzegosDtWnT0TwkLjaZ28Q8rs/Q/XkuUe
	tTkpXq2ehjx6l31jyY/X67pgmFC9Vfy7Ni21NoC8ivdzNY3XMAjUcTerpUg3VfDnPsRH
	2AYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=OdOplVjbhoFr0hxoyIX64KsmZv2rO8AMSEeXnfmwIfs=;
	b=MbT0BrNUyoNq9TM7kBWD1JwWdqhCTP+YeF/XvTQAZ5yLhEkk/fNn8k45NR6lHfQO+n
	TbzTyKbYptv1kLcTdIBTnvWj6qRo8WMv879yb0FgUJlZoD9aYtISr2+iiYL44wV7HQ5X
	ztKoqvb5Q4zj0+hlNQihX0L3j6AVyzc0aqhY9V7tro57QD22vyk1J7M1cXLlVPVRpQ8Z
	DeKxwFlYHW6DB+JOJ1005MOvdx2/QOb+mt747x3cy9mgd9CyDhiG0kIF2KeXYMJvvlBc
	NtKkpulWs8qFtOzbmdysYip+J3dKH7E0314PuEObdudnOl1fa3kF9UcsYDgMQJDS5ja3
	OjDw==
X-Gm-Message-State: AIkVDXLKjCTdSwXZcOPy3iuHxZaW4znwdWd129BgPPd+9A9b7aeY40mUfj2sO1TDyxx1afPBV5x3z1TxTuRnBQ==
X-Received: by 10.31.95.147 with SMTP id t141mr22369226vkb.49.1483651117423;
	Thu, 05 Jan 2017 13:18:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.125.71 with HTTP; Thu, 5 Jan 2017 13:18:37 -0800 (PST)
From: James Hanley <jhanley@dgtlrift.com>
Date: Thu, 5 Jan 2017 16:18:37 -0500
Message-ID: <CAF++6AO9P+VHj2mDwa0-13XSigzjfuQdhEHy1HX2e=tGu-28NA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary=001a114e5518d3681d05455f71bc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: [Qemu-arm] ATSAM4sd16c MCU chip NVIC issue
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
X-TUID: L3OsxffaQe8/

--001a114e5518d3681d05455f71bc
Content-Type: text/plain; charset=UTF-8

I'm trying to create a Atmel ATSAM4sd16c chip support (part of the ATSAM4
family) but I'm running into an issue with the NVIC code.  I modeled it
after the STMicro implementation and created a Machine based around one of
our boards, but I am running into an issue where although the call to
armv7m_init() seems to set up the NVIC correctly and map it to 0xe000e000
and jump into the nvic_readl(), but never jumps to the vector in the
firmware (kernel).

Is there any documentation (other then code tracing) for how the interface
for armv7m_nvic.c should be used?

Thanks much,
-Jim

--001a114e5518d3681d05455f71bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m trying to create a Atmel ATSAM4sd16c chip support =
(part of the ATSAM4 family) but I&#39;m running into an issue with the NVIC=
 code.=C2=A0 I modeled it after the STMicro implementation and created a Ma=
chine based around one of our boards, but I am running into an issue where =
although the call to armv7m_init() seems to set up the NVIC correctly and m=
ap it to 0xe000e000 and jump into the nvic_readl(), but never jumps to the =
vector in the firmware (kernel). =C2=A0=C2=A0<div><br></div><div>Is there a=
ny documentation (other then code tracing) for how the interface for armv7m=
_nvic.c should be used?</div><div><br></div><div>Thanks much,</div><div>-Ji=
m</div></div>

--001a114e5518d3681d05455f71bc--
