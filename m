Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3771893wrh;
        Mon, 29 Apr 2019 10:41:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyubyKrk7gOP5m3AyRjb2nRSDrb6f4ibHveGfarmSypx7vWQPR+DbfdxZvzYy8r5jO8m2KW
X-Received: by 2002:adf:dd46:: with SMTP id u6mr3853632wrm.228.1556559700777;
        Mon, 29 Apr 2019 10:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556559700; cv=none;
        d=google.com; s=arc-20160816;
        b=M5svPZTSHGuylhFBTPuQuLJllevYchUPZ0Ra5OmZvyzo0gdRxI+FzQiQpnznMK6HAh
         9wJ50sX3s5Dyi+uopUhmB/0TsO0ztCxIyDkmCmtdszyU0QO2u+qbjyrate8N0e/kQQ61
         Kaj/kf/BA1pH+WrkfKwClS3h7R9NJJGLwoAREgo2jS6vF9sCUfBVkVIxZWjJApm1YKs7
         vxK3dFdytpdlBop7xKG5wfSoqyPe2sM3nQwiTnt8jqDl+o7teUR/J7pwh3AdZ36NXmLr
         RyFs23MqD/KCb+DV+B8FIN0CGzS8LDtRTpmE418TkH+No3onF9dMsH5Ars/nitqr8Kcw
         l/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=gLS9I0ngHrnn3Ujgur6YQTjnpkUCsdPWux+YrreoIwE=;
        b=OPaV540EJ8MGr7xXVJ08zW9/MaT+YAmuAAbiGVgK7QIhgSQ3uF5WqtDsOKOZ0CezBk
         MO5ZO+eWuPxR2ffyazGTL4N4sZt+gOYV9s3E2BXnPyo/b7v84wDhu1I8jHInAgUkaQpb
         8au09uQbRFiX7PgOUe01QAAJ2bHJOgtnh5lN4ppCERnhOT6RAu9zh39dpGBPYgV5yLZb
         0Ct+kiw13tl0B91DVZyP2fFddgYRXs/Trmk68v7VKi4F2dDiTAHzi1MvucgS9+3MT4E+
         Cw9wUQTooebVUAfD8gWx6/kMVQPyOhqOKQcHZWzPE1f4YYx2xGb6fdofk4B+UI051S27
         0+QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gFoKaeSq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m62si98083wme.23.2019.04.29.10.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 10:41:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gFoKaeSq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:32977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLAHb-0006WM-RT
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 13:41:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hLA5i-0004RA-0m
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 13:29:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hLA5h-00069l-6P
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 13:29:22 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:46677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hLA5g-000699-VZ; Mon, 29 Apr 2019 13:29:21 -0400
Received: by mail-lj1-x242.google.com with SMTP id h21so10092400ljk.13;
	Mon, 29 Apr 2019 10:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gLS9I0ngHrnn3Ujgur6YQTjnpkUCsdPWux+YrreoIwE=;
	b=gFoKaeSqqjjUIfHjdi1V2wL1DTbZocQbM+iMoydPFobJyCX4QOGfKyEzHalbfAhjJ/
	dKcVa+3jzEnBXATmT2hH3xNVuPDPShGAzqbI3ZD3Ynv6iyyu3pCi7mZJR7+sFdfRcVaC
	qkgcVSyTVnGvh1MnlFfZp+Mywd4WzcaElsqor1NEzMLwWuk+6JGILYNYodytP3ZxhZEN
	3j2VCZTXyZ1EhhsKD68CzRFFAHFWOhcAPklJBQ5TXjM9uE+wSKjQZP/Z3uGNunEH6zWH
	Y21b9FjGypkJTfS060SrlxvymIcOtq/icBZYRC0sMbDFAuymvKwg+NpTWE2sUWEX3cPj
	rffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gLS9I0ngHrnn3Ujgur6YQTjnpkUCsdPWux+YrreoIwE=;
	b=mRPzG9wrgiHq8cqEOuNzkmIp35/SFpGueDsfTZSyiKYrt9iOEzEgGPhmwNRnVtNtdM
	nDEg7QIqV0GuBlBribqUCEKVIP/tsYRpcWw4FLrH0Jds3CPejZMnKH2h6Bj524oZ9ZeX
	RJvMVgbrkn3thbOqlvj0by7lW74QYfwthFg1uWStBQnoYUWKvaJwamkwrYY2Jy2uUxwL
	z3XFG8MlSGPT0TS2tET4FHOLmWbO9+lRvxQkngF56VQBeMzpbmq2aGlVcci5HIKtYiSN
	WIfrGEsx2fCrKOhNbTpXsDvmufBLXK5fB4x5uKSHn0KW/kRe0JUnQUbRdUgsEVVt1j0n
	q0GA==
X-Gm-Message-State: APjAAAWqyMwoVrtdhCu53rIVXj5vk4bdTmBN+8oqQp9e2RBtfq8JiAEm
	Nkq4+HTdShDhl4tqIXOBlLhGf4+appEJbNUv7nc=
X-Received: by 2002:a2e:5b97:: with SMTP id m23mr4739150lje.99.1556558958689; 
	Mon, 29 Apr 2019 10:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190427141459.19728-1-philmd@redhat.com>
	<20190427141459.19728-2-philmd@redhat.com>
In-Reply-To: <20190427141459.19728-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Apr 2019 10:28:49 -0700
Message-ID: <CAKmqyKOESUfmvHY73k6NsnZ0Gr9LXuHwOUDSn2vXQGXRfmWkOA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] hw/Kconfig: Move the
 generic XLNX_ZYNQMP to the root hw/Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zNuk6Sjg7yrT

On Sat, Apr 27, 2019 at 7:15 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The XLNX_ZYNQMP config is used in multiple subdirectories
> (timer, intc). Move it to the root hw/Kconfig.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/Kconfig       | 3 +++
>  hw/timer/Kconfig | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 88b9f150070..c3c78f43eb5 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -72,3 +72,6 @@ config XILINX
>  config XILINX_AXI
>      bool
>      select PTIMER # for hw/dma/xilinx_axidma.c
> +
> +config XLNX_ZYNQMP
> +    bool
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index 51921eb63f1..eefc95f35ec 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -34,9 +34,6 @@ config TWL92230
>      bool
>      depends on I2C
>
> -config XLNX_ZYNQMP
> -    bool
> -
>  config ALTERA_TIMER
>      bool
>      select PTIMER
> --
> 2.20.1
>
>
