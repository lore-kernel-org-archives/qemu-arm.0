Received: by 10.25.21.156 with SMTP id 28csp2713814lfv;
        Mon, 1 Aug 2016 09:16:35 -0700 (PDT)
X-Received: by 10.200.40.36 with SMTP id 33mr89354935qtq.53.1470068195556;
        Mon, 01 Aug 2016 09:16:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v38si20439597qtv.38.2016.08.01.09.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 09:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUFtL-00071c-1Q
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 12:16:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bUFtG-00071R-6G
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 12:16:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bUFtD-0001uC-RJ
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 12:16:29 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bUFtD-0001u1-Mm; Mon, 01 Aug 2016 12:16:27 -0400
Received: by mail-oi0-x244.google.com with SMTP id d204so14243087oig.3;
	Mon, 01 Aug 2016 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=prX4GIjmt5zHRdIBGdypwkLjxm6kM5J7XOdJbO4VL8U=;
	b=xKr6vgsDu4FHb3nbxJmGOZnzdvlKwliawQHLvSHgc9jOHskTNkZnUia+Yt7F06GIF5
	7NHY0ptCZO6qmfp8ACllIRYoGxDfzWqVkrs3LmHthcgUxsj7p/xQ6+lOQtUIRF7ja0Ch
	Fbys8EAR81zAZ9/87zynMNpNihDMX0yOb34Wyad6qPFYoW3atucD1WyQcga/0TmrFgMT
	cUn2/i9KCwp8aQp+2O6bskz3r1X/o9OPEQNSatA/RpHIZsdB+8iaAx3RyRWXkH/BBZxo
	goKnfsu0ShjehgnHvQ27YBGpIpxaWNNazVwAz/mgCn1QL0odsefYIoWrEeu0USj7p0+e
	C0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=prX4GIjmt5zHRdIBGdypwkLjxm6kM5J7XOdJbO4VL8U=;
	b=gJzru8TxrTMNw7Wedet67NTM0Ce61KlA8cz3PlE+Y+Xfyp5Tos1hVoAdX45NPI7XRm
	up3/a2XIS7N+Y3kRtLK9/CRdLeuGo9HS5PnPMFFeCI9v5T021gT+Ijze27yoh1TWuqQ+
	tVXdD1v6gd3OQgQbZIa/QJJZCA934Phl1YTmFq+MmJVEHHJpdqKpIFePJM6VVkOYp+Wt
	V0pntv62z/JCXljIvbLSlop+oWQouRxHiXVUsom20l5oJVIRsbyebik0d2d++oOI1Kza
	wrlvKX/PJPT8PjbuCI+9BKc2oTT+aTadtaeZoJSHJA5+IJVf2LAhPsC0KNzspqJs6ejx
	dtgQ==
X-Gm-Message-State: AEkooutJQGcBOQccAzu4Mn0PbDuucf9CpycSrQKeh9G+uqhNhUWv8dW+rd0u13BxkyYJSRlmXKOskYf7K5FVTQ==
X-Received: by 10.202.175.195 with SMTP id y186mr35119947oie.44.1470068187212; 
	Mon, 01 Aug 2016 09:16:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Mon, 1 Aug 2016 09:15:57 -0700 (PDT)
In-Reply-To: <CAFEAcA91DY4=MgXHC22rNogqPLiUqL+1oDis5mkuFGPkstKNeQ@mail.gmail.com>
References: <69992ebef8db49ddc320cd9f5d9a60c95c593aa7.1467752513.git.alistair.francis@xilinx.com>
	<CAFEAcA91DY4=MgXHC22rNogqPLiUqL+1oDis5mkuFGPkstKNeQ@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 1 Aug 2016 09:15:57 -0700
X-Google-Sender-Auth: QsZvYLCjzwdJV70uCMnbpcI6wl4
Message-ID: <CAKmqyKNxw1v=qsu3hKezNU=KfsLT+yogJcsnxBQBZ3Nkxzu53Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] MAINTAINERS: Update the
 Xilinx maintainers
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T0TaD1mbEJeZ

On Mon, Aug 1, 2016 at 7:32 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 28 July 2016 at 17:55, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> Update the Xilinx maintainers documentation to simplify what we maintain
>> and cover all of our upstream code.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Mailing list seems not to have got this one second time
> around either -- maybe some spam filter dislikes the content
> for some reason. Anyway, applied to master.

I have had this problem a few times now. No idea why it doesn't make
it to the list.

Thanks for applying.

Alistair

>
> thanks
> -- PMM
>
>
>> ---
>>
>>  MAINTAINERS | 30 ++++++++++++++----------------
>>  1 file changed, 14 insertions(+), 16 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1d0e2c3..14183d3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -449,23 +449,23 @@ S: Maintained
>>  F: hw/*/versatile*
>>
>>  Xilinx Zynq
>> +M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>  M: Alistair Francis <alistair.francis@xilinx.com>
>> -M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>>  L: qemu-arm@nongnu.org
>>  S: Maintained
>> -F: hw/arm/xilinx_zynq.c
>> -F: hw/misc/zynq_slcr.c
>> +F: hw/*/xilinx_*
>>  F: hw/*/cadence_*
>> -F: hw/ssi/xilinx_spips.c
>> +F: hw/misc/zynq_slcr.c
>> +F: include/hw/xilinx.h
>> +X: hw/ssi/xilinx_*
>>
>>  Xilinx ZynqMP
>>  M: Alistair Francis <alistair.francis@xilinx.com>
>> -M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> +M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>  L: qemu-arm@nongnu.org
>>  S: Maintained
>> -F: hw/arm/xlnx-zynqmp.c
>> -F: hw/arm/xlnx-ep108.c
>> -F: include/hw/arm/xlnx-zynqmp.h
>> +F: hw/*/xlnx*.c
>> +F: include/hw/*/xlnx*.c
>>
>>  ARM ACPI Subsystem
>>  M: Shannon Zhao <zhaoshenglong@huawei.com>
>> @@ -948,14 +948,6 @@ S: Supported
>>  F: hw/scsi/megasas.c
>>  F: hw/scsi/mfi.h
>>
>> -Xilinx EDK
>> -M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>> -M: Alistair Francis <alistair.francis@xilinx.com>
>> -M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> -S: Maintained
>> -F: hw/*/xilinx_*
>> -F: include/hw/xilinx.h
>> -
>>  Network packet abstractions
>>  M: Dmitry Fleytman <dmitry@daynix.com>
>>  S: Maintained
>> @@ -1243,6 +1235,12 @@ F: docs/*qmp-*
>>  F: scripts/qmp/
>>  T: git git://repo.or.cz/qemu/armbru.git qapi-next
>>
>> +Register API
>> +M: Alistair Francis <alistair.francis@xilinx.com>
>> +S: Maintained
>> +F: hw/core/register.c
>> +F: include/hw/register.h
>> +
>>  SLIRP
>>  M: Samuel Thibault <samuel.thibault@ens-lyon.org>
>>  M: Jan Kiszka <jan.kiszka@siemens.com>
>> --
>> 2.7.4
>
