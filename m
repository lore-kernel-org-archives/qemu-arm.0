Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2744935wro;
        Mon, 5 Nov 2018 07:55:40 -0800 (PST)
X-Google-Smtp-Source: AJdET5chE0OkUIvM+KDpK7G0VIvzyhR4nWZUkc3NJdabxkRu75aJtUrKjmisTtryGO9z9QJEuhVr
X-Received: by 2002:aed:26a3:: with SMTP id q32mr9848582qtd.106.1541433340035;
        Mon, 05 Nov 2018 07:55:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541433340; cv=none;
        d=google.com; s=arc-20160816;
        b=j/GegI45fAXdd7Jub689qQdJ++FrzrOtPH2YxHtT7RDNgv9eu48JpMpm85EXrpDayb
         FLc05C8MObwGIc38F4nvF3iYZMOezaUSDRBa2SGV8tIaBRM7JCBjkZAprb+we0ungoBX
         38b9oPErlII3QLiOQrO1Qr+GRDL6OUDVJsgtR2q2bpwoLssJ4ZX0RoRLOf8ZiqKnHID/
         AggBpaS508Pz5b8uGnghV0zQU4rEN8O11uuZgGWhrci9xub1QdAeg31Tanmrx2KFLOO6
         ahZ/KOtB1NYtLEBpqwN6/UWaaRcsPw4mrMmVmos19X/sTobMBhQHRIeA1/PTWzA9jGmC
         dv8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=+B7LOzRHch45LjzVS/RD4dkS4uRiw2JVUVwCv8K8cwE=;
        b=BBfWMqN5Ri9cwvJ55rF2vEhAoKwlFtGJ+6WwQfnEEZhJ6uWwcI7Juxn9O8P7cJQ6sw
         1F8o5RCtKJHLF0tIwEj77JQHxOVMeaNU/NjomHz2ZJXkb256qkS6dnYLHKMc8xxG+bbS
         8Yx3HzC+kVmQUePjw5NHBd8yYZqfzmZ4sUA/fcWxiBoxeIXmraYvZjpsEm+o7qy5UJGH
         SZ+rjq/FeMfj1ppr2VAXgRX3VsMJ3OLWyTHRCIXA4M5a5gADD9hRAuTwPvWaqDkbbYrw
         AyitgXxPLkfdkIfyp0yMdHKXio9jgr9XC8MZnz5PJiklFWDWSgTlq/au4NA+grIjuQba
         tm/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MOPzw8AA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r27si13446992qkr.70.2018.11.05.07.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:55:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MOPzw8AA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJhE3-0008Q3-39
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:55:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJhAD-0002Fz-Ud
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:51:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJhAB-0001PY-Fg
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:51:40 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJhA9-0001C4-27
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:51:37 -0500
Received: by mail-ot1-x341.google.com with SMTP id c32so8368795otb.8
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 07:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+B7LOzRHch45LjzVS/RD4dkS4uRiw2JVUVwCv8K8cwE=;
	b=MOPzw8AAfeMAUuah5cpmk4l32SII/76/1mM1GlPUDL9Sqvex1CqvjiAyKvt8L7co3l
	A+ftJFjm+euTaW9CwH/zVlCUz3LH/HwmHBbPBs8fa6A16mv5SJ8ilDcYJoh8AxqoTUt+
	OUsWpXa9ITtVFEfCvgX5odMo9JlmBKeEzwi2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+B7LOzRHch45LjzVS/RD4dkS4uRiw2JVUVwCv8K8cwE=;
	b=q2m6Ih2LhqheE6FEg1yxp0vOqFn9SKWg5A9RHvJ18LGmJLsCv+2WJAZTNLM2DAGzOr
	XxP7PAySEJA5Qd/QwwL70C/8LTTpXM3nVPWGVfwIEFBOz/5iDF1JnAN7vlnMngd9L2T5
	v9e4P3CisTFU8PnfPbG78B8BLgDtmA0AhBcaITnt6VN40EHBNgZkUVB9rTQfDeaik17L
	jQ+5eyEt3X1j+ncNu2rAOzmbnhIpFfvH+Yw7Nu1VndutB/qv13aOaCbFKW5TEnGXwdQ8
	prafis2/k1CsFxHdbitH6Ml37nTqE4IzLKuOHdAJ/TcUlzu+XhIGIIS4znKUa1JtCstB
	twCQ==
X-Gm-Message-State: AGRZ1gIX607fqePWCOyK3aMX3LYlB0HoQwT4/MEmLFtxIBiHnWGyAFgj
	s4aaIFGd/6BT6GUYX5zvTnvezWmgOwB3zI32KnQUtw==
X-Received: by 2002:a9d:156d:: with SMTP id z42mr14123257otz.201.1541433088992;
	Mon, 05 Nov 2018 07:51:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 07:51:08 -0800 (PST)
In-Reply-To: <20181102001303.32640-6-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 15:51:08 +0000
Message-ID: <CAFEAcA_FJNMG=UjvsC1-C9Mg7Ri=fp5B11W0Qn5O11=tOsKM1Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH for 3.2 v2 5/7] hw/arm/bcm2835: Add various
 unimplemented peripherals
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kL8LUiegp2G1

On 2 November 2018 at 00:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Base addresses and sizes taken from the "BCM2835 ARM Peripherals"
> datasheet from February 06 2012:
> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.p=
df
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/bcm2835_peripherals.c         | 26 ++++++++++++++++++++++++++
>  include/hw/arm/bcm2835_peripherals.h | 10 ++++++++++
>  include/hw/arm/raspi_platform.h      |  2 ++
>  3 files changed, 38 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
