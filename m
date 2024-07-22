Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2161282njc;
        Mon, 22 Jul 2024 15:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1jUmNDho8ou5Uv3ht5y0gRTsS6c3hUlbWB/d6hETckGoIPsdQqAe4IqYidKWyuYbA9+ZDMCfFy6eOcfQyvSwTc+t5EMvy
X-Google-Smtp-Source: AGHT+IFEwLPqhVqtw2PDkeLTEXNrMlN4z4DJtIxr15nY7z57zHs5Fkk2oOPYto8Gs+MaFx3biUcE
X-Received: by 2002:a05:6214:300f:b0:6b0:8b6b:2074 with SMTP id 6a1803df08f44-6b95a5dab52mr85163326d6.13.1721685693966;
        Mon, 22 Jul 2024 15:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721685693; cv=none;
        d=google.com; s=arc-20160816;
        b=JcER2fjjd0BEQq98g84D/dtsj4MMakCEG29Kn8rZ8UJI9lEp1JonXyc1wvKPLk2aVV
         /ZzJrLrd1S2APzOrXOeZviSojxlf+C908m0RLAihWSw9DhBFVnfRqFE03zrpZSWwAfMs
         9hbfoviMFyFipxrZTXdg/OomKiwbPul/GzgQ9yZ1YfzSAV9Uut+2P/w7XVpI2uV5JJdQ
         PsdnlOX/lKCiFH3qPf6Y0gMDIVxz/4nx5n9DAlc92T3uBpka64CSJLCOfG2PXFS8tsWt
         LxzbtYRn4ncV0GQcFam1tGaT4r4f5FgCYMF2/72NLLWVxv1yscMWVXJTVDKUQ40zi/ud
         DSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0LAhdNu9e+7XBMJ1h9ByXqlJY0xiouNYvjQirplFstA=;
        fh=jv+nX6AkmoOfmpfy1IdxSd7UWa5Su0cEEG3wbuhvBX0=;
        b=LAULi/H2YfDiIB5BeFNUnnMxyb1m+BSVYYSbtLRCgB314z2FPMgUDlOjN/ymWjEtct
         ODyv3LdoAD8T5PdWMyBsZOvNKZ6bTuVdnHjQ5FHKuCzVlT4c6jaM6kCOhFeuNbxkqhLS
         e7TZ64PYCeSPYce96qdcKPJGqR2Wl40UBfW5B+zzmn3AREXEpsKfRbQC7Nvkf6usXdQt
         IUaz/fe6suXW5Qt4yqloGSTSFHpfVM4nzN7oafTR7+rRbqGJzU58Z+2JcrWYr4BsnGcK
         l5gSLaSjuth4P7kLHEnL92JAdw0OYATKsh+eKD65pxn6UhOtBtE0Xz3YLmvhw4m2CYr9
         tS+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eeUltH/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdba08fsi87792121cf.269.2024.07.22.15.01.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 15:01:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eeUltH/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW15y-00029v-Hw; Mon, 22 Jul 2024 18:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sW15u-0001sB-7Q
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 18:01:25 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sW15r-00083q-B4
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 18:01:21 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso35968115e9.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 15:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721685676; x=1722290476; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0LAhdNu9e+7XBMJ1h9ByXqlJY0xiouNYvjQirplFstA=;
 b=eeUltH/iABupljZ80iRaENy1AKQcE1Kapsjw3j/8AaER+sMl8jiFX2RBVDl+j6JNyy
 AWEJVhXyiJPL3qSYWqadJlBWzaNDSTnDHqQTHLYOFPemukkqX9QdinK+4lIUb3QbJV+C
 9jqkGY/NwuXShbIsNuL4RATIhTunjgJbSPU1MMrfoDXeeLzf0sexvqI3QD/yFqJZBmql
 foMQHXT6wqEqFxcX6E4VFQSwdq0kik7Mqtr4p5y0KGL4euNwGXXqy4aZDk5CFpHX+MLR
 ZJgVho4j1nP/0y/sLpLanzTh7uuTrxTukBNZ/56lB1aqIND5x09kO9GGx5pJCkib89JS
 rRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721685676; x=1722290476;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LAhdNu9e+7XBMJ1h9ByXqlJY0xiouNYvjQirplFstA=;
 b=ZSXqePJxPflJRJ6jPsy4AReTcATikzPjFbP5SBrThtQwRzfq9RgGDITYtJMQTCjUPx
 sA1VUf8RSN90B47ahFsXtAsloIUY36qyA7qMggnynCmfsAo8L0VOB9/jB+jC/gCvzPbJ
 tmEUPn85phdT4Pb80msWfUmJCrm/W8YX2JSojoUexUZZyhcNIISoA6r8e74l9uWXocUF
 6viUDW5Dcu6INlzQG+T9MlMP9EnIPh0UzXhTp5VbDYUakKaJ//+eIKUWjRQDTrQZJ3Jn
 sWXELkrBofC6ifmyQsQURDQpMXWl3R1qz4414MgpeW6ZBL6gs806krZKxXY7yD1bpVVe
 xVTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6hoYzZYFd0ovGKFuVFLDUTF53nyYOJOEpQ/VkW25vXuJ4HJCVG9pNjWJPEd+F+3gQp7d+IrSVQEvE3OhqCOIbT8sH
X-Gm-Message-State: AOJu0YxFHlzXTZZp/SBhltE/rqndUljFTtzI9+BF5L/INPWnYcg5zYoP
 JYQ30GoZAaeC0SQ4eEdVZANu+i7oiJHM5E82H/LvrpoOHZGRSEp8Y0K5KyHHW/U=
X-Received: by 2002:a05:600c:1d18:b0:426:67f0:b4fa with SMTP id
 5b1f17b1804b1-427dc51a013mr50523355e9.1.1721685676167; 
 Mon, 22 Jul 2024 15:01:16 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d69019a5sm142440515e9.18.2024.07.22.15.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 15:01:15 -0700 (PDT)
Message-ID: <97219e8c-e210-4108-9873-abe2a933a3f1@linaro.org>
Date: Tue, 23 Jul 2024 00:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] bsd-user: Make compile for non-linux user-mode stuff
To: Gustavo Romero <gustavo.romero@linaro.org>, Warner Losh <imp@bsdimp.com>, 
 qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-14-imp@bsdimp.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240722214313.89503-14-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q+oZ7T+eSKfo

Hi Warner,

On 22/7/24 23:43, Warner Losh wrote:
> We include the files that define PR_MTE_TCF_SHIFT only on Linux, but use
> them unconditionally. Restrict its use to Linux-only.

We should check that in meson, i.e.:

config_host_data.set('CONFIG_PRCTL_PR_MTE_TCF_SHIFT',
                      cc.has_header_symbol('sys/prctl.h', 
'PR_MTE_TCF_SHIFT'))

(like we do for CONFIG_PRCTL_PR_SET_TIMERSLACK), then rework
linux-user/aarch64/mte_user_helper.h (and possibly
tests/tcg/aarch64/mte.h), moving in a common directory.

That said, your patch matches this file header:

   #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
   #include <sys/prctl.h>
   #include "mte_user_helper.h"
   #endif

Even if this #ifdef'ry is ugly, it isn't wrong, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

¯\_(ツ)_/¯

> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   target/arm/gdbstub64.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 2e2bc2700b8..6dc81aecb2a 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -404,6 +404,7 @@ int aarch64_gdb_get_tag_ctl_reg(CPUState *cs, GByteArray *buf, int reg)
>   
>   int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
>   {
> +#if defined(CONFIG_LINUX)
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
>   
> @@ -425,6 +426,9 @@ int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
>       arm_set_mte_tcf0(env, tcf);
>   
>       return 1;
> +#else
> +    return 0;
> +#endif
>   }
>   
>   static void handle_q_memtag(GArray *params, void *user_ctx)

