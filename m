Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3561055lfc;
        Mon, 1 Jun 2020 17:02:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN1QhwBoTLG2e5AEdLkilAapArzncq/yEHlnhTR6lSRe94I9hqBLszro08S+iRSckL/geY
X-Received: by 2002:a25:aaea:: with SMTP id t97mr39698352ybi.86.1591056138486;
        Mon, 01 Jun 2020 17:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591056138; cv=none;
        d=google.com; s=arc-20160816;
        b=Mrsxkw1ml9i6HwHd01QEDruihIMVpDLlzTGk50ZoYuUE6ybVAk6KrkxvxTytzziiTg
         GuPAh4X1aY0KkQL5IyOWLbPi+dQQBXrvF4/fNCGgwAlmL7PRwpW9hJjG2ONgInpQhR7g
         NdkxR6YcJonOW6D8J/MhHBckpRO0JhHz9xgc/hKTbRLyhiq8XPqWT7ebtEA1dXwpom2I
         TICga6PenW5mlvaakjsSIOX9oW3IoudS8VGTYgUC95Z8EB1T3ucefZn+k3jZKWMSONL+
         ll+ib+FFKyFE0R0NZNBsr3vWGxC4qofxycsJaX1aWO+T1AMejHvtSuCXjapA2Zz7yUHn
         y2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0Y9MymB8EH4WPbs5YJ4U9Yi/bl85mXT6ng35Rjn9q5Q=;
        b=ke6bECSNUBsByIXSYw/nJK2mkhnFMGNYE6PpWRqp8kGaJtHjA9toZRWJlaf8/e9Wn1
         PC/o7INtVDuyXmwLU9nr6H4PQKZAyQ03uQTv0Mkn4O/FeafRVzfrpTeRG8lenddCB+S5
         wSQcrVInSq4lPvKQsKhdAIT1OkVaZv4d/2WOyi1HDDZCzs3i7vZ5KmIHs3nWn8d7BuVC
         YxJXodUyHVnty5LiPozXkRL2H8ofVs+CapwHHrkaYJta/KHfnrFdgECtkTkpx38amCz7
         4dwwIN3lRccdEv2eoZrOeM6/hbtguskgGjitNjloQShNvNoBj9wgxC44MsPudzPZc7oa
         crrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Edw2SyVX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v203si727935ybv.150.2020.06.01.17.02.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 17:02:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Edw2SyVX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfuNl-0005h3-N8
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 20:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfuNS-0005gs-6V
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 20:01:58 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfuNQ-0006os-TY
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 20:01:57 -0400
Received: by mail-pl1-x642.google.com with SMTP id n2so563865pld.13
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 17:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Y9MymB8EH4WPbs5YJ4U9Yi/bl85mXT6ng35Rjn9q5Q=;
 b=Edw2SyVXvNjIalNpxNwF7T1QSWEx1gi2b2md7fj+D2hlUBWPRgNLqfpAs5k71VqbQn
 hlnQHvBZkm4GJ4SE2xICrap7WgAbDbjM5r54UVBZBk3FUhtalsMWOCAbdciRLjaYV6ED
 VzOaxGv6SoR0QPBGpB1MncKRQfvF/RxfnUvfVL5OpciG/72yubGe0H8asXNGwmv11dC/
 b85I0RIK1zCijiJqSdS2OIqsIu0Sy/+CJLka8nQLke/GnLuaSZUmWs1fGYPkkxU90J1Y
 L2T3+O8tpMewhGJUkzreu9PeF6LZLSIcMsKLxCuqvTjmuBBAhwm/Ta6k+e0PxFeOtiCv
 Rtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Y9MymB8EH4WPbs5YJ4U9Yi/bl85mXT6ng35Rjn9q5Q=;
 b=udAKTZS+oaLHxJ0RN7Ki0wqkfs1DYGdayNyMvkSGl3jvtSqaKNvczYWwRbsb/2Qzyl
 JcHgzLkA5nQimXcyhlrAANuv48dF+nrLsb5xVrkIVPMXDwm/W5zEGuM62l571tTOz8jk
 X3T7hvCGbC1lej1o2S06OkUIwNPPEbfJh62e2XwsCm4jTSJWSFmNnyRWAIJPwJ8gs0Hj
 hvwuFypsjWPKaoUnPlXS+VrpiwbJJllysRpZI2pwFZk9fcmDrFIpmDTGguwdQeM3pcLv
 VNuC2STnj14lBJIURI9pAhKI7gjpxWKdc9PrUcNUu5dzAPU2EDdrAuErTtOkHWxe15SU
 r87w==
X-Gm-Message-State: AOAM533eOAgki7nxXvV42FNKWd/byH4CESSBXvI+JtzjrEc8ZKdLXow6
 Rt50xKrs8dYjiVBgM9QIPS6xFQ==
X-Received: by 2002:a17:902:7e41:: with SMTP id
 a1mr22142932pln.72.1591056115229; 
 Mon, 01 Jun 2020 17:01:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id f18sm481151pga.75.2020.06.01.17.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 17:01:54 -0700 (PDT)
Subject: Re: [PATCH 5/6] exec: Restrict 32-bit CPUs to 32-bit address space
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200531175425.10329-1-f4bug@amsat.org>
 <20200531175425.10329-6-f4bug@amsat.org>
 <CAFEAcA9CkBy=e3EmJhKko9XGbL7A_E_vedm8jt_H3+Gr6yzbhA@mail.gmail.com>
 <2e78619d-543b-55b7-f241-7652274fcf4a@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eddd2573-84cc-dcd3-09b0-85c6ba989721@linaro.org>
Date: Mon, 1 Jun 2020 17:01:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2e78619d-543b-55b7-f241-7652274fcf4a@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5nTAh7K2ab40

On 6/1/20 1:09 AM, Philippe Mathieu-Daudé wrote:
> On 5/31/20 9:09 PM, Peter Maydell wrote:
>> On Sun, 31 May 2020 at 18:54, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> It is pointless to have 32-bit CPUs see a 64-bit address
>>> space, when they can only address the 32 lower bits.
>>>
>>> Only create CPU address space with a size it can address.
>>> This makes HMP 'info mtree' command easier to understand
>>> (on 32-bit CPUs).
>>
>>> diff --git a/exec.c b/exec.c
>>> index 5162f0d12f..d6809a9447 100644
>>> --- a/exec.c
>>> +++ b/exec.c
>>> @@ -2962,9 +2962,17 @@ static void tcg_commit(MemoryListener *listener)
>>>
>>>  static void memory_map_init(void)
>>>  {
>>> +    uint64_t system_memory_size;
>>> +
>>> +#if TARGET_LONG_BITS >= 64
>>> +    system_memory_size = UINT64_MAX;
>>> +#else
>>> +    system_memory_size = 1ULL << TARGET_LONG_BITS;
>>> +#endif
>>
>> TARGET_LONG_BITS is a description of the CPU's virtual
>> address size; but the size of the system_memory memory
>> region is related to the CPU's physical address size[*].
> 
> OK I misunderstood it was the physical size, not virtual.

It is the physical size.

In the armv7 case, the lpae page table entry maps a 32-bit virtual address to a
40-bit physical address.  The i686 page table extensions do something similar.

See TARGET_PHYS_ADDR_SPACE_BITS.


r~
