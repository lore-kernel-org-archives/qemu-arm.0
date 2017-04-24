Received: by 10.25.0.144 with SMTP id 138csp1523287lfa;
        Mon, 24 Apr 2017 10:54:22 -0700 (PDT)
X-Received: by 10.200.53.54 with SMTP id y51mr30055285qtb.45.1493056462527;
        Mon, 24 Apr 2017 10:54:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h25si18036162qtc.247.2017.04.24.10.54.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Apr 2017 10:54:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d2iBq-0006gB-0h
	for alex.bennee@linaro.org; Mon, 24 Apr 2017 13:54:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1d2iBl-0006f2-Lk
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 13:54:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1d2iBk-0006Z2-MJ
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 13:54:17 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:36235)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1d2iBh-0006XK-7W; Mon, 24 Apr 2017 13:54:13 -0400
Received: by mail-oi0-x229.google.com with SMTP id w12so32273454oiw.3;
	Mon, 24 Apr 2017 10:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WPj0Gngs0/KM1Zf7MqYpZ9x2x2enx0rYEseBkTWzjDg=;
	b=qlnzwcCVsJfVzn15hH0u3gpDfLHd8dIDSGsYSw6DpeG2MXYkazukjCjxaQ+iKZvpnv
	T7uQ5XuPN0+ouNHaQhGcQVZQKNHgFN1JmUkUb6WXBpmrkUax8+DlPS7cUqnXpN5J7LBJ
	UX2DEjDH+d7LLJwHBFj1oPJ6nfi3nPKtHRJZiIoM3g60p7QOWJ/S77HLa0+I2IJCs+QV
	697MYo6NVc/KUTWh4IcyY64AB6P4q28dcBZI8NMF2pBq3eHo3M2cfph9wvSxDFOq7lhR
	z9++cmxwCnrdwEN1E8Ekbj2PF9SDcXYFUOOKYbFCc/SkeWyrW5j1ynYOIMcyro7M6HR3
	69ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WPj0Gngs0/KM1Zf7MqYpZ9x2x2enx0rYEseBkTWzjDg=;
	b=HUSyhLDJMXPH8EXyclcSa2HHzucViEH/sCAiramznH6HXBmn+3lOva/IWd0URMKjxu
	e2A/N1gtC32Dr8jbAXxWEn3UhRhj77DBengyI7z4PG0vngV/R4nPDY8Rs+mjTUyPaVC7
	PHZnyWHPpUDtSB131COuYXyz8gYkUBq5qIEOHuzqxvvFmBJg6jRKhIed3FuowX1ikpBl
	1Eh3EjBIsPtXD5fgiU4r76SSJGFsEJpJvbXb3dnQkrUCYkZrXA1Cxf21xgGsBunY5bMv
	NRPs8amrBfW8oMHVRVAzFlYS2F45tZ30Cd7i2pzQBAvjllE0tlZQ+FE8LJ4AY16MaxDg
	jSNw==
X-Gm-Message-State: AN3rC/6/yP3OdlAgbEULFXw0xOwpWNC/yqE2SQlFLaHe9T4VydFK35CS
	CBKNxVIq2A45nAWMQ3M9PENW25fGKw==
X-Received: by 10.202.239.134 with SMTP id n128mr12257423oih.93.1493056452250; 
	Mon, 24 Apr 2017 10:54:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.44.229 with HTTP; Mon, 24 Apr 2017 10:53:41 -0700 (PDT)
In-Reply-To: <CALHRZuo3s-NRXPpJvfkkaf7FzNoyv2uSmox-nhycSz1x+r6fGg@mail.gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
	<1491736758-19540-5-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKPAwL27-ina2X4DUJ-x_POTqRdf5HAr1mNUVYQBeUAjPQ@mail.gmail.com>
	<CALHRZuo3s-NRXPpJvfkkaf7FzNoyv2uSmox-nhycSz1x+r6fGg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Apr 2017 10:53:41 -0700
Message-ID: <CAKmqyKOMyR+DH8F4OUgZjzeM-CmXVurwQwWKGKLOUj68jAuzqw@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel RFC v2 4/4] msf2: Add
 Emcraft's Smartfusion2 SOM kit.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0PsYrJB/Eiic

>>
>> Instead of calling all of these in the init function you should split
>> it up over the machines init and realize function.
>>
>> Look at the stm32f205_soc or xlnx-zynqmp files for examples of how to do this.
>>
>> It also moves away from calling qdev_create() and qdev_init_nofail()
>> and instead manually creates the objects.
>>
> I am still learning all these. Please correct me if am wrong.
> I need to create a SoC file and a board file like stm32f205 and
> xlnx-zynqmp now right?

Hey Sundeep,

I don't think you have to do it like that. I think for some
SoCs/boards it makes sense. For example the ZynqMP SoCs are included
on multiple different boards (EP108 and ZCU102) so it makes sense to
have a SoC and a board separately defined. On the other hand if you
had a SoC that is always on the same board it doesn't make as much
sense.

It is probably is a good idea to split it between a board and an SoC
unless you have a good reason not to though.

Thanks,

Alistair

>
>> Otherwise this patch looks pretty good.
>
> Thank you :)
> Sundeep
>
>>
>> Thanks,
>>
>> Alistair
>>
>>> +}
>>> +
>>> +static void msf2_machine_init(MachineClass *mc)
>>> +{
>>> +    mc->desc = "SmartFusion2 SOM kit from Emcraft";
>>> +    mc->init = msf2_init;
>>> +}
>>> +
>>> +DEFINE_MACHINE("smartfusion2-som", msf2_machine_init)
>>> --
>>> 2.5.0
>>>
>>>
