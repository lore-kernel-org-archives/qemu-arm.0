Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1832663lfm;
        Thu, 18 Jun 2020 10:04:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVoAupo84/yHXymuA/Dx5/mHa3W+PC5lS+MXmTNsrTop3N/yXnHBxfFCPKOCX4poenvMAK
X-Received: by 2002:a25:bb82:: with SMTP id y2mr7496863ybg.392.1592499864548;
        Thu, 18 Jun 2020 10:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592499864; cv=none;
        d=google.com; s=arc-20160816;
        b=rClf2/umzgd7+f8vOxPysbGNKFMO6jAsctCUWZIKM73zkcgQMIFU7fHDJv5T7Nu525
         Q07AkSZiDXWIqq0x0hD+/p7NLxWZjEwmpKDoKc0Loll+tq+BxELD6Lf8WfDQzNErCmTT
         gfdsZaSx4IYPJ4cDPJbXwi8YhbDfpmqTDHSAyvIjmUT0isYqRLL2K7VsMBgh2ftzmFeB
         hzwklQ6R7MEfNFr6AwPkLIpXflABPvRRT1G6wK+F3fERfsjqRKfNRCcTh8ELHgK7gM9R
         R9DY+J3cHy9nfJTqZa0nVIhghmTrU8ewU2mqFmLJmOLJy3M+a960l4EzpZCiM9H/AMQE
         FYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XMwdTeh6Ca2SHw0HFj2nt4XoTAl1LE263sOkbWy1azE=;
        b=GgshHR3St8i4Ua29cYXqKjLUVba7m0mc2l5TE/PdXRRKUftCvgof6mC6ZXoj1xSk3k
         YPwCOinOzieGBdi/UW9ZCbLw1mLHmD+LSAN4UTc7T5PIqp3ZK1XwiU4zi0KsKnuN78T8
         gQfhzDPDuWns8z11/Yfqirdx9lQIXBjmMDe1VKhfHVi9WfQ4jKMNX6o9nlAXLL8eLZ7m
         SdQTn65TlocegOEIjgqyabXZ7NiHZ7w33+BrS2OpZ89A/vAn+5H3ULNofS+XwAkXK8h6
         cvzjou3/bdMG0mOYk0YJYJ1KDAjYQGTA0Fv54nNlQhzPj6ix2eh86N1FP+VyRQ1CCIMR
         dIew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="x/ZisXDB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si2798128ybr.281.2020.06.18.10.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 10:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="x/ZisXDB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlxxf-0000rs-Uh
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 13:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlxxM-0000bw-8e
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 13:04:04 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:37111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlxxK-0008DP-Fw
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 13:04:03 -0400
Received: by mail-pj1-x1041.google.com with SMTP id m2so2954264pjv.2
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XMwdTeh6Ca2SHw0HFj2nt4XoTAl1LE263sOkbWy1azE=;
 b=x/ZisXDBJavy12M4vBEODGyAJHgUlspLDt3cNcntguwY96iyS+i9V3uMXc8P0Ej1j9
 79raFaq0FXxJZ7vF9INl5IUhjjTa4PDKQtt9YPWbMGKUiWN9PqOaAXbF5LQ4OrajqbZv
 EoRWMCvZS4X0Dnr1S4N+SxJGtYIi/hT1weQv/cXBl2dzSdEItk4pajKMJWjQusgAeaz4
 z9dUufTVCNszUsQgYwiJjygKc0OKm/3BuRv6exV8fkwbIVBlIXdjV5J7v0+N40htQA3/
 eSirH9s/oWrZTf9iz8EryZOXls9k/mnH9gSpH4ARMvFAuXU5VGipPzYzfPW33kzEYO0c
 Z/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XMwdTeh6Ca2SHw0HFj2nt4XoTAl1LE263sOkbWy1azE=;
 b=c2y8Tgp3f126T6/ymA5JEqRFVNRDcegi2gpKwfYb9j3iwUbOmBpj9qP5yDxlwwGHDf
 Uz0CPoyVQ+Qn1TrpFI15t2VUkjk8MY4+MwUexmbMzquNFlmgP6U9YGX/3LAk0GSDdvry
 WfJNpZ/T9+t2xhS0RbZAQj6c8z39r3dQe3UHqOmonNXL6AgTHiGP5Td5QYfcs8yZ17jx
 oaxI8r4rplNYeX1Jps9HlARfA0AS0A6afmqVPuz3zef4f36RX7W7LuInVVpjtE/M5Hbr
 Hy05D+pe144nvxaiMsomsTDzDq/A7Ly4CGA1hD01h/9Qb/uWQmDFHRn2BhlOGqkIk9oP
 yEOQ==
X-Gm-Message-State: AOAM530Tr+19878BXMDkreYyTLXnR4gtjhDLEFyk50ZZkncRfnaQ6BX0
 p0uEb6735kUvxqsPzdwx8+24cg==
X-Received: by 2002:a17:90a:1546:: with SMTP id
 y6mr5443925pja.92.1592499839719; 
 Thu, 18 Jun 2020 10:03:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id n7sm3040802pjq.22.2020.06.18.10.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 10:03:58 -0700 (PDT)
Subject: Re: [PATCH v7 13/42] target/arm: Define arm_cpu_do_unaligned_access
 for user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-14-richard.henderson@linaro.org>
 <CAFEAcA86dH_utZzXdbvwhB_67OgVGc249tO6TOBtfw+nWi2-7g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc120bc8-a08a-3b8e-cc31-e7c09e06a3a0@linaro.org>
Date: Thu, 18 Jun 2020 10:03:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA86dH_utZzXdbvwhB_67OgVGc249tO6TOBtfw+nWi2-7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: emvg0OUQLzHx

On 6/18/20 6:31 AM, Peter Maydell wrote:
> On Wed, 3 Jun 2020 at 02:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We need this to raise unaligned exceptions from user mode.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v6: Use EXCP_UNALIGNED for user-only and update cpu_loop.c.
> 
> Could you update the comment in cpu.h, maybe something like:
> #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault; also linux-user */
> 
> and also update the string printed by arm_log_exception():
> #ifdef CONFIG_USER_ONLY
>             [EXCP_UNALIGNED] = "linux-user unaligned access fault",
> #else
>             [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
> #endif
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

First, this could definitely be delayed to the follow-on linux-user patch set.

Second, in the linux-user patch set, I decode the syndrome data to determine
what kind of segv to deliver for MTE synchronous faults.  It would be easy to
extend that just a little to notice the usual syndrome for unaligned accesses.
 Which may be less confusing than abusing the v7m exception code?


r~
