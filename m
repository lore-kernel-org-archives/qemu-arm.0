Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFD9FF4923
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 01:10:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w718b-00048a-MU; Sun, 29 Mar 2026 21:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w718Y-00046q-OO
 for qemu-arm@nongnu.org; Sun, 29 Mar 2026 21:09:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w718W-0000P1-Fq
 for qemu-arm@nongnu.org; Sun, 29 Mar 2026 21:09:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2b2494440f3so2897355ad.2
 for <qemu-arm@nongnu.org>; Sun, 29 Mar 2026 18:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774832987; x=1775437787; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bWcuM7LcTY+xuh8mNn8QIqY8lj7Da/e0c2r4p89Qsu0=;
 b=AH3VinFYi8Fxic1Jl86aAKnBV1q4FpZMi78VGRkGDu13XOtcV8z66IZdaHJirNVtX3
 Y5gRCWG+P0NdDZEktM78gFsgNgkMSboC50peRkDMdGgcGiaCAc33HMcm3/8NHuYcRNTF
 9bMsHmAeK7fE0y6VM3J4sC5xUeIGIwhgSibIuesHeJ2y/IEM0OaHXGo0LxoLAXfxHpEw
 tI599NW1GHcQxk9o5frF2B5lHbCz2X3KWG6c29xEEqjUnNvvxB+Nf54s2OzhR15i3YL4
 GvIlKUr+JAVPx8Efb4nRePTLsbhDpmZlDOc2a+VWXg9BKZDtDN1jM17f3nelLQZu8YXB
 i2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774832987; x=1775437787;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bWcuM7LcTY+xuh8mNn8QIqY8lj7Da/e0c2r4p89Qsu0=;
 b=Dt4HA+xJGWy7seDpH6eXPyIW6yf7uNxC5U1RHtaAZdfljnsKMKgm2S/QI8weDb/UpC
 v1HQf3bbUPE5vn72ZTzdRtHtnrI0W45eKs5RiajNak3KxUr0mcBR8Ocml7JoDN4NOKfK
 1ve4LVPa8zeMy8tEtUJp6RdjuGl5HLaCjtXXOT9oLETs5vWYgXeC/sah68RIgxTtOZRy
 IDsLXFaRKGbNBSIIi18eEDA3tbNf84JoJYVTosayP1mknFCGrAvrrSu1rtK6mmy13TC/
 HWiAey8dyX63AcTC7hpfhpfiw3uXmGBrtgT8FQ+3uhKyJ1wjJzWtu26VaQNkl/7p93PB
 v4EQ==
X-Gm-Message-State: AOJu0YxTx6TBuiRg+XNhTpRa9+HSicIimRmC0DxS4+KVjj49m9v/qVuO
 ytQVNDLClLuepfLcdGlTQeGYJFvT89/my9HrkC5CO/O3EqSdnrdUlBCSvaR8/Z1fYNA=
X-Gm-Gg: ATEYQzzKUY7W5ihksWOWoRxCCXf4CgkNATbHHFkND8jfeUqihl5nk15xcXkemzxxtt6
 9AR4nthBJhonSHzWAuWWAT/VvZOgMeSJJBQXVe+UE3zjvUYZyTCCTya/FwNrxJjjzHGs8MKt0mn
 LEqp5QmIRJ8nwvlZoam5tb0JQIdxFrwrhgwmr8O3ExE1hQndRHpptIre2TvkTMR3n4ATuc8MVpf
 jEi+5iEoQpcrzYdC0T8YbtqDcJE+/vMKa9swmMKon/kpVANCZODh+CtP47W7TKOU7xhdEPHlGyv
 B8/d8gogT6e9geL5866WDmUwQPqTtr6PkLk/pUiJCKaptpGr+uBKiN9zRYHHvhfWKbgMn58uTEq
 FQv3F7WxIHdw8nltowolnNO8R54pWHJryqqA+77ZHQTZzO1bTN7xdQ7u3qWxPhb0ZYdeei5I0Se
 rshH+86qpCfUparKXYKzE0DUtMn4Hir9XK2DK6XZo=
X-Received: by 2002:a17:902:e74e:b0:2b2:45b7:306e with SMTP id
 d9443c01a7336-2b245b73bdbmr60693805ad.3.1774832986749; 
 Sun, 29 Mar 2026 18:09:46 -0700 (PDT)
Received: from [192.168.4.112] ([103.73.85.112])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2427b15a2sm71596935ad.73.2026.03.29.18.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Mar 2026 18:09:46 -0700 (PDT)
Message-ID: <b6895297-c24b-4605-8d2a-a8566dfd3604@linaro.org>
Date: Mon, 30 Mar 2026 11:09:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] target/arm/tcg/translate-vfp.c: make compilation
 unit common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-6-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260327165042.604105-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 3/28/26 02:50, Pierrick Bouvier wrote:
> Generated decode files must be duplicated between user and system, as
> they are generated in private folders per libs, and can't be included
> otherwise, as meson does not give control on output folder.
> Indeed, meson generator is a different approach than custom_target, and
> this is a limitation by design.
> 
> They were already duplicated between arch variants anyway, so nothing
> new here.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/meson.build | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 3e96c77df73..46bf4a6d76b 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -30,7 +30,6 @@ arm_ss.add(files(
>     'translate-m-nocp.c',
>     'translate-mve.c',
>     'translate-neon.c',
> -  'translate-vfp.c',
>     'm_helper.c',
>     'mve_helper.c',
>     'op_helper.c',
> @@ -60,7 +59,10 @@ arm_common_ss.add(files(
>     'crypto_helper.c',
>   ))
>   
> -arm_common_system_ss.add(files(
> +arm_common_system_ss.add(
> +  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
> +  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),

How are you not removing the other decodetree invocations at the top of the file?


r~

> +  files(
>     'cpregs-at.c',
>     'debug.c',
>     'hflags.c',
> @@ -68,6 +70,7 @@ arm_common_system_ss.add(files(
>     'psci.c',
>     'tlb_helper.c',
>     'tlb-insns.c',
> +  'translate-vfp.c',
>     'vec_helper.c',
>     'vfp_helper.c',
>   ))
> @@ -76,6 +79,7 @@ arm_user_ss.add(files(
>     'hflags.c',
>     'neon_helper.c',
>     'tlb_helper.c',
> +  'translate-vfp.c',
>     'vec_helper.c',
>     'vfp_helper.c',
>   ))


