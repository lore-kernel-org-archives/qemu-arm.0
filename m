Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3676849wrq;
        Mon, 25 Jun 2018 04:14:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcupif0rQ+zNT1XQnh7FEk7OLowVTcSMedTJagpNXklP+JKI8tHT5BL2nlnJGQtHBHK2u/u
X-Received: by 2002:ac8:25ac:: with SMTP id e41-v6mr10721833qte.66.1529925243557;
        Mon, 25 Jun 2018 04:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529925243; cv=none;
        d=google.com; s=arc-20160816;
        b=IrcpDwiVSdiZ+Lq/867xpKqDwu6tzgrqi26MqU4GAVF69bV5q3dTjVd2/5yqVW1uj2
         OoR18LgFYRPThnjWifMmEtciT3y2qqrRSuElVRBhJ1pGQFqULIcW8ZnmlOQQ1mtQhjLE
         wk3iypwblpCHSEsTptdxz/7F3X2WfxISS7zT7ts1oCW8G1xZDRc2ev9mUvrt7PJAimYt
         Auesq+fbW0Wvjh1YyhWq2aIpemW47hSDzINSapqWOz3A5pJNld8xGxWsiPpXCZGf6FEi
         hulW7+tXu95UJzpVi/5oEatooX0H3npF2PllQOd6DarlhVvUvQTSXYbK4eTqFazi81R/
         R+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=KpyVvGSwzZHtCq9jMDNIa4rBMTiAryXe9G6IZa7nnGA=;
        b=h92k+/gusaMaLIGJOpEnXQXJLfRlTF8GqUpd2UOFS1bnMEAgKfDnXFZi4M2uka5hao
         d3hOUSaSjVjkAw7hTmekWYlfiXQURaWFTVh0WYmwXn6IQ2kOxLM9/6MZC562AS7h60ef
         4VvpqcsqsyeFtR+lbdERKp/9Bw97HAeTHkRPrlavPN3SBa5eZMSkUVPoSqFQhxD/Rfjd
         r0ic4T+wTn4Zuqo/alUIeY0DnQKwPdbyjAffmERFf9bgQZb5zKsDDnT3BYsXUaRXz6AX
         xEP2BeP6WUvPBliFrBaC38bWqROoeRUw4eBtkbjqVaBohlEi2AGijWCm42N4YzSwQz/m
         rbDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qh670KvC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a42-v6si13334761qtk.91.2018.06.25.04.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 04:14:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qh670KvC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXPRb-0002XG-2s
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 07:14:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXPRD-0002VQ-5W
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 07:13:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXPR7-00069Z-Gp
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 07:13:39 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:42888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXPR7-00069M-AA; Mon, 25 Jun 2018 07:13:33 -0400
Received: by mail-qt0-x243.google.com with SMTP id y31-v6so11512541qty.9;
	Mon, 25 Jun 2018 04:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KpyVvGSwzZHtCq9jMDNIa4rBMTiAryXe9G6IZa7nnGA=;
	b=Qh670KvCUEKZJXqz4T4sG8qs1wLscmMlZcioboeexHeEvM7fPQ9hD+8VhrLFt0MXey
	SVHQqSEWZehwbnO9Xx4oCp0e7RTZTwECj9pQwpMsPryYoRb+1WYNMmlCi0OlaiVNZZoU
	1rR+4f/vI0xVNZ7XjXRZBB0ihHMyCUPwbGcL3sJNZH7X6lD+m50kNCbJ0CaP8aC4TE6o
	mvbnjBTdzH7oHg8vnU+YS91cXKGOD5m3gb9G/tLWe9wDEQ0s6acvBnFg9ukpbk0ySAjC
	QAFuZeuadPZXMZHlljEFOiFGAwj+KnPZ8MESSn/v1qqm/H5xM0yfR0CYcnpmwQrYOT8b
	y79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=KpyVvGSwzZHtCq9jMDNIa4rBMTiAryXe9G6IZa7nnGA=;
	b=Fmbe4Lh1ZtdWE3P1wXx18TrbJdr09HrR21aESqYjmuogi980MROS9KiQpL2SF8REPg
	P+tgomnnt+drjzkLWGu4RvvsJOBNobb9Zg49sA2u0+9l5elZUMaqDPjXcqpmG+UfiJCo
	E+mAVT8eSM6Jr7cA2vrY1kSmOwqWA9xWBTBqBkQk8bfivi1CMwBf1FLFuuVXjwIYS+LS
	XgCa30N6SS3HjjgkouRnmkzgsjYiadeXc8Xn+/TD05Xf5dUnhE/i+WqQYN0z8v6MtNlA
	7qZyOdelsZCrT+88im62MvKcR7leIdAW/vozrb7dXOX7Wzs6RwL4nNi0ch2lsuOuV7ZP
	9iHA==
X-Gm-Message-State: APt69E3A5k5as6nEbMufGbq2wMjS+StQSjXpZgsgEWanh7n1qeXToS3H
	zrG3O9v6fN6FaunL79MZHRm4RpMP
X-Received: by 2002:ac8:2c5c:: with SMTP id
	e28-v6mr10663928qta.60.1529925212449; 
	Mon, 25 Jun 2018 04:13:32 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	m31-v6sm8675149qte.82.2018.06.25.04.13.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 04:13:31 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180625110721.22485-1-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <0627e87c-6d3c-a64a-6d6d-2a632c73ebf7@amsat.org>
Date: Mon, 25 Jun 2018 08:13:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625110721.22485-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Add ASPEED BMCs
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: apBfydPY+CtN

Hi Joel,

On 06/25/2018 08:07 AM, Joel Stanley wrote:
> This adds Cedric as the maintainer, with Andrew and I as reviewers, for
> the ASPEED boards and the peripherals we use.

Good idea, this should speed up ASPEED reviews.

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2874ddce6097..14bcf2ed3e3d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -644,6 +644,17 @@ M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>  S: Maintained
>  F: hw/arm/msf2-som.c
>  
> +ASPEED BMCs
> +M: Cédric Le Goater <clg@kaod.org>
> +R: Andrew Jeffery <andrew@aj.id.au>
> +R: Joel Stanley <joel@jms.id.au>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/*/*aspeed*
> +F: include/*/*aspeed*

This line does not match, however include/hw/*/*aspeed* does.

With that fixed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +F: hw/net/ftgmac100.c
> +F: include/hw/net/ftgmac100.h
> +
>  CRIS Machines
>  -------------
>  Axis Dev88
> 
