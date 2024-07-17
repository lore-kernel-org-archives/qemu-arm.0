Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp699245njk;
        Wed, 17 Jul 2024 02:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdDBdN1LTdbpNvFu6oYuIDeHmF9GbIAinsTkgygvCy4bWQ4YewN8MPARYlQswUbyl5ClUfYg8g/M9lwWg+v3Yqd5jetxVn
X-Google-Smtp-Source: AGHT+IEfeKOPmJllIBhktVxLdTKgutLOJ/YRS2LOn7MMTub0xg0L6+xrrkkfDvvw5y06cGq0lmyi
X-Received: by 2002:a05:6122:222a:b0:4eb:5cb9:f219 with SMTP id 71dfb90a1353d-4f4df4c9bacmr1647214e0c.0.1721210239347;
        Wed, 17 Jul 2024 02:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721210239; cv=none;
        d=google.com; s=arc-20160816;
        b=DbXE6OEJQgjKYY1qObFa3glJVZ1e6F5LDLqVyBeF2dYdbO4+ZvFyjIlZca4rp6SJJh
         8msJz/XD/9819G7sQB3mcxyBerTXLXvbVta5b7tIfXpb6Yg7WtU9QB8Ku4OpFXj4pELy
         z+1NY0W9FVwlxYif4gDV9XhSVGJ6f6nkXTCyQnUdB+cILj6LDvGVRQL/yHKQbUHV52qq
         lhZGJMDIiT7DBxZEfDgMvx0yxNqcfBER7HgqNXUWAyf8V7fEv38X8PewsMWPWZfyPk6t
         VnG31zskxa8kWUPVhu9tjbQUwxssEbztB9jLpatGURJZQcd/OxT1QoLrThL2dHn43I2I
         go1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DymZZfEuiqyot04rPe6TESE71wjhZ5IaIWQ6zW63uLY=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=o/kbRxldA2AbNcvgpkU1Y8ZhxesW0MbwsCMlnZR364bxd08M7dBNm1BxUaUSwGtooL
         GHYoaVT1vgO6X7sNf4WU1jXWy8c69t8/WA1zVxH1mN6etE/JBjk/gx4orRtidlECAQSh
         +0R5Wto+phxg9kSh+GjKwN3Dvf5qIwCmatRsPQVdAM7nyI5a5ADP6O9SqiOkeKRW5oM5
         mNbc2FG2T6GkFbXL3w/Y79qdWoQxC2McVJ8kCoXCu6JYIshAcxpxfG8BdA3hIno6lc8G
         ci7pTLLFFs9RrqKyqzi4JTpvYfI0oSfp2B1JiTzE2ubk1SBDr32iU/teBYG28PbKHgNA
         cLcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e8isf2cp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a1964asi94372226d6.338.2024.07.17.02.57.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 02:57:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e8isf2cp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sU1PE-0004kB-Q1; Wed, 17 Jul 2024 05:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1PB-0004TK-HH
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 05:57:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1P5-0004oH-2S
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 05:56:57 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3679df4cb4cso361969f8f.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2024 02:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721210213; x=1721815013; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DymZZfEuiqyot04rPe6TESE71wjhZ5IaIWQ6zW63uLY=;
 b=e8isf2cpkOxxmdKh8yNvMJFieof5bKm8UZE8rTTpTQ4WwAD90rBeSMih7VIwvigpR9
 uK9lWw1/lLO55cfENWdh/L6+f1lIt3BLJsCDuc+A4z9iUo6aLbNi4GjF7YmZfKfAaeYA
 nh3JtLFuqMaCEYaNucbpcsuaY5EXLPFgD6vSvdS0YMJjVY37ys5/jmhIR8eh48Fq5CE/
 3iSC6tIkPoFMvDdkbxnLl5LufuM6yqhBvo42esL+rcmIMO304o4R5UwDm/e85zMmzP/a
 ksCxkNQFH6vyS9NL6YmVcFjZw9jNNptfdPdASOW9k80/tS3WNH1MegfdLRg2MmTvAWhh
 czGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210213; x=1721815013;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DymZZfEuiqyot04rPe6TESE71wjhZ5IaIWQ6zW63uLY=;
 b=uaGLrC7ISPsoqm/zIl4S2mxd8RtC6oydCaNKF25H81gUplVGtIXJz9YixFqSQgtxMh
 rCZjT4dYIYjgutyjcgqzHgzr4VHmGoAeuRyBbBeqo0pQzn3F7q2vSuS8/QsuwlDwdsS2
 Ou1T8gjuCQDiWkKkTsQO761JqgE00dUDWZr3tPNwPNoZFCGaDvE70B6Kp1NA4VercIVF
 FRQF/hd07fvmDjVDhKMidI+OGbdsDGBrf3xTeD/7Y26/dTSLyrjGgSfLrbe2IkN0rA+D
 N6u3j/WSVd2UyPBf7Cb+XvZDpuZ/34j8vznPkt+/KDSzDZWC/YiFQsVB1Cc59aA3OFj3
 Y/7A==
X-Gm-Message-State: AOJu0YzsTlQ5vkVdeX/7TahddcRZ+aGBTsVUrcVPE0K9VuyE1GLkVlR0
 B+/kHr+IkUTiFUaTpPfVeXVUbyJkCUGwhwoqpMK7hMr7+323gEsnJNGaFhNXfS42ftNoHbrJppy
 Lx2xdvA==
X-Received: by 2002:a5d:4583:0:b0:368:377a:e8bb with SMTP id
 ffacd0b85a97d-368377aea6bmr686164f8f.28.1721210213178; 
 Wed, 17 Jul 2024 02:56:53 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d7489sm198199985e9.44.2024.07.17.02.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 02:56:52 -0700 (PDT)
Message-ID: <37096dc8-7827-4a4c-a27b-4f8343aa9c6c@linaro.org>
Date: Wed, 17 Jul 2024 11:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] target/arm: Convert TBL, TBX to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240717060903.205098-1-richard.henderson@linaro.org>
 <20240717060903.205098-4-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240717060903.205098-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: hiBIrJAOczEG

On 17/7/24 08:08, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 47 ++++++++++------------------------
>   target/arm/tcg/a64.decode      |  4 +++
>   2 files changed, 18 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

