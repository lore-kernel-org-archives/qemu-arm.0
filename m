Received: by 10.223.161.27 with SMTP id o27csp876806wro;
        Thu, 26 Oct 2017 09:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TinRu0/aIKNzOlM7LDFHPn1jus++mLE/x+Uz3EdPnhUwBufKoBnl5QslcKlQ/GZPc2iFCz
X-Received: by 10.37.175.145 with SMTP id g17mr3683309ybh.22.1509034587550;
        Thu, 26 Oct 2017 09:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509034587; cv=none;
        d=google.com; s=arc-20160816;
        b=r2KuFy4YeGFU+GzLMOpk+m7HFracfGtqS8/ImqB0lqG/NCv/2oEKxK/FVKEBDK5rVo
         HLC/nM806JrUWrAEL+1PzLMqZY0nFlhu7Bqs8ZPQvqRUSTPRc1RVlHrB2epB/ECdP6eq
         yUSuV1FDUk78NvJm/8cB8GFcToXobxaxfmLxerD9+PzqzpZvMqPLHAgwWNlNqyNYZMkU
         HP6UP7Bdi24qf1luaANc/aAhG5ltn2FiiXVstg/B0ivVZddCbvzAiaQDgG8sqZst/rFJ
         X8sV1MOHRRlfVcSClnywnw8fRmpr4lftP3H4sx3MBg4jKij+ylhWwXnWztvvjv28F4HF
         KQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=U6j+JaeyI2MtvuD0/La0Kgi0+uCPwEwgEqgahXLE+Dg=;
        b=Z1h2vEoK6+sQJlGQ3sObY3kuovB0ZxFQ38Li7fdexS2SNdJJb8Mzn3BjM+pILnpDVO
         PwbfPg6YpDuInOUomhWaAOHvCySYb4uk/9sS386l/4bL/w29dROC5hbMIg1rVA7Iz4dm
         OFxy57/fuMlj47dOOm/p1R7dBjvYsMi1ybxDCuw+a40U+YxRwlXS9aD0vF9WHyBZSW5h
         NXsm/xZJkAkcC2vWdB5+6InWx8UCwo7lVRBi5QL/7jeO7Q1NZyB6uqA6xIDADXA53nni
         SG0tFohR+PPRMpUv44ka2/TGQvOx6TiQL+olSQMA4KA+vA2WZ63P+8N45MIsKSBlAUTa
         iAvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=Q8OlsPOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x7si916403ywi.7.2017.10.26.09.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 09:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=Q8OlsPOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:53761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7kpW-000655-Vw
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 12:16:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7kpJ-00062D-HR
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 12:16:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7kpG-0001w3-RK
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 12:16:13 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:36921)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1e7kp8-0001s6-5g; Thu, 26 Oct 2017 12:16:02 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78f35d8b;
	Thu, 26 Oct 2017 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type:content-transfer-encoding; s=mail; bh=kYS5ZS+CdXRU
	6nWog2XaBOXTQx4=; b=Q8OlsPOFgG5CuGMt1LyblCORCu7b9sgZu/T5X9ZN7KtX
	iimN7z4O+9co7UULB2nmCT2mBTRN1/dhpxO2JzbuwbDscZass7Mp/fDGeYri/3pG
	XR6Twt6oDCLmVhrpdtw3HeIxHSy0IKZ1A4xbpJmM5avCRiXcaEQ4C9D2suhqT5Uj
	xKMRQlcFvV0GlWu+LD3pMQT6Qm79G6ZwJfmP2lH1wVwtBVmCt90MWO5Unx2eNnCH
	1CqwiQTeDNRgVXuZQAZXNHonYcYC60gkU8RmdCnTHH1uw7w8URwg1MK3kORclm31
	u4mBXO/N5CojUyYh0VoJ6w+l2186yn9dZijYH9t6uw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 550e7b83
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Thu, 26 Oct 2017 16:14:14 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id c202so6535922oih.9;
	Thu, 26 Oct 2017 09:15:58 -0700 (PDT)
X-Gm-Message-State: AMCzsaU7hTZWEo0APyu+XWcAcz2XNxzJq0TxiwqpIj3XY1pq7LxDTqk5
	8AsBL8vLGYtQKGdOWASv2QlJ6vvk8N+42YRxSUA=
X-Received: by 10.157.19.10 with SMTP id f10mr3130092ote.493.1509034558215;
	Thu, 26 Oct 2017 09:15:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Thu, 26 Oct 2017 09:15:57 -0700 (PDT)
In-Reply-To: <CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 18:15:57 +0200
X-Gmail-Original-Message-ID: <CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
Message-ID: <CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: support 4 serial
 ports
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wCJCJMfbfOmI

On Thu, Oct 26, 2017 at 4:36 PM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> This has *never* been guaranteed or indeed true. It's just happened
> to be true for the x86 PC machine and perhaps for some others that
> you've been using. For instance, the MIPS boston board only has
> one uart. highbank has one. integratorcp has 2. The microblaze
> boards only have one uart. And so on. In cases where we're
> modelling real hardware, if the real board only has one UART
> then we're only going to provide one UART, so in some cases you
> just have to deal with that and have some way in your communication
> protocol to multiplex across a single communications channel.

Interesting. Malta provides quite a few, which is what I'm using on
MIPS, so I guess I've benefited from the uniformity. Since the ARM
virt machine is virtual, it seems like it'd be worthwhile to make it
broadly useful, and adding a few more serial outputs is basically
free.

Right now on build.wireguard.com, I'm just using this horrendous patch
that hopefully hurts to look at: https://=D7=90.cc/iKBdlvI3/patch (since I
only need 2). The goal would be for everything else to remain the same
in the deployment, but to not have to use that patch.


>> Could we just do the simple patch of adding four pl011s in there?
>
> I'm still thinking about this. (You definitely can't have four,
> though, because we already have 2 in the trustzone-enabled
> config, so we can only add another 2.)

The trustzone one could be the 5th? Since it's only useful for trustzone.
