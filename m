Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp6319231eje;
        Tue, 18 Jul 2023 05:05:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHLpRGTMZ4yn1F+8eGFaID9L17ZVeI72kXiT35bFsMwTAz7lX+1X44dzsnDKdiK1FXL06K2
X-Received: by 2002:a1f:cc86:0:b0:481:388e:b908 with SMTP id c128-20020a1fcc86000000b00481388eb908mr1357146vkg.6.1689681946160;
        Tue, 18 Jul 2023 05:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689681946; cv=none;
        d=google.com; s=arc-20160816;
        b=FvcLugx9FP/RG2f1dKVTSd988cRcVNpbibLl+caKFk+a3QblXwp8Dv8vQy+plc/v22
         kPiGmRTBSsXJW1RSdD5YFaavLLJ4Zs++9C4HvrEFQ3JK7NYBRx0b6uHfKd/MuQ4/tagT
         TTPwrKWUqsKr/O10B6VCm0QEYVN5wqrjXq0PxeJ19rgbsZ+QUrKPyebE0Hwp5rrm1S1o
         Qglep4i691z/k3/dYN7aXjXqgJVqZntc9vtktlzV9WLCTKu5HhKXc3fGLjha7Igzaz2m
         lEBrz5lGnKceRkL6DJEXurVZTTMA56fkjyHCdpz2pfFRUuVpVzPwe13d/vKIIMZe4pPC
         r0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=8K72sj1DTeAv7k9Ctg+LY+T6Wev0rYbapBcQ1+LBjhk=;
        fh=H61wXKVnnClR5O2vntJfIzlBJ6ICuyNUmzoijNylbEE=;
        b=P8YICufbw5oZncYoWcdUBTUKmmKEukDksqcGzDnOkcwRvajJhEicWvHrlmm+xdwyB/
         N0BDE/nudjRcoOCmrOdHEpWfAbGvHl4GJntXJYjLJnvo8l/P0wuchslryvNLRNtSej9R
         aZHeRLtCkUVv//dHmmi1tSe+qIA/3qQetjIyZLFTz3nZkMPdoFA60/qwiJOLrKdciGEm
         bX3QiBsrhe01jRbLbVY2wFh3EsjdtpSyxU//phM3M6FUcpulZpQdyoGn16Qc++q1CS91
         hXYsAyEgXhGk/ZMeszLWOhsyphmxeLxAWfJTM5lURzkjMfUU6tF272CD3IReD07HTC+Q
         tNng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OU5GTDd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l124-20020a1fed82000000b0045a04869a96si140239vkh.155.2023.07.18.05.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jul 2023 05:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OU5GTDd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLjSJ-00071g-QA; Tue, 18 Jul 2023 08:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qLjS9-00070f-FL
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 08:05:17 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qLjRw-0001JF-1N
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 08:05:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82d9cso51499095e9.2
 for <qemu-arm@nongnu.org>; Tue, 18 Jul 2023 05:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689681902; x=1692273902;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8K72sj1DTeAv7k9Ctg+LY+T6Wev0rYbapBcQ1+LBjhk=;
 b=OU5GTDd8Z24J4hQKirlsAEmHYDl2tJNtaymkyw7zhrpIK8YcuVDd/dk+c1ptO5dCeY
 J+pz5xgRBJVg3AoTjpO/FpFEXnVet5NDeq5e7wpRuGjGwmRs93aoBINWLMmF80OAW7vs
 4bX5Kz8hhp6bhRdso6TrO/wR+9H9zM5bWEJJY6/WZkITGIlX2gTiLf4JQg/TzCC8acV0
 9drhI5yvBR4s8bZvIUwAFixbJz5bU0W5zxpK2nv8MePCp762m9un/DDAv5L4Fui7EIXV
 CKDnoO08Zs0PA3mU/wISDAunmblVu1MNQjmbSy8OZpUDv8NwqsNUBAJtjb3cZ/rSKqCB
 1cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689681902; x=1692273902;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8K72sj1DTeAv7k9Ctg+LY+T6Wev0rYbapBcQ1+LBjhk=;
 b=Bg+ceO/FtAWCxTj7Whg9KI4JINFlp/cvJB1ipXXJTP2rcf+yioDsMwwU0lJq9Pt5ca
 2w1GXfPXeqbq/WN1zLVbgs4WdW2MVRmNpRPwm3EX7JVF60490ghkeeim+NutXDNBHilS
 B3IwCSti5rwF5dBeZe38HdE5lw56aj8vZuKVHISUxIwXYXoH8bncE/J/mhN/I2Yvpz6V
 AglnvPnBZoTMy4y+otFropMs6dVbQJf2Mo5HTM5lUpVuxoBzD2i7JzblkzMf6xKZuDsy
 xGFDaw9rj82lOr/xRymDNbtitJ+46FIMphs1U/ralbDHE1P8lR+n7CrH/8MepWq6AICN
 ALxw==
X-Gm-Message-State: ABy/qLYrt/+7eglLvCXMZRGNxIqyEOdhufJ3Bd/RUolOkHc3r+w/sjwO
 4WHIZNCW4+5UZji8bvFag5lGbw==
X-Received: by 2002:adf:f583:0:b0:314:4ac3:530c with SMTP id
 f3-20020adff583000000b003144ac3530cmr10180980wro.7.1689681902173; 
 Tue, 18 Jul 2023 05:05:02 -0700 (PDT)
Received: from [192.168.94.175] (140.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.140]) by smtp.gmail.com with ESMTPSA id
 s18-20020a5d4ed2000000b003143853590csm2222225wrv.104.2023.07.18.05.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 05:05:01 -0700 (PDT)
Message-ID: <18b9ca41-c901-ac61-c959-5d8c36341a7f@linaro.org>
Date: Tue, 18 Jul 2023 14:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] target/arm/tcg: Don't build AArch64 decodetree files for
 qemu-system-arm
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230718104628.1137734-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230718104628.1137734-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: pjfvpxumKZzz

On 18/7/23 12:46, Peter Maydell wrote:
> Currently we list all the Arm decodetree files together and add them
> unconditionally to arm_ss.  This means we build them for both
> qemu-system-aarch64 and qemu-system-arm.  However, some of them are
> AArch64-specific, so there is no need to build them for
> qemu-system-arm.  (Meson is smart enough to notice that the generated
> .c.inc file is not used by any objects that go into qemu-system-arm,
> so we only unnecessarily run decodetree, not anything more
> heavyweight like a recompile or relink, but it's still unnecessary
> work.)
> 
> Split gen into gen_a32 and gen_a64, and only add gen_a64 for
> TARGET_AARCH64 compiles.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/meson.build | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

