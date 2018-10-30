Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5338195wro;
        Tue, 30 Oct 2018 02:37:11 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eBjHAYHX75jJ9L/cFKeJjNam1UmAjd6OSHJItRWblR2wBRKxGZA6sZSQiPIH/GFz/kp0jW
X-Received: by 2002:a0c:bf08:: with SMTP id m8mr16229293qvi.30.1540892231776;
        Tue, 30 Oct 2018 02:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540892231; cv=none;
        d=google.com; s=arc-20160816;
        b=U//yj2aeo1T6DyJg1sW8WduCUcdJbaMFzzY2Y5citP3GUJaDhDt4Ys90CxcyrZgLcW
         GKiP01V0s2Alckfy76Y69KnPWvtghx51dtWtqwDHMfRVeu1CAKRst9AZVqRZyviKlP2J
         9dIfxtpYgWEP3Hds5uhNmJFtyTEwQcX1uQ9463EhLAkpV8CUt89jAcssUwjxPGjROpay
         Gy/dRWV9O/bqQujNF1jQUlMDUBNfszGz+895lQUKYNTz9aiwFmtQG12HIM3ZX8XXF35n
         IBCBHkjK8qHscFB8wHVFk5Cmm31cAAkTLkNnQKcIelZihP56UjRzIzkbf9BKTtc08gVe
         jvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=g3u1/95CeJbxZ2WpoXzGjtvTOXJIeLyskOEbq0DVL3k=;
        b=zTgh8B27Fw+eiAFn2VuHzrSPrg+tH489TeqSgnJfXc7N0vgflRAiuaUwPcAcFGnV+x
         4j2NzgOsPZwMeMxbyOBTpZzo/VjcyzfXYphOjGZhhELTOQDVMzyP/vBNTo9f0jAJkvc4
         U3d4hX1B3DH7detC15DeaMik1Im985d+U2bWAV3P2oZyCCd56bDKTbjHSyHKz77ox3+J
         Ykrq7lqRnrk1ZitqW1DIhTIIRwDUAA5dzSUvJpdllIfDERTLqSNDGzOtq7GtAfXAUx2Q
         n8eEDPGF1gBPo1s9mLff2zOqSIfULcsSPURX86J8AQMpaLU3vDBXoejHpv2L/WPPnqcJ
         n2pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NcNYPqZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c127-v6si1149412qkf.236.2018.10.30.02.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 02:37:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NcNYPqZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHQSV-0002D1-9n
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 05:37:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHQS9-00024J-Jn
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 05:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHQS8-0005Zr-UK
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 05:36:49 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33033)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gHQS8-0005Yx-L9
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 05:36:48 -0400
Received: by mail-oi1-x243.google.com with SMTP id c25-v6so9802795oiy.0
	for <qemu-arm@nongnu.org>; Tue, 30 Oct 2018 02:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=g3u1/95CeJbxZ2WpoXzGjtvTOXJIeLyskOEbq0DVL3k=;
	b=NcNYPqZcn2u93eHYZOs9YaSXz04yFUd+gS8g3DS7tnD5Uv1kWWZIRKOEW86vklhD7c
	DLCfLSdAE2KjGHMPHnbO9pbj2++iIMv2WEowUnDSmoNIGSjSCAcX21V7CDxRx4F7wbxX
	abMMXk60MzKwBOMGLaL3FeqC66x79PERPSUa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=g3u1/95CeJbxZ2WpoXzGjtvTOXJIeLyskOEbq0DVL3k=;
	b=Yu4XVtaLvxeDs20unRN/8m+4+9PfFSV2IKEADvsmS8BPFuQZoQa7hCnCHcTJlc7o9e
	sYYyhu7lzX0bDno0gNKOeG4iAVf6zMMARXw1ZLXqIVjk6Ei9ry4qM0OHDivvl9vKkMXu
	0kFHd2OYyfg2ube5/JTXQunvBnY4J7v/BhUbGzfs6of8R/ApzDv7u4xkmE7v/tOxEQgv
	eT3qcwiMDqBr67aZKpohRvxSR4vLRMa2fySJkFn6OHiO4lr5hB58YccnUQL1fnuKuV26
	1+EU/ZRFeTjdPPqHzzbV9TxzgOZV2TFPUPjGsE9yl2Rdb0YMzoT+Xz3YrKcHhkQ9yDIg
	T7SQ==
X-Gm-Message-State: AGRZ1gLYiyuduFE9HtNdcjnsX3JD87h0MokSaRL1+fYC2YQYnSZJu729
	e0GN7MjY77GAJohtUraCao/u+bPmfgNrtN6780bDEA==
X-Received: by 2002:aca:c509:: with SMTP id v9-v6mr9842883oif.48.1540892207846;
	Tue, 30 Oct 2018 02:36:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 02:36:27
	-0700 (PDT)
In-Reply-To: <20181029232100.8454-3-philmd@redhat.com>
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 09:36:27 +0000
Message-ID: <CAFEAcA_yde+Ppuqet7KFE-AvZrjnrfYeY=R1aWD86cox+WYsxg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/dma/pl330: Factor out pl330_init()
 from hw/arm/xilinx_zynq.c
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M+aGRYm9S0jn

On 29 October 2018 at 23:20, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS            |  1 +
>  hw/arm/xilinx_zynq.c   | 18 ++----------------
>  hw/dma/pl330.c         |  2 +-
>  include/hw/dma/pl330.h | 41 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 45 insertions(+), 17 deletions(-)
>  create mode 100644 include/hw/dma/pl330.h

> +static inline void pl330_init(uint32_t base, qemu_irq irq, int nreq)
> +{
> +    SysBusDevice *busdev;
> +    DeviceState *dev;
> +
> +    dev =3D qdev_create(NULL, TYPE_PL330);
> +    qdev_prop_set_uint8(dev, "num_chnls", 8);
> +    qdev_prop_set_uint8(dev, "num_periph_req", nreq);
> +    qdev_prop_set_uint8(dev, "num_events", 16);
> +    qdev_prop_set_uint8(dev, "data_width", 64);
> +    qdev_prop_set_uint8(dev, "wr_cap", 8);
> +    qdev_prop_set_uint8(dev, "wr_q_dep", 16);
> +    qdev_prop_set_uint8(dev, "rd_cap", 8);
> +    qdev_prop_set_uint8(dev, "rd_q_dep", 16);
> +    qdev_prop_set_uint16(dev, "data_buffer_dep", 256);
> +    qdev_init_nofail(dev);

These are the settings the Xilinx board uses, but are
they really the settings every SoC that has a PL330 will use ?

thanks
-- PMM
