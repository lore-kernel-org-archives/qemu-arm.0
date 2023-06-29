Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp545908ejy;
        Thu, 29 Jun 2023 14:16:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEYZKwFHNvspnrpbwQhKAobKS/qU3ynO5rZkCjcaYGTJVcnfab+rU14VwBtqLS3JqbG5FWt
X-Received: by 2002:ac8:5a96:0:b0:400:92d6:7182 with SMTP id c22-20020ac85a96000000b0040092d67182mr668896qtc.26.1688073364925;
        Thu, 29 Jun 2023 14:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688073364; cv=none;
        d=google.com; s=arc-20160816;
        b=PUo9t+aTXrwowkja/QLtkSL3O/yM0y1YkCqk0ESnhhoDgv4tBBOxgSAkx5KeI4WNLo
         hdI1PcKniR28jxR+eS29f02wuOoLzNn5iGvr3HlYtAySMxylojNDsnimXS2m7fcwV+PX
         cAATl+hIBYK/qnmFSeT0OKh5/Jv+6/od7TNDQsLcV1Sbiatx6EI+6jwu7niNzJGKXXj2
         NKg0Tm15UEsG+z3YIPm5lu9kpSrIltNtsmpvimNRKe1nFbZ6HkR4yW19wSkkVWd+gw+Q
         nrU+iAnMR+XUmr8EpJZWBKcK3FIFZCvKGWQ5nPbsZD8oe6p98QSY39azyH3huyIn1tYk
         Bi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=i5hl8/DLL5YNUM7HSBZF/Hckt2vUVlDH6lpGnyFgMEk=;
        fh=iUIMEUAV1gMcXNs6CxPkGe5+ZLM2PIepOPkzmdEkREM=;
        b=N9wp6y/tb/9heeZ6BqJc5d3eRyWf3wAHswWDAaB0xWUndJ6j4hb3O6hCJP4y2DrL0R
         v0aufzjyfpOP1PWncthhTVJqa0KCR/f445nn+H6wBpQeUwbxpD+shkCz46KY9laeolTP
         G/5onKLdsvlCPCRHpIo7e4300OxJrfCVW1JAZ45SnMhz3HnLcu8Z2BZCPSLB4NIhWGVY
         1Af1bHtXWIiGBYnAswsx2bB4lI5eZU+KLpMrzYuXAqhKRK3iq0VA0T7v6Re9xF/K/VMB
         OiqDf5cYlWhdnFuY7DfJ2RD+gi/Nfhkxl9/VFxtML402a/ovwny/svEriybcQABvcNqq
         R1Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=swvwJlbA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11-20020a05622a048b00b003fdebf1a40dsi7173820qtx.134.2023.06.29.14.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 14:16:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=swvwJlbA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qEyz7-0003VJ-7d; Thu, 29 Jun 2023 17:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEyz5-0003Ul-5n
 for qemu-devel@nongnu.org; Thu, 29 Jun 2023 17:15:23 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEyz3-0002vt-Ef
 for qemu-devel@nongnu.org; Thu, 29 Jun 2023 17:15:22 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-992ca792065so56117766b.2
 for <qemu-devel@nongnu.org>; Thu, 29 Jun 2023 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688073319; x=1690665319;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i5hl8/DLL5YNUM7HSBZF/Hckt2vUVlDH6lpGnyFgMEk=;
 b=swvwJlbA2YRWP3QK+J/HMC0Z7Dp0y2gMrUXRHdh1bOnUdpbzR94HDbFx5yYceLv8vy
 xfddEG5am/8Mh+e9mc+TXF4ihotLQKSvUVp0IM2UDxdIw4S5kD+qUgiDiW1ZKRauvP17
 VOaynJEAqlj58OtsXwW+N+C1KalKq5PY4Rp4vHnrLF/KxXmnTjYtMoU4UR23SRlY31Xj
 0Jjueum+1JGaf9N7/jRh3FmcyUdtFiKX8KKeNMQtzarxHKWDsXrrBl7bKOBOVU1wdvWD
 nXQvuLGWEiGWgzVRz42VrSfo7mGZWTHYqczkDD7r0N5eO3jLhMcWwKSmxUaxihU/gPAM
 fVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688073319; x=1690665319;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i5hl8/DLL5YNUM7HSBZF/Hckt2vUVlDH6lpGnyFgMEk=;
 b=PbiBb8gaF88f/9Hq2BgMdNCxKumBzOsk+g3gjPmW+Oo/gic30DkJa4hUzEtiJWy63q
 cGAR9aU50Tom4h9fH8J/7pneCmIN8dv6ywG24Ark07hE/7DjHBtPawFCZPpYJwTNOtNN
 jiXjuYSf79htqeisPoBcxXSOLXvhhE/kGCU47moztMEGj4pnYcv+L3qlVENe4r/mm9pC
 wRHtR7CYQBIpZezwidyCxoUHqR2NoX/41mn/DLIPIGPmdWj/tj++P0ObZcI8wVZwy/xh
 5W7tgZAkNI9mTx1nrjn6nCBtcVAKVqkr0FCbRj6CmBxXqZNsU2V+/piuezTUjX+1jFiy
 LtgA==
X-Gm-Message-State: ABy/qLbSqnRBfsXBZNdg7HhqNY3eVRUhH7WMcO/yrB30IzTXBJ3RUfG4
 8BLT5uW3DGyvzHw3sPAIgO3hQA==
X-Received: by 2002:a17:907:1742:b0:991:c67d:87a2 with SMTP id
 lf2-20020a170907174200b00991c67d87a2mr418667ejc.28.1688073319512; 
 Thu, 29 Jun 2023 14:15:19 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a1709065f8200b0098768661505sm7250478eju.117.2023.06.29.14.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 14:15:19 -0700 (PDT)
Message-ID: <06397069-f1bb-fe79-1ffc-7f13e3fc7e5e@linaro.org>
Date: Thu, 29 Jun 2023 23:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] hw: Simplify calls to pci_nic_init_nofail()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20230629125449.234945-1-thuth@redhat.com>
 <dc6a61da-73d0-d0ae-fc62-3a04ccea5417@linaro.org>
 <509ddf59-b401-41c5-099a-0acbf2c94f11@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <509ddf59-b401-41c5-099a-0acbf2c94f11@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w74ghOBatCvy

On 29/6/23 16:58, Thomas Huth wrote:
> On 29/06/2023 15.47, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 29/6/23 14:54, Thomas Huth wrote:
>>> pci_nic_init_nofail() calls qemu_find_nic_model(), and this function
>>> sets nd->model = g_strdup(default_model) if it has not been initialized
>>> yet. So we don't have to set nd->model to the default_nic in the
>>> calling sites.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   hw/arm/sbsa-ref.c        | 8 +-------
>>>   hw/arm/virt.c            | 8 +-------
>>>   hw/loongarch/virt.c      | 8 +-------
>>>   hw/mips/loongson3_virt.c | 8 +-------
>>>   hw/xtensa/virt.c         | 8 +-------
>>>   5 files changed, 5 insertions(+), 35 deletions(-)
> ...
>> This remind me of a branch from end of April with this
>> unfinished patch, did we already discuss this together?
> 
> No, I haven't seen your patch yet, neither we talked about it. I came up 
> with the idea for my patch on my own after looking at certain spots in 
> the code. But I guess you could easily rebase your patch on top of mine 
> in case you want to finish it ;-)

Yeah sure, I was just wondering :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

