Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1723264lfb;
        Fri, 13 Nov 2020 13:23:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuHY1WpZy/P9g8dBmR372m0k8UUxTmqoo7GQoA5ZNGA26r6b6pL5uW53nBSB+Vl6H0VAiU
X-Received: by 2002:a25:9746:: with SMTP id h6mr4755703ybo.222.1605302624723;
        Fri, 13 Nov 2020 13:23:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605302624; cv=none;
        d=google.com; s=arc-20160816;
        b=AGW3J89PSFIJpHfChp/g6V/++/gae6oGkgnwY8olQJJkPTIBhH0K+q5FfCcVAO9Has
         +TdR2LtoYPefIZBg8mNng0dsbwfHJcm5sYZK8Rq5nMVSmruHt1YKhlhGJEyiy+074BQB
         gBQiSgTuyalvyLrQx1Qkrg1PkzkbnRoUkkaWnulxQ7RW79zaIBsQ2uTd+HD3kexjb2Lm
         03PaqiA54/Z2nKWLVfiE5UTu6TROZhIfuqyeLT6/E+BSVLySMK1yqV5Gp1Fi83m+FLDj
         m9OYgg6wGHBhOBKHYT4JxX/TXYjqEYS7mzuLTwptazdBwzqDoodwC0LH+tC4rwomuBWz
         iF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ARakbEpfTjlW/CporQaHNDjMDIpvCNcE5Rvst0G22LY=;
        b=cODRfHy0Y/HSgUwp7L8srLDQg/2SNI/fgzpqKngWmrsZ5n2fUM8geOf44ZPu9qi4zT
         VWQ+ShSyriVREg/2cE1PMufRoDNFkKYf0BTFY0Az1IcxHkGu+165qrISDlb+1TBjF31b
         /f20SLAHa9fU8hGTph1Ita8LNy6qW18lsUbZR3dNeikJ6VOhD5xEEAn/Fa6ruAcrqgts
         kgjsdj4d+RTu0PGieNSha45fkdJCofMjfIqLyZCx3mPff4q8RnOrwE58GaaC430b36C4
         D3OQKsN18+FdBsvnHJuMUQy2CfllNW+Brnu/IzTTV3rDWD2Nc12DEQSBFHSqZ26dIO/S
         zNGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWtKmhFC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si9145063ybt.449.2020.11.13.13.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 13:23:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWtKmhFC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdgXo-0005RF-49
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 16:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgTU-0003Ul-IA
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:19:16 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgTR-0005aB-ER
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:19:16 -0500
Received: by mail-pf1-x442.google.com with SMTP id a18so8700646pfl.3
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 13:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ARakbEpfTjlW/CporQaHNDjMDIpvCNcE5Rvst0G22LY=;
 b=jWtKmhFCRYC7lJokws95Z+sWZU5DQciqpK2/CwxYH8K2SUaIHej6IRxAe2CR+MD25X
 B7nGY/Lt+K1nJcyS0m/x/s8KQEwccIOu26N5yF4K1v3U4PmHhBtI6HxJn0KXz1hhnGL5
 /viA3fph9d3H0w2xTU8iRh43Dt+dPiHzsajKW04KeFEUI2H374Y4FP99Gtr5Pa6/3yE7
 i+2bbx8HfXcSa07bcJj2quSFAcejNcnDzyYb+IJYq30j9KQKvd8SsTXEoLN1bpaIH0E7
 u8Cddd/gTgDs3wyuSnGSD5trRSdxlo3hO0ylbUlvXybSGWE+4MraYVPwPqBzC/XEQZXe
 +pAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ARakbEpfTjlW/CporQaHNDjMDIpvCNcE5Rvst0G22LY=;
 b=RQ6RtgPNADxwOVAG3UcdmT21uGUYopqa6pnRMjBrG3YzIS8gQ6JjSF2Qof9d7B3e/H
 8j8w4Up7XEiq1ruHzmgrgzzb0vzJ1eltBL82DFOkkSUdqq0HQ20utUTaRB7Gikovb23U
 pQmj5ms5zPkNdBGnoHcXaOzD4ezYoNcU4EBtBPC1tH3B2+fvOVS2GLbvtAg7rKMe2fDj
 aCdz92OtQXioRzeCnK1OPt/dGF3TEaiW5pX6jh6EkHdQuyeObzZnjilcio15/Qz3MmMn
 hsxARfaSAu6wSkUm5C8xvhj1GbhRTSetBBx7W9JXT8d5zQFOak906nTyPB6Aduimwuw/
 yEjw==
X-Gm-Message-State: AOAM530ZblRodIZ1Wot/y2a+Xxz9aIrrMnWZYTER5bxB4BdmHR/OIz7v
 2vKi750/9an3yIUQYIwjgbHb2Cb4EFxvWw==
X-Received: by 2002:aa7:80c9:0:b029:164:4ca1:fff with SMTP id
 a9-20020aa780c90000b02901644ca10fffmr3777522pfn.11.1605302351823; 
 Fri, 13 Nov 2020 13:19:11 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t32sm10156626pgl.0.2020.11.13.13.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:19:11 -0800 (PST)
Subject: Re: [PATCH 02/17] target/arm: add arm_is_el2_enabled() helper
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-2-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e9b9ec7-b9ed-e9fa-7b6c-4e1e72eb88ad@linaro.org>
Date: Fri, 13 Nov 2020 13:19:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-2-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lC7ia3jBm4ln

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This checks if EL2 is enabled (meaning EL2 registers take effects) in
> the current security context.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
