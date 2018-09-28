Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp835719wrt;
        Fri, 28 Sep 2018 08:18:15 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61nO4tY0ePwzYFkS28z5cZLJ+0Hbee9ZExhsdkVU+LhnGUOrehRxUNJfMF5U11xbzr+ty9d
X-Received: by 2002:ac8:4649:: with SMTP id f9-v6mr13051749qto.34.1538147895059;
        Fri, 28 Sep 2018 08:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538147895; cv=none;
        d=google.com; s=arc-20160816;
        b=D2bI5qYL0Zga52mVGJF7WdKJ1hkdAIWCEGktRLcLL9QLrz4uc1SZPG04MfdMoJ9eJZ
         otsvbmWTAnKw+JU3jFvj2EU0mNQUrumSrfKlA8tEtt5qnsltA2K/APmRBxjx8tQNuHtN
         HMJYD5JVCShNqNZ0l+FWdPUduBZVlOq7sKwDh9CA+Ic+o7qFTAOyJUeKM2td8NRavUPR
         G7LRi5diJowJrcuBJNCNfvnyK36H0CEv9OVrHCHD6yKSQ1EGRsO9TrkByhK5CVhGdQYx
         jvPt7VxACjpiYGdCtmwXnjb/C1sZ2H7KsR8Lml4ZFz8LgaC9+igGfHwqOHKHp8kR9vem
         Zpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=g5glWBzjCUJNduyCpkoCrM+H+p3y07kw6thb0czz2aY=;
        b=e9iOmEF/Z0r/+HvJrb4Gqua1r/7KAGKQkROQ4D6QDnUipqU442oyhLkQ9IFUy0MtlF
         5fdfucOaWteMnkYHrxY3nDlR6aSjwmsmcqGGhGssvE3nzPxBUhQi46gxJt8GpW6Cyndv
         ViPWIUCMcqWrWInrEuNVrI37nTlhhyXgpXJuogNucqg/ag02w07TC8qU20itHedn+LgU
         m3yjHXryPUB0bqRnReSn27egq7gA5dITBuWaSA9G393SGCR3cf55Vt6tJHK7x0NY9yNw
         AMTET7NHGScDszjojuyZMWWVwVsqtU/ftWX2DoVAFsbdItSKBJmrTPXuzLR8yTaaWYZc
         wDew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z20-v6si1415353qvl.87.2018.09.28.08.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Sep 2018 08:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5uX0-0006VS-3k
	for alex.bennee@linaro.org; Fri, 28 Sep 2018 11:18:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g5uUa-00051t-O9
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 11:15:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g5uUV-0006QM-Ct
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 11:15:44 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35355)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g5uUV-0006M5-1P
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 11:15:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id o18-v6so2608484wmc.0
	for <qemu-devel@nongnu.org>; Fri, 28 Sep 2018 08:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=g5glWBzjCUJNduyCpkoCrM+H+p3y07kw6thb0czz2aY=;
	b=q3Hs0LGnTFa7s1RsX1m9PPgtTAtWq58799OoED2QOaNbm0D2N8+onmWa4W7x1+OCrz
	YQz+dZVWa2bAWtyFuY9SLxsg6LXI+Qp6elb2MDfHdxd6kF6uyamkoHhvF67ExDQ8TrLS
	EB4wBHuTjnIUOACXdSXb6TytOcpndOWdiKHTt/ld+h6TnqusrlGyvEQfyGjsalrs+IR7
	dFZh72GhiDkWUBKGETVFDZR3icMUFrAmlYn3Vc62R13VgDtuIuDp0OISVNIj5NwjYDcA
	C093H23ufDNhlcYTUmM7qmPpLygnXtHZQWIUnKQ28FwtpgzfV4FgfrBc9PiBw21sE+wY
	CfTQ==
X-Gm-Message-State: ABuFfohG7WLWhcqFJHLBf/+wI4CNLQqpUsClPZ5bPPCfUCHIeK+W/otW
	ioxiSEcwjPahyf4cDzmI6H65LA==
X-Received: by 2002:a1c:ee0c:: with SMTP id
	m12-v6mr2299242wmh.112.1538147727163; 
	Fri, 28 Sep 2018 08:15:27 -0700 (PDT)
Received: from [10.201.33.229] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	x15-v6sm3667278wrt.53.2018.09.28.08.15.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Sep 2018 08:15:26 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20180928135003.8650-1-clg@kaod.org>
	<20180928135003.8650-11-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5fff15cb-9f77-9a4f-1760-f4ff14dcd5eb@redhat.com>
Date: Fri, 28 Sep 2018 17:15:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180928135003.8650-11-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH 10/11] net: stellaris_enet: add a reset
 method
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uk0h0eIFiAGb

On 28/09/2018 15:50, Cédric Le Goater wrote:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/net/stellaris_enet.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
> index 3ee1e0f8a43f..b3375ebb459c 100644
> --- a/hw/net/stellaris_enet.c
> +++ b/hw/net/stellaris_enet.c
> @@ -457,8 +457,10 @@ static const MemoryRegionOps stellaris_enet_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> -static void stellaris_enet_reset(stellaris_enet_state *s)
> +static void stellaris_enet_reset(DeviceState *dev)
>  {
> +    stellaris_enet_state *s =  STELLARIS_ENET(dev);
> +
>      s->mdv = 0x80;
>      s->rctl = SE_RCTL_BADCRC;
>      s->im = SE_INT_PHY | SE_INT_MD | SE_INT_RXER | SE_INT_FOV | SE_INT_TXEMP
> @@ -487,8 +489,6 @@ static void stellaris_enet_realize(DeviceState *dev, Error **errp)
>      s->nic = qemu_new_nic(&net_stellaris_enet_info, &s->conf,
>                            object_get_typename(OBJECT(dev)), dev->id, s);
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
> -
> -    stellaris_enet_reset(s);
>  }
>  
>  static Property stellaris_enet_properties[] = {
> @@ -501,6 +501,7 @@ static void stellaris_enet_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->realize = stellaris_enet_realize;
> +    dc->reset = stellaris_enet_reset;
>      dc->props = stellaris_enet_properties;
>      dc->vmsd = &vmstate_stellaris_enet;
>  }
> 
