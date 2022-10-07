Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp638064ocg;
        Fri, 7 Oct 2022 10:36:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6oW4Uroq1YolzvfduLW2YdPD4LTgeZVEeJFt6qmWFH0wxngox/i9/DqpDJE0igj6DS6qhV
X-Received: by 2002:ac8:4e52:0:b0:395:308e:81c9 with SMTP id e18-20020ac84e52000000b00395308e81c9mr4945977qtw.675.1665164187042;
        Fri, 07 Oct 2022 10:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665164187; cv=none;
        d=google.com; s=arc-20160816;
        b=FfVjOdfzEypD1LC23nSBi6JexflEloXDRiVe8JIGF3SgWWx0QKOiIKnE2IFF3vyrjv
         vusEBzBo+W9KOqNKJo7Nb3emDCqCckaKeMJMgKv7nVZS7wiSJvk42nRcI1U9jzOyhs3O
         QqW/KS4ns69i7dkRJORDVs/bDdcdboLVuwhfoez3NZ53zEb3uWLoP98LQ/2pvgBYyCyD
         /JTfUVd47ikb3Pp67jWSsfsRkS/Li4X0uj8/0ZsIh+dSELa5qq9CCXGA4obhPnGIUcXK
         1k21HrGH2/RYIw/ddYZlZKd9MvfmwRrCkQbJ72LgjJGLc0xAafRULnUiEpY5PE7ILIM/
         Fd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UoCZAjL06IF4MTDyYFvN5gdKC5Sn7AX9BG2iOUSrdWg=;
        b=of5Z4Kr9/4ftZnHlE341QBV+D/G6HYI2NZJtdCEBjGHZAZZvswZ8cRQxjEZeNdKNYn
         TpGwJDGcYEb29WPD3cwXHolo01e08xJILlrM7im7NJYEPHfQJWUtQw6G3Y4DSNwH2oCX
         r+6xsw/QagD4w8NvNEqliAVtxzmBYrzdlU5fndc89wdz+RkgKGbESl2PhwNfR05ElFk+
         sulo1Sesa4cw8DXVDiSn4OYx5m7Vg0sRutSctncqzsagGEbMfISVOgPOmJqd7vkJOXcA
         nIlV7xQceD6Bm80yh8jANk1XP3pGPqs3TlHwMjz9AQH71KU0RAblPzpubA5WXN/zDPU3
         hSOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wiWAxC4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7-20020a05620a07e700b006b94021cf04si993323qkk.366.2022.10.07.10.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 10:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wiWAxC4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogrGs-0002Qg-J7
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 13:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogrFn-0002NJ-NW
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 13:35:22 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:45801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogrFm-00026x-2e
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 13:35:19 -0400
Received: by mail-il1-x131.google.com with SMTP id q18so79083ils.12
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 10:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UoCZAjL06IF4MTDyYFvN5gdKC5Sn7AX9BG2iOUSrdWg=;
 b=wiWAxC4HVbivmgAkpjbr3hwp3oSfL5qyp1wYForgXA8neCCLFVMYZRaLh9A/SYJypq
 je+J49avb9AO0GuXe61ws/KwDpxOJAdMol4rL398H1KvhE3UZkJJpztS9D2x1Essgb7X
 rmknVUWh83rZVfzMZyp9EgEUduZnZNDUDSxrjS80CxqK84QJa/u68XZQnl5sDqLpbixh
 mwg1Kj5wvurYhjxuqcrTcTAPWBvASQCg7CksSeOXGkhM1DPZs4UnhBi1Y3qQOxg7BGdA
 S/e/ytZokJCuqzQhTsCgE1wos0krGV3FIs2qqb5aLI9W6RC99Vs6FAwDnefQsrwVqGx0
 /Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UoCZAjL06IF4MTDyYFvN5gdKC5Sn7AX9BG2iOUSrdWg=;
 b=BCgBA/A2yfDppeYy4M7NGGmdWtNIh+psScx6a65KGwobhMJV8PzQ9vtXSb5Amwz8IN
 SgMkq4QwoIGgefLA45I3bpPxy7fBMCvL3xHNKb4B8SCIKhyGfw1jZW9+SQ8gCYuXV0P9
 Icfco2ZutsWdeqBj3ah30les7xNaW5c8N9CKBWTJtOi/F7orDPyErY76BrYeooSoh39i
 1KnAv/eOHcDG9oFbLoRWZIwDXes5GUgxcnjF1vkMLFBYM0J6H5pZ/4uG+lSyftEQ3SGs
 0cIkjAz4Ono5LydY3h3IXU/JvbMM2lrWBnwnWUJNv4pq805l5VFGji4yhf9oyb/zVK0L
 K97w==
X-Gm-Message-State: ACrzQf0UaygkU7ECep6/Y/iwU0FZGuqd4zd+SOjamEDmzyRmG6+d97Dg
 RYDknnztFp3un7XF11Azj0lLFgQsH+/N+Q==
X-Received: by 2002:a65:4508:0:b0:43c:e3c6:d1c2 with SMTP id
 n8-20020a654508000000b0043ce3c6d1c2mr5449035pgq.582.1665164106203; 
 Fri, 07 Oct 2022 10:35:06 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a17090a1c1700b001fabcd994c1sm4855679pjs.9.2022.10.07.10.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 10:35:05 -0700 (PDT)
Message-ID: <630e438d-1ef5-dc22-c9ad-4576de22b24f@linaro.org>
Date: Fri, 7 Oct 2022 10:35:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 41/42] target/arm: Implement FEAT_HAFDBS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-42-richard.henderson@linaro.org>
 <CAFEAcA-LhvMYbTTcsC+eAcAeA61e9Kq=zf6fKr5j_4dusuRDiw@mail.gmail.com>
 <52ec3b12-b9bb-b2a9-52c8-54a7016182c6@linaro.org>
 <CAFEAcA8Qe-Y1HD8ULjDgrcRGbpXruqL=te9NXtTv2OWv2DOBhQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8Qe-Y1HD8ULjDgrcRGbpXruqL=te9NXtTv2OWv2DOBhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M846Hf50yWQQ

On 10/7/22 09:50, Peter Maydell wrote:
> On Fri, 7 Oct 2022 at 17:45, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/7/22 06:47, Peter Maydell wrote:
>>> Are there definitely no code paths where we might try to do
>>> a page table walk with the iothread already locked ?
>>
>> I'll double-check, but another possibility is to simply perform the atomic operation on
>> the low 32-bits, where both AF and DB are located.  Another trick I learned from x86...
> 
> Doesn't that cause a problem where we don't detect that some other
> CPU wrote to the high 32 bits of the descriptor ? We're supposed to
> be using those high 32 bits, not the ones we have in hand...

Hmm, yes.  Which now makes me wonder if the x86 case is in fact buggy...

> If we do need the iothread lock, we could do it the way that
> io_readx() does, I guess, where we track whether we needed to
> lock it or not.

yes.


r~
