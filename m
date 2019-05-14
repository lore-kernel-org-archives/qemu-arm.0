Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3814420wrg;
        Tue, 14 May 2019 03:08:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxapNYBElgrHjHx/8xo+DMaNaEBLiJP74fUUHsIzpDo2Cf1RCaVaKMYOCjbEChmZtLFM58
X-Received: by 2002:a17:906:4244:: with SMTP id r4mr12122828ejl.211.1557828483982;
        Tue, 14 May 2019 03:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557828483; cv=none;
        d=google.com; s=arc-20160816;
        b=Zs6LGdbEAf1tYp5zHVGRlVlkf3YbZfy6A6W3wZqL3qOBJ75yqPRd0WqzUc5vpwSAuv
         pV07XrjrZA25Y+G8t4lL6QaefxEGfg6XCAOnGqgtBDTL4R97kSXHVTTA0eJclNNGbBNi
         mp2CIBL+cubHF0m/x7TL99yKEzrOfyuH+6uIm+yfMk1xngrKaOnst9GGp7xGkW0rT7Mw
         Jpr/HbM97z+wjRt5IC7tDU3THUvg2lyyORp6Vm0JM17CU59mBp/Dzrc4rRCjZphbbOxk
         LaWSEAxEpX3L7TRCk0CaHflmc6X+3MbglwmH+9YG0OuChXJqaeBAXNMOOispFrpAN0cw
         MqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7tU1y6cgDjkQulfnQj1uO3ZTQRYqn7MfRQezNbpW6lI=;
        b=dgvsy/715I5c2qwBTIBYn37VyJ5VEXd2W66wMBQnlcPwdqdx6t+7EwiCqxF2r3sBOm
         Uz1ycPgj4eViFyUmJ6mWHp6CYzDlfm6NrwCMQL964hXkYox9ZDC5YtG4sqjuRdkti/UQ
         pmG2Y9HiBVf8krWpFh2WfNC2K7d0+Epuvzii1N/4eFh/4GTpmExzYTaAjzTA0N6GnD3L
         8smxKgSrQO9BWrYXERAGVEWrx0TcYtLWvPgFGiplGiEwV/PnwG5jyXyEDczRYnHW8feP
         xNjFV2rymSe9b53mPsNGBYbhjArRt8PB9SDjeVxxmNCLWhVAfJIEr84+sJmg6/9np5Vq
         pmuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gczBr28G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y22si3670752ejr.184.2019.05.14.03.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gczBr28G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQULr-0003Km-0v
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:08:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hQUKz-0002to-El
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:07:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hQUKy-00089T-EY
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:07:09 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34035)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hQUKy-000803-8D
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:07:08 -0400
Received: by mail-ot1-x344.google.com with SMTP id l17so14696504otq.1
	for <qemu-arm@nongnu.org>; Tue, 14 May 2019 03:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7tU1y6cgDjkQulfnQj1uO3ZTQRYqn7MfRQezNbpW6lI=;
	b=gczBr28G3EVkNl4b5DarsJhVdC84KqN522VaCrnetnuMGTqQiDKnpKktIs5SJWUQgW
	gKGI5G33Y/j9c6V/QsFNZjoecs6RdYOG/k/rh6WbM810+BE2a2t+AeFpdiDfumjrwrZk
	oHzTIx1UiaywFc2fTgtJxiVQpyXqpbp26lmffxY5UmH7UZvLwTDJjqLpH+9mreqN73DZ
	0ZqWnddodozaF3MrbJ/LQfA2HaHh4yFTTIoR898vxIz8qPjW0kE1UbyyUJp31Pe8I7nn
	LVJPFFjivj4c6FLoQ4lPKzA2p/D4fQ/cUF1dLYs+VaZPRtod3lIvgNik+cG13h1YjJBW
	fOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7tU1y6cgDjkQulfnQj1uO3ZTQRYqn7MfRQezNbpW6lI=;
	b=ZjUNGKCZ+Z4wkL9r8hsMQzAUoNVVlsAkIV6R8QfmcYBA6XqpgKzF7eKifiitygf/k+
	5cg6cYPQVsTz1XcTU/LDzYvYbwtEw0zfMIFFLuaE9w+vtZrJoxoGaOSYIs9XGIVSTJ6y
	y3OtbrL1A8suSdARjW7szyoFuF634XjW3bEeeMAx7CU9KpALzK3+RWqeN7BeLG+atByc
	7lH55Rct+ULE2Er5FeJNBdVkoOwD568YUdjOykyeEnAzslipqN9QI7UAOldMFwUFkoRy
	XnMnhBcjNCRmPtMEhfmvqsyOLSc7GqynnBM+qjKVB5yLmZxz6zF2SbcscXosL+NPc7td
	h5WQ==
X-Gm-Message-State: APjAAAWAsPANMF2b45vJuOxzO15zpG+7vNn1skme8Od43lFxWZ/teMnh
	7BVrTWAHpjmbCJQZ28BszB5pZW5KRfRk91vhbbT8Wg==
X-Received: by 2002:a9d:5e07:: with SMTP id d7mr18983749oti.21.1557828425254; 
	Tue, 14 May 2019 03:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190514100019.13263-1-thuth@redhat.com>
	<20190514100019.13263-3-thuth@redhat.com>
In-Reply-To: <20190514100019.13263-3-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 May 2019 11:06:54 +0100
Message-ID: <CAFEAcA9bGr1249Ofx=TXLK3JNs1KMWTnRR+-FexKr__0AJAipQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 2/4] hw/core: Add a config switch for the
 "or-irq" device
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dgGNw1Wgpw1a

On Tue, 14 May 2019 at 11:00, Thomas Huth <thuth@redhat.com> wrote:
>
> The "or-irq" device is only used by certain machines. Let's add
> a proper config switch for it so that it only gets compiled when we
> really need it.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/Kconfig        | 2 ++
>  hw/core/Kconfig       | 3 +++
>  hw/core/Makefile.objs | 2 +-
>  hw/pci-host/Kconfig   | 3 ++-
>  4 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index af8cffde9c..0bb3bbe9d3 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -277,6 +277,7 @@ config RASPI
>  config STM32F205_SOC
>      bool
>      select ARM_V7M
> +    select OR_IRQ
>      select STM32F2XX_TIMER
>      select STM32F2XX_USART
>      select STM32F2XX_SYSCFG
> @@ -424,6 +425,7 @@ config ARMSSE
>      select IOTKIT_SECCTL
>      select IOTKIT_SYSCTL
>      select IOTKIT_SYSINFO
> +    select OR_IRQ
>      select TZ_MPC
>      select TZ_MSC
>      select TZ_PPC

In cases like this where a device is used both by
an SoC and also directly by the board code that uses
that SoC, should we put the select OR_IRQ only in
the SoC's config, or also in the board model's config
(ie, in "config MPS2" as well as "config ARMSSE") ?

thanks
-- PMM
