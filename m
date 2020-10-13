Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2125818lfa;
        Tue, 13 Oct 2020 09:37:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys56ga+o7lRCr/MtpZ7Ab13/YeXByx5uYLiqe+LvKOagg+tAWAD6S2QLyiCJXVrFegG7Aj
X-Received: by 2002:a25:c714:: with SMTP id w20mr1012639ybe.484.1602607052058;
        Tue, 13 Oct 2020 09:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602607052; cv=none;
        d=google.com; s=arc-20160816;
        b=QavH3+i583erPbB/gthX6JT6s3i2t5wHGzEHxt3aCeBpFjTftXAVvQAyHBu3uPSRDA
         YAAE5wdvZWN3m9RD6EblvrNLrO/zbGhpbE5521mN7DwX/Lruis+YIRfDkxTjoPbtLKwm
         dfJsUmOdZVbn1L3RVpaI5/GA+677aFrXouUNBNwxAgch4dUzHEZnHG5mMEzLW9wZmpOH
         yD+ljzTfoXe5+DGIDS6Xr3gM8pZboNsifDiBwrVMN4CIPTt/kbri/Z6tuyuxi8zxsNYw
         o6We2oG41iIEV3b00ci/vxhgXFT/sLgS7MmYZd1CLSEg0o0kCwmoJBbIShJ7UHSEo+pe
         XBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JQ7DH8oeAFUbxMcXm7EPbswgxLfwRP//ja5d57fDX0c=;
        b=MVyH8HWEvoLrOQE2Kj0rbTrgsxOLe23f25M83e04TLzBX6h1c5lN6Ip0Z308x6JE2k
         3FC75xcla3jB/Qwp/A6ikdQb772lOQQOApjSw6NB0nwH/+8Ylfbdn3kCY3HeaSlAf0no
         cXCtfmxoZOsd0imQBpLakHF83ieNqO3H0y9kCOLX57xTwh7CSlntllyI29yMF7m7V6cQ
         G7lUrBCCSkUFe2IZ4u4hDZAMR7ks5BvoOTVos8Z7KfhM6PrxUNnyTxYVP/Vwkzpt4rAm
         Za3sUPHXQ88173poCXgIOYnzgJEPc+ffiXZjNehP4PNM0/N3vUemSsaHXZHvCFLDR7UH
         b2GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPz03JUY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si404288ybm.146.2020.10.13.09.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 09:37:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPz03JUY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSNIp-0003lv-Du
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 12:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSNIh-0003li-CB
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 12:37:23 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSNIf-00047G-MB
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 12:37:23 -0400
Received: by mail-pl1-x642.google.com with SMTP id v12so96941ply.12
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 09:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JQ7DH8oeAFUbxMcXm7EPbswgxLfwRP//ja5d57fDX0c=;
 b=aPz03JUYya9QC8pK0Yt8AeMmUzowxGLV/KCiMF34Vx8V/qUmaay6ipEeLeComo74Mi
 fcjq9vOIfwwO6gRNQxeJkxuHzsYokrgLKI+wYLceTr1gmage2HrQzIQnRY/w6O9pVhSA
 PnDSIdOfC0Kcur+1AGviXx55weZUnrW2Po4zFHRRkdmmGgk6nHDa8nwOdW/V8dYPJ/G+
 9yr8vL32fRgCHvdPTYcC6awFS9qlXgkARBSeqd0kGpcPFezYpzngawox+DuFmMoISxJm
 OJjD9Gu5QpPS7dDvIoojYG4gursTaFN6RrLtFaijuLIjB/jVjxcRF9Ttl5QgfwNR5s+O
 zuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JQ7DH8oeAFUbxMcXm7EPbswgxLfwRP//ja5d57fDX0c=;
 b=nDt39tQeD/kccOvXVW86seSXJhmXmmA+zq8rUqUAGf2Dfn3nGvnGsoQcjVb63bqiJh
 uRU217JFr6CMGCRju1mAmkdxQqwHzL0gou1+Yy5Cwoqlorhki/r7yQQTm6ZhY0kdLZ0q
 4pV62D8INQAxdmxJQoRTvjuFWyxY4EnXQDZY1RQZ4j63tYtUgDdK99N0DODRYek2MGz2
 oqr4s17oXH35LXNRC1Or6cTiCu1KM+tTghf9XJjZlejsmbATg6CBRA2HTc0T8lP18qwJ
 KXfF6QB4cQoDWf2A0j9cWwU/hhwdigf1uNUSXXybt5V2aNqMLB/MeR/3KEdNp1rQNWQA
 QN0g==
X-Gm-Message-State: AOAM5336kmv9yGqGChZq7D6y7/Fp2glRe4fgAiQqZwpEmRqMDsnxRsj7
 mQdUlfdQA/VxKl/ds5+CPkYc6w==
X-Received: by 2002:a17:90a:de98:: with SMTP id
 n24mr605889pjv.100.1602607039877; 
 Tue, 13 Oct 2020 09:37:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id s67sm157934pfb.35.2020.10.13.09.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 09:37:18 -0700 (PDT)
Subject: Re: [PATCH 03/10] target/arm: Implement v8.1M conditional-select insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01657b8c-6c4c-deba-a852-88560eb63583@linaro.org>
Date: Tue, 13 Oct 2020 09:37:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012153746.9996-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: N6RqeFnFhU8U

On 10/12/20 8:37 AM, Peter Maydell wrote:
> v8.1M brings four new insns to M-profile:
>  * CSEL  : Rd = cond ? Rn : Rm
>  * CSINC : Rd = cond ? Rn : Rm+1
>  * CSINV : Rd = cond ? Rn : ~Rm
>  * CSNEG : Rd = cond ? Rn : -Rm
> 
> Implement these.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/t32.decode  |  3 +++
>  target/arm/translate.c | 55 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/target/arm/t32.decode b/target/arm/t32.decode
> index 7069d821fde..d8454bd814e 100644
> --- a/target/arm/t32.decode
> +++ b/target/arm/t32.decode
> @@ -90,6 +90,9 @@ SBC_rrri         1110101 1011 . .... 0 ... .... .... ....     @s_rrr_shi
>  }
>  RSB_rrri         1110101 1110 . .... 0 ... .... .... ....     @s_rrr_shi
>  
> +# v8.1M CSEL and friends
> +CSEL             1110101 0010 1 rn:4 10 op:2 rd:4 fcond:4 rm:4
> +
>  # Data-processing (register-shifted register)
>  
>  MOV_rxrr         1111 1010 0 shty:2 s:1 rm:4 1111 rd:4 0000 rs:4 \
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index d34c1d351a6..a7923a31b56 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8224,6 +8224,61 @@ static bool trans_IT(DisasContext *s, arg_IT *a)
>      return true;
>  }
>  
> +/* v8.1M CSEL/CSINC/CSNEG/CSINV */
> +static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
> +{
> +    TCGv_i32 rn, rm, zero;
> +    DisasCompare c;
> +
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
> +        return false;
> +    }
> +
> +    if (a->rd == 13 || a->rd == 15 || a->rn == 13 || a->fcond >= 14) {
> +        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
> +        return false;
> +    }

Missing check for rm != 13, which if I read the table properly would be an MVE
shift instruction.  (Irritatingly, there's a note for "See related encodings",
but there's no related encodings section.)

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
