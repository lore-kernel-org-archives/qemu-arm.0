Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2616286lfq;
        Sat, 3 Oct 2020 10:18:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/9Hdk4N5VQ8Nk5NFAxMx39SSlTKnsva4WRp+PRUblovKDV+fFIRO5GIy0BmZv7k70J+PY
X-Received: by 2002:a25:cfc7:: with SMTP id f190mr10462273ybg.271.1601745494628;
        Sat, 03 Oct 2020 10:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601745494; cv=none;
        d=google.com; s=arc-20160816;
        b=oZf2rXcPGmb0Je+3E4ULxZvrSknUUCDfs1CYomUm+xl06co8g1W5f18Af0zvePnaDe
         qcfgsMBd1yI/AJWKTPpfBjf23fQMF4gLAhJDlL2U9iX8msC3AobfI5SlHB6fsg08Wwg6
         ctmv0YAyy3mX1QfADqBvbpb4RFkFYshJPb+KigK5Sj1gMc1wtVYMHtEYtYGXyHIUgVfh
         TwZ9JWrHtlmABJwECTG01YuHtymxGYymTN04nIEr1jnR4PNWhcIpoVShHeozjK3rqI4S
         yswlkJLENrnOUEDqvuPxyEPOPu/C+hjD83vBLDmFATBegCvz4JqIvwcvxf9kID/cKtb2
         Pj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ps1yBSWRLshT21UqWJvkNa3TNt4oEyDKJhmb+3Q/taM=;
        b=wnGCIldwjoVmQcyWh3bNwrAeunwz4vc9J3XLaBQuIMaKC2l+Ge7ragfy7c1/7OtavF
         hX528Og12VIYJR73w9E0omxNQ3ppRVYfOSburer/Tkh7BrmSFljYVoXPgQ+prTaPqgaF
         cbTvvuJg4/ioPT8/6fL2rs+7bIJMmDCUgH0yaKyUbBiR5tKpuwGdnNRbHcMfJImt6Cd2
         1cSLZjBMIBR4ep0TOAGNmn/2QDKaeMHiKEXf/xIhIBnQzaTrzz5GyloZykGTFWOraC4V
         /hehvsfckgo9uNFhL8QHonEljiJiP2tW+fzjGuxPhEVzug/6iaSKL06jtlQFBWZW89TE
         U+hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DPvt0Rbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si6089575ybt.365.2020.10.03.10.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Oct 2020 10:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DPvt0Rbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOlAj-0000TF-PH
	for alex.bennee@linaro.org; Sat, 03 Oct 2020 13:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kOlAW-0000Nw-6W
 for qemu-arm@nongnu.org; Sat, 03 Oct 2020 13:18:00 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kOlAU-0000M3-Bv
 for qemu-arm@nongnu.org; Sat, 03 Oct 2020 13:17:59 -0400
Received: by mail-ot1-x343.google.com with SMTP id m13so4537079otl.9
 for <qemu-arm@nongnu.org>; Sat, 03 Oct 2020 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ps1yBSWRLshT21UqWJvkNa3TNt4oEyDKJhmb+3Q/taM=;
 b=DPvt0Rbzm3oaBnyIqelVN9Ixm9DuhZti9e7s3itN8weWeUuwsBOIsNBBVBZHQE5wbY
 1QH+gKEc6MzaJcbNX7o/kT8zluA95MIopharzt9fM9xa9LJD28YQkwZiuC0FMsPluDEF
 /C0AxD3540BYbaWkw71+elvmjbYYnhmebfiMvuWrf8TEIKYfTBhriE6uCV2vQDLYFCZs
 OtB2SCdNKcrtWoC/mO4Q9zh7EMZKIqvOrEUPauKrcOnz7ZgbCAbnF0cUWvRZ6BUIOcbG
 hKfhhA3jzf+RSHVUvEgQE76MrN1y14QLG5zhaU/sI08womhas/NoBXvTyrPyFJDzVFsp
 DoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ps1yBSWRLshT21UqWJvkNa3TNt4oEyDKJhmb+3Q/taM=;
 b=mAu+LZ804vJe/8j0FwZmVkwGX50j/+6HUwBtbqPcY98VSNJhQeA7G5R78p4riiOhLj
 45op4BvOtXpOCy0PcCqkm6KUEtH0TKgJzsyyNOd0IbKUwPm29fVb+zV1AlzaHI+9zWxY
 q7KCP20xRjGy11maeBPvvlk7YcW+VoHM08vj/92OeGkC4m5cWcbupk/58SGUUInXIWnR
 F7MW4l8YwQTv7muGBLqx5GMa789EeVszxRFpZ6SH5e5ss7EAMk4x5ZPlevCqUzIVVhb7
 HC4E4ebokVsIRztKx8OHP3isiJGx23EINNqQweZjnE8omcUmE0Dj3AxtOU3mmgeZKxzR
 b6HA==
X-Gm-Message-State: AOAM530TDpLOKXEKO1KhrBp3JgaOPEKcCzqDkJ1XQwuiUKo/I5k7zN06
 p+1gR1COaIvO9HVXujp0hKCiA9HCOCy14Lpb
X-Received: by 2002:a9d:70cb:: with SMTP id w11mr5720973otj.222.1601745475995; 
 Sat, 03 Oct 2020 10:17:55 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j1sm1088387oii.5.2020.10.03.10.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 10:17:55 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] hw/timer/bcm2835: Support the timer COMPARE
 registers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201002164216.1741110-1-f4bug@amsat.org>
 <20201002164216.1741110-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c47c8248-0bfe-5747-1ec1-073fb755f039@linaro.org>
Date: Sat, 3 Oct 2020 12:17:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002164216.1741110-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LqzGisz6EexC

On 10/2/20 11:42 AM, Philippe Mathieu-Daudé wrote:
> @@ -78,16 +71,29 @@ static void bcm2835_systmr_write(void *opaque, hwaddr offset,
>                                   uint64_t value, unsigned size)
>  {
>      BCM2835SystemTimerState *s = BCM2835_SYSTIMER(opaque);
> +    int index;
> +    uint64_t now;
> +    uint64_t triggers_delay_us;
>  
>      trace_bcm2835_systmr_write(offset, value);
>      switch (offset) {
>      case A_CTRL_STATUS:
>          s->reg.ctrl_status &= ~value; /* Ack */
> -        bcm2835_systmr_update_irq(s);
> +        for (index = 0; index < ARRAY_SIZE(s->tmr); index++) {
> +            if (extract32(value, index, 1)) {
> +                trace_bcm2835_systmr_irq_ack(index);
> +                qemu_set_irq(s->tmr[index].irq, 0);
> +            }

I think it might be instructive to have the parameter be uint64_t value64, and
the immediately do

    uint32_t value = value64;

That matches up better with extract32, the trace arguments...

> +        }
>          break;
>      case A_COMPARE0 ... A_COMPARE3:
> -        s->reg.compare[(offset - A_COMPARE0) >> 2] = value;
> -        bcm2835_systmr_update_compare(s, (offset - A_COMPARE0) >> 2);
> +        index = (offset - A_COMPARE0) >> 2;
> +        s->reg.compare[index] = value;
> +        now = qemu_clock_get_us(QEMU_CLOCK_VIRTUAL);
> +        /* Compare lower 32-bits of the free-running counter. */
> +        triggers_delay_us = value - (now & UINT32_MAX);
> +        trace_bcm2835_systmr_run(index, triggers_delay_us);
> +        timer_mod(&s->tmr[index].timer, now + triggers_delay_us);

... and here.

Also, the arithmetic looks off.

Consider when you want a long timeout, and pass in a value slightly below now.
 So, e.g.

  now   = 0xabcdffffffff;
  value = 0x0000fffffffe;

since triggers_delay_us is uint64_t, that comparison becomes

  triggers_delay_us = 0x0000fffffffe - 0xffffffff;
                    = 0xffffffffffffffff;

Then you add back in now, and do *not* get a value in the future:

    now + triggers_delay_us
  = 0xabcdffffffff + 0xffffffffffffffff
  = 0xabcdfffffffe

What I think you want is

  uint32_t triggers_delay_us = value - now
                             = 0xffffffff;

which then zero-extends when you add back to now to get

    now + triggers_delay_us
  = 0xabcdffffffff + 0xffffffff
  = 0xabcefffffffe

which is indeed in the future.


r~
