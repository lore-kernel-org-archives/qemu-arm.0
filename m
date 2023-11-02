Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp135737eja;
        Wed, 1 Nov 2023 21:12:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwy8Q8fHJRWJRVhOyCxFewlb3XGu6RaTyLT8oddH63CSvytvrPf0HZ2ObACINl4TxRtUcd
X-Received: by 2002:ac8:5c04:0:b0:41e:1d94:885f with SMTP id i4-20020ac85c04000000b0041e1d94885fmr23618143qti.41.1698898379290;
        Wed, 01 Nov 2023 21:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698898379; cv=none;
        d=google.com; s=arc-20160816;
        b=DlPfPgXlKO7NMk0Jhq3l+OmidEvtL5trzlGFv52dg8gJIhFiz8TUDNEamUvu/G70Gx
         E4YLanT6p1cq3404nDq6+v/1OIddQK3wuLCKMf8jZxwEUWoNRYF2RBYNxtN3jff6AtRt
         ni948DAb3APq8/9Lr0E8WV8VgpkWN21kHnKrsZC17hbWBnn68B/EQDf6hfoZp8ttf8vs
         0JQyhSp5nnRYYS8KXoM3vEb+FLoBxm3DBpv06xcbWyLI2ag/NtjPILGpOUSFeJbdr3sg
         ni9yoRVSWoTq47TGtgXppM76w1NsPHyQTYV9EFIlWg0Dnp5w67DgrAOeRQbgBf9D3//f
         GSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=XEzfy8NbIn5S+EMl+oCpNGut+dAhqc3jippQUKGZQCM=;
        fh=vnd25H/Ke+7YaFzjpnMIhV1td4ceLAPtKNu/30RxYYA=;
        b=sG5gZkbCJmr0aqNMogrm1qXNg4ro5MZg+Gahty28L10ZdQGCUtfQJlFcufGxNaQKK/
         xi4NdqwnsJDH5u2iYIft5vztLSorCuUaTFW773QV1cWPvBXkL4w683k3O9aBH/weaGrC
         31sELw7oB68q8yaapjsYZ78nQ7bj7lP8Tpc6hE4HpYSflSGw3sfSPsm2KKy3iDJlzwhB
         kivppozq+pm870wWtorZhWLdBT9i/jlTLNPVEmOvC0qvzPymAF4Xku7Tk0qEGugLUXjt
         lBR2vXKTxSdXxkTQtqH/Y0ab3wPvzRALJ+7L8kqlaX3NtnuiwI7HeoVdEufaulS/SO7M
         XwIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJq7nxFE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a05622a188900b004182092fa7esi3645005qtc.602.2023.11.01.21.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 21:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJq7nxFE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyP4T-0001oa-23; Thu, 02 Nov 2023 00:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyP4P-0001oL-V1
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 00:12:39 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyP4O-0006FB-2B
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 00:12:37 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-28014fed9efso556709a91.0
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 21:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698898354; x=1699503154; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XEzfy8NbIn5S+EMl+oCpNGut+dAhqc3jippQUKGZQCM=;
 b=nJq7nxFET4LzrHmG9i8KdfAFFgYBpUgD7bHHOxIDDR8K+u5gGpIGtA9iE1kLLEGlk7
 XH4G0ZhMpksekbaaREDFqg85BMkgMizuoDc4ywLfKH/yvEgxrpkaxkynskxh4MPxiKi6
 qtUiwgIc+mHFgyY2JE8cmBBQIhE+BA3+QIS1hw9UxeDaAEqn/uLLBuC8DGgd+PzqV6VA
 a9PQ1AT2FyZsjhk1C+LFxl37Ki+nZgiSTG++1OY9Kx9ptOuGn9Reqx1VGfuW/uunbi5e
 T10XQA8kxwstgZXZI9Bky8YZK1oprgaXhZW+DnCHOKIJ/tkZvyn56o4c+7sIpf6k2wj4
 lZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698898354; x=1699503154;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XEzfy8NbIn5S+EMl+oCpNGut+dAhqc3jippQUKGZQCM=;
 b=NkxJy98lAnQ4FA59eysURC5ZVEgdUXU0kCR7oyXbX3KOyrDIdTxtmV/9v51Ajm6Ktd
 Dba6WMTtWsW+83jjRR3Jj8Q0J+VTHn1prCjes4X5rI8PIsVn2fyUopSjIOOWkw3Jp5jS
 V1ElONxj39gA+vtUcV8U1ws/ucmDeJPywN+fdq4Ar7dxKPGQPd8cxJZlFvtSV40UviNl
 7c5OmloXQYw9kz/rnkZdUMrRM7t0MZseC5fyz7sWLfcADAJodPrHNcOebST6u3/25xZh
 QmtLI+/4eignbildURQGWithPsI4cB8auRVfvWn0LTz7ZHKQ+hYeXEKJQ9PoX6r3lCxj
 hMtQ==
X-Gm-Message-State: AOJu0YxaJW47/ZW6+l+z6v9cwoL5p3fib9ztG4ABEQFMAM9g2oO2jw5r
 mmEk+EAElsQMP6UOKU9/D0Uehw==
X-Received: by 2002:a17:902:d2cd:b0:1cc:5ac3:8525 with SMTP id
 n13-20020a170902d2cd00b001cc5ac38525mr9385476plc.18.1698898354176; 
 Wed, 01 Nov 2023 21:12:34 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a1709028f8500b001c63429fa89sm2019360plo.247.2023.11.01.21.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 21:12:33 -0700 (PDT)
Message-ID: <85bf076c-a329-4459-afb0-df83ccf643e2@linaro.org>
Date: Wed, 1 Nov 2023 21:12:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/33] target/arm: Use generic helper to show CPU model
 names
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-7-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-7-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 107OLuZfEIcg

On 11/1/23 17:24, Gavin Shan wrote:
> For target/arm, the registered CPU type name is always the combination
> of the CPU model name and suffix. Use cpu_model_from_type() to show the
> CPU model names. In arm_cpu_list_entry(), @name is renamed to @model
> since it points to CPU model name instead of CPU type name.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/arm/arm-qmp-cmds.c |  6 ++----
>   target/arm/helper.c       | 12 +++++-------
>   2 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
> index b53d5efe13..c8c712a2c6 100644
> --- a/target/arm/arm-qmp-cmds.c
> +++ b/target/arm/arm-qmp-cmds.c
> @@ -233,12 +233,10 @@ static void arm_cpu_add_definition(gpointer data, gpointer user_data)
>       ObjectClass *oc = data;
>       CpuDefinitionInfoList **cpu_list = user_data;
>       CpuDefinitionInfo *info;
> -    const char *typename;
> +    const char *typename = object_class_get_name(oc);
>   
> -    typename = object_class_get_name(oc);
>       info = g_malloc0(sizeof(*info));
> -    info->name = g_strndup(typename,
> -                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
> +    info->name = cpu_model_from_type(typename);
>       info->q_typename = g_strdup(typename);
>   
>       QAPI_LIST_PREPEND(*cpu_list, info);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5dc0d20a84..baf4b104ef 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9436,17 +9436,15 @@ static void arm_cpu_list_entry(gpointer data, gpointer user_data)
>   {
>       ObjectClass *oc = data;
>       CPUClass *cc = CPU_CLASS(oc);
> -    const char *typename;
> -    char *name;
> +    const char *typename = object_class_get_name(oc);
> +    char *model = cpu_model_from_type(typename);
>   
> -    typename = object_class_get_name(oc);
> -    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
>       if (cc->deprecation_note) {
> -        qemu_printf("  %s (deprecated)\n", name);
> +        qemu_printf("  %s (deprecated)\n", model);
>       } else {
> -        qemu_printf("  %s\n", name);
> +        qemu_printf("  %s\n", model);
>       }
> -    g_free(name);
> +    g_free(model);
>   }

Rather than adjust this target by target, I think you can create one single cpu_list 
function out to cpu-common.c using TYPE_CPU, not even CPU_RESOLVING_TYPE.  All of the 
target-specific code could go away.


r~
>   
>   void arm_cpu_list(void)

