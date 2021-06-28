Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4138660lfg;
        Mon, 28 Jun 2021 09:12:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYuCOaovR9GyoQYXiDnDxo+ETqmKaEdQNhrMRfshYld9QQkaDyDCxT6K3J9RrCNtCi30r5
X-Received: by 2002:a25:f827:: with SMTP id u39mr4797168ybd.100.1624896778655;
        Mon, 28 Jun 2021 09:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624896778; cv=none;
        d=google.com; s=arc-20160816;
        b=0J0GtWRvBtJfAf5mr/52IUM1JnXgQhVfUdTzyRsUuu7oEE/vxAglTBbZyJTCI9MUxU
         oUWnFksDaJelOj0g3yUjM4k30wkZ3bq0ivPnj6nV2onVccbu2y+szUA7tFjKxk2QXSoy
         iEDaOB/86PoEmcz9xrdWI3rUGPtqRdxY5gsMRZ5iI/Kuxze2Kl9Y1BARJLdT5CWqIIss
         /V7Y7gVyPTtzPwyLtN/VLzMCm0Ast748F/JkTKbJj9En0oki0/fwReq7PTdb9pLeHCza
         lULXlzjv6pPePrjoKizk8SbuzuBff9x4j0ZG9K/rFKhijAa9AsS+JhjtDWduFPovRGT4
         6qyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=eGEQuXWauKoQEzNunf0F69x6k39r7rxqMHMM1bpJGiQ=;
        b=b6RP4t8TzLPC2xINa8zvKnuAv4AiMSjS+EGagWDDqcmNX/Mns2AWFUDmOKyQnsfaJo
         RzR+rY9DEh/GSnNI/j59U9UDcds7cwt1TVFo3RX6p5XOjAvb3Msg0vhmMZ/RwQzGc/mm
         z/cvjmRanEU6dlsyTPnYeUZNvWsAYrtg8J5JpysKrf8OtGLbr9QdGMRvP1djaokP7Ik5
         +ajeAm8o1Qgr5dcw0h+7AcXrZDP104sRAANsEgabYk9ZiKhtJma3GFS/ZdCDOBJORf9Y
         93Jzw3/bbaJhUllwbdmWruYrg4+wjhqDKu7AzpmYEm6lACgxXoFgw3LPM1N2HFUSl8QW
         b7Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JmzJaVHH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z62si15321089ybh.16.2021.06.28.09.12.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 09:12:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JmzJaVHH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxtsX-0007jS-Vy
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 12:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtps-0001ba-6V
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:10:12 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtpp-0002Fn-Ac
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:10:11 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so13214112pjb.5
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=eGEQuXWauKoQEzNunf0F69x6k39r7rxqMHMM1bpJGiQ=;
 b=JmzJaVHHXLWeLE9WkaedO4RAE0yUoacfJssp0msNpQlVQRchuHoWhbL0bsU+AGOhiK
 u2pIIS2hUfucCXFWp0XHwdvvjR6WPJuzDG8hU5nknxdivrdRrT45U/MFCAmTf+4KRAjS
 vtL5DfnVMU+Vko/o0I4m6YXiO20xvHNanSY0/MGTKMT0LcdsD12YpwX7G9UpicbVV48J
 i3FNAYMYYbGKO0/kfQ+d2rw3f60JBWx7RypGhYSW0dCEETj8QJcskkNF9Q8EKenpxSwN
 XMvVvlUdGsASvjKOyiWZesn6NIA2Sz1DtmR8ha+SUmddyDbqM92mgfV34XiS8OJ3VaXj
 w6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eGEQuXWauKoQEzNunf0F69x6k39r7rxqMHMM1bpJGiQ=;
 b=M4GetwesT14Iwrdd1u1DzdwRDXKg+peSd8RjaCl540tObJAz0b9ZmcwnrhWziflixX
 O891qttTV7iBka02aSjCLilhYhrQZ/p6Ng+sJiIAE/AL5oWOXyHEMO8w04bVT/Q/N81R
 H5H6nB4GXhmxkBNpC1NAPR+y4ToS1ueBNjWH91aJ3Cay0h3b3yUPFL3FzXOTfaDI4v9/
 k9zoHNbN8h4geYR9UUrQvpACBROSnZss0JV/VSMd01kkxQQIAeGjWDeftVQ0WxJblZ7b
 tb9NsJAtDF7WzEBe9nY6BgfnwTHEFoRW+rPJhbqwbPA4q1WjJU80IjOaUZfZRdPyW773
 ysCg==
X-Gm-Message-State: AOAM530v+HqbBYRLr/pWZ6ndNbL4ZGuK8+WgFRMl9jQujdvczSFBLov0
 6wjZp1V+gk1dZEBSqeWYfXt9gw==
X-Received: by 2002:a17:90a:3983:: with SMTP id
 z3mr13718148pjb.7.1624896607792; 
 Mon, 28 Jun 2021 09:10:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b10sm13741311pfi.122.2021.06.28.09.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:10:07 -0700 (PDT)
Subject: Re: [PATCH 07/18] target/arm: Implement MVE vector shift left by
 immediate insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1dee073d-cb7f-b446-53fb-233f1a9349a6@linaro.org>
Date: Mon, 28 Jun 2021 09:10:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ld2Iw140r20

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE shift-vector-left-by-immediate insns VSHL, VQSHL
> and VQSHLU.
> 
> The size-and-immediate encoding here is the same as Neon, and we
> handle it the same way neon-dp.decode does.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 16 +++++++++++
>   target/arm/mve.decode      | 23 +++++++++++++++
>   target/arm/mve_helper.c    | 57 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 51 ++++++++++++++++++++++++++++++++++
>   4 files changed, 147 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
