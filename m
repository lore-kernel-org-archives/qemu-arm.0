Received: by 10.182.158.201 with SMTP id ww9csp368766obb;
        Fri, 11 Dec 2015 15:09:39 -0800 (PST)
X-Received: by 10.55.207.73 with SMTP id e70mr26616866qkj.77.1449875379892;
        Fri, 11 Dec 2015 15:09:39 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d70si5252974qkb.34.2015.12.11.15.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Dec 2015 15:09:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:49812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7Wol-0001WL-Hq
	for alex.bennee@linaro.org; Fri, 11 Dec 2015 18:09:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a7WoQ-0001D7-0p
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 18:09:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a7WoP-00065c-6r
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 18:09:17 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:36710)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a7WoP-00065U-1F
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 18:09:17 -0500
Received: by vkay187 with SMTP id y187so124859304vka.3
	for <qemu-devel@nongnu.org>; Fri, 11 Dec 2015 15:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8n6IdRCGntsHoctZwVnxPWETBNRIaEFWHnln9tZjh48=;
	b=oxYBYgY7b7uK1GTF8Th/nYAX/+TKD6WVFDeb+z2hXCxRzb7931vjwdTbWJ7Dj9NaMK
	JdU/GHNGLJgJD/Ctw2K5+yab+tS66V+QHk2kC67FCl/5FT3A3WG8e1PapO4AlwKca6TF
	141547W2ekg3WRHi970T4nTtPIChI3BYFkrknvkeobOW4QR3Ao6iWKJ0a1Cut82Bu8fi
	i7Wuxs7T9C+LBpcNJ5bcHDNW96I3GOFszqMe+yV8Std5Kmaw0ZMx/lWgcPQ1p7SZUfVL
	RQjnO83UeoVfp3/8LEg7pFvxQuvTKfmEJJjyV0E2rWB16Ec0vnk5CBe4goEzQPDDxsIT
	o4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8n6IdRCGntsHoctZwVnxPWETBNRIaEFWHnln9tZjh48=;
	b=PlQO/UwtSzVNmYZBOCAWYdUhgz5e2ZiquqsJL1d9e8CgukY3LnxhZ1UFgFs7aOjCvY
	iHrv1lRsJRWl9wObH/xlhAUsHihvvXbKnhRWBqfIxYNeFSEy7Yf58WBRkkNg0QmXdcK/
	BXG6Mq2OBVALdgXti1CTsk6IRGnwmCpiZ7hLGO2XyE4AVWnNSBRCOOwqW9n2OdYqr4Qi
	LX4aUY0EwYnA9Qf2H3+DNqvUXFb4he4rvRVpEeCeflxQ/ImKK13RGL9R1cXzU8SUF6Yh
	9DxWF/PAY3/Auo0X67hdAy0UzR47Zcx+b1jrc8bjLl3koiGfFVWnlTiAgx8o42q4sE/8
	p6hA==
X-Gm-Message-State: ALoCoQnGvu1zSxSLC45tIflyQdwQO25VnyfKbRdc8ZlsGf2UFeQHu2xmEUFZGjKz+CbBUbvhcNIrW5HPrYfGZebG+whe/xDVrZCmCgnH3L/jS7cZkQZNl0o=
X-Received: by 10.31.16.67 with SMTP id g64mr2175745vki.139.1449875356542;
	Fri, 11 Dec 2015 15:09:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 11 Dec 2015 15:08:56 -0800 (PST)
In-Reply-To: <20151211190115.GA5710@morn.lan>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-6-git-send-email-peter.maydell@linaro.org>
	<20151211190115.GA5710@morn.lan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2015 23:08:56 +0000
Message-ID: <CAFEAcA_Th8_kqfG+hNGY-p1GpObTokgJ6Tf37i-4SQmv+kta4Q@mail.gmail.com>
To: "Kevin O'Connor" <kevin@koconnor.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 05/10] hw/sd/sdhci.c: Update to use SDBus
	APIs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /Im15On+Faja

On 11 December 2015 at 19:01, Kevin O'Connor <kevin@koconnor.net> wrote:
> On Fri, Dec 11, 2015 at 04:37:06PM +0000, Peter Maydell wrote:
>> Update the SDHCI code to use the new SDBus APIs.
>>
>> This commit introduces the new command line options required
>> to connect a disk to sdhci-pci:
>>
>>  -device sdhci-pci -drive id=mydrive,[...] -device sd,drive=mydrive
>
> I can't review in depth right now, but I did notice
>
> [...]
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -55,6 +55,9 @@
>>          } \
>>      } while (0)
>>
>> +#define TYPE_SDHCI_BUS "sdhci-bus"
>> +#define SDHCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_PXA2XX_MMCI_BUS)
>
> the above PXA2XX typo

Oops. We never actually use this macro, so I didn't notice the
cut-n-paste error.

> [...]
>> @@ -1303,6 +1323,7 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
>>      memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
>>              SDHC_REGISTERS_MAP_SIZE);
>>      sysbus_init_mmio(sbd, &s->iomem);
>> +
>>  }
>
> and the above white space damage.

Will fix.

thanks
-- PMM
