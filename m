Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4258061lfq;
        Mon, 21 Sep 2020 12:48:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDGY0tjrbqoZlz08oXvUIK6mO0L5aj3HLMcvOTtiyHqiV7aZDwUFyeHtK7eo1c29y29lbS
X-Received: by 2002:a25:c487:: with SMTP id u129mr2072109ybf.25.1600717725286;
        Mon, 21 Sep 2020 12:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600717725; cv=none;
        d=google.com; s=arc-20160816;
        b=A9u+TABAIU+58n8O47RANB6IyxlCs63km2AaSvm3jvXnl+QEVxNZ8w1+6yBBiyXSWS
         Bib/WzRwEOBC98FknB+fHheml0r9SBCh1p3AixNDFINHmEWAe2dNDdDBoxOlx8UzWyGZ
         KAHM3KGqU2B5OnmUXp5bOV+uHCh6fsm4pjNiCytZmvjQ3ZI+csPOmhQFUxvvwhK0avZL
         CSVfemoI6N3z8fRTOY/3oi2ZmjuA9DMD9yKu4o1MSpPkU7+PRRktL6oihG3r8/7VEvQt
         Z2MN+w0FNPsAdgEetvJI70vt4JLiNVDTeEzgbLGjc/jUUSYoyBvjev/SL/qzJDX94EDm
         pq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HjPKyPL+3DdKx1MpcE6pKRGhAmWtiEVSfBZTE/PYyy4=;
        b=qQpQGLcuF/tbf86+AuNmcgKR6/+qamxGcw19y2mlcmttmlusKYh7WcqGCaB9jn4NsC
         KJ4ALkyXEkM3iAutL/Ip5t0ZJPUPSgZM4dHchfvQheUufT2pqqBKKFEncFWWcbOuruQE
         gsS43VpsLQLKqS18UtKeMbxwsdD9t3XReHkoNHB0cLf9gkGppVPUL5Fn5L381JB1LkIP
         wiz6Cgo4CIJxQYc01eJShNjoUj0/zy/3Sjs4kURKEMksM5n44FZS5xqzvI+vfXtsscQG
         X6Jlt3NuYWxBLBuXXs0im7fLnLm6v7By4UGbp+MR4ZAFbUmJ7FBMl0jnEh84DZ1yFQ9B
         IoNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=FnaGYBHS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s69si16542547ybi.280.2020.09.21.12.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 12:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=FnaGYBHS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKRno-0004D1-IN
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 15:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKRhW-0002GN-MJ; Mon, 21 Sep 2020 15:42:19 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKRhR-0008BP-Nn; Mon, 21 Sep 2020 15:42:14 -0400
Received: from [172.17.10.14] (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPSA id B276321CC5;
 Mon, 21 Sep 2020 19:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1600717326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjPKyPL+3DdKx1MpcE6pKRGhAmWtiEVSfBZTE/PYyy4=;
 b=FnaGYBHS3+r/MGhmPV9Cn5NaPD/Yt9SbvAcZS9YUk8+dqsz8w7ivOoYGHpMK+qVkdbNmf3
 vbfnHYZKGCwDzzYQ4/QLnob+OfpIrFFIU5++gjF5xIjLvm+04NMBCr3wtRxSmxK1f7yXJH
 0IApgSsCLi0GMCnodBFQVGQArMN6YBY=
Subject: Re: [PATCH v2 2/5] hw/timer/bcm2835: Introduce BCM2835_SYSTIMER_COUNT
 definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200921035257.434532-1-f4bug@amsat.org>
 <20200921035257.434532-3-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <7bee96b4-b5dd-6b24-280a-aca50906d207@greensocs.com>
Date: Mon, 21 Sep 2020 21:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921035257.434532-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 15:38:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yL5Or8TyVSLz

On 9/21/20 5:52 AM, Philippe Mathieu-Daudé wrote:
> Use the BCM2835_SYSTIMER_COUNT definition instead of the
> magic '4' value.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   include/hw/timer/bcm2835_systmr.h | 4 +++-
>   hw/timer/bcm2835_systmr.c         | 3 ++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
> index 64166bd7120..11272837a6b 100644
> --- a/include/hw/timer/bcm2835_systmr.h
> +++ b/include/hw/timer/bcm2835_systmr.h
> @@ -18,6 +18,8 @@ typedef struct BCM2835SystemTimerState BCM2835SystemTimerState;
>   DECLARE_INSTANCE_CHECKER(BCM2835SystemTimerState, BCM2835_SYSTIMER,
>                            TYPE_BCM2835_SYSTIMER)
>   
> +#define BCM2835_SYSTIMER_COUNT 4
> +
>   struct BCM2835SystemTimerState {
>       /*< private >*/
>       SysBusDevice parent_obj;
> @@ -28,7 +30,7 @@ struct BCM2835SystemTimerState {
>   
>       struct {
>           uint32_t status;
> -        uint32_t compare[4];
> +        uint32_t compare[BCM2835_SYSTIMER_COUNT];
>       } reg;
>   };
>   
> diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
> index 3387a6214a2..ff8c5536610 100644
> --- a/hw/timer/bcm2835_systmr.c
> +++ b/hw/timer/bcm2835_systmr.c
> @@ -134,7 +134,8 @@ static const VMStateDescription bcm2835_systmr_vmstate = {
>       .minimum_version_id = 1,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT32(reg.status, BCM2835SystemTimerState),
> -        VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState, 4),
> +        VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState,
> +                             BCM2835_SYSTIMER_COUNT),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> 
