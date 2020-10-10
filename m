Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3258099lfq;
        Sat, 10 Oct 2020 08:48:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeqckq4AKneHwAjzPiibbpIOuVpnockhQmTLGNbhIt5bjuTReyx5qr5dhEdxnbshikpyVB
X-Received: by 2002:a25:a85:: with SMTP id 127mr26875941ybk.143.1602344918808;
        Sat, 10 Oct 2020 08:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602344918; cv=none;
        d=google.com; s=arc-20160816;
        b=JxRfPWI8sVASTN/r4s4nC/kZ1Agol/1khqQcJudrNR74HkhB3uTWkGBh5JihWZ9uGD
         L3yjiLNWoD5HjqGrxN2GMXXH3bIOpABX4Ot8uDsDnvPU3txVM4WcFSqoBSP58vx+RSeQ
         RdRnKUn8i9iRsVcxIyTGOSWAfHjFEdIAg4U9cjY7ZOyKnskC1BnaNY7zP+A/wLEXdRt2
         vGzYvYgZSImf7fHEqBZXWh5WmdaLFziFmq7hDWOqsMuRlulF9wRzNj6I31ijH4TyoAR/
         YhsOewuxOcFHrjhaKzFS0Ml05v/cLGlWEoAUNxwFnzpeZIrOphxeBLEHszwGLOVHG3Vc
         dA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IWI9sjRTE1jG1BHCpT8kd4c5rhW2JIf5fL3oTCkKNkY=;
        b=R0Pco3MGSpEbihG5j9A4MdJ3E64ku5BfE+XkYx5jScKRs/BB4FqFrATx3xrC8ZESni
         TdBdFw0nOtPjkWXN9rf2n9rjhWGUXbajmqHzKqm1mVKPPhjgqSJ+kYatT/wgtm7Vn144
         gbA7cSAfAUrG0QzxdYGEUtU4wEzJjM1SbMsG4MJnImIPfxiUJ/lUYzcLVzLB8FbsiNHH
         jxZj6RmlFV8X32sSfOOT2CopQWpc9wkk9R/JGi37bf7y+HxKoIKhWTY19EQPrgVcYxH7
         Ehacd2/2M/WJlP3bR52T5EWYY5zDiPvcbt/bf60PYEKlYesLj0VS51fa/8SuP3hoMHHH
         nDwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eF+sr4TT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si11796631ybm.192.2020.10.10.08.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Oct 2020 08:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eF+sr4TT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRH6s-0005z7-6v
	for alex.bennee@linaro.org; Sat, 10 Oct 2020 11:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRH6S-0005yx-3J; Sat, 10 Oct 2020 11:48:12 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRH6Q-0001Tv-AT; Sat, 10 Oct 2020 11:48:11 -0400
Received: by mail-wm1-x343.google.com with SMTP id 13so12707771wmf.0;
 Sat, 10 Oct 2020 08:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IWI9sjRTE1jG1BHCpT8kd4c5rhW2JIf5fL3oTCkKNkY=;
 b=eF+sr4TTrzSQo06d0uF8ZEBpDkXALPS7GpIsyNtwLwG2cJVxOdHmQc17eSAnj4HcDt
 aHUrR0YIwa59H/cKYP69hnFzL+9Ie087GGPwd0mcvI+n7w1w2LcJTxvQBnGBy7AeRLUk
 mxnItT9nEY2sY2/MyBh1Jjnjxm8Hxg1qDR+tYSOx042uAxloSeLPStWrGOn9wmcm5r+b
 0PKjDKm62ZM1HuQiqR0JwCbZDeHR5xn0K3b6Uvw8oDdkdrHycVE8BvkQPGGeJn4D/uhF
 W1bAzpHdoUD7g4MCi3m2/aWR5ZqieEcvdo5FsZRXLk7MMPOldp3dJy+Pn3/fo0/oPxR4
 Crqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IWI9sjRTE1jG1BHCpT8kd4c5rhW2JIf5fL3oTCkKNkY=;
 b=DvZOBWLmdN2R7R0mYyfsaerVW7zvV7CI651N1J3nHX4Bt5HUHIvV3yiTp1sxnNE2mA
 5XXujRov+rcThb96OU4+0FlHTF7gZOFiS7e+dP9GIH7r2/oqOmyjCbqqnISOeywsgobY
 eqqwaP9CvnTq1BMUEm3ZAW7uWeh3ZFkfwCH189Fttgdk5mOazUP9ZOA7TV7PRRzT23oP
 lf//RdXzc1iQnF7h6/XbELBLJJf40/FfFftNNZhm+WdDcvNCLg5C7L+suDej/sMWreqJ
 CRSCIlRbHQrzbiIEzUhMlVf25JVVtCfrM9izbWXFOMuNV3A2yywaVrrUB/B3YClPwShN
 RdFw==
X-Gm-Message-State: AOAM531jcLyVToFyhEvRw0oMjg4G4zltS31HRMha47tOGJQ3/BgXlIBZ
 /PlZXXi7G+lvSp04Ofnx8l0=
X-Received: by 2002:a7b:c015:: with SMTP id c21mr3189603wmb.22.1602344888112; 
 Sat, 10 Oct 2020 08:48:08 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id f6sm2856596wru.50.2020.10.10.08.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 08:48:07 -0700 (PDT)
Subject: Re: [PATCH v3 02/15] hw/core/clock: trace clock values in Hz instead
 of ns
To: Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org
References: <20201010135759.437903-1-luc@lmichel.fr>
 <20201010135759.437903-3-luc@lmichel.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <46c493aa-5aa8-a518-5a67-2d0e04523470@amsat.org>
Date: Sat, 10 Oct 2020 17:48:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201010135759.437903-3-luc@lmichel.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.207,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mQnBnJh8Jc0n

On 10/10/20 3:57 PM, Luc Michel wrote:
> The nanosecond unit greatly limits the dynamic range we can display in
> clock value traces, for values in the order of 1GHz and more. The
> internal representation can go way beyond this value and it is quite
> common for today's clocks to be within those ranges.
> 
> For example, a frequency between 500MHz+ and 1GHz will be displayed as
> 1ns. Beyond 1GHz, it will show up as 0ns.
> 
> Replace nanosecond periods traces with frequencies in the Hz unit
> to have more dynamic range in the trace output.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> Signed-off-by: Luc Michel <luc@lmichel.fr>
> ---
>   hw/core/clock.c      | 6 +++---
>   hw/core/trace-events | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index 7066282f7b..81184734e0 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -37,12 +37,12 @@ void clock_clear_callback(Clock *clk)
>   bool clock_set(Clock *clk, uint64_t period)
>   {
>       if (clk->period == period) {
>           return false;
>       }
> -    trace_clock_set(CLOCK_PATH(clk), CLOCK_PERIOD_TO_NS(clk->period),
> -                    CLOCK_PERIOD_TO_NS(period));
> +    trace_clock_set(CLOCK_PATH(clk), CLOCK_PERIOD_TO_HZ(clk->period),
> +                    CLOCK_PERIOD_TO_HZ(period));
>       clk->period = period;
>   
>       return true;
>   }
>   
> @@ -52,11 +52,11 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
>   
>       QLIST_FOREACH(child, &clk->children, sibling) {
>           if (child->period != clk->period) {
>               child->period = clk->period;
>               trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
> -                               CLOCK_PERIOD_TO_NS(clk->period),
> +                               CLOCK_PERIOD_TO_HZ(clk->period),
>                                  call_callbacks);
>               if (call_callbacks && child->callback) {
>                   child->callback(child->callback_opaque);
>               }
>               clock_propagate_period(child, call_callbacks);
> diff --git a/hw/core/trace-events b/hw/core/trace-events
> index 1ac60ede6b..360ddeb2c8 100644
> --- a/hw/core/trace-events
> +++ b/hw/core/trace-events
> @@ -29,8 +29,8 @@ resettable_phase_exit_end(void *obj, const char *objtype, unsigned count) "obj=%
>   resettable_transitional_function(void *obj, const char *objtype) "obj=%p(%s)"
>   
>   # clock.c
>   clock_set_source(const char *clk, const char *src) "'%s', src='%s'"
>   clock_disconnect(const char *clk) "'%s'"
> -clock_set(const char *clk, uint64_t old, uint64_t new) "'%s', ns=%"PRIu64"->%"PRIu64
> +clock_set(const char *clk, uint64_t old, uint64_t new) "'%s', %"PRIu64"Hz->%"PRIu64"Hz"

I find it easier to read/follow as: "'%s', %"PRIu64" -> %"PRIu64" Hz",
you see the number directly, no need for the brain to extract the
trailing "Hz".

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>   clock_propagate(const char *clk) "'%s'"
> -clock_update(const char *clk, const char *src, uint64_t val, int cb) "'%s', src='%s', ns=%"PRIu64", cb=%d"
> +clock_update(const char *clk, const char *src, uint64_t hz, int cb) "'%s', src='%s', val=%"PRIu64"Hz cb=%d"
> 
