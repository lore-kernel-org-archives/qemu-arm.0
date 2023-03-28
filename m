Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2820831ejb;
        Tue, 28 Mar 2023 10:26:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350YzLUxuKMUt/NFay8T5BIW/7i0J35TjreX0cKTTOpaDWannj9PtSNBZ9V+FvrXbzcwPP6H/
X-Received: by 2002:a05:6214:2385:b0:5df:44ed:b85 with SMTP id fw5-20020a056214238500b005df44ed0b85mr4759285qvb.3.1680024362132;
        Tue, 28 Mar 2023 10:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680024362; cv=none;
        d=google.com; s=arc-20160816;
        b=t0r8qIrHh4tnse+FaszdeFJ1Ix9LogHb/YwtbWozMaqQ5F00CiZ+wcq+rapINoOhfS
         t/XtUIubO7yoG8+2FnwgQXhHOuCI6CpDIK7vQaIe7IQFjCM8x0D750me+HszhTFnlMAR
         34ehrrJt4TCNErzAz6AdH3yKXX9iiK1/8E4Ma+7C8CCgRrDrGSnq92n5oLV9x18rMG6U
         PuBuPw+70uHEN6znIF+YTtqGFvdS4SKFK+ZzBd+4Q9rZb4ERgQCxX8f/yNnrR/xgBu0Y
         smV3uRHYz9LnuMKX9ACnF3qLb5trZRUC3xPB1S8JnJtIxw8ZTjjtYqm/3gLKlKBopWhY
         uJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=C0+HFPKP/OUeqWjwHBiPcSbOPtd80c8Y0RyMRoEOTiM=;
        b=BmERHDuA6Dyh50Tb3iUWZ80Wc1iLYDoG8Smghu6hlamaiiXXY9XGLcuw7i9KpwePNH
         dvqYeLTAyi1Ffwy8vD5h57gWklM851v0l+NbHCRF6/5K5zVYW5InTaOy4huJKIrAUXAc
         2qmJcwP/OGW2y4+1mw2gPJ0DVdTFsmG+rQtJpv4qK2QNyVsrk8iyyOxan5SgVYUnPmS4
         cZyTC7KXPBbbYIMPNdsA8Ad8C0aT9CvYPWuo/daRSWBjYkNAPGgyPODQJ1mNtxmk6vnY
         NyMPUGpHPLGGEos9i2s656a5GdFcUA1/oNjqq5AngnOVewcE3ZsyoH9YrV8oeF1RuGp9
         C0Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vTvjvCFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a0cc3d2000000b0056eb4a9abcesi19868001qvi.371.2023.03.28.10.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 10:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vTvjvCFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phD54-0002LL-Dz; Tue, 28 Mar 2023 13:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phD52-0002Kv-3k
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 13:25:56 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phD50-0000pb-F7
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 13:25:55 -0400
Received: by mail-pl1-x629.google.com with SMTP id o2so12390174plg.4
 for <qemu-arm@nongnu.org>; Tue, 28 Mar 2023 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680024352;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C0+HFPKP/OUeqWjwHBiPcSbOPtd80c8Y0RyMRoEOTiM=;
 b=vTvjvCFLfUtZ832bO4Z41SwgstudP/lvgcs1R3+6YRj3pUIvbp2KcSebaLCUDrgXVg
 ABnz88XI/uu97cTvORBYHPEKyV1ryPKIBqdoGQVgN7roOzZcKIOn3R/3to0lqLSpznv3
 TCPwuaIgp8x/KbY1opkmQR9cAlqFP2gDxdLEFIG0GmFiCX6yRy8xZFVwPQxPxpOZH64A
 nzjcP0o88lW0rXtrvHlpSId7vhP/d657FUOH0UhY5BPeiqeDg5asFSL/OLqzRtTgZ25L
 ivObvMksAWTFtNFWD+ZU5VBZx3st160311M8MCMlPxedrdHwiSoQDpfx6/vipeA1ZNQ6
 Atlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024352;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C0+HFPKP/OUeqWjwHBiPcSbOPtd80c8Y0RyMRoEOTiM=;
 b=NL0YyAD3xC/EOW5DRkTEWu1ZaOwMp7G+Pappsv7luHQh5JrJBEwlTfbNlSeT+ZURR/
 l1vyUJdDoHo5lmYr4Wi3esVM/G3oZ4bNIR0s5kN030Fuj1E6hz71dmYIDMVh09U4+ccf
 xCEmLAjgpKpNvJ4JWmOd1vVSvGLaAA0TAFhZDchuMJlvC0CaFolI0HOc7q9cJZFGFVgG
 VMw2/7DSKUwlEm8ehKy0jzx0fHovgutbal9CkS2Cw8a7WAqDvyRqcP0TroNDlGGI2ta8
 NtPQ5M5poyhwzwFQS8MO49eHK+bGKLYdO/a0adf1LoPanh/rdflA2HaZZlbGCpsrVR1q
 5AXw==
X-Gm-Message-State: AO0yUKXw+2T1wSgBjViW8Ec9+KT0M3a9D6SeUnlFpxBokkkM4a03bWBl
 QnZpjc5FHCaeG2SMd7i0kaggCQ==
X-Received: by 2002:a05:6a20:1790:b0:db:ae75:c70e with SMTP id
 bl16-20020a056a20179000b000dbae75c70emr14832391pzb.15.1680024352525; 
 Tue, 28 Mar 2023 10:25:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 j1-20020aa78d01000000b006260526cf0csm21253519pfe.116.2023.03.28.10.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 10:25:52 -0700 (PDT)
Message-ID: <5884a90d-20da-6634-5f1b-cb0a4911cb90@linaro.org>
Date: Tue, 28 Mar 2023 10:25:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230328162814.2190220-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328162814.2190220-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CLD0G8sIZKsQ

On 3/28/23 09:28, Peter Maydell wrote:
> In commit 049edada we added some code to handle HSTR_EL2 traps, which
> we did as an inline "conditionally branch over a
> gen_exception_insn()".  Unfortunately this fails to take account of
> the fact that gen_exception_insn() will set s->base.is_jmp to
> DISAS_NORETURN.  That means that at the end of the TB we won't
> generate the necessary code to handle the "branched over the trap and
> continued normal execution" codepath.  The result is that the TCG
> main loop thinks that we stopped execution of the TB due to a
> situation that only happens when icount is enabled, and hits an
> assertion.
> 
> Note that this only happens for cpreg reads; writes will call
> gen_lookup_tb() which generates a valid end-of-TB.
> 
> Fixes: 049edada ("target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1551
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> saving and restoring is_jmp around the call seems super
> clunky -- is there a better way ? I think mostly we avoid
> this by not doing conditional exception-generation in
> inline TCG code...
> ---
>   target/arm/tcg/translate.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

You could also do

     /* Branch over conditional exception: continue. */
     if (s->base.is_jmp == DISAS_NORETURN) {
         s->base.is_jmp = DISAS_NEXT;
     }

within set_disas_label.  Any other is_jmp value will be preserved to exit the TB "normally".

This is similar to hppa nullify_end().  For a moment I thought we already had something 
similar for arm conditional illegal insns, but I see those handled via code at the end of 
arm_tr_tb_stop.


r~
