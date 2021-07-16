Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1695023lfc;
        Fri, 16 Jul 2021 15:15:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRTA+HnApMKOZ1vbyr2UEjQJu67YpHm48PQzkRxOx6cnbn6DBnGTrpidPLQQBKfGZNes9o
X-Received: by 2002:a05:600c:3799:: with SMTP id o25mr19062730wmr.63.1626473754718;
        Fri, 16 Jul 2021 15:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626473754; cv=none;
        d=google.com; s=arc-20160816;
        b=x5dTuZdLCkMNVgx+4EQlyqESigAgHtWCBtNFQ77HN9wMhE8RnV+ktWCDmq7yyOcZVZ
         c5jpo9H0Mm7ozF5ga1mQbTWBFD9Fk5ajNXk8SXDYNYa9a7EhDL92NIESJ05xkRVYuGOs
         sJYyX2irfkDuBFAgjCB3wRAIWewdZhYMwbJc6xanFp3Qjfuvmism3uI+N7h7xWdPsE3s
         1mZ7uFFDVTPwXP3+4vk18dNycheZ/e6zwm2oCrGtFtyzKPhxzGbPL4LRl5NNs3gLqp73
         thF1+9tnJjZwY9+rb52hstaJpNDlQXis7F1bvx67DeQoA8q0uK0HQ2Lkpdb675ap2IUY
         6WpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/F5CXRKSk7tqgHt1BAeQibP8uc+zwU1CNx0qlvCnlPs=;
        b=RSP+gu0Jse9LdLvgKSnTeJRK4PMlKVo9hg96eaVr85jnEdUQ26UcMdJQ2hkD1blpNh
         Xfawg5ZDc9hNYyXL2RxhMllcIhk62I4x2JMeF++Sa/1eAvgaKvNp/ha2q7CKFweB3XwZ
         GL7OcmnPL31a064fWWg9/BS2splt/BQ6ZJlUSRfUoBi6t5JTDK7s6bbN8xMbNwUTJvit
         82o09/jeFUcxWwYe42Dvz+rFInY5uhp2VohdEltfG6+yCnmj61YwPCYqxeLh+l0W36hP
         4h+GCATupyX/VvvkqoRLLZWFHweMikNlEwMCmhsZpkNJy+l1NoGLDcC1Gt1+goHZwkXK
         ohHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOUHo5cb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si7063707wry.301.2021.07.16.15.15.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 15:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOUHo5cb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4W7d-0008Aa-Qm
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 18:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4W7P-00089y-Rb
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 18:15:39 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4W7M-0005fw-V5
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 18:15:39 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so9663104pju.4
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/F5CXRKSk7tqgHt1BAeQibP8uc+zwU1CNx0qlvCnlPs=;
 b=nOUHo5cb9BG17PlMAM6URqrMLGVpaJ6fCmpiwQThmoHNCq60W5TNjZxVQew/QT85UP
 AT+K93OhXtn0U6QDK4Wja/LaVQ0cx/kOR80oHeJ2lUO6mcZdCeVQyCWH2ALLi6A8mEW+
 1YNvb1OEbr/YSyVrGgZ8grIzFxNcTJMGGvSp6PoUvdVrvvnJJxbViMpKryG/9SRbLTlG
 2R5lI4EysISDFs2uygbhDR6khgjnJplg5Y1LYEil0aN3giLj5tK9SjZSXfGDcP9RpHPJ
 3rvTY2O919JKFnSssC6rolfsiiNV57pjviriKzg1RwEH2HupZ+0mevrm6wVD95+Mfp0d
 BFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/F5CXRKSk7tqgHt1BAeQibP8uc+zwU1CNx0qlvCnlPs=;
 b=MTrT3ugXVKVPBunpwWK4szC7zMbafkf+a6Zoqu+OOft8REWws64RDcSrkfKJJXWkhS
 znN7ThwIP/922RUz4Thzutc+WCmkrfRFBAO0qWQUUvWt8x4HpdZYV+WCzNj+wYEAXbn1
 tgubQ4mUzh6R1vcs9mySYIHl0UkDh+WjAKOX+fOuK/n9A4cLmA7v+r6hO8AT8/EB3muK
 yH9T2ugG9+12D0lZcVvdZXxxEa8ED5kl/qi0qXqTcavt0Deo16ymV2x1WuTMnsnmyajN
 st5fEgRHrG7zNv/VAN0y2gVdb5m8pDRjMnUEbPEMg33cUj9yUMlQDZDTfxxUKMYT9lVk
 ccoQ==
X-Gm-Message-State: AOAM53148WsYXt/1vzKaIYIRlhGfMjsOL8CL1n3hW6X52tPPFVDKc0+5
 3Re/U1VuXvlUM9l3A/++NV2Vts17SMhOEg==
X-Received: by 2002:a17:90a:6be1:: with SMTP id
 w88mr11891892pjj.121.1626473735365; 
 Fri, 16 Jul 2021 15:15:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d29sm11611024pfq.193.2021.07.16.15.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 15:15:34 -0700 (PDT)
Subject: Re: [PATCH for-6.2 18/34] target/arm: Implement MVE shift-by-scalar
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cec87fea-ca09-c681-4465-241d4e973098@linaro.org>
Date: Fri, 16 Jul 2021 15:15:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: bmoGRfPxgVPI

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Implement the MVE instructions which perform shifts by a scalar.
> These are VSHL T2, VRSHL T2, VQSHL T1 and VQRSHL T2.  They take the
> shift amount in a general purpose register and shift every element in
> the vector by that amount.
> 
> Mostly we can reuse the helper functions for shift-by-immediate; we
> do need two new helpers for VQRSHL.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 +++++++
>   target/arm/mve.decode      | 23 ++++++++++++++++---
>   target/arm/mve_helper.c    |  2 ++
>   target/arm/translate-mve.c | 46 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 76 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
