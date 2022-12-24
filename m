Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1381130ejb;
        Sat, 24 Dec 2022 15:33:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt77BaMYHBdB3vxFx50195wu4Md5Cz+3wQ+1aVp4zUQICteG6f2RN+vuyp/grQ+r6viX0rb
X-Received: by 2002:a05:6214:127:b0:4e1:bb55:1d7f with SMTP id w7-20020a056214012700b004e1bb551d7fmr18059485qvs.1.1671924813555;
        Sat, 24 Dec 2022 15:33:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671924813; cv=none;
        d=google.com; s=arc-20160816;
        b=V16xpo91pJrk+Geqxt7tL10A6isIHHSnHkI9oQVu4HgaU6Q6cyF4/Gk5ZlUCYbHlNp
         OowJv7XCSgRZD3KFz57CN6k6K/8tIKnUX6Q2J73O7eZhbrPQwfqQIFw+HQGGBk55OOCD
         ZJmw2sUBZbo6oL3QPATwv52N3+ehKzIJtHnsDgE3UGFLwcw7rNMEa1yejCb1v8XVTd1u
         DlE9OnT+3369Q/QaPIClHT2hbvfvkkdPfbls3jtkB5f0p1YoDhuIrFofSvljxcU7DBYJ
         kH7Uk47pQKgRfRPjfhOWVGMgvG6bMVyIT5P95oTlj96E25QSi1qEIXTBAAqb7n6DkXrB
         2NUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IvzvRtI4PPzQ+G3WKq2nCrpIImwB1GmLykd9y8MpBXQ=;
        b=GdKXzf6ejlXsUE5J+Xz1atZoG38Je+X0gSIhsBhMOfsqH1YJM0NeiIpWTcqRpKJtzV
         Ugsr0YhUx1WrV8mtMAPLp07mN0x24r4CP8qW4/vWJeUalRVwuKZiVmsnIu/Wn1/s1L9O
         8klk3vOV9mXZ287j0QSUpkSE44Gz8yH04lPb5k89d3BXtDylUVIqvDWdHKNQl76rvACN
         v1G1cz5jMWfimwqbL/2BFqKJR64TmTYZ65uKHtNC2+jlsX9LujWiqC7LSShIk4CNhQwr
         8vMk3ipAhc0R5VaiEnAOtqUhPbtZY2WmDwuGcGKVzgco92pa5SlR10jqDEAiArIX3+sD
         hMbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgEFcIv1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020ad45c62000000b004bbb0cf46b3si2720869qvh.325.2022.12.24.15.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Dec 2022 15:33:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgEFcIv1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9E0f-00061r-Rv; Sat, 24 Dec 2022 18:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9E0e-00061N-ME
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:32:56 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9E0d-000283-1Z
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:32:56 -0500
Received: by mail-pl1-x630.google.com with SMTP id b2so8004501pld.7
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IvzvRtI4PPzQ+G3WKq2nCrpIImwB1GmLykd9y8MpBXQ=;
 b=JgEFcIv1jARKk87f0nQ/jUHdl7nnUQN5HnKXKHhu2d3BvTOGkUq7p1ZA+qM8YarFeu
 x7ojdkCI8/0xRymP9mEwvc2qVDzLBk4u/e4uVRFpxsJnO/IwZxQ9ABwn4p5i3Xj/Z7Tr
 q5QgYOOPBFP5JumhKV9z0YVNZAHuvaocYmER2LCuk+2Yx0exX04VJT0FsdLBxhu02had
 jgM2Gz5mgHdA1u3DRtJ6jbjMigWEG8Mps1J03KQ7yiihYd/RyDNBiSy9Qp/H0Bm9agbf
 WZ9397ctD/DdQ+y6K/EU733ZY9x/cLPrtEgQNu5NBuS/1sHSTEf2rhFXrGrtKk7Aq0yb
 hrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvzvRtI4PPzQ+G3WKq2nCrpIImwB1GmLykd9y8MpBXQ=;
 b=hAL6BHmXI0E4xpkKBFLjIDYrzZsfbdX36p0gRan4v3kRSKuJmb90fSqP42n6h5kGue
 s+o3V7qRwFe2BgqOGmEvXqH0ITSWyphW/FDuWZW7oqRcSebKbGjEp4ir6BHBaBiwiiQG
 rk6bduZbH8X9tTCGEhFDJZ2pqXs4/Xn4Vok750vj7dWPz+XjwD3XzJFqwa0J4jqcjoXm
 Imfk//RSx0iAOkKUGwlleeZEs9yWiLGPyRXFhr6LLSkIOOFxJUGEBsPyjDMUxV4kS+ms
 B9qywvlmvqatzDWzR8GkobJKxgDP3+O4R4PAr23lR/FPRLWKf9npDtsMUAR+9WlATp5K
 i+8A==
X-Gm-Message-State: AFqh2koVTgPGjp/L4nNi1h2K+PEOaFsQuqKuaxWe7AlidSfRidLlGnnw
 aCUoLTlJerS/QkzTJK+JXQmh7Q==
X-Received: by 2002:a17:902:e952:b0:192:4ce1:3687 with SMTP id
 b18-20020a170902e95200b001924ce13687mr17602963pll.52.1671924773253; 
 Sat, 24 Dec 2022 15:32:53 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a170902f35100b00186b04776b0sm4587751ple.118.2022.12.24.15.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 15:32:52 -0800 (PST)
Message-ID: <94cf9f19-0737-ee6e-449c-7166ce0eed9b@linaro.org>
Date: Sat, 24 Dec 2022 15:32:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/6] hw/arm: Fix smpboot[] on big-endian hosts and remove
 tswap32()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Havard Skinnemoen <hskinnemoen@google.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-TUID: 8LTzBVLH/1c+

On 12/22/22 13:55, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (6):
>    hw/arm/aspeed: Fix smpboot[] on big-endian hosts
>    hw/arm/raspi: Fix smpboot[] on big-endian hosts
>    hw/arm/exynos4210: Remove tswap32() calls and constify smpboot[]
>    hw/arm/npcm7xx: Remove tswap32() calls and constify smpboot[]
>    hw/arm/xilinx_zynq: Remove tswap32() calls and constify smpboot[]
>    hw/arm/boot: Remove tswap32() calls and constify board_setup_blob[]

Series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
