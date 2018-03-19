Received: by 10.28.91.67 with SMTP id p64csp2517012wmb;
        Mon, 19 Mar 2018 04:57:50 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsm67HW6DMtcdegYLRdVA3AaB8NMYQsAp6nb+VGGQyE9KEQQ9RvowHwSH9+CV/JBuVtG2Mg
X-Received: by 10.200.26.251 with SMTP id h56mr17383453qtk.223.1521460670774;
        Mon, 19 Mar 2018 04:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521460670; cv=none;
        d=google.com; s=arc-20160816;
        b=Al2Cra4sWwApzVOLC8EEtcR6PrClzEtlp0x7uibIqjUOU9ECdo1SHnt3hFSWra78NZ
         zaSHxiV+LcV8wpfSH8V/Ro3Rh3F2OY4terGNax6VWe7ZG2KGuPqihl7Pc4CMYRlJykLz
         Tz1UmVOUJH+CuLJTJlGwhUTQG7hxL0eNcHcVyagap+H2eS5gtVLJ2nTmNyVBVBpoqcc/
         /9+3632SDCo6UZ/VfIV2v0/83gCEC9ZDPCzOsagqnMouoihQyxoFID//3d/3RD3YULLP
         I124dfKfSCIJ56QtUjtCm/arheuBQlSRqOECCkg9aQ55KI+1gk0bWxuEy9FfNnHxyctE
         o0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XGayUGHq/sw1ZCMaiJ1Lb/LJIaqKJ9BNci2EhHSA/bc=;
        b=KG1CKiVtGHleQGos5LaH5UUy+8flBDjGawBwZqhdhFq58YiV9G7ny9Wigw0y2VUnRT
         NyZorXHf+m7FotR0cQLiI1eenDPHFlEwvF/Hh9MDwYOjvX0gBrrDE6ItOwRdBtX9qPkg
         QTfR2IOKBRP5jy3OZ1y5TwJ+zAE4KkQ8AmWID49kQ0ImH4Typ0CcXNbbKlr8W8kePqXN
         29cHuX1ZPMQcOFod5z0qjyaTtlDk8pHROmBjnB/SNrQcMfDZDRkux8WvZqIMNOY/k5/a
         sYfOjACcC9kLbN6sluhb5Uj2H8W29JbrGIc5GJVcLH/6zmOo14BhFp3yknEOzxZ+dfkc
         dJZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eiSEF96A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 96si3103616qkt.393.2018.03.19.04.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 04:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eiSEF96A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1extQE-00062N-B3
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 07:57:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1extQ1-00061S-8x
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 07:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1extQ0-0002Q0-Cv
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 07:57:37 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:37301)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1extQ0-0002P6-6u
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 07:57:36 -0400
Received: by mail-ot0-x241.google.com with SMTP id t2-v6so7783171otj.4
	for <qemu-arm@nongnu.org>; Mon, 19 Mar 2018 04:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XGayUGHq/sw1ZCMaiJ1Lb/LJIaqKJ9BNci2EhHSA/bc=;
	b=eiSEF96ANzirT1IzxzF+5ZLVHTraLzCBn4JvVv4O2JoZ05m9W28hOvK4Ah4kh/8teq
	klET/Qq1C5rlTUDg5cMR20/Xy4IHmEYyb83ZEn0PQnzlzfupumad1u6CBQAkQTALsSLR
	RpL57XsoznytJabrCEGoLp7CPsHicf7D5oMo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XGayUGHq/sw1ZCMaiJ1Lb/LJIaqKJ9BNci2EhHSA/bc=;
	b=D2X5UZRwDxWaYkGE7YE8s0itIIVgak+zr+swe89nj+3I/57t7YvU8B9dPGGN2jth9I
	E1kjWDoTJy0Q9SZDHNd6aif4q4VqRsMO2fpnU8z81z8x6w5Ij/CP+z177Z5dN1KUzgmR
	ieQMO1JUGwsK3M9y06Oxag+s4scP6QRLs+Qt5cdtD9M7WpzE0GDcRhI259AGOAMUncnj
	5LCYKu+N0A/IlrzsuJgFvO6BUWVl/FpZMOFFFxZMX97Lema5Hmo/Ad3Iu1952uu6bFDk
	W3vT5Js3GRBfZMuX6SSa/KpQNn2lKGJEE+Z9YjT+mfnCaOi+Bg2KM34/oDoYULlGVCXp
	4aHQ==
X-Gm-Message-State: AElRT7FZtox5MMYEe6fxuoPMB0MbhUtI7pZ6tivbtyyIZc0aptruYuHU
	2B1uNvTQrfycLKlOEscZf5QQdVm1spmG1IpdVkZESwk2
X-Received: by 2002:a9d:1722:: with SMTP id
	i34-v6mr8047234ota.210.1521460655292; 
	Mon, 19 Mar 2018 04:57:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 19 Mar 2018 04:57:14
	-0700 (PDT)
In-Reply-To: <20180313153458.26822-9-peter.maydell@linaro.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-9-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Mar 2018 11:57:14 +0000
Message-ID: <CAFEAcA-GC505pF32VCJyHy8-8cP5C+gqY6mm-iMoiZEmWqBaRw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH 8/9] hw/arm/bcm2836: Hardcode correct CPU type
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PQY21q/L3OQM

On 13 March 2018 at 15:34, Peter Maydell <peter.maydell@linaro.org> wrote:
> Now we have separate types for BCM2386 and BCM2387, we might as well
> just hard-code the CPU type they use rather than having it passed
> through as an object property. This then lets us put the initialization
> of the CPU object in init rather than realize.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/bcm2836.c | 22 +++++++++++++---------
>  hw/arm/raspi.c   |  2 --
>  2 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 7140257c98..12f75b55a7 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -25,16 +25,19 @@
>
>  struct BCM283XInfo {
>      const char *name;
> +    const char *cpu_type;
>      int clusterid;
>  };
>
>  static const BCM283XInfo bcm283x_socs[] = {
>      {
>          .name = TYPE_BCM2836,
> +        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a15"),
>          .clusterid = 0xf,
>      },
>      {
>          .name = TYPE_BCM2837,
> +        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a53"),
>          .clusterid = 0x0,
>      },
>  };

With this change we need to also add
#ifdef TARGET_AARCH64
#endif

around the entry in the array for bcm2837. Otherwise the
device-introspection tests in 'make check' will fail trying
to create the bcm2837 in qemu-system-arm, because there there
is no cortex-a53 device.

I'll just squash that into this patch...

thanks
-- PMM
