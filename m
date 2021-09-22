Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3641222lfp;
        Tue, 21 Sep 2021 20:33:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgH4iLnB9PD1G8/7L2SbO2/qJuG+StPRA7RlRpHYhr7AxtQ88Uabzxq1h6MX/trgKB/2gf
X-Received: by 2002:a1f:3097:: with SMTP id w145mr8080163vkw.26.1632281595669;
        Tue, 21 Sep 2021 20:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632281595; cv=none;
        d=google.com; s=arc-20160816;
        b=lDY8wIMkH0FM4A3bh4lignm8dhgMIkz+20+yShGwXrZ0r8mi/0CrD9fDH5IPnFvHUS
         uqWVOjr8WZz5Qm9YxjvgzqO5YfB4UpF0SRzrcDUR2AYwupyLRKbjYXFlbOFYAvHpEMhY
         Ls9OkjSxfkPtVbDRkbPnsCNS8ekMuuda1oJ6DM0JnKu43W0zQAHIo/QMbo+1M1KKytpt
         fG+m5j7YHFqMLIao6Vrl7NaU7eM58gRkFc7Mk8gNzkFn5FR+MJhesodv+Btdcjg54DRs
         0XyZ3WBxXyBG309Dsvm3vn7GbzMhs8Li3Ji4Q9kyL74uTdi/NuGG5BPmUxYHNIDlKX6q
         xMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=c7zeZ9wywPJeHOx/yBEKnKI4wfHWZbOWe2i3hwUF6hg=;
        b=pn8osXFVg/ySAA8140oJXq3ILvhNc+i+4O2vNaQ2u9XpwdvN3wtrOxELCpeSr7nb27
         lwELfTbJAUKC6dLYxFL+k66fSFfeWZ/xrcqJVkKrr804KkofZ4rnufgo+vbtNC7/leGH
         TvGk/MneToWNcfVwR7SVXrfuGFEE1a7I/AXdGW7EYfONAY9z/r+G1wuZJYJbAnemjQDa
         xPiHURp3/9gvQnIlOf+UW70MGQbpXWAbj9iFud14G8qEvPJD0AvKy5NIoiFB6ML66AGY
         jP0G9sPUHkEwXzZgeQQifxorIdlvqtTNU5vMM+sQW47WOBaF8/4Qj7zooO1EICw29W2n
         uA8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F0vLZ41i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22si768393uan.218.2021.09.21.20.33.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Sep 2021 20:33:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F0vLZ41i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSt0V-0001f9-1B
	for alex.bennee@linaro.org; Tue, 21 Sep 2021 23:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSt0N-0001es-Fe
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 23:33:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSt0L-0001tx-UZ
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 23:33:07 -0400
Received: by mail-pl1-x629.google.com with SMTP id l6so827997plh.9
 for <qemu-arm@nongnu.org>; Tue, 21 Sep 2021 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c7zeZ9wywPJeHOx/yBEKnKI4wfHWZbOWe2i3hwUF6hg=;
 b=F0vLZ41iyKgnuFRmxMzWIikvTp0s99Gqdbpf1RVqm+TspPRcmQjfDhmDkFxTPasGjr
 WYt40xyyPZYbrTMXOigDEyVkppuvIo0ISRmEr3siLs4ZlL7GcjxZ7oT+TfzNm6d4hIW9
 XXyvesFereJ0M/3+SNznW7Hl1dh1by/rg7mTNKhJ1E/htc/YX24Y6JuDSPLvdgLMFsK6
 0vYNksm0ZiUJgi/JkM1teAfhpI759SYS6rc3Ob9zU6G6Zox0GFluKU/L6gDEpEO0HEup
 fnZFWUJxDxgIYzGparhw1DUnwXGigxQXFo/EHFyQDY0N9eGjx7Laobjbq0IAQGNt5Oer
 1d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c7zeZ9wywPJeHOx/yBEKnKI4wfHWZbOWe2i3hwUF6hg=;
 b=EoDaYFRM2sb7BcC7S0GKe4udc6DZJKRpoQbsTVKZqxOcp4iYkvlK/ENIhFDAFfn4QF
 3j0DUB+4EVcMk7/DKB3hMpZtp3hSLenrSzGW3R0OOxC6ucU9z1LUB+kav8k/xQ2NMsnR
 2LeraS4r/BetFu/WTA1dV1s32g85ss1HjJYJYdzmDsCcWOQrnofj14OIK+D2JHSnk2Bk
 wdYtm8f0bDbWqjKD5U2aavegE0Yp/q9AO2m3Dp2o/M5nlnlvyJ4QkNHIkttnrN1QbZrY
 dpYXmsJewgof/cyXcYX6QzT7QasQnGGlP1s2ma/Yshrexc5F8xtSuCTxBFbNWL0MUzpP
 TwJA==
X-Gm-Message-State: AOAM533Vtl+caw44IG6aL1Hyb0EGhdl8UhpJUIaCQwDG87D/ZIL/bfkP
 9p8sjU1vdhjlAjGcGnQzOF6ZbA==
X-Received: by 2002:a17:90a:8c8f:: with SMTP id
 b15mr8794507pjo.47.1632281584011; 
 Tue, 21 Sep 2021 20:33:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t28sm566484pgn.19.2021.09.21.20.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:33:03 -0700 (PDT)
Subject: Re: [PATCH 5/5] [RFC] target/arm: Advertise MVE to gdb when present
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a8b94bf-6d76-b028-82b1-1864b24ff8e2@linaro.org>
Date: Tue, 21 Sep 2021 20:33:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921162901.17508-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: x4ZixsMpVurQ

On 9/21/21 9:29 AM, Peter Maydell wrote:
> Cortex-M CPUs with MVE should advertise this fact to gdb, using the
> org.gnu.gdb.arm.m-profile-mve XML feature, which defines the VPR
> register.  Presence of this feature also tells gdb to create
> pseudo-registers Q0..Q7, so we do not need to tell gdb about them
> separately.
> 
> Note that unless you have a very recent GDB that includes this fix:
> http://patches-tcwg.linaro.org/patch/58133/  gdb will mis-print the
> individual fields of the VPR register as zero (but showing the whole
> thing as hex, eg with "print /x $vpr" will give the correct value).
> 
> NB: the gdb patches to implement this have not yet landed in
> gdb upstream, so this patch is RFC status only until that
> happens and the XML is finalized.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   configs/targets/aarch64-softmmu.mak  |  2 +-
>   configs/targets/arm-linux-user.mak   |  2 +-
>   configs/targets/arm-softmmu.mak      |  2 +-
>   configs/targets/armeb-linux-user.mak |  2 +-
>   target/arm/gdbstub.c                 | 25 +++++++++++++++++++++++++
>   gdb-xml/arm-m-profile-mve.xml        | 19 +++++++++++++++++++
>   6 files changed, 48 insertions(+), 4 deletions(-)
>   create mode 100644 gdb-xml/arm-m-profile-mve.xml

Looks like it'll do what's advertised.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
