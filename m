Received: by 10.80.163.71 with SMTP id 65csp513406edn;
        Fri, 23 Sep 2016 11:27:59 -0700 (PDT)
X-Received: by 10.200.45.153 with SMTP id p25mr9309498qta.32.1474655279904;
        Fri, 23 Sep 2016 11:27:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q16si6013987qta.8.2016.09.23.11.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 11:27:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnVCZ-0002W3-DL
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 14:27:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bnVCU-0002UT-Lw
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 14:27:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bnVCQ-00013I-4l
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 14:27:53 -0400
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33853)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bnVCP-00011V-Qi; Fri, 23 Sep 2016 14:27:50 -0400
Received: by mail-lf0-f68.google.com with SMTP id b71so5299044lfg.1;
	Fri, 23 Sep 2016 11:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=MPkDh0VZopNq99nPCeDkXuhYy1hYSynT98nDJKeZ7/o=;
	b=o58ipB9aMDNLpTrA7ASfD7sh+ISXQV1XGZzgMvugZcvt9+g3scljmAcfrdZIVU4gIo
	JDg1kd8r/9f8BwWDxXhaSak7XW5vcptQiLFoJ3bl0Yrne9OskPXKoaZISDZOPbN6b5I/
	NoYqbzulmd41HC3TDtRnKRdpVCj6Cq67N1Al7DHSOqJPptTDOQ/xnureWnittnDo+P/H
	hD7IGS6bgvCqWibWSdQ5RiduRwvVY36i+FcPaB25ykMcyKcBSjppvYaTbMb3zRQK0Agt
	/zhDb3Cs28fhz4VDdHMEq60YNj9DecG4WBGOGCHb9sDefvfB3H9bvMWykPfQ0r/w7z+p
	L6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=MPkDh0VZopNq99nPCeDkXuhYy1hYSynT98nDJKeZ7/o=;
	b=YjfdCUpjWqAktpAC271cEcdMalWRoxxzWHC+7a2qWoRE2EfqADXmepdMGa4exPPIrm
	EbRe3CesdnEG9HIbnbhnFsRnaztmRJ5/twSFTph9f63uQ4RC8w8zit22Gg/4uVDNz00r
	0Rn1r9Ou54plU5SRo80uHBxY/BKTvGihHBV2WvVLUpeN1kQB7TzYU/XRto7Kmj4Qiruu
	s/T45AkPinqVJsRp1yt1FKkof9nSqIJ6w0CtUhGqmvfgibf+mEd78bbmlDKGH15KVuk6
	P/OTj956DXJw97WTXs0YHjJYY/WP2pJI6hhzDTZTDRtHRiEH2MF1lkQJ+u0YVLzhxBfv
	Ubfg==
X-Gm-Message-State: AE9vXwPSCmQfcCxS5lEZKGmZCNQQpK8OMWfMjOgP1sFP2hfUeYYWZdOprH79fmgrv1wpOQ==
X-Received: by 10.46.32.227 with SMTP id g96mr3296480lji.30.1474655208709;
	Fri, 23 Sep 2016 11:26:48 -0700 (PDT)
Received: from [192.168.75.104] (89-70-149-145.dynamic.chello.pl.
	[89.70.149.145]) by smtp.gmail.com with ESMTPSA id
	f65sm1401504lji.32.2016.09.23.11.26.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 11:26:47 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<2c52c156-2a32-b437-acd2-af13faaef55d@kaod.org>
	<CAFEAcA_MOhS04HiAVWg5xB8xBQ=krfZC6OBnH+X7UBo2_rf1uA@mail.gmail.com>
	<673755bd-c971-eb34-99b6-ac874a0d9a98@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <78e298ed-b182-0fdf-99b7-de0324665b33@gmail.com>
Date: Fri, 23 Sep 2016 20:26:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <673755bd-c971-eb34-99b6-ac874a0d9a98@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.68
Subject: Re: [Qemu-arm] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B93kRVAeRvVk

Hi Cedric,

W dniu 23.09.2016 o 10:28, Cédric Le Goater pisze:
> On 09/23/2016 10:17 AM, Peter Maydell wrote:
>> On 23 September 2016 at 08:19, Cédric Le Goater <clg@kaod.org> wrote:
>>> But the goal is to boot from the device, so I added a memory region alias
>>> at 0 to trigger the flash module mmios at boot time, as this is where
>>> u-boot expects to be.
>>>
>>> and I fell in this trap :/
>>>
>>>          aspeed_smc_flash_read: To 0x0 of size 1: 0xbe mode:0
>>>          Bad ram pointer (nil)
>>>          Aborted (core dumped)
>>>
>>> There is a failure in get_page_addr_code(), possibly because qemu uses
>>> byte per byte reads of the code (cpu_ldub_code). But this is beyond my
>>> understanding of qemu's internal.
>> This is a bug in how we report the problem, but the underlying
>> issue here is attempting to execute from something that's not RAM
>> or ROM. You can't execute code out of something backed by MMIO.
> OK. So I see two solutions. T
>
> The "brutal" one which is to copy the flash contents in a rom blob
> at 0, but there is still an issue in getting access to the storage
> anyhow, as it is internal to m25p80. Or we should get the name of the
> backing file of the drive but I am not sure we are expected to do
> that as I don't see any API for it.
>
> The other solution is something like this patch which lets the storage
> of the flash device be assigned externally.
Since I do not like dirty hacks in the code, I want just to suggest a 
workaround,
that probably you will not like ;]

As Qemu expects that first running code will be in ROM or RAM memory,
you can implement in your board -bios option that you will use to
pass u-boot binary to rom memory, or even use generic loader functionality
when it reach master.

Thanks,
Marcin

> Thanks,
>
> C.
>
>

