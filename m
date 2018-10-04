Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1415261wrt;
        Thu, 4 Oct 2018 15:15:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62blwLaCX7WSYS7JriX0QKcbRXZ6FA4Wat05uZV9VjdrXhNPvrZNekQZIK+2XOTRyXJs12d
X-Received: by 2002:aed:2259:: with SMTP id o25-v6mr7245096qtc.13.1538691305652;
        Thu, 04 Oct 2018 15:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538691305; cv=none;
        d=google.com; s=arc-20160816;
        b=mV853bxltSKZIIUsZ8Iwa5jQza77+nHWH8Dcv6pInLbZJCm4XhMRNIFkCtK+uCu8fp
         p4Zwmmx/3NoK1wvSF5I7Fu8ap90nQBRYBzIHv1K8hijcnGsy4ZMVWuLQZeKZmczcpIlM
         volbfrQupIbCBHl5VUdeGtwt5qScgPX0RYY1iLnV0z7rU//bH7WEPzuT6AcYqaqiZhnX
         p9mxXk2C7XC3hbZrEpD50D6WJ3pREPcEy8tuVd4eMJq2LLEGSea8P+mSFxKtGE1yOCj6
         LQvfIC2A801HXnlq6CMwQevqwJY5+bATsuvS1MR+e9v1xr0TJg6+ApQAABwoRRb1W+dg
         VNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=CVJ7gVdn5uKJMZ/lKhy646d4eZ9OgsPSW1SG7s1pQ34=;
        b=yrY+Okr+qEr7JpfDAK+Qw3kHtYvoTihDWvsZe0kEnMjH3X6uiRfszgZVqTdIGEsidA
         24U8OWOr5Iy5D9UWA+ry79ssup4HtC1ce9MvuZD4bj/qIDJXEfkFNrqodXauWb7lvm/2
         Y40ZDH08APITf6J1ZQz0IrWFTba0an7Ygb0iT9BTgL01Q/zYDcX7qm3WVkF0meRnXm/0
         nl+Amy2luTLpMKvT1X8IpqC45KtsqgzJTxSBgQTscIbT7w8iimTamA7BVpbRrMKHuobJ
         HRUWO01Y7gcxOf5QbFECQq0X93C1hpynXFcf946D1WjNmVi/k4azGEmoMkAjwX01iep6
         2U1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nkB8q8Ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7-v6si2707105qvo.211.2018.10.04.15.15.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 15:15:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nkB8q8Ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8Bth-0008Rw-6E
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 18:15:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8BtW-0008QR-Pv
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 18:14:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8BtT-00056a-Ln
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 18:14:54 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g8BtT-00055k-FO; Thu, 04 Oct 2018 18:14:51 -0400
Received: by mail-pf1-x444.google.com with SMTP id p12-v6so4066721pfh.2;
	Thu, 04 Oct 2018 15:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CVJ7gVdn5uKJMZ/lKhy646d4eZ9OgsPSW1SG7s1pQ34=;
	b=nkB8q8NgWziBjr9GfQwn+pZdeJRFVVQrhLB2FcdCa8f2igL/tpL/AyzxoHiBEYKIOZ
	nce/lz6wWHUgMNhLFu5yRRGHMtPo221Ru6Hm3ZSf5eHAxsznl6YgH+5lcKdF0/6zGsk4
	UInLSgVxTsHG1br9oXA0xZc0OJWkRmo8awl2usL0CI9hTs5BNCIbphQv5z6LUjlWwdNA
	mcA3XSUF5AEo8BRILXnQTWmo5fr6X2Y1dl3tg+3uQctoR8CUm2a985tkS8JRq69sIgIn
	i1erL5D6+v8qmk5iwHtKivjGu5QYrF/GXjK5dC3RKaKlMX4H46UzQG/0ZpjiXozDIaDF
	q4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CVJ7gVdn5uKJMZ/lKhy646d4eZ9OgsPSW1SG7s1pQ34=;
	b=LdlyX5c5AdBHrXsiTUC1cr/FQUZpx23pbul+1euxDIobebdIZw5l4PaTEG3oKrhSuB
	l8/OZDszeEmZ457xWEcm+yCFb06AdXKJZurZpO/s78rmLnscVRwqBDIkHoBLrHsL6aFE
	jjMfXnSN4s+QZ7U9uTOktv0rYfvgy5YH1QsFHnFJvf971sjiR2a5n9MqMDMcP/sQoP3O
	dG+wsi29KKYfvcOIM1u8d+cCtJPv6FxOOHJBRDqAQcE9jSnAhyyU5Mge4BuMGhAPtElE
	C67x25Elsd9QGVAnO3lU8DLq5xNOnrH9u6rBZU4/Ir6bDG9zc4zr/auSlCRPXdE5ma9K
	FruQ==
X-Gm-Message-State: ABuFfogDelbfSkoBjnVOCMM9SbLSms5PeN2ELZlRQ2cYkPbMOP5Fe6oe
	OwYEeyHGcQKY6+Tg9w84c2o=
X-Received: by 2002:a63:e116:: with SMTP id
	z22-v6mr7351541pgh.20.1538691290492; 
	Thu, 04 Oct 2018 15:14:50 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	d81-v6sm8715328pfj.122.2018.10.04.15.14.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 15:14:48 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-3-git-send-email-edgar.iglesias@gmail.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <95a9c881-20fe-cba5-3e9b-25526e20de89@gmail.com>
Date: Thu, 4 Oct 2018 15:14:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538579266-8389-3-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 02/12] net: cadence_gem:
 Announce availability of priority queues
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qdIr6+LATK0X

On 10/03/2018 08:07 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Announce the availability of the various priority queues.
> This fixes an issue where guest kernels would miss to
> configure secondary queues due to inproper feature bits.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   hw/net/cadence_gem.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index e560b7a..901c173 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1213,6 +1213,7 @@ static void gem_reset(DeviceState *d)
>       int i;
>       CadenceGEMState *s = CADENCE_GEM(d);
>       const uint8_t *a;
> +    uint32_t queues_mask;
>   
>       DB_PRINT("\n");
>   
> @@ -1229,7 +1230,10 @@ static void gem_reset(DeviceState *d)
>       s->regs[GEM_DESCONF] = 0x02500111;
>       s->regs[GEM_DESCONF2] = 0x2ab13fff;
>       s->regs[GEM_DESCONF5] = 0x002f2045;
> -    s->regs[GEM_DESCONF6] = 0x00000200;
> +    s->regs[GEM_DESCONF6] = 0x0;
> +
> +    queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
> +    s->regs[GEM_DESCONF6] |= queues_mask;
>   
>       /* Set MAC address */
>       a = &s->conf.macaddr.a[0];
> 
