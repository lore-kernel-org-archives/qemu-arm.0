Received: by 10.25.0.198 with SMTP id 189csp1047843lfa;
        Sun, 7 May 2017 11:16:47 -0700 (PDT)
X-Received: by 10.237.48.66 with SMTP id 60mr57226320qte.25.1494181007195;
        Sun, 07 May 2017 11:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494181007; cv=none;
        d=google.com; s=arc-20160816;
        b=ByzxxG2WyNpdvaNzadbuekFaeQyeXYlDO9cBh6+RgDnmGUdh71iLQIpJaIovm5mlNM
         EIqdwFohOsS2DxxBzPD9B5xT94/PRn/thKwwr/MXOW46+rmrSfEs7HW8brnQh7Zb/HuR
         ojv6vYu8QDoMqjs3uJ7h68sTgOEPXmTWSgT6bP5EdQpiO2pBuIrg+EdRlXnQYyMynE6u
         eaGSvLlQK5VuCvFHHK/ZP4FkLCjGpQFnX1pu9TRnL2MofZ3VavzyTZBGjHIoKOoDkOtW
         70d4egHpW5MKsAXUlwDlxkE8R9jgUBbWq8eeho43BNVarMOtQLM001vTtDswxpDyaetB
         4x7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=sORFrDai0vzBESgba2Vjke9B9k/Tdpe9+SNHhvXdqS4=;
        b=wF9Uq0eWMzS9nAO0wpa6bU0N39QazH/xrCjvk3O6U80ZB/LRWcki2PBqeaw8RmrQap
         Vr1+P2r5MM2vi6BI/BqJVAnOXVKfJwFqJTvjJIvxQMRCsE1j6AyLZoaGqU/hHEcsBoOr
         q2pgWzBBcvNxQlJEqiQbJd3tL4Kiq+EcQmlu2UDAm1h+xrC5PRtfd5/34QmeWgRbYJ9V
         wPF+sXKbiAaaB5RRO5TDr93qZW+EB72hZ3E7dINVEP1naqAxBsVL37PhUZTr1ewd3wGL
         Y9DR2ifOLLACNLx+nKZOGY2n4jQhSvsKaUxQ0VKMUyAHbmfxbHZvQB0pcA9Q81mABth6
         Vz+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 50si9927927qtq.112.2017.05.07.11.16.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 May 2017 11:16:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7Qje-0007mk-Ij
	for alex.bennee@linaro.org; Sun, 07 May 2017 14:16:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7QiS-0007O2-6m
	for qemu-devel@nongnu.org; Sun, 07 May 2017 14:15:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7QiP-000719-3U
	for qemu-devel@nongnu.org; Sun, 07 May 2017 14:15:32 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7QiO-000711-U9; Sun, 07 May 2017 14:15:29 -0400
Received: by mail-qt0-x242.google.com with SMTP id r58so7043674qtb.2;
	Sun, 07 May 2017 11:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=sORFrDai0vzBESgba2Vjke9B9k/Tdpe9+SNHhvXdqS4=;
	b=girdLA/ZfXfTs/djG7+uKJeOw/nvOJit+wU3/WQQsMGnCz1hne6pxGPXrMoHksejFK
	ti7iWHQzKeB6CQs38a5wQWRvtCPYffOqkarSw8kFfv4ZWJpReZxsg5cg9hOYbtI39S5W
	ki4M7nGJexjYZ9Txrmnu6ekFu4MklN9WUiBALL4qU9rvr01YZ7u8quCAo0I0HOyvlbhw
	9KLmwvyCvu/eS5Irr3kfeiCJHvj1TVjJMs2QpfaRnDsgw/4C8fILD7RlzE4k9FVD1tFg
	zTEB50CHkTzvg9O4xJkrSmCFuIv7lImbQE13AyB6ckkIWFpKhKap4aNCiflRGGdXR9Kf
	pc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=sORFrDai0vzBESgba2Vjke9B9k/Tdpe9+SNHhvXdqS4=;
	b=TGwFw/QEaebCErBeW/T7biQg7I+QFTDruAtF3ESn4XBE/i6BnjOD3AfVPxpACUMNbU
	XPBRFU7WnY8sIxIuz/PF0V+Z38lFgrndyrFVqQtno7DiwAEwZrL9hstk5ot0dlgbbpld
	9X3fmlV5swU0mkQsHxAwI4hMT7FoRHHEBqMwNOMoNDKeM8II0OXetzjYrTG2sVTfef8t
	rLpY7hwuX1xZjdrps89CbBD6YidJkIAn7UXn4GZX4vXtRDpSdzpSYxDSu9rt7bWjqTsE
	UdsH7fwHrvSQzsvteGQrKhWVosEAWaN2X9LW/jcCJZh3JFL0tlcorbanTypMVeEsNyX1
	Stgg==
X-Gm-Message-State: AODbwcAW7uV3LgcH1WiUHx452ZP00sHQ/0V0ITcXYLFYGt6IQ2HY48dw
	rojrjOj8PSPyjjO5sIw=
X-Received: by 10.200.49.229 with SMTP id i34mr11214658qte.113.1494180927833; 
	Sun, 07 May 2017 11:15:27 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id 83sm9080760qkq.26.2017.05.07.11.15.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 May 2017 11:15:26 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20170507113540.8687-1-krzk@kernel.org>
	<20170507113540.8687-3-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b672980d-c714-2e11-636a-331f566e9bb6@amsat.org>
Date: Sun, 7 May 2017 15:15:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170507113540.8687-3-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 2/3] hw/intc/exynos: Constify
 array of combiner interrupts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WHbln+vkiT4o

On 05/07/2017 08:35 AM, Krzysztof Kozlowski wrote:
> The static array of interrupt combiner mappings is not modified so it
> can be made const for code safeness.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/exynos4210_gic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> index 222cfd6c6387..636dc6dbc1f9 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -116,7 +116,7 @@ enum ExtInt {
>   * which is INTG16 in Internal Interrupt Combiner.
>   */
>
> -static uint32_t
> +static const uint32_t
>  combiner_grp_to_gic_id[64-EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
>      /* int combiner groups 16-19 */
>      { }, { }, { }, { },
>
