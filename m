Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F51CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 14:38:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRsuy-00032d-Ly; Tue, 26 May 2026 10:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRsus-00031i-Gx
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRsuq-00060I-W1
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779806276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgCfk9VGyvOdsQ/VBQnBbMM85hx/l+tI/fX8KGz1+7U=;
 b=aQVWdF1m2JUL45wnN4P7hJtW0PTraH7N1YA7NHAwO2ValPKeYJdVsFetRUmOlkSvx5Z/AB
 tjK1JF2uOsghg2VSfsq1J5H5N1jbKn4AQy47a/O1lVjDyLVpFe1Ebebk5HndvUNaQUfV79
 Yh8Skv4lwg/HFVGKp28YuGzeLRwJxFI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-K6uuoflSOI-6BBox48NvpQ-1; Tue, 26 May 2026 10:37:49 -0400
X-MC-Unique: K6uuoflSOI-6BBox48NvpQ-1
X-Mimecast-MFC-AGG-ID: K6uuoflSOI-6BBox48NvpQ_1779806268
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49058295985so19080455e9.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 07:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806268; x=1780411068;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RgCfk9VGyvOdsQ/VBQnBbMM85hx/l+tI/fX8KGz1+7U=;
 b=YO88IdmUvXxGIZRhQs8JHN+uqSalk6b3wPQ6g07lgPi/romHvd3rnet6b5f5hpM2R/
 sk6sUhUp6jlZuuNDUGp6UBzfYPCqF/FLYba7q9tEuFdhXoIqsYk0YAGPHEBcHazNasDG
 vEG2ojBvI5Ojhuf3g8/arqLtdRFdt61AJMgWKQGXK98nzIebOSD8RGGitC5D+pqZZmqx
 Ch+VVjrjiXzwzb359Pa6q81PMHxEXIS0sd7tlfHjKCM14c0+cH1rN00J0LVLyl6C7szt
 cX2ZFQO6jegntHud+EGcT7vGs+OR4d+JgQRCATYLWR3Y/Ql5mAyXBNfuMQs3YUhjkhdy
 SzDA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9O7OEh8zwjkEVOv4S6uY0rEWTBQZWt28ovGB6QSUWBZy9yHYTf4JRSutiJgd07VyZjeUIglyqZ1w==@nongnu.org
X-Gm-Message-State: AOJu0YxkXCQBx9b77j5f8sPHvKsAh9se0yipK0KjBBku5mNw+AI5+o6u
 3ROhL5Fh4qfyyyEg2yd0s8VUDHWOgNs+wcSCIHqbkkatwZGnzFRLGBbPAirV5tnjYLV629qiAHJ
 drJS4VBoelgkgmDWAxhKvsUaLOQQyPMfn2WR5jhw6QN0H2y0BdJFFcg==
X-Gm-Gg: Acq92OFMAiphX2/R4RVfhInvyEqtyA7WWyNFAUi2UtTMZkcNrN5PXmV0OhGgo+U0aug
 22UtN4Wtmz8qb+GPe/jYwX3fjMLYrYf73Ruf1y41ZZvdM+S6Yw1cjMOBsHmNWJrPNbeZ70h0Ngx
 c7t3aRDn2jSjZmrq1p4ttOlNxAxku9kEL9jNkIE/wQAcFNA9vQs9KLDF5huBP+feyH0S6Vqnxx6
 1uvFD4Q/YT5U5Vu6NHJ2uVU7HwMCaMB3Gprp/bbBMqr9eSOrV95w/rZAArcllPomjn/vJut+hrK
 u5Es4Fj92fXem63lMYl3rL5czuxeXfhTEZrk8PGycywn/d43zgC/Q9vv1EteHEobY3MBiFNcO5R
 OwG9GZrDkk/JSzLBB/zVVzUg5VkNhz3tJF/hrR1iKpunPCs2/zcJy9Vd0XRr/78fy
X-Received: by 2002:a05:600c:35c8:b0:490:44eb:c1e7 with SMTP id
 5b1f17b1804b1-49044ebc2d5mr345205865e9.30.1779806267944; 
 Tue, 26 May 2026 07:37:47 -0700 (PDT)
X-Received: by 2002:a05:600c:35c8:b0:490:44eb:c1e7 with SMTP id
 5b1f17b1804b1-49044ebc2d5mr345205245e9.30.1779806267562; 
 Tue, 26 May 2026 07:37:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b82sm348259265e9.9.2026.05.26.07.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 07:37:47 -0700 (PDT)
Message-ID: <98236231-c7d5-4866-8cdd-9d318f4d0634@redhat.com>
Date: Tue, 26 May 2026 16:37:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/21] sbsa_gwdt: reduce code ident
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-19-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260303092532.2410177-19-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zunYD4AXduTO8CKBwnvmpTjygOZDFsAadbG30t_Y42I_1779806268
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 3/3/26 10:25 AM, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/watchdog/sbsa_gwdt.c | 38 ++++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> index 40d80f7f2b..91f9a4202c 100644
> --- a/hw/watchdog/sbsa_gwdt.c
> +++ b/hw/watchdog/sbsa_gwdt.c
> @@ -105,25 +105,27 @@ static void sbsa_gwdt_update_timer(SBSA_GWDTState *s, WdtRefreshType rtype)
>  
>      timer_del(s->timer);
>  
> -    if (s->wcs & SBSA_GWDT_WCS_EN) {
> -        /*
> -         * Extract the upper 16 bits from woru & 32 bits from worl
> -         * registers to construct the 48 bit offset value
> -         */
> -        timeout = s->woru;
> -        timeout <<= 32;
> -        timeout |= s->worl;
> -        timeout = muldiv64(timeout, NANOSECONDS_PER_SECOND, s->freq);
> -        timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -
> -        if ((rtype == EXPLICIT_REFRESH) || ((rtype == TIMEOUT_REFRESH) &&
> -                (!(s->wcs & SBSA_GWDT_WCS_WS0)))) {
> -            /* store the current timeout value into compare registers */
> -            s->wcvu = timeout >> 32;
> -            s->wcvl = timeout;
> -        }
> -        timer_mod(s->timer, timeout);
> +    if (!(s->wcs & SBSA_GWDT_WCS_EN)) {
> +        return;
> +    }
> +
> +    /*
> +     * Extract the upper 16 bits from woru & 32 bits from worl
> +     * registers to construct the 48 bit offset value
> +     */
> +    timeout = s->woru;
> +    timeout <<= 32;
> +    timeout |= s->worl;
> +    timeout = muldiv64(timeout, NANOSECONDS_PER_SECOND, s->freq);
> +    timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +
> +    if ((rtype == EXPLICIT_REFRESH) || ((rtype == TIMEOUT_REFRESH) &&
> +            (!(s->wcs & SBSA_GWDT_WCS_WS0)))) {
> +        /* store the current timeout value into compare registers */
> +        s->wcvu = timeout >> 32;
> +        s->wcvl = timeout;
>      }
> +    timer_mod(s->timer, timeout);
>  }
>  
>  static void sbsa_gwdt_rwrite(void *opaque, hwaddr offset, uint64_t data,


