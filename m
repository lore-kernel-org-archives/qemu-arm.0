Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1743795lfc;
        Tue, 3 Dec 2019 08:30:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAAVyz3KclL0h2jMu3BaZ43PEsepNcA1DsB2t6JPX8ApGPN1lyoY9ks0AgFnCJEib01TL2
X-Received: by 2002:ac8:138b:: with SMTP id h11mr5822639qtj.153.1575390607572;
        Tue, 03 Dec 2019 08:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575390607; cv=none;
        d=google.com; s=arc-20160816;
        b=INOYO34rDGQBGeR8Vl0RE+U/LvWy97d82i/eZ37N8XCHRdcE9dSLetbPgnNgVRXjbC
         s2W/V+k6NG9PzS4ua5fgivOWkym/giCxaicMUUXczU5gypv587b1DiOtQOeIbtacYSV3
         AMme/5cUb1t+dGXWVFFOgtfeWVhKv7G6TvVvrEQqRNPsb3kvPhjCMD+eeET6wjny6hav
         /+sg/tWexPLDu7HfXWXj0hFnIKkEhjgoGypOVendm4nsnj1ANdzmWI5/5i/wwZLLas/m
         M7wCXR8K1IQRk5n5InEoCp+bq8I1hlWeLwJVsAgoAnIPxyNLhmX8PVHp4AUcWy1tot5l
         l75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=m/GrtFDIpUGCPR2VKiymWN5ig4th9UzpETIPcVzQZwM=;
        b=hJS3WPGh5XC4t5mCjS2eiYfhBCihz4HziS+N2cysifg/GKq9aPMjqAgW2dyBOAnzud
         OrhOrx0Q+nFKbhzggcP4oykIMeWpix6aIQ9P+oTYApnLiyhRV7f6tnNldt+KI5hvxHIM
         4oIzy7qLd9NMXTvQeAthCihsqs/LrCCc+UNoKGus4FLtuoSKoJsUl9mREPN4NESUfK/v
         sZj3xbhhrfrFk4JqbrCmelkh6aHlAldRcquqVo6E5tRAPDoiD6en9dkLffEvqWWRVs2B
         ytbnxROtoJdKOMZpBAO0fwKiDXUpHovY3a0hRlWxc6yN6tMFupqLUIfP+Yeg6E2eqc6Y
         9h0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gxj93EMQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h32si1165746qtd.129.2019.12.03.08.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 08:30:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gxj93EMQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icB3s-000615-MY
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 11:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1icAoy-0003aA-Lw
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 11:14:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1icAox-0003Sz-A9
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 11:14:40 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38479)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1icAov-0003OE-5P
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 11:14:38 -0500
Received: by mail-pl1-x642.google.com with SMTP id o8so1881955pls.5
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2019 08:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m/GrtFDIpUGCPR2VKiymWN5ig4th9UzpETIPcVzQZwM=;
 b=Gxj93EMQEDNXx+9uH+yAaDemwYyjMep+z7TB242BIKQK09nNj945DFcwdZNZ+uaBnJ
 sfjS80AHP7xe72AMXJnKmjco6bERdJdkfMnaGP94wrh7m7W459Kmz/9gFeB8UXsveF6Q
 QJ+3dt1eRzjHpz6Pxb/9LNGkYNghSMpM19kPNIfhTdYelrvOth7cZoZ02fd0+uEKrHF7
 pAm5+Mpd4gnomkBq9Gl4JahycOG5I3Y9u1erWYy7uevU78vrTWnyrnodr+OkjGIomOCm
 YeaA4ZGa7EfOxKh28RtfgzM+f18OTVxZIOz1FQ3tKDq33Hosdx5NCEwDhRmFpyhYsRLh
 5rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m/GrtFDIpUGCPR2VKiymWN5ig4th9UzpETIPcVzQZwM=;
 b=ar30X2pM+AJe+Q89nDn21MNhIyFmT5G8N1aMGmkJh3yyhnyM+8yMfJ15I+ZxjZCpiJ
 WR+GyZQ7fHD7Z/WDTjEYVqlbNEgsfFlSCsSjS2ZYClycCq8WrLZaPEgRdFvs5aiZtEkE
 Ea6QFkiaX7Pv1J3RBhT7Sx4aqa69vFEFirTk6r592xoMT7CG+kB9Xb3Y5xU8RDqpf3Wc
 3XPQIWPuPCByrQEvypgP6+xC5sX0IEYVAYamzomsAgqkLHAI+XlNsy+aO2cE+xAY1+aC
 5SYKcXhXqAtjMYnpb1SRmmW0UQIX7g8iwViQYfhZfLqTOJVxEaHcid/UKeAM45Qmn/Op
 lRNw==
X-Gm-Message-State: APjAAAWBttpZToW23ScFVZhRlKUH8ynwEj/hpQa4l31k/xvDHQFlTvYG
 RT0N8wysM+thoFIjP69Ipzo5o6A8kDQ=
X-Received: by 2002:a17:902:6b01:: with SMTP id
 o1mr5582660plk.24.1575389669582; 
 Tue, 03 Dec 2019 08:14:29 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s60sm708994pjb.3.2019.12.03.08.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 08:14:28 -0800 (PST)
Subject: Re: [PATCH v5 04/22] target/arm: Add helper_mte_check{1,2,3}
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-5-richard.henderson@linaro.org>
 <CAFEAcA_WOMbFzFQghakLxxuCTc2b3p6eb18nS5KSrSj+oW-Ckg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <120a00d4-a33d-6263-c6d4-4671449d7dab@linaro.org>
Date: Tue, 3 Dec 2019 08:14:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_WOMbFzFQghakLxxuCTc2b3p6eb18nS5KSrSj+oW-Ckg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-TUID: yaxvTgJQvAf4

Oh, to finish up on the replies...

On 12/3/19 1:42 PM, Peter Maydell wrote:
>> +    ptr_tag = allocation_tag_from_addr(dirty_ptr);
>> +    if (ptr_tag == 0) {
>> +        ARMVAParameters p = aa64_va_parameters(env, dirty_ptr, stage1, true);
>> +        if (p.tcma) {
>> +            return clean_ptr;
>> +        }
>> +    }
> 
> I don't think this logic gets the "regime has two address ranges"
> case correct. For a two-address-range translation regime (where
> TCR_ELx has TCMA0 and TCMA1 bits, rather than just a single TCMA bit),
> then the 'select' argument to this function needs to be involved,
> because we should do a tag-unchecked access if:
>  * addr[59:55]==0b00000 (ie select == 0 and ptr_tag == 0)
>    and TCR_ELx.TCMA0 is set
>  * addr[59:55]==0b11111 (ie select == 1 and ptr_tag == 0xf)
>    and TCR_ELx.TCMA1 is set
> (the pseudocode for this is in AArch64.AccessTagIsChecked(),
> and the TCR_EL1.TCMA[01] bit definitions agree; the text in
> D6.8.1 appears to be confused.)

It used to be correct.

That was the lovely bit about physical vs logical tags.  Add 1 bit bit 55, let
the carry ripple up, so that the physical tag check for TCMA was always against 0.

That seems to be broken now in the final spec.

>> +        el = arm_current_el(env);
>> +        regime_el = (el ? el : 1);   /* TODO: ARMv8.1-VHE EL2&0 regime */
> 
> We could write this as "regime_el(env, stage1)" if that function
> wasn't local to helper.c, right ?

Yes.

>> +            /* noreturn; fall through to assert anyway */
> 
> hopefully this fallthrough comment syntax doesn't confuse any
> of our compilers/static analyzers...

It shouldn't...

>> +            /* Tag check fail causes asynchronous flag set.  */
>> +            env->cp15.tfsr_el[regime_el] |= 1 << select;
> 
> Won't this incorrectly accumulate tagfails for EL0 into
> TFSR_EL1 rather than TFSRE0_EL1 ? I think you want "[el]".

Yep.

>> +            /* Case 3: Reserved. */
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                          "Tag check failure with SCTLR_EL%d.TCF "
>> +                          "set to reserved value %d\n", regime_el, tcf);
> 
> Technically this message is going to be wrong for the
> case of el==0 (where it's SCTLR_EL1.TCF0, not .TCF, that's
> been mis-set).

Yep.


r~
