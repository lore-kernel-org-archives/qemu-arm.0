Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3439845wrh;
        Mon, 29 Apr 2019 05:15:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxv2tZ4rv/D6Ln9UcNgU1MovzxlOg/EIBZ3CzPGuJ3qp0EVOJgNBUWxgVojIs5DcP1c2brE
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr7272630wrw.13.1556540148019;
        Mon, 29 Apr 2019 05:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556540148; cv=none;
        d=google.com; s=arc-20160816;
        b=l3mHlrt0dKYWQyEwnsDvXFOWHOij5hv0RYyoYf2jPN2ctIDVws9XT1KVho3W6t226d
         zxmj3+STFnmiaGzPDozz1TrLXcAXz9j2AJCRkEpkQu/HBDsEb0Z9jtK+PaBm+NJQ5VrL
         aTA5jgqCzcgN0FLz2t5stP3UtvyL+by8XvKUScK6P94LDJswOAY3N/z8C+T0JOMfcMIW
         ADa53SwM4rAkIiu9apG7WyNJ+Kf7c1Gi0tNXE6LxRucl/90fz4GMW6e9yonVWa95slGg
         aYEpRU7Ct+RlGflRgrTjzWxZ5IuLe0AmAjwVvsz0ayXtxjkiqJhFY/En5qczxNjPc5Hk
         vX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=zxAE7AJJ3IqVcvBrGvcg9/NZVkz9VxnKmKVZLGSvHso=;
        b=QX5J8H6irkxyL7iGQIz0MmgxhVKGSphk4zdRlVJWUkdA4Mo0sA6hTK2/AOFbm8Az/F
         arAC78gSehhLQdGv70G7vwnGMcUtIu/fERmWRqgKRWLng+xvdYdC/Etk5/RJGG8Aad9V
         v9nN2Dx5Mfppj4qhGJrtHUgAE8p5ehQ6TDXvmz3m6RTh9aeHOBC1/PPV8a+SXYDwkn+D
         Lv4hSpiNw/CXH/SLyFTurYONJJDsvORaZYrI2++FRIZ+vtZPj05yQU5kL6SRKITVbZ76
         YxHbpd0X6qZqWIY9hrnKhUm7d/sv0P1FkrdI2AaQ1h/CSnddFwg+oty9JsqqtCzrqEph
         4rBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TrIEij6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si491917wro.159.2019.04.29.05.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 05:15:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TrIEij6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hL5CF-00057s-3v
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 08:15:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL5C4-00057Z-NQ
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 08:15:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL5Bt-0004j8-2B
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 08:15:29 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46881)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL5Bq-0004hP-Fz
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 08:15:22 -0400
Received: by mail-ot1-x341.google.com with SMTP id 77so2203797otu.13
	for <qemu-arm@nongnu.org>; Mon, 29 Apr 2019 05:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zxAE7AJJ3IqVcvBrGvcg9/NZVkz9VxnKmKVZLGSvHso=;
	b=TrIEij6pXceAdibdoZPa+RHKPWLBzZwDOaLUww3sCndxuvmpnAI/AKo5m9jxp5JSSy
	WcFSDK3815ZNCGUNGSEnGr4R7TLja6XZjcviwhcJTSznPDd02ZLJIh787iGJl2MbNbNE
	ENJfDD+Lzvn8pSlnJu5Xb48QWwK5yMAWcmdJoh/K9i2kPVGXqad5yE4BQtBVDSrv83PM
	3OnjSz5DoxTzvhS1Y33H5rHA15Zeopbzg7S7HpPLkbQlikRh5aNWUfcs0KRtFTwb8RTm
	7ZRNRw9lPzj0i/wbJSqmwM3huMKqveMA/87KhIOfW/JfZ4JhnuYk7O7aLi8JYxhB5Rs8
	LrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zxAE7AJJ3IqVcvBrGvcg9/NZVkz9VxnKmKVZLGSvHso=;
	b=sh8dPXLbShrc14Vzx//gBtDk310o2D+upqsSg6jIBtdZzkcnOu6HNmD+F66rg0gsni
	050jq/mDH89WLdWXV7sBvdOwwh4lmemv+rVKH7caj4rpDa8aihVFKXI1M7G5zraL4ah4
	xlLKoWxrk9qZ+B7R0kQo7NUtOvg0vlhURfUYuMOHN6UVik8CtFhFX1H9yS2I7esfLpId
	vdS7psvzhNdwcbNuHv8yT1RGRPowBLYOgX78qxbCOhD7CPmvl2fUPaRKJDDSfLOmmUh0
	hYWVTr4SVetQkzg1E5zg27/+bbkUJbTH+B20OcW/4oWKP/AF5Mo9D4m8HBfuhpzR4qk1
	8gVQ==
X-Gm-Message-State: APjAAAW0zQPwFdCvN/TVigjrtFIkfzXxegEzxVUT3FMSNL/WxJDxh9QR
	H5ePD8/MZaFjFOJ1O9B8YXkrrkpxbGrsros8acy13A==
X-Received: by 2002:a9d:57c4:: with SMTP id q4mr3764395oti.151.1556540120500; 
	Mon, 29 Apr 2019 05:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190427133028.12874-1-philmd@redhat.com>
In-Reply-To: <20190427133028.12874-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 13:15:09 +0100
Message-ID: <CAFEAcA9ezbte4fq_Wyic3tv9+bnkQJGq9REuvxie+QCQpNL3bw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH] hw/dma: Compile the bcm2835_dma device as
 common object
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
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RED3pvqI3k9W

On Sat, 27 Apr 2019 at 14:30, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> This device is used by both ARM (BCM2836, for raspi2) and AArch64
> (BCM2837, for raspi3) targets, and is not CPU-specific.
> Move it to common object, so we build it once for all targets.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/dma/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
> index 79affecc390..8b39f9c6004 100644
> --- a/hw/dma/Makefile.objs
> +++ b/hw/dma/Makefile.objs
> @@ -14,4 +14,4 @@ common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zdma.o
>
>  obj-$(CONFIG_OMAP) +=3D omap_dma.o soc_dma.o
>  obj-$(CONFIG_PXA2XX) +=3D pxa2xx_dma.o
> -obj-$(CONFIG_RASPI) +=3D bcm2835_dma.o
> +common-obj-$(CONFIG_RASPI) +=3D bcm2835_dma.o




Applied to target-arm.next, thanks.

-- PMM
