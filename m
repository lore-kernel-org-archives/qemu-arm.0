Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2400974lfm;
        Mon, 20 Jul 2020 09:08:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEBp33078VOk0GweEZQtoDg/g/0GF2zZcJXRAFzzrqmer2hJzPXItPx7MwUt9hB8tQi3ic
X-Received: by 2002:a25:8206:: with SMTP id q6mr35475580ybk.388.1595261301413;
        Mon, 20 Jul 2020 09:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595261301; cv=none;
        d=google.com; s=arc-20160816;
        b=CJJkFfCX2nF+AGbTBP1nj/I4Nn924c+0kj6Czr+BUb9RKiFzex5RGT8OVsajMwJCdP
         FxB6Tjh7oHZ/ppMzIJv8U9SyleeL3wlmVvrI8vdZLcTRHXIcNY2gkj4KD2XsI2p6cOeh
         PjZ2FQEMzc511l/HU4/s/AhNg6crZxraY4cwJ9XiBjxB9WSlTwV788SmSN57wX7mBGZn
         +8foAyJV80uYyZtqAxjv6q5yDEyFP9wIZmDOsDbqqVPl9AxUpXlqqr45mlyiwDXIymZO
         nin1OYBksc+VpV8Yb08I8akEaglTMzmbm15jU/cOOUs3DqPNV5oGxcD+Zu+ttdctJRK3
         SLHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=xSXcck5w755gE1P9P+GY7ZmNubMcfZ+5+w+1UmvJ4qs=;
        b=KcWEWFT9xKKdjWOTtCvZVHDeG7ZHDuaUBW1NROv/iFIT2QFX2GPmDHRaHkFPvYihO0
         jcfOLqzj4XS6B5t7WCcBFZywgCA4QemrrZV/r/8G+ivAL2uwWZHhU5vxtdGFNElhyZ4/
         G6RKxYItqeFDYRIqE0OrxBTiboYs08BvSW2EU2ARdRd84m+6i4yMfSFC1gIs8ZciWr2m
         r6CAph6Sp/UMvyOgi3x55x1Y1eTgPX3f+ojxR0p7hVSjoBx9+B18pPCKrH2tX24M3M7u
         W//91dBU3BXcim1RAVjR76RrdhDatrKibEbHgTYEPOhpm7m/HfScX9knkKw+TKJ35mBy
         xm7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si17355980ybp.128.2020.07.20.09.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 09:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxYKy-0007er-Pr
	for alex.bennee@linaro.org; Mon, 20 Jul 2020 12:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jxYKs-0007eY-6W
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 12:08:14 -0400
Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26]:44726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jxYKq-0002wo-8W
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 12:08:13 -0400
Received: from player691.ha.ovh.net (unknown [10.110.103.226])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 122C516FB1D
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2020 18:08:02 +0200 (CEST)
Received: from kaod.org (bad36-1-78-202-132-1.fbx.proxad.net [78.202.132.1])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 3F9C81498A4D2;
 Mon, 20 Jul 2020 16:07:55 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0025bee732f-b8c7-4e32-8983-4cc0222cbcde,6196D7FED5334CEB3A8C25BBD62C6C93FB7A110A)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH-for-5.1] hw/misc/aspeed_sdmc: Fix incorrect memory size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200720095829.22839-1-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ed5e6bd0-0962-b182-3348-d3c6655ef35e@kaod.org>
Date: Mon, 20 Jul 2020 18:07:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200720095829.22839-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13934700199559531281
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrgeeggdejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdejkedrvddtvddrudefvddrudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.75.26; envelope-from=clg@kaod.org;
 helo=8.mo179.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 12:08:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6IWVQzCkcA2A

On 7/20/20 11:58 AM, Philippe Mathieu-Daudé wrote:
> The SDRAM Memory Controller has a 32-bit address bus, thus
> supports up to 4 GiB of DRAM. There is a signed to unsigned
> conversion error with the AST2600 maximum memory size:
> 
>   (uint64_t)(2048 << 20) = (uint64_t)(-2147483648)
>                          = 0xffffffff40000000
>                          = 16 EiB - 2 GiB
> 
> Fix by using the IEC suffixes which are usually safer, and add
> a check to verify the memory is valid. This would have catched
> this bug:
> 
>     Unexpected error in aspeed_sdmc_realize() at hw/misc/aspeed_sdmc.c:261:
>     qemu-system-arm: Invalid RAM size 16 EiB

Indeed :/

> 
> Fixes: 1550d72679 ("aspeed/sdmc: Add AST2600 support")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/misc/aspeed_sdmc.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 0737d8de81..76dd7e6a20 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -256,6 +256,12 @@ static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
>      AspeedSDMCClass *asc = ASPEED_SDMC_GET_CLASS(s);
>  
>      s->max_ram_size = asc->max_ram_size;
> +    if (s->max_ram_size >= 4 * GiB) {
> +        char *szstr = size_to_str(s->max_ram_size);
> +        error_setg(errp, "Invalid RAM size %s", szstr);
> +        g_free(szstr);
> +        return;
> +    }
>

I would put an assert() since the max RAM size is not user configurable. 

C.

>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sdmc_ops, s,
>                            TYPE_ASPEED_SDMC, 0x1000);
> @@ -341,7 +347,7 @@ static void aspeed_2400_sdmc_class_init(ObjectClass *klass, void *data)
>      AspeedSDMCClass *asc = ASPEED_SDMC_CLASS(klass);
>  
>      dc->desc = "ASPEED 2400 SDRAM Memory Controller";
> -    asc->max_ram_size = 512 << 20;
> +    asc->max_ram_size = 512 * MiB;
>      asc->compute_conf = aspeed_2400_sdmc_compute_conf;
>      asc->write = aspeed_2400_sdmc_write;
>      asc->valid_ram_sizes = aspeed_2400_ram_sizes;
> @@ -408,7 +414,7 @@ static void aspeed_2500_sdmc_class_init(ObjectClass *klass, void *data)
>      AspeedSDMCClass *asc = ASPEED_SDMC_CLASS(klass);
>  
>      dc->desc = "ASPEED 2500 SDRAM Memory Controller";
> -    asc->max_ram_size = 1024 << 20;
> +    asc->max_ram_size = 1 * GiB;
>      asc->compute_conf = aspeed_2500_sdmc_compute_conf;
>      asc->write = aspeed_2500_sdmc_write;
>      asc->valid_ram_sizes = aspeed_2500_ram_sizes;
> @@ -485,7 +491,7 @@ static void aspeed_2600_sdmc_class_init(ObjectClass *klass, void *data)
>      AspeedSDMCClass *asc = ASPEED_SDMC_CLASS(klass);
>  
>      dc->desc = "ASPEED 2600 SDRAM Memory Controller";
> -    asc->max_ram_size = 2048 << 20;
> +    asc->max_ram_size = 2 * GiB;
>      asc->compute_conf = aspeed_2600_sdmc_compute_conf;
>      asc->write = aspeed_2600_sdmc_write;
>      asc->valid_ram_sizes = aspeed_2600_ram_sizes;
> 

