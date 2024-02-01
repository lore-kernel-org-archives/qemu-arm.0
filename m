Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp451970ejb;
        Thu, 1 Feb 2024 11:13:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtcyRayu5awmC9TkdDDd0BHU29bXlU83mFMRYoX1Jaodg0OUQfYvuYLAUOxzfGFAGGQQXq
X-Received: by 2002:a05:6870:179a:b0:218:51de:95e8 with SMTP id r26-20020a056870179a00b0021851de95e8mr6624912oae.14.1706814797402;
        Thu, 01 Feb 2024 11:13:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706814797; cv=none;
        d=google.com; s=arc-20160816;
        b=BoHyTlJHny3Sy6aLY0bmAr1fbKC3wbibBAH+eTKYKU0nI6V157pBuJV6hX+8jOUQOs
         Nd2s541mIGYqfGq8NN0ToShOnjuij9wMCm3Ss9Zd1+VwAAAAx2XfR4mYiJVa8C87G/TX
         6tMZNpVFmyn9grNqYyMl0gSx1yrj8AKr1Ew3tf8i7trJm1CxHxl5DJ2/iNl67fNYJSqI
         O2O6gK5/fP3AuKP/3Y2HJL0KLhAW/7yc/rPvfhVFJBu/eAFiCd9Iz/G1VbC7lURkUqlz
         4/nwj/HUc4zV/ndpeplu4QE0jRmRcgYQyvMy6rrXEy5X2JOeA/pzRqtRR77DlMKIIqZf
         B5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=QeY90C/M6YFuPuQHcmNve7Rbyg/pCNt8n114D/xO/TE=;
        fh=EuO4ue5u/sfPPnbaZL1d+QNk1SoRo57Uqen63FxshAk=;
        b=xxahn2vJx0580y2HsOPAaa7ADkFcTCabL8pOkd6qTBnVHyYU2ZI1/iy0Xpy01c753r
         QaQatdGuL6D3eR79K2DFuEE7BFkERHxQTIRup0F67vEbjgIbtXCziats2BYlaue6lzGI
         CX9x+OUnaVbWY+5YMLZalb4DFUvFVvlG2PPTieGXUQC2vkmX6J7iNLumeu5TeSFx3xIn
         zN5B+yMQ5MXaoY3kEt6w6X6G97dEB2PS2RBI0TF9Lmje9g3iykSXKo6M7Vw91hafB3ZT
         gQJxCewFE8Ikh9XC8h0Fx9DmqgolTGlmmXWzE5Ps7LobPlND+ZE4S+Ez4dobHOR9G3Az
         jhUw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XvudMq/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCVmprx9ddsgFUTauaD8vNFMLcU4wSU/g+sUReF8k4/MYkAnES2FVVhLaJgdva6+DgrneLlwLfmfhma0ckUtAGHZO+Hulrx1
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3-20020ad444a3000000b0068c469b28f9si134432qvt.515.2024.02.01.11.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 11:13:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XvudMq/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVcUe-00073R-M6; Thu, 01 Feb 2024 14:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVcUc-00070s-P1
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 14:12:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVcUP-0003Nb-Da
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 14:12:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706814763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QeY90C/M6YFuPuQHcmNve7Rbyg/pCNt8n114D/xO/TE=;
 b=XvudMq/xxzaWRst5EYm7eM0gqjoOSMfrJ2pCSvEIcHKopRDgKjZI8TXyCfdYFmoz4cfGwm
 Yjhs7kQTioRQDr/XeiUDPCdqf4Dbxt85ztBOo2oTRcJ+d5owGCAZ+RQIt43nXTtcRTn5IB
 ppi+Lczlur5WyO2HPn4vpOaod/ZRzpQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-pEtIsKBJM6uU1h7FmV23Ug-1; Thu, 01 Feb 2024 14:12:42 -0500
X-MC-Unique: pEtIsKBJM6uU1h7FmV23Ug-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-78315f41c6cso155711285a.1
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 11:12:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706814761; x=1707419561;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QeY90C/M6YFuPuQHcmNve7Rbyg/pCNt8n114D/xO/TE=;
 b=n/PVmgYAnNyB+uetdYLvULEDlYdqnh7BzhjqN0wkkpXriVxwqHVcmKIijlN8gbWMJM
 uXFMuGLH/TLMZ2VNBr9K+SsPXTZl2sst/5pP0J5dVEp181/iCGpsB1Md5c73rLJPv5hB
 1gOULBDKDNa4HmggaeeH7fJeNxKSS6Z5ppk+Ravx+X1FfXBnwnYshvvae+EgLm9+pFbD
 8gV+eXae4Jkpluz471oiqvreWuZgc1ZTl2L5WJ4ajjtu49PBTvQrwg1/W141Jpj4IOz3
 nnfkSpvCBZAU/7I2YlYa+JO3ShcppbYfMiV65kcpxxPMzfNAsgSNsVnK1Qt3AniEqVKg
 8iVA==
X-Gm-Message-State: AOJu0Yx8cqagK9g+uPGyPnmA+vWaE+0bjyBTpRX2kDhgneDBhm1H0DFA
 um/OiLWIJJlrQfyKr1XZRtX+PXs3+qEzygvdD1msoZB/G9Sfjjo7TFkq3sfxizUIAUOqwTDzVht
 WKMnrwflAmrzSLv38naU3k2qJLJ70k79BjPBFQ2O3/aW0IWO+2g==
X-Received: by 2002:a05:620a:3889:b0:785:416a:b4cd with SMTP id
 qp9-20020a05620a388900b00785416ab4cdmr3207659qkn.60.1706814761769; 
 Thu, 01 Feb 2024 11:12:41 -0800 (PST)
X-Received: by 2002:a05:620a:3889:b0:785:416a:b4cd with SMTP id
 qp9-20020a05620a388900b00785416ab4cdmr3207641qkn.60.1706814761365; 
 Thu, 01 Feb 2024 11:12:41 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVtdiICq4pXej8xf3PjZu9MT1K60R0zAihdWP3cfE2/PpGfXQvNG23XT9DOaIidCLMIS97wfWceSCnvvdhaM8Iy58mvJaVmbrjAwiwIakNJd4CqGvOJDH0lqkOwuGKIdeOkD1NGrLmtUCA=
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de.
 [109.43.177.196]) by smtp.gmail.com with ESMTPSA id
 m6-20020ae9e006000000b00783dc97436dsm68152qkk.13.2024.02.01.11.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 11:12:40 -0800 (PST)
Message-ID: <d0ed3f33-b641-4e46-bfaa-f21fbcecbeb8@redhat.com>
Date: Thu, 1 Feb 2024 20:12:38 +0100
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA-yL8BAdtkF2xaWJOeFPUWRoBbuvPSEeorwjyei3oFjDQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: K5GWfYQPu+qo

On 01/02/2024 15.19, Peter Maydell wrote:
> On Mon, 29 Jan 2024 at 08:18, Thomas Huth <thuth@redhat.com> wrote:
>>
>> If CONFIG_ARM_V7M is not set, we don't want to include the full-fledged
>> helper functions that require additional functions for linking. The
>> reduced set of the linux-user functions works fine as stubs in this
>> case, so change the #ifdef statement accordingly.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   target/arm/tcg/m_helper.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
>> index d1f1e02acc..a5a6e96fc3 100644
>> --- a/target/arm/tcg/m_helper.c
>> +++ b/target/arm/tcg/m_helper.c
>> @@ -22,6 +22,7 @@
>>   #endif
>>   #if !defined(CONFIG_USER_ONLY)
>>   #include "hw/intc/armv7m_nvic.h"
>> +#include CONFIG_DEVICES
>>   #endif
>>
>>   static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
>> @@ -69,7 +70,7 @@ uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
>>       return value;
>>   }
>>
>> -#ifdef CONFIG_USER_ONLY
>> +#if defined(CONFIG_USER_ONLY) || !defined(CONFIG_ARM_V7M)
> 
> This looks a bit odd. If we don't have CONFIG_ARM_V7M
> why are we compiling this file at all?

We'll get failures during linking otherwise. target/arm/helper.h still 
defines code that requires the v7m_* helper functions:

/usr/bin/ld: libqemu-arm-softmmu.fa.p/target_arm_tcg_translate.c.o: 
qemu/target/arm/helper.h:76: undefined reference to `helper_v7m_vlldm'
/usr/bin/ld: libqemu-arm-softmmu.fa.p/target_arm_tcg_translate.c.o: 
qemu/target/arm/helper.h:75: undefined reference to `helper_v7m_vlstm'
/usr/bin/ld: libqemu-arm-softmmu.fa.p/target_arm_tcg_translate.c.o: 
qemu/target/arm/helper.h:73: undefined reference to 
`helper_v7m_preserve_fp_state'

etc.

And then other files are depending on these helpers, too, e.g. 
target/arm/tcg/translate-vfp.c calls gen_helper_v7m_preserve_fp_state() etc. 
... I guess it might be possible to disable all those spots with some 
#ifdefs, too, but it's getting quite ugly that way. It's way nicer to use 
the stub functions that we have in m_helper already anyway.

  Thomas



