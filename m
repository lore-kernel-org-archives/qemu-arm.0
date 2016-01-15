Received: by 10.25.159.19 with SMTP id i19csp528865lfe;
        Fri, 15 Jan 2016 07:21:36 -0800 (PST)
X-Received: by 10.55.26.215 with SMTP id l84mr13598019qkh.101.1452871296904;
        Fri, 15 Jan 2016 07:21:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r65si6101863qha.11.2016.01.15.07.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 07:21:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK6C0-0004eW-CD
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 10:21:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK6Bx-0004bv-US
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 10:21:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK6Bx-0000Z8-34
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 10:21:33 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33230)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK6Bw-0000Yx-Ul
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 10:21:33 -0500
Received: by mail-vk0-x22c.google.com with SMTP id i129so161808014vkb.0
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EOyc9Tn0KHu0coWjj6ND0CoJvV0YJfr+LLOvDy2jQD0=;
	b=e5qzGNsdRhtUjVDRejMSo/CDnV5C3oJCNxRICXnY19f53AmW7x2iAlDBzVNcbtysfs
	i86zyIo4zjKj4FkY2OAhJZEkN/WMuSNh/v5yuapquP5t59LKQMVwq4uxhpr5cKscodcg
	0IImpXpQ4pjT95G/R1TmpPenuuv5A8vZlxI4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EOyc9Tn0KHu0coWjj6ND0CoJvV0YJfr+LLOvDy2jQD0=;
	b=CflMH9tEPPkwfZJPWX7cdXgQ8WUEeUJmCZ/+c7Y6P450whUB70b+89kA8E3sYH+50g
	f4HaUk5RzjFz3+IdH57HBtRg0EqElxXifmnqltcBcByGCn4Xd+QcTlpbEw9C56wwpqrE
	nwe/+RMLG5b9HgTGzMobJHUkTN2OA5pwsU/Lox5nOGq+VFFxSWJO5hKYo8MDWPK+b7w0
	qvDlnC7wpqO8ONwRB9Xi4366+0U4/rIoif/6KOs19WVjUNulePlOOEX4kOJIkT12g/2k
	nySK7iebJXsrD6iPwPk+ZtKb2sJ4fK5jJcUwC6rd/J8l6wWPFExJwnVVqw0UUKf3VW3e
	Fuvw==
X-Gm-Message-State: ALoCoQmDCv0znHRyK6UlIVBxzTIBUN97jQi44PVKwmB2HXsyjZZ4/M0XJSx6OK3bskU8u+MCnv3DCJQlwfF8DNvgSR+lJATXhPEchQfuA2AUfSjHgYuPm68=
X-Received: by 10.31.141.2 with SMTP id p2mr7944979vkd.37.1452871292403; Fri,
	15 Jan 2016 07:21:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 15 Jan 2016 07:21:12 -0800 (PST)
In-Reply-To: <CAFEAcA8U5CYMSNJCoLo3D787p7v8gr0Ru0fVJwZeN6oW5kxFtg@mail.gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
	<27dea50e71d768db3752dcad34be0f4c4234fd21.1450570397.git.crosthwaite.peter@gmail.com>
	<CAFEAcA8U5CYMSNJCoLo3D787p7v8gr0Ru0fVJwZeN6oW5kxFtg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2016 15:21:12 +0000
Message-ID: <CAFEAcA-3==j2LaqTxvy3DC-USWV5UXE-M4vDkkbG5vAmG65GsA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [PATCH v6 5/6] xlnx-zynqmp: Connect the SPI devices
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
X-TUID: Rqz2/odkTyYi

On 7 January 2016 at 15:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 20 December 2015 at 05:43, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> +    for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
>> +        char bus_name[6];
>> +
>> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
>> +
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
>> +                           gic_spi[spi_intr[i]]);
>> +
>> +        /* Alias controller SPI bus to the SoC itself */
>> +        snprintf(bus_name, 6, "spi%d", i);
>
> I don't much like these hard coded 6s. This is in init which
> isn't a hot path, so the simplest thing is to use g_strdup_printf()
> and then g_free() it when we're done.
>
> Similarly in patch 6.
>
> Otherwise I like this; I did a quick tweak to my sd card patchset
> to use this approach and it seems to at least compile and do
> the right thing in info qtree (I don't have a xilinx test image
> to do more).
>
> Haven't looked at the detail of how we're doing this in patch 1 yet.

Hi Peter (and/or Alistair) -- do you have time to do a quick respin
of this patchset to use g_strdup_printf() in these cases? It would
be nice to get this series into the tree, because my sd card rework
patchset depends on it...

thanks
-- PMM
