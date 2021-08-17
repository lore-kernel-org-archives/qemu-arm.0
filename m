Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp848618lfg;
        Tue, 17 Aug 2021 13:42:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI6cB82zZmRHGv+TUKy4wrze91DOcdCMoO+PU0ATBjpFdFuPR4hsOVaCnmqiebR4OkpX/7
X-Received: by 2002:a92:c64c:: with SMTP id 12mr935525ill.235.1629232960085;
        Tue, 17 Aug 2021 13:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629232960; cv=none;
        d=google.com; s=arc-20160816;
        b=LNw3sAIKUX2cHFisjMRHkc5Nj5K1UV5GcbGM2l/tc2ZLwlclJ7q5FAxYAINuyhSUqU
         8D9HWYYOk/f1ALi2ouQrbf8f65RCXshKMg9lOQEpGamWrX7yWkRBaDKU1ndMyfwZjT8z
         YiGhr25ZzDT6JY9ddaIpHMvdGMKfF5rermE9kd//zMs2hoUd/g4U+UDNNn8PRE3lbeua
         jV8whB8fGt1KAALUtgHTq2IA2PtLwQAVu7iha3s7gZSTiJMPMe0Uld1PtvdwXrIyJrh7
         quSZOGysRGrGeBLA6ECzvldUU+7o9p/+YtpzA4Gw6I1t/TxF1RLJJGMjv16vvRPA3Byk
         35sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6JgcKR7U+fRffWnU9TfMSMUX8i9qJ4l3cHpA13H8iLM=;
        b=hFofH81xdzZGdLtsgOBlfoJN6df6ZZwslmz1v3034os5RsN9mDtLOnrdjA1rTW0fCL
         ZETBBzVy3Goz2zz7v2Ra+tMneV2gBS1mmC2aKzM8NNQaNFE1WNYmIp5TxzhcuwmKY1uc
         tJSDDvvX42Y60PXPqlUzcpvkeM5sJ5G50e8lpSbyGChkLPEhA/2RE72B15gq8BcA/t6o
         gSZOmUNnQPp+B0wyjVtFFHstFYq2jPKnahD0oyDNfu7d/pqkYwMdklfFVrFijkoHs+mq
         SntqJoEVuba1L9sA7HaOmv0czFWzPSjFp1+4QqbzYyM+ZTrl+V3NI5vAS++f5TUlcyzI
         9p9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=drX6v201;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si3180667jar.3.2021.08.17.13.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 13:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=drX6v201;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG5ux-0006y2-DX
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 16:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG5ta-0006G8-8K
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:41:14 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG5tY-0000AZ-3F
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:41:14 -0400
Received: by mail-pl1-x62d.google.com with SMTP id e19so389850pla.10
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 13:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6JgcKR7U+fRffWnU9TfMSMUX8i9qJ4l3cHpA13H8iLM=;
 b=drX6v201vCGWak1T+EYtRQjd7tUqSJJ8T07yP6pFO4786dHI7q7BfszTLoGG2pzmdL
 PQR9jZfo4tmra+zVbRn4quPzzjoUXKZNXySLRDJqd7AvL4Q+4lHvFW+5lfSM/i5FYrww
 KOCpfvoAbutWcj2n4y9nWQ/M9xU4k+nm7BxxRQx2WAoavGNz8qunI/ttBiqykzktzVPv
 LdQoKm+meIN/D03pU6QpB6hzTuyLJoib2YOg31toOGw/MaewrSM3ZTR2+pVIU9kfX5mX
 2LXZIIK228ShFX/Fqgs/GiohkMaBRTRGdyhz/wToZ5b5W49vHBT7czXFEfYnHMnwns/K
 dNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6JgcKR7U+fRffWnU9TfMSMUX8i9qJ4l3cHpA13H8iLM=;
 b=Ot0H08Ozs4ybDSKv7xAbkgR+Zy5qGhjRhELmhI1bAVJL7Mp6OysafG4ZiV06zfPuNE
 T1LC60GtIryfMRk8BQVdBt1lF4ITCfntjgmE4avn8zEb3J0n2eJBfhCfUpKnpF0jcmrp
 SmhO0ymrGMdjmvNEhokbtvHQp+PJuHu38/A+c6gFLLhRpqf4x8dP6RRDsBIBSR7TzIcK
 gRDAJWDiqjjaH5eh+HijFPAPkt0+CLb2xlHGfmp8AuPj42X6Ln8MSZlRYl9Wy/D8ccDt
 G5vL9kDYAWj/ZwCj1Unw2WMpqsRltu/jWe1yDVbIVfOUAss9tvwxbgtH0oyv4u2OjwSa
 P2eg==
X-Gm-Message-State: AOAM532LaQDRCLx37YCeREoh6OEWwUKf8oJDRgYp0sPyCecKAOgTwwhl
 wUhrUxdCU44VQlmN3katZR5D/jAkMbL4pA==
X-Received: by 2002:a63:3501:: with SMTP id c1mr5143197pga.280.1629232870421; 
 Tue, 17 Aug 2021 13:41:10 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id 11sm4072922pgh.52.2021.08.17.13.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 13:41:10 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Do hflags rebuild in cpsr_write()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210817201843.3829-1-peter.maydell@linaro.org>
 <CAFEAcA_AXV5zvhWoyxmB03tN_UcTwJhp0V3rRD0Z7VcRMHM+KQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4db339d0-8350-8099-0e28-eeb4b5a5a1a0@linaro.org>
Date: Tue, 17 Aug 2021 10:41:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_AXV5zvhWoyxmB03tN_UcTwJhp0V3rRD0Z7VcRMHM+KQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C205LC/T+uFr

On 8/17/21 10:26 AM, Peter Maydell wrote:
> On Tue, 17 Aug 2021 at 21:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> Currently we rely on all the callsites of cpsr_write() to rebuild the
>> cached hflags if they change one of the CPSR bits which we use as a
>> TB flag and cache in hflags.  This is a bit awkward when we want to
>> change the set of CPSR bits that we cache, because it means we need
>> to re-audit all the cpsr_write() callsites to see which flags they
>> are writing and whether they now need to rebuild the hflags.
>>
>> Switch instead to making cpsr_write() call arm_rebuild_hflags()
>> itself if one of the bits being changed is a cached bit.
>>
>> We don't do the rebuild for the CPSRWriteRaw write type,
> 
> Doh. I said this, but then...
> 
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 201ecf8c67f..cdd6e0858fc 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -9215,6 +9215,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>>                   CPSRWriteType write_type)
>>   {
>>       uint32_t changed_daif;
>> +    bool rebuild_hflags = mask & (CPSR_M | CPSR_E | CPSR_IL);
> 
> ...forgot to actually check the write type.
> 
> Should be:
> 
>      bool rebuild_hflags = (write_type != CPSRWriteRaw) &&
>          (mask & (CPSR_M | CPSR_E | CPSR_IL));

with the fix,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
