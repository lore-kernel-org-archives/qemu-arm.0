Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2001823wru;
        Thu, 16 Aug 2018 08:47:24 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwNpXXYCtPQ2CgZLQnSTuSjk37lNjBT5LxwkARUwKscwSuHQJ8QmtwKPl8Xzg0h7SiXBkWj
X-Received: by 2002:a37:cf50:: with SMTP id e77-v6mr28363809qkj.74.1534434444905;
        Thu, 16 Aug 2018 08:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534434444; cv=none;
        d=google.com; s=arc-20160816;
        b=KxlPuzHlZnnmz/J/X8HPyaQ15meiHcjx5Yu8t28582JWCqa6WzpLsN+baO2Kk298+N
         Wli9iAhEbU99M6AGMwuyzqWuRfpBdGx+k4o6T7Urk9JbOfnU/aK3FHQ8j5ry5f5TUEE7
         SRPjlJaq8fwVpP34d8FBubekpXIrh2/wMsgRu+ZMFjtHray3O76UYQBjXWSZ6JXcB9Xn
         OitWSgu4OJ496ZuKsshVQRWtEFV4VV+QwBvynWb2WoS2ATDS/6VY8flLJ/ggurB0Xg90
         HuNf4XfZCsJpKeizCViPgnyNlAIGOzp6VFxcCtNkDuLSPx8BifXAGmz41JiZlv+ZXQVp
         wZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=I8SaB6iTRbnfbgWe49+ry262mUNU+3FBhipACLR2yRA=;
        b=vwD9/GYTMZgLkHDuFWwsqRfWEVA6BcZBTKf3o+f4/zOY+yjoJ/+fB1cmq8LtgQQLTa
         oYXz5je0qhjmhunEO0sbatMZJiJr5fuASYBE6dVAJ0t63i2Gig2chv/Pa54INnRXW29O
         p4jPuTG5UIIOh5gRp08VbfuRRb3A5ezVrvHl/hQed9j2LMT7iJ6bDbEg87Hhsp6uNE1u
         InQ3aP7g+z+Sjs2H11CAAn7Jjt6RTavwhnyVscLX0SLFZlFo5p6QbkdyO/nD+hpADaov
         PTlXXb9uRDFv9+E9ttRgNaPX1Wvoze+ixelQgmvoVx2iR5CCz+Ru4i8IVcYy0O1nAoBt
         JlZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qye3xMlF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h48-v6si708092qta.340.2018.08.16.08.47.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 08:47:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qye3xMlF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqKUe-0001me-Ah
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 11:47:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJtr-0000E7-CQ
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 11:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJtl-0006X6-Tc
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 11:09:23 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:44558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqJtj-0006VA-0e
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 11:09:17 -0400
Received: by mail-oi0-x242.google.com with SMTP id s198-v6so8569273oih.11
	for <qemu-devel@nongnu.org>; Thu, 16 Aug 2018 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=I8SaB6iTRbnfbgWe49+ry262mUNU+3FBhipACLR2yRA=;
	b=Qye3xMlFskkqgM0vRV5/BOWDG+xWiz3XnBsk4qh6e1UuhRTdsqzBYLrAJYpys374Zt
	eASbhCIovt9wPnEQj91wHi2Nf5Pujwzykje/CTsgXOiUqPj1lkRW5sIRyd8uy9/8a9nR
	FNxrqm/xeeiROm7z/WMuTPqoibWzZfRfL16fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=I8SaB6iTRbnfbgWe49+ry262mUNU+3FBhipACLR2yRA=;
	b=Blk3RwQpz5YUyzb3BW+XKPBfb9CyuMWPWYzgZjHCMqMIofxVawp8wu2OLz4qMM8rwU
	zcOgcHE3bGcmoeGsG5Sf6bXrECH8/dz/txx/Nw5o3ANQiju+QEP4xVvoRHIERXlbrUwM
	Gbgj5278uqtS08ZSZNPu+Sjm5gwpO+Mh+8U1m8ozo+Z2JgHPoOA29PnwSJRytYLpa79Q
	Rolr2vzdJFNJVBtFG1chh24RpSgGUkLzClbGTngZKLjvykT0nWd4yO6mNuN3QxOBjv3p
	uNJQUym3l5/fPzLNKeMjcKUxycP0sQo+iaAidGE2zptre/dkSNoHPCN8n4fkU55pZuNa
	4I4A==
X-Gm-Message-State: AOUpUlEhpQ773GvBAdoux6aq7iYZl/iAsGOIxabVm23G970PjDr8Tsiu
	AruZlai5tb++td5n0r53i1TbmR+H5RZjCxNYcB4iJA==
X-Received: by 2002:aca:6142:: with SMTP id
	v63-v6mr34194828oib.137.1534432152641; 
	Thu, 16 Aug 2018 08:09:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 08:08:52
	-0700 (PDT)
In-Reply-To: <20180811090836.4024-6-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-6-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 16:08:52 +0100
Message-ID: <CAFEAcA-TE2Okbi2mKxs=XgRjQb1kS-bNkv6HX3VvQG9rcpm7uw@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH 5/7] arm: Improve error propagation in
 nRF51 SOC
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ElX845KEB3GM

On 11 August 2018 at 10:08, Steffen G=C3=B6rtz <contrib@steffen-goertz.de> =
wrote:
> This patch takes care that errors that occur during
> instantiation of the cortex-m0 cpu are properly propagated.
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/nrf51_soc.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 2265d30352..88a848de8b 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -66,8 +66,17 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Er=
ror **errp)
>      }
>
>      object_property_set_link(OBJECT(&s->cpu), OBJECT(&s->container), "me=
mory",
> -            &err);
> -    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
> +                            &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized",
> +                             &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }

This should be squashed into the patch which had the bug in it
(one of Joel's, I think).

thanks
-- PMM
