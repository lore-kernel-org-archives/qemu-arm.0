Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp739337njc;
        Sun, 9 Mar 2025 12:02:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRjWIOOyc7ZlA0WmhkbnqBZre7VZIAmfIqpBZaXgsCnyo9EpxUNq7ltO0w1szvJcFzPOmnKpH1Sbo8iA==@linaro.org
X-Google-Smtp-Source: AGHT+IFmcwEbyHGIp5+FuiJpTLXZTT7B9AflptEnhwAk7+aIfRYH2mtSpJyjTcQHT3nQF5ASTJFr
X-Received: by 2002:a05:622a:34a:b0:474:fc29:2bf5 with SMTP id d75a77b69052e-476623b6a75mr105985791cf.7.1741546926956;
        Sun, 09 Mar 2025 12:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741546926; cv=none;
        d=google.com; s=arc-20240605;
        b=YTy6PGF/nuXYIgvK76IHKRSv3AXf9JyVcMa5ASP63MEWY94PGYFNVKnEXyRYHn5nZv
         RocFM7mz4NPHbnEJfiCwxVMRCi3Wu1fFRszlowjTq3vd2RB2DkNe5PsL2iSSBbZmxgVh
         xbHZcorM9AcijExBbI1X2eKJd6vjNxV+9LXNEDleHh7oApcyhxxVFcO/3R9l5vibspql
         wNPCTr2UWNMfGepwyhAtzVtC3qB9Wzdhv978TeoidrziwvMp1R/6Q1KyQ9vA48jDdeAC
         TzfObF0JOhBa5qjWuYq3TWD3fNLtaizYhramQQ4WlsvUREQnmrgQJF1EGw/ZSTOVgNZL
         P+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Y+8UUz7WZSetrlJwzo1N7675l59e6jcgk59FlH/9Iqg=;
        fh=O8Np0w0lGr9EumnTQRtavabpK8bjyiKcIzIcB0MWk9s=;
        b=Aps5jIV7JTbpcO/nPSpJuz4rSraoT1BMSxjMNP6p1RLuQ9jmLO0fZ/yZ3j6abGAdCV
         GBYUYQnT9zSr5vFdqlN5xHOXDW4/pDhkg6AMW+EUQeeH3Gz4MzQX3OAFWRD2kEGEBDCU
         XhkgOm6y/2w56f6b+6SyM7f7gz8Qjqf8IIg8ZheYKkCEZM93KtM2GeJ0cc80JXlGLtLJ
         gAt1fC2L+/SUQVI0Y9ya+QrnYOJBGVHt8WMHgYQ4KgUz9XLyES6lTmLtV17m0+kjjJpP
         dsjnEjImM0rvoSYZUey6t3NruycQRNyF8ljY9m7AvIdWikCjKWNKWVNyyAb08wJuFVyJ
         rJ1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qhqbhgV3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751daf31e9si81210011cf.314.2025.03.09.12.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 12:02:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qhqbhgV3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trLuV-0003sE-TW; Sun, 09 Mar 2025 15:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trLuD-0003ky-BY
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 15:01:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trLuA-0004Du-RW
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 15:01:45 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so3331668f8f.0
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 12:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741546900; x=1742151700; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y+8UUz7WZSetrlJwzo1N7675l59e6jcgk59FlH/9Iqg=;
 b=qhqbhgV3UodcZ2YyJtjEvDjpCnAuhCtNBLvEDmBPPmptByqgMKsk9rW2qyOg8McDJR
 TPLUIIXtswx1Dka/lD3pT43gLlIFeB6Q03FkT2whU3TKA0dTEHLtFITRDJVgcDGT50mM
 H3UdaEMojTzrYCmZdUMvZPqSQkv3f+hDqLrwkNuPDciLKQ9LRXexGRPOIART7fdXtjUQ
 JErzGv52xojxkZBT3NCBdM+HQzb5V624JRr6BlYmEUpghGT+72NB/uBWmZWk9854UUCD
 MMRnxAzHVLt/Pup/NOxHZO2OpZtzaxUOQV6BTLeQHhdAuqFxK/dLcJaNwOd9UZYUI/NO
 wR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741546900; x=1742151700;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y+8UUz7WZSetrlJwzo1N7675l59e6jcgk59FlH/9Iqg=;
 b=M+GB0RuJT4ocZn7czfBBzV3F/p2r7oXgv52kqUaRu2mGl9tnB1Xc5SzWg/oOB76Aog
 OPfR9JyRfZiRW5Qc9T8Zocf0aH2WKrbqxdC6VYIwPqLxgRAXvJbXJ9csw3Y8G1ZbRycR
 miM5Md05Eaqiggn1UR3DFcFG4AMDJMOWXK6THPrwA6+8dQNO75RAmxDiouBwPdgMyPVN
 YfO2t+z0DO38e/23a5AtI7XLCoIXjnXUNKQ6DGV7QnodMQk3XlghI1FTH0vFztUHa/Zu
 sx/VdMYKJ6OnxAfXwzeno6LLOfma7kS+xBZa3FIJLgzGIyuvF51PjCNf5DZHo1ysdnAT
 0avg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/wDjzr6RT8sZallmeyYQ45ZjI1lkKTsCz4seE68btSXTyJnJgMi8qr07rRMeNr7763JlEosZ+Wg==@nongnu.org
X-Gm-Message-State: AOJu0Ywp92ah6s3hpi5j9DNCqmSceYmOfLUtBaWXDgQLuozyWSVCOeQu
 hobtNKXhi+m6cmXh5c1yV0UhfTsUqoiM6KVzh3xqSlxzkvl0dSmwAH0HhRpvvfU=
X-Gm-Gg: ASbGncssn/tZD0UgdCM+w2sWWguyXeXhhWsom27JfBdPk9/t0bhr6tg7nGG4JozGXAX
 NTxBJfFbyGxFIoelKS6NdzYNj119Rm2+BjZMyppxIl0yf+WJao0vLIaYZE5US5E1tkqg3JibQAL
 KBNAukPooV1DiOhBqu5kN24sIQOvFecrLgszp8XLTdrqQvw0t+PWmhoNO4OBLPp0yU2t/FbEh6f
 qCO8LHYg/kyVGt1RJs5vXLGIdaGx9SZK3/yr4l65T6YByYCLdqrj4c1DE7qYsQlaREA2QaRdcVO
 vQpuG7I925tpm+x81f3TfUT3bza/LHUguZsqx6uyxZFLIHjnGJDTUeAT4FAJhckkMKW4TwDfJcx
 PB/Hp+dz16djd
X-Received: by 2002:a5d:64c7:0:b0:391:11b:c7e9 with SMTP id
 ffacd0b85a97d-39132d6011emr8085889f8f.28.1741546900590; 
 Sun, 09 Mar 2025 12:01:40 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfba686sm12821876f8f.19.2025.03.09.12.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 12:01:39 -0700 (PDT)
Message-ID: <709cc2da-22ab-4b49-b819-177901c3a444@linaro.org>
Date: Sun, 9 Mar 2025 20:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hw/net/smc91c111: Use MAX_PACKET_SIZE instead of
 magic numbers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
 <20250228174802.1945417-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250228174802.1945417-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: A1hcEAoW65Q0

On 28/2/25 18:48, Peter Maydell wrote:
> Now we have a constant for the maximum packet size, we can use it
> to replace various hardcoded 2048 values.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/smc91c111.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

