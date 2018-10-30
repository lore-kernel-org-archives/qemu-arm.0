Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5633240wro;
        Tue, 30 Oct 2018 07:09:29 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dzKZCPg5F8Hkd94GZq7gFGtfvuyXVCIwnJAqnlf0u5SotMlzIk2eWccqFqVput8SEYat7a
X-Received: by 2002:a37:1956:: with SMTP id k83mr15425795qkh.344.1540908569800;
        Tue, 30 Oct 2018 07:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540908569; cv=none;
        d=google.com; s=arc-20160816;
        b=sQaVtYue9hQBCnG0BUiuck1W4t7t8QXLeT8qyfZqidyCC9SGwxipRlu1D2CUiJoNMB
         E/3tSlH4MDWFzSATswZCZ4od4iiDpgol7Xq3uU1ef8S2fkj6rrb0rsmYYBo85rIvhoJ0
         SgSuaokLjxcSVaIHlwmcGZYqDrytctoiB13Muv3PKBodx08GwW4kr50CEvEROu9NLgar
         dp3wODcK5znKTPrPYlNtLYBK6exHjsjt7LPQhAHdHb0q1TuKxXbqSASXkjDpltk88AxM
         HClMFmu8V/rkf6TyQuSt83r4ZIL68jByUTkxcl9orWVgzcCLeic70/QQMsmw6etFoZJo
         CdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=AJfDdcphRxaXY7Ud71HnOaNJ4VlECEkGxXQR4BP8hVc=;
        b=tVcsSvBwURQ74/6P9q1UWE6pWDgpmbewVibXZEJcKIhB9k2aonwioxYpVhl9RHZTOj
         aiHIx7D2gJVKxA4mQLYZNIiHsWofnWHLCcA21h1UAG4rZd89Adk7aNvFz5u4Zph+ldsz
         GrPnEc9PunLwc4Yye+E1LSevI32jy6AGzivfa/siMeUa9O0WZO//q/4sEWSgc+pQdDR6
         Ox2P/WaZ7qMfvGUiUkNI+ypGgguaold43NSAiGd9V975hvKYCysTRiumUdCl410BdcXE
         RGwQVhOsKmESIB4sLEtDSWCliJq15ERwzU97NWPWPDjt0a/WAg6HOwRy2beeSoje5yfc
         eB9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XLzRVtiE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z4si3083841qvz.114.2018.10.30.07.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 07:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XLzRVtiE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHUi1-0001Ii-1b
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 10:09:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHUhH-0001Fc-Eo
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 10:08:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHUhF-0002Ci-6j
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 10:08:43 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41179)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gHUhB-0001eB-IX
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 10:08:38 -0400
Received: by mail-oi1-x243.google.com with SMTP id i10-v6so10485206oik.8
	for <qemu-devel@nongnu.org>; Tue, 30 Oct 2018 07:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AJfDdcphRxaXY7Ud71HnOaNJ4VlECEkGxXQR4BP8hVc=;
	b=XLzRVtiE1Yr7iJuvj6DgEs3nWj5+b9Um7cwY5MQjEwyBLNujXrWhcOvg/M0UTiLZuJ
	uWw24QsgDF7TzGlY7DCN3nso+JSyVr3deOAoGbY2vI8Oq2+NQaA1qXOqW0W5ctpLh2tC
	oqYgk6Vb3lszGv5FgxqNonlZ7x3wOXwQYet68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AJfDdcphRxaXY7Ud71HnOaNJ4VlECEkGxXQR4BP8hVc=;
	b=CDc4w0CBWz/NJ79Fk/n3CBSirr2WlFssvn3cmTLOgknqqAOLkGxkyRP8BjlWy9JJhl
	axT3DCmEN1AcK7OVpAE2JhW0Z52yCMEu1CntS2RQrtk2jS12LUOC4y9UfXPIdYTCV7rI
	ifQSHXBDpRzCW8WiU5NlQqdWfSW/GuMm3SPxX/iv3GqldVI5kJrWo3r697ofK2knlj8h
	gGVTTVoh3M8883tVshJc5w31OnG/VKpdVHxLWmyaiY7vcoNMJzS5WXDeuBm/hUmMZ8IN
	FUEKQ5t1ycGPs+7rDhc81L5Je5jQuxHGh4QRo1Y8kSr4tZ3PXd8gidYZEPXdPBy6DaPj
	Yw+w==
X-Gm-Message-State: AGRZ1gKx6G6EgULc7wCU4bGmfpK57H3JXVdD4H6ZbywZOTmLULWzXt5j
	qVwYf7sWKNe0Zes0TLvY69V0Uh7MLlOwpdjONNsaDQ==
X-Received: by 2002:aca:b504:: with SMTP id
	e4-v6mr11458516oif.25.1540908495422; 
	Tue, 30 Oct 2018 07:08:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 07:07:54
	-0700 (PDT)
In-Reply-To: <20181030114048.21527-2-philmd@redhat.com>
References: <20181030114048.21527-1-philmd@redhat.com>
	<20181030114048.21527-2-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 14:07:54 +0000
Message-ID: <CAFEAcA-yrZY3QD7ecOkQHU18qnU2y=G-QP+=ZZMhhnKTWwoVVw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 1/2] hw/arm/xilinx_zynq: Use the
 ARRAY_SIZE macro
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I7W85ZWbnRXB

On 30 October 2018 at 11:40, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/arm/xilinx_zynq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index f1496d2927..57497b0c4d 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -294,7 +294,7 @@ static void zynq_init(MachineState *machine)
>      busdev =3D SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(busdev, 0, 0xF8003000);
>      sysbus_connect_irq(busdev, 0, pic[45-IRQ_OFFSET]); /* abort irq line=
 */
> -    for (n =3D 0; n < 8; ++n) { /* event irqs */
> +    for (n =3D 0; n < ARRAY_SIZE(dma_irqs); ++n) { /* event irqs */
>          sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - IRQ_OFFSET])=
;
>      }
>
> --
> 2.17.2

Since this isn't related to the other patch, I'll just apply
it to target-arm.next to save you carrying it around.


thanks
-- PMM
