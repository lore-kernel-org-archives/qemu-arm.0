Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp838773wrt;
        Fri, 28 Sep 2018 08:21:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV628ZfhhYxXyR6tDdgbUPuc4b4H6qTkiktSMnDZ8dRk6Svf7JlxujNKN1hAys2y3C1MV9kyC
X-Received: by 2002:ac8:30e4:: with SMTP id w33-v6mr12330718qta.176.1538148061516;
        Fri, 28 Sep 2018 08:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538148061; cv=none;
        d=google.com; s=arc-20160816;
        b=zzUeVmFYRqC0bWtFNEWR6XexHRyHwkJgwqUKf2DoOZpG8KT8YmBKamZrSkYfikKCGp
         lrHuQSQF8T+jNkajK69vJt/5fEGd8CswvvHaYGjO7AmwF4DCy+C3D9LslqVBl69yN0/n
         S6DaoUOefNK1o4i6HAaPpJJR/eb3adWZ2N4xJ0OxRRWx92Kshv1aQDIUPlMB9UTk9XJ1
         jQPOt0K2zziZkPDYgt1xIvyHWgRooJn1V3PR/HByc8I+6KmWuR37jZZ+hnQ3CxTwRsuu
         1wcdVluPShWGNNn3pVgIfBlJkknlMZXNbs5V8wlXky3c8h1JLDN/nOjE7yIswuQv31cA
         WQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=EcEZDf8gVb8kROZb3QhFFpP5kYII9Ly8TBp2AheSNIc=;
        b=u5ZbE9FnLKelLmdLbLBYScwDKdac15VljiIzOIjeOux7RB5SRaWBzfb2HTzNWYG4i5
         JVy4n1LxVy12xZ+CFlTRAQVuabHZ/8xdQvtPZvYkl5RXgmC+OzeUb+uaS3WbaJ+an3ob
         /qZKfhDoZ/WlQAYbqAOU9Ds9HouefiHKfs0+QFrAAtSdCt5IzxjS10kgqfEziDCBwkKO
         J0wbIykAuWZ4iWudzaF/3WzDmH44LzkkJzK3J50xkV3fVcfoX9U+76j3oiJOASWbkjd3
         gJ3GXUVUXl6LZPIljhpSR7/YkAlwEQom3/ghKA4shLv+TMfPMzBxY0zhe5j6rBYZdC7T
         d1sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q63-v6si173867qkb.152.2018.09.28.08.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Sep 2018 08:21:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5uZg-0000Y1-WF
	for alex.bennee@linaro.org; Fri, 28 Sep 2018 11:21:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g5uWJ-0006Fb-P4
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 11:17:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g5uWF-0000Py-GF
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 11:17:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g5uW8-00008g-TL
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 11:17:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id o16so6815010wrx.2
	for <qemu-devel@nongnu.org>; Fri, 28 Sep 2018 08:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EcEZDf8gVb8kROZb3QhFFpP5kYII9Ly8TBp2AheSNIc=;
	b=hZ/ckXNU3cZ7Zhov55Zvv8Bybc4LMT7RnMkp/Poh64btwPLkW5dOvw92apN+E1HY/F
	T/RYE0idGTAHbAzNGW864i5rp+4f5TNkOOmo0lsM4+p2T61oSYkEfvo56guALvzaRtbB
	EXJBlbYKiUzx/a4N8AsU0TDAkfKS20jT1xqCUC547uXOokQt073dsGztdzEQQFN3xJiR
	wNDrJxj+rubDUXwWva1+zKH5yp/Ysfn8IGZisAD3A0cCk4s9adAPikbY67RZXdmYFiHX
	T+SDn+UQ1ylxTL9FAPqF+WP5cXgVnQhoDuiA/XQgsywYVuqaQZELkS1G2iJu4IrpLsX+
	6Abw==
X-Gm-Message-State: ABuFfojza4knLGlPqfYGCUKb/HJqsvjxVjmrKa6+zIjzfmyzZ7fYz7DG
	/ucK//6IEvPrv5tshc0wv0GEeA==
X-Received: by 2002:a5d:5301:: with SMTP id
	e1-v6mr4955059wrv.297.1538147838792; 
	Fri, 28 Sep 2018 08:17:18 -0700 (PDT)
Received: from [10.201.33.229] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	f187-v6sm2653614wmg.17.2018.09.28.08.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Sep 2018 08:17:18 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20180928135003.8650-1-clg@kaod.org>
	<20180928135003.8650-12-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <060fe7ec-c33f-9fa8-030d-575d44560f14@redhat.com>
Date: Fri, 28 Sep 2018 17:17:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180928135003.8650-12-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH 11/11] net: xgmac: convert SysBus init
 method to a realize method
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Rob Herring <robh@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C0oRQV4Q22dM

On 28/09/2018 15:50, Cédric Le Goater wrote:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/net/xgmac.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
> index fa001563d3de..63f5a62ebf1b 100644
> --- a/hw/net/xgmac.c
> +++ b/hw/net/xgmac.c
> @@ -374,9 +374,9 @@ static NetClientInfo net_xgmac_enet_info = {
>      .receive = eth_rx,
>  };
>  
> -static int xgmac_enet_init(SysBusDevice *sbd)
> +static void xgmac_enet_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev = DEVICE(sbd);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      XgmacState *s = XGMAC(dev);
>  
>      memory_region_init_io(&s->iomem, OBJECT(s), &enet_mem_ops, s,
> @@ -397,8 +397,6 @@ static int xgmac_enet_init(SysBusDevice *sbd)
>                                   (s->conf.macaddr.a[2] << 16) |
>                                   (s->conf.macaddr.a[1] << 8) |
>                                    s->conf.macaddr.a[0];
> -
> -    return 0;
>  }
>  
>  static Property xgmac_properties[] = {
> @@ -408,10 +406,9 @@ static Property xgmac_properties[] = {
>  
>  static void xgmac_enet_class_init(ObjectClass *klass, void *data)
>  {
> -    SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
> -    sbc->init = xgmac_enet_init;
> +    dc->realize = xgmac_enet_realize;
>      dc->vmsd = &vmstate_xgmac;
>      dc->props = xgmac_properties;
>  }
> 
