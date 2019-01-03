Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp13491wrt;
        Thu, 3 Jan 2019 15:01:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WZl1HVBITx2GYiArhke5BrHM8iX5kt3BairSeIFqCF+m+5mbKaFeuJbJdejMdHOxvNXF4V
X-Received: by 2002:ac8:320a:: with SMTP id x10mr47644562qta.275.1546556473399;
        Thu, 03 Jan 2019 15:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546556473; cv=none;
        d=google.com; s=arc-20160816;
        b=ikKU0zWcG5haghomw3iB4m8FMdcTICiAST/q0Q3Uef/8Q/22+YW5izZLAyPi1tWtMW
         Y5oZylfFbmEIzTMgcdBD1MchwyJegSrV81ANp9rFdFYCphn1weRK9xjTnyU0ODmX0jkZ
         xA8nheb7rZCiY2DTrKSCiWgLHK9LFG6Sf7PRpsyLQRD47y67Hvs8oUO+R0kACrC3UCSs
         4m4isix2G46uN7POgjFM33xeUOgqcjYJj8HG2porMl2CzCqKcOZHdMWiwh+ZujY39Urh
         RUS5pLHyeUs1uvQ6m7yGYRmHTvqBSReuM3TCtsYKtNCgxpSnixDFjnsDOhAM6YdTVv36
         EwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=llAG0o/Zy8qiSIe7lTdT5c/OKITLbA/7R3sV/imGBv4=;
        b=wNrRgyJbs4aeaHSYkTx07rhV4IrOVrHKk6fTeX+F1KllrsmC0TwgSDeBuFk3fEsF1t
         UCYsyfjiLK2AAyC9KooNc9Y1JYbE15Mts8D0do/bTF9uKGEldd83+rVjrUcafxLsmct0
         xFjx03cnmwZdwPonDKvh2z3ukWYiBneMX9JeHDXz4dKI10IDtcuNdUQJ3ksPBi8jhB0w
         lm5WSiQibKSLYFvP5PsxDMZ0ma7sOSkiTOtsWAAOeYjYfMuTgXKsl1KCwDESpOFfN7BS
         saZ/+mG91rNgCRX7qkbfI7neIfBa6VMP8PQpGua1hb0S2/+3v9RYDmL8XBuDm7UdOvnB
         X2fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sWAcnH8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y31si4588657qvf.184.2019.01.03.15.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 15:01:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sWAcnH8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfBzE-0005aE-Py
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 18:01:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gfByv-0005ZD-Hu
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 18:00:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gfByu-0002wR-LV
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 18:00:53 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50181)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nicholas.a.hudson@gmail.com>)
	id 1gfByu-0002w7-EY; Thu, 03 Jan 2019 18:00:52 -0500
Received: by mail-wm1-x342.google.com with SMTP id n190so30624151wmd.0;
	Thu, 03 Jan 2019 15:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=llAG0o/Zy8qiSIe7lTdT5c/OKITLbA/7R3sV/imGBv4=;
	b=sWAcnH8dQireHNlQquy7aSxoJ3Wirj++QwWCeInFeydG+A29iTg4KoIJSZRvgvYZka
	ebgFpT/2Rw5sdn4OjHkspllQo6X7rrdOYb7sTZJnt7bMYYrCQz07AWLryimcyWmND/FM
	oDZhQAXaYMvhuuK1pvOb6HUXNohQWahAZa312YRWad2XztvviJI/QmCOG564LaV7Kunn
	M3+CvCKg125a+PqjfAvgcwQx64wC9mwpx+A+en92yoxzhA6sUB/gKq/grzVkkAh/hEG8
	g2f/Cyfx7aT6laS9d9E8mx/7JpuIl3eDawDwx7zB526gnXOLK3fvIJzfZCfbExdpu5km
	ij6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=llAG0o/Zy8qiSIe7lTdT5c/OKITLbA/7R3sV/imGBv4=;
	b=oJkS/tBQVG/8Y3zkvgpzna6vYXujGNP3t86biV7ihNNG0hgtkgOGwzhm6t6Kst0dYM
	YJHztW9ZI5/mB9Tsgzx530bfBQsQXyt5ClRxosLqatFexzS8hcUMNRg4h9LwFvYPmrhO
	wPqR2iXxvBIC/jAvWtpbztK/6vxZWCdj+X28wx72Ovw/bgnoGVHQFhhiJpm2uw4txgFt
	zh+GeN22eFz96VevK5sJMTc4XyJEgz+PRw0zyXLBOZdJPCEdAr4hFVINKeIq+e16xUN2
	ip34pjZlefVIUghoC3kSXhR/CfYMw4AE/rk9oTHKo/YTaqYlHNmZYo9qVYd0kpo03gTO
	3kYg==
X-Gm-Message-State: AA+aEWZ4vEwcy8WNkl1DAMh1PC98nv5RUYgJnYc+YXjXPxHXBTL9f0Hw
	ID6Y/Nz9+/wBV5g12VLKfq9GQMJ4
X-Received: by 2002:a1c:c2d5:: with SMTP id
	s204mr42309831wmf.144.1546556451172; 
	Thu, 03 Jan 2019 15:00:51 -0800 (PST)
Received: from ?IPv6:2a02:c7d:8625:5a01:7503:9d7c:2958:5e7d?
	([2a02:c7d:8625:5a01:7503:9d7c:2958:5e7d])
	by smtp.gmail.com with ESMTPSA id
	j8sm103979474wmd.0.2019.01.03.15.00.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 15:00:50 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <975b9131-9937-cfea-3b5d-ef36d0c2b761@gmail.com>
	<CAFEAcA-2tWtEqd-Z0xqNMeocf4rns+FihrAPudiQGz+85HFjJg@mail.gmail.com>
	<7b61db39-7059-6286-2282-b90f45a85faf@gmail.com>
	<CAFEAcA9HkBC4M8vNsHd9M0YrAEYPb=3vd9jj8zkPruMKrtP=mA@mail.gmail.com>
From: Nick Hudson <nicholas.a.hudson@gmail.com>
Message-ID: <b8242fec-0ad1-fcb8-0b99-264f8600a965@gmail.com>
Date: Thu, 3 Jan 2019 23:00:45 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9HkBC4M8vNsHd9M0YrAEYPb=3vd9jj8zkPruMKrtP=mA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v3] Support u-boot noload images for arm as
 used by, NetBSD/evbarm GENERIC kernel.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xKFInOSYeju/



On 03/01/2019 17:27, Peter Maydell wrote:
> On Thu, 3 Jan 2019 at 16:50, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
>> On 03/01/2019 16:20, Peter Maydell wrote:
>>> On Tue, 11 Dec 2018 at 12:27, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
>>>> --- a/hw/arm/boot.c
>>>> +++ b/hw/arm/boot.c
>>>> @@ -30,8 +30,9 @@
>>>>      * Documentation/arm/Booting and Documentation/arm64/booting.txt
>>>>      * They have different preferred image load offsets from system RAM base.
>>>>      */
>>>> -#define KERNEL_ARGS_ADDR 0x100
>>>> -#define KERNEL_LOAD_ADDR 0x00010000
>>>> +#define KERNEL_ARGS_ADDR   0x100
>>>> +#define KERNEL_NOLOAD_ADDR 0x00000000
>>>
>>> If I'm reading the code right, this requests that noload images
>>> are loaded at offset zero into RAM, yes ?
>>
>> Not quite.
>>
>> They're loaded as if the full noload image (including uboot header)
>> was loaded at offset zero, but as load_uboot_image doesn't load the
>> header then the image body (minus the header) is loaded at offset
>> zero + the size of the u-boot header, i.e. 0x40.
>>
>>> That's not a great
>>> choice, because we put our little mini bootloader at offset 0,
>>> and so the two will clash.
>>
>> Fortuntately, the bootloader fits in the space that the uboot header would
>> have occupied.
>>
>> My commit message has
>>
>> "The bootloader fits in the space that the uboot header would have occupied."
>>
>> to try and described this. I could add more of a description if required?
> 
> Ah, I missed that. This seems very fragile to me -- 0x40
> is only 64 bytes, which is 16 instructions. Currently
> our boot loader code is less than that, but only by four
> insns or so, so it's very plausible that some future
> enhancement to the loader code would take it over the 0x40
> boundary, at which point handling of noload images will
> silently fail. At a minimum we should have an assertion
> that we stay below 0x40; but I'm not keen on restricting
> ourselves to 16-instruction bootloaders.

I can add an assertion.

Kernels often like to be 2MiB aligned to allow for more simple
translation tables. This and the fact that  the bootloader hasn't 
changed in 3 years I'd like to kick this can down the road.

> 
> Will a noload image ever in practice also be a Linux kernel
> (ie hdr->ih_os == IH_OS_LINUX) ?

NetBSD/FreeBSD/OpenBSD (ab)use IH_OS_LINUX.  They and Linux

> If not, then we don't lose
> anything by not allowing those to be loaded. (And if anybody
> does in future complain that their image doesn't work, we
> could make it supported by allowing the mini-bootloader to
> be placed elsewhere in RAM.)



> 
> thanks
> -- PMM
> 

thanks,
Nick
