Received: by 10.80.163.71 with SMTP id 65csp1357605edn;
        Mon, 26 Sep 2016 01:26:37 -0700 (PDT)
X-Received: by 10.55.159.141 with SMTP id i135mr3823911qke.60.1474878397126;
        Mon, 26 Sep 2016 01:26:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g19si13821781qta.42.2016.09.26.01.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Sep 2016 01:26:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=greensocs.com
Received: from localhost ([::1]:42230 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1boRFE-0002TQ-EE
	for alex.bennee@linaro.org; Mon, 26 Sep 2016 04:26:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>) id 1boRCq-0000Hs-Ky
	for qemu-arm@nongnu.org; Mon, 26 Sep 2016 04:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>) id 1boRCl-0002Xn-7V
	for qemu-arm@nongnu.org; Mon, 26 Sep 2016 04:24:07 -0400
Received: from greensocs.com ([193.104.36.180]:56946)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>)
	id 1boRCk-0002Wx-MI; Mon, 26 Sep 2016 04:24:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4E01548B9;
	Mon, 26 Sep 2016 10:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1474878240;
	bh=1sOXonXeaYFiXfXaOEkAtg0QxAW1f+WduYWNMJsnkWc=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=0TuTauW7e/HMyE1SFgBBtzRbLisZXas8xvRvstB3xm0eUTXgRXn7njEKfUBW8dNoS
	+odJOYBlzvIZxjSVK6Hqgz7bRiVyQbIv4Z9yL9sB+cerYAOJPTYIWB9ecyXYnYXfup
	bjYuwIvpfjKxbOGGuowSq9W9q0oUtdKU0t34+BjM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=bnZVsyDa;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tpshfM5A
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74gRNl9oeTWV; Mon, 26 Sep 2016 10:23:59 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 2D8BF432A83; Mon, 26 Sep 2016 10:23:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1474878239;
	bh=1sOXonXeaYFiXfXaOEkAtg0QxAW1f+WduYWNMJsnkWc=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=bnZVsyDaZbOFlB8AW2WrnI9eHkiAC0yPXUNVzayHQs8afm2FT4c6mJPYES/qpgEx8
	aLdS5ATLIoHlUPvTydVKiAvwpIAiqNLUIn4frZ0ealj/uEAWjpEAj3YbiNQfu5QTtf
	Cz7oL5g5uLZXRMWZTk01sqtDKScPyFxVj27DIPyE=
Received: from [127.0.0.1] (localhost [IPv6:::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: fred.konrad@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 29AF948B9;
	Mon, 26 Sep 2016 10:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1474878238;
	bh=1sOXonXeaYFiXfXaOEkAtg0QxAW1f+WduYWNMJsnkWc=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=tpshfM5AgeW05lk/1MsfMwnQFvZg5ogw7jN0FtEzBH5jqqq3lTPhMAcssAvUJyrkZ
	ThoCcsutm5Wr3hN/E3Lja/YasSkEnGTl2GMuMNvNNsRZZ2PfEFjoWDjuOlqxd4o0x4
	hy8XXuFpL2ibHtYJrthOnejsofxm0qsuDkhkuXNk=
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<2c52c156-2a32-b437-acd2-af13faaef55d@kaod.org>
	<CAFEAcA_MOhS04HiAVWg5xB8xBQ=krfZC6OBnH+X7UBo2_rf1uA@mail.gmail.com>
	<673755bd-c971-eb34-99b6-ac874a0d9a98@kaod.org>
	<78e298ed-b182-0fdf-99b7-de0324665b33@gmail.com>
	<723852a7-a5ab-9acb-cea9-4a5637b8eada@kaod.org>
	<20160924085505.GA5931@toto>
From: KONRAD Frederic <fred.konrad@greensocs.com>
Message-ID: <0e9974da-2523-25a0-7c66-fa178f84818b@greensocs.com>
Date: Mon, 26 Sep 2016 10:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160924085505.GA5931@toto>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/7] m25p80: add a
 m25p80_set_rom_storage() routine
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	mark.burton@greensocs.com, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, "mar.krzeminski" <mar.krzeminski@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x5tfhriDNCyJ



Le 24/09/2016 =E0 10:55, Edgar E. Iglesias a =E9crit :
> On Sat, Sep 24, 2016 at 10:25:39AM +0200, C=E9dric Le Goater wrote:
>> On 09/23/2016 08:26 PM, mar.krzeminski wrote:
>>> Hi Cedric,
>>>
>>> W dniu 23.09.2016 o 10:28, C=E9dric Le Goater pisze:
>>>> On 09/23/2016 10:17 AM, Peter Maydell wrote:
>>>>> On 23 September 2016 at 08:19, C=E9dric Le Goater <clg@kaod.org> wr=
ote:
>>>>>> But the goal is to boot from the device, so I added a memory regio=
n alias
>>>>>> at 0 to trigger the flash module mmios at boot time, as this is wh=
ere
>>>>>> u-boot expects to be.
>>>>>>
>>>>>> and I fell in this trap :/
>>>>>>
>>>>>>          aspeed_smc_flash_read: To 0x0 of size 1: 0xbe mode:0
>>>>>>          Bad ram pointer (nil)
>>>>>>          Aborted (core dumped)
>>>>>>
>>>>>> There is a failure in get_page_addr_code(), possibly because qemu =
uses
>>>>>> byte per byte reads of the code (cpu_ldub_code). But this is beyon=
d my
>>>>>> understanding of qemu's internal.
>>>>> This is a bug in how we report the problem, but the underlying
>>>>> issue here is attempting to execute from something that's not RAM
>>>>> or ROM. You can't execute code out of something backed by MMIO.
>>>> OK. So I see two solutions. T
>>>>
>>>> The "brutal" one which is to copy the flash contents in a rom blob
>>>> at 0, but there is still an issue in getting access to the storage
>>>> anyhow, as it is internal to m25p80. Or we should get the name of th=
e
>>>> backing file of the drive but I am not sure we are expected to do
>>>> that as I don't see any API for it.
>>>>
>>>> The other solution is something like this patch which lets the stora=
ge
>>>> of the flash device be assigned externally.
>>> Since I do not like dirty hacks in the code, I want just to suggest a
>>> workaround, that probably you will not like ;]
>>
>> It's a feature ! :)
>
> CC: Mark and Fred
>
> I agree, I think these are fair attempts to try to solve a real problem=
.
>
>
>> I am just trying to find a solution to this issue. So, we could also
>> introduce a routine :
>>
>> +uint8_t *m25p80_get_storage(DeviceState *dev, uint32_t *size)
>> +{
>> +    Flash *s =3D M25P80(dev);
>> +
>> +    *size =3D s->size;
>> +    return s->storage;
>> +}
>>
>> and use rom_add_blob_fixed() with the return values. Maybe this is les=
s
>> intrusive in the m25p80 device model flow. Thoughts ?
>>
>>> As Qemu expects that first running code will be in ROM or RAM memory,
>>> you can implement in your board -bios option that you will use to
>>> pass u-boot binary to rom memory, or even use generic loader function=
ality
>>> when it reach master.
>>
>> but if we use -bios <file> to have a ROM, we will need to pass a secon=
d
>> time <file> as a drive to have a CS0 flash slave:
>>
>> 	-bios "flash-palmetto-test"  \
>> 	-drive file=3D"flash-palmetto-test",format=3Draw,if=3Dmtd \
>> 	-drive file=3D"palmetto.pnor",format=3Draw,if=3Dmtd
>>
>> This feels awkward. The virt platform and vexpress forbid that for
>> instance.
>>
>> Are there any other platform with similar need ?
>
> Yes, ZynqMP has a linear memory mapping of SPI memory contents. It gets
> slightly more complicated there as the mapping supports various modes
> including parallel SPIs with striping done by the controller (i.e
> bytes as seen via the linearly mapped area are interleaved from multipl=
e
> SPI memories).
>
> So a plain RAM mapping of m25p80_get_storage won't work.
>
> A ROM version of the linear data might work at controller level. The co=
ntroller
> would have to populate the ROM area at startup (slow) and keep it in sy=
nc for all
> writes. We would also need to signal write events so that TCG can flush=
 it's
> caches. TCG only keeps track of modifications being made to cached code=
 if changes
> are done with writes to RAM area (not if they happen indirectly via oth=
er registers).
>
> Another solution is to implement support in TCG to execute from MMIO ma=
pped areas.
> We'd also need to solve the problem of signalling content changes to TC=
G.
>
> I think these approaches have some overlap. Personally, I think TCG exe=
cuting from
> MMIO areas would be quite useful. It's also useful for QEMU & SystemC i=
ntegration.

Hi,

The solution we are preparing for this is to allow a MMIO region to=20
execute code as Edgar just suggested by adding two callbacks:
   - one which allows to get a pointer from an MMIO region nothing if
     execution is not possible from it and some hint to know if it's
     readable, writable.
   - one function to "invalidate" the pointer which will flush the tb,
     etc.

We have fixed a second issue fairly linked to this: if we do a DMA=20
access to the MMIO areas it is split in 1,2,4 bytes transaction which is=20
really slow.

Thanks,
Fred
>
> Best regards,
> Edgar
>
