Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp884002lfp;
        Thu, 14 Jul 2022 16:13:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unW3GVja+hibkgn/9bVHfNMws+nwnAx+hpYJmKwbjjKOWwf7tMzba/klRUxZGVZsWZYSNT
X-Received: by 2002:a05:620a:8de:b0:6b5:7b34:a277 with SMTP id z30-20020a05620a08de00b006b57b34a277mr7921016qkz.59.1657840389417;
        Thu, 14 Jul 2022 16:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657840389; cv=none;
        d=google.com; s=arc-20160816;
        b=rAM4GuzXsV7JVR0xRUsPm/DnRiS64bUC+B0Qt/Pz/Us96ZIVPXmCof8DQUxUj2M9DX
         EbeyDk3W/EDQkLZtcg/gP6azMywWwxLg0ajy8nNszqlpTcniEAGPyzRi/5kaVaW0QUja
         X4HzUil8DCLLX2tdW4kAJYYnRpgNJlYqVhmIOh5bXLaXfAiMZzkv1mZaJMY0t9D0s1Ab
         2XJNXQuGK6Lz6j0W1zyeFH8KRQy6D1hG65+sKAsUJ69Q8hgpO0bgE45MAp1282QG6by4
         LwahpCC/2uNF0GaTUJABfAEfoNCy7liOH7J7tsRE138M8ltpV8xfNOnTrqfcnODpxfOK
         luFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vazCX5gRNxkaKGQ1BugtbIk2BgCrm32nWYMIAJbwuQg=;
        b=dFyaSyq9QdvZX5fsYzxXELM/G9uj7LwArirsTy0Vb2b7swq4wEgFMZzNU8RypZv+bj
         IxeKuxlnnz175IyemEgZk3BuKg1RVHWhRaXGv4ePvVRF/1rFWPKOKDSaRY0L7G3pI8Xh
         DMpwwTCfwxYxrxnFHPS6+pT909SPurSpPHO4b6z9cCBrfSrNqdCYeTI/uDmFnStTtP1Z
         NgcV7z7UvDN/An8APnUvFJp/om5cPxkMzdz678/NIAmpVm8+8Q73OWL07beAN3r3Qqno
         VknlSnCNnq8rHH+/LRpBaAF6YDzY+l2Q5AlG3JB9lo2NPxQrAQbQPhKn3rjgoyfnO8dx
         FBFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NHOsHknk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn3-20020a05620a2ac300b006af0b936316si1625984qkb.635.2022.07.14.16.13.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 16:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NHOsHknk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC816-0000S9-Ul
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 19:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC80y-0000S0-9H
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 19:13:00 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:44936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC80w-0005h4-H9
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 19:12:59 -0400
Received: by mail-io1-xd32.google.com with SMTP id v185so2668573ioe.11
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 16:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vazCX5gRNxkaKGQ1BugtbIk2BgCrm32nWYMIAJbwuQg=;
 b=NHOsHknkiNqe4o/IufHCkfg4SVFfKkQgH/dj5TlrYfHtcyJ4NZqWqyDTyPAzAPR5Ud
 NrCj5Nh3ohhQWmtD9xKzhJTUNy61RJktGtkJSJKPQHwO7kKcMq33p1RWhAOwRDfjNUHc
 CcQNgU/n6tWn55zhJvMP6VDQ/M4F8dnfFLL9pD9iwl0pXhL/BJGoTt5cCczhlMke3F7E
 fZ5kTQiVjLdQGSxG/lZJ6IW/2VM57iFpBd2a8jOjCkJ7j0k2G8EPx651Td8v5IXfsY3X
 vlFFMZGMylk5siGAOP2AHMjJcB/3IVjs1lzPEnAXvHjqkS39qEkAkYm96yub79Mx9PNi
 6tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vazCX5gRNxkaKGQ1BugtbIk2BgCrm32nWYMIAJbwuQg=;
 b=UzuAHvFRGyun78tDHq+FDi8T6vaoxruP/npzml3iYaHiv3agIK0EQeH9db3H9PMiqf
 m1wvNoqJfuYt5xRPmU1X8g+F8PTzidOzfi9cUvFRbM72OtWKGkoTYFfy2Nlj4I6w7+mp
 BLSrcZyCeYbmpmIJscXZfNMFSV50wLwfVmy7S/C0W5qKSooTnDTu03mfNI+/I53OAO55
 t/CB8eTBudGPCwZizS/vet5ANKC7zAL+BjjtfxhVRExKR+81bTSlmV3uv1fENrP/3Qbx
 czwnu7Y4tTiHTUgQtl8lhu7kpHOGzFV44hQD6pVG/9HMaCIZHybzUHYuNdZqtWHQ7mtX
 9ZEQ==
X-Gm-Message-State: AJIora9W8/43mr8fB3g5AcwGn97vq4qv7FGjEcm2Ce1QqICOecXWVS0A
 UFDaJSJndLwl5G7I+wKpY0iclQ==
X-Received: by 2002:a05:6602:2b10:b0:67b:80f8:6f2b with SMTP id
 p16-20020a0566022b1000b0067b80f86f2bmr5634886iov.147.1657840376896; 
 Thu, 14 Jul 2022 16:12:56 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a6be709000000b0067bcbb0d258sm1317313ioh.46.2022.07.14.16.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:12:56 -0700 (PDT)
Message-ID: <bcc17531-f644-f6bb-b6c6-a160f39889f1@linaro.org>
Date: Fri, 15 Jul 2022 04:42:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/7] target/arm: Define and use new regime_tcr_value()
 function
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: BPPd/yq1p8cW

On 7/14/22 18:52, Peter Maydell wrote:
> The regime_tcr() function returns a pointer to a struct TCR
> corresponding to the TCR controlling a translation regime.  The
> struct TCR has the raw value of the register, plus two fields mask
> and base_mask which are used as a small optimization in the case of
> 32-bit short-descriptor lookups.  Almost all callers of regime_tcr()
> only want the raw register value.  Define and use a new
> regime_tcr_value() function which returns only the raw 64-bit
> register value.
> 
> This is a preliminary to removing the 32-bit short descriptor
> optimization -- it only saves a handful of bit operations, which is
> tiny compared to the overhead of doing a page table walk at all, and
> the TCR struct is awkward and makes fixing
> https://gitlab.com/qemu-project/qemu/-/issues/1103  unnecessarily
> difficult.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h  | 6 ++++++
>   target/arm/helper.c     | 6 +++---
>   target/arm/ptw.c        | 8 ++++----
>   target/arm/tlb_helper.c | 2 +-
>   4 files changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
