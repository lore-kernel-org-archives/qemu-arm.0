Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71D4CCD199
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 13:52:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAqIr-0004s2-3w; Mon, 20 Oct 2025 09:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vAqIo-0004kf-9I
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 09:51:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vAqIc-0004MR-EB
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 09:51:55 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-273a0aeed57so67654885ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760968300; x=1761573100; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tGaO24M3YKRNtnw6KKmxUy09RGunEmU8iH3jXb4pSDI=;
 b=NYev633HgMG+/zum6twyi5OE39XVXknfHyZmw4xityQ244Ag+KTA7JW8+I+YwoqwhB
 USkx37FWZbLiA/RFdx9g+Ti1GgYmANGzpyfwZIl2p1WrkbSdAOFd04u/se9V0kWaxVyT
 G2lorkmYhTyXK9Jr2YQqXS6mk916fAKJSixhspS0uV3JRbhiAgLb0Co4bGMi5kvudOTw
 3QkigHp5utC4dijpqXhh5JwfmdQHo9ZmKMGrI0ilxEwr8TmesHWkyJobFZOcCq7FFv3z
 iPbC0W8vjIr9gzXDG/HqKkker14qib8D+3NlY/8SlJW7PgLbHk4ybv+5CqnTogCCvADq
 ZO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760968300; x=1761573100;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tGaO24M3YKRNtnw6KKmxUy09RGunEmU8iH3jXb4pSDI=;
 b=oIrBoGYPEwB68CtZfcUa8slq0LtYA5lIGtoF4T3cnyt1A21wx92D2FoMgmUICxh4tA
 1xsLEaYOqr+LJ0wXlViouttr4Wg7toHIEqX9fci/iz4Bf3f2F1AUYlTHuxQPob2Y0D/9
 QxAQnGJdeUjE2y6Nwi4RfpK0fPmL/qaW5lrRCLdfPKN/W7tg36b24nhvP2HDpYeTnEs1
 kXi+R2ljOkXIr1ogDM2BHHhmIEh2k6EnMcEuEjTTGlilQQot7Rf9ohD3aqpQ/aZEEmcP
 A9trlp705PC6oP+yKOYi3qUItsCRdZbnEwBSJa7cbP/8UumTBCj8icNhsMs9clfjLMJJ
 z3sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM14daaVKWdlnhu3zFGOZJI4K911+4cIOtWWhuXkr7uApkM2pXgE681ZVV1SNYKoyz+nz0YKSxYA==@nongnu.org
X-Gm-Message-State: AOJu0YzZw3F5F4yCwzNoBdjELnHcHoLGadPfIb//WqOm9BcnhHANVdLz
 SFB4Hay6zGHUUBZ8sKUV58C0aSa4+XPakUte83Guc/+zl9wFjjpS6Rpe02rDKp0bQzA=
X-Gm-Gg: ASbGnctiB6rXJLlSjDJh2A/kuWmv1BQzCLTuzH2zWRks0hSgMJ9Hk9u4q7D89sd4lyB
 JgHR1AamifVKdRC3XuGoe82NK8JeAa6Gc1w7Fo860qHsaWlUJJGibaJZRCunbLDS81Pso1q56yQ
 +NAREuB+sLjtQ+eNowaeA+1wCipl7SLYMJpDwucinO8X4n6Huv0GlV/JhxduGqN8oGR4UoP1cFb
 R5v2jR6Uv14Whw0hHq5FzZElwY716y3DI7JnOsSiYXEsgSIB32L8/nAyoMiDQJolg0o8Lkc9y1P
 /cK9ZRE+9C/jT9hMtz/z6+4+fmrsRgHZ1EX2Z56e3wkxnuaMiQZPPbdnBeDcpoMncZ/a/1S/Alq
 njgfnv6gEG/2vV51MQ323hi4EGpdROCW8Ri595h5Dji57Wet9ZBAP1pgKk+kbfrvJC6GACJ78qD
 rQhMn/Y+rFxFENvuFV4JMIrveu1Z8JiyGwtTOymWIFrNVsEi9J+RVmgA==
X-Google-Smtp-Source: AGHT+IG40EwByZ0bchpGAbPiyfAp/r25fX2f06pxU5Wn/E0CNHqu5u79hk9tnN1CzrqSLM0JttppJQ==
X-Received: by 2002:a17:903:19cb:b0:24c:db7c:bc34 with SMTP id
 d9443c01a7336-290c6afd047mr181506845ad.13.1760968300327; 
 Mon, 20 Oct 2025 06:51:40 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b401:1d95:5a7c:524e:bcac:abea?
 ([2804:7f0:b401:1d95:5a7c:524e:bcac:abea])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2924700a883sm81142245ad.49.2025.10.20.06.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 06:51:39 -0700 (PDT)
Message-ID: <b172780b-62aa-4aeb-a4ef-1543c3b42883@linaro.org>
Date: Mon, 20 Oct 2025 10:51:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/8] target/arm/tcg: increase cache level for cpu=max
To: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org
Cc: anisinha@redhat.com, armbru@redhat.com, berrange@redhat.com,
 dapeng1.mi@linux.intel.com, eric.auger@redhat.com, farman@linux.ibm.com,
 imammedo@redhat.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, maobibo@loongson.cn, mst@redhat.com,
 mtosatti@redhat.com, peter.maydell@linaro.org, philmd@linaro.org,
 qemu-arm@nongnu.org, richard.henderson@linaro.org, shannon.zhaosl@gmail.com,
 yangyicong@hisilicon.com, zhao1.liu@intel.com
References: <20250827142152.206-1-alireza.sanaee@huawei.com>
 <20250827142152.206-2-alireza.sanaee@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250827142152.206-2-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Alireza,

On 8/27/25 11:21, Alireza Sanaee wrote:
> This patch addresses cache description in the `aarch64_max_tcg_initfn`
> function for cpu=max. It introduces three layers of caches and modifies
> the cache description registers accordingly.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   target/arm/tcg/cpu64.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 35cddbafa4..bf1372ecdf 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1093,6 +1093,19 @@ void aarch64_max_tcg_initfn(Object *obj)
>       uint64_t t;
>       uint32_t u;
>   
> +    /*
> +     * Expanded cache set
> +     */

Can't make sense of this comment. I think it can be confused with anything
related to "Expanded cache index" (FEAT_CCIDX), which is a format not being
used to set the caches below, so maybe remove it?


> +    SET_IDREG(isar, CLIDR, 0x8200123); /* 4 4 3 in 3 bit fields */

Please improve the comment on CLIDR fields here if you want to keep it, like you
did below, i.e., stating what is selected for LoUU, LoC, LoUIS, and the type
of caches at L1, L2, and L3, like "Separate", "Unified", "Unified" etc.

Just to confirm, the ICB field is set to "Not disclosed by this mechanism" because
we don't want to bother setting it as we customize/tweak the topology?


> +    /* 64KB L1 dcache */
> +    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
> +    /* 64KB L1 icache */
> +    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
> +    /* 1MB L2 unified cache */
> +    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
> +    /* 2MB L3 unified cache */
> +    cpu->ccsidr[4] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7);
> +
>       /*
>        * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
>        * to because we started with aarch64_a57_initfn(). A 'max' CPU might


Cheers,
Gustavo

