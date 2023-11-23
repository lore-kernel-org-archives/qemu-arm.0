Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp318364ejj;
        Thu, 23 Nov 2023 03:32:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWUZEmo4HEyLocnLRSlNJ07l4/H4Y1VXigEMVxVVguTDh78XpEyPw5ekeMFUMhNFTs6+Bb
X-Received: by 2002:a05:6214:416:b0:66d:12e0:2555 with SMTP id z22-20020a056214041600b0066d12e02555mr7165980qvx.33.1700739173341;
        Thu, 23 Nov 2023 03:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739173; cv=none;
        d=google.com; s=arc-20160816;
        b=hev6pygn5I3TfeAAndBwueEwlU0rKiqWtxao947kzb6tqTmSn7KSbNIaGHGYs3dLtu
         Npfao3ljzTIG8AyauLUiNFHlWM8tIw8AS1HLRVqba2SO3uVLI6eVV7i7smw9OqrNZxXV
         y23DcswA3cN1xPRWz/VeFlSq/BaToLHbon0dAlVVCrblQkrNeKs/F5okJw+hloFJtheO
         IlKBwhaK6+/ETG9UgpV4YqpAumVtLolj/0LBvfNx/x3lG16HykBUl5Dcr16kuTcToJ7v
         UMRz2Ag6DUa+u3CsdfADr6N8R6eroVAWTmaetvbzHPfmkGUdvqzbTXh1uFQwnLLShzFg
         4www==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nKMHAldA0xtCW4LMvRQ/m87RPK2lEK+fsidykowiNZ4=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=cOcNra01ZntVClyGCka2+Y8wMjalOowswBs2JzOaNENQ1Eg8SLnEoMml6L6MYoHNI2
         t8RgfdiBvMGeErRv2dJ0wdnWvmtQrvlLBniOgtem4xLEhkWy4yxHSV5DPdyWe0AlYwUZ
         tWeZQz3zfSmOYeYRoJJirztQuvBSBoA/dQVCdURktMhpOZrDGGkgOTfbGr+gHDILkHle
         ka0OOQ7Uyw8bz5NtVGuWfP2o57jyq7dcZM63rVLeZJa0R9T2SsZe/YutizCqbARAnWRt
         VpsTbi6L7PRV0JSJrdyoKUov8SBRajdzpK3Zexnj6O0J1sndeQqS8Q6yq5k7oSC8wSp/
         CADg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZXphbhuJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020ad44bad000000b0067800f020fesi948894qvw.481.2023.11.23.03.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:32:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZXphbhuJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r67wa-0008MX-Ga; Thu, 23 Nov 2023 06:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67wX-0008Lg-AD
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 06:32:26 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67wV-0001uE-Oz
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 06:32:25 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b2fa4ec5eso4849235e9.2
 for <qemu-devel@nongnu.org>; Thu, 23 Nov 2023 03:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739142; x=1701343942; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nKMHAldA0xtCW4LMvRQ/m87RPK2lEK+fsidykowiNZ4=;
 b=ZXphbhuJZZO0BaRNaPBayS6L3kvnO189J1qNAx9a17vtphB0+TvPXpFLFM3vO5gexf
 8UlsOi0DGBgxYRI3u8XEgG8ywJJt6oRalmhZdUoVx0j6BUk2+QnOI0Na2+gIu9IC6rmS
 WkAVVSEM7mq2Qhk4jK+UF0ujM/PIM35tUt0tTeqn39xMHotQI4iRSNTAO1lztU9I8/an
 jC2nR68guG3DmWrlyC82p0L6zCgOb5CefdDBDv3VYxRpRDoFrrbh9vnXIKR3FaA7RO2h
 LgyHNYPTpgBMy1HRGia4NRgiI2e2XsNudBHR192qz1peRgd5cvom9EbnbKlKP99Lz8Fv
 uNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739142; x=1701343942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKMHAldA0xtCW4LMvRQ/m87RPK2lEK+fsidykowiNZ4=;
 b=dYZw47ruKmbB9HUnQ1xcca5562/4xWXssLidDznIAPxbrCG14HXEVcOHO5HD5q+1Au
 Nmh6U1cmf7Zup2uGrPaTRJA4Q3Wlv6TLd9GuQU4xKWyk2r+cyB3TLW7E8xCgEY3REnL5
 SqYzmbH2y8pJO4WGYFieV6XSbJRLoizq/tp+UzWp2P7rnNRjWaxodL8evb4i0qrFATW0
 sjzBfvxIMwBogSwMtjVNdA26Z6d+qM6g5bGRyRr56QO6qEGlw4JLWmBBE13bGqGa1MW0
 Kq/T3ey82QHetORNtVuvwA8eLrBs7mJFxeCA7tFwO+LlehPu3eCYNsWaa4T9M0CTQ8jB
 G66g==
X-Gm-Message-State: AOJu0Yz6o5CNZAGeB1Bof28mQoWCl9HIsb5NRZQY/kVxxJ8UIwMTlXmx
 2Gp//f5T/UAsu0bzVKpWcqKlXA==
X-Received: by 2002:a05:600c:24d:b0:40a:2cc1:9af7 with SMTP id
 13-20020a05600c024d00b0040a2cc19af7mr3446204wmj.14.1700739142264; 
 Thu, 23 Nov 2023 03:32:22 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b00332cb23ccbdsm1381619wrt.81.2023.11.23.03.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:32:21 -0800 (PST)
Message-ID: <b901fb69-d3ff-4301-9af7-7379970d8aea@linaro.org>
Date: Thu, 23 Nov 2023 12:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/21] target/arm/kvm: Move
 kvm_arm_verify_ext_dabt_pending and unexport
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Z8y2HlQp3HjF

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 10 --------
>   target/arm/kvm.c     | 57 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/kvm64.c   | 49 -------------------------------------
>   3 files changed, 57 insertions(+), 59 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

