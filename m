Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6411519wrt;
        Mon, 21 Jan 2019 11:34:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5q8Es5uZ9xnbYIvCZib3ywFx9qwyHRVFq34r0jXfiPxaSTAzLiFxNppv1nMyqcjaZ49GsK
X-Received: by 2002:a1c:c181:: with SMTP id r123mr712990wmf.8.1548099258827;
        Mon, 21 Jan 2019 11:34:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548099258; cv=none;
        d=google.com; s=arc-20160816;
        b=WiYYQVlVJqyn2XXfReydFg1pZvGCQ0ziKtFfnTgbW5UDyglYyTX44fQhPVw9fX6L0u
         hX/Cb16cZbZm0Dr4sv1R7J+xbba9K9bOK8QdKZfLScsmePNpzlcU7zp6/43kxb0nhaNH
         JzKVXou4Ej6wW9EkwE9AwEnr4+j28Fp3rftx4KLCKddyfejxc6gcXoBIB9Pl15OstuEz
         BVg/KLc5UDOu9kUVA+/416I93KlWvcSw0/5Dr/XOkQx43gR1BBdqPZa6w/DvwppDhMaK
         TViOy2YOaXs6pxqRkNBKz46AS0Xm7T7MYZlHFc3CWCHzbEHIUNPthQcSI1pAoypm9wiP
         xZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=HrJEVNRZXqBVmR2Ha500yTVDaZRkCVZwLzlUegyOfyo=;
        b=zcFtcXyi7Ld9r5vLkqtVdNzvNuFBAlvUg+h3h/2PoDRPuKpYH3gJmzyJi+JXvKlgwC
         63A3f0RvKZQtVTbA0aDSUZY4ocdsJSwdYMuZ3Qko4gKjtytGqKAxF8NiDxvgtss9pHi0
         fQbWLpmCpO7KeiCnasPmbGub03xinKNs3GF5ZTQzy/eZz9hubDX+CrzpvQ8bvzYbdaxw
         20gT/pkyNj5NPgxziKUnyIs5sfpm9nPMslFmEpcFv0NRGdkKZtHa0Sl5QPe1N1txAStF
         dRjcU5TmJF0Gb/KFNmOxzYj4fV/ReolkkmyzSQ0TAFnbwdpvme4bXaOihYdV812kS+Hd
         0JZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gsv2RDAY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si65518790wrw.434.2019.01.21.11.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:34:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gsv2RDAY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glfKr-0003yd-PV
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1glfKX-0003tl-OB
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:34:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1glfKW-0001ec-TC
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:33:57 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:42523)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1glfKW-0001dy-Kw; Mon, 21 Jan 2019 14:33:56 -0500
Received: by mail-ed1-x543.google.com with SMTP id y20so17431577edw.9;
	Mon, 21 Jan 2019 11:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HrJEVNRZXqBVmR2Ha500yTVDaZRkCVZwLzlUegyOfyo=;
	b=Gsv2RDAY+H60Jt7KCIWUJOaeBtTJ+jQrOcJOs1+BLGOH2BXj8Skes3RfZ/wuQ+kInc
	dtWwWnqxKsBbhRGWIuc/GfLCzY3hCC9hZ98lOQhB0T60cORZY29Q/4qRC9TFqLz1srSH
	6y+zAGANHcYpPyFb/QEK1wIPLTF+B7IW8YAxLsU/BioFHKaWQ+2DLXColZKp27nc589Z
	D2ubzoklXW4L3JfiEjn3wYppui8qOFGa9vJqmq7hlgf7Wq609t0XodkeIUD8k7mPd13+
	DYmVr/Zdgzl6qN61qkFmvm4Kqf5mZ0YkxMQsbTyCJRhq+SO7CeobHzAgQHUeio+vEolf
	cIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HrJEVNRZXqBVmR2Ha500yTVDaZRkCVZwLzlUegyOfyo=;
	b=moiZCCmy4y1CkwRfFMKKGdjXHx6IL6OQB6Dfs6m/GR9MRZQYSWrj6hDJre0eiFCHRh
	FGEzVAWeTBwa/ujkkAseywicJH4faZNj5sk2gb7CSGFdReSLOlQYDu9fKaTnnY5kHlEk
	zoDeYU6A+/oCu1TOetCm7w3AnhgIg/axbxKPxpra055/FGSuplVGOhJibz0uJI4i0qTC
	64suUHUOskIg7Vjdzm7Fbw1t0DIDaZ4HKAeWKnQF1VacMzRJW8fduDpkjlfueREkHade
	HGNDU4VWQFS4+eRTuoWx5pRJjfdTdaDqVhZ5sWY32TQYa98YJ+8XnIIpKZpsBB4qn/mQ
	xMEA==
X-Gm-Message-State: AJcUuke/HWdn7JRP7bcXFSeboezMrrT8bNJ894tEv0qq0z63d3n0TVzI
	p8qEMa6LcFIeT9ID+7ulZJc=
X-Received: by 2002:a50:a982:: with SMTP id n2mr27513187edc.236.1548099235361; 
	Mon, 21 Jan 2019 11:33:55 -0800 (PST)
Received: from localhost ([149.199.62.131]) by smtp.gmail.com with ESMTPSA id
	i46sm9123033eda.37.2019.01.21.11.33.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 11:33:54 -0800 (PST)
Date: Mon, 21 Jan 2019 11:33:20 -0800
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190121193320.GC19750@toto>
References: <20190121152218.9592-1-peter.maydell@linaro.org>
	<20190121152218.9592-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190121152218.9592-2-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-arm] [PATCH v3 1/4] hw/arm/xlx-zynqmp: Realize cluster
 after putting RPUs in it
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	"Emilio G . Cota" <cota@braap.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Agg0AHJfIpgp

On Mon, Jan 21, 2019 at 03:22:15PM +0000, Peter Maydell wrote:
> Currently the cluster implementation doesn't have any constraints
> on the ordering of realizing the TYPE_CPU_CLUSTER and populating it
> with child objects. We want to impose a constraint that realize
> must happen only after all the child objects are added, so move
> the realize of rpu_cluster. (The apu_cluster is already
> realized after child population.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  hw/arm/xlnx-zynqmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index c67ac2e64ac..370b0e44a38 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -183,8 +183,6 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>                              &error_abort, NULL);
>      qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
>  
> -    qdev_init_nofail(DEVICE(&s->rpu_cluster));
> -
>      for (i = 0; i < num_rpus; i++) {
>          char *name;
>  
> @@ -212,6 +210,8 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>              return;
>          }
>      }
> +
> +    qdev_init_nofail(DEVICE(&s->rpu_cluster));
>  }
>  
>  static void xlnx_zynqmp_init(Object *obj)
> -- 
> 2.20.1
> 
