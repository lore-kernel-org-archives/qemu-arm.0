Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3615662wrt;
        Mon, 28 Jan 2019 11:04:16 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6JGZ51AZZ4G6Un38SSu84OGWO1QOCkVbHlxp8yOQRekSpBxmjwPV2JRc4ywsb71ODJJwmE
X-Received: by 2002:a1c:87cc:: with SMTP id j195mr17953283wmd.2.1548702256039;
        Mon, 28 Jan 2019 11:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548702256; cv=none;
        d=google.com; s=arc-20160816;
        b=JXC9bHdsL5bS0Xz0Cxw+dRgi10KvnSL59eBdsnHkaG52ZB46dyli1ojPG4mDSkyZfd
         23D+eBRFeRmIAx+n7AXl5qaWhcJshGdrA/9pZu7EMdEI0qIrBiG3Jo2oj7chd3NFzUAz
         rvOvgTYjcgy0kg6yiQCAv0Q8hdGb7oYmMYr8ZI/mNG6C0KpXopYMhCKg/LOAGku8FNHw
         9aKLh0JO5pkvJ6B40X8PAtgDmZuu15Cz+NbxhmfpmjDVGsQVo72k4Di5wA9ovNbv0Ebq
         UwQ/D4XRNDwsBnRAM2SBHj09XyiMrnAmKXM25tM+jRc9mA9loUjM1zSHftudJGYjXpGY
         Gxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=49o56JiPi4SikMkDbTMkMcRhBpprqlhtsY2SZ45dHdU=;
        b=x5LMkkPpNvonb9DZKQAuNB3Q4C0bVQk7c668kit4MaG55SQYfgWNeVSkJky0PYQjB9
         TfDAlXiAtekN3it6bvRs5lZ5KCLnkUTjTkXaPtxnWeLOQHbUUHwgOl7EN8OK7q5ysYR4
         l98cnQY2JEWrIrsj8axzILNI1wIzaCQbfXNCMfW2BEbycH+LU7CaFEdenLl6Ck/CtQRt
         9P6AvVQApCEMkjgUSKEu820dZ+0Ng+X6kiXP4PHoIc22bUFCv8553PJvNFGuGDkceB3W
         hja4P+d0mXRVVIuU0IobEoBQmQkPf3C7+Zrwh6pkC0oj2YvTdtVzfiyOal+tVJfZx9JC
         kgJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UdZKWNZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si42108237wrm.327.2019.01.28.11.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 11:04:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UdZKWNZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goCCd-0002jm-4Q
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 14:04:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goCAR-00014D-Kr
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 14:02:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goCAQ-00087M-F9
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 14:01:59 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44022)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1goCAQ-00082g-8g
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 14:01:58 -0500
Received: by mail-ot1-x344.google.com with SMTP id a11so15582567otr.10
	for <qemu-arm@nongnu.org>; Mon, 28 Jan 2019 11:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=49o56JiPi4SikMkDbTMkMcRhBpprqlhtsY2SZ45dHdU=;
	b=UdZKWNZcfz7U3Oz26ropSnAWwLmnvuWwTRXfAMtBjF93Vx6HRftrSI1RLX/FOFQobG
	uWt3xIbqLHHgxOlpZqAZIG5LafmO6bGFm/fKEwRRQjgsMbRTKvDkHkj2v/rgONf2X8xv
	a4TTOupJkXLf54kftFTdeVSdq7OZ1lWT/cgW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=49o56JiPi4SikMkDbTMkMcRhBpprqlhtsY2SZ45dHdU=;
	b=l98j3b0sDER5J4xuWyNUwYxJVrroENoWUoBhBpipBMFfB5e1DGhrgwR3gkvJo/HUaY
	2HHEBkCBwqKiyJ0+3s/LqGCb0aDMzkcAK3Avem6+8nR3siGHtxPvt2rKhmx5Mj7oL+/M
	sePEXhncoBx1nENxs7BLlN2Sz3c43jIrX16UvHfo+8tKfrKlN2Dmc7TmjBfXNZUrhNS/
	l95SWJUVBx6k4leVHhhOs5ggUFx2YeGLYnZPoolGr+ZxEJlSaoR2KTPws9Xefxr2XTdK
	yt9c22MFn0jKK1dS6Gi+moStkUveS0zsbCjg7gvDY84oFHRl/tVoojwrINLg9u3nVQBv
	ngyQ==
X-Gm-Message-State: AJcUukfTFoej5EsDp4gfW2gTsPHYgG15IyonerXm7P016EACpdPo9quH
	lewKvHCnUw8AVGIracZb+SD7Uwlcf7JIzWdC19wHog==
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr17347547otc.238.1548702114225;
	Mon, 28 Jan 2019 11:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20190124141147.8416-1-stefanha@redhat.com>
In-Reply-To: <20190124141147.8416-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jan 2019 19:01:43 +0000
Message-ID: <CAFEAcA_NBtWFZi8G8goXrX0OHHeHheW6MK3W9ByHVi1DNX3JWw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH] tests/microbit-test: Add tests for nRF51 NVMC
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nAwu1mIaonoQ

On Thu, 24 Jan 2019 at 14:11, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> This resolves the conflict with Julia's UART test series due to
> global_qtest removal.
>
>  tests/microbit-test.c | 108 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>
> diff --git a/tests/microbit-test.c b/tests/microbit-test.c
> index 3bad947b6c..04e199ec33 100644
> --- a/tests/microbit-test.c
> +++ b/tests/microbit-test.c
> @@ -21,6 +21,7 @@
>  #include "hw/arm/nrf51.h"
>  #include "hw/char/nrf51_uart.h"
>  #include "hw/gpio/nrf51_gpio.h"
> +#include "hw/nvram/nrf51_nvm.h"
>  #include "hw/timer/nrf51_timer.h"
>  #include "hw/i2c/microbit_i2c.h"
>
> @@ -156,6 +157,112 @@ static void test_microbit_i2c(void)
>      qtest_quit(qts);
>  }
>
> +#define FLASH_SIZE          (256 * NRF51_PAGE_SIZE)
> +
> +static void fill_and_erase(QTestState *qts, hwaddr base, hwaddr size,
> +                           uint32_t address_reg)
> +{
> +    hwaddr i;
> +
> +    /* Erase Page */
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
> +    qtest_writel(qts, NRF51_NVMC_BASE + address_reg, base);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
> +
> +    /* Check memory */
> +    for (i =3D 0; i < size / 4; i++) {
> +        g_assert_cmpuint(qtest_readl(qts, base + i * 4), =3D=3D, 0xFFFFF=
FFF);
> +    }
> +
> +    /* Fill memory */
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x01);
> +    for (i =3D 0; i < size / 4; i++) {
> +        qtest_writel(qts, base + i * 4, i);
> +        g_assert_cmpuint(qtest_readl(qts, base + i * 4), =3D=3D, i);

This assertion fails on PPC64 hosts:
ERROR:/home/pm215/qemu/tests/microbit-test.c:181:fill_and_erase:
assertion failed (qtest_readl(qts, base + i * 4) =3D=3D i): (16777216 =3D=
=3D
1)

I suspect an endianness issue, given that 16777216 is 0x0100_0000.
The test looks OK, though -- a word write ought to come back
the same on a word read -- so maybe it's in the implementation?

thanks
-- PMM
