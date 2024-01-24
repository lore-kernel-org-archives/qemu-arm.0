Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp603050ejq;
        Wed, 24 Jan 2024 15:17:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt8YC2mM9c7PgVXQrBMuzkTR7e761PCkFQhDCLVCQ8sQ96MDiu04R1VbHNgxC+PhNwQxR0
X-Received: by 2002:a05:620a:2904:b0:783:15f6:aed5 with SMTP id m4-20020a05620a290400b0078315f6aed5mr198145qkp.27.1706138272232;
        Wed, 24 Jan 2024 15:17:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706138272; cv=none;
        d=google.com; s=arc-20160816;
        b=m+hWYlV94XImRfrqbDPNmyIhyGOvHjXJ1WI9JXLMM1hyYht6hXIkwsgHGf/gKEOuvG
         MxodHomnlS6Qw+vu50VHCXtLNw6nKw9sUlknUSh46gO3Bogw2Bd2S4BLSGxP5i8Qi+WR
         c/75ADDtSB/Y/9scDCP57xvRTFYQjUPfWKMUOcd5dMZpV+J/YbJrzNPaOSJGW3dTNhXZ
         6bfAP+EB6jyOanfAcTJRm1hXnEuv6WUnNbK9IGZ/aRjI0+DuxOoi4LlpMPpjY9I+K80X
         VbqPV9fCiOXTWDpljadhCMhgPgtfkiGlYdefR+xAa8tw4dye9GSK61q1t+3BH+DalNHl
         htCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ar8qTwZwDiCd6oqwxtRWwP5S2G1AsLdhKA+gGlZlmdA=;
        fh=tvSoKfKG0C5+rZg70buX4YLSasjjtzKPCVsIOCyBYc8=;
        b=YYrIEZTcPAT8DCngGJ1YWTUbjSAMBsGzBXJYxZ3VqBGB9jX4F3RMYOYlHHHPzytuIq
         eZQH5bCyEg59IYz7K2UMnXSkFEYoE32fEn7cRYlff0MO5rdkYcLJMVBChTqr0FqSFyRU
         TFEUPDxW7Gv3rQU0lE6mv3YSbccYEYLuWFyFotTnCEU15H5OpQXJfUubd6J+oQbyTTpt
         suwCgYAgoEL8sbLKHYx1my1xLorR1LqzXPYn+kA+3doMYEMYxqD4aeIp/pGqACMeqFht
         M1w+5tGh0e1lxJE4luqV0+j1eUEqNEBTISaKilptGbltzzl4OwdvhUqAzKfxi/8WHBiG
         MhmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cZTGgw+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020ae9e303000000b007833f97be81si11021618qkf.606.2024.01.24.15.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 15:17:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cZTGgw+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSmV3-000229-A8; Wed, 24 Jan 2024 18:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmV1-00021k-M5
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:17:39 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmV0-0005UZ-5x
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:17:39 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6ddc0c02665so717180b3a.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 15:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706138256; x=1706743056; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ar8qTwZwDiCd6oqwxtRWwP5S2G1AsLdhKA+gGlZlmdA=;
 b=cZTGgw+l+qo1JmgnxpElGtJ0s1mJwVqxfyORH7//nio2Mpd2pRWKl3bPzXFgdGmT/5
 v2NHk7W0ru+bVnW2TwpI8rGjfs/aQ0eo9tUuBSfD/ZMAiGlN1ntrlowZ19ZMGZPew4GN
 GSPdOIUgPUsZc3DAI+3B2QS4Cj88P607VZ6hSP6fiVUCPyDw6VEYV4GDXFuTpHMXWpHt
 2ouiUxCo+I1O/FLP1iULE4izSPHriUOGZm8g56nl93orkP/77wkj9roUR/I/aN9/MADE
 M3S57vhnapEGizh1RLVN2No0DY87MhXp3mst/qjNbWqTERlAlmhI1m1Kgc3EMbi0A2C+
 wTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706138256; x=1706743056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ar8qTwZwDiCd6oqwxtRWwP5S2G1AsLdhKA+gGlZlmdA=;
 b=Ky/bOCSwil6vt5NLFGa99wql8LYBGHEUL29+/Hxv/wVISsJsmpXuMq4teGEeO1J5zj
 qqV+bD1Lgdp4bp3Us9I5AWm8qGqL9E/cKntvUM0y5BvRCDqL7MyGMCQMHneX4tQbpjSV
 5ReAlaDK1MrqoZKUHPuqSn/jFTMmzwWiLhrNGdQyBXamvyW647u02SVk99bz3umyRO+b
 W8Mutr7Qa7LG1XtKT/TYcvhvCJEoBSHDrEY/UWBA06MpFiuevkF+XbIedfCfwSjzyoto
 lwt7snbN3oOaJ70TQTLcQxdLXZLjNo45/5tX6IT5vqYZoejx6j8wUj8VQQc1Q+GAwqDQ
 8ofA==
X-Gm-Message-State: AOJu0Yxh02egYNe0dvLo4ILJrdbm61NcNQhZwKICKnlCyXSFOedpOLZy
 w9DdT7E8ZM3mlI9aZ/XGOhMNMBtbQG611umD+rHArVXP52YzjLwViNQglFOZ+QI=
X-Received: by 2002:a05:6a00:2d1c:b0:6d9:af69:b704 with SMTP id
 fa28-20020a056a002d1c00b006d9af69b704mr321198pfb.13.1706138256382; 
 Wed, 24 Jan 2024 15:17:36 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:5fcf:9e3:2e58:9c7?
 (2001-44b8-2176-c800-5fcf-09e3-2e58-09c7.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:5fcf:9e3:2e58:9c7])
 by smtp.gmail.com with ESMTPSA id
 ks11-20020a056a004b8b00b006d6b91c6eb6sm14657150pfb.13.2024.01.24.15.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 15:17:36 -0800 (PST)
Message-ID: <6c17d610-e029-4614-9275-f5420d0b05df@linaro.org>
Date: Thu, 25 Jan 2024 09:17:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] hw/arm/aspeed: Introduce aspeed_soc_cpu_type()
 helper
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123224842.18485-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: USYzoiQsggQa

On 1/24/24 08:48, Philippe Mathieu-Daudé wrote:
> In order to alter AspeedSoCClass::cpu_type in the next
> commit, introduce the aspeed_soc_cpu_type() helper to
> retrieve the per-SoC CPU type from AspeedSoCClass.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/arm/aspeed_soc.h | 1 +
>   hw/arm/aspeed_ast10x0.c     | 2 +-
>   hw/arm/aspeed_ast2400.c     | 3 ++-
>   hw/arm/aspeed_ast2600.c     | 3 ++-
>   hw/arm/aspeed_soc_common.c  | 5 +++++
>   5 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/inclu

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
