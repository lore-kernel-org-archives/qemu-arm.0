Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp753841ejf;
        Fri, 23 Feb 2024 10:54:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4goEy+SQ+T/U7fUikfy41E8sCH5igdx+c1tc42dzaZ5HBPES+3DMgLc1t6vjjRMmpSe8D0l3DjVp13J1Z3G7Uro5dWbtf
X-Google-Smtp-Source: AGHT+IGDXUsyP8CM/VufckHlokogn9ehRNmnnk4hGP+nbWtnTp8Np+SxG6x7Oejy7WymwBk2D9hJ
X-Received: by 2002:ac8:7d41:0:b0:42e:69c5:13f with SMTP id h1-20020ac87d41000000b0042e69c5013fmr79149qtb.9.1708714463726;
        Fri, 23 Feb 2024 10:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708714463; cv=none;
        d=google.com; s=arc-20160816;
        b=wJDjziCEuZGwpZ8QaDgAlSdUg+4xMp+uiy+lBFoZvq4iOppXfF0RHToBkWnXqtEhMS
         oDvfb4wQrWR1RZpXLLE7nwBlmZBJF+hevNA6LDAq7ets5BU8Xk/vStni5u7+KEMkPiWl
         M7q3IPVFIOcKJXWi6Na5ShWuft/1yNyLvB2rYhNdXbKe7dN9dE5NodxrYQb+VrC5vXuj
         moutHnQUINS048uHx+lC+yHMx48AyHdaw0uzaPSNm3ThPBXabJD9cmp+MOa3/dDZT5L/
         6r01sVj0aN81JmgxQuAz4Kp+3It6Gmu7Zs5ocVmzzF+W1QVVwMfOxsG1eb70VuWAcQVq
         LJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=i39Kk/8J/M2+6LqMq2m1OohHbPuQZnKxxD342gpAOdg=;
        fh=Bu9Uvii5v75+ULZrl46yQuHcLkdY1oyC5jtoi63g3SI=;
        b=WHvAPGJeowO8q86jkcT19s+iGpg3Cxe6lbp9t6mcwT/luj9MTcSz6UOoPzyCvF7gS6
         M5rOINfUnIDiRvzSxV/lKU6xl1pgfhaE2QXSiCh/M8Ecf/EaLRLsvcR6XZS67CPHbbpO
         5c5ZTT8fVYl1FQBo+MuHIJVMZwI3ok54o07/E7NIKw7S1CN6hfElDSmFkgdVQH8/s2X7
         n9Rprf9m0LmmhJfj4sIuEa7MruhbrOoyK2MGVIW10EuHgXYHNJlgETT9PorXPyNUUGid
         57q4Y5IdoF0JQKtzP2/kewhMUz50swsA5tnR/iZwFjN5z7capyAS7mp42rykP3NP9zs1
         T5rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2Adqvr+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21-20020ac87f95000000b0042e520d65e8si3773270qtj.518.2024.02.23.10.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 10:54:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2Adqvr+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdafp-00083C-Kr; Fri, 23 Feb 2024 13:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdaST-00016s-3w
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 13:39:41 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdaSQ-0005PR-68
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 13:39:39 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6e457fab0e2so879010b3a.0
 for <qemu-devel@nongnu.org>; Fri, 23 Feb 2024 10:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708713574; x=1709318374; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i39Kk/8J/M2+6LqMq2m1OohHbPuQZnKxxD342gpAOdg=;
 b=Y2Adqvr+wEaWbMhZXMZirel+Q2pLjczkI7B3NqcnZnIP9YpNpbV8ptXeYe+XqD92bO
 gKGTw5Wc67JaDdij9ysmAx6ekJ93Ncsm/TysbTpPwYGJqgzv1n3UWY2gfl+o/SsZX04N
 /rPYagpGuJxT+viFRHIKfl343QECPC8/uUmSIb4KMRUnhpjEd413wzMzJx0FzxeyH7Xu
 6FxT/RKEQGkrvV+dNCKBOPyx0WQNzreZSuGSigJXIlTS3MTDd5PjXEQFKH7L273zikuw
 xwDJPqqT8gGCM1QVmD9zglkZMdIqzOyBGoI/cEehPd68PZeLGfzIt6uEB4dXKxEvJS93
 ANSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708713574; x=1709318374;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i39Kk/8J/M2+6LqMq2m1OohHbPuQZnKxxD342gpAOdg=;
 b=Xawe7Pn82tnzt+4TsHiOvQchLZrrQdAK4ccT9AlTHz1yr5xq+zgxkxl5MBK/SPDxOn
 ReAjU1zVele0jboPPPxjhdafnojpgHNft2lN6idwbKIzS6hHwmDPExZS+SlrAkaKiEm5
 2XLPFO7T0wRymDGTW6160UtgLu7n92KBEb3fwcZtuRuZei/EVvCLiBcUcwXaRQ0T6Zsf
 H8SJiHy9Y2JHeA7Td9FK0q3E/ZyReCbMeV2ogix5C7m5CgJxuWNCS2IhBjlRapNzm1tG
 Ke8n3iO7S5oEinZwgBfDq3AWP+xvkqf/9/nRX8ID0gxoC9v8JtooPqrlTvu1GIqTk3zJ
 uARA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWekaCpWoiLttG3tBLk3Cax08Ed4MErqhnd+d4C12MdDvrYH+7rFYD32cVvSe6bK6cW3DNZBayvvAqK6pFkERI2H2Lm7dE=
X-Gm-Message-State: AOJu0Yw+4jo+sjKrm5Dl91d/geaxCx9199x9XW/0fu+rx2n2nf7clELb
 EZADgmcbfttDuCdQZS4hg4DNR03MYFjvRAgLK0xjlFyhzehPXuFnEGM9qbcoHCY=
X-Received: by 2002:a05:6a00:3cd5:b0:6e4:c592:deaa with SMTP id
 ln21-20020a056a003cd500b006e4c592deaamr637651pfb.11.1708713573979; 
 Fri, 23 Feb 2024 10:39:33 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 b14-20020aa7870e000000b006e3dbec4e7esm11986302pfo.19.2024.02.23.10.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 10:39:33 -0800 (PST)
Message-ID: <40f9ea46-9351-42b4-bf70-4713fb476b44@linaro.org>
Date: Fri, 23 Feb 2024 08:39:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 02/21] target/arm: Add PSTATE.ALLINT
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-3-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xz1TE+cl6/AD

On 2/23/24 00:32, Jinjie Ruan via wrote:
> The ALLINT bit in PSTATE is used to mask all IRQ or FIQ interrupts.
> 
> Place this in its own field within ENV, as that will
> make it easier to handle ALLINT set/clear.
> 
> With the change to pstate_read/write, exception entry
> and return are automatically handled.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v3:
> - Remove ALLINT dump in aarch64_cpu_dump_state().
> - Update the commit message.
> ---
>   target/arm/cpu.h | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 63f31e0d98..f9646dbbfb 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -224,6 +224,7 @@ typedef struct CPUArchState {
>        *    semantics as for AArch32, as described in the comments on each field)
>        *  nRW (also known as M[4]) is kept, inverted, in env->aarch64
>        *  DAIF (exception masks) are kept in env->daif
> +     *  ALLINT (all IRQ or FIQ interrupts masks) are kept in env->allint
>        *  BTYPE is kept in env->btype
>        *  SM and ZA are kept in env->svcr
>        *  all other bits are stored in their correct places in env->pstate
> @@ -261,6 +262,7 @@ typedef struct CPUArchState {
>       uint32_t btype;  /* BTI branch type.  spsr[11:10].  */
>       uint64_t daif; /* exception masks, in the bits they are in PSTATE */
>       uint64_t svcr; /* PSTATE.{SM,ZA} in the bits they are in SVCR */
> +    uint64_t allint; /* All IRQ or FIQ interrupt mask, in the bit in PSTATE */
>   

I still think you should keep this bit in env->pstate.


r~
