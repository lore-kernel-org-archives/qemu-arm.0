Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3499656lfh;
        Tue, 31 May 2022 07:32:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFOvkjwlnZPtiyYtqR6Xi+L5rpoSkmrOVRwE6bvAPkrQPD8YtniSNKvJI3RUeRfG8rcyaO
X-Received: by 2002:a37:6658:0:b0:6a3:562e:b95a with SMTP id a85-20020a376658000000b006a3562eb95amr34907123qkc.745.1654007544912;
        Tue, 31 May 2022 07:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654007544; cv=none;
        d=google.com; s=arc-20160816;
        b=f6pzTtggHhxZhkSkyTXZQ70ztfV6U8AabOGgGyS9ocndEEMFFzrvjA2isc8sHFGv6U
         nWDdmnfyXEiLE+R95z5mJ+/NNmSQWRIXWgEpo598KbaobVgpRyRX1Nsiph3JDy6DvAiz
         mw2uRHpTp6VK8q4mPP82B4nJxuWJcvFuU7dXnxELw5QEjvW5Wj7GAWWELQcz19cL8SSc
         E90hzXOoCrKMyrROXKMr3m6yyU1RhAe56moSMXoSY/FHjq0+IecWCSva3ridYSsFtctE
         7KS2gn+HiGQ4W2ioZm5EYRYnHrB9pZc7fQENxsOoqy7W9hsQ+BghITloCPfH3yzSVj0X
         /DqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3AXIJdEPmzez2A1nnD43US2+aGxHHZqDgzDb+qv6wCs=;
        b=GLQC4DAFRhZCYkatngGK33vrhxyT92r4EJBGIeEQoyO8saDoZHBW6HhAR4RP9T8Hnm
         r4Dr98wrv6bxtSRd6/e+CqBEIuvdEwFaTJrtNpKvx5M5MarQk3Zp1whzhRUTLIWCdV2Z
         NyOE8Eo+whmWzRmJs57w3XitQplKJHbG2Yi5aHBFi8LIC+XXsUtZOmoSEv6UZSZ3kKGb
         /5VP5Q/f/D2Tzfq3a8VH8CbjaL+fFys5i44xrPF767lVzf0hbKmKEJJ2hKJoWY3sZLss
         ekpqbmxTgU6efP4R5pVHyvDhS38T3e3FtUONy86hZhLyAcL8a9ZmPN+N0tSioWkRO+R3
         Glzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zDFxU0eX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a05622a180e00b003019c388477si5097553qtc.606.2022.05.31.07.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 07:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zDFxU0eX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw2v2-0003J5-9c
	for alex.bennee@linaro.org; Tue, 31 May 2022 10:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2ud-0003Ha-9U
 for qemu-arm@nongnu.org; Tue, 31 May 2022 10:31:59 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2ub-0004aa-7k
 for qemu-arm@nongnu.org; Tue, 31 May 2022 10:31:58 -0400
Received: by mail-pg1-x529.google.com with SMTP id v15so12993873pgk.11
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3AXIJdEPmzez2A1nnD43US2+aGxHHZqDgzDb+qv6wCs=;
 b=zDFxU0eXZYXQRwU3rSCaAzDsBW/iq/K5xSgnfNnRquX1pdXCtdrqvQ3QW0K3A1gQOZ
 /2luakm80G3FENkE9IlgL+/9Y1mHSJBF+Ye1nQ4G7DEts4yAEddPWptJCW2WBhkWktb2
 JlhnqFIjvwj4m5jD+ivZYNYNoTJUPs8HWJm+/Id0hmA3hbMwhIRkrXXv12R7h42rW0mA
 qvIOk0idtqGeGuTA6VGofMpScRTcpO/GBLLeYvg9HOiLwK9PZ6uBJ3H0LlX/EK8NczAn
 /j9Un/vZIuJ6xmlQPJOTcB9bJGTppWxyCaQu1JmfM8iPlrukaEg6PH389KHS5mUzQAGL
 /ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3AXIJdEPmzez2A1nnD43US2+aGxHHZqDgzDb+qv6wCs=;
 b=fBiKFEFoCbbnRh70P2L78QeUB23S7IM4g8zL8N4p5Wy0uvd7giZedvTsWMBvkNnr/K
 7YPdEdwJu8BDBW1fJq55rGSU4tPijxhDRVllBKL2uoo6FR8dvBdblqopJ7d0q4J/iU3G
 A7nw1HOtGOTDLP+AXaMWaeAYfynE84IaaGFgr4aOX6+dx8Yj6vEZXKyOsuuRFRlf7Yck
 lrPtpDYTR1rB7h6kzmFfIq0iizAarZ81ACLxxM5aeo10xDqaxHBRgXbQ+YpeYm5puJy8
 OSgUM50EUwgR5w2t8QVhbtf5NY4QRqSsGBhuIRchFxijOgoudRZGolwqJjp9i/u3dXL3
 Q+qg==
X-Gm-Message-State: AOAM533bgAw3+kE75BXEQR75XPqmDam44jk/ENaOUYnvzBnc+p46iaJz
 JdBI8xzgLKN55Y3u07qii1duxPbqfsZUlQ==
X-Received: by 2002:a63:2b02:0:b0:3fb:fe88:8a8f with SMTP id
 r2-20020a632b02000000b003fbfe888a8fmr10611430pgr.247.1654007514974; 
 Tue, 31 May 2022 07:31:54 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4ae9:ceee:85cc:a70c?
 ([2602:ae:1547:e101:4ae9:ceee:85cc:a70c])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170903204b00b00163be997587sm6177077pla.100.2022.05.31.07.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 07:31:54 -0700 (PDT)
Message-ID: <5b2a06d7-4b2a-e24d-0630-1dd41a12dbf6@linaro.org>
Date: Tue, 31 May 2022 07:31:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 07/18] target/arm: Hoist arm_current_el in
 arm_generate_debug_exceptions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-8-richard.henderson@linaro.org>
 <CAFEAcA9Z9cc_K+JC9z2K5qKJ=zOUcGJSwznsaX=7t+5edjNMiA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9Z9cc_K+JC9z2K5qKJ=zOUcGJSwznsaX=7t+5edjNMiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: MSsBfj2r6t9r

On 5/31/22 05:04, Peter Maydell wrote:
> On Mon, 23 May 2022 at 21:58, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Read this value once in the main function, and pass it
>> around between the subroutines.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> What's the benefit from doing this ?

Just trying to reduce the number of times that arm_current_el is computed within these 
tightly coupled functions.


r~
