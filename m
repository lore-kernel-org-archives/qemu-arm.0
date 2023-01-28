Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp78022ejb;
        Sat, 28 Jan 2023 15:59:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9fB5F4vc/2HUUXfy9sey24Cx9Mnrw/sZx0qWfj+rk0gffRN5nNPk1b93qj14vYUUuZBXv8
X-Received: by 2002:a0c:b416:0:b0:53a:c24f:a97d with SMTP id u22-20020a0cb416000000b0053ac24fa97dmr3054394qve.45.1674950346609;
        Sat, 28 Jan 2023 15:59:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674950346; cv=none;
        d=google.com; s=arc-20160816;
        b=LDl7z5FhazjYYmKda7vTWJFLAKW+TPiaEwhJkHppGTVNCBA7SNZHV/SRs9svTUdmJu
         IOkYy52peIBWI5x4OjTFJdchaGXtLT46XhnEpcDMfacR/QCwyusTz6JEbZ5FV/OeqX9c
         8kFECg0I8I2ipEBva/rj58Z4sRiJWU2VsIpm47WQM85cbEC4EDdAWYVbOa/cAK00a2yb
         mr8L4ulh37sRvqKmTppSYCbg6RES9F/Fx6SJoHbnRF9XYZhi4+eujJvC3CHEy+bzLnvc
         7k86ZarOugRyldoFmjdsDBBt+FPtxqUhEYczeExjwCS06r0eHa3W27besyfL7Wxo6xnx
         q35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=fUZhQbLaPuWY16f2nW4F/x9o3br7tZ29FQ7xAWsWI8A=;
        b=yLXyBH3J8FIbO2qYlyRp2W7ajDD9nu286l744XQPlxYMiyEyKYK3IhDtYyHv+Tc30V
         PNUcl2r8u7xcYpovuoiYOo8t9Szsi8GVBaq8BHn4o0hzGlxZk+BEXm5H3pdHVPxAL1os
         MSD+FPWIrAySMt3bYM6Fx1B1y3B1j3uhgPMSl8r/AeiCUQcitZVpWdb95xtphDKH98Tu
         Ab0BY55dNokTHgfBIo5NsuN2Tt0HyOnaYmd7wOY+HTnD3RQtqYwFV3L7gSmbkn+2X4Z/
         CGIbgKKo2T18yq+xEzI6HMkyqE4LrCZMnFsnfTool4BfADYoXrmjdIVMze0tbYwIAj8e
         g+Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4ujSpsC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5-20020a05620a094500b007051ae48312si4933750qkw.651.2023.01.28.15.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 15:59:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4ujSpsC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLv5o-00039f-D9; Sat, 28 Jan 2023 18:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLv5m-000394-MN
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 18:58:42 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLv5l-0007oZ-3r
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 18:58:42 -0500
Received: by mail-pg1-x532.google.com with SMTP id d10so5401540pgm.13
 for <qemu-arm@nongnu.org>; Sat, 28 Jan 2023 15:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fUZhQbLaPuWY16f2nW4F/x9o3br7tZ29FQ7xAWsWI8A=;
 b=y4ujSpsCx5eamlaS+MOvZmoVUpjVOdmeBP0I/D3r15xdOm6owkVoUoXQneSWfgfddK
 sgvfO9kBvPv6uyGlPKqu1ef0SAWz/9RMFd2e3UJRGuBL9TPp1YLT8vSs8G+OhLk6TiDs
 RMW8GGjOrm01MYk2dNZieGU25y7GOejWf2hlYjmY93QxaenL8gv9bsYYQGndAcwbkuJN
 XME6318RcY6U6X7H11ErzLYaenNQaeg4dCsLSU8xMDaSlKwQlaFF47vVuseKrEqmlZwa
 J3hyUpuLo3lBP8RfF+vwfYxPenjSuKYIgRyrSRR+qWnmWuXt/mgCps9yar3j+tOmfYPD
 a3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fUZhQbLaPuWY16f2nW4F/x9o3br7tZ29FQ7xAWsWI8A=;
 b=JKWiEXBBIgGVJ8oeWzg94FKT+rj74epW9b5m50GNUC9IsiEsh/EVVtuiy60KkaOxFa
 sjqYrvQYQ/m7huNIF04tA7KuB0TCCpTwJ1WUCKhjI5ACrXMjyfSo6B/L4Ajkz9wA1+lr
 pUTwSgoK6Zy+o58telSudPksg2MtthjGfGvXYggzLo/p8hgH2NKOFT6Ep7BueI5nXFCc
 68P0dtK1/lv9THqUbPR47Mid9g3wigbozZVZNBCsz5aEX3yLoAxlziKAchFX0/vK98bK
 yf4ldZOnw3un2F1GaJjoWy6CphnMr2k7gYQ+wsl5ElcGlCn1fPgEF7BVbxLHeadp1AFR
 24Qw==
X-Gm-Message-State: AO0yUKW0pzaSL+N7UDcMC1QjdaPU74m6NgW9h6HM/dJqm2edgEc/TSfx
 612bcLHQvZ7YLyXBBcRc4bVQcA==
X-Received: by 2002:a62:6445:0:b0:592:557f:9f63 with SMTP id
 y66-20020a626445000000b00592557f9f63mr9473805pfb.11.1674950319452; 
 Sat, 28 Jan 2023 15:58:39 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 q6-20020aa79826000000b00592543d7363sm4293698pfl.1.2023.01.28.15.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:58:38 -0800 (PST)
Message-ID: <1f067e72-6313-e0c1-5d27-939dae16169a@linaro.org>
Date: Sat, 28 Jan 2023 13:58:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 21/23] target/arm: Implement the HFGITR_EL2.SVC_EL0 and
 SVC_EL1 traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: sS24e+8e9IkE

On 1/27/23 07:55, Peter Maydell wrote:
> Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 fine-grained traps.
> These trap execution of the SVC instruction from AArch32 and AArch64.
> (As usual, AArch32 can only trap from EL0, as fine grained traps are
> disabled with an AArch32 EL1.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h           |  1 +
>   target/arm/translate.h     |  2 ++
>   target/arm/helper.c        | 20 ++++++++++++++++++++
>   target/arm/translate-a64.c |  9 ++++++++-
>   target/arm/translate.c     | 12 +++++++++---
>   5 files changed, 40 insertions(+), 4 deletion

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
