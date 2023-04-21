Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1460939ejm;
        Fri, 21 Apr 2023 16:06:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350azAsSu2IfPi792bWXuyYdIg8PkQNvOzOp2Ano4pQA9hfBh6J/IncoT4zPKCvDTMSDoa+yz
X-Received: by 2002:ad4:5d66:0:b0:5aa:8e3e:496e with SMTP id fn6-20020ad45d66000000b005aa8e3e496emr13019820qvb.34.1682118371650;
        Fri, 21 Apr 2023 16:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682118371; cv=none;
        d=google.com; s=arc-20160816;
        b=NsK0spYEJsTj/yQgvzzWLOOpDPNDrzTKJShBBzhVqakFyjN9rWtEbvJ/rlKQIE4D6T
         hJREy9ViCtPZ/SDfKly3JAdlcf013RFeXDUFajyeaMsNqVcOOMd1FB3aUHfDd0aKFM2T
         Hxg+ebxe5tbrgJyTfkGbNez4xwrayzUAvaHJaUdplheW6kkemObAhV+kJfnf+XGeX4Wn
         sodSRGu+KlU0tyaC8gbpvHUmrdoeO3DDs8c+vijYcWjtQZ8AINFQyMnnwQjGgA09dEuh
         td66LaCmsPb102Z2lS2yQH4ryfv4JzKTu8lKXF+dJnNcDN4PLnXjEBjqBtrMh2az+sg6
         KtYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=v4E/TTQoNyryE4+v+kHxboiFONAq4RAlalVf9lU2Xuo=;
        b=lsmJYsIbMR8lwsJnLLH3HYtMKRDpRM1SixHH11JTqA99Jk20E71UViYK8RNSVVS3sa
         2c2KZTiZrxv+E08yQnoxdefuF4ur9DVYGMy2I88VZ8suz5Emq9jukoHwwiAFWF8evlNe
         hpz1aVFonxk7l1NtiXveFDBb2iuaOfDZmCtkAagKfv3O3XMRM25T80VfTc1cJVQAl4nt
         W2WNauTXHn4Qg+BOcfuO4g5ad5ueFcsVz269zVKVjQ+IC44VI1vmWrEZmZ8egPMq8GTU
         NBIV5Ld+BrIhUab1N0mtO+8JTHktE/VEKmAq13qtBJtNR3IeGi2uA3j9PUDsJlHsvRhH
         SFpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zb4yTepi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020a0562141c0500b005eb86aa9652si3776693qvc.600.2023.04.21.16.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 16:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zb4yTepi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppzoz-0002lG-QH; Fri, 21 Apr 2023 19:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzox-0002jt-MJ
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 19:05:39 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzov-0006ei-7b
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 19:05:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f833bda191so1419128f8f.1
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 16:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682118335; x=1684710335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v4E/TTQoNyryE4+v+kHxboiFONAq4RAlalVf9lU2Xuo=;
 b=zb4yTepiMnvUtKtLSEy0jtg97JDHqezV7lz6JaYUhz9hkn/hRbDIj9q5Z1Ukvip7zd
 xzvvKUzl5LBRUjywqhoYONnqaXBweKu36ghZ3v6sitzR/Ke6Yn2BjicyAbhZ5FG/jlOO
 WweGyQPlCZiIEeiz4JpigRxId0+DispJKjqFNVj4dNRH112Ncm7ngdS3Sl8Sn4Pyc+eo
 N16FHAEaujzlJJDNvaehFMDghd28MkJ4Kx7E6LRdxgv3x5A7E1+L3MK0S3VkombYLNuI
 yize2VSqULDKg1ZtFBPRmnpBHSFhSv8VpF2xd5mUUeQ12mcyxnuSAwrBNlP6sMcLQvY4
 s7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682118335; x=1684710335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v4E/TTQoNyryE4+v+kHxboiFONAq4RAlalVf9lU2Xuo=;
 b=diVceOeOLiCEazZkOH02qw6ErSEDkqUSoMsNRoWmJqKveYzxyeSRsv9uTDi+MUn2Wj
 bAYMqtLMbNzu3x/TilD3ledTob17ZjeJc0z8aAxooDR1MkKXU1BAmEMxam2khSWYiqV0
 8OR3q/vHjmyBB7bLYwGBZm1D7Ay6dlBeqRw6JpTgeQG4WaDRLn9utNWSEMV3fTYr+Lg3
 x2yQMyUjsC8bnQVyY6ro+UGurtM2CXIcp90UT8z+VqO+aMB0AtA4BEQc1HuqTRk4b/IX
 csPSQPULf3GOTz0SZdmIQq17buq1IlIEDR/W+gL8EP92+8y5hdg77FZn4co2KYhW0mTJ
 imdQ==
X-Gm-Message-State: AAQBX9dzDUSNAHS/ipj1HYWsaSRgQrIL6i4+H6mylIqyugbj1pdV9igq
 S+DbmLdwMmoiNgkljWTTD96wBYhlYH8QwuJy4hQ=
X-Received: by 2002:a5d:66c2:0:b0:2ef:af46:1278 with SMTP id
 k2-20020a5d66c2000000b002efaf461278mr5584797wrw.10.1682118335637; 
 Fri, 21 Apr 2023 16:05:35 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4410000000b002f79ea6746asm5320864wrq.94.2023.04.21.16.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 16:05:35 -0700 (PDT)
Message-ID: <1c175f9c-180b-5181-1e33-4d9fa13a00ed@linaro.org>
Date: Sat, 22 Apr 2023 01:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 17/54] tcg: Introduce tcg_out_xchg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aDw6BqQcuNNn

On 11/4/23 03:04, Richard Henderson wrote:
> We will want a backend interface for register swapping.
> This is only properly defined for x86; all others get a
> stub version that always indicates failure.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        | 2 ++
>   tcg/aarch64/tcg-target.c.inc     | 5 +++++
>   tcg/arm/tcg-target.c.inc         | 5 +++++
>   tcg/i386/tcg-target.c.inc        | 8 ++++++++
>   tcg/loongarch64/tcg-target.c.inc | 5 +++++
>   tcg/mips/tcg-target.c.inc        | 5 +++++
>   tcg/ppc/tcg-target.c.inc         | 5 +++++
>   tcg/riscv/tcg-target.c.inc       | 5 +++++
>   tcg/s390x/tcg-target.c.inc       | 5 +++++
>   tcg/sparc64/tcg-target.c.inc     | 5 +++++
>   tcg/tci/tcg-target.c.inc         | 5 +++++
>   11 files changed, 55 insertions(+)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 328e018a80..fde5ccc57c 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -115,6 +115,8 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
>   static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
>   static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg);
>   static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
> +static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
> +    __attribute__((unused));

Can you document this in docs/devel/tcg-ops.rst?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

