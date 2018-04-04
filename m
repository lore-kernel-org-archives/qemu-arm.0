Received: by 10.28.71.155 with SMTP id m27csp4771369wmi;
        Wed, 4 Apr 2018 04:55:03 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49dKt5fks5aMfFw1dR82PVzTtX3fNFyDT5sOsC4odGaUjFkhWuR8i5Sa9AspTreSDIakjsI
X-Received: by 10.200.40.37 with SMTP id 34mr25024746qtq.111.1522842903773;
        Wed, 04 Apr 2018 04:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522842903; cv=none;
        d=google.com; s=arc-20160816;
        b=f4HydJa6rKDKC5EiaQ5RLbtjqgaM0wBd7B1IYaByF9zWj0KHeiFecA8ym6ApCiU33+
         zaBPcZaeuB2azfnIpMVMeweB6kxn70PnxqwgeK+7aaMVa8Xw/0VX9G4X3fxwBqANzHuQ
         8um8alty3xjvFoN5G15Ce491izwEH/cP66XMerNdgc8nhSiVhHReZ3irKjUjWQz5Zi4W
         ZFTBD2YMtuAYMOntlddyEbH8UYMbCwTGYji3OW746dFT4MTMJNiZn3BcE+NDXEIr3UXv
         NLowD88nZI3UIv3ceoVUu7m/+eqYuVETQMfco1xrhomRN1H058E+bpWc4N4baVFZZBLn
         +M6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=VAEs8fC5R6rF8fi/IGCZodvcY9NGZY57GLsMnWFqZU8=;
        b=ZYNCKGlftCshyLScn556PtDsnOJHB1N3MG5GfA/Mo8hCbMpMcmw1HMkn0rWChpFpJy
         uxU5+X12/BvKw9DiWllQamSfwWuUhLiJ3MK7wn0fCWFzP5bwnf/lDW2fBRaJuIbGCIPQ
         6nSeM/7d8Dk2mCabGjrnHmedr7BQeKuCn33G2gbJiSsfGPzZ6VRqgcq5ETY4g4cP87v8
         UKfkvhLjb/ljcxKcJf1XmI/me+Y5ww+5uqyqRvFv5I1qmDQU+m2z+N1hBHlv5SwlHqGi
         37F7xGB5Nne4bYsuGHckkovd5UXXqW/0iWpBHoJYYzAB3Lsqgk5yQkLeU1kQJE0b/rez
         9FJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uxk1ipbG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i26si3271936qtc.356.2018.04.04.04.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 04:55:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uxk1ipbG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3h0J-0006qo-Aa
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 07:55:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f3h0A-0006pI-3Y
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 07:54:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f3h09-0001wr-Ev
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 07:54:54 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:42462)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f3h09-0001wI-97
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 07:54:53 -0400
Received: by mail-oi0-x244.google.com with SMTP id l190-v6so18948399oig.9
	for <qemu-arm@nongnu.org>; Wed, 04 Apr 2018 04:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VAEs8fC5R6rF8fi/IGCZodvcY9NGZY57GLsMnWFqZU8=;
	b=Uxk1ipbGwk9pgQlQ0c3jd+VoSIpitVuuxwsNNR1NqTOaaeKvwmHZ9GGAzn7dPPuRRq
	30j1NM4u4PrXGw8KYD6gBxaNAf07at9+x9FsGZuU+EHfWlMCkWSjMxx6Cr9tngk5dTee
	XhrYdUvm4ghym1P2iDLyFt11gHNs6juNvuK+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VAEs8fC5R6rF8fi/IGCZodvcY9NGZY57GLsMnWFqZU8=;
	b=LoaY52LY6qf/piCK/+3dgRQlDcIkbHnpwnfGLpnnyXro26tSmTKvNUb3eBanKII16k
	2ulPnqunWY7/r4mgFzzrtbqU8a3GsXU9FNJY3FY2XtCmTGa9KI7Wva71Fg/aV20vgLEG
	gAwTsomEjxajTZtM2loEwYaNXDAS6AfmkHOaK7VxP+AesMEUx+M6y/yagYNgyuLeQbb9
	/oqvDjf3Kn3uu/t6WUWGm4g2Hi+DVNiVoJ5ba2/yD7ujaXprF/AMLI7S/9pCvIK7YOFZ
	jzp/j+VqSDGNsCDteNCtlMdNiCuQ2+CRZw1Dz25CusgHAqd+8OEUCLrcd1ApIdpURsA/
	pu2A==
X-Gm-Message-State: ALQs6tBymBmepJZS2Vt4nnc/EGGmG6Tqw3JBBtmZg2CY63PAsZmIbGpL
	lyNbi66S9nc0og/tV0SZ/ZysW0IUJkiicBe5MJ25Kw==
X-Received: by 2002:aca:6157:: with SMTP id
	v84-v6mr10170787oib.12.1522842892464; 
	Wed, 04 Apr 2018 04:54:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 04:54:32 -0700 (PDT)
In-Reply-To: <6431180d-fcaa-6a9c-de22-5ded33433be8@amsat.org>
References: <20180319161556.16446-1-peter.maydell@linaro.org>
	<20180319161556.16446-2-peter.maydell@linaro.org>
	<6431180d-fcaa-6a9c-de22-5ded33433be8@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Apr 2018 12:54:32 +0100
Message-ID: <CAFEAcA9sAsrcw-AwZU3QW5BQJfi2td3pi8zOS2iVK09D9qAH2g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH for-2.12 1/2] hw/sd/bcm2835_sdhost: Add
 tracepoints
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cqGelDMFODy/

On 4 April 2018 at 12:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi Peter,
>
> On 03/19/2018 01:15 PM, Peter Maydell wrote:
>> Add some tracepoints to the bcm2835_sdhost driver, to assist
>> debugging.

>> +# hw/sd/bcm2835_sdhost.c
>> +bcm2835_sdhost_read(uint64_t offset, uint64_t data, unsigned size) "off=
set 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>> +bcm2835_sdhost_write(uint64_t offset, uint64_t data, unsigned size) "of=
fset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>
> Can you use the more explicit "size_t" and "%zu" please?

The argument to the read/write functions which we're tracing
here isn't a size_t, though (and since it's only ever 1/2/4/8
it makes sense that it isn't a size_t). What would be the
point in casting it to an size_t here?

A quick grep through hw/*/trace-events suggests we don't
use size_t for tracing of mmio read/write functions
in other devices.

thanks
-- PMM
