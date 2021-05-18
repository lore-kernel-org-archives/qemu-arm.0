Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp469721lfm;
        Tue, 18 May 2021 07:33:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVBtPOBkVPj6K2Y6Yrx10F8YdIZAJXZlEiyfEDULOlMiQsWoQff51QP12SGdoE3HRFGOIT
X-Received: by 2002:a05:6e02:2162:: with SMTP id s2mr4540063ilv.237.1621348401572;
        Tue, 18 May 2021 07:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621348401; cv=none;
        d=google.com; s=arc-20160816;
        b=eodGWFDJZ4p6Skqm4P8aI+UuG+KIcd3s2OGn0PXa/uDbSp9Gh/rWRGPbTZ2R2P56iv
         AmI6Qefl7zqCD7iPZPlQlDWRdvxS5snLijK+Yk9C0cKHCMX5H5J4J8BUGUm6lj8tDNq2
         dK1TMfhfLvAiyshsa6TjWJB7BQCFJBT4/6pzaDDB8JqnIR0XzE1eisrZ1x4i7jYffVKk
         Vz0IBUb9K2SH+lW1HR/vCRiec+rO3xA1T0gMYBUyY0D5OG0y8Fkj0ptiPqXweeIta95j
         kiYZqVnTqPmiuVR6uniwHGTJ+zsxvP0YHY437hz1OOkRihI8nrfVW9I+mXQKIwqqOjMV
         C/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=x2AfLO4Uwu6DTFqmhDerETQ2TP1M+4CRleepW43YVRY=;
        b=jFwzsHZNM4OXDehEbv93cfeMGakYto0oRYA+LhixKov+QtRp6N75Sd8rcLvipI6d2s
         +ZCI8ibtPGrM+xv7guMDFmvXD/IMAYh2RkY2XLYuTjyP23+Rb+j5xU9YvVGAmpDk3HaS
         zaMW87Oq4fWzwoQeZXvK1wPY03ldRBrhtkliqnsfhDDa0H1tNLXuiUPco1F1EKdgNkaN
         AT8pQBgNIvovLj99fFCi3l67MgD7jWtb3OeDlCvAjZwBqbjxXHaaF4zwYOlD1EkD18Ju
         9Alzo7oL4rLNGvLNYcGT2nWeWheOlDePpguTcmcqcsg5anQDhk6SSF7inFYK2INL6oK6
         rnHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cxixVzlP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si23087910ilv.52.2021.05.18.07.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 07:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cxixVzlP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj0me-0006d6-Sa
	for alex.bennee@linaro.org; Tue, 18 May 2021 10:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0mJ-0006bQ-O6
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:33:01 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0m9-0004Os-2O
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:32:57 -0400
Received: by mail-ua1-x936.google.com with SMTP id g24so3297640uak.11
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x2AfLO4Uwu6DTFqmhDerETQ2TP1M+4CRleepW43YVRY=;
 b=cxixVzlP/pImBgyN1ExKjKkIazIdtuG2tklNS2dssYmxqQMLFB5PY+eIdiBXxXVDNv
 tSVZwiu9HUEuLo8R/moY/+vWPoVmX1ckYADiohHv9NaCwp2dYPSJ2V0n923gqf7UyZEe
 fLTiMbeJBDdZcuVQc9DrbjvnvOwSAqmrX1iUau3fNlAY9IWBKJxOa6tXE/JM6JW9zowh
 20fSHaseYfIJ6/bSSGsr3UIlIrL9/OIz4Xeduf4BFMzVXN/Lj/vdVhFLLA6cnzo5cBE4
 Ce8DJGb2mZ0eCvC+5fSNRxbpTjcvUj8qz7SbINQFeqmNREn+44hJzq8OsTzVfzeU9ooe
 qCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x2AfLO4Uwu6DTFqmhDerETQ2TP1M+4CRleepW43YVRY=;
 b=lsZrqKpOpLBJ9mOi/kw2V3rTs2WNbgbLpxwgEBb44XdpXU4cuyT2CcZOyYMSw4lwvb
 abPi58yAbThWc9uPYSNBFh7ZoaStMW2bXGphALUYH79xT7UA3ior+XjQWr6YuyidMJYq
 8sYQ4S8YywzJaR70iOUaHzPllOPC1TFttMiqLTAVET2QcUeGmOEVJ+0mL1zEMTPe42Sx
 Xte9DPjAbPnZGJCA0tG51eWcPNAj/JDnCX0VQE1588MgmwaP1RnLjTecrY6YsCqE5c/6
 UfTjfOdRhqdPBFbxJyrVOvP8I0w6wZClRtAutnCQGztMKp1XgAjPeChpLFT1li7Cb15C
 VaAQ==
X-Gm-Message-State: AOAM533htPsGUguXVNME6U+XBrnc5I4nBFnDA7l3OnQfEQsPFc1jhWHj
 12YHwUGW2CzAbHmb7U60ajTJ7m52/z3p11ho
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr6617257uam.5.1621348366986;
 Tue, 18 May 2021 07:32:46 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id g3sm2838226vkk.11.2021.05.18.07.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:32:46 -0700 (PDT)
Subject: Re: [PATCH v1 04/11] target/arm: Implement vector float32 to bfloat16
 conversion
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-5-richard.henderson@linaro.org>
 <CAFEAcA_PwL-_=7REb_cCLtKK+=Un__ynVEus3GEoSi5p_c3caw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c24f77dd-9f58-3698-596e-778e08be84ff@linaro.org>
Date: Tue, 18 May 2021 09:32:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_PwL-_=7REb_cCLtKK+=Un__ynVEus3GEoSi5p_c3caw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x936.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uoics++DE7m8

On 5/18/21 6:10 AM, Peter Maydell wrote:
> On Sat, 17 Apr 2021 at 01:03, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This is BFCVT{N,T} for both AArch64 AdvSIMD and SVE,
>> and VCVT.BF16.F32 for AArch32 NEON.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> @@ -7567,6 +7568,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
>>   }
>>
>>   DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
>> +DO_FCVTNT(sve_bfcvtnt,    uint32_t, uint16_t, H1_4, H1_2, float32_to_bfloat16)
>>   DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
> 
> Not related to this patch, but are the H macros for sve2_fcvtnt_ds definitely
> right? Just noticed they're the same as the ones being used for the f32->f16
> helpers despite the types being different sizes.

Definitely wrong, and now fixed in the sve2 patch set (need to fix some 
regressions there before re-posting).

>> +    if (!dc_isar_feature(aa32_bf16, s)) {
>> +        return false;
>> +    }
> 
> Do we need to also check ARM_FEATURE_NEON here ?

Hmm, I dunno.  Since FEAT_AA32BF16 has both VFP and NEON instructions, I guess 
we could turn off one without the other.

I'll add it.


r~
