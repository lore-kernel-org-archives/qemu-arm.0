Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2010084ejb;
        Sat, 3 Jun 2023 16:27:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5gyNAD/X2xgD+XeMCpOPFVKCxVwLmacauJqrCpQSOYumfQf0UVaFn8BHhmNtl03vBjbDrg
X-Received: by 2002:a05:6214:230c:b0:626:3a98:95f with SMTP id gc12-20020a056214230c00b006263a98095fmr2914932qvb.65.1685834850787;
        Sat, 03 Jun 2023 16:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685834850; cv=none;
        d=google.com; s=arc-20160816;
        b=VVEXiLRTmi8ANWESdMarT1gnqgN0LC/iDSe+lr3tuWzf6tNbiQA+2f4rwe9rglpmpR
         DAJe1nEFjOTdui8Im3cXYKmlvheLLmKcM04ufFgzS6ZQsPRMJ0vb2u2VwBZQBmKm12Or
         g2q+ZwoYsobTemGLrQXedHsd7QuxEfIb0e8LEcwSb8rZW+i/+lbexroOKLCnam0Beaae
         fRC+PFCC7BIu4NzvPJW3hnaDqQofZaaxateqlZ7mULkUPidL95wv30fAbR7zmjsbMWvR
         aVv8yw6kwrt5bCpFOsWLBU2gs5H56+sdThQ5hVVfyf8E96OhpyAI+6vi4bDYW/QVeDxW
         cFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qVHpuCpa+NdcZHDpk/AWQCalP7Go1RDFc7d2rShjI4g=;
        b=YlA8jYL5I9yI1lcKojR4XY9zMMuQgEsvT8+qV76gxGznjhhU3Pq4pOS0LWaY6AqKeM
         +BlAIBipNXNzH5rSsIwIGo/mELYCAxt7tjNdkqYOafnyhTP8pNrXzIXuY6TLw6q+sQuy
         sFBiXqrKkgaOGiG05ETYfW6ejg7w71APshcvYp8sVrMDwm51tMYVVeQazv+XhrsAemiS
         OkU7mMBIVHLL4owryQ3bBbBdOkAEksTDVwO5XgkaojrmYO2DykxdIk+TlN6OVDc3oou6
         As6Tkc8hbC+dTiQcA6xOI+hNBmYtU3WI+kXFishfobKW1krgObKD7sfcjJEOdgrYvbid
         b9eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MFdACri3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn4-20020a056214130400b006167cf62dd3si2946410qvb.590.2023.06.03.16.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 16:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MFdACri3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5aeT-00036Y-3X; Sat, 03 Jun 2023 19:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5aeQ-00036H-8z
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:27:14 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5aeO-0001Hv-J6
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:27:14 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-38e04d1b2b4so2865060b6e.3
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 16:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685834831; x=1688426831;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qVHpuCpa+NdcZHDpk/AWQCalP7Go1RDFc7d2rShjI4g=;
 b=MFdACri3a76uIKAY26PAPfHv0FInAECuIvcOBaXprI/FUGfOiMm+chCBHelRbXr4ua
 TxUljrc/rKkrrIWoS1uWZQMg+ivDB8mirlXNRLfVcl92D9p6lVfmBRTQUDCEMxLk0rZd
 IJPNLVat+b2wbf24zH8nAth/rM6a+43Kxhu/BDTxGLIuGi3rFd71MUKLSIw+Ontub9dv
 o23uKlsKsB39v5Ca1BUaJRHfkp4q2yJxLdVdrDwaZyD2oU/7OEeTnGOvRCT5yOW1xdcJ
 fSYcrb6cXGxCvYftXWj7rKuSR7tvK4HJxBHLmzMAadRcQNHJaBZ7KhwylFZt1eJJdeEM
 jsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685834831; x=1688426831;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qVHpuCpa+NdcZHDpk/AWQCalP7Go1RDFc7d2rShjI4g=;
 b=i3bbn2Caztds78kpC9piAna1rHeRXciz53ChML+Mx3ch7+oQnpuVRPVsEMBKjnayC1
 UdvA3poVNJJtyMiQazwd2Db6UsyJZYcx3V6jdjXHUrNW6jrfRyliVb+y0NZwq4woxQmx
 6tEpsr1pnN8Nf+yjM3fSyPMCReLJs+LS6Y6U6jfKDuwDK7YxMRYHL0BZsvLYwGtjUDHC
 EU/Phdy7kghxbcyOrkwiNPBRg0vvwYftHrNF8pvVUddHFCyfEx22vYKNOhdd0+SH5e+b
 BzehdUOvg8G3N7IPH+QR+E6cfh7huFyYHbmrZxDSQ7OmmbERZa3D3TCUFfF55ZGwPRLg
 BSgQ==
X-Gm-Message-State: AC+VfDwNOXMOfj9kJjGHaBYSguPot1Se//1uABymaur10DKZC31EYVYV
 5LbH5c1FMHNU2UXAVIDmk7mGm80EbjbCAXSm7Zg=
X-Received: by 2002:a54:480c:0:b0:398:465e:ec68 with SMTP id
 j12-20020a54480c000000b00398465eec68mr4322528oij.4.1685834830788; 
 Sat, 03 Jun 2023 16:27:10 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a170902db0d00b001b042e8ed77sm3668633plx.281.2023.06.03.16.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 16:27:10 -0700 (PDT)
Message-ID: <70ef9d29-424b-cf65-b238-18fa81114ce0@linaro.org>
Date: Sat, 3 Jun 2023 16:27:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 14/20] target/arm: Convert LDR/STR reg+reg to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9sregiWmCpv0

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the LDR and STR instructions which take a register
> plus register offset to decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  22 +++++
>   target/arm/tcg/translate-a64.c | 163 +++++++++++++++------------------
>   2 files changed, 96 insertions(+), 89 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
