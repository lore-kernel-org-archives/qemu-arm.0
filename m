Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1786159ejb;
        Fri, 8 Mar 2024 04:55:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWlbwq6xqfpKsOdo01Kqz91LadvwJWM1HCsfskhnOPs7WU/r3nFCVlFJY+S/Lt/I3eL05PUM8tvtFahIxzNbPCSc1PQPCXX
X-Google-Smtp-Source: AGHT+IH/zz4za2ao6WqJX6u1+6SGgqc0u9Zik5BS0Va2wsJOhjbM4XL2+bgpWOlsipjf+cQu8r2I
X-Received: by 2002:ac8:5f46:0:b0:42e:c5a4:d477 with SMTP id y6-20020ac85f46000000b0042ec5a4d477mr12091604qta.32.1709902506584;
        Fri, 08 Mar 2024 04:55:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709902506; cv=none;
        d=google.com; s=arc-20160816;
        b=vtHVYAlOm5NKpBsmlkYoz/wlN+JkELnPMGyUuX3MsZqZuJBt/U/oR7VX6fyQR+onC/
         egiMB7T4/ULnxDoDTHpHeghaalkrQ2IDw2tVdqCPBh7jMQkK9PHAqpMJ60qQXiM7NkbI
         6LwPiwgVtZYh1XcGToH4uXNEt/sgEuyA9oWLyKYzxbib6J8d4sxoFlED+fmIXVaVg7YR
         Z2suSD43YQVhIgIq8cDfDnUu3zKiuPh2kEPDT8FprpU6apyn3ZBPMG9zXP9z2aiWcSEw
         pDkXj7Ql4UOAedstnXMTnYWreljcKRPnKD2I7xxsth37igoJLqvIIIiV92iw3FkJdjGC
         A/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=jtRBFJUdIRC3wS8+YuI0DyUIpHNFcGxsYtRbLdi1zas=;
        fh=T/JYzbw6W1UapRQLExdZLscq8JAtqIXcMGNs7Plm/Zc=;
        b=UaLiA1vHzko3XfxSrnAPlRydfLrpBITrb6O5e6ycoj2Soe698X10oEaVqyFrwQuCq6
         Rj5zdx4HMfFGiMOePRSUnoISR9wqXA5RT3IjUqwEDRSU63Il09+qjqmtm/mUfw/K5QMP
         KWgswLz7N29hjghLVc3z9tYZ9JSYTflW7+4Hc9Jr6Mxi7JKcXrqiK0FTiSom3O/Rvvrm
         Xq7EN5VfEFJQT8/i+3+3aDahXcuHQNsIF+6CNxH3xGelUyr5WZzFkG5kNrcJhp7sPfoE
         dTLyHX4RRkLiSzo3seyf5Ul28/CDp6xcITYCMi3YTi4xFyBQ3YHhwadOMJnv/ne9f1WW
         YzQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=htSB40I+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020a05622a148800b0042edf0f9a3asi14234703qtx.232.2024.03.08.04.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 04:55:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=htSB40I+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riZk5-000128-FZ; Fri, 08 Mar 2024 07:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riZk2-00011E-Tt
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 07:54:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riZk1-0001po-EW
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 07:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709902463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jtRBFJUdIRC3wS8+YuI0DyUIpHNFcGxsYtRbLdi1zas=;
 b=htSB40I+aU/c4RjrkBMz/bHSFis2cNBMyGwdSvFAvXvTqK9tdb05WLv5Jzm8WK+BvGKRPJ
 ZtC6qOqzeBQHymSoYPy1I+QKbfSTZkqfRbVp2VEyuEVZJY2uUcdlyy1dUeV335GrVTZ1mN
 OIplsabPvbCqOW++xBn2Ox6S1mw5FWg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-Fg9IIsjUOxO63DL5VHeD1w-1; Fri, 08 Mar 2024 07:54:21 -0500
X-MC-Unique: Fg9IIsjUOxO63DL5VHeD1w-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-788187122f0so256984985a.0
 for <qemu-arm@nongnu.org>; Fri, 08 Mar 2024 04:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709902461; x=1710507261;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jtRBFJUdIRC3wS8+YuI0DyUIpHNFcGxsYtRbLdi1zas=;
 b=CbVorbZj7d6YBLeOW7lGhwU36N/OJs5qJ6btI3VV0Q3pJ14nYCJdNKRXwWZfJYdoJ8
 hBMSZE7V/owGDc2oWLX2C6Fgo0n3vOSlqVSzWMO/nbAxAAvf/sKEjLAB2YGVrJZnqa5/
 dY7bspe4Z9sSIW/iGyFVbPo/O+HFOvJNSV30Uhfx594dz6k5URjkf3f0NgEqK11m9nNd
 CSuc+Jw4Z/zU87Q6RYtr2QE97VYDKzINUIxD3935T6FQAG7CGhKGzw7UEmsQ7HFQm7d9
 26pCYfSuomUdZ7mqzDYcY5aMhRR/W2u6MDgPJity+g6v8jcqCi2T9dVBqMHK3f1Z50rJ
 My6Q==
X-Gm-Message-State: AOJu0YwMLWEdwY5OwTS4MT9yoatwYnaWcTWzWwDBd3uoXYKzgodjzQcL
 m65pYl8DFdEkKUyHBFhOVVmsYb0bClayMW2WRLvpn0Ipe/e4sb5cai78O2bRPC8weYoGVh2kwHq
 Qpu2xbd2ubkSqZvqDDWMRNBCsvN117ir06qpI9LPY6gmSJROCoA==
X-Received: by 2002:a05:620a:91a:b0:788:51eb:6e1b with SMTP id
 v26-20020a05620a091a00b0078851eb6e1bmr1649607qkv.24.1709902461425; 
 Fri, 08 Mar 2024 04:54:21 -0800 (PST)
X-Received: by 2002:a05:620a:91a:b0:788:51eb:6e1b with SMTP id
 v26-20020a05620a091a00b0078851eb6e1bmr1649589qkv.24.1709902461103; 
 Fri, 08 Mar 2024 04:54:21 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-151.web.vodafone.de.
 [109.43.178.151]) by smtp.gmail.com with ESMTPSA id
 vq5-20020a05620a558500b00788242166dbsm5728290qkn.133.2024.03.08.04.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 04:54:20 -0800 (PST)
Message-ID: <f952b2d2-90cb-4427-a726-ab126ade8e71@redhat.com>
Date: Fri, 8 Mar 2024 13:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] target/arm/tcg/m_helper.c: Include the full
 helpers only with CONFIG_ARM_V7M
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20240129081835.137726-1-thuth@redhat.com>
 <20240129081835.137726-3-thuth@redhat.com>
 <CAFEAcA-yL8BAdtkF2xaWJOeFPUWRoBbuvPSEeorwjyei3oFjDQ@mail.gmail.com>
 <d0ed3f33-b641-4e46-bfaa-f21fbcecbeb8@redhat.com>
 <CAFEAcA-ye_3AqCkNS1acJ7GPzLEf=WCmjN3WXe9eRWB1x3y=7g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA-ye_3AqCkNS1acJ7GPzLEf=WCmjN3WXe9eRWB1x3y=7g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.572,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: pGhKHM73RucQ

On 04/03/2024 16.22, Peter Maydell wrote:
> On Thu, 1 Feb 2024 at 19:12, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 01/02/2024 15.19, Peter Maydell wrote:
>>> On Mon, 29 Jan 2024 at 08:18, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> If CONFIG_ARM_V7M is not set, we don't want to include the full-fledged
>>>> helper functions that require additional functions for linking. The
>>>> reduced set of the linux-user functions works fine as stubs in this
>>>> case, so change the #ifdef statement accordingly.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    target/arm/tcg/m_helper.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
>>>> index d1f1e02acc..a5a6e96fc3 100644
>>>> --- a/target/arm/tcg/m_helper.c
>>>> +++ b/target/arm/tcg/m_helper.c
>>>> @@ -22,6 +22,7 @@
>>>>    #endif
>>>>    #if !defined(CONFIG_USER_ONLY)
>>>>    #include "hw/intc/armv7m_nvic.h"
>>>> +#include CONFIG_DEVICES
>>>>    #endif
>>>>
>>>>    static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
>>>> @@ -69,7 +70,7 @@ uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
>>>>        return value;
>>>>    }
>>>>
>>>> -#ifdef CONFIG_USER_ONLY
>>>> +#if defined(CONFIG_USER_ONLY) || !defined(CONFIG_ARM_V7M)
>>>
>>> This looks a bit odd. If we don't have CONFIG_ARM_V7M
>>> why are we compiling this file at all?
>>
>> We'll get failures during linking otherwise. target/arm/helper.h still
>> defines code that requires the v7m_* helper functions:
>>
>> /usr/bin/ld: libqemu-arm-softmmu.fa.p/target_arm_tcg_translate.c.o:
>> qemu/target/arm/helper.h:76: undefined reference to `helper_v7m_vlldm'
>> /usr/bin/ld: libqemu-arm-softmmu.fa.p/target_arm_tcg_translate.c.o:
>> qemu/target/arm/helper.h:75: undefined reference to `helper_v7m_vlstm'
>> /usr/bin/ld: libqemu-arm-softmmu.fa.p/target_arm_tcg_translate.c.o:
>> qemu/target/arm/helper.h:73: undefined reference to
>> `helper_v7m_preserve_fp_state'
>>
>> etc.
> 
> OK, but what we want in that case is either (a) avoid referring
> to the functions if we're not building for V7M (as you say,
> may be awkward) or else (b) stub versions of the functions that
> abort() if called. We don't really want the linux-user versions
> of the functions.
> 
> Does having an m-helper_stub.c which we build if not CONFIG_ARM_V7M
> and having m_helper.c only built with CONFIG_ARM_V7M look
> feasible?

I gave it a try, but then we end up again with the problem that I already 
mentioned in the discussion about patch 1: CONFIG_ARM_V7M is not set for the 
linux-user binaries, so m_helper.c would not get included there anymore and 
we end up with lots of link failures.

So if you don't like the current shape, I guess this needs a little bit more 
pondering 'til it gets acceptable.

But could you maybe at least pick up the first patch already? ... since it's 
a patch with lots of code movement in it, this is quite ugly to rebase it 
each time someone touches some lines of code in that area...

  Thomas

