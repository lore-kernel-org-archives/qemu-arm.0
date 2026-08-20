Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80881C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 23:16:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxBz6-0003Xg-Cv; Thu, 20 Aug 2026 19:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxBz5-0003Ws-0Z
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 19:15:43 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxBz3-0007VO-Eh
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 19:15:42 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-84862b0d5aeso269425b3a.2
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 16:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787267739; x=1787872539; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lUw/tl68lr0AGsM4Oc3dKTj4tWdEtIV3qnHlengnk2o=;
 b=XKgS/hXsu9hRLXF06zgJAskDUlJCLjFtk7zsIUkM14Q2UbQ+KmcndFVAgCfrE9wQiO
 8Oi/RLLTL0JjtIFXfOMFdhdSh8Ktqv5G42OhsHLPY7/HftptJXiQjtRCw42VoTzs6Wb9
 4lPgfVKcPDWXC2QB2MNpplGiobkSA8HlNfPuz14xSzJGeewaa6tFYCvGS57SPNnU4ruw
 tXOleZ9sZcwPvUKxLooILowtHek+eX/EHIf+aQomfblFoWxp33/0okt0uMlXoRvAS3hx
 eqOzm+kB2KFXsTfAMVb5cuKH7rDyEIgtnIGzCnnJ9VzC8WsV//NEhIowPOEoy20A8yBK
 yTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787267739; x=1787872539;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lUw/tl68lr0AGsM4Oc3dKTj4tWdEtIV3qnHlengnk2o=;
 b=D2JFlfPChOcUVkr5GYyEO/zsxfBxKSFegB/3QzfX9tOpy7i5fjk3a8/HGPbWzxQfOS
 voodd5Iaxgnzs4Y8NRldtWEYwytp/VLJCeo4Eh1nEXRL5r1C5/+D24doLNirINCEcKKy
 6Vcf6Wf1ryT0cXGVgU7xN+dZwGNgxBfWcLI7m0/KT3JODWC5ctysgUU5Jk4O6tvH4d4E
 MtuywmvQDy0DApqxIfBEqUnWej56JVXvNj1InBIXlzRxsUG35rzFchFcGk3IGK/InfWb
 wPR1E8M1f9EhPBTZJUuOuCuz7L23g0mQvb5T63YT2+Fsfkb6aLW7GUgRLMd19H/qAQ36
 LkJQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqDNII+arXLMGT+ebXZgLrjCnYE4Bw3kWEl8vpoYPW7n4w38NSC682xrvJYvWid3N8f9CvBlQVBfQ==@nongnu.org
X-Gm-Message-State: AFuF++kI071WAeSVwSbDLLoxSmpBKia0Ws+6QG9N5qwvAmNd92JFOdn9
 O+IlsnUaTLUA46yDSURrIH2eywfnwGATDZ+bb6vI4TM2NSKSV5BQV++7kNRNpsmM+uc=
X-Gm-Gg: AR+sD13TnFmmn6CIa5oEunM0bMTamdx5LUtbxCZjlrMHbJHtj690pq8uHv5t1UZEicL
 JEpnuIhdQJbgwDgvzC4t4XCKkgbrnp7XwOuPd9W21MvtDfJ2jLqGU7e0qwrm7WOyyMKXErwrF+/
 h7SVGSIBUCU+Q1mWCqzzer1Xox/KgGk92phbNQqY7W1zK0vGUNK+zCFLgeKO823zPJumOQPrh7o
 5gwo1/sdbw5372f5YUI8LE9UHMgo1QqDzVPc5ZiuVHMX36sarFF4pQFUlq6J5rFDEf3lX8Z4dpU
 cuawmwBqHqntAhsu8cakw6sKf3iG9txJwNIkYhf1eMgwLLwbSnOrOzsa16Fum2A8jmjPnsRIFpY
 wCdfI24py1dkunHXUCH+bC0rkIJEbdNX8FfbnfEDX8O9qgpnm57kP2S6ZBK+lDHWkhcR+e0hm0X
 OAqtcTfv5Km2dSu30NNspRtgF7RSEMU6xK5/ZrPDZ9vFfGLL6JqxVgg4uJHaP3bI6ntRtk57iq7
 drN
X-Received: by 2002:a05:6a00:2ea1:b0:84c:5b65:ef86 with SMTP id
 d2e1a72fcca58-851fa060bf6mr2280857b3a.17.1787267739475; 
 Thu, 20 Aug 2026 16:15:39 -0700 (PDT)
Received: from [172.20.6.151] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d365378esm2107761b3a.45.2026.08.20.16.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 16:15:38 -0700 (PDT)
Message-ID: <89f4bf70-7ac9-4356-85e9-114d252c19b6@linaro.org>
Date: Thu, 20 Aug 2026 16:15:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/13] cpus: Add const-qualified CPU environment
 accessors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-10-philmd@oss.qualcomm.com>
 <0b70e3cc-e14f-4737-b265-c7d12898169a@linaro.org>
 <854739cc-1275-4324-aaea-576f0a504172@oss.qualcomm.com>
 <fb2425af-9f89-4413-a31e-1f22fd42d869@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <fb2425af-9f89-4413-a31e-1f22fd42d869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 8/20/26 09:50, Philippe Mathieu-Daudé wrote:
> Actually simpler and even well readable:
> 
> -- >8 --
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 6594f7fa1b..d67d008236 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -85,21 +85,11 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
>    *
>    * Return the ArchCPU associated with the environment.
>    */
> -static inline ArchCPU *env_archcpu(CPUArchState *env)
> -{
> -    return (void *)env - sizeof(CPUState);
> -}
> -
> -/**
> - * env_cpu_const(env)
> - * @env: The architecture environment
> - *
> - * Return the CPUState associated with the environment.
> - */
> -static inline const CPUState *env_cpu_const(const CPUArchState *env)
> -{
> -    return (void *)env - sizeof(CPUState);
> -}
> +#define env_archcpu(env) _Generic(*(env), \
> +            CPUArchState: \
> +                (ArchCPU *)((void *)env - sizeof(CPUState)), \
> +            const CPUArchState: \
> +                (const ArchCPU *)((const void *)env - sizeof(CPUState)))
> 
>   /**
>    * env_cpu(env)
> @@ -107,9 +97,10 @@ static inline const CPUState *env_cpu_const(const CPUArchState *env)
>    *
>    * Return the CPUState associated with the environment.
>    */
> -static inline CPUState *env_cpu(CPUArchState *env)
> -{
> -    return (CPUState *)env_cpu_const(env);
> -}
> +#define env_cpu(env) _Generic(*(env), \
> +            CPUArchState: \
> +                (CPUState *)((void *)env - sizeof(CPUState)), \
> +            const CPUArchState: \
> +                (const CPUState *)((const void *)env - sizeof(CPUState)))
> 
>   #endif /* CPU_COMMON_H */
> ---

Exactly what I had in mind, thanks.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

