Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3655317ejy;
        Wed, 5 Jul 2023 08:26:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGmratcm0FBE8pV49S3EmHnCoiJ/QG+yGDehbpNimSnjtmIzumdWY5eejeLzOKGCl71+eip
X-Received: by 2002:a37:ea01:0:b0:767:573f:8931 with SMTP id t1-20020a37ea01000000b00767573f8931mr13249348qkj.47.1688570804726;
        Wed, 05 Jul 2023 08:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688570804; cv=none;
        d=google.com; s=arc-20160816;
        b=Tn7qgepR9qg0UwkLz7lMKJF+vvpQUej9+cT8byOXg8wa7tqtSz3vJC2pg2dyxTBeh7
         q4tYbSUFKSXLnHQcJyoOlDZpMtcZT65ofoNIYRa7X/g0HQOHFTAhDmKZa5KvvDlj6WPJ
         xBDiZRzjnT4yPoMbuNJbPEGJ9S3eVnVxcx5zNjUsf4Nh07CKMaFFjP6XCmEnDqTIOQyk
         yLp3bLkuV+Nsi3ZlPIt54f/XZEoy3dIezBo8Z2xfTS2zVZZJTt1Uuko5XME2E8nSfVML
         iF4QdqNsLJF5JqPtCM1Sgg48T7Gg7zBpgOxON2hGzY1P8PX0g5sPNNLVI2CUW0Of+g+V
         R+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=O7QpgPaXGW/gcj6LdAaCEGOaGvyQ/Wsz18252+a4ayQ=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=jXMoApt95A4eh554MyNlBBV6A/C2KuA3F8Pfkn5H3ltnoeOoh5zYWzAVvc3xf2pX0D
         bc19X56Cgu7sXyeLEMdNGRk2rvVeaHbIiNOKOLlqcHudIWN8jI7+yQlXapNjmfl9jScS
         QPyEf65JfDbJgaJ/WpTB3IJDvqFGTOe8oxTEXkwKAc8d/GllTB4Ff8psMX6hJLvc/dIe
         iCacc7esaizbC3x7AcbgYkQealS8Vwq1OOsUxgzvdVb59co4ZUZ4dWFTW28Mfa4Rn7NM
         xbO9oS2VarSiYskJNUZwg+Thj+YYUdzWd9zgfn3DjTWyVXi1ywtDHNez79PvH+65lO+C
         2Epw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q+CeII5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a05620a152d00b0076395d8a560si8296997qkk.46.2023.07.05.08.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:26:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q+CeII5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4OZ-000304-80; Wed, 05 Jul 2023 11:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4OX-0002xA-Mx
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:26:17 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4OW-0004UB-2r
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:26:17 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b69ed7d050so111638721fa.2
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688570765; x=1691162765;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O7QpgPaXGW/gcj6LdAaCEGOaGvyQ/Wsz18252+a4ayQ=;
 b=q+CeII5+HITm489gbXY1UUZ3dAL3VyoXzmF6CWHbBsr2IxC6DmWC9fuiT6qkuDYIHJ
 K8om8pL1yctnzOtpV7S7W5nCX+aDna9GFLHdQ8LJopPeKckdpOgBZEb2D4gY4n5eLCJH
 tiGOvZ6AHfW8KsNaJKjAzfOt9XFaRn3GCVRTm6KTtVZWk70MvxXkCDMYCe0h0z+aTDAI
 Ihzq+hxS44NxhrAh90Bslj/y/p4cBwwn9L3xGyRt6SQttwXX1kk1Nss/kmnnZxL4dIC0
 hQK8026nNU5dKCjWsaTLoHv5U3HnF5dFWQ4qCUn1OaH0Rchx0IigStklgfErX4BbS1sf
 h5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688570765; x=1691162765;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O7QpgPaXGW/gcj6LdAaCEGOaGvyQ/Wsz18252+a4ayQ=;
 b=Gt8Z6PZByQQBjPOlMM+mvIeCJSVdS9UfeEOadeVpaJ84FH1ePCb0EPvca8SCNc70fz
 11KC7lRCIWDPWg4dyBbfzL8O8jpBn2SNoSEtcs7MQqFICJKPDhv5ApRrGNxj4DzNlZa/
 +BrCiIT+LIwvXnifkmmu4jKE0zwoo4TBoIwNn60NWrenB2Rx1c8X53i+0mbC6pJcKqrI
 tVMWeqk4Y1WwZ32Edol9/06CZXdLKXFGkm4q6rHkjGwTB/nk3gs0+x7M5IPU1LjGeSov
 +YEga5AzG6r0PuqfnERBenNb7nvV6vdJwXfcg2kjURAi26EzjjydEuRBn6UkiuspiciK
 8I0A==
X-Gm-Message-State: ABy/qLb4OVvUlx6AOR6Bn4eFF4FYP335lNa7m0TLsiUzkVjgvpLRVvYH
 fGg2hNf6WdAB5Bu/1aW8+vZQFw==
X-Received: by 2002:a05:651c:454:b0:2b6:e618:b593 with SMTP id
 g20-20020a05651c045400b002b6e618b593mr7285173ljg.31.1688570765574; 
 Wed, 05 Jul 2023 08:26:05 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05651c021000b002b6e863108esm1953496ljn.9.2023.07.05.08.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:26:05 -0700 (PDT)
Message-ID: <65d48d3c-ca95-4969-15dd-3aae14e00e81@linaro.org>
Date: Wed, 5 Jul 2023 17:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 01/19] hw/timer/arm_timer: Declare QOM types using
 DEFINE_TYPES() macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: QTt5jH7uNv9v

On 7/4/23 16:49, Philippe Mathieu-Daudé wrote:
> When multiple QOM types are registered in the same file,
> it is simpler to use the the DEFINE_TYPES() macro. Replace
> the type_init() / type_register_static() combination.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/timer/arm_timer.c | 35 +++++++++++++++--------------------
>   1 file changed, 15 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
