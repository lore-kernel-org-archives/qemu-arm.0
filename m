Received: by 10.223.159.82 with SMTP id f18csp652316wrg;
        Wed, 22 Nov 2017 13:06:32 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYOKYuJt7Gl0jgjxmIbWTe+BmAlXIL+tp8lI1hmhDzL7GnHTspU6ms3IP5YyXEix3aHMgLB
X-Received: by 10.37.15.194 with SMTP id 185mr14067719ybp.458.1511384792702;
        Wed, 22 Nov 2017 13:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511384792; cv=none;
        d=google.com; s=arc-20160816;
        b=rNQoMVoeY3eO26sLw3ZhDRSuFnSikCMFKQiJTzKO34J1AX/ap75zz5iHC5zApdlsSB
         vXlewKxYQdoSH1MQLKji+5pY/LqiYTqXEGtjRiD0zJyzJpvsP6dEUFKFyHqDZBRrqaNx
         k9nAcWMm804M7ZWzgx/ALdYfvpPrCMdoRBYhP5QXBoq95nSRkOwjWHpbbpkboyAKCnrs
         Rk7QVzeBq7vCC2e4yZ1YL2IAbjECmhhXlgLdsV+WwIeGOIMfWRoBb/9eammwgzKO8cRp
         5uKkap/OELoryNv7WkI9KDKjDbE1/pDs/wjaWuKpJaY+mUD+2eGgN2C4Qz8f88EiQA43
         QZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=mkulI/qLITdgshYS9eX9d9HEY2zS8oQiiA9G83NJusw=;
        b=UrL0MLRzcodnVme60GgUdsAynt2F8VZjp5Mt1Pe2XquFvPDjNGHY/MftzOD/MvKpvO
         nCsRDx5IlwWbuKtFC/ZkiCaoCiWlvJ8yHoxAkdRUemzZM7owAwohR5B2VHcl2J+JKZPZ
         PSNEqDhBxdjjM6zZd+1LmZBkTCsZ46xmxX9Z24V4Ng27Xud6Yca2ahNA2y6O9IkZTVa9
         Cf/wzk5SD3El+z7fR/2LCllIAKbN3N/iGJ20KVeaMyMSMar3ucX0tybHNsIBcVSdh1l1
         0XyROAA1lHLcXG3/+6Qhql6nyInN9HBxKnCkSyFYkbFvegrgggbtL8bQ7QX+vsV4yvJD
         P85w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MYyZattt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b2si3421674ybn.199.2017.11.22.13.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 13:06:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MYyZattt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHcE4-0006Ci-53
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 16:06:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHcDu-0006CQ-Qc
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 16:06:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHcDt-0004aK-Ru
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 16:06:22 -0500
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:42969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHcDt-0004a1-No; Wed, 22 Nov 2017 16:06:21 -0500
Received: by mail-qt0-x235.google.com with SMTP id j12so3832232qtc.9;
	Wed, 22 Nov 2017 13:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mkulI/qLITdgshYS9eX9d9HEY2zS8oQiiA9G83NJusw=;
	b=MYyZatttGRw9pFaHHPwMaFiE14hv6vVLA1PMLJ4TeUVJevFtkvboxh9jOe8EoT1lJ6
	0Pz6qX/4jkbax2058DZ/ysDZQaEViQQ2Nz5YzQuPflj0+lfFX1CvmvM69rAE52c0hzK7
	S5tgvmH+mxrd2YaG6fSp7Hxw4VogTL8jg+rAuM6lcPdxTL83uuxLyp2/0CL+gs1CD+oW
	mJBRJJvMXWYZTxA2epTdvpRQS2dHMkVshPs602Ax0Rjc+MHxJYmluRiHXm7EEURarmHQ
	pBSa341DrwnRMbUyf5yv+KTUib0HHY6Vg4FUeVvOXhZqvi0RkWZu/IE0UWx5KdMEEl36
	e9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mkulI/qLITdgshYS9eX9d9HEY2zS8oQiiA9G83NJusw=;
	b=My6rufhekRnIVRAUhhpvS2nBTI5hPH5xqfMJV15AuRSdqDHsQEO3OEpTmCvbMmdyjR
	Qk66VMKoeXl6+jwDmtRLbD3DBEkmrbXwuaWjVIgBrh8w8phfUFRAzOg8VmuuD1yQslQL
	/5ik6yAnLcYz0n9R0abWUA1mT1wT1AMHBQazh5iqLKNz2P65/2ZzP2TWcOglLDZ/NOYE
	uxg5BHfKVW6dfCQ3UstwXla1LlEJjfnffiF7b2ySEVYIiO25TDtXXZiY3XHjxjAPOZnq
	/5ZfTpRpnOrnzghkG6I+7R3JYUVf2Ojaj7OkQzZOI8e/zALb2wPmjjy9lYQUVxQvbU88
	z0xw==
X-Gm-Message-State: AJaThX4GxTNMipumY9vOWI5ZoN6yrUqNGGtNqLIWejlljmapEokYv1Dr
	WZfkCdULQqFZqS7pFWswgd5hNVGerbF7a9dxkBU=
X-Received: by 10.200.35.182 with SMTP id q51mr32895907qtq.302.1511384781082; 
	Wed, 22 Nov 2017 13:06:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 13:06:20 -0800 (PST)
In-Reply-To: <CAFEAcA-NHA1Pya+p659F3ZWXvcwbA3SRJTb1tPzzqW2mzytSxw@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-14-andrew.smirnov@gmail.com>
	<CAFEAcA-NHA1Pya+p659F3ZWXvcwbA3SRJTb1tPzzqW2mzytSxw@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 13:06:20 -0800
Message-ID: <CAHQ1cqG4hn2wbXRUAK-BnOafzmqLKSHLJaNVdKPrVv+p2jMRpw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-arm] [PATCH v3 13/30] i.MX: Add code to emulate i.MX7 CCM,
 PMU and ANALOG IP blocks
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
X-TUID: MqFa0h84aGgm

On Tue, Nov 21, 2017 at 10:08 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
>> Add minimal code needed to allow upstream Linux guest to boot.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/misc/Makefile.objs      |   1 +
>>  hw/misc/imx7_ccm.c         | 233 ++++++++++++++++++++++++++++++++++++++=
+++++++
>>  include/hw/misc/imx7_ccm.h | 130 +++++++++++++++++++++++++
>>  3 files changed, 364 insertions(+)
>>  create mode 100644 hw/misc/imx7_ccm.c
>>  create mode 100644 include/hw/misc/imx7_ccm.h
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index 29fb922cef..ac1be05a03 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -34,6 +34,7 @@ obj-$(CONFIG_IMX) +=3D imx31_ccm.o
>>  obj-$(CONFIG_IMX) +=3D imx25_ccm.o
>>  obj-$(CONFIG_IMX) +=3D imx6_ccm.o
>>  obj-$(CONFIG_IMX) +=3D imx6_src.o
>> +obj-$(CONFIG_IMX) +=3D imx7_ccm.o
>>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-hpdmc.o
>>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-pfpu.o
>>  obj-$(CONFIG_MAINSTONE) +=3D mst_fpga.o
>> diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
>> new file mode 100644
>> index 0000000000..2876164cfa
>> --- /dev/null
>> +++ b/hw/misc/imx7_ccm.c
>> @@ -0,0 +1,233 @@
>> +/*
>> + * Copyright (c) 2017, Impinj, Inc.
>> + *
>> + * i.MX7 CCM, PMU and ANALOG IP blocks emulation code
>
> Should these really all be in one single device rather
> than one device per IP block ?
>

They all share the same register write semantics,
imx7_set_clr_tog_write, so I'd like to keep them in the same file. But
other than that, they can be split into all sorts of configurations.
As far as memory map in i.MX7 RM is concerned "CCM" and "Analog" are
distinct register files where the rest of them ("digiprog", "pmu") are
"sub-blocks" of those two (or at least that's my interpretation). I'll
change v4 to have that split.

If you want me to convert every block _and_ sub-block into a
standalone device, let me know.

Thanks,
Andrey Smirnov
