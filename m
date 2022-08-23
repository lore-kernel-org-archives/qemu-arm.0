Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1738272ejc;
        Tue, 23 Aug 2022 14:23:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7I9kHcBgIsHHxQjTZHz9G8LF+LD4icEjgGTxN7B+xYOxowoXPiuRf3qmTenevbuiEhNogW
X-Received: by 2002:a05:620a:b04:b0:6ba:e707:b245 with SMTP id t4-20020a05620a0b0400b006bae707b245mr17443685qkg.418.1661289782025;
        Tue, 23 Aug 2022 14:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661289782; cv=none;
        d=google.com; s=arc-20160816;
        b=yr6bG9smEjIgw7tpl4ZDio/zCb7EN81JTBQXEeKs3Ezq4ec3BBBxt400CybkdnB/XF
         TRw3ibBUdI7+voRqusjhxg6Re4YPm0wZAVWQ6t5qYQZE8tAzUgwB6ymeJcDYgQiEs/uB
         bOCW0xuFpwuygW3f/7h5I1hPJU0z1ST5+0Oglda++ijRwpfwRUNNtVxFlUNDVahS6pmd
         sbnnMks6DxLhe0Ig5KOrF0F2ODIYO/tz89GjAh65pUdqbqvzAGN5LAqK9wDxiTJwdM6Y
         DQCHfsieqkLWSBfsqjriSkaROsq7zxuI9lgI0PJEfrM7RaUHpgLQIUwS5lwz3oMOy4f6
         Ze1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7pvRK/5jDaE+aoD4xguEj2hUlbOwi5nOf8Y1Ppj6smM=;
        b=vqWguyX7JPyj45rfW+X5JBoNypDQEKk7dZ/FNSK43zxtB/OdcomwfEW89AjX8qAFro
         g1RcLEl9q3tSOs3nxG5qKAfuSmqkKil9Ef3P6fsAdbA3upKr6bIKkMgFd8ES5DRx8Q02
         OW8zptFm/9AsK2buy5vA8bA2+EXDg/TmGSo6R3YYfblbxLfvc5+G9WiIKURq9Fc0v+3M
         xwgX3U2/a5gF0iPueEAFRMHHSAcwqaUqO8PMvbybszQmYdgr9HtGEsfsWYHqDzbf91WE
         /9enInYlY7cWxzrvMvkkbKDbX5u8iEbP8q8lFLRYjT3QujCxxPF6AF7LkM3h8pJCVbRC
         mBiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xcHVLDer;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1-20020ae9d601000000b006b9c30f76a9si6719157qkk.237.2022.08.23.14.23.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Aug 2022 14:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xcHVLDer;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQbMT-00028N-H0
	for alex.bennee@linaro.org; Tue, 23 Aug 2022 17:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbMH-00026m-Rz
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:22:49 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbMF-00041J-60
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:22:49 -0400
Received: by mail-pg1-x530.google.com with SMTP id bh13so13337139pgb.4
 for <qemu-arm@nongnu.org>; Tue, 23 Aug 2022 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=7pvRK/5jDaE+aoD4xguEj2hUlbOwi5nOf8Y1Ppj6smM=;
 b=xcHVLDer+9cMRGew1CR4VapEKyFO+7gcoSzZc6QY/UWgO35Bxm9bPKU4sS2fPiRzxd
 T3cHVFUkM38I9T6NwkI6a4f5KZbVwAJHjxRhBJxkIHuNKBkFqaxc/7SbpuJLJj50TLAd
 firWFhzSfrm/uSdQWe1kCrIYFeZ7yYoEDMNHbEbvSs9SLTCTUFyGbdkVXj54Cfqsel/T
 2XoOtKMFqt80gtCkPmNtdk6PDi8Gp6/MrJXnbA1K5+xcfFjPBJrfbmm1zVsEwMjPyez6
 z6ynFDcuAqVSmd98Ql5LrXmf7/zoS7B0JGO6Kf2O/mIfvXujDHsl3KMoBAQwVnJ3M+hu
 A2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7pvRK/5jDaE+aoD4xguEj2hUlbOwi5nOf8Y1Ppj6smM=;
 b=tcjpHUUDlb/AAYolj78pvbTOfrdW8qjwMXUWDTbvrALSeaepXg6u496c8yX1mdaEb4
 6Tcnhc+MkogJbyq4yd5xaGpQXujhQ2jZPOoLjEgwmA4399YQsNtbZT9BXyZa0uyJj4B3
 Rodr78Ug2T2CNSVBr83J59kC1thlS3zHuyRHQp94dsM4UuwjCah9IIH+9obpgW+u4WZk
 /nt9oe1ME+MWUyL/R1CNNnkmyHAvF9DqFCKmSqhlBDnzttQ/jOggGqI8Hw8dW/H97gwK
 7Ly3Rq59tuEjqiEWu2xtnMAcTSkCtkFlbznwYaQbTzHeFfR/c/RxBdyynFCaaw3+V9Z+
 NsRw==
X-Gm-Message-State: ACgBeo2QB9t1LYGoSptZXV2xQMkrNDl3u4oKGtyD4dk3dKxq6N+LWoQA
 4PPENe3akW4Q/oRhghR4EKhNeg==
X-Received: by 2002:a05:6a00:198f:b0:536:c49f:898a with SMTP id
 d15-20020a056a00198f00b00536c49f898amr8726911pfl.47.1661289765420; 
 Tue, 23 Aug 2022 14:22:45 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 u64-20020a627943000000b005346d61402csm11291970pfc.50.2022.08.23.14.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:22:42 -0700 (PDT)
Message-ID: <c8692642-b030-6d66-5dc2-4225ff24ac0f@linaro.org>
Date: Tue, 23 Aug 2022 14:22:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] target/arm: Remove useless TARGET_BIG_ENDIAN check in
 armv7m_load_kernel()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
 <20220823160417.3858216-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220823160417.3858216-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0uN6huysXlst

On 8/23/22 09:04, Peter Maydell wrote:
> Arm system emulation targets always have TARGET_BIG_ENDIAN clear, so
> there is no need to have handling in armv7m_load_kernel() for the
> case when it is defined.  Remove the unnecessary code.
> 
> Side notes:
>   * our M-profile implementation is always little-endian (that is, it
>     makes the IMPDEF choice that the read-only AIRCR.ENDIANNESS is 0)
>   * if we did want to handle big-endian ELF files here we should do it
>     the way that hw/arm/boot.c:arm_load_elf() does, by looking at the
>     ELF header to see what endianness the file itself is
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
