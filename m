Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1407751lfg;
        Sat, 8 May 2021 08:57:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3hifxCeM84u2PEDU3X83D4YeIHaCmel9Clhmhhp7pjCrlHTDtE4COYkrUxdVcrS4bzY+n
X-Received: by 2002:a6b:f212:: with SMTP id q18mr12119016ioh.131.1620489432298;
        Sat, 08 May 2021 08:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620489432; cv=none;
        d=google.com; s=arc-20160816;
        b=yFPjTd7LTlyDVlvP5ElUo8HFzRQLs49HPMd97U4Oz1DtJCyZ/q60Ou5IlaX8LQeIl1
         ktSszspaXi6wmxuFQ3gC7Z4UnBbM+LZD94mwk93LDP2uX8vizcK2zE8DBnK2vbK9AD8w
         QR5JtoW16AM8+flBBLANXzIFkRKQxJnMGtDyuCKaylONbehsXx6yo3ly4rR/h1JmerDI
         Tr+WHn+6wkNmzq5iQk4X27/QCtEhZqg19AbloRrYwebNmTZNpNHKsuSmd8rPjvkGh/Ev
         kwnc/GtENae4CBIV0/MmeeXtYrruUqAjWD+kZDCDErY/QKLfE1A36k+W0Sg3FNQwwY7A
         mrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Bqmx/uvURESBCJv2a/JDqMv6k8Rz/fuc9l3vDY25PZU=;
        b=JdskFEP0qnKP69oiHo3d5Q3DJEX9ZYAKXnVOVVURRMBU7OpN/UOafoWxZMMjE6C8eA
         cIYUQDy1V7flCjJE9sOnLanRsnNutF0VDlGqXNydg1cOZuWCVban/3TWCYoRCUBNh0pf
         SgKV5CK8ZOC0U16GDIuwKQyCDmw1q2dos8zgry1r0lXhYfFvYt8J6fRMHI56e2A5Bzmz
         3zwuY9rNrmGtmIF0mc3u2vEQouXiU1Mb8WTWaJRFdCc5zubx4xS+wXiTxNCXDGz4ZQng
         02+B5zEA2Owa1Qvyvb4sLOLRjfRq71lG+sdbwgS0Lu0HRTtpuzUynpPHJ4wrbr0CoZPU
         3KoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v6+wFY3x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si9821136iow.86.2021.05.08.08.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 May 2021 08:57:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v6+wFY3x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lfPKJ-0005gy-Jl
	for alex.bennee@linaro.org; Sat, 08 May 2021 11:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfPJ4-0004A1-Dv
 for qemu-devel@nongnu.org; Sat, 08 May 2021 11:55:54 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfPJ0-0001bI-2J
 for qemu-devel@nongnu.org; Sat, 08 May 2021 11:55:54 -0400
Received: by mail-pj1-x1033.google.com with SMTP id ge1so6881829pjb.2
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 08:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bqmx/uvURESBCJv2a/JDqMv6k8Rz/fuc9l3vDY25PZU=;
 b=v6+wFY3xj7YtvLkrkeexidk9IICROCCQ+VAPiWT+mq/ceuQ9lEsgcpBfVAxjuFXmOZ
 Fl70w2AxZWrqvqeCYbCGuDituwU0iiXyGGWil8WvlXVlar4PjgOXdhQyagyXylBbo7w7
 Y0MbVNM1J9td1mXCVgdbMxc0rnLBZfo1zAOJYmMOExjZyW8/ob9bVdY7lEF6tkizTfZS
 nweUDUubYIyu2y6l593MFCHTwzoXWhfOTkepnlbYBH1qDYwvOBa4I0ZxkNXKTuT4gWL/
 O0fHtRZpPq2Cx3htmquyxNDRIQr/Ax19aE+V4nnXq4fN/VJp3fXfJeC1aI7/67MF1K+t
 Rv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bqmx/uvURESBCJv2a/JDqMv6k8Rz/fuc9l3vDY25PZU=;
 b=SmnzzL0mkpip0N+4jbGV5JOewHcRHP0ejqiHYaWNrorRFqfeIysUXQVo0ytNPNn8bW
 ncS38QnB1KRC2HiAk+dsKipP9cL25+sowhh/KlpC8qqJdRFLn7cP+y+n8dHZ2iQX3teW
 T4IVL831/klYa+p0BllGFwm8eshgVpA2aQclt0OpUzgx5pT7CpjZQnCTmsZoL1wfQwlY
 WdwWIkIJ279WCDlOBeAhzAr8FJm9DLMSf/u+0RW50G6oQZ83d3zywTC5KEpOYXsufXPV
 rJsnekamU+H8njSoP0188o3Ry7vJoURkM4cG4RBUrSN5zvVSJK5ymqgXEX88LcxMsGOC
 tTcg==
X-Gm-Message-State: AOAM532BrQGYLaj2NLN6xihpwFBfQ5bOc2A1ogIdWr6TURnKXzU9BaU7
 wvrbLGa3SF93Hms8AjnE7xi79g==
X-Received: by 2002:a17:90b:347:: with SMTP id
 fh7mr17290747pjb.23.1620489348282; 
 Sat, 08 May 2021 08:55:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q11sm7135024pjq.6.2021.05.08.08.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 08:55:47 -0700 (PDT)
Subject: Re: [PATCH v8 1/4] accel/tcg: Add TLB invalidation support for ranges
 of addresses
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210505030443.25310-1-rebecca@nuviainc.com>
 <20210505030443.25310-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8cd4710-3de8-15c2-2f2e-3ce273639307@linaro.org>
Date: Sat, 8 May 2021 08:55:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505030443.25310-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q8+zfPLvVWrT

On 5/4/21 8:04 PM, Rebecca Cran wrote:
> Add functions to support the FEAT_TLBIRANGE ARMv8.4 feature that adds
> TLB invalidation instructions to invalidate ranges of addresses.
> 
> Signed-off-by: Rebecca Cran<rebecca@nuviainc.com>
> ---
>   accel/tcg/cputlb.c      | 128 +++++++++++++++++++-
>   include/exec/exec-all.h |  46 +++++++
>   2 files changed, 171 insertions(+), 3 deletions(-)

I guess this is ok.

I would have switched things around such that tlb_flush_page_bits_locked used 
tlb_flush_range_locked, passing TARGET_PAGE_SIZE for the length.

I would check for a very long length and flush the whole tlb, lest we spend too 
long going round and round the same set of tlb entries.

I would not skip the third function in the triple, *_all_cpus, which is unused 
by arm but we have for every other tlb flushing function in this set.

I'll whip something up and post it.


r~
