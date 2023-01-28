Received: by 2002:a17:906:a8d:b0:883:7228:2f81 with SMTP id y13csp13043ejf;
        Fri, 27 Jan 2023 18:53:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuLfXceESJHP0rQtUubgbeSSOeZSEkxlvT7qorSCI9JiOu78f0ybCNHscM1q4C3TYqbMmw2
X-Received: by 2002:a05:622a:598b:b0:3a9:8f6c:2d7c with SMTP id gb11-20020a05622a598b00b003a98f6c2d7cmr65483428qtb.52.1674874404447;
        Fri, 27 Jan 2023 18:53:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674874404; cv=none;
        d=google.com; s=arc-20160816;
        b=uwq5Qyur1wth79aQokd7b+jmusNdmuQnxRi7ZNGQ7nah6GYDXszQgmBVcX6lUq8Ut4
         9HQ0Lmj33zAz8neATG1Lm8lSpMaKyEnrwbsyR2c0SbMQPzas/+0d4m13WmDy8Hc4kL0U
         CedUIMuRKt868R7wOhLUjg7puCOvp2KgTpjfTL/eU9B3RPdpyLQsgFOtM8Q9R4FmXwFM
         9w2oyQZQT9M+uo1WsIj0z7M76SmRBYtGwDvrBJHBwxunD24loJ1oeQzPNmu2WXWwMEMf
         9EEoOL+duZWKCn577uJU234PKcua6UB8pzp5jyDJFxVAccTzy3MygLcyEwC5RdVYx0UW
         dSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=NU4EVJCvTXWkS0yFA+wP1qGKZg+BOpVVc/MEE3lEEuM=;
        b=vPVUTGLt+QnVofkXQbG2LQj4QHn7cdxF8uxkjWR+tu1YU29xgp7wKrejMXs3AfSAaK
         JcYahMDUT/hda0qym52bkGdGeH65B1VSKGylezCcUuCAQ8v7MZRRWpyeDqthiJTYtPxi
         aJgQfBWDWAmPzfscAiW/fIJVe5bwA+f8g0NRDi9RXe4TWHbBdnBVYb78kvBztJa24uKZ
         ISfK/AQy7EBdrvBvyOqrPScMsgCLfCKp//rQKhhSHxBSWRemIHTP4fUUc6a9p7+fPLVe
         ERARNhBuwHocofCfNbYijS8/OmOwEEHRGj7mCz0FPzy1TJB6S/hcTTcHGpQoI3Za0Ryn
         hD8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nti0+XlU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020ac85c02000000b003a7e5da777esi3427536qti.206.2023.01.27.18.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 18:53:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nti0+XlU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLbL3-0000e3-28; Fri, 27 Jan 2023 21:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLbL2-0000dW-6p
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 21:53:08 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLbL0-0001XL-D0
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 21:53:07 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 m7-20020a17090a71c700b0022c0c070f2eso9744388pjs.4
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 18:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NU4EVJCvTXWkS0yFA+wP1qGKZg+BOpVVc/MEE3lEEuM=;
 b=nti0+XlU6K5vcxk6uutZZbe0PhiLCSjYxGvNGQNtrUa3FsHjICGxr7PR7YBsh348E9
 H7JVbHVLZ/hQDUHcnw/PVy7uCtSyMGZ+Q5UjfxP011bwH7ohGQDXnOiv3VVnnZIsg9oZ
 kboUFACbg4+sD30RmrrGbFXlDk9b9NjA1ACOzQFNj1BhDF5mzWssvAsxoJuPSTLZG8Yu
 eQJ2lNXi7o2MqZ/Mgkm5cCH2DMKVxo5ZI7colaApxwPX/8UA0N8IV+wzJ5DbTbGMlaLH
 pk5Nzu8gYtRnAKadbfQU73p3ykt6wwDo6lFum8Idx1XkduNJUkJcSxnZPAph/MGRDSfY
 aexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NU4EVJCvTXWkS0yFA+wP1qGKZg+BOpVVc/MEE3lEEuM=;
 b=f4IfgZlG7Guqms4fBx4kWu+XL3dkYV5GRB+lz98jVv3/OJ56lSu8LUhFef6vkKM+dq
 /x88aFqlrJz+EbC3cCdQ/2qk2MgVyOi/78/qucUAzk9ZahseU28IgcrQb17+9CEZis1i
 Y0lfNbrSyRaF1tiycITNgNuNql0CJooFubYXLFaGDn6VMvGC5beeL7IMiWFLVtRL6jZL
 hMR+IdJov15nue/eHNY7peKgnp4SkRRGvlvU+IGnQFpAI2HatTFVXKjM4H8tW24OrxGC
 eTVeIcTglA3SYxfAKLA3dUno/pKai+UnYKtvEue6pcump1j/s4AdDorLl5+ecoJe4p3z
 Mgcw==
X-Gm-Message-State: AO0yUKV5QO61ySKtbzNwrIXx5fctwTbgryAe4UcQFPpXRyq4ayVgCUjn
 9n8iTJthDLqmk8tet0abt55Rlw==
X-Received: by 2002:a17:90b:1e4e:b0:22b:f834:3fac with SMTP id
 pi14-20020a17090b1e4e00b0022bf8343facmr15230433pjb.11.1674874382881; 
 Fri, 27 Jan 2023 18:53:02 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 p10-20020a17090a2d8a00b0022bf0b0e1b7sm5745466pjd.10.2023.01.27.18.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:53:02 -0800 (PST)
Message-ID: <eb1e8de9-f5a8-7c0b-c7a4-3f76823287c3@linaro.org>
Date: Fri, 27 Jan 2023 16:52:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 14/23] target/arm: Mark up sysregs for HDFGRTR bits 0..11
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: 6GHy541/jePB

On 1/27/23 07:54, Peter Maydell wrote:
> Mark up the sysreg definitons for the registers trapped
> by HDFGRTR/HDFGWTR bits 0..11. These cover various debug
> related registers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h       | 12 ++++++++++++
>   target/arm/debug_helper.c | 11 +++++++++++
>   2 files changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
