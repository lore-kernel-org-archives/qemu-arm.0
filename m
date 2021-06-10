Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp542115lfa;
        Thu, 10 Jun 2021 07:19:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSIYEqcnvTVKjjihDPLtjDCmX7xZJL0dDoAQ6SsAVejKcQtotSu77goOTDbkoZZQ05Z8/O
X-Received: by 2002:a05:6402:49a:: with SMTP id k26mr5008691edv.279.1623334746621;
        Thu, 10 Jun 2021 07:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623334746; cv=none;
        d=google.com; s=arc-20160816;
        b=x/9wPFEuGcNoiB9NlflLDPTGECpr0wws1uU9jTDt68busTofVHmNvUeS7ZYajYXGFO
         dlaoxV1V+y+KMBX0TvoSWmebjaHLYJJB7MReTonQ5Ez7waFda3NZg76n6ZGvy0WaelMG
         ZAnFRWUbn7ncx9wE1YRzb7I+tzTT/xdxW8FDXOjuB1vxnxaBtXXDcrJvd97OmI2GxoX/
         rQDHL2PZFcL8i26HRqJa+Rn+Cl5qMBfYAqc3aAbPID/+5LOCObejiKJWT+hBtdOw5lML
         uPoxhT+K6ItlJdSVlFLae5wsGHjPUy3o5KhXYy6orWONHHyS0R03/X3ALJycn+voXOZm
         Embw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pykFNS7greJjkngIw6+Jdd+0wYP112UnX6arHFcrJT4=;
        b=RF29PvFJMiJErFHYsUgtWl/8MD4HL041jC7QBW9zimdggcyMvNdxcWcpdxnkdBeEro
         4UEx5w1ow2sZQbeV+i6wwZEBG+Am8dhyNC1RGHvr/hlLQwY8Z3o4BPvOKLCcNClL3ZO0
         q+y76hYTAVn4d9THc5OFb1NbuvzKeNY9e5++JgaMqRIDn7n5jN+oWRRwpjn3llQg8Vid
         pI9D8DmObBdxk66qEJfMy2f36hu6tR2tnEwbqOPy70NHoUU7m6dboonQmKMAMgi4fB/1
         YYRXcsQsmfBR0ExHQHbwEociU5OsEiLxkbAGtCvOYTcJnGXzNbR0pQCKUCXMuOShxBgW
         QuIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hzpd1r6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si2368578edx.70.2021.06.10.07.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 07:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hzpd1r6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrLWT-0004fk-Om
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 10:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrLW8-0004fQ-VU
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 10:18:44 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrLW7-00081H-BT
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 10:18:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x73so1736590pfc.8
 for <qemu-arm@nongnu.org>; Thu, 10 Jun 2021 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pykFNS7greJjkngIw6+Jdd+0wYP112UnX6arHFcrJT4=;
 b=hzpd1r6g6Tp/5SZRi8biUPJ5UgHh0ITvIfvsIsOh/4Yl2Ni7hrEnXUgClPY7SvIAgY
 UN1Kbnp81qL9VsASekZ6XKynHcXvIID2tmysCqdKlL95w1aMzpGuMinltYXzBsVQs7Ed
 C+UewBtUTIv30jgOasklg562ssbdsN1ScxMe9HqkDVseQdfe4ZMl9vwVX2Mym4At9kvr
 NuboVlFdQouvvtDtT8efLvc+jDrHZjPPIhYcby7coE9naGaQzALglLIqmkdYC8GD77Cn
 s2t+1bGlFSKx2STfOEwLJvAUQ2XrtluESF4DJq4Cqn5rcu+rACOqOxqpQtA6F8t6gxv0
 enQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pykFNS7greJjkngIw6+Jdd+0wYP112UnX6arHFcrJT4=;
 b=Xkle3qInrEloeAeJlrmku6LL39zmpVFqSuCuMK0dyv+B+vJJeHK+cNXdC8IFzwB+CF
 J58vryo+6vAEqH4lcmoo050tGlGYfQ80PB+A75OPJCUeDlkGskKgrGwebzDajWo9kaTW
 8vOhQXtzDwDEqdoVXScyH8kmwhqi8Wpu9l2yuVOZkJB+E0NyvXM+KgUe5N1n6AUCrUyi
 mcdgdH7WHgjqzFb2m+hnvSDpV7zXPTYKvt3TBe6saEtBxQe1gFsBF3a/bsuvIHR3rjK/
 5iw8EIsU7/qjiy2I5hYebq2U1+pvPrFCoBOphl59NUSyU5MB4g+vg1s0j1FT0CuUnqIa
 H/6g==
X-Gm-Message-State: AOAM530FILKVnZo5ywNziEJ8KsiFYryJXSb7ystRuntK+tofjt3DuB9W
 4N3FllmtHA6nr362CJJrhzFB+yBbN8KCcw==
X-Received: by 2002:a63:131f:: with SMTP id i31mr5185747pgl.19.1623334721892; 
 Thu, 10 Jun 2021 07:18:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 92sm6644163pjo.28.2021.06.10.07.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:18:41 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Provide and use H8 and H1_8 macros
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210610132505.5827-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4d2897d-49fc-e079-2018-b03100422147@linaro.org>
Date: Thu, 10 Jun 2021 07:18:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610132505.5827-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: vv5KJqa++jdS

On 6/10/21 6:25 AM, Peter Maydell wrote:
> Currently we provide Hn and H1_n macros for accessing the correct
> data within arrays of vector elements of size 1, 2 and 4, accounting
> for host endianness.  We don't provide any macros for elements of
> size 8 because there the host endianness doesn't matter.  However,
> this does result in awkwardness where we need to pass empty arguments
> to macros, because checkpatch complains about them.  The empty
> argument is a little confusing for humans to read as well.
> 
> Add H8() and H1_8() macros and use them where we were previously
> passing empty arguments to macros.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This is a big patch but it was basically search-n-replaced
> (not entirely automatedly, but conveniently most of the SVE
> H1_8 locations were ",     ,").
> 
> SVE ZIP, UZP, TRN also have Int128 forms. I haven't attempted
> to provide macros for that case.
> ---
>   target/arm/vec_internal.h |   8 +-
>   target/arm/sve_helper.c   | 258 +++++++++++++++++++-------------------
>   target/arm/vec_helper.c   |  14 +--
>   3 files changed, 143 insertions(+), 137 deletions(-)

Thanks for this,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
