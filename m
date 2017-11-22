Received: by 10.223.159.82 with SMTP id f18csp638115wrg;
        Wed, 22 Nov 2017 12:50:54 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaJbqsogKvZEJqaK+XFuMiAG9tiF1cgUbZX2lDBtBkmWllzoPW3Z1T9BLH8e5OQD6LeGO5A
X-Received: by 10.37.233.5 with SMTP id n5mr13529995ybd.116.1511383854270;
        Wed, 22 Nov 2017 12:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511383854; cv=none;
        d=google.com; s=arc-20160816;
        b=ikGivGv6yS6LVN+kf1tjviQn3xGeahkvKfDZqI8XyB50FRAl0PlrLRpHSYnaiU/DtW
         K785qkbCacFEMikDBDomCtc7bYDCCJFd1qTCMGRgx80NcoDkexUzf+OIw+146BJg3J/n
         2fAhS4RQYOw2CFzNmIyBmTOT1ptVMVRIApPnkRp9donuBSP+zRiMgyOEiEpP1G8v0DiD
         pgHi9JK3kXrPMSbAewi9f5x8kSG28/lYUhMXl2QbgxYSg3uSGvG8KiPLny6lyZyOHDin
         hJGty1oeUUiglLzuE3y6b9vooZ7Qx3uK7vKEl+TyKcFNXSKlLEEswQnijiBSdl4bLP2M
         WIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=5pzyNLaxql3w9Rk74Qxl8+qxHtheJywuzYkmlKnZhNc=;
        b=M8zER30UPwJcYIr0eVM5Cj5B5MJfKZjFywTZv97TWJsaxlbo7oi8ZhZdVmcbVf8+MO
         JM99JEXQPi+hJ3dyVntoW9OXllq13yU8w4y2/bVBdfsnVTh7rR86ZU5sE0HsUxgnjtFz
         Z3L+6u1XQ6zWAyyi/37PPzHbzUjvxVPsSH4cDxLbCljhOM2OVUy1ST2+pyPQp5KeqV6k
         qLxcwycSpELw3GdfM/D3arMfSnYifajf53r0URkWligGBVBlkOoDbaKrHG84ptLVqYN5
         o1k8PxUzTcIgU6pZb+gCQYo5ANSh12ZkhBCyRHTF1Q0vMAZcwxS8XDY7G4HgA4IcweXl
         aNww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J5HVPYYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y16si3381673ybj.405.2017.11.22.12.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 12:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J5HVPYYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHbyv-000183-O7
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 15:50:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbym-00017l-OO
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:50:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbym-00030C-2R
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:50:44 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37798)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHbyl-0002zl-TN; Wed, 22 Nov 2017 15:50:43 -0500
Received: by mail-qk0-x244.google.com with SMTP id 136so18495206qkd.4;
	Wed, 22 Nov 2017 12:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5pzyNLaxql3w9Rk74Qxl8+qxHtheJywuzYkmlKnZhNc=;
	b=J5HVPYYiKj9sjQIjlXnmDCu3HTCx2IdMPhGwcZo75kDjlb9HF6VtxXJdxDXH/1lMdz
	JtZPjqI5VrWhxF6OaEsfvXGrj1UUP2U2KAt9SlUB8RZd+s5P7q2PVg+fviQv+Lmh09UO
	ugR23Y1Q8ATNj7j9jmcUJPG1nxNT4/C+xJibolG2OaJ2czs79FXHUYeCydt2Rs9STlsS
	TF40IBxdP0XoCg/dygN+vtk24BtIwq0j7jYh5qt9xb1A1tW6jXsicbmtc3SYTGb5yhlK
	J56eusg7rg89cSZBfiQIA/i0ilFBDZaScfBCftfEtHNRE2yLAhyMmdEWYEdlVjE6wu8w
	iecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5pzyNLaxql3w9Rk74Qxl8+qxHtheJywuzYkmlKnZhNc=;
	b=SWqfXcoKzRlX2qn7gZn9kR9dpOVnPvNk4Cb4qdFT5bB+BO2BeZkkJtLcPqsl+Icd3H
	jsB91jCCP/QKVEtv1nEm5oU0Shs7hQx7t9UtVJ5LxJUkG3Fal/lLg9CoMR1Bjr0qkxAH
	WKI669kx/LDpEHRs/3reWpw0n1tjy5BWHrxoPr+iQ88ohTJMdnNc/p5xu0+e3q9TwuGl
	fmbPxKzwaqeeBPcIg8Ng5auCMAW3JWz9t+r/A/kvNzumdCnBfTW2gsxw3yLrfjfhzWIh
	03StPPSeO3EZG/1J1cSL6xlMuu9BS36Ml1KSh0A0Jmkp4bHoegZ7NbWrnrv1WztF5BxZ
	46GA==
X-Gm-Message-State: AJaThX6AQcNEM9mioXMUFVuIjnWxJ1XXBQA10I82S17oPyIld5cMK8TV
	ffb9NWBtSWst9ph69tSbh6cdQyNu9LoC/8fF9EY=
X-Received: by 10.233.222.135 with SMTP id s129mr29274060qkf.32.1511383843033; 
	Wed, 22 Nov 2017 12:50:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 12:50:42 -0800 (PST)
In-Reply-To: <CAFEAcA9YDiTNPX4gxG9uidUbMarLK7gHaeBOFs-+a=6qsuothA@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-13-andrew.smirnov@gmail.com>
	<CAFEAcA9YDiTNPX4gxG9uidUbMarLK7gHaeBOFs-+a=6qsuothA@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 12:50:42 -0800
Message-ID: <CAHQ1cqG3mR6onU+z5=_OZwJz=NuhOwn0Z0znmOB83A2EbKFwpw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH v3 12/30] sdhci: Implement write method of
 ACMD12ERRSTS register
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pdwnZ02fwNYc

On Tue, Nov 21, 2017 at 10:04 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/sd/sdhci.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index f561cc44e3..53e5e011a7 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -1139,6 +1139,9 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t =
val, unsigned size)
>>          s->admasysaddr =3D (s->admasysaddr & (0x00000000FFFFFFFFULL |
>>                  ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
>>          break;
>> +    case SDHC_ACMD12ERRSTS:
>> +        MASKED_WRITE(s->acmd12errsts, mask, value);
>> +        break;
>>      case SDHC_FEAER:
>>          s->acmd12errsts |=3D value;
>>          s->errintsts |=3D (value >> 16) & s->errintstsen;
>> --
>> 2.13.6
>
> Is this part of the stock SDHCI spec that we just forgot to implement?

Yes it is. I don't know if missing that code critical for anything,
but since the rest of the plumbing is there I thought that we may as
well implement it.

Thanks,
Andrey Smirnov
