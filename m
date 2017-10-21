Received: by 10.223.197.9 with SMTP id q9csp8650545wrf;
        Sat, 21 Oct 2017 00:31:58 -0700 (PDT)
X-Received: by 10.237.43.99 with SMTP id p90mr10960684qtd.171.1508571117958;
        Sat, 21 Oct 2017 00:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508571117; cv=none;
        d=google.com; s=arc-20160816;
        b=IeQ+nhhmm0ir93Edh9vcyQqofaDgY90ewKOdcRVZrk5VsQeHsee4kjrRUZKxvGmOkr
         cMv+txOvSgYIziQQQYIx7ntAHEHGYXVvGb2n6JKGkD/z3rk45yKoLexEIDxfrw2kGRwn
         F7gDA6xJQyKqbfbTOlvNslpkYg+9f7GUXv6vTjlj3o/gz950gF1LWn5qbD47E7QzACA9
         Fr6kJmyOCuIIGlRfY2ECqVk8p47R+oBLCQW2vBAU8nyyM5i1HLJ1wz5o3NEucvfnR6gC
         etkrobxIK8WMBGvqfs+zGao5bpOyp90yZzPXyryKMLk5CM3jv/AHI3fP9rSiVotn+e1W
         CB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Lwf4/PWIorhp1v4jEHWY8sUwb1FJna7RBcvP835sTtI=;
        b=DqNhQHePU85OAiY6D8AvM5ASSRrvk4EtOngyPWmU6MRRvw1cgKf+L5A8v+9eZqg7WD
         WJD4U8iKLQyZ3TehA9JRwlfwbHfSYjwxZSYKRs+1CoeTslbWviND7w66jdeLI0JnU4cA
         fpxkmUsbltI215UsMtn9OTSbHo7YbEUS5Eh1PK3wpM7P2H5ECqvm2pyABloN+JT0d1CJ
         GwbgZ7Uvi8BoLuIOH9fujOtXJ7rhc2ZHMWz9oLL60OZ7JPfUtnfddXIJvi0fykj+aJUB
         Wqzx++dqFVMMwLKTvmp/kJ4bxedMGROKlxIFthj56zZ6L7lehm3JWfGk9qOfKkhS+4jT
         2PyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aucklanduni.ac.nz header.s=google header.b=hCXtJ4LN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j61si2225647qtb.205.2017.10.21.00.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Oct 2017 00:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aucklanduni.ac.nz header.s=google header.b=hCXtJ4LN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5oGB-0007e2-Ox
	for alex.bennee@linaro.org; Sat, 21 Oct 2017 03:31:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hteh703@aucklanduni.ac.nz>) id 1e5oG4-0007dx-Uo
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 03:31:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hteh703@aucklanduni.ac.nz>) id 1e5oG4-0006Rn-6P
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 03:31:48 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:45329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hteh703@aucklanduni.ac.nz>)
	id 1e5oG3-0006Rf-Vi
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 03:31:48 -0400
Received: by mail-wr0-x22b.google.com with SMTP id y9so815725wrb.2
	for <qemu-arm@nongnu.org>; Sat, 21 Oct 2017 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aucklanduni.ac.nz; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=Lwf4/PWIorhp1v4jEHWY8sUwb1FJna7RBcvP835sTtI=;
	b=hCXtJ4LNWRiMIE5vXLWl9onQ02M3R3Ecjv8Pf5TPh30KFcNhzB1hcljaF3cuUw4tYt
	dKj1TrTKBBAE/+VwVHv1KRaF6g+Uwsp4SlrzzW4wihVwHNZ3gC1CJ5E7e30usNLmmq+Y
	2O0tXIxcEnCpqOW+UHbrG9Hy6zPIC7MndRPVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Lwf4/PWIorhp1v4jEHWY8sUwb1FJna7RBcvP835sTtI=;
	b=ZbPTXxEhEF4nYPmyRpN8xwDxnCDExbBuYj+SoFmTfQDCYXbk70XQ14Uc2gUfO/Lqvw
	dEEQsApNinaNIamMr6TZtR60sWtsAa81wo9ti1UITno/FDu3TZONo/e+8Osy2Y8vWh0q
	Pv0i90EVY/WlkhCq84dRM9K6R+1NesoDVNFtm7vQiUE8278eFoi6Dl5wkpqWehSfsB4w
	rKWum88MNLPK91ogkPjVfpqcstRNYmVLbs1OBZQ2oOFo3xDl/IuuuPca3gbJPd+OKtmo
	9AOGz1HpWmLt7OZzUFlFDCHjZCC7aj21kvoSMS5HWWExj73VAkgvKbQ5OpzDItHvP3FB
	o7bQ==
X-Gm-Message-State: AMCzsaXCCFlUVrUIWsN3fjI8Q3vYwExd5qJ98jhrypc4XxhVhYz+NKSG
	C++3D1WadhwmYqAFuR6+h3DPEfiT7sEYG8dxsVKSR4mO
X-Google-Smtp-Source: ABhQp+QaFu5DivSmMolHdY4OBjsedI1beJiz3W5U3zkioIK0rhlBNrR+Hi/NMpmtstV7OWpij9HXX4+/soXWYgxtA0E=
X-Received: by 10.223.169.239 with SMTP id b102mr6131542wrd.171.1508571106734; 
	Sat, 21 Oct 2017 00:31:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.102.214 with HTTP; Sat, 21 Oct 2017 00:31:46 -0700 (PDT)
From: Hui Yie Teh <hteh703@aucklanduni.ac.nz>
Date: Sat, 21 Oct 2017 20:31:46 +1300
Message-ID: <CAPLZ2xMgcbiJr+rbQwZxbP6chMzZ7fBcJ1q35tEbjhccQHPsow@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="001a114621eeef88ee055c0994b9"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: [Qemu-arm] .bss more than LM3S6965evb RAM size
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
X-TUID: ArOrFb4D4O4G

--001a114621eeef88ee055c0994b9
Content-Type: text/plain; charset="UTF-8"

Hi,

As far as I'm aware, the LM3S6965evb board on qemu has 64kB of RAM.
However, my application has the following sizes:

   text        data       bss         dec         hex     filename
>  77540      1544     64032  143116   22f0c   o-optimize/test.exe


The bss and part of the data, I believe, will be located in the RAM.
However, that is more than 64kB, but my program still runs fine on the
emulated board. Is there a reason why? Or am I missing something here?

Any help would be much appreciated. Thanks.

--001a114621eeef88ee055c0994b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Hi,=C2=A0</span><br style=
=3D"font-size:12.8px"><br style=3D"font-size:12.8px"><span style=3D"font-si=
ze:12.8px">As far as I&#39;m aware, the=C2=A0LM3S6965evb board on qemu has =
64kB of RAM. However, my application has the following sizes:</span><div st=
yle=3D"font-size:12.8px"><br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">=C2=A0 =C2=A0text=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 data=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0bss=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 dec=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0hex=C2=A0=C2=A0=C2=A0=C2=A0 fil=
ename<br>=C2=A077540=C2=A0=C2=A0 =C2=A0=C2=A0 1544=C2=A0=C2=A0 =C2=A0 64032=
=C2=A0 143116 =C2=A0 22f0c=C2=A0=C2=A0 o-optimize/test.exe</blockquote><p c=
lass=3D"MsoNormal"></p><p class=3D"MsoNormal"></p><p class=3D"MsoNormal"><b=
r></p><p class=3D"MsoNormal">The bss and part of the data, I believe, will =
be located in the RAM. However, that is more than 64kB, but my program stil=
l runs fine on the emulated board. Is there a reason why? Or am I missing s=
omething here?<br><br>Any help would be much appreciated. Thanks.</p></div>=
</div>

--001a114621eeef88ee055c0994b9--
