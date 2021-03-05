Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6728547lfg;
        Thu, 4 Mar 2021 17:05:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfJgB8fNtKZ0n76O5WFOrVPg3J8eXC64389aPRnuSFvcyeJazO+gL1TFsG4XCVyVLGbinH
X-Received: by 2002:ab0:498c:: with SMTP id e12mr4553765uad.10.1614906330141;
        Thu, 04 Mar 2021 17:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614906330; cv=none;
        d=google.com; s=arc-20160816;
        b=xOmXENyKvJk4FBJNW/qZ7vcHgYw8qwaGgAIQntXFQ/WuG/Qqcmi092E3zsWLXqyJQw
         8t8kdliZfF/jfIHnZDJfS4pqdaoqYv7T6rSVLe9ETHWSAwsOSuNV4KRwwgtny25AgN1O
         1pwkx6duSUS/sJDFLD2o0OKQ029hIeGCWxOvZZn8loir/Pvae0nazAirBM0J4OQmFFg1
         +rfoxgaiVnMxBrPe+l9Rng2nb0KQV/2jjXEDZTn//tILkIOL94VZRh1iAec6dg0tjVOz
         u7+42Uw0Gb4GLPrEh10Vm1r7aLGB4FJ7pJupNaIA7ajpEa6nTBHhFHecAn0h1WaBId9+
         wM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4OkRY0T7vmghve69EI/fLlSmC6Nxsk5UvcZOHcGPscM=;
        b=nbkprhANfXxuNiboyBO5o0JBGhKyYIgRZ+izPGzMB+vLuV9WFD/gRbqs1y/xGlCmMa
         zsoxDC3jxJ/jGh4wjElE0X9aCLSlmozTNOhAYXI0540WOIjcySnto/pMCFOoLS7/H9ME
         ZfjXCmHEoyT0exxfDHbL5PH2Nz34p06knlst4KBUA47xCzytU9VEAVb0QiWJDFBsXewf
         ysRtk7WTCbXvKMEoSXKS45VBKR4WcVx07wC7qtcvTbhbgzc2BlCrDJZr5fZSQ1my6zgV
         lrniZgfiCNsPSk45JSj8sc3g+xoJjy77Y1ltzapIWZpK1xH7nsNhrg0P0wtm5A2BbZIy
         k/ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bLGJy8rc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si247722uaw.140.2021.03.04.17.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 17:05:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bLGJy8rc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHyuH-0002QX-Fb
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 20:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyu9-0002Ov-93
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 20:05:21 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:47098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyu6-0000J4-6L
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 20:05:21 -0500
Received: by mail-pg1-x52a.google.com with SMTP id h4so198168pgf.13
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 17:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4OkRY0T7vmghve69EI/fLlSmC6Nxsk5UvcZOHcGPscM=;
 b=bLGJy8rcrheUAL21B4OfhNvQ86S20OGlBbNtT/+d07lcbOyjxNr5nq2NyWx45knY4O
 fdx75VdYFuAqqfWea9VbpKoWUjz1Ljg9+r7W2gEdMmjRJ0wbWGMp9mqsFvNz6FZutt8Z
 Hp9qzFf8dlT93B8nKxhGCSzh76TUt4fZL9rrtGDogFkOizdjTgA1ojESBrY6GO+Ctkp1
 JZrJhcga24K3SR/DolLakxkGDnKSUaEOEpZUxqkFSJ8QLFVm5DjY1wX+9ZhOxf00zN8n
 7rcjAWKY5ZAZMbicR3sWOq0RCwAWuidq3LYHYGw06T4uXC7iOP4B903KSrNLOf+ZAklk
 gN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4OkRY0T7vmghve69EI/fLlSmC6Nxsk5UvcZOHcGPscM=;
 b=nLe0qFKBibThmpyXMrbZQrNBFyun41ZbbCRtflSzcs2o9dDIxFNw1IRgG0PE54VN7N
 1tUGUMvyNIjeZwj3wjK3416mzsuAxskjY6aJKK4xotQKhHN0fxe/pfGXpNteBgGc60H5
 R3BKj2zKCM2hXuENCQsXkWWh7eC31O1QOmcHxdJCaU7Nyb80S+fpFoUpp14nU2ClRDpu
 ql3/ymJB2Q+ZXqQl8K2rvgiK0/Ntm3e4UvgBq5SyaQUH46YE6Z68UQ4f4v7O38UHhhGR
 mBNRZt3497KGMv+Bq9AEu8kgU9u9TF9leYMN9RmM34VZW0TG8dV5r347ZEBSo8+YTsRh
 rAfg==
X-Gm-Message-State: AOAM531uoe6Q6Jkqf9XUtyBFEHNIykMFhYOWosn6nhW5sWa45R8n+f3x
 JdJZ7mvIK7kIgG95F956Sm57Rw==
X-Received: by 2002:a63:cc05:: with SMTP id x5mr5816773pgf.254.1614906316439; 
 Thu, 04 Mar 2021 17:05:16 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id mp1sm386466pjb.48.2021.03.04.17.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 17:05:16 -0800 (PST)
Subject: Re: [PATCH 41/44] hw/arm/mps2-tz: Make initsvtor0 setting
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87b32098-0a6d-fad5-bc09-b73b185b44f0@linaro.org>
Date: Thu, 4 Mar 2021 17:05:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-TUID: 4inft6DHcClj

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The AN547 configures the SSE-300 with a different initsvtor0
> setting from its default; make this a board-specific setting.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
