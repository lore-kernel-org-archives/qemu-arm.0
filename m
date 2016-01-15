Received: by 10.25.159.19 with SMTP id i19csp713118lfe;
        Fri, 15 Jan 2016 13:33:15 -0800 (PST)
X-Received: by 10.140.173.132 with SMTP id t126mr17230903qht.96.1452893595527;
        Fri, 15 Jan 2016 13:33:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 134si15310549qhz.5.2016.01.15.13.33.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 13:33:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:49001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKBzf-0001IU-2T
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 16:33:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aKBzc-0001Ff-QD
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 16:33:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aKBzb-0007v0-OV
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 16:33:12 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aKBzZ-0007ud-Pm; Fri, 15 Jan 2016 16:33:09 -0500
Received: by mail-oi0-x242.google.com with SMTP id j3so8950964oig.0;
	Fri, 15 Jan 2016 13:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=5AHt5AVvxVLB4nf7Wmfkq/E7sK/y2l/eu8tMRDmf6hY=;
	b=Po9YOVyYOzdpshwaIdGb4hFHt5aWdybXVEh45B8/DLOBdPmiGyMGZFMTCmHBtxoL2R
	dZFNz7ZbwSTKEtAQcnCh/Ui7VISZJJ4X6jZAYUZQ482IsOi6hac4BqN9cngNIh2kB1u4
	20qNBrUvW3ZYrErDGmEELlvmdPfZDtnpUyHqrG+ukkW+vzZfEFJZ9CPVv5TDBBH6CvTc
	2WxRiWzcScVYh+bBCyNvFkiNZ6Q6z4a4dT/vZi8lFQDy14QykegA7HW70MXd0Hi+F2vS
	IY5OcJNHLgSPCQLkngJmBH56QqZGJhJZZ5rR+NGROLE3JjVJkXmfU7wcZ0QL7lj49sZu
	WqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=5AHt5AVvxVLB4nf7Wmfkq/E7sK/y2l/eu8tMRDmf6hY=;
	b=avZS59agm8pSmgZs+THMUZWmmf05rjpzoQNFogUhsNOy9tJWf8V+kWBNjLwMjnuUh1
	R8ZvxG0MYeuhJ/YgbPJDgzqZVeaHpWGXMCzGEZG5yE+p3DNVR45OSW5UzdIf1idBPcAY
	ynxzKpZKbwXfmjAypbcIyXbsVqipBZatzjt26U5GbxVh+j8LNoetS+jODKB00EeyaMj7
	tMdbrddpdWEc4zjI8XN+IVYsifMNuDC3KtOEmCiZPVZsWsmfNGcfsQXtxiLMQyDyEfAs
	QoGvTOXrrok7Wa0xdbDeeGqd3R0tvO7j6O24xKo95LJ2FY+w+gFxi9qOPbAY+v1U0CLj
	s2QA==
X-Gm-Message-State: ALoCoQnBkDHYB30SU7S8wsI5u6MVcZuLUzBXS56MVQovzI0BHPlJQrdkoyPo3fnBQ6897TLCDBLy4F1N2LEnlXPAFcvqWoHnWg==
X-Received: by 10.202.83.139 with SMTP id h133mr9885463oib.127.1452893589281; 
	Fri, 15 Jan 2016 13:33:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Fri, 15 Jan 2016 13:32:39 -0800 (PST)
In-Reply-To: <CAFEAcA-3==j2LaqTxvy3DC-USWV5UXE-M4vDkkbG5vAmG65GsA@mail.gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
	<27dea50e71d768db3752dcad34be0f4c4234fd21.1450570397.git.crosthwaite.peter@gmail.com>
	<CAFEAcA8U5CYMSNJCoLo3D787p7v8gr0Ru0fVJwZeN6oW5kxFtg@mail.gmail.com>
	<CAFEAcA-3==j2LaqTxvy3DC-USWV5UXE-M4vDkkbG5vAmG65GsA@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 15 Jan 2016 13:32:39 -0800
X-Google-Sender-Auth: wsRbef1UKdCeFnTCBx3VwgXhFI0
Message-ID: <CAKmqyKM+ZZuhj+uKo3bGS8Poam4w+gsLdC=QJ0bFVKspouCJYA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 5/6] xlnx-zynqmp: Connect the
	SPI devices
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9zNtwO/l93ao

On Fri, Jan 15, 2016 at 7:21 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 January 2016 at 15:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 20 December 2015 at 05:43, Peter Crosthwaite
>> <crosthwaitepeter@gmail.com> wrote:
>>> +    for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
>>> +        char bus_name[6];
>>> +
>>> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
>>> +
>>> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
>>> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
>>> +                           gic_spi[spi_intr[i]]);
>>> +
>>> +        /* Alias controller SPI bus to the SoC itself */
>>> +        snprintf(bus_name, 6, "spi%d", i);
>>
>> I don't much like these hard coded 6s. This is in init which
>> isn't a hot path, so the simplest thing is to use g_strdup_printf()
>> and then g_free() it when we're done.
>>
>> Similarly in patch 6.
>>
>> Otherwise I like this; I did a quick tweak to my sd card patchset
>> to use this approach and it seems to at least compile and do
>> the right thing in info qtree (I don't have a xilinx test image
>> to do more).
>>
>> Haven't looked at the detail of how we're doing this in patch 1 yet.
>
> Hi Peter (and/or Alistair) -- do you have time to do a quick respin
> of this patchset to use g_strdup_printf() in these cases? It would
> be nice to get this series into the tree, because my sd card rework
> patchset depends on it...

Yep! I'll do it now.

Thanks,

Alistair

>
> thanks
> -- PMM
>
