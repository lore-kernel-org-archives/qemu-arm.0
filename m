Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp378106lfb;
        Tue, 29 Mar 2022 12:09:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWLmiyS9n1aRH67FRhNXbduaxm2mWfm5lQX1IGWBj/Eh8xYOUv7pRcaVnurErrnAucTicr
X-Received: by 2002:a0d:dfd6:0:b0:2e5:a698:6cef with SMTP id i205-20020a0ddfd6000000b002e5a6986cefmr33418230ywe.381.1648580963270;
        Tue, 29 Mar 2022 12:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648580963; cv=none;
        d=google.com; s=arc-20160816;
        b=zhzSupdrLZE78oQiC7JL7h4w2LhtLvUI7yAmMz+fzIthfuwOQh6Q/CTXpDpJ4p0tc0
         mF1F+j5DN51L242seI2OjcwbOgUbzoROqIksjs7FGWm7TJZelR1AJw/k30SdcjfTwKuQ
         HhHTfdnDc15XAoVlyASLczDtTbHoB6C6YojN9g1ObsW8mv98Snft4ypBnF1kx6LKKkHN
         6GW9nRW4vT6U+mK9jmBe8ap8gFHlhUuL/2j8LDpOm3s8Uj1vj2dDYMrfbbXF+rMJrOM8
         n1IL/ZklL2HN88IYNUasqd8/gj6Drr5QiO7ycJUaJUqhjlm3mRCwmXk7YL001Offck/C
         m4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=dkuNbdaIhm7hXV5Oi/5XxRLycq98hG8PyVfiR8Idfss=;
        b=KNebXzxoEHeVNace0K+pHQRSS4ARjBleVwnw7ikLv5Ih26b2nSBYcqKSW6OF0UM3eq
         ONM6R7OMa/LT8iw4yNlBnGXPC1zFfaO0lUVvOX7T6h+M+m4fLuwNoiagvFM+2STiKSLv
         k8wZ472YQoUDQb4Xw2eiM0ahzNongb+lnS+4sE3o3ZqVrIS47OT/mAb2RZGLLFwNryN8
         3RPd+XxlXAsA6tcvyLOb7a7vFc6mK9oyNRLd4oShQDUUYNmARNbwvo4nwj6nn18S7kl9
         F+B3esRWUED4zd88E2NTn0PkdMb4yI6XNJMpfCs+SCv+ntcEnTn1ImE6IUdPIw9++1TE
         APvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dHJG/EDd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i125-20020a255483000000b006346f296b98si16661382ybb.377.2022.03.29.12.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Mar 2022 12:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dHJG/EDd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZHDW-0008So-NL
	for alex.bennee@linaro.org; Tue, 29 Mar 2022 15:09:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZHDL-0008Pw-HB
 for qemu-arm@nongnu.org; Tue, 29 Mar 2022 15:09:11 -0400
Received: from [2607:f8b0:4864:20::c2c] (port=45718
 helo=mail-oo1-xc2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZHDJ-0002cO-GC
 for qemu-arm@nongnu.org; Tue, 29 Mar 2022 15:09:11 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 u30-20020a4a6c5e000000b00320d8dc2438so3232924oof.12
 for <qemu-arm@nongnu.org>; Tue, 29 Mar 2022 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dkuNbdaIhm7hXV5Oi/5XxRLycq98hG8PyVfiR8Idfss=;
 b=dHJG/EDdiu/K2Izl2tPNHiSp2kpiI/LnXSr8zf5248eflp8I6SvlAQoNpwNN7XH9V+
 y9wfQjcIPgT8+JNY7MYsMkoe7cE/KynZ1f0yyDSqj7pcNcLb/4m487OJ6/yMyQUEbqJj
 kpW18almHORC4Nq/DoEqwM8N3DyMTLzXkt2qHvoufRPbTkFFBmFj6MVQVKF2iBhXbB2s
 VSv6pbAptim/dBya+bAAyrHr5JaJzMEMt3QNgXigbq7ztbqCpwSH14WAVQiQcRu0aw4J
 vVawSKYwRLiy42b1vjQAIVCBlQ8fpfLcM/mXpJx2hREj2vZUoARQH+Y0JwNFBT0efidK
 kM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dkuNbdaIhm7hXV5Oi/5XxRLycq98hG8PyVfiR8Idfss=;
 b=RqmKW+PANcyvoNDOUZAQUSM4V8FN5rKQqW/41pNt/31iS9S00ak4Rwi1zakNaZnE6Z
 u95yXQxUxutrHXaN7pUFsbiH5d9F4j/YMncG57ONwTesIZJS+7ybusGC7dDRiYfUdp0u
 /WaF7yhh3QdHXycj3N9pdEgFkCHzsOe4iFz2F8+/tmCQdYAmEs+HBbrGn41/lvsIEqEF
 O7T+R5SjShnl1oNqkPXJyvJqLsDhEOrvfU3THcghjJ/jZY+4nMDuBSzrh2o9mwIEQXiD
 NkFBj1MyJTRNf0c+Arl5fQ/wGAwD9x+WckXaa4MBEdkw9FNrMJzTkygkVxsmSe4i5f5M
 RqOg==
X-Gm-Message-State: AOAM5320Zxe6bCGEgTqIZiiF5i7LSPlaoWpmfnED6iAkctfHbGmiaoj3
 5s3ebj7JyXF2Ll94bpbtXy5y2Q==
X-Received: by 2002:a4a:968e:0:b0:324:22c6:1a31 with SMTP id
 s14-20020a4a968e000000b0032422c61a31mr1602602ooi.93.1648580948223; 
 Tue, 29 Mar 2022 12:09:08 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 p14-20020a9d744e000000b005b235f5cf92sm9418743otk.65.2022.03.29.12.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 12:09:07 -0700 (PDT)
Message-ID: <ede38e3b-5207-52fe-4c02-72a4bbe1cf20@linaro.org>
Date: Tue, 29 Mar 2022 13:09:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] target/arm: Determine final stage 2 output PA space
 based on original IPA
Content-Language: en-US
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-4-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220327093427.1548629-4-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oviMECrMcf+J

On 3/27/22 03:34, Idan Horowitz wrote:
> As per the AArch64.S2Walk() psuedo-code in the ARMv8 ARM, the final
> decision as to the output address's PA space based on the SA/SW/NSA/NSA
> bits needs to take the input IPA's PA space into account, and not the
> PA space of the result of the stage 2 walk itself.
> 
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>

I believe I follow: because the walk uses walkstate.address.paddress.paspace, the ipa 
input parameter is unchanged, and it is ipa that is passed to 
AArch64.S2NextWalkStateLast() to form the output address.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
