Received: by 10.182.158.201 with SMTP id ww9csp662709obb;
        Thu, 7 Jan 2016 07:56:32 -0800 (PST)
X-Received: by 10.55.203.136 with SMTP id u8mr13460122qkl.103.1452182192594;
        Thu, 07 Jan 2016 07:56:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w14si14049870qha.93.2016.01.07.07.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 07:56:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHCvQ-0001TW-Cl
	for alex.bennee@linaro.org; Thu, 07 Jan 2016 10:56:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHCus-0000NP-6u
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 10:55:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHCur-0007he-6E
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 10:55:58 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:32859)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHCur-0007hT-2V
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 10:55:57 -0500
Received: by mail-vk0-x232.google.com with SMTP id i129so38110926vkb.0
	for <qemu-arm@nongnu.org>; Thu, 07 Jan 2016 07:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jCvKV953khalM1RQd7xA0CMEcpUGv644MYQvKFl/ATM=;
	b=dlR4CkhSg3AcmOGiDyFQuMhdUIvrFvNCGoyr2FpTKsVmfBe6ekSErv1p2fdoDyR5/d
	W3JHPaFhHifrajAQ3rP6p3oLFPLssT/KPZijEmmz3Ddhyj3dvMZgmvkYQV956SWc2dpb
	Wb++g6vJBwvurPsN+DZKA3OUCrzEURilZdEPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jCvKV953khalM1RQd7xA0CMEcpUGv644MYQvKFl/ATM=;
	b=OIBntlQUEjRXCodSq4gDqSOsrU1aNr/rc8WIqpoyvJ4rKFI4lwett3sJDrAdAj+qVW
	koHGb7dyM9UatASFNAVpIMXdAfg2S3UeFv76GQAQX8XybwOttShZLyLiVNVy5NM05tvz
	NBHl35T8+NwByEjozbx5vquyngfsjTb3iP7XNSZfdipcw/GORudO5OZK0ZEummPM/ITR
	Ww0nRolBnSkVQCcRAnkSxtJ+TIEefwe6VV7Jud5B2ZFp+xyid9HFvCahwyK4fV/MHzWX
	/ptmW43SDxf6oU67tnqtqf+uG8GCNp1Wn7a/4SseQHZu9afj/dVZFIF/b2KhqDC+b+Q5
	uzjg==
X-Gm-Message-State: ALoCoQkHe7jHLuoIaAVnm5iN/ZZQ97znCGrx2aaxJLWTiM/kui50gNLbWOjIylwjg+Pl5F9gX7tKexnmEs0QGDXkJDRQRgQJu686siwiAD1vh9vwY5w83Ow=
X-Received: by 10.31.180.145 with SMTP id d139mr66493925vkf.83.1452182156596; 
	Thu, 07 Jan 2016 07:55:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 7 Jan 2016 07:55:37 -0800 (PST)
In-Reply-To: <27dea50e71d768db3752dcad34be0f4c4234fd21.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
	<27dea50e71d768db3752dcad34be0f4c4234fd21.1450570397.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2016 15:55:37 +0000
Message-ID: <CAFEAcA8U5CYMSNJCoLo3D787p7v8gr0Ru0fVJwZeN6oW5kxFtg@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
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
X-TUID: pJXQihWLg3Is

On 20 December 2015 at 05:43, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Alistair Francis <alistair.francis@xilinx.com>
>
> Connect the Xilinx SPI devices to the ZynqMP model.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> [ PC changes
>  * Use QOM alias for bus connectivity on SoC level
> ]
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> @@ -286,6 +300,22 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
>                             gic_spi[sdhci_intr[i]]);
>      }
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
> +        char bus_name[6];
> +
> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
> +
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
> +                           gic_spi[spi_intr[i]]);
> +
> +        /* Alias controller SPI bus to the SoC itself */
> +        snprintf(bus_name, 6, "spi%d", i);

I don't much like these hard coded 6s. This is in init which
isn't a hot path, so the simplest thing is to use g_strdup_printf()
and then g_free() it when we're done.

Similarly in patch 6.

Otherwise I like this; I did a quick tweak to my sd card patchset
to use this approach and it seems to at least compile and do
the right thing in info qtree (I don't have a xilinx test image
to do more).

Haven't looked at the detail of how we're doing this in patch 1 yet.

thanks
-- PMM
