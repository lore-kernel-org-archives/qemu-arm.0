Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC447106FD6F
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Mar 2026 03:59:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0tft-000390-6q; Thu, 12 Mar 2026 23:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w0tfr-00038O-0K
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 23:58:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w0tfp-0005yx-JU
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 23:58:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48529c325f0so12057565e9.0
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 20:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773374331; x=1773979131; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wyj8VZ4FApCe9K8azkedMZkPkvropAYZl83N6J9mxIg=;
 b=jPeULR6M/KL8LdmMu4d8ethXsEvQ03rZyoJgA3Oo3GC0tTmqr8lgWz6RyMHIY5HTeQ
 J9joqRjtuUfw/9wlq/UdgCSDCQ9am8YuIJHrq5lgUsKKwRk/mZTJ31mNvRUQvvUjHnJo
 KTCOMCYyEmN+vl+ZYWcIbeHC+r6LdeXpmcMrFBruLKRRlU9/St1rcLerveq0U1VW1nBt
 nkzsTXdNuvVg3/R1fNdffC+Cguc5vVzoALMyBgK2XE+d83Mu1HZy7Npx9J5UWRKjI4/L
 X1xGUxyYOrBE4o4T2Lq86MXnLMvTV0nVnSRwJLhzADO77XIpL7/ww/gX7VWkkY3pImJ9
 9Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773374331; x=1773979131;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wyj8VZ4FApCe9K8azkedMZkPkvropAYZl83N6J9mxIg=;
 b=CaAr+uAxFye+haAn+mJbxK37UyVNsuxmPFu+663+4Z1KhXUSnlRy+0dzTu846SZfS6
 HN01FQ8W3351IZBkFZcW/rEC7uZpWyYiUk/CLMnlttB13BwsOZSrzkhYQ288esgUYP2+
 xnjuViD/JBL4rU4rHKFhKuyzzLIZnB5cDHneQ0ZpyvYP58PGSzT1ZI+A8Rymtll3kuGl
 KEPIlbq2PLJJ+fgT1HidC8EpnXgRGKh7FUlsbNJ6tWlw+/GMMlnxNX7lXWKP2jHFjNmI
 B2MZv3G0FHXf3ku9BjnwYh/qmXA4ST6Zn2JaGeHpYUoq9PjKYPRJ5LKO3rxpiMDWTaJy
 W4vA==
X-Gm-Message-State: AOJu0YwDk6QKPXt7X4OUtiE9i0wWVsYbUAm2fkz1ALs9/rx00vixL2J9
 +ACJE/rgNooZqKzcPvUbbWDAGWk4ilMtXWdV95wXQgn1hS61npuBoRPKyK8oxArfWNo=
X-Gm-Gg: ATEYQzyp/zISe1avSIGvGbJVerqPtcDiU5Hzkg5ghqJuU6DWWwu0xkBUjgB6wQ5ClSO
 JHWWvV2gc1X9V07HAT+cqMO9TTj/Zx3yxnlx95S8zOzPPF72mLs8V3TWd9054dq/s06HbzUdAir
 DxYTgvZyJdut+keia9xTfkNj4uljjz6icS/p9g4GHGJC/aNw81NIpmWBSLshzU6SXF6SQTV2qKM
 SlRfGFk6w+UoV0FnnUwvBFjkQG7LtbqZULh3Ni3bj0V21YK3PgNBM+p3f0Kt62DSe4Sa5Tcdepu
 eAIUUv5NlbbZhH+WSaE4sYutRKBnQ4/MQzmYAE7hGaHGtLzSlOLEYDblWdh2jemhFiO/fiYpMET
 kjXSuqTuxJVVhM8r018dKyYtX1vXSoeq+IjfY7GyTt1HKpsID3hCcqZ/JFMWypw6cgvxMkiBKBS
 eu5h3CmD9Qd+cL5LaPMvLYm/QS6p5HewwZILuyFXooSnitEuJis+aCxjgDLmMsIl0nRw==
X-Received: by 2002:a05:600d:844f:10b0:485:40fd:8390 with SMTP id
 5b1f17b1804b1-485567029cdmr18874805e9.26.1773374331570; 
 Thu, 12 Mar 2026 20:58:51 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b65fed7sm165748805e9.11.2026.03.12.20.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 20:58:51 -0700 (PDT)
Message-ID: <a0b3440a-6fde-44d6-95fd-88a04038cd41@linaro.org>
Date: Fri, 13 Mar 2026 04:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm/cpu.h: restrict cpu-defs.h to target
 specific code
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260312224702.1608408-1-pierrick.bouvier@linaro.org>
 <20260312224702.1608408-2-pierrick.bouvier@linaro.org>
 <719ac842-22be-4617-8b87-02424f2b9ea5@linaro.org>
In-Reply-To: <719ac842-22be-4617-8b87-02424f2b9ea5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13/3/26 04:48, Philippe Mathieu-Daudé wrote:
> On 12/3/26 23:47, Pierrick Bouvier wrote:
>> Allow to use this header from common code, which we do in next commit.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   target/arm/cpu.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 657ff4ab20b..b8042f65bb4 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -25,7 +25,9 @@
>>   #include "hw/core/registerfields.h"
>>   #include "cpu-qom.h"
>>   #include "exec/cpu-common.h"
>> +#ifdef COMPILING_PER_TARGET
>>   #include "exec/cpu-defs.h"
>> +#endif
> 
> Since there are no other uses of COMPILING_PER_TARGET in this
> header, this clearly mean "exec/cpu-defs.h" isn't required here
> at all but elsewhere:
> 
> -- >8 --
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 657ff4ab20b..445d5a8a31d 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -25,7 +25,6 @@
>   #include "hw/core/registerfields.h"
>   #include "cpu-qom.h"
>   #include "exec/cpu-common.h"
> -#include "exec/cpu-defs.h"
>   #include "exec/cpu-interrupt.h"
>   #include "exec/gdbstub.h"
>   #include "exec/page-protection.h"
> diff --git a/include/exec/helper-head.h.inc b/include/exec/helper- 
> head.h.inc
> index 5b248fd7138..5603c9941a7 100644
> --- a/include/exec/helper-head.h.inc
> +++ b/include/exec/helper-head.h.inc
> @@ -46,6 +46,7 @@
>   #define dh_ctype(t) dh_ctype_##t
> 
>   #ifdef COMPILING_PER_TARGET
> +# include "exec/cpu-defs.h"
>   # ifdef TARGET_LONG_BITS
>   #  if TARGET_LONG_BITS == 32
>   #   define dh_alias_tl i32
> ---

I'll post patches for this.

