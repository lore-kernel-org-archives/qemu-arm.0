Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1009924njb;
        Mon, 9 Sep 2024 10:43:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXESOpGaGUflEWzSKsCtX9vKmuXypeTTGnLphKKmXkQkHlQYCXRkFGSTdy4TlhhdkMmG3fsn3uWr7BIrg==@linaro.org
X-Google-Smtp-Source: AGHT+IE5tBDPCNLto5LfeVSkKtzdlIc6lKjrBXyCxyZbjJWEG0wAGVntkRnykRuis04aEZgrN8YD
X-Received: by 2002:a05:622a:1b90:b0:458:2a4f:c204 with SMTP id d75a77b69052e-4582a4fcc2amr63568141cf.39.1725903818672;
        Mon, 09 Sep 2024 10:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725903818; cv=none;
        d=google.com; s=arc-20240605;
        b=QUnpftN/n8XqQ1en+D91hg6OqHDOKCxZled8rkV2q8UA/sB99+x2/c8gMFm1GUMfTm
         4dVtafajPY7vcW67he21Wexms08Hh8OTJC+9UEbnNH61odhRRiwUtEXRUKPNPG72ftKr
         V/GyI/8QdXfI/dOXHVXCwedPsPDSsmE29gdCzllhmWS91l42bXwkhXpSdAZ0VKSjm+b0
         jeHEqyXGgiXlJCw4OA4Fw8I6iWXhjd9BHaHMZlJPenWqlnOZp5HLNC+g1N6fnM/JqU2u
         f0ijmb5qfMmj88qW+gUPdX41bPfQUeWIkaS9ODyatAfS8eBK1aR6cH9MRS+oT+Bm++MU
         3ONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=JxTDx8eoVUEAljuYGurj6YB5cLMFbf3dvrrf5/ODnI4=;
        fh=rcvqgi/8DLXQ1PoZyfOrnF1J990FJOMArZhBeuuskbo=;
        b=BpHe1jSnJ5wgm6usdLJQsezbwBNbctQ4c2ihRm59sI4LjW19ZoaSTeN2za4wnr02g8
         LB/6mv244udLKEXojxhjjDX3trftniKHkGwy59LrOmT0LXqQtzL4Lyc/Ly4Xangv58qz
         aKf3ueE+Do/V6uf26gxmCHuQKc5OQcd+jp0pqaflY+EZo9uElsqRCJUlD2mNbuqHhJK7
         A8UwvYkyvRC4DJSWrdb3bwWhX4lFGj8UlWsUDQ0y9CMiJ1oT1vte3lF3gKFxaNvSsMFP
         d3c4YdCvAkCk96wXPd1Bo2zUU9MpnufLl2I4HaXQavnfCmG+ArNlIktq1obMFHcfIjSm
         c2tA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tBrSq0/M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e62d00si58838921cf.122.2024.09.09.10.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 10:43:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tBrSq0/M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sniQB-0002A3-Ic; Mon, 09 Sep 2024 13:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniQ9-0001zi-LZ
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:43:25 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniQ8-0007Tq-3U
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:43:25 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso62549681fa.2
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 10:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725903802; x=1726508602; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JxTDx8eoVUEAljuYGurj6YB5cLMFbf3dvrrf5/ODnI4=;
 b=tBrSq0/MfmpuedyDSAofLu3MP+gyqb75o3Ci02bA8k0JJ4Etq5rrgCWLhJTFahmLJr
 a++5ByS7/FifMMKC5FudSLhoyk2q+6Opi2lNS2Dq/91ZqejZgj1V41D8sTB9gXSss3DR
 eIQQJ+guxmsRvLY8D/O4K0dl7VR0mjtj7VULxh89rYqmHtofg7pSU8hvxpdkDNbW/mRS
 J5X49zqmiElXWLgTs61v9um7PlkSOkO1aw3QKg2shpcBsr/HxNP6nShfBWCLOjdMQBI2
 glY91Ph3+RYTK0SI6kHhX5h1WydlJ1zySF9PkYole3sZCN3V77+X6sw7VLz+1RI/9nDc
 YgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725903802; x=1726508602;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JxTDx8eoVUEAljuYGurj6YB5cLMFbf3dvrrf5/ODnI4=;
 b=QKXI+8FDW8/PcxB9UAgpaFz1YSV+GPsv7Rrc3fzcVoH2fCvkGRBBRaMqic9xLnHEje
 nDzOx8Lv2ij2ZMoMzAKG6abu1YJM4luB5+wQFxw1raFjiSAGIOzHlgZiR4wjBM8sS3+L
 gPLYpNXMW0jAy+PLmQNTps5lKLzzOYY1kHQrgnZZPiMFYU71IBfZjwtUAH8HqdNOOq7T
 darY3B9G4y9zZY/ZtE9mv6vUnJ63LP54/5gCfkTFh1zCgu1PBPxDgKBBY2ScAtal5RHA
 YhFU76z19VYwtrs7MPNNVVt82BHmfanH07/91U3/6ceU0Qkh1JeyuGaTIdptoVtku4VR
 KtYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsEkYsKTPfOJOpaF/JGDc0TcyG+k5pyPG7Gbe52lW3khd6H1SEBdSMzv9JFq0UU+23vaXYSVLIaA==@nongnu.org
X-Gm-Message-State: AOJu0YypgS9P+Ne0Vt0tiJNeKeTufrXmliUysbeol3pzdpua5qQIYRQB
 jNpbmzFsG4CByFELzpB7e0ME0FaMXjBoEJe3JLXSEZ0qlroHhUfJVijOBj5dR3g=
X-Received: by 2002:a05:651c:50b:b0:2ef:17ee:62a2 with SMTP id
 38308e7fff4ca-2f75a986f47mr67192011fa.14.1725903802102; 
 Mon, 09 Sep 2024 10:43:22 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72ef7sm370409166b.106.2024.09.09.10.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:43:21 -0700 (PDT)
Message-ID: <a1808a6d-a2d8-43ed-a74a-2ce1daafeaec@linaro.org>
Date: Mon, 9 Sep 2024 19:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 07/53] hw/arm/KConfig: Replace ZAURUS with
 ZAURUS_SCOOP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-8-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
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
X-TUID: H2uwpthQzRPV

On 3/9/24 18:07, Peter Maydell wrote:
> The ZAURUS KConfig symbol used to do multiple things:
>   * pull in the tc6393xb display device
>   * pull in the Zaurus SCOOP GPIO device
>   * pull in hw/block/nand.c code
>   * pull in hw/block/ecc.c code
> and was used by multiple machine types in the Zaurus family.
> 
> Now that we've removed all the Zaurus machine types except
> "collie" (which is not currently deprecated), we can simplify
> this. "collie" doesn't need any of the above things except
> for the SCOOP GPIO device.
> 
> Remove the does-lots-of-things ZAURUS KConfig symbol and instead have
> collie pull in ZAURUS_SCOOP, a new KConfig symbol which exists only
> to control the presence of the SCOOP GPIO device.  Move the
> associated source file lines in MAINTAINERS into the Collie
> subsection, since this is now its only user.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS         | 4 ++--
>   hw/arm/Kconfig      | 7 +------
>   hw/gpio/Kconfig     | 3 +++
>   hw/gpio/meson.build | 2 +-
>   4 files changed, 7 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

