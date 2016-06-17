Received: by 10.25.21.96 with SMTP id l93csp290048lfi;
        Fri, 17 Jun 2016 07:23:05 -0700 (PDT)
X-Received: by 10.237.50.6 with SMTP id y6mr2655307qtd.84.1466173385004;
        Fri, 17 Jun 2016 07:23:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si5153424qkf.273.2016.06.17.07.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 07:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDufo-0003Iz-CN
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 10:23:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDufg-0003Fz-HG
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 10:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDufe-0002GR-4W
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 10:22:55 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDufd-0002GE-W4
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 10:22:54 -0400
Received: by mail-vk0-x22d.google.com with SMTP id d185so117855552vkg.0
	for <qemu-arm@nongnu.org>; Fri, 17 Jun 2016 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tlkH++0NEc4RLp0mQgGy9W7MUvr3MN1OvbFL6Cvcew0=;
	b=AAoEBEBpz7NBCg8CEld8bkylspgE6XjbRrTUS/P25Oy/2sycfdTLpKia7CnDrjobcw
	xdi81UDkakMWZ9bb9Yd8iu9xs6/z611J405S+XarqwOHmPZ0P9XiiLuG4tnaWybncoNc
	CU/b+0caqA4qAr4TPrt7o26SlIMGFPFFm7Zts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tlkH++0NEc4RLp0mQgGy9W7MUvr3MN1OvbFL6Cvcew0=;
	b=Uv5HqmLB6ssHe5xLtGLUCtE0aj5yBpT0jEsatyfPYKEsDUJdoU4ftMP6ErWHZrSBFd
	fqBqBiH89Eld3DSt7CtWav+nOCGvjtF5dhhsolPbpb3MEwuQ2E+lllhuIbFqCx5Geoko
	vfE2aeoKynzgfvKVYe8mlaRlZTRVg9WwfD28kTAu3MYyVeoSjzXTEnZcxKoB2qzvmPwv
	1RXHJ+6JXNeVn/oGM4jtc50Dtrddm4J55cvUgfVZYFpHIYHzvk57rvIoMtJzM2kSgS5Y
	+5/4e+7bJhc9kJxJVXq11A+3FObCh4a61OFN+iju37Z3nOq2uK0c2ww8DfGZIXHJYbyf
	/78Q==
X-Gm-Message-State: ALyK8tKU844yKRsgj1Xe7kR/098XIbvF0P+s5Sm8OPEjfz/zx59LV3IGW9TdKoQ317fq+dhHOauSb8V3q7nsLOaZ
X-Received: by 10.159.35.230 with SMTP id 93mr1050135uao.26.1466173373412;
	Fri, 17 Jun 2016 07:22:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Fri, 17 Jun 2016 07:22:34 -0700 (PDT)
In-Reply-To: <1466063287-19350-2-git-send-email-andrew@aj.id.au>
References: <1466063287-19350-1-git-send-email-andrew@aj.id.au>
	<1466063287-19350-2-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jun 2016 15:22:34 +0100
Message-ID: <CAFEAcA_-+nWvAsCLE71d4qb_3eFkF80L-JgZSxwF5L3CH+W_Aw@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/misc: Add a model for the ASPEED
 System Control Unit
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /xHUQCJ66C0R

On 16 June 2016 at 08:48, Andrew Jeffery <andrew@aj.id.au> wrote:
> The SCU is a collection of chip-level control registers that manage the
> various functions supported by the AST2400. Typically the bits control
> interactions with clocks, external hardware or reset behaviour, and we
> can largly take a hands-off approach to reads and writes.
>
> Firmware makes heavy use of the state to determine how to boot, but the
> reset values vary from SoC to SoC. qdev properties are exposed so that
> the integrating SoC model can configure the appropriate reset values.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
> +static Property aspeed_scu_properties[] =3D {
> +    DEFINE_PROP_ARRAY("reset", AspeedSCUState, num_resets, reset,
> +                      qdev_prop_uint32, uint32_t),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +#define ASPEED_SCU_NR_REGS (0x1A8 >> 2)

This seems like a very unwieldy way of specifying the reset values
for this device. Are they really all fully configurable in the
hardware? It seems unlikely. I'd much rather see something that
looks more like what you might plausibly be configuring when wiring
up the SoC, which might be some version/revision numbers and/or
some particular tweakable parameters.

thanks
-- PMM
