Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp997162wrm;
        Fri, 18 Oct 2019 07:32:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqsGjCPVZ5eM7PQWw3dYomf9+NYHg1nPmk/0ai7345Z3T0lGV3VTy//vvJmsHOoJmES3/Q
X-Received: by 2002:a05:6402:657:: with SMTP id u23mr8487810edx.159.1571409156929;
        Fri, 18 Oct 2019 07:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571409156; cv=none;
        d=google.com; s=arc-20160816;
        b=rYTV23kMz6sVw7S1Q+hgosy/9sFu8uN2e505S7X17r0SyCqIa3V8NnmmMlHVuPWftT
         y/BNLKZUPVnIaObKbYqvGi7BmhB/Kg1yTxoAVwIBH/Kd4HFUHKusiRoqQ5pgN+NcHUX1
         2cSLHcNSFKc8AhhdbZwH8tChqKTuQpKEt6auQCpglb8TkAWr1klCrJPmFgYyjp6ADSZU
         6wiBcXGO9/3xfHNojOV9Il0Fb1E4f00UjufVS/wGaoyTTS3Id8a0f2jWx9SEFILORphk
         rJd2CrFNAInYtwqYIwmalyp9kK5XgcYEZ7VFADFWwHiVVZfLt67NAzQlATr0sN+mCjNt
         HU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=B90KVt3jBppnWmU62RN/VdEMzjr3PF5TC8yDKeKv6q8=;
        b=kusXcUGyCJotDDHw1OOqyClWkR4RdTtBjm5z/dQ9NYdtXTHZ0WcUf5vp6jkWwlZjHG
         sL4UEXFPtTw2PYzx9QXDQynQwueQXWM7OrB11HleysTxb+JF4xf+hXSCPZlf2HMl9qFR
         E62vK7bAaV5KYnxlhpTmWJxGXlPIlWnxP87U1rPxhEjOtkhB65iM6lc6g/cy+C3SIMcx
         isTH5e6R3qm/r05l1ArXUVb3vyeEnouDDL9cDIg8LnJiu09T1Gr4YRmBw0OLHL0UmSED
         qsAg+CmfZEYRQNzL6IYY2kWs1yt8tQmUaQDH4rdS3jHSFxzVzn69QtDuKYznjp04GQP0
         dWig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pHM/13WJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u21si3508772ejt.345.2019.10.18.07.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 07:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pHM/13WJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLTIx-0000aT-3h
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 10:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33463)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLTIM-0000De-Ps
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:32:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLTIL-0002jV-IV
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:31:58 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46920)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLTIL-0002it-Cm
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:31:57 -0400
Received: by mail-pl1-x643.google.com with SMTP id q24so2923292plr.13
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B90KVt3jBppnWmU62RN/VdEMzjr3PF5TC8yDKeKv6q8=;
 b=pHM/13WJuOtRzI2+FNWXWDzFVbsG/+6v4bfrD/EbLdeWeNbeHDqBnCngr4ERgTYDUY
 1JajSoaKMWDT1F8993D8vUhHUl8HlFu8OwqEeXoNTFE8/lUyQSbGYeNrZty/EFpiGqU+
 nNAr6ftvDLqp/eLKrX0q/bkuYB4CokvcHl1Rrfym+4sW+4FYuHIBdroxR0Cdma9AX3LB
 56jaqYaZ5PZ+c1hNf5cMImmv+pnXT+fvw3RQzGoipJks3uOjoktzwtZNTguF7LF76/hP
 utUZH0qY4eX2JMPIs6o2x7QdfYKgZBb9UgMFWgJDmDRVZpcdI4gjuvK9aCIfbX+ELn8k
 GhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B90KVt3jBppnWmU62RN/VdEMzjr3PF5TC8yDKeKv6q8=;
 b=lsBYzxb2YMMZ/pO7zkpEZGF+jCl6zcXtzAfh5CFZBBrFwUinFfAxSHsWtVUfp9PAaV
 b36/4p97oY3yJv1L4JsksKiAAcg3iW9NJ/DO2AVozromwQ8SvoHqxqVJyVj5QdcoNQf/
 WFm1YnRZoVfluskEkcI0aupTpRSZkqO5Y5fK3B1AtxYN2UfZaEHGLNXBLsjUmLd+ipdQ
 YWb111XtgWNFPgd2ZvOnhg8KfDNcQECUt2U0edjE640A2RpwtDNzXbAKU9oi7y13Jkuf
 AlN6CR+57fXy81NmIudgRX490NabL10v8mB2A+NxD2cmlPQYFKJ0eTHW5haM2gRYaen/
 MIxg==
X-Gm-Message-State: APjAAAUKpMy3rYDqdb66FCAXSuaLYpY3xFuf8lVy0wRAPS3ljY64Jc1v
 0IdcwYRIDNo8970xBFHFp6UvIQM1v1o=
X-Received: by 2002:a17:902:b70f:: with SMTP id
 d15mr10306833pls.210.1571409114650; 
 Fri, 18 Oct 2019 07:31:54 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t11sm5927106pjy.10.2019.10.18.07.31.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Oct 2019 07:31:53 -0700 (PDT)
Subject: Re: [PATCH v7 19/20] target/arm: Rebuild hflags for M-profile.
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
 <20191017185110.539-20-richard.henderson@linaro.org>
 <CAFEAcA9oJ0P-g87caLKyT1mS2k7YhtNXAOhSgXuMy0bCGwX0WA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <aa753ee9-40ce-d6c8-801f-eda74d76fd3d@linaro.org>
Date: Fri, 18 Oct 2019 07:31:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9oJ0P-g87caLKyT1mS2k7YhtNXAOhSgXuMy0bCGwX0WA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +nX/LlWl5ttF

On 10/18/19 5:25 AM, Peter Maydell wrote:
> On Thu, 17 Oct 2019 at 19:51, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Continue setting, but not relying upon, env->hflags.
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v7: Add rebuilds for v7m_msr and nvic_writel to v7m.ccr.
>> ---
>>  hw/intc/armv7m_nvic.c  | 1 +
>>  target/arm/m_helper.c  | 6 ++++++
>>  target/arm/translate.c | 5 ++++-
>>  3 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>> index 8e93e51e81..a3993e7b72 100644
>> --- a/hw/intc/armv7m_nvic.c
>> +++ b/hw/intc/armv7m_nvic.c
>> @@ -1604,6 +1604,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
>>          }
>>
>>          cpu->env.v7m.ccr[attrs.secure] = value;
>> +        arm_rebuild_hflags(&cpu->env);
>>          break;
>>      case 0xd24: /* System Handler Control and State (SHCSR) */
>>          if (!arm_feature(&cpu->env, ARM_FEATURE_V7)) {
> 
> This seems fragile -- we have to remember to add in
> a call to arm_rebuild_hflags() for every individual
> case of a memory-mapped system register that we choose
> to cache in tb flags. It doesn't seem consistent with
> the choice for A-profile to rebuild hflags for pretty
> much any sysreg write. Maybe it would be better to just
> always rebuild hflags at the end of nvic_sysreg_write() ?

I thought about that, but there were too many returns out of the middle.  I
suppose a wrapper function would take care of that.


r~

