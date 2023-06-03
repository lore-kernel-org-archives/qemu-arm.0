Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2007890ejb;
        Sat, 3 Jun 2023 16:19:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+A9H0luoEMR4mlpelP+WaLV3BgLrQ2T/IlrQ57VLwqFKh3dg/m9NnZWT92ON2hi0G1wZ+
X-Received: by 2002:ad4:5ce1:0:b0:621:7d4:e068 with SMTP id iv1-20020ad45ce1000000b0062107d4e068mr3475247qvb.52.1685834353650;
        Sat, 03 Jun 2023 16:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685834353; cv=none;
        d=google.com; s=arc-20160816;
        b=0XCNJw0ZtAjkk4acyLWIlq7R6hYj+/rZpEdZPnNi6IPEd16X9P8tCE3Iu8yZJ8Xm/3
         DsEusWeCiEio/YxEZe9IkqO206hLHEYhPbk3YOFMlNHDPVsttk4GDhA7tS19S2j/kgne
         LQvIL7/cW7vA1sq7xBgMJEoAhOtLgVb/I+FM7ngjlQIwQpOdw1MwCbF5LIO9rhntvNNX
         hnPqUHbnpqc5dEKOL17RgL8XSHMVlr1FFBI1V4JSKarkAZWRjEiEhiNiwXzai4YWbA8k
         sP6tnkHFEcvr/WdswjinX5pYUy76AYtdEsn7Jrj8SpeLpcjkK40esrAUlbGHUyvM+f+y
         kAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=SBKJN6M0puF5S/I8Ke6O+y6jITI4KoCp2yj9arzwVE8=;
        b=ZpgEO7cyh2/yp05LXRQjcSmXpLMWEub9VN9O1ASD5o/f4aQ9ACY1VTmQ3ArnAg+cyJ
         2PCgcMywMpMESUkmmuAI8qGeREkmQh1/SPRxRwpS+6MoTBt0YdI6enPSxMy9AZ50DG3A
         g+85TskUcGgMxmAKSadx5d1vJybT693WpqlDT42pr50PxwcZn82nLv2MzRklXxdSQPWi
         AYmDCwT3soTW25F5T+eiN4bBQ2F7T4i436yuGThOKC9N3529OP0yTTutyL6CBEBHhlCs
         JPUGtdV+/ihjcFPgxzGKzLY2pblDAHKEtF+XLL1usWD0zTQooXO/9/TA4QG5Jwn5lt8u
         3BIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VO4JzfOM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn1-20020ad45d61000000b006262021ac11si2940544qvb.258.2023.06.03.16.19.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 16:19:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VO4JzfOM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5aWd-0001Xg-Q8; Sat, 03 Jun 2023 19:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5aWc-0001XM-Mb
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:19:10 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5aWb-0007v3-7m
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:19:10 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-53fe2275249so1873080a12.2
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 16:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685834348; x=1688426348;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SBKJN6M0puF5S/I8Ke6O+y6jITI4KoCp2yj9arzwVE8=;
 b=VO4JzfOMNrUVGdt+V+SMK4JDi9BF24npjtLlBg9XihvXp3Y46HMkGg/2141Osvw8HD
 0K2L36e4mCmT9qVQS7BLd+CokCn6rXuz6c5zmSwZim2ZeNVbAkXXCGNAtwp9oAM0CDOV
 UHjxrhmAjPHtNq69s5769L9AVu1t8jUNdXPEguRY2XeLDZwuL7CjoHK+w9ENz9P04/TR
 e//CwjTuq2fw/8o8xYivz/41oZw0uWTagpYuIJg8mNj+cY62OCAoKWdNHsL5Fdpnb7n0
 moS3lkjX9QA7u80vhXk0djWzr0ZekJtaVjqJ8mBhiKnT5Z7OkN7AvAixCTbLKLWFDYpi
 7MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685834348; x=1688426348;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SBKJN6M0puF5S/I8Ke6O+y6jITI4KoCp2yj9arzwVE8=;
 b=XIUvHYOY8mW8/VSgIBmsXaXrV9GnB2H16b3+yW7mkHadODg9HgWljvvY/vN22peftM
 WMX3K6OEtuHYmFiGsFsIqSOwyk946pxv6w3J8IfjjXIjMayuYVm8JhadL1rwPHJjVChE
 0pHoXJP3/1hmkMsU53PLWpVNTORP7HUwrr4ywkP9g0DXJdqsXrStLYs0wJZiT+BY2kaF
 nkvXR0lMKwKjnYka4gGjvy5eHzumuFJyqCxY/suSa/Uer97pK/IKsJrExTdN6B/lizbr
 gEzgN5KZ8RxsioUkCvDXtC5KrSm0vid1ixul44o977BYmKxMe4cRcLFddUzmdPbfT0Xg
 SQuA==
X-Gm-Message-State: AC+VfDwZSoGS9RAEv3EOxmOEO41djLoI2pIPTB0KaE23hh3rOvyPPjqG
 H0SsjEaVFdhEZwI8d2Ycldl5jw==
X-Received: by 2002:a17:902:7284:b0:1aa:e938:3ddf with SMTP id
 d4-20020a170902728400b001aae9383ddfmr1495785pll.7.1685834347700; 
 Sat, 03 Jun 2023 16:19:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902b78b00b001afa7040a70sm3671353pls.276.2023.06.03.16.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 16:19:07 -0700 (PDT)
Message-ID: <171feaae-4442-e600-0a25-d53e639bed46@linaro.org>
Date: Sat, 3 Jun 2023 16:19:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 13/20] target/arm: Convert LDR/STR with 12-bit immediate
 to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0jhJOBNrNpgS

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the LDR and STR instructions which use a 12-bit immediate
> offset to decodetree. We can reuse the existing LDR and STR
> trans functions for these.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  25 ++++++++
>   target/arm/tcg/translate-a64.c | 103 +++++----------------------------
>   2 files changed, 41 insertions(+), 87 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
