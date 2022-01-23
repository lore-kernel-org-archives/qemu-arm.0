Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1454664lfk;
        Sun, 23 Jan 2022 14:00:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOktZ+75k9n9GjMnumr6Rx6WwCS/br+RMG6rf31IStLCMkwNXsrEcRHxXAdDOEI9VsS/4c
X-Received: by 2002:a25:80c9:: with SMTP id c9mr19319828ybm.28.1642975244566;
        Sun, 23 Jan 2022 14:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642975244; cv=none;
        d=google.com; s=arc-20160816;
        b=I2ep20IMSGlh+a6y+NoIMkKSHwWxKl5E2G9eDbMXgaPGadk89l+YRDrS7WKzaLZ2ww
         UMwIWPXAiyn1KdsGvmWLLamLxEECS0UVBEb9HOGGohob+C2n9CLWXqg+cREZzLV+6I/V
         LpZbfmyPWOVAtMOkyR7YxUTWEUw82IHKOkKptztWoLIVMh2tJeWKwy4cyfFULpBYSk2I
         t5fcCMyifQCNufrkavKnEsnDxKmwrZMy9Fj0pCG+6/hX7ilGeCpd9o6q3XAlLXM4X+Vy
         X4Aj93Z6lJeDmqDoPFMKHI463lnEhYV+Zj19KOnX8/9ncnTNEnckjGNzKDpumWFRK9LA
         ca1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vyQdglQQf6LQxfFims00DuSWDalXayUBNTv9fkJDSGM=;
        b=Pm5/ZST9+fha8OqIUprrN2MSebLnZxQh5CtV8+qNHLTwro1rB7aFeQLbLvtyoHJiO4
         jE0AwBVcIqIKUCe/caeE8IPeonjqNDEIZwS/lgTeXEQIf+YzTEm45THNWz9q9bBxeLcw
         acA4A8MFmq0Mg3UL+vHTD98a5PHLbYFI9wXojYQGfKW9pDGcwSSqdXTtQdOlH9pb8yW8
         KEGk4d66MY3L9Ml2gcj6DsUEXNs+4uPU8w5z8C2q/sc9HOuBTialMzETqVumXWnB5T01
         Roz1GfQUQLy629sy4UoktgXU521lJQEMXsaDBEXySjq67W7QigaIAPJLSnauAUpy55LP
         0aFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=n1LeeyGS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g206si8769655ybb.436.2022.01.23.14.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jan 2022 14:00:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=n1LeeyGS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:42604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nBkuh-00017k-WA
	for alex.bennee@linaro.org; Sun, 23 Jan 2022 17:00:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBkuA-00017A-AE; Sun, 23 Jan 2022 17:00:11 -0500
Received: from [2a00:1450:4864:20::32a] (port=36648
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBku7-0004cY-JR; Sun, 23 Jan 2022 17:00:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso31497070wma.1; 
 Sun, 23 Jan 2022 14:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vyQdglQQf6LQxfFims00DuSWDalXayUBNTv9fkJDSGM=;
 b=n1LeeyGSqvBwGb3AuZao2ZbL8tBnB4rh5zL/4G1gTWmO5sxJDuKVLcqQVxeb72WZk3
 bg/8d3YTYkg62XhKnp16kZRiSPGnWglDyZSeigcR2yoE83QghXltpxGIG7AydpMWAWOX
 WUNgeU4jyLTrD231sATzPc2WCxui43SuM4cebT5CthsPORROWVwcFMk8rg00NDOlr/Nk
 hiehoX6N0A/HiLjkRRVgP5loy9VWxx6wwZBwKl6fRY6o4Uk2XWYjt4vMz6gu/UdaBZyv
 rcHn08NwwMRB8wcaMpcBgwQGSF5T4buCaD00Ly4Lz17VGRERpCOqfc++lwCh9PGlWTPJ
 9xJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vyQdglQQf6LQxfFims00DuSWDalXayUBNTv9fkJDSGM=;
 b=5xLIFnu2K+SPPUbtSWgildtR+h3qIr+jv6DH7+ESns53KNCrb7yEtmOMEtVh/W19rl
 9PfXwi0rVRJmq07lg+6pDbL6CpbCrpC3+52/R6KBqjPSfDJed659j/OfioRt3QnLC8Nl
 M+6hiKtaAUxssaOjIwyz5GGaxhs8LFf0wUbxLeedMhckYvi93+NQ9cGi/1+O32Py+Em+
 ePtYFCKbg9r2z519cf+fmjmrNR9F0EFhSH/E2qoCC6liQGKmoAWFl5+bOEne2UZpFk8r
 QnAD05Y0lKS/xaWWSEThLPDAAqhe/DAqwm/fc2JIOOXvTs2sfbZKdhQehXGE9lvY7rb3
 Xktg==
X-Gm-Message-State: AOAM530Abzq874z2ZjMEj9quo8Ou09zZuCKSYEMn1AgDLR8VjDDl5Qx9
 SvI3F+KnbJkwxkdAjQBMTdk=
X-Received: by 2002:a1c:f402:: with SMTP id z2mr8962678wma.28.1642975204921;
 Sun, 23 Jan 2022 14:00:04 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id x6sm14641681wrn.18.2022.01.23.14.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 14:00:04 -0800 (PST)
Message-ID: <ebb8d96d-d413-70d9-4293-c17970a32ca1@amsat.org>
Date: Sun, 23 Jan 2022 23:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 01/14] target/arm: Log CPU index in 'Taking exception' log
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-2-peter.maydell@linaro.org>
In-Reply-To: <20220122182444.724087-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: a63KH86SEekq

On 22/1/22 19:24, Peter Maydell wrote:
> In an SMP system it can be unclear which CPU is taking an exception;
> add the CPU index (which is the same value used in the TCG 'Trace
> %d:' logging) to the "Taking exception" log line to clarify it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   target/arm/helper.c    | 9 ++++++---
>   target/arm/m_helper.c  | 2 +-
>   3 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
