Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp192981ejv;
        Thu, 11 Apr 2024 14:30:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0nb3ze9lwjKbUv/rYInQBJde0PeJFJ9MpLPGnNxiEiuMgNzWpSuxR+tr2jpDh1pwbg7Rlk5dmahph61MX+Ilg/X8GdmmG
X-Google-Smtp-Source: AGHT+IGdiOWRwu6x1MpT5ngfc8N3TDODn8pNXTvtvE+4bUWKpE48mDkWiOYg9izXcCYR0G5amoVU
X-Received: by 2002:a05:6102:32c9:b0:47a:3c1b:5942 with SMTP id o9-20020a05610232c900b0047a3c1b5942mr1146014vss.13.1712871018332;
        Thu, 11 Apr 2024 14:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712871018; cv=none;
        d=google.com; s=arc-20160816;
        b=j8q+yT1sVHX5P6WSK+iwGm15M+V8DqLv7XP/JqXIzxNidgWUazuZoYQSWdGj2dCwyz
         xzbF+SlZ07h7GPr4KFiAgblj1ah4GleCeWFSL5awm+b67OAT3QcBBJSfw8QtNa9mw0Bd
         njwaIpChomYrF4mLoolEnVS9xzo/0Ecv3O61hmh8P4PpZkP17tncuB9AIy1FGJ2ouWl8
         19Mlieg5hqyf3C+RK3e2rOv88H0g08D4S0FZ7ua2sX7iST4Ymo2zdVoE+UX9p+jpdX45
         ycmGfMFXD4l+CTy/9GBkBEfLf9WJdtnMe5HzY53/32vBzbagIcEskf4R1yB57BWQh8Fr
         +uiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mxeb9Qi5ilEzWYWacyUKXpeH6yDELX9V1W2dQgietGQ=;
        fh=JVNH9Ja8GT01zZssPr9mCb40m0qrwkNb3OCTZWKXh3M=;
        b=JIAijdfxXWovO/4LdsQzUFzsORKylJY70ExaKcRaNYDXHhHQa9qmt6P2wdvoGi9135
         m12U81xZufSuKE5wD3h6+UFIOsUNWXZzu/vACrHrbGJXQN4M6GnuyGTW1AAVqcfuZhyV
         /8fn97EEbv10+YCUATWX5oZ76X1ElztORztK473uyCOawSVKOCOHqFWOs6vyNCw1ij2e
         qiLfCMZMn2j2wF6ru8KAdW/RHiMoEyyfd06QpToT40/wQ7IAl1z1WojTxn8or5THsbyL
         LLu2BPQsEL4RAZ0A/XluG6faUiqG6ekTirFPY74UZlu63OJQuAE4xWKNh+a/ZKoC8XJ6
         tBzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdaRJ9qW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10-20020a05622a048a00b004347cf7c206si2351719qtx.216.2024.04.11.14.30.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 14:30:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdaRJ9qW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv1zX-0000Zw-2Z; Thu, 11 Apr 2024 17:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1zV-0000Xs-LF
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:29:53 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1zU-00034v-3A
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:29:53 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-23333ef4a02so210592fac.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 14:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712870990; x=1713475790; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mxeb9Qi5ilEzWYWacyUKXpeH6yDELX9V1W2dQgietGQ=;
 b=pdaRJ9qWEokG91ZhM/ACKVOlW102ZW4IZXS8l5OlJNcTkdZJPPiU13Mzpu1QPeY7je
 TJYz1eIsL4gOX1aQhsk8hFJ9amqtjXGeJo74k8WuZThAaePxLWA3Nhsb0KtCUQfT+FsU
 JlRgPvDmKidpVKJ4MUpkA1qLhUX2/9+P+SKAHSXxkCDa82WN8kJg+nmF7SG+u7nMUiyk
 DdimXbNc1iGgIh7kXxEHNCkVMSiyFxZ4fbIbmo+REeXTK/fPhhvWv18ysrQtDdjcmTU7
 ux03dBH66RDhFg7j/KKqd4CWVtR7xN9u4uYn7Mo78KW9WV4iia/cbfNCv4Milq55kwWH
 eB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712870990; x=1713475790;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mxeb9Qi5ilEzWYWacyUKXpeH6yDELX9V1W2dQgietGQ=;
 b=bwU4bQpw7cEgtCSqJfcWSQrbLooCwHzTjAr9dfnS0qH5MgVV1Ogsc0G37KtXRuCpYL
 EwYAc5C7/MttB1YJo642Ut7xchHi12YGhP00VB62DiHFN9G5ym8Aa1MifpTPOLo8MWFm
 J10PUnBkYsICOZIbbsTbeju9+KwHZ0qf9COxxauc2ReYy0lNvq7omCuwWYsvYqOu9RZY
 p5OGFLMWpTf0wPrtfhrvuxHDhZmF7WdmHhsMqZjNeSyppXpRnhS5tR1MceHN2Y7swmF1
 LDgiwLreobZ3skJCR184ASBpq5NtUxv5xRjmwE+sfpg4pVXBvhfh1epRIl0UsMY7gBb4
 z85Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW15bJqnNJoqk2Q9ZkpvszH7OOpoUdKhv2FchbJjGPZe3CijGPsGOryVZNwp2mLxYVLWB6tNIhem6wK6H7T5QqqKd9e
X-Gm-Message-State: AOJu0YyWoY8+VbKcDHtCLYTTsAvNu+A6p61vg9DsY6Wk3IjvhRYqIGy+
 U93Z6ppAlpGvfbyJJEd+r/o/1GWfZ3bAM5x583tOU7zHXEvXPO/oF+X94P+rCKY=
X-Received: by 2002:a05:6870:8c19:b0:229:8169:ae49 with SMTP id
 ec25-20020a0568708c1900b002298169ae49mr554932oab.46.1712870989851; 
 Thu, 11 Apr 2024 14:29:49 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b005d6a0b2efb3sm1504986pgc.21.2024.04.11.14.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 14:29:49 -0700 (PDT)
Message-ID: <e43c2c7d-e12c-43ba-b3d2-7a5bdce2b364@linaro.org>
Date: Thu, 11 Apr 2024 14:29:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] target/arm: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411104340.6617-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VEWu8qiqhTCl

On 4/11/24 03:43, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/cpu64.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
