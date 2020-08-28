Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1562401lfc;
        Fri, 28 Aug 2020 08:39:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcE/P4E21BUimQxH6GRPRXN3z0MH9WRLKn8YHmmx6KBqllYXjV58UKKF7CUG24WWzYn3MI
X-Received: by 2002:a25:aa86:: with SMTP id t6mr3208358ybi.213.1598629158561;
        Fri, 28 Aug 2020 08:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598629158; cv=none;
        d=google.com; s=arc-20160816;
        b=LIplPMr6dOIpLou1AHzkWW47w6js6JHLoE9BXatbg8hwNprAOaAWsWePFLZf1Hbu7b
         rf4Cp1BygJlrM9sJH7OorrDMCziK6etV+9sQOiAkC+hmlxKm3IJw6jSrkGjWW0sI65/T
         6uKvVI0g+MT/P/rl2FofxCIm7VX3nBDPiYpH1lXCKbjRRdh7Idu7dNfdKbrDjQOCssWi
         p2BkGolH4w7OL5qFIeX/ci57rcFYY3oL3yvoAUK/gPz6yBOLaVU1ixTqRkm+ArGcT6g8
         A1XjL6knM4ZnTJr052znqdCOMJnIyYjrcekgcjnWzQq5nllBDeStj6cUbXVOT8Qc4Qnw
         lA3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AtqzV06UXbTReoASyo8X3FegEkuwucufnEa7IYo/6FY=;
        b=zYZfhxnFxGfAqAjeVie17eKK3t5fcipWy4/rlk4c3U5eVH81DDtXtY+tb7HjgRZ0v2
         VHAG25XAGVA7tN1ZbzGYW4Ff85tCB8t9RAnC3loS8pjmEjb9eoSOTmDSyh2DybG9y7jE
         WqW3mMd8tEpaJfCt9Y2cx0+qmIp8eQfLLW9CSEjDLLydYFdsgW6xghQKAs1TnLYmfIzY
         KCjHGL2ZKqcdj2ZNiz6tmkhW9uDhsIHAdvPrdTdf+yQZTz3aCiqIbv/jhkz5h8EpIDJ0
         qn3Kf92xIDWNzFx9C8jHwu4U7Qk7WCGE0cf0me5mTvGSPLg5a/VCFLTAFsuKo53aXmF8
         gF4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWhrmPPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w138si1170324ybg.423.2020.08.28.08.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 08:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWhrmPPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBgTF-0005aG-Sr
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 11:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBgT8-0005ZB-Kh
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 11:39:10 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBgT6-0000cy-JV
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 11:39:10 -0400
Received: by mail-pg1-x544.google.com with SMTP id 67so604790pgd.12
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=AtqzV06UXbTReoASyo8X3FegEkuwucufnEa7IYo/6FY=;
 b=yWhrmPPwT6+1LTF/IxjNQc86/CZXwjegmz6AtI8QZWsn8q0nwo7s7uy663Jk6sNrWA
 bmOfNy6vOmpY4dhru0cozbXfBEJg+OwY8wCD8krQNOFf0SNo4ppOuGgDhqKop4q6W+xm
 QLxaV4XrVgoZx2leakEaExxSekG7t1siZQ8MPj0W23sBgWS/yrS3wicYIytR3T7hUP7H
 ZZm9DcX1xRlkP8fboODrUWAKSCtZMS3Fd8lxXBuBctz5GM8WWF5DwdPJLQsTrDrWCfa+
 DL2MW9IN/SXVEmCdMdJkuvLUtbC2yJcvAI6bGe28erFmD7Kjl4ZHcMBQgznOendCpxPC
 vbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AtqzV06UXbTReoASyo8X3FegEkuwucufnEa7IYo/6FY=;
 b=VBw8AD52daZvQMqZvfYAKy1qRrwidJunDZluFdCFH9ACkyXNR+S3RZW9/DQ1oDIdWb
 cAkqfuYLWN1GjTXRj3kRhFPQCjfGMDzGDOKBiHyINEe66BLkKR39x8FKQSBz8djW5HDm
 qDdbH7Tarl+fJpyetNYWuL2aHvcKsZKos7coSd79lK5F1ZdSLt56CvUgUrh9uJlUlQ1P
 ymzXT8DVkbxrB9RZWVSDsBi0zw8nxXwl3t3HoY6BUqpA0UEFT/dJptODMtvioQcglDPp
 uVwh2+QFl3ixYiwKcubqko45c18QP3IfLo3UaMjzY4uWipZuw4hkqtCsYrz/kfNFQEab
 eGZQ==
X-Gm-Message-State: AOAM531wsxssL7JR4EJ4BnSBue4Oz6pQ7g24bnhviA4X2xNxvEwAoLC8
 S0bboOgPuOkjo25YoEQtjU5eGw==
X-Received: by 2002:a62:6547:: with SMTP id z68mr1851466pfb.286.1598629146862; 
 Fri, 28 Aug 2020 08:39:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id kb3sm1480691pjb.41.2020.08.28.08.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 08:39:06 -0700 (PDT)
Subject: Re: [PATCH RISU] arm.risu: Add patterns for fp16 insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824143127.23170-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3745cf2-d0b7-d451-6ea0-83c827efe0ca@linaro.org>
Date: Fri, 28 Aug 2020 08:39:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824143127.23170-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OfOeBFZhKWJk

On 8/24/20 7:31 AM, Peter Maydell wrote:
> Add patterns for the fp16 half-precision floating point extension.
> Where older pre-fp16 patterns used to include UNDEF encodings
> that now mean fp16, constrain them so that tests generated
> from those patterns will give the same results on CPUs both
> with and without fp16.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
