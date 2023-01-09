Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2435357ejc;
        Mon, 9 Jan 2023 09:10:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsLfHpllWaJiuFGPemQeMgGSq1Ch6jcydsGlhdz62HLapy1OGLQPR4/dfRGTskGMsfcpAKL
X-Received: by 2002:a05:7500:4225:b0:ef:b1b3:2b44 with SMTP id cs37-20020a057500422500b000efb1b32b44mr2172827gab.19.1673284257593;
        Mon, 09 Jan 2023 09:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673284257; cv=none;
        d=google.com; s=arc-20160816;
        b=MlwgS/awHKpmL6WWpDloEfOwKiHciViCHapTch0hD7IcGDzJYt/mzjsX/2rwFeH8PO
         eP45IS911ry52vJ6990/jV4GDnanUP7fE9m4tFT79/nENQ624DoDdqRsxJLwOqbqIMmh
         nWaTloltAzFhuNDL0M9SmnoJ8fhoO4WBwGcRLZh+2DNW8KV6czvvj2riTn/xxTemXPZ7
         zUmUQqEWTGCcq9Bf2izwaY7MuHqhQPsiEOOFTmjx0RwKntyXjeepfwwWkDH+zsfNxcrg
         le3+z/pM9zuy7RHPQoHWr/MEnlIWjEE5oNSIX7NH3u4mmEiYriJ2hJmoQ72f7Nh0vbU3
         3mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AIOT4fQm88bY3nukiIoBLVundet+q8eP5txDbQng3o0=;
        b=gIa0AS8I3JEQMg3yxTMbVlAp9iAfhOG3gNSkwx8+Oce+uE2WcRK1Tse10HWaw6LkCL
         oyb6B3TWoUPGy2U5Nfs0SfcuEVjOpKe/8fS/k0GBoW2igSGOyqh2b+77ZSwwwZQRUPLG
         ae7Qc8w34HGWGi3f+/XqBO4ANxbXDDTYh3Ljk0a4UkLpwpvn8jpJvIKWLzqHyQe8tMnQ
         qVKDoarkWWmR/ilIn3Baail/oPvZcQQVEJdQgpRmt6TiojVgUyI/0jo6IjntEmpkX59k
         5z1jMvpy+bHicqd+lJof+H+aVnb+rd9GknHZy07HQr3cuIVgHbTxy7iGFzTEBysoakWF
         lizQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PlBkNFG6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a05620a0d8700b006fc9629b552si4814752qkl.232.2023.01.09.09.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:10:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PlBkNFG6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEvfa-0003jq-F5; Mon, 09 Jan 2023 12:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvfW-0003g0-TN
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 12:10:43 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvfU-00026s-Vb
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 12:10:42 -0500
Received: by mail-pl1-x632.google.com with SMTP id 17so10253077pll.0
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 09:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AIOT4fQm88bY3nukiIoBLVundet+q8eP5txDbQng3o0=;
 b=PlBkNFG6T+NyblSKwcXi+hrcEwtD+4Er6Mhc1V9qmezvA+VCXAYdg/zsQrjzksHc+a
 FPqEYO0gDuh6VFRSc4HbjecHvROVtN4Y2nEuv1883e89erZd1WuykifCeKqTnVg60d3D
 AzwW5rA/nnj3IlTIuR3dRI7LdCbp3MO/PL2cGaB4673wwmdU6sOn7+Re473dpEkazWv1
 8SfomeHjr3ww5LJ5mVnXKGSppu2Z1XXGn75UW+U2qqWuIG5YQlt465iFj7tQldP887A/
 hhD/c9RuFyUCocqezKtTu2LjpDqngzMkmQtpXc5SvGbhyemGTJPnFF70FbJuGRfkfVfG
 nYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AIOT4fQm88bY3nukiIoBLVundet+q8eP5txDbQng3o0=;
 b=b+ytHq8Pv0Z5aosqz6r0hJ5V30pEYmsE/BAqcqrxUeQeMl7NKvs4DvC8IeWEJBmhNF
 16nSIRaX9B6hhqSpcpkGJL3v7L5WDtNDFB/d9xEtutGogYOjNLxmyyyGUwLjg6jScrK7
 DHEelzZ53pljgbFqSdcV8VeOk3n5V15VtrPtgJ+HO2repdLtpQ634JlYlhOkzryBChN6
 DJZeND/Dd+PqlGJlG4n4aQ6qoYFYBl1fZWz9wURw+U9JzsJ45/+m+UwcxbgY2h9eUDHG
 yXLxWHJJoDsdgbVG4RepGGCpT7xBCPvgd5FZc7kVIq4G/96lLV+VooPHLyBjVAbP4uoa
 QpZA==
X-Gm-Message-State: AFqh2krzkegrdS3eA76eFolO/E8mBrO/phM9Br2mWqHVyrqdXWhRcfvb
 qP8KxVnPahSvL+J3ONNiqSI01w==
X-Received: by 2002:a17:90a:db8a:b0:226:632c:abbd with SMTP id
 h10-20020a17090adb8a00b00226632cabbdmr29168813pjv.47.1673284239016; 
 Mon, 09 Jan 2023 09:10:39 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 s88-20020a17090a69e100b002262ab43327sm4391918pjj.26.2023.01.09.09.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:10:38 -0800 (PST)
Message-ID: <2014fe15-2dba-5afc-4c06-5436caf53ca6@linaro.org>
Date: Mon, 9 Jan 2023 09:10:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] hw/i2c/versatile_i2c: Replace TYPE_VERSATILE_I2C ->
 TYPE_ARM_SBCON_I2C
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109091754.79499-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: Xmh/z2vsls3v

On 1/9/23 01:17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c              | 2 +-
>   hw/arm/versatilepb.c           | 2 +-
>   hw/arm/vexpress.c              | 2 +-
>   hw/i2c/versatile_i2c.c         | 4 ++--
>   include/hw/i2c/arm_sbcon_i2c.h | 3 +--
>   5 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
