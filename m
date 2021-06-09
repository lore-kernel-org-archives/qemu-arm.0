Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5688600lfa;
        Wed, 9 Jun 2021 12:41:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsRN3dbjsI1hU/MCjW5cC18qSNDtbray8ZMHcaAvv0WTvi8QnN56hVIl8HVOEX2iWDy39J
X-Received: by 2002:a67:e312:: with SMTP id j18mr2220882vsf.32.1623267662300;
        Wed, 09 Jun 2021 12:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623267662; cv=none;
        d=google.com; s=arc-20160816;
        b=c43bj5drXBw6we5mCd1V71Ddv5koHLSX+IX5IV+mMcNpDa2SH+D3xWw6cokNURFiAx
         W5QiQ7mN3y0tsgc9iB/4e595cZVy02BIZthk9WCPWf/A9Rckh/yHwZOzOhjNjywfHmDR
         VSR84B301Iu/XL+dadE87dKTdS8P3K4jAj5P5E/k2ryPnrJVcjVwiEnyS73j9l2JN4h0
         PMkHxzf8GrIvoCX/wLcgDr9XSZN226JPp8UNN2/Yjcv60G8+3DWlOmcRaUMv3OltFH0J
         4qRQoixMK0uFOOANjwlyIJfNYJyHfpOvby0MvQThrIEao4znZhZg0ciQGva+ZKSNGb2H
         cdrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BTqzqwCNU0udHe0CYM8LfO1O6KdaDS0cyohMnohYAaQ=;
        b=K3E8Fe+QFjbV4iLaoxFOHEXPTdC4JU1v/q8CVLLkv5gYT6/MjzOIenKPff9YUyOUuN
         uM7CpxxSyuuszuQ1tYxH34kzzCrJ96TFn22yfjXjTzAUv7CMtQczOIBtEYWB/7wBkTpU
         ePfNk33D18sXISDcqCUtfZfoNVJ8FCk2ssEp7zt22iGIDgQljQHh9oNIUHYSZWhTB1e0
         Ybh9jvdcUZRxqAepmWPvFMIA34PTpSfhVzCwy57LUjoU7uEaruCB21jKk+w19ZiKNMMf
         YiSfeC3Nh/uglphlLAZLAc4kRemQfw3oXPwl8yUYh1vOlXoY3YiCpXIbpARmk97+c4Z0
         WGGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C1sydXpo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si799661vsc.177.2021.06.09.12.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 12:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C1sydXpo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr44T-00073E-KQ
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 15:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr44K-00072w-SD
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:40:52 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr44J-0002uv-0K
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:40:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id z26so19300425pfj.5
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 12:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=BTqzqwCNU0udHe0CYM8LfO1O6KdaDS0cyohMnohYAaQ=;
 b=C1sydXpoMFXZvcfdrsbU8gbZMIfiWIBmdyUJZ0HhvW9xaTeq9cn/mlUq5dQvTI4bnr
 hLO1vlGnZoB3fiIihe6wdSJyUwr2j4S02gVwuSzeNPwdGbF8tZeQK6NN72+RfUC4mKQQ
 Q0lgdi6ncpv080q78cm7VEoTodSgSP3GIgEptgFNd8WZxam8o3dbl6F48R3NFNv0DVlF
 NlDXELKJCMSvzDnOcmxhOJ9QT/2AdtQ5H+9cSPFT1aeRsY5gbXoGWYqU85QRwbVbZ/7r
 PKThqfRIU7Sn8/Gp89y2D2PWeyec83BNJxbKjIPie8Jh/+RVGd6xVy6NNUWdxgqo8/tV
 OpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BTqzqwCNU0udHe0CYM8LfO1O6KdaDS0cyohMnohYAaQ=;
 b=ummZtg5CenYY4Wdf7Om94hxUxt6XOeUZLFW2pTuNqCdZHqxzjV/8xOLIfBnHtX+VN2
 1Cu/cM2thQz6h/oPBfTZQzhZtT47sXN+FNNPu17uo/Ej37/NSmI9O7dxjnDDdxvx0L8J
 wOn+OraoZeCTLd43UpPXbdSircIbREfiBMxX+W6WxLJlDDjHtP3K++Vm0ERqOjsU88li
 Nw+u76qxOCbpnIULWNaXKs8K+CCUN896Rn+XmcGIajWJ1UAgqblvG1cJXYhmr4RIOUYy
 IqZGy9J+udZTc8nJtQCfX9ZIgkUINLPls25tqWmaZOi30lTCTdX3nCjX24fB7YQxmCDl
 oujQ==
X-Gm-Message-State: AOAM5333lrj6jemp62vOpl/7ql+aMzf6S/QAF3Vys4PnF6Rmojqe1Gxs
 8v8SPlCcrkRdzUVRTHp4XJzmNA==
X-Received: by 2002:a62:b401:0:b029:2ec:a3ed:9494 with SMTP id
 h1-20020a62b4010000b02902eca3ed9494mr1077158pfn.56.1623267649199; 
 Wed, 09 Jun 2021 12:40:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 gd3sm5638373pjb.39.2021.06.09.12.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:40:48 -0700 (PDT)
Subject: Re: [PATCH 45/55] target/arm: Implement MVE VSHL insn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-46-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c64bf3f-7b68-f30e-5076-4b6dc8b8ace4@linaro.org>
Date: Wed, 9 Jun 2021 12:40:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-46-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LTLHqrCPfgiG

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +static inline uint32_t do_ushl(uint32_t n, int8_t shift, int esize)
> +{
> +    if (shift >= esize || shift <= -esize) {
> +        return 0;
> +    } else if (shift < 0) {
> +        return n >> -shift;
> +    } else {
> +        return n << shift;
> +    }
> +}

Current form uses the helpers.

#define NEON_FN(dest, src1, src2) \
     (dest = do_uqrshl_bhs(src1, (int8_t)src2, 16, false, NULL))
NEON_VOP(shl_u16, neon_u16, 2)
#undef NEON_FN

etc.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
