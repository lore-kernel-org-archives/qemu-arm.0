Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1429708lfb;
        Mon, 6 Jun 2022 07:58:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySa5dDvVidqer23Z0KF7I5O5IbGq1PN9bTCfFAHq7O3a/aSzqZQewnleXWv7vH0LhGE+0F
X-Received: by 2002:ac8:5f91:0:b0:304:df67:c780 with SMTP id j17-20020ac85f91000000b00304df67c780mr13462986qta.248.1654527501461;
        Mon, 06 Jun 2022 07:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654527501; cv=none;
        d=google.com; s=arc-20160816;
        b=gmNaGJusc68PRoPiz4jU2x5zISwnJvscI7NZktCOs380x8Z7/To6blCJWQ9lLKGPYe
         hjLM+iK1uu3FSzdzDWnoID1vaskK9blJeh+HkW0MIT8U0w0PzrI8jYR9TyrClkcrRs4q
         PXI4VpS6EkJsDnmH4Zx/b4AMjYbMJrTF8uLCfoV5sqAue5CZE3V/A4xLlhCZE8wdYQmA
         8CGrQsXw4IE43y6VBmgDYuB6rZ7fjnlmBfw6B5vhXIDk2j1pX2Q8ln9o9z7wp9oJWlVz
         EkmoWu9Xpz0NFAyoJgsTeLV/bDwCLe0S45Z2vMio4h1udc8srr6IetfbDETDvnz03vIy
         94zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0fHEwGcdjeEU1fGQ+84Um05tCKjCXvmlD3g+5THTYlQ=;
        b=XC61uURxrmXV8IqhEodW01XiR8Qi+d3u+b/0rL9AHX5lYD885jxhfgLWjn7l3viXyk
         Lxuh8wnCxqxdRffTkiHkbyn3PPfrrFlB0nXm+oisBOV2EnFjxzzHxjvqqh/wMDZ8FDPV
         anAz6R0jfgsYhqnTe0ceDuwwRQbOYCvnj8xZl6y8vPMnfutjRSYMQ4SipvxvrlccUyGY
         2uVeW4x0nENkjIEDCyjONpwmHZmPSF6MxVUIiaCR1ya9gkQs1IlyFHDcOZRSR6ZLTAnq
         VKsd+KdFg3FJ9JB2fd8nBeHDvadCajybex889Rg9/DlQ5CZSmDtmTBwXH4dH2jKCZg8m
         fWPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcBp9vwS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020a0562140caa00b00462663ed5afsi8041483qvs.580.2022.06.06.07.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 07:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcBp9vwS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyEBQ-0005nH-SM
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 10:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyDsL-0003za-H3
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:38:39 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyDsF-0000oI-JA
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:38:37 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso18020186pjl.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0fHEwGcdjeEU1fGQ+84Um05tCKjCXvmlD3g+5THTYlQ=;
 b=KcBp9vwSRxY4QvjG7ZfvR13vJgDuwwe5h8Stlwuym/K4AqxXfPkytKEK4L0YX6FKzW
 QHetAqJP1i0puJaVOPdRIGsByElXuXSsVNrJ6zPsGJ6iornBOTzTm7is9IX2Ck4SX1JB
 TwD+PEzvei8imx7YdUbb4Rq+t0IZxmZ02Og5gt8XSN2I15QLfy6rjGradIDcmfQX2Bx1
 RKJTzxrbVz/M3XDITjFuk8NgP4Bpg95ZM01ZLGP/me43YQ6U/tXvHorMR1DAQpqPpQxh
 zG2PPZmj4m9tVRi0eUapZOZaaFvHHJBi3d5TM8UkZrH8IcSI5flkSUquohOE0KBCzJ7E
 plmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0fHEwGcdjeEU1fGQ+84Um05tCKjCXvmlD3g+5THTYlQ=;
 b=biVrHNyLOMCQiu01MNf4MZuZ7MNujqwrm88GZ6GemcjaF+zIXX1F9LNqenhP5jKKZX
 Uf43KmgnrIj4W6t50+7IdIo5sV/Qzuy7e3Qg/82Tvr1e/En4jz15DMIzbK5NS4SGZsVJ
 t4je9A1rT83jowtfMFFuzJxxB85tDAQ5CeoA+wm9vadr6W2gc5WigVIRb+trE7YD5i7A
 O8HT4iYHZ4ZGETIBVbINhSBqF0VgDORnDl+jRRBQmApPovSBmZxIlJcbeetddVqzqDBg
 knuHwUWqI+Yu0tFUXZKqeWqqnmNNEJWv1iUK0C2Y2gjcplk2YS0Axt4qN8CyiYFi6fCZ
 b9Bg==
X-Gm-Message-State: AOAM533MU9F5SQzrQD2WvKk35zbxJyvoreqO2Ts8zBga/GmihRaNOCtE
 4Hkds+Hze8ZqMge814TYiehysQ==
X-Received: by 2002:a17:902:bf4c:b0:15c:3d1b:8a47 with SMTP id
 u12-20020a170902bf4c00b0015c3d1b8a47mr25112815pls.118.1654526308728; 
 Mon, 06 Jun 2022 07:38:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:dd1c:9738:3e40:ffe0?
 ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a170902c38600b00163de9e9342sm10676729plg.17.2022.06.06.07.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:38:28 -0700 (PDT)
Message-ID: <66c22a01-5d92-4e0a-7a8d-bb4ce89151f0@linaro.org>
Date: Mon, 6 Jun 2022 07:38:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 21/71] target/arm: Implement TPIDR2_EL0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-22-richard.henderson@linaro.org>
 <CAFEAcA-WQOhsEJnQ1f1_91=ReBCkKkHgkgDh=kyQq6pFY78hQw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-WQOhsEJnQ1f1_91=ReBCkKkHgkgDh=kyQq6pFY78hQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wmBLBlZfjXAV

On 6/6/22 06:18, Peter Maydell wrote:
>> +        if (!(sctlr & SCTLR_EnTP2)) {
>> +            uint64_t hcr = arm_hcr_el2_eff(env);
>> +            return hcr & HCR_TGE ? CP_ACCESS_TRAP_EL2 : CP_ACCESS_TRAP;
> 
> Do we really need to do this rather than just returning
> CP_ACCESS_TRAP and letting the "take trap to EL2 if TGE
> enabled" check in raise_exception() do the TGE routing?

No, you're right.

r~
