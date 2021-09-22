Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3626724lfp;
        Tue, 21 Sep 2021 20:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDMeiKyNZ0AoRdegVkWJ83OWwv+Fpf6HiJlB2XitK7N2mSAojhwlekyDP72885b2Lc6A+E
X-Received: by 2002:adf:b348:: with SMTP id k8mr38869872wrd.123.1632279890787;
        Tue, 21 Sep 2021 20:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632279890; cv=none;
        d=google.com; s=arc-20160816;
        b=RcGSFhUI0DPqrYdhOuN4NnmkbnZt03kHg3kV7aP3wU7tdgvEEWJ+d3Pqs+MnAFaKiP
         txyDb790eFEuDa44w5cSNRGAmNDv7cSM+qUWQQeYHF0IeczpqxFNEtFNLQDLRb3bR85a
         rU9cLSVsWdXLJPiJJlFGU6vt22nx+fmeO+2e1Y4f43r2r9+rYFSsiJ6tRxkInMGO1Q2M
         y1bRmge3jDUAtm9T8yCBj1veKTsgZx40Zriww9HulmHZLf/b8w5xiRNh7c6VQqW2PwV/
         OYOYDLf/XParb5aXto1Af+LHMOH6s4RSTUmobZsfzNFtmFBal3CYXI3jR0yKs8/tXzE0
         8o9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9RrXmvYVWwjZWWFTWqfAImmx/l9eEEMuwuSGE48QpwI=;
        b=IZjo2fWw68L/+sfrD1194WxgWuCS4saifTUIF9IXNKeZLHDq0yqvOjuJKSgRqru4um
         IA6xv0ZAL+F+ug0/6XGHLVLB/Iq7wrzFL9akX3DkffJllhF2fSvVxNaA7jHEdjLtDhBt
         oKQPiKmI0OL3xA066kgBPGS0GhEADVfodvXNrWT3IA2l41Ml3hSs+7MLSomCWe2wrWv2
         UgnBPtfvvbopcAOroyyWrVOQSZbC73XYjP7EAj2UkB31fmI8/ROczZRNsKkvu+9061c3
         fOyXn69ICgQbMHTeiPkjUjjyNe0nZr031vEgZCbXGtIuMwRfvkKsdZlxWIKv5F6DYlok
         0fuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xbQDp+R8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si1270361wrd.392.2021.09.21.20.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Sep 2021 20:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xbQDp+R8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSsYz-0008JC-S6
	for alex.bennee@linaro.org; Tue, 21 Sep 2021 23:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSsYh-0008J0-55
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 23:04:31 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSsYc-0002WC-F2
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 23:04:30 -0400
Received: by mail-pf1-x433.google.com with SMTP id k17so1438323pff.8
 for <qemu-arm@nongnu.org>; Tue, 21 Sep 2021 20:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9RrXmvYVWwjZWWFTWqfAImmx/l9eEEMuwuSGE48QpwI=;
 b=xbQDp+R8DEkfZAyS2BNeblzscUAeXRqgRM1KEIcLwQoNPSmBQdkuH6nLpHfesIeuGl
 gHdqgyw484gKvonrkE9fitnhYfCjHT0FSasYPQO5l3zHq16D6eguQFN1hW+UuBS6NyIN
 mYcF59+/qmbyycX4JD/olvHUkXxNhMQm5tm5PZKByyW3LNnJ3JUVlBooMII0UMAOxOxM
 aliL62fB/ZPqB6phLeDkjtSNeZWHuLSuRujODDsQUalUlE6bwbXt3/lYFQAhARDKJ+H2
 3AEC5JzRu8hJy2gNgmo2iUSHvRojcu9PJ8xW5lp/z3Z0GD7BHVbQV1DKqzyfj1G5g4jG
 XzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9RrXmvYVWwjZWWFTWqfAImmx/l9eEEMuwuSGE48QpwI=;
 b=KCKRq16kYoxColBcPlxulNboCeE68SWLL51+LXpVHPB7iXR9nh2DCiLuxwvaLCFGVU
 +vxs1IGc+DJgucDTwf3Mcsl8LeveHYYJpMTNWxBE8I1ZUmMw+dW8eBcYw5gJyo6qK1Iz
 EJ4RCdOrJmIFcAptiWt78ig25rJs3uTnpVC9k6AUgonwfaFKfCsoH6Ei1k3ZbLyC01sH
 UeHKGkvtaeZ7XaCtRZfVe2o67vZRUI84F2Y3LwbWUuk9MWbubIRqP6pUWCTqXOpj4vY9
 WljfuWL1v6ZBNBvXFo/kHY6yMMEQjLPSHkneW2ycTSvUbUrif3OL+JANhSVisCcSgCXz
 /8nw==
X-Gm-Message-State: AOAM533apeGwKZ8kRQ4WGj2SMOvcKCf6p9xnVsOEKHqAiorwAfeiBnn/
 nD6mV2jdOP3Jl7CnFUdvbw00LQ==
X-Received: by 2002:a62:ce0d:0:b0:438:71f1:4442 with SMTP id
 y13-20020a62ce0d000000b0043871f14442mr34059616pfg.21.1632279863719; 
 Tue, 21 Sep 2021 20:04:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w8sm471249pfc.93.2021.09.21.20.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:04:23 -0700 (PDT)
Subject: Re: [PATCH 1/5] configs: Don't include 32-bit-only GDB XML in aarch64
 linux configs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a70b4d62-8493-479b-f0db-f39b112096c3@linaro.org>
Date: Tue, 21 Sep 2021 20:04:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921162901.17508-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: feg/eDlYRv3U

On 9/21/21 9:28 AM, Peter Maydell wrote:
> The aarch64-linux QEMU usermode binaries can never run 32-bit
> code, so they do not need to include the GDB XML for it.
> (arm_cpu_register_gdb_regs_for_features() will not use these
> XML files if the CPU has ARM_FEATURE_AARCH64, so we will not
> advertise to gdb that we have them.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   configs/targets/aarch64-linux-user.mak    | 2 +-
>   configs/targets/aarch64_be-linux-user.mak | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
