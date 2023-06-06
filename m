Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3529028ejb;
        Tue, 6 Jun 2023 07:29:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4iYv3DnauKcQ3/QvmhBL5j+CeXNScGX+VLEvC39f8eyeb4/sg11iMdpLun28EWzblkGD2m
X-Received: by 2002:a05:6214:5184:b0:5c8:403a:22f8 with SMTP id kl4-20020a056214518400b005c8403a22f8mr2490864qvb.5.1686061774714;
        Tue, 06 Jun 2023 07:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686061774; cv=none;
        d=google.com; s=arc-20160816;
        b=klx5aHlRqxQK4NajLrdLYE02+cnILB78Kc+/sSM3sMyb9eMl1OsuiR1YYl9gUUReiS
         bFOdsovTJToXf4mZ05ejaCxiunQvEBFm0o1xrdh6WO3G1ncTSXcKH0JdUJfyprCljyv3
         X4CaKl6dGtEVkxGUzebigyOOcQszPL2bwzUZXtqL0Ei1v1Ix6BRsRtpGfSHGIfgQlWgl
         0DxWhTI6/GS/9KwaLyvaTVOZ4xJMkXChPBIzSCFOQcSoYItS4x9joNwFw7nARqYIcSye
         NGbJXXSGhLmGnR+NzofvvuAsj5mJwBvhbl5zntxSqQz9VPS41rbB+Rw+VxILLS8gxi6p
         lF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/vPWGvGYYvst6yBTzH0eOa6O9kW455f/dKimEzwjIyI=;
        b=BAVXhRgneq8ZmNzX2YyGPwaE9/xnnvVVbE34/+GFTwxjiYtWbXI1rbbIKWvwKRecG9
         Nlj4saFtBM3nyVf7bqRrZWCHn5QeyvlapgL3APOV9rDIdu2favW2kYfd59NJKPxw0bED
         kT6faaShza1Dv9/1NvXnqUVm5q3LycmyUIAcLKMbn1M4J/alSVS2bhA234g4b3pesOYq
         aa6t38F6lfuNTOCZueaWLmfwD21HHMXekVTHB2z10JAVckMFcD3ZoWBJFqs1KoOYUxc9
         avhzfVjeAKRGLGDkf3n4lqOIkgUT2y6ckH07g19X/Sm400jid9SFQSSypi5NRwNjjb6H
         3bCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k+SpMG79;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ac84e8a000000b003f6a6e9eddbsi6320554qtp.37.2023.06.06.07.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:29:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k+SpMG79;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Xgf-0002oJ-8D; Tue, 06 Jun 2023 10:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xgc-0002m1-NS
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:29:26 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6XgZ-0000Ue-Ua
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:29:25 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b0424c5137so53550995ad.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686061761; x=1688653761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/vPWGvGYYvst6yBTzH0eOa6O9kW455f/dKimEzwjIyI=;
 b=k+SpMG79UWbiptQrEPiAlRZfQowd7+u6FFbkbv6DKvTh/QFfp3lFJQkL9ErJedsjXG
 LOBCKogBdJX6tQepO0gntEvOKQL344BbOSQLBEbcQe7nww4IFb3XxHG8KFU32NiLJH7i
 hW0FKMFNKAn6L8r1dE6CRgI/p14YKTpNIQWKdEjuuNDtRHxwuDVuZIujXTN5MCbXMm+D
 yPTjeRldieJsVBizB9OxyfmimUQITrMYeSnFhmUJicxxUIqUfvlFhn+PfoRYwMqBvxqE
 +22kQXgDaxOdMLnpLgaavz9medRDRIkt7XhVf1e+3TMOvds0H52iv+yfc2ex+BUOG8zU
 4eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686061761; x=1688653761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/vPWGvGYYvst6yBTzH0eOa6O9kW455f/dKimEzwjIyI=;
 b=AIyzr+gRJnGNTIMRO28RI0VFr/c5cx7JAfAFBaksVJ98aqtWQwnsdx8BABlGoB49zW
 OAzotLnmWQqEQaBuAK5g7TuuH32sxk0LpnuMBkNGrIPx8MbnGvgN0iOybSpvlFVb3aIX
 JEN0AB9o/KJi9IXcla1qFtDsVWGQLOcBGZirUHS7CIr4eaWP4RkUHmP34kIlvYX1CngF
 Tj2gm7iJxzcC6o+MNKBen9EmKAFOuL7aknrx3I9rS6Jyh225ZixzkSGSg7l77kevDaOs
 11s/kdqvbHLrL8L+eYnMn/Ei8cz0YSa459FjoVXd4qXH8eWG+DYO3pIWpoml5y0T3TRo
 OQFQ==
X-Gm-Message-State: AC+VfDzzWsqk7l2X4H9ISeP2k6MAwyoIFoqFo8Fbn0H4n1IQdv5xs0lj
 9g9gfMKC/7TtbZeVLEt7Q3yniJ0aH+fBBb45AGQ=
X-Received: by 2002:a17:902:ba83:b0:1b2:1a79:9a67 with SMTP id
 k3-20020a170902ba8300b001b21a799a67mr2022710pls.50.1686061761267; 
 Tue, 06 Jun 2023 07:29:21 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a17090300d500b001ae469ca0c0sm8607488plc.245.2023.06.06.07.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:29:20 -0700 (PDT)
Message-ID: <c28e9cf1-5fa2-c63d-bb59-fbb4555e0150@linaro.org>
Date: Tue, 6 Jun 2023 07:29:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] bsd-user: Rename elfcore.c -> elfcore.c.inc
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Warner Losh <imp@bsdimp.com>
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606141252.95032-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: f77vXKXS4WzQ

On 6/6/23 07:12, Philippe Mathieu-Daudé wrote:
> Since commit 139c1837db ("meson: rename included C source files
> to .c.inc"), QEMU standard procedure for included C files is to
> use *.c.inc.
> 
> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> about includes") this is documented as the Coding Style:
> 
>    If you do use template header files they should be named with
>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>    being included for expansion.
> 
> Therefore rename the included 'elfcore.c' as 'elfcore.c.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   bsd-user/elfload.c                    | 2 +-
>   bsd-user/{elfcore.c => elfcore.c.inc} | 0
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename bsd-user/{elfcore.c => elfcore.c.inc} (100%)

Assuming Warner doesn't simply want to merge this small file, or compile it separately. It 
isn't actually included more than once.


r~
