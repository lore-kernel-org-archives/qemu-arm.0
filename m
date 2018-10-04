Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1428893wrt;
        Thu, 4 Oct 2018 15:32:20 -0700 (PDT)
X-Google-Smtp-Source: ACcGV624lwPjCkHyY0dmuiShptPY1eXXgcDmEJ3csxReeU1ealbez9c1Yv54bn32qyX6x6DXjlpn
X-Received: by 2002:aed:2ae2:: with SMTP id t89-v6mr6868915qtd.19.1538692340177;
        Thu, 04 Oct 2018 15:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538692340; cv=none;
        d=google.com; s=arc-20160816;
        b=fv5nKcecT/j6d52fKah0FghcT8tEI5QcM3Dz4nc8703UXRilSZT+i0xn/V23gVqfK8
         uvTqPoqXCbt5X/R3LErIfVfSMNmW1khAsPIg7Y0fQr4d4oQE4HRWOm264f5tQXaihvoU
         NElbv6CiNVIbJ+9KA9673J+2Mdd9DXxvGta6TVl9aFH7qWxe0PeNdriMYmQSVllQPpzU
         mbXkjYqLhC9PFMZinvhDE8EOGfDlNDjob9Y72m5u8gmu6JmyYnAUukdQFoJYJsYpKmf4
         67/DEei3c8ReS1mVbXkmhRxmxoNejQ9rvuzDLbD8X/I70vmrtdxnyJ2umAv3v5FSNZjh
         rzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=m2Gphwx4uUBXXu3hO2fWUOsxVtoG+08WtZqYn21jxcg=;
        b=dxxvZzX3IKE1sKlkNp171f30HZJlsqwTRog+XU91z0bEU+sRhwCNENqGVKK4Z3M+Fb
         +/hbSZ/2LmNhAFaPNbPRoLh0I53y/6hnMaIk45zxhZiZouDYo1KJn4yhiDZp9HcRZfJf
         CyaacsMKnboqI37oX7jt2UcUEhLpvFlb/Mu+0ztix9hazQUWG/VHoL/GgHLkOkpYy0ie
         F5rdPtN8IK3WTyfFdW7nQRKMp8bConxqO9fRiYLPl3dXwJW59MoQDhVyO1o6HF6ltSf/
         +nSV1XunxraX7VlwlvXL1PZVfnL1AqAmXHuL05GX/j5sdQIT3HoLRuCJWKBI2fuLG73L
         CGsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aAVLPkh8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7-v6si2239179qvc.79.2018.10.04.15.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 15:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aAVLPkh8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8CAN-0007ql-Og
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 18:32:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8CAF-0007mR-Dg
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 18:32:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8CAC-00055o-7K
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 18:32:11 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:33824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g8CAA-00055E-A1; Thu, 04 Oct 2018 18:32:06 -0400
Received: by mail-pg1-x542.google.com with SMTP id g12-v6so3818742pgs.1;
	Thu, 04 Oct 2018 15:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=m2Gphwx4uUBXXu3hO2fWUOsxVtoG+08WtZqYn21jxcg=;
	b=aAVLPkh8U3quW9NczfIrfRbg0+3r/0++BlM19nDKbZgYaRgWvyP8ZBOS3L1ftCYbYf
	mAd1WjmXfZiOfZ7KwmV+/sVs+GW3LoyRo25ML247PsMRqcguIaWFoF2Ya+9FPJu6k44R
	ZPTOVP6E3Np0ZiOi0/W7C2HB+mMOEEiFABzm+PDxRNBvmLgJeYFw5LsV5zVdsY8pewcr
	wF0qei3oh27ij0bOCTccmr3XQnxO7MG5M2infClZIEtE/beA3IE6DseTOlhZpzZepyLe
	hpl2ZIZ9vrU5zTp+JBvcwLitp8nhr3fS5dgYz3kuLB3mdLoHPb6+x4Ivs2puoWDv1UZx
	1WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=m2Gphwx4uUBXXu3hO2fWUOsxVtoG+08WtZqYn21jxcg=;
	b=WZiMbfS+aJqjM1HL4mNUjhXhlEnhYrfK7W7XIwtN4PhqqE/zmX3rXmf33ceIHvOvmu
	BBd+C7IQzfVMJ0rjPR6p9eiMWVjaXfL5N6e6JlvyssXu3pRc4Ydc9NxcbkoRgDqDR9Xd
	k73/DWqadxwTtn0rLs0JBq5NrOKBIEAZarkwJviufI8svaXR78RJ3XGHwfVusNyQC4F9
	StghX//hyEwLPxjuATHQ4DoLaMIT6QL+MwrAA2JAc2WitmYuhq8nPTyUK7iW28/Gr1U5
	lA5MobeEY3F1B6ek34ZuINIe5YIaTd6UH7I/wvUaML/1ASepSFS+mGs87/K1d5W1bLqJ
	GvgQ==
X-Gm-Message-State: ABuFfoh2L8hpm2H0QJA2xQFBpPKZzCmcUJd5tEMCADm/cL1910oMNtkW
	AswXelCgmYWbL2X/yKxj0zE=
X-Received: by 2002:a63:3642:: with SMTP id
	d63-v6mr7436429pga.404.1538692325127; 
	Thu, 04 Oct 2018 15:32:05 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	y1-v6sm12211002pfy.89.2018.10.04.15.32.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 15:32:03 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-9-git-send-email-edgar.iglesias@gmail.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <9f832e22-a4b2-cba4-2351-70936c835d7a@gmail.com>
Date: Thu, 4 Oct 2018 15:32:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538579266-8389-9-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 08/12] net: cadence_gem:
 Announce 64bit addressing support
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
X-TUID: ZFV2sFIM4VYT

On 10/03/2018 08:07 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Announce 64bit addressing support.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   hw/net/cadence_gem.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index f93cd8e..fc81fb5 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -142,6 +142,7 @@
>   #define GEM_DESCONF4      (0x0000028C/4)
>   #define GEM_DESCONF5      (0x00000290/4)
>   #define GEM_DESCONF6      (0x00000294/4)
> +#define GEM_DESCONF6_64B_MASK (1U << 23)
>   #define GEM_DESCONF7      (0x00000298/4)
>   
>   #define GEM_INT_Q1_STATUS               (0x00000400 / 4)
> @@ -1300,7 +1301,7 @@ static void gem_reset(DeviceState *d)
>       s->regs[GEM_DESCONF] = 0x02500111;
>       s->regs[GEM_DESCONF2] = 0x2ab13fff;
>       s->regs[GEM_DESCONF5] = 0x002f2045;
> -    s->regs[GEM_DESCONF6] = 0x0;
> +    s->regs[GEM_DESCONF6] = GEM_DESCONF6_64B_MASK;
>   
>       queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
>       s->regs[GEM_DESCONF6] |= queues_mask;
> 
