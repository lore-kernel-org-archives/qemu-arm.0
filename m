Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1232271lfp;
        Thu, 16 Sep 2021 08:31:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyePaaEQTnPeVmRTLZnFdmM8V9EKwaWiN4dNf2liU1k3HixUk5WY9fvN8hNXJXt+dchb5D
X-Received: by 2002:a05:6102:f0d:: with SMTP id v13mr4713699vss.4.1631806267215;
        Thu, 16 Sep 2021 08:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631806267; cv=none;
        d=google.com; s=arc-20160816;
        b=pOr+cmS5sv9iLB7XL97zhgQozUhDWHh1yLCTtU9mnDGNnHEXf+tpDtdnQO7RAMuspr
         mmmz7337miSIxS5/aC54U3k3stS5+PsBEwxJloVcH5jscFPBJmTg4PEqf5pKL1OHx9Wa
         0KjNOembKoTN0bcm/QI+DpzKE9f8leCINGBxoqIq38Mf7Au5Hmb19F16myqochd6yIpt
         2De+Gfqm7yALHVI9AzL0qi+6IYtG6e0GE8UFlnyvuHPrnQ8RKQpT7EbN0deA5xpyf4dT
         AS5vow0Mz5lm6r72Ck7S6fNI3WJDzzqmntV0qdmJL/pedriqNBoU6KbCZOOWHMbIjFoF
         5gLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=L0zM4sfF/WiwPYQpdjCGW/ZRHJPfgdJmHVgKhZB/cLI=;
        b=EhrYTLAIqIDIanqPrTue/L1nUl0Ux4l7gBVh1lsJ8Pj2M6MwYD3nJ3daSFUvPeSqLY
         +4HPZDtc8BrbTOmw6+/v1cDcjUVByCeRkQT66nh1PfJ8XOrClzyVCezaq3HN7YUmvAUL
         Y/iprKQk6URlMvpUQPeH03dTrPRnoOI4+aaipTLiB5Ci5/V9rNxBOerHp31VYd0xR3JI
         +jIS927jkJA9c6urShFTw3A/E3NRn0ejWxebnpWmar6+DttNZCR4R9RecS9B3Bwjcu64
         NjUjzDZZ0O7cGlaCd4suoTmQl9PlEadgcHPR270YMPblpzNcZpid2atFBQbKvGI1enDQ
         p3NA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay30si1929687uab.261.2021.09.16.08.31.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 08:31:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQtLt-0001Dg-IV
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 11:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQtL8-0001CU-QZ; Thu, 16 Sep 2021 11:30:20 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51276 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQtL6-00026A-9t; Thu, 16 Sep 2021 11:30:18 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id E4E33608059E;
 Thu, 16 Sep 2021 17:30:12 +0200 (CEST)
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
Date: Thu, 16 Sep 2021 17:30:12 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JSSBBDfy1X7D


On 16.09.21 14:24, Peter Maydell wrote:
> On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>> Now that we have working system register sync, we push more target CPU
>> properties into the virtual machine. That might be useful in some
>> situations, but is not the typical case that users want.
>>
>> So let's add a -cpu host option that allows them to explicitly pass all
>> CPU capabilities of their host CPU into the guest.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> Reviewed-by: Sergio Lopez <slp@redhat.com>
>>
>> +    /*
>> +     * A scratch vCPU returns SCTLR 0, so let's fill our default with the M1
>> +     * boot SCTLR from https://github.com/AsahiLinux/m1n1/issues/97
>> +     */
>> +    ahcf->reset_sctlr = 0x30100180;
>> +    /* OVMF chokes on boot if SPAN is not set, so default it to on */
>> +    ahcf->reset_sctlr |= 0x00800000;
> Isn't that just an OVMF bug ? If you want this then you need to
> convince me why this isn't just a workaround for a buggy guest.


I couldn't find anything in the ARMv8 spec that explicitly says "If you
support PAN, SCTLR.SPAN should be 1 by default". It is RES1 for CPUs
that do not implement PAN. Beware that for SPAN, "1" means disabled and
"0" means enabled.

So by making it 0 we are effectively enabling PAN support on behalf of
the firmware, which sort-of goes against the whole idea of being
backwards compatible, no? I'd say that OVMF behaves just fine by
assuming PAN support is not enabled unless it does it explicitly itself.

To make sure we get full agreement, I've added Ard to CC as well though :)


Alex


