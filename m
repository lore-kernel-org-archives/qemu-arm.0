Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp403646ejx;
        Sat, 9 Sep 2023 09:42:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFzH+1nXaCHGZJCBlZrdNyemT0vRGOcXZoI0uamIwvuEsmKovfu0TRC0Qmk+NoaxD2oLjA
X-Received: by 2002:a05:622a:148c:b0:412:22f5:fe00 with SMTP id t12-20020a05622a148c00b0041222f5fe00mr7659232qtx.2.1694277771523;
        Sat, 09 Sep 2023 09:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694277771; cv=none;
        d=google.com; s=arc-20160816;
        b=OnDtnVnUJ7fJ2ZzLZdCHmYjgRmXjUzzxSOTh9+yk8CRqpDHy6YOt/+tKpEi4AUFgor
         Xx8yyCRXBVh2IqvKpiR+2IqE2Lifp040ePvd2KnG8p00Y3tsx6Nt9G3jhf+aKw3XlpqB
         Gggj7g2kBRcDWPBGgAa8eNmEbfipmWgOXLky1w0rmwLBiKoYPMm4lPzxfqst7deYMoxk
         5htG0Ir/G/Cj7JuQ7PYDUclmS4lotltiBV0w3s0ddivfocIwIC531cBPLRiOvh8NLU2m
         tU3aXQvgjH6/JcCYVWlMD4+18CRcNFq7qAETL0c7dG2J2w4JD1vxFVXmCIQodzM0O+Q5
         bqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=EcMiP7Tbx2CZY/5ppP5XQURC+CcP/9A8mvjU/2ZIuTQ=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=FclsZr3OV3kT01GystKTwAhJO52RHXo52bfV1A/2u5w+v1MEiRIxvovACJV8+WEUYB
         mWmM/gWDk1SoLbNF+Q4HGbqWNnhKcbiJlWiB6mKhdHI7UXAYB5nRPBQqVWcPlZbFCjUZ
         HI7c+yT11qHnfVF+U001d9uCv940vbASt55bcKlplIp2ftgxt0A4x5yr4mwrTrjbEp/x
         YWZ6Odwus8jSmIemXJgeX2DRGw1v4CqG/ikughqj8jzGMbZOJPQBU3zUGaABJ5nPfuOp
         /GH0dRssvgE8V8KXpf8efKdeVJsmKXZc4QOaqcqc7cZLf8AldSXpXwkGYoNM52qub19v
         WE7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQJenVig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85913000000b004054648ff3bsi2685088qty.284.2023.09.09.09.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Sep 2023 09:42:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQJenVig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qf12K-0000Ag-G7; Sat, 09 Sep 2023 12:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf12J-0000AW-58
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 12:42:19 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf12F-00033E-BO
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 12:42:18 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-56f84de64b9so2029130a12.1
 for <qemu-arm@nongnu.org>; Sat, 09 Sep 2023 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694277733; x=1694882533; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EcMiP7Tbx2CZY/5ppP5XQURC+CcP/9A8mvjU/2ZIuTQ=;
 b=CQJenVig/h39ooQHWcmbOzLLjVbf9qf/1dMfdTOP7iDOk7wy0fQnT8DYaFg0OTn2k1
 DUTXkzFzEUtDM+FtTslGacQ5rDLcAGRLs0+yjHN5obDcfu6pvugNPKfNNSnE/AW0YHBq
 SKE54GuznEygUdM8uTaR5WZrWs0KCMU7DSXpCq5n/WgBqbcGf8tGolYq3RbhB9NzObSf
 KWfSqbMW+tDRk7x+d6N133bVi+L2Xc5x+TIjZOhSmErQXF7tbXLJ859rU2SkhEbDsHLW
 fFlBqHM4KLcOJA6wa0esL9KT0UU/vZ5lNAQfNjVurPoxOZqOKXwAMfQLtIGZfcDIvMhu
 d6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694277733; x=1694882533;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EcMiP7Tbx2CZY/5ppP5XQURC+CcP/9A8mvjU/2ZIuTQ=;
 b=DjaT2+HslhmJetATbcPkieB915iqRKMcYKleXqNlH+zVZw3Ju+nP9X8VrLVyr3Se8S
 cay4AwPPWloRoZ72KU8j9urVhkJKhEDCpcCjm5gWN1l/rgVPJmZlbWy6RGd7KlyUsuG7
 NNkf6Nn2zViXj78lewyvLaGQHvJK7lErJAg2aJAmo4rR5ZhjXTW08qIo8XMZ97RMHU9b
 cqWKccdb9fIDqBp/pZ+uap7o/WgpeXdnxa9Rakbko79dsDoywSTtEd4ReZESIdqBPKd1
 vBa/HEItnEHgi6FqVsA2XuF6dtkKnT2yEqKUk9O8E7RSDgsFHXprYLpgXbN4nrYh8MTB
 P7Iw==
X-Gm-Message-State: AOJu0Yyu15lJdGLqxIi+ihQrbdQPlQC6mqpA0iU1c/bumD4vcWuYBb5K
 zFC+BYzlPk/Ua2zld7nZ0HE5QQ==
X-Received: by 2002:a17:90a:9ae:b0:261:2824:6b8c with SMTP id
 43-20020a17090a09ae00b0026128246b8cmr11731055pjo.13.1694277733106; 
 Sat, 09 Sep 2023 09:42:13 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a1709027c8200b001bb8be10a84sm3443901pll.304.2023.09.09.09.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 09:42:12 -0700 (PDT)
Message-ID: <183c67af-4a96-176d-cb5f-9541a5d90de1@linaro.org>
Date: Sat, 9 Sep 2023 09:42:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 12/14] target/arm: Implement MTE tag-checking functions
 for FEAT_MOPS copies
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230907160340.260094-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: GIk+NSK/Ia8f

On 9/7/23 09:03, Peter Maydell wrote:
> The FEAT_MOPS memory copy operations need an extra helper routine
> for checking for MTE tag checking failures beyond the ones we
> already added for memory set operations:
>   * mte_mops_probe_rev() does the same job as mte_mops_probe(), but
>     it checks tags starting at the provided address and working
>     backwards, rather than forwards
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h      | 17 +++++++
>   target/arm/tcg/mte_helper.c | 99 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 116 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
