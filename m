Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2712676wro;
        Mon, 5 Nov 2018 07:26:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5drFrDWDkpGxUNLLdM/rnlIrw7TSEeiBTUxrJ1Dx9m0CzLStLifJ+t79HNjIN2brj1/Dhci
X-Received: by 2002:ae9:f40b:: with SMTP id y11mr20836790qkl.228.1541431586868;
        Mon, 05 Nov 2018 07:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541431586; cv=none;
        d=google.com; s=arc-20160816;
        b=H42BmCm825o6irNz6Bx6d6FHzt3OmfZBEvbnTWm4np/P7JP5/s593p1PDBpxX6s12U
         i8rsR466ti4+RjPB6ddIeJOi34C8EQD5uN70tPYJxYjrtyqSXmK2gWkzV9Gq7sTp9+1L
         wdDjbYzOGXORa3kfs2turw93uVeWVjxiiBFGd6ZWISxTsfEsbj24KrvEqmJECGFvj1DY
         hPT0ihlyjGfClVu3dtf9disXjqF+JbG7JyXz4VwD1VFGcC1xbC5/QPwaQaHDWLC2f//z
         adrLjoCnB2Bx99F6nYyGiSxCYcFBttP9eIKXCgatJ1/kKczG9LbZe58AD+OEhXLgE3RQ
         vZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=v9lTJYqpFGH74UtAVSiyI56P9Y1ObaopX/dO08bHW50=;
        b=wOpuGLbwHBmMGjfAC4exveMGwr4b++x+G7iGoopyN7wc2J5EExNe+CAfrrkD9aeYgS
         +O5Zn5OYZSfpQP+WY7BQNirNiDgDi/7Dnir7lp+4ftRdkWpgkWAV1ABGOVy6s/vX1xhh
         U3YqKNNsNpblbl4dgFuB9hBwI04qU1k8Nx9xAKLaGEEEIw66JydTWaon5L7eWf8Y+Mwk
         j8Ar9+aUvQclKqpBoDbWsmNy32n1jL3EQfc7u8nGkYX1LaVN+xNdxWCwjgUzKHphRZUH
         0kqpCe4Y8oz6TNk69+vc7pAwZBwvS1CanR5qCKudxCUJ9fikKEGYgcg8ZeVfYth1espL
         eGag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eVQeAwtI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m15-v6si3791866qkg.204.2018.11.05.07.26.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:26:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eVQeAwtI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJglm-0000JH-7B
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:26:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJgla-0000IL-CK
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:26:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJglZ-0007ik-B2
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:26:14 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJglY-0007YE-TK
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:26:13 -0500
Received: by mail-ot1-x344.google.com with SMTP id 40so8075192oth.4
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 07:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=v9lTJYqpFGH74UtAVSiyI56P9Y1ObaopX/dO08bHW50=;
	b=eVQeAwtIS0EpdKvLalcx74WPBpel+3+SLJ9qkVl6BMhXlVW2KwxJWW5urs2fuzfkvi
	wJu2xE7ZiFvqvrIwHz6lsVMaqQuQinHHzdy8OP1UB1zwir3fbH2pVoodvaVR5M30CZMI
	L+fk+2EXR3jzL9gfKCFQw9ZraLargqXB8doV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=v9lTJYqpFGH74UtAVSiyI56P9Y1ObaopX/dO08bHW50=;
	b=bIlYOaPRkkpzUMlyaLl0MSzRSXpFTJXj130DNHDxk/7Jv7bgnNhMQcFXegUS4ScPgB
	G2SwZjjPGL7HlKKIu0nA2rv7dYz2y0f0K0ZAtwQJ06MYNfXEGWsAWnNwdWu4ST8Mc525
	ZBtuIxadRYVVCU4oYehBv8OH1rUni74Sf8NYNo+tipkYJSjo3bYcHNnF+xo2icJxivhp
	Z7SETC+FyCHfJ0PIwUH45Rbq5i9OOQm3nxY0Vb4ZQ/RcMFSetc6lKa86dwMKRv/xE3p6
	8EYOfvEVAaquh4opYVzP+htBtLbHtuzrThppZqaJwBj5zVtJX1ygSxNXOTf0q+wGqZp4
	dY8w==
X-Gm-Message-State: AGRZ1gKIJRVm4smYRr/xBzodZIgpItf1wG3LJ63JsxtwaC5g/26N/N3X
	sTTh53SVnq+vPQI8W1SAedLYLvnX9aNnaBcfm2nBhg==
X-Received: by 2002:a9d:156d:: with SMTP id z42mr14066007otz.201.1541431570288;
	Mon, 05 Nov 2018 07:26:10 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 07:25:49 -0800 (PST)
In-Reply-To: <20181102001303.32640-2-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 15:25:49 +0000
Message-ID: <CAFEAcA-DZMivo-epUmM6NxPzCUbGCfSU+SxEjszTNLdVaB8UxQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH for 3.1 v2 1/7] MAINTAINERS: Add an entry for
 the Raspberry Pi machines
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
X-TUID: R6DubPCIJAGu

On 2 November 2018 at 00:12, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> So far the Raspi machines use the BCM2836 SoC which includes
> a BCM2835 for the peripherals.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2360efe3e..c41ea5ed3f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -683,6 +683,12 @@ F: hw/arm/nrf51_soc.c
>  F: hw/arm/microbit.c
>  F: include/hw/arm/nrf51_soc.h
>
> +Raspberry Pi
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/*/bcm283*
> +F: include/hw/*/bcm283*
> +

We should also have F:hw/arm/raspi.c

Andrew, as the original submitter of the Raspberry Pi code
would you like to be listed as a maintainer for it?

thanks
-- PMM
