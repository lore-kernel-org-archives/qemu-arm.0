Received: by 10.80.163.71 with SMTP id 65csp712361edn;
        Sat, 24 Sep 2016 01:56:19 -0700 (PDT)
X-Received: by 10.55.136.133 with SMTP id k127mr11526880qkd.57.1474707379322;
        Sat, 24 Sep 2016 01:56:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t69si385370qki.156.2016.09.24.01.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Sep 2016 01:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bniks-0003kM-Ot
	for alex.bennee@linaro.org; Sat, 24 Sep 2016 04:56:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bnikm-0003jn-Sg
	for qemu-arm@nongnu.org; Sat, 24 Sep 2016 04:56:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bnikh-0006T8-WC
	for qemu-arm@nongnu.org; Sat, 24 Sep 2016 04:56:12 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35886)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1bnikh-0006Sr-NP; Sat, 24 Sep 2016 04:56:07 -0400
Received: by mail-wm0-f65.google.com with SMTP id b184so6081416wma.3;
	Sat, 24 Sep 2016 01:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=AwRip3kLYDnaQj0yeSydgB0WaMYHIO28omPi8C7Ur2I=;
	b=o83pY1nWBkCs4rRNyvUDgdWX4zALZ6/pzDT8Typ4LCFn/VlikSCSgSZ07mCE/lrGh5
	bk7nIZUWbSnTww0/LZ+nwedRZy3PvGFosCFuAyhMZ0bWDFXrm6UwXg5Bzulaa9Kkmg9D
	LX36MSFft7zI6fLIR+Kd9coCGEHhW7wY3VTeVm/D9+9jyGu69uvA33BT5GLb3tFfhvCK
	yG86skt0e2xUez/zEAi9/hSekMg55d2+E/OU5dFy+ZaNVjq+DwK6suzDCJe0Nuizkwkf
	J/RgBqtDf+1C100uNLpikdqFSQWIfAqgNGIvby9QqFIdhMQ0l0gBYLt5FjRV1CvbP90Z
	NQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=AwRip3kLYDnaQj0yeSydgB0WaMYHIO28omPi8C7Ur2I=;
	b=ZxA/yrZV/sTCXMNr5/Sqv/flM9OkIoalD/luzdkhG1mUw4bLGcP+Au3zeoSuKZu4ws
	vpyDTnJbUwA3rGFP9QHjnrRGUtZ9V6FwrD+e8bU9Izz39aPDGn7p6g+cef1/R5T8Vqwt
	80MC2UsleXZwxBFLQ+qhKt90azSZJyrIhuL+MOn4l4DP5wK0MIVNRU7wwSMjjkF7P6Cc
	kxeV1MMUj0uJGQhBR0wyngoQExmpj50D3pSGvXz/fQIGzCZR9vAHo7LW0Il4+mxHtRdE
	R/EuE0WTk7EJxNy11mcLrTDx0OeBpq/ybW0abal5szz5G81kCkeqCpHevRXDc4SV8rkG
	+9Qw==
X-Gm-Message-State: AA6/9RkRJp5tOZzjVZkqPLSJkB5wSswlhyWIiCRyBIZfPcm5FbRU9MaHksfz3xyHzhz5Ew==
X-Received: by 10.194.140.77 with SMTP id re13mr12123396wjb.79.1474707306899; 
	Sat, 24 Sep 2016 01:55:06 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	l3sm11175680wjp.17.2016.09.24.01.55.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Sep 2016 01:55:06 -0700 (PDT)
Date: Sat, 24 Sep 2016 10:55:05 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20160924085505.GA5931@toto>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<2c52c156-2a32-b437-acd2-af13faaef55d@kaod.org>
	<CAFEAcA_MOhS04HiAVWg5xB8xBQ=krfZC6OBnH+X7UBo2_rf1uA@mail.gmail.com>
	<673755bd-c971-eb34-99b6-ac874a0d9a98@kaod.org>
	<78e298ed-b182-0fdf-99b7-de0324665b33@gmail.com>
	<723852a7-a5ab-9acb-cea9-4a5637b8eada@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <723852a7-a5ab-9acb-cea9-4a5637b8eada@kaod.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	mark.burton@greensocs.com, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"mar.krzeminski" <mar.krzeminski@gmail.com>, fred.konrad@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f1qIBXlCTAqq

On Sat, Sep 24, 2016 at 10:25:39AM +0200, Cédric Le Goater wrote:
> On 09/23/2016 08:26 PM, mar.krzeminski wrote:
> > Hi Cedric,
> > 
> > W dniu 23.09.2016 o 10:28, Cédric Le Goater pisze:
> >> On 09/23/2016 10:17 AM, Peter Maydell wrote:
> >>> On 23 September 2016 at 08:19, Cédric Le Goater <clg@kaod.org> wrote:
> >>>> But the goal is to boot from the device, so I added a memory region alias
> >>>> at 0 to trigger the flash module mmios at boot time, as this is where
> >>>> u-boot expects to be.
> >>>>
> >>>> and I fell in this trap :/
> >>>>
> >>>>          aspeed_smc_flash_read: To 0x0 of size 1: 0xbe mode:0
> >>>>          Bad ram pointer (nil)
> >>>>          Aborted (core dumped)
> >>>>
> >>>> There is a failure in get_page_addr_code(), possibly because qemu uses
> >>>> byte per byte reads of the code (cpu_ldub_code). But this is beyond my
> >>>> understanding of qemu's internal.
> >>> This is a bug in how we report the problem, but the underlying
> >>> issue here is attempting to execute from something that's not RAM
> >>> or ROM. You can't execute code out of something backed by MMIO.
> >> OK. So I see two solutions. T
> >>
> >> The "brutal" one which is to copy the flash contents in a rom blob
> >> at 0, but there is still an issue in getting access to the storage
> >> anyhow, as it is internal to m25p80. Or we should get the name of the
> >> backing file of the drive but I am not sure we are expected to do
> >> that as I don't see any API for it.
> >>
> >> The other solution is something like this patch which lets the storage
> >> of the flash device be assigned externally.
> > Since I do not like dirty hacks in the code, I want just to suggest a 
> > workaround, that probably you will not like ;]
> 
> It's a feature ! :)

CC: Mark and Fred

I agree, I think these are fair attempts to try to solve a real problem.


> I am just trying to find a solution to this issue. So, we could also 
> introduce a routine :
> 
> +uint8_t *m25p80_get_storage(DeviceState *dev, uint32_t *size)
> +{
> +    Flash *s = M25P80(dev);
> +
> +    *size = s->size;
> +    return s->storage;
> +}
> 
> and use rom_add_blob_fixed() with the return values. Maybe this is less 
> intrusive in the m25p80 device model flow. Thoughts ? 
> 
> > As Qemu expects that first running code will be in ROM or RAM memory,
> > you can implement in your board -bios option that you will use to
> > pass u-boot binary to rom memory, or even use generic loader functionality
> > when it reach master.
> 
> but if we use -bios <file> to have a ROM, we will need to pass a second 
> time <file> as a drive to have a CS0 flash slave: 
> 
> 	-bios "flash-palmetto-test"  \
> 	-drive file="flash-palmetto-test",format=raw,if=mtd \
> 	-drive file="palmetto.pnor",format=raw,if=mtd
> 
> This feels awkward. The virt platform and vexpress forbid that for 
> instance.
> 
> Are there any other platform with similar need ? 

Yes, ZynqMP has a linear memory mapping of SPI memory contents. It gets
slightly more complicated there as the mapping supports various modes
including parallel SPIs with striping done by the controller (i.e
bytes as seen via the linearly mapped area are interleaved from multiple
SPI memories).

So a plain RAM mapping of m25p80_get_storage won't work.

A ROM version of the linear data might work at controller level. The controller
would have to populate the ROM area at startup (slow) and keep it in sync for all
writes. We would also need to signal write events so that TCG can flush it's
caches. TCG only keeps track of modifications being made to cached code if changes
are done with writes to RAM area (not if they happen indirectly via other registers).

Another solution is to implement support in TCG to execute from MMIO mapped areas.
We'd also need to solve the problem of signalling content changes to TCG.

I think these approaches have some overlap. Personally, I think TCG executing from
MMIO areas would be quite useful. It's also useful for QEMU & SystemC integration.

Best regards,
Edgar
