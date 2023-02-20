Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2530226ejb;
        Mon, 20 Feb 2023 10:53:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/h5CEw1eiWW03E0CzsImI6h5sha6ByuVcmzBr7Fre4E1ekFDiCEABlGEAjRcqbAuPvGRyK
X-Received: by 2002:ac8:5c86:0:b0:3b8:6763:c25f with SMTP id r6-20020ac85c86000000b003b86763c25fmr17336558qta.13.1676919215008;
        Mon, 20 Feb 2023 10:53:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676919214; cv=none;
        d=google.com; s=arc-20160816;
        b=f4YGjLLlwAZt1Q9Ft+3D8NLl7LiVVRIeWneIebziapyV3vuXluCa09TAbx3oEnsZac
         msTrjOPTlzrJbZVhcZeOQxfgprKFAzaAm6mxrcrT/bYRjOvBCYSK3JZacRQi26otPDt4
         t58Q6aJ/LNkztimAfkEbz+NCnrmKwuF6JKZnvOF8dCS+vG+afqNCgNgzTvws3h+F0zZP
         duYqYV7rRwu3VYAd+xgxA+A96yKhmomtkebLuw10DGGfkFx5+VuReJt+AQkRqResrBdr
         G2V2Z32eIeDcJHQeGtVhp1i1n/VfFMoFIqagAhYHRoxVeQ7UxFQLM9vDBGexBjxlGsho
         e8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QyqJGYnzn3CyQ7ZynQjBNHLmbapPWH7iiYsf0vhVRWw=;
        b=qJ4bpZMknArBIgqvi4NisgSkq++7Xn6oxCGH26VqHzxJTAPTZ64CYuEpyOpotFEw60
         ig2dy3u1X4m3X1/DrNv0FUqMsLpEmF4hmMryYou4CMjSjQHtSp9oAt64WD+DaJGptJKl
         QaQi0ZUZGUdTvKx8FLo8e5ju6+Y922ezgf7xVt2Q1dFB7voIh2Ayy2a7mwm5B1G4Wu3b
         eWW++nzb4qD5aPSAHgCW+nHa8IOKaMjizMnhmbQs97Cz+Qt743uOoBbmRFXc/InnjvbG
         96Z/kInQ1EnmzJXunwsBpzZ71SduVPUyueOhAm1jdvnPjS9ffkMUVP2ofbUwN0ROVEmU
         Ayzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FllENUYU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm19-20020a05620a1d5300b0073ba6260d06si7842676qkb.470.2023.02.20.10.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 10:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FllENUYU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBHk-0001RT-Cn; Mon, 20 Feb 2023 13:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBHh-0001R3-RA
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:53:09 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBHg-0006X1-Bp
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:53:09 -0500
Received: by mail-pf1-x429.google.com with SMTP id a7so1235939pfx.10
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QyqJGYnzn3CyQ7ZynQjBNHLmbapPWH7iiYsf0vhVRWw=;
 b=FllENUYUg52QZg5BYtHT1ltt2BKLkdwpA2fFprwiwp0Otjz/59ICJugW/gcczFUv2m
 U7OBLbGZJMAdfEI6NfXE9djv/xvBGBl3fod7ecwwRwfMZmx2qbujkKHn2eC2cAchCmgJ
 S9xgdG7agOslqzmRXQRkVJEgnAPoyHiNjf6nNwRyYCf9g9thb9rqka0fwkEXHz8FYqcK
 byuAw7zJ2jCOLBJfQ42HCJ8OUmm5N0ZE9jLNgHVEqdPKHaJHHrN2q84FH30GgMBxkPJk
 vioVnND9A3b2k1VPG9NfChTmbaITzZcb9B1qux9X4s7/y1jM3kxJEVdbtaZtThZ7u5uy
 1aMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QyqJGYnzn3CyQ7ZynQjBNHLmbapPWH7iiYsf0vhVRWw=;
 b=f0q/MYXl6mkP85xxTgvwYpq4WxIue7P0Dim5Z9RhFVjochGmVRC69xReVh67ePRKd6
 d8kSr0QzPnHs5/E+M1kS6Ryyms/1Z1/RgVMvS3+BEYidTEamLNMudRzQKGJnSYUrjAhr
 O0SCuAfpQdjwLfPhXlYvon1+u1lazxaub+kdL2K/qznkzFaz7HrEeAyiew3jfV23oLXS
 t7C6EYBFAAZkgElDgP7IERQKOIHlRu+glcXCPA6k29CLhQmRoGGd3J+SfttcDz8XHmxa
 6CAJXuMiZ09U9ZzGOOTg4u+BTH90WVHz5WZFB5oDnT8DPg111f3Gx7XF4pPi1KGkubnF
 IKOQ==
X-Gm-Message-State: AO0yUKUyrWPGfhlGATiG/gyGuMmqbOkpCRutTw38nzyQHDrtAaENgwfh
 Rwriji41wfoay7i3t1Un58zDTQ==
X-Received: by 2002:aa7:8f28:0:b0:590:7659:9c33 with SMTP id
 y8-20020aa78f28000000b0059076599c33mr1961139pfr.22.1676919186859; 
 Mon, 20 Feb 2023 10:53:06 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm8014569pff.24.2023.02.20.10.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:53:06 -0800 (PST)
Message-ID: <c52a8d72-49f3-76eb-a80d-2b2389eef1fa@linaro.org>
Date: Mon, 20 Feb 2023 08:53:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/8] hw/char/xilinx_uartlite: Expose XILINX_UARTLITE QOM
 type
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220115114.25237-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2sJTxC9dlJ/1

On 2/20/23 01:51, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/char/xilinx_uartlite.c         | 4 +---
>   include/hw/char/xilinx_uartlite.h | 6 +++++-
>   2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
