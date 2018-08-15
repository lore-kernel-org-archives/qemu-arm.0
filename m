Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp962016wru;
        Wed, 15 Aug 2018 11:04:25 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwqCmOwilpj3GEK8S7pM/vQrJ+R56Astiyl/slERSUdIyBsDgR446k+QfNgYvTOOZL0zJjg
X-Received: by 2002:a37:9704:: with SMTP id z4-v6mr25948267qkd.37.1534356265132;
        Wed, 15 Aug 2018 11:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534356265; cv=none;
        d=google.com; s=arc-20160816;
        b=EX9j/oqJmYbvndoH7qDYTw5yovrZR3dw1vjaJaCkUDkgTXBOLQti3JUYKP4DBUXAHP
         dXud3swf9lwf8iPhqsSE6m35tncWL023hrJJwSnFgF5joHEKszqV5A4PON0+u5XvBmWP
         F8sOrLQDJWGtSyWo/w1LgYH90HwvrNTyS8PUyd7MoRquFFdY4T2QtnqkaM3PUHeB0wBW
         qcloct+1Bdjvjg0ZwiQLKoZmlWUUvmcsLOVilEqvc7AcvyTOAlPaiCeenrHysjk5mS87
         ECLaeZ1Q3E8h+k0JdDYh/vDotAxEyj/W12BD8h+jpxlzHG+AEv/ZQB7btmuKaBdPaC9j
         SWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=mgldz/l4KnqGXY11auFNLD4VzbwDrb7as4pgXCghNqU=;
        b=vOGNwxeuXkr6vJGZqNTgC8LZi4XxOF73VxauoDzljcRzNJg81hDcyjvoZVjVmUm+w0
         OzeSZvElUsXUwM8G/pqvPXoI+mkBSOFCEFfrDWXJKxLIqewrwnFzqFZxDV7uyAQvbhgF
         9bzukpglTt6ewkvJxYIxkIwkSlii2dz6CXa/y1vYAYfnLNW/d30LLqdwumkc7Svtguta
         sce1KramKIzxQm5vDhub7yYOACo4n1118l71JRobdoohYMFL0++LhBX4a3nSRq62NVU2
         NIWR2IBzuneqfOE3fMQhlDncGTCcXYznyhXm5xT+TMj3uNdyAnszLO933h83qaTNy3BJ
         3vRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b4lWHLYg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p13-v6si6794571qvi.256.2018.08.15.11.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 11:04:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b4lWHLYg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fq09g-0001i8-K5
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 14:04:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fq09R-0001gz-KJ
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 14:04:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fq09Q-0003qy-QM
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 14:04:09 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:45536)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fpxm4-0001Tn-Qs
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 11:32:03 -0400
Received: by mail-oi0-x243.google.com with SMTP id q11-v6so2566822oic.12
	for <qemu-arm@nongnu.org>; Wed, 15 Aug 2018 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mgldz/l4KnqGXY11auFNLD4VzbwDrb7as4pgXCghNqU=;
	b=b4lWHLYgefyJ9QQTfe/tOIhc0PZRAx6XdtLDHTdgNhlsqFkevVX4ipcOZ+GlASmCgy
	hVmd9W9KLekV4JY29UqY/e7lusYInKjiXF//YwmoFEqVRJVMqBfD8pPtseBTk5hBt9U7
	9gH/e+P+S7T/8Se6pixVlYKa5V3bXbLJkwG08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mgldz/l4KnqGXY11auFNLD4VzbwDrb7as4pgXCghNqU=;
	b=WXx2hDcqIgIEgTd9aEA/C7avWRhnEOzIgSwvTVMbSAg1wg6bd++PVQIJQR+YJu+6xZ
	PLLvF2VGV0x4lticC3ODZsV/9AREWkH/SsZNHHfz3iO3O2uaJc5sunebzmFleFt/jLd1
	coeLIfvW7T3SMNDc/yeRiABZQcnnIiBwD1cmO9h2jOQpR8p0qLey69xXMdRPCz69FKnI
	nohrK7GGTsURfmQK13/RIx0FQV2rLco9Qsplx9hCG7cAmoGaTxFQyqbwrmPZ6gNDhePH
	PGbR0Ob2wMwpXgTSogchBdzQXfOCVQaSYBR+814+0jwXkQgJsXS69NKHUwAXOf1uAa2N
	pVlQ==
X-Gm-Message-State: AOUpUlGNKNLMXCf80QPGv1bOEVew32EjXUPCMKHN75Kx+IY+Z/nKPuw2
	8dfgLNsnNhxx9uF4+NhiHDzVASVK65aCgSO8BRF9iQ==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr25201083oia.164.1534347088372; 
	Wed, 15 Aug 2018 08:31:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 08:31:07
	-0700 (PDT)
In-Reply-To: <56981299-9424-66b1-9e3b-26bf35f58a82@amsat.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-15-peter.maydell@linaro.org>
	<56981299-9424-66b1-9e3b-26bf35f58a82@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Aug 2018 16:31:07 +0100
Message-ID: <CAFEAcA8nv3hPEEnpv94CPA0n7_hE_dLgvdpfPfQiV8SvnkyOnQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 14/16] hw/dma/pl080: Correct bug in register
 address decode logic
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZzGzr0nhW7WK

On 15 August 2018 at 15:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> On 08/09/2018 10:01 AM, Peter Maydell wrote:
>> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
>> index a7aacad74f0..8f92550392b 100644
>> --- a/hw/dma/pl080.c
>> +++ b/hw/dma/pl080.c
>> @@ -229,7 +229,7 @@ static uint64_t pl080_read(void *opaque, hwaddr offs=
et,
>>          i =3D (offset & 0xe0) >> 5;
>>          if (i >=3D s->nchannels)
>>              goto bad_offset;
>> -        switch (offset >> 2) {
>> +        switch ((offset >> 2) & 7) {
>
> So only the first channel ever worked...

Not even that -- the per-channel registers are in the
0x100..0x200 region, so channel 0's registers start at 0x100.


> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


thanks
-- PMM
