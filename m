Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5368411ejq;
        Sat, 13 May 2023 04:39:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4DjqxlAJd0SlnPM5FXFyZh2eFD8OpPylfl7eyH8KDa1KsF+RwjL7pt2h2EIre3t3FDVsHI
X-Received: by 2002:ac8:5ac5:0:b0:3e4:dfbf:1f45 with SMTP id d5-20020ac85ac5000000b003e4dfbf1f45mr50515334qtd.37.1683977985116;
        Sat, 13 May 2023 04:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683977985; cv=none;
        d=google.com; s=arc-20160816;
        b=nR9t12U1WSSsZDVZmGpm9ROcl2nCUoBBu+jWxNT31YBHQJrGF7wVbnANkBuMXCQ+ub
         MmWeyZ4HVsLrh1qIDNKOYNpHaplQs8u+5WGJ4ty5YzIc0m09j9riNjUGZCQUn6cbWDrW
         +dME21UKhoiZbOTImWJt0CIIJ4WwkarY8cBwrQfqiCEs43QcKaHzFLP+XWmrQyF8Rpiz
         XVw1fNvUgN40TdlEPrqY5u1+JVlv/sbYQmjByy400QdtqpdIZHjV1CUjN7oub6cX5GQy
         FOpUg5SaaPia4yhuHm2Q5JmF3/OVX+/huX12HhBtr4rUIXDXHFLJ57unfrTb5wpcuTHC
         2efg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=kjK1d296F5IZd0hzBci5YaKy5tF3t5fadSlSFaXVzbQ=;
        b=VJItVJ49B8a9EDTNfi7uheBBCFhnbr99GO4NUntMe0Lt+4R20YjQy/+vd0WbKJdT3l
         J5u8ICm8Wa0BJMCKAv/t5jtJS5wrXl1iyIFXLjWgWagOfw6mGnkgbwkDJmaUIWAHdfOC
         4rnSfkytVSOmfccKFPwcOM7ILtelBTydCBlEwbdYHNPXBxZfy7q4L8f1zAFFbVvb0mfC
         hPjL04d1UhCoI+edC1Zo39jTwXGnGNmt1RKyngTv0DXXuJHJPHLMgzh+zrlQG6SqlBGa
         9w3Ar9Fc0e1hsfrcuR4HtRkpLVS73Lot2E8s04HmALKutGBSNHj/ytyVqSHMJBjNJkDc
         qGOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v/YqlPfZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13-20020ae9f00d000000b00745a091388csi10071278qkg.707.2023.05.13.04.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 04:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v/YqlPfZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxnb2-0003qN-Nf; Sat, 13 May 2023 07:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnaz-0003pb-EA
 for qemu-arm@nongnu.org; Sat, 13 May 2023 07:39:29 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnax-00077I-U8
 for qemu-arm@nongnu.org; Sat, 13 May 2023 07:39:29 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so97058697a12.0
 for <qemu-arm@nongnu.org>; Sat, 13 May 2023 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683977966; x=1686569966;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kjK1d296F5IZd0hzBci5YaKy5tF3t5fadSlSFaXVzbQ=;
 b=v/YqlPfZ3BRoDIwCE/AkK34iSR6qJfoF0a/ySDl9brFdjAMcjAI8K2S3KqtpsnMeSL
 px1eDa+J8HIMrvo9ZLJ7Qonq/qZjxsa/r+9HALhICiDT0kdbl8SAxLKEe0MitgKT/Zy6
 cSK+n+WK0jG3yJyuwL8sNqohLiaLwqpFp9Q0GJNgLmLUynJ4VWdb1J2E+xTJeuVOzG+N
 O6JxR2e4miu5x68sRjBxeQYGOeZRyaJ0rCTyxiYPtfQ6rWhqlDmEKWTG1nbdzPpBFQbZ
 qqgQiXTjb3rM5vIy2PW4YLvLyXaO4BHeurlFMVOW9jgG/hDM6ldMkE3fY2pv3go5JUDE
 mdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683977966; x=1686569966;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kjK1d296F5IZd0hzBci5YaKy5tF3t5fadSlSFaXVzbQ=;
 b=YKyCl0QpehBychCfxhyvNb66R6vg+gbVyzmIcql2ma0ZlIAAt8oze0N3vPgRvyFcyw
 EsZNmytW8eowKnzeBiGqfE78qgDldyO2N5XVFulTxoNRaUFhRMmgTxj/+yjUCi4ylV9Q
 NLeywZ77VOjTUOBbSCUW89/IToPCHl6XyZujqD1np+S5xbnpXc0iPAIXTPndNvRFNe7g
 Uysf9BcoalQRM4mBcCeh2rA5jR4ChVoQee/UMP8wi+fjy7lBZf3ds4JZWtmm2rGmOwVy
 UtHKOeL5fIGQb4Zo5i2sqkQQXaqXpQWZuOS6uPekK5NAMVZSkUz3YbB5vrnqT3uB5oY6
 kZVg==
X-Gm-Message-State: AC+VfDxQPlcg/4oKj/+hnfJM6YyIolrPgvNJlJpU3B5QY9HTnki1nqYP
 6PBE8aQ1pp++lCYqrxseWnp5ng==
X-Received: by 2002:a17:907:7ea3:b0:96a:4bca:83fa with SMTP id
 qb35-20020a1709077ea300b0096a4bca83famr7997635ejc.35.1683977965929; 
 Sat, 13 May 2023 04:39:25 -0700 (PDT)
Received: from [192.168.190.227] ([109.144.17.21])
 by smtp.gmail.com with ESMTPSA id
 jy27-20020a170907763b00b009663582a90bsm6813299ejc.19.2023.05.13.04.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:39:25 -0700 (PDT)
Message-ID: <5cc9f09d-ed6d-be12-8c40-7a16bc48a5ca@linaro.org>
Date: Sat, 13 May 2023 12:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 20/20] target/arm: Convert ERET, ERETAA, ERETAB to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
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
X-TUID: c2xbIQDyFxiJ

On 5/12/23 15:41, Peter Maydell wrote:
> +static bool trans_ERETA(DisasContext *s, arg_reta *a)
> +{
> +    TCGv_i64 dst;
> +
> +    if (!dc_isar_feature(aa64_pauth, s)) {
> +        return false;
> +    }
> +    /* The FGT trap takes precedence over an auth trap. */
> +    if (s->fgt_eret) {
> +        gen_exception_insn_el(s, 0, EXCP_UDEF, a->m ? 3 : 2, 2);
> +        return true;
> +    }

Missing el0 exception, before fgt trap.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
