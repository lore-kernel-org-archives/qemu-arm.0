Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1494394lfq;
        Thu, 17 Dec 2020 09:26:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyuhUlH40x1TrPR4jhlyvsOWvSciFGkA0CREA6ao+52CwJZrzZi9+QecctZW9Gy0b+hK1T
X-Received: by 2002:a25:3290:: with SMTP id y138mr173247yby.485.1608226016092;
        Thu, 17 Dec 2020 09:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608226016; cv=none;
        d=google.com; s=arc-20160816;
        b=FZJ/4nHAUDvdjukfbZ+kokdpXUP0R2ROQw0E2l5lyz5YBMFjKym+QvVIqU5izUGlz8
         89MOPMTkfRcrgG8ICHHg5NQZy/owlAWGO6kvjFSMfww37OOzs4E2MMbF3EPhNqA3oTko
         sykWJfH2ZAif65y/tihybtG0GzIRy0CVfwMyOJKliZPAtZFcFzq2Ma/1NvO4EdJMT0Ie
         ps8LdUo+WPpdJYsAPLov21r2ikfu2mpf5PvgMppstXcQDZjetR9S47lS7nWVo/NN6Il/
         rRudXKf8EAfheVxuqdQvdKcQ7z7dHHV9DboYctdJiM/uF/O3+JsEnCRyAi3BsfdGoAdD
         exTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pk8pZlSDtOlQHyoU32LLSVOGAqbZDAz9MqpHi2igKTg=;
        b=yVqXgiyl8wxM+Fp6XGcsFmuN4scQiudvOAgCfCvGq//8hU/8uM//ez+/DDN5VSuZ5G
         XCVc16QCh+KplHDjW9W4VBy0skrkymYqRT72ksPYMoQ46LlHE97a5Ep8/fA0iJRd1dIi
         FSRAei7yCcIcXHLrh/ttKldS7i7y00iqG1ZUsPUJhU3+Z7WB4iYp23JdTZbcAyeJiWzu
         3eiiO+6X5fF5zSychLVjAUqzo5nOzUZPXwlOm0422cK3SpS1W+FMmxXKLFz0rmJ6Rl+R
         YgXq91NzjhjdTgKGFrFTq6oauB9FLpHsgdiDikR1qCEkzQMkRD2VNw/Ir/3LhIuQktHN
         +icw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GivMsj2r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si4717873ybl.209.2020.12.17.09.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Dec 2020 09:26:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GivMsj2r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpx3H-0003OX-Eg
	for alex.bennee@linaro.org; Thu, 17 Dec 2020 12:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpx0a-0000fK-3g
 for qemu-arm@nongnu.org; Thu, 17 Dec 2020 12:24:08 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:40109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpx0Y-0007OC-8O
 for qemu-arm@nongnu.org; Thu, 17 Dec 2020 12:24:07 -0500
Received: by mail-oi1-x230.google.com with SMTP id p126so33016177oif.7
 for <qemu-arm@nongnu.org>; Thu, 17 Dec 2020 09:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pk8pZlSDtOlQHyoU32LLSVOGAqbZDAz9MqpHi2igKTg=;
 b=GivMsj2rh7Sscp74kWIpcs5y3Vy+G9tMe5NMDqxutHUSn+BmU1uL9Nrn/pUpVefRV0
 9RPm4iOZMqTVd8Gue/inUmgnTfamvFCcFF92NlBA71U0Y4ClPZf4Wl5k2fM9SblvnDDM
 3hEMptu7HkgHcJJ5mlR2LXGsoZ1Pkq93DqDdlvNKdTgEjiqv6/9sxi0GgcWY92rPJamC
 UfOQpQ2KJp4a1nLeE5S5P1vA0ziPQ5AKoI2tx1ndSqaa65pbaf9C0osBF7P5VBl2WKxk
 ObQ7igJS0u3JphxFgF1bRzPQJKBuuOou5KOqB8Utw08JQM/d9+ByLnegxVI7vqK5p4r6
 sg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pk8pZlSDtOlQHyoU32LLSVOGAqbZDAz9MqpHi2igKTg=;
 b=kwEqvM9af/uvdQtgjRVz192n0BT7FmYgkFVo6ItEmRlur6ErMP7EE0ELkR9GOGhjmI
 5KqVV93nnMhkH61E7HKT+4wXmUQCaXS4sJRqMcFDQsNRIkqINp1MlpIYC9k2Vpkcyno/
 WG7FR/m3AjhJPPiUMfA7mdh8CXnOGz5GCNSSW0WvZ5yi1RtYr53/2H0WHbfO6Wnu0k6o
 BF5142M3dVWaUwANif/bLC00MKrCWvMiFgrMOVnz3NMVAo7O03A7w6BjOXfCfcfiNQvj
 RUqEsEz730jQHB5jHqcksaucAi1Gtyi56OYYMwN55CBSA2HYM3SQd9hCfKSvKYTSFwHN
 sfKg==
X-Gm-Message-State: AOAM531yLE3JnpfimRED3x/KdztgCV39gRCTpx7yQrGufSTRYHvNa2Hv
 hCWz1QSxT5EjtBH5PNhgXFi75g==
X-Received: by 2002:a54:400d:: with SMTP id x13mr95922oie.81.1608225844643;
 Thu, 17 Dec 2020 09:24:04 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q77sm1357441ooq.15.2020.12.17.09.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 09:24:04 -0800 (PST)
Subject: Re: [PATCH v2 10/17] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-11-richard.henderson@linaro.org>
 <CAFEAcA8fAB_DDrBjjVCCKwiE_n=05q1KYyWMR_2EuhOa0+EKww@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <817d21f6-6494-e7c7-5eca-037b04b64f9f@linaro.org>
Date: Thu, 17 Dec 2020 11:24:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8fAB_DDrBjjVCCKwiE_n=05q1KYyWMR_2EuhOa0+EKww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2QqB//feeus1

On 6/25/20 11:50 AM, Peter Maydell wrote:
> On Fri, 5 Jun 2020 at 05:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> These prctl fields are required for the function of MTE.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> This API doesn't seem to be in the upstream kernel yet, right?

It has finally landed in 5.10.
Thus the long delay since my last revision.

>> +                    /*
>> +                     * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
>> +                     * Note that the syscall values are consistent with hw.
>> +                     */
>> +                    env->cp15.sctlr_el[1] =
>> +                        deposit64(env->cp15.sctlr_el[1], 38, 2,
>> +                                  arg2 >> TARGET_PR_MTE_TCF_SHIFT);
> 
> This actually will be per-thread since each linux-user thread has
> its own CPU. You probably need to do something to make it be
> inherited across clone and fork, though (assuming those are
> the required semantics).

FWIW, these are a per-thread quantities.

>>From arch/arm64/kernel/mte.c:
> void mte_thread_switch(struct task_struct *next)
> {
>         if (!system_supports_mte())
>                 return;
> 
>         /* avoid expensive SCTLR_EL1 accesses if no change */
>         if (current->thread.sctlr_tcf0 != next->thread.sctlr_tcf0)
>                 update_sctlr_el1_tcf0(next->thread.sctlr_tcf0);
>         update_gcr_el1_excl(next->thread.gcr_user_incl);
> }

I don't think I have to do anything special wrt fork/clone, as env->cp15 will
get copied by our own cpu_copy().


r~
