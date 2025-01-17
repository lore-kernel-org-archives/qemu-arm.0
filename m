Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp4377419njn;
        Fri, 17 Jan 2025 04:40:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSB3IBpOrV8fBGHM7XofvPs/6Iqsoo9r/Ih8QMs8UBPIs+lBHXoXvO2yK0sKmM06koRc4SQis6AYrnGw==@linaro.org
X-Google-Smtp-Source: AGHT+IHWUABO96Cs+5Z7HLGIdWT8wLtbQeNlR/BAK5g7X8fSbtz5JddMNjXPLSWxLF7I+hXo4RSR
X-Received: by 2002:ac8:5a55:0:b0:466:b287:78a with SMTP id d75a77b69052e-46e12a1e35fmr36389391cf.3.1737117638254;
        Fri, 17 Jan 2025 04:40:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737117638; cv=none;
        d=google.com; s=arc-20240605;
        b=Odkt7RfV7JIUg43afgxK1WJch5HeL8J4bQ7hLdw3uzg/cXk4hiu1ocyZG2VANYDADl
         XNtbklFE4XthXykBtjEJ8X7+b2CkdSSokJMdcJsrf6TLecop0ufYpsWIzVGSVRK2D0yx
         ktOYz0irNTMgXCAqpoSgo7pN0gSzxZFL+dtdY6sE6kaeFdYjiTcfKiSizYdrf0zfH6Ej
         TlKUOaJFdtl9BuoE3bauWzkIfrRrpJfqeqW+yD+XHyicgtUzSOA/gm8ErGF3VLPm5UYu
         4rKC0w14CFyG3pfLOOl3AlCXpk/Y/1Wj6UPNZh4ddJbjhNywJ6Ba+6obTmEPb6CIrFmp
         J6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+h3KeTQFTuj6hD+7yCDC+cNM9Zms608OSpSuV8VXXAo=;
        fh=yGVHofnlsOT415/KidB/nhVokfmKCDt1y1RQ+ZrujYo=;
        b=de9lDlLXLNHuWJKWOSrIhVgGmGg2wYiuBjCiHbXjIYK6ha+mq0P3er6iHiuuHKJKYJ
         HRB4HelEeWcknJfrcvW1TWEbybu4OXNzkSdl1Ra9ZfQsHWEpJCNle1slZVX7TjNah/8v
         B4+9MLNNKef7SbEJTgN744Py/XgxgBA+JfO9r3SZtNWhHwlRHFy8KNYJMEoJo0aV8cR2
         z1Kbi/wu67Yo7d0wJ0rzFADgle7MXk2jG/MLyeA+EBqpeZV/qSJUnRDQsRhpd637pn/C
         v3RW2GxpYM2WnesiJxWRedOPVyRfovsEndqz81bRn95gFhQUFcuDozWSKP85WCyNu4FD
         wopw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=YdQIb+pc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e1030727esi23410521cf.200.2025.01.17.04.40.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2025 04:40:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=YdQIb+pc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYldx-0002Z1-Hi; Fri, 17 Jan 2025 07:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tYldu-0002Wk-Ik
 for qemu-arm@nongnu.org; Fri, 17 Jan 2025 07:40:06 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tYldo-0007xS-26
 for qemu-arm@nongnu.org; Fri, 17 Jan 2025 07:40:05 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2166651f752so47150585ad.3
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2025 04:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737117597; x=1737722397; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+h3KeTQFTuj6hD+7yCDC+cNM9Zms608OSpSuV8VXXAo=;
 b=YdQIb+pczylj4nKV5TkPF7rXYRn3XXeNQmxxOnQRYZubrr3CHjZdu0+RXpoxG0+Re+
 M1SaBo9w8BwZlbviASpfJW28sAA5WFumy3xfY7+JJ4LKqfN0JQlVvZOqTXM99f96NxoX
 evrgwluYwnyV+jbx775/HV/k2BJEgoLMyDr/mB42aT5MI7/bfQ7p4E1VQRV3xCbNTgl2
 A+yj6TzFcRi+/7/2ip922io4SFCVAah5oliFxh+KSoGVDUiFx/jsI+u4YQdc49ZpFb+I
 cij3/Q2hNauVxIsArVwbIwGc4Q0ZUZhShQiaW1EX6LlXIwwA5S2Djj3J/vK/5/cMYOrU
 hQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737117597; x=1737722397;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+h3KeTQFTuj6hD+7yCDC+cNM9Zms608OSpSuV8VXXAo=;
 b=copju4R6tQ1BZru1koNxpu9OqON9kGvLusKQI8Ngj8IAw9wB+K/vmIMvWNOZKnk24p
 HzpBDYCoV/mvo/ucM3vCPnh9yJ6li8RgaK8wYnNfZMZmhFnymFQA6K4VgS09WpiFag3O
 2Fbu+axPSqwY9XZJqkRUfmjXQRmA5bhWLuqwMqqdEFEIvsFNONg37ffjjScn6NtMjQWH
 qU2SogQkTefL6IlfBa6JHsADqzK3YVFZj/JNlR9MZMg1tNSGS0W8YjROe2GwmUjzQla0
 oNsaFbtNj0j+fCfoVSU9lRzrboDEN+4r09jvMN6doPChaXdc3CWfB0FhKcrjhn122Bs4
 fXgw==
X-Gm-Message-State: AOJu0YxYCNKU7EKEzq4mt4oilHXpegwMuP0ocixhlfK/+SY+LW4IKFPg
 4NaZhFkYfxWqsZ6Kjo+1QAva+QVwl7IxK1ZFh98m9+P8ZCq/aeD06M0gy5BDNVs=
X-Gm-Gg: ASbGncu/MX3bkd4ygDrw07sKm4SqoD3tJMD72IYiw4JlZFIgBoDS3Cx102qG5syrjij
 gQF5P/0lV5QQwOYVTOxHwmVcIcEBXaEJyiilz3IwTL5ebBlEL8a1D6G2hE3kYyaQmmB9L2hMOct
 k/IZgJoFb+vBhqp9OteoNxwwTmGFbUFzjTkAH5Nmu4wM2hITjKxuIXFdT2o5pbTdtVUPisCG96X
 nq2OtUpaY3Rq3Cet4MnZWqFUZ3t1Q27V6cSmvKqFL214/3MMP+3NOXe/uupt0YfiE2wD+U=
X-Received: by 2002:a05:6a00:a09:b0:72d:80da:aff with SMTP id
 d2e1a72fcca58-72daf9c1dfcmr3864193b3a.9.1737117597395; 
 Fri, 17 Jan 2025 04:39:57 -0800 (PST)
Received: from [192.168.68.110] ([191.202.238.10])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab7f3025sm1809732b3a.12.2025.01.17.04.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2025 04:39:56 -0800 (PST)
Message-ID: <c5c83e85-6c5b-4d70-be82-06eed6e63bc5@ventanamicro.com>
Date: Fri, 17 Jan 2025 09:39:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] cpus: Introduce const_cpu_env() and
 const_env_archcpu()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250116230435.87580-1-philmd@linaro.org>
 <20250116230435.87580-2-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250116230435.87580-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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
X-TUID: s627+hDoqJ87



On 1/16/25 8:04 PM, Philippe Mathieu-Daudé wrote:
> const_cpu_env() is similar to cpu_env() but return a const
> CPU 'env' state.
> Same for const_env_archcpu() w.r.t. env_archcpu().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu-common.h | 5 +++++
>   include/hw/core/cpu.h     | 6 ++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index b1d76d69850..f765e97a973 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -250,6 +250,11 @@ static inline ArchCPU *env_archcpu(CPUArchState *env)
>       return (void *)env - sizeof(CPUState);
>   }
>   
> +static inline const ArchCPU *const_env_archcpu(const CPUArchState *env)
> +{
> +    return (const void *)env - sizeof(CPUState);
> +}
> +

Can't we get away with something like:
  
+static inline const ArchCPU *const_env_archcpu(CPUArchState *env)
+{
+    return env_archcpu(env);
+}
+
  

We're just adding a 'const' to a pointer that env_archcpu() already retrieves,
so might as well use env_archcpu(). The 'const' will be added by the compiler.
This code builds without warnings in gcc and clang in my env (Fedora 41).

If we want to be a bit more explicit I suggest:

+static inline const ArchCPU *const_env_archcpu(CPUArchState *env)
+{
+    return (const ArchCPU *)env_archcpu(env);
+}
+

Same observation with const_cpu_env() and cpu_env(). Thanks,


Daniel

>   /**
>    * env_cpu_const(env)
>    * @env: The architecture environment
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index c3ca0babcb3..ecb31221b26 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -588,6 +588,12 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
>       return (CPUArchState *)(cpu + 1);
>   }
>   
> +static inline const CPUArchState *const_cpu_env(const CPUState *cpu)
> +{
> +    /* We validate that CPUArchState follows CPUState in cpu-all.h. */
> +    return (const CPUArchState *)(cpu + 1);
> +}
> +
>   typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
>   extern CPUTailQ cpus_queue;
>   

