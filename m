Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1091687lfc;
        Mon, 2 Dec 2019 22:10:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqxONCj54Y1KOmruup3TitfN3RcFvND/je7YActxholzFakXVc2oZBgpU/HTHB5mjuR+j5JO
X-Received: by 2002:ac8:6a0e:: with SMTP id t14mr3519863qtr.57.1575353417791;
        Mon, 02 Dec 2019 22:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575353417; cv=none;
        d=google.com; s=arc-20160816;
        b=P1EfbDjcpj0HVPYhRfkEepahoV4ABAp4smyPe42N9WjeswnO1pIlHOqxqbuPNIeEX7
         BUD6WMQraHvjddHuZgco9fI9El+kCKeDJpFcAeyy43z+ryLcAmPmiW6BGp/wGtEvUX7C
         i9VXgOar4auuKV7F5iRUVbHph3XVp8pP54TrGED1b/KmIueekjY0K4RoCslYuFhFbqNH
         zFi3ZSaBIC64fVoTzuyWYjlLlyzNsxNbbvh+W7cWXS+aRDTwEGhTWVH1DAbJlbWwgasI
         ucU05mWQ2ZQfiMbnDSyfTwqvuykhVXKoC+ie8LB9JbCwPjud5PMa0Tiv0fEUiKoVKTzH
         zgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3CgCdBNIjws7notuP2bcv87jEX3tF15nyKZxcylDcoM=;
        b=YTsm+/3VVic5a5qliOl5VTWs7gSlAuXsUb5CZKsauAuoMeWypI7qgV8vkwx1gD13Ho
         Y0xz5MqpQRVVEAopoW6+eWt4rVqohl39D49FeoBeRcc5XdyURJ6YfScbqgooPYFDHvsr
         s5g+Gn/pHbjQAdgCjKzoMSeGVqxcJ2E7a3KksYMMMN+A5JZK7GnXz11oa5mSUyEikhXQ
         0ySV/8E6drjUZGubtClRYwdlaDbhAnXo4OoSQOCQ5wZbQYkTL5QQtWikF20XJswUjaVw
         3PjiAC4ORhT2thrQQZHE2oJE0ODmIYArZIgba8+KPcEydjspcPLvhaKO2m55rsbiucaM
         srhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JpAOYG4W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si1269716qtn.108.2019.12.02.22.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 22:10:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JpAOYG4W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic1O4-0004r8-68
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 01:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ic1Nk-0004mI-Lk
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 01:09:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ic1Nh-00054k-Rh
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 01:09:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30331
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ic1Nh-000520-N5
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 01:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575353392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3CgCdBNIjws7notuP2bcv87jEX3tF15nyKZxcylDcoM=;
 b=JpAOYG4W4LPY/KeiWgnKeuLCghGOAdGnsfZhUD3jWQPkFtMBRlUqr5Sl8t1XmWGcyQAQBQ
 yUjbI2GhIdd3YTEdSoj342hZkvEm2qBx2E2hxanuk6Afj1hkv2KKFzxquyiWCr/snnxZyY
 pUGOGyvb2M/Gv9YxuMVn4F4KjOklhMA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-BiY9U2P8PEOaUcnY3K_kCQ-1; Tue, 03 Dec 2019 01:09:51 -0500
Received: by mail-wr1-f71.google.com with SMTP id c6so1192099wrm.18
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 22:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3CgCdBNIjws7notuP2bcv87jEX3tF15nyKZxcylDcoM=;
 b=jniWgVLSEGY/3F4Sbp8m2oUjCrBR0lpPoa5hiqTQp7uqJLge0At0X/R60lIIfN0DA7
 rn0vr2auu+aJSPU5DulVcQWEfhX1jqYzqg91hOJsZDkYZk+GR1vjZLd4jVwy2MLVQpAg
 SIqY1An2rlKdadm729U7nYlj1GLpybKVlrXj7g54t3e5l2wX//fJ6Io4V1EEpzaNrqe1
 7ZiqR7XRMv/KZviNRki6jlDnOGAsLI5eNVSrKH43saR54baWO6+Z+Qop4EUW9l9P5Gh9
 dWxm4ktxXeMYvBGpNXlfp3pw38tkHRemwZ8SLvsyJMzZ3ghzodOL+oDnoZGE2GCHnKQD
 Vlmg==
X-Gm-Message-State: APjAAAWZVzBZjpv71CsiXJt08+wllea1x+omZNfxjbwDVeKDmNUZxClO
 7ffu71tRLGcyBQNl2gJmO0SLatlJPWwOcDek/43tjLvnsvJo3soJkik7kvH129WiU+dBK0EVLtn
 TKYvPcL6i35+q
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr3046712wrn.75.1575353390138;
 Mon, 02 Dec 2019 22:09:50 -0800 (PST)
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr3046648wrn.75.1575353389275;
 Mon, 02 Dec 2019 22:09:49 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id o7sm1796086wmc.41.2019.12.02.22.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 22:09:48 -0800 (PST)
Subject: Re: [PATCH v2 2/4] target/arm: Abstract the generic timer frequency
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20191203041440.6275-1-andrew@aj.id.au>
 <20191203041440.6275-3-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <283c152b-b1c7-551e-bec0-c087b14de996@redhat.com>
Date: Tue, 3 Dec 2019 07:09:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203041440.6275-3-andrew@aj.id.au>
Content-Language: en-US
X-MC-Unique: BiY9U2P8PEOaUcnY3K_kCQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: joel@jms.id.au, peter.maydell@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ku3GDfDI1FBg

On 12/3/19 5:14 AM, Andrew Jeffery wrote:
> Prepare for SoCs such as the ASPEED AST2600 whose firmware configures
> CNTFRQ to values significantly larger than the static 62.5MHz value
> currently derived from GTIMER_SCALE. As the OS potentially derives its
> timer periods from the CNTFRQ value the lack of support for running
> QEMUTimers at the appropriate rate leads to sticky behaviour in the
> guest.
> 
> Substitute the GTIMER_SCALE constant with use of a helper to derive the
> period from gt_cntfrq stored in struct ARMCPU. Initially set gt_cntfrq
> to the frequency associated with GTIMER_SCALE so current behaviour is
> maintained.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.c    |  2 ++
>   target/arm/cpu.h    | 10 ++++++++++
>   target/arm/helper.c | 10 +++++++---
>   3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7a4ac9339bf9..5698a74061bb 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -974,6 +974,8 @@ static void arm_cpu_initfn(Object *obj)
>       if (tcg_enabled()) {
>           cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
>       }
> +
> +    cpu->gt_cntfrq = NANOSECONDS_PER_SECOND / GTIMER_SCALE;
>   }
>   
>   static Property arm_cpu_reset_cbar_property =
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 83a809d4bac4..666c03871fdf 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -932,8 +932,18 @@ struct ARMCPU {
>        */
>       DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ);
>       DECLARE_BITMAP(sve_vq_init, ARM_MAX_VQ);
> +
> +    /* Generic timer counter frequency, in Hz */
> +    uint64_t gt_cntfrq;

You can also explicit the unit by calling it 'gt_cntfrq_hz'.

>   };
>   
> +static inline unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
> +{
> +    /* XXX: Could include qemu/timer.h to get NANOSECONDS_PER_SECOND? */

Why inline this call? I doubt there is a significant performance gain.

> +    const unsigned int ns_per_s = 1000 * 1000 * 1000;
> +    return ns_per_s > cpu->gt_cntfrq ? ns_per_s / cpu->gt_cntfrq : 1;
> +}
> +
>   void arm_cpu_post_init(Object *obj);
>   
>   uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 65c4441a3896..2622a9a8d02f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2409,7 +2409,9 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
>   
>   static uint64_t gt_get_countervalue(CPUARMState *env)
>   {
> -    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / GTIMER_SCALE;
> +    ARMCPU *cpu = env_archcpu(env);
> +
> +    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / gt_cntfrq_period_ns(cpu);
>   }
>   
>   static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
> @@ -2445,7 +2447,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>            * set the timer for as far in the future as possible. When the
>            * timer expires we will reset the timer for any remaining period.
>            */
> -        if (nexttick > INT64_MAX / GTIMER_SCALE) {
> +        if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
>               timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
>           } else {
>               timer_mod(cpu->gt_timer[timeridx], nexttick);
> @@ -2874,11 +2876,13 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>   
>   static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
>   {
> +    ARMCPU *cpu = env_archcpu(env);
> +
>       /* Currently we have no support for QEMUTimer in linux-user so we
>        * can't call gt_get_countervalue(env), instead we directly
>        * call the lower level functions.
>        */
> -    return cpu_get_clock() / GTIMER_SCALE;
> +    return cpu_get_clock() / gt_cntfrq_period_ns(cpu);
>   }
>   
>   static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
> 

