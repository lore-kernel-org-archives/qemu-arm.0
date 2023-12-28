Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1231686ejc;
        Wed, 27 Dec 2023 16:03:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoJLvT1nbtIeZc+OidQDEWr6mLSNPbqcGdLaP6jbaDhOsf1t5A5WSx9uREbjgcS/cjl51T
X-Received: by 2002:a05:6214:2481:b0:67a:a721:830a with SMTP id gi1-20020a056214248100b0067aa721830amr15267347qvb.100.1703721825376;
        Wed, 27 Dec 2023 16:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703721825; cv=none;
        d=google.com; s=arc-20160816;
        b=uSA/RTrLKQbRJo63wN7sf3OCZ0bqPs/SNWqESs1qWi0NOqYs4/2MaDFILcfpOb37R+
         mX0QagkICnkpOKoT7qud1YE2j7R9430drPASZUxQY1BlYVJp8DDzjpQaiUHk0dNzluyF
         ICtLNJA/9X/iAQGrHFeKXhfn+tAjLRQzw3FDzI8p8RlBnJd2p57hJSvMIo9228i7rPYO
         csob6lAZGauoIaYnQP7CrF4z+53XuDjBCmvJx8JPAVtia3EDT0IX95oo2N13dReB5fIE
         S/IQfv+kbe8akLLv1dQin19PqQW+M817kim3F7Va/BbxGf1a1o7hmsEqInz1YHFnGzMP
         bdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=J+nChfUKSb2m0urOd7n6/MYl+m/WZBr1+QmRZeRAisc=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=eCYKcBHX3m/JTWP7QOlHyZF0UEyL2FBX58vYehgL4KJDrpTt+su83AyTiFgbVd3Tur
         pEmHES3sKaGb+AHL5M4HLMDSRge3GSGr59klfRvRoCUyyAHwiadB2I0yvGl5Mo1E06pr
         IsJVWuJYpfALmiG1R2twVTGq+wf54t+fAV+shNBob174NtmqFQitQN7B4xVobailkbZn
         VhJj9eErtCweHMXmDsgZemXRGvGpMPwJ1wzy7Y6DxN7JobECRouIcO2muuCcyuIR0e/I
         upsm5S4gIJMIwPfaclRSGqlHGsBkM6Uf2//d5hsF3CLAnp9ZjWCf+a/QU4LAxE20rwLm
         g+uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y39Ali/8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14-20020a0cf0ce000000b0067aad4f088dsi15604935qvl.118.2023.12.27.16.03.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 16:03:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y39Ali/8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIds4-0008Uv-Kh; Wed, 27 Dec 2023 19:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIds3-0008Ud-AV
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:03:31 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIds1-0001sR-Mx
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:03:31 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5cddfe0cb64so1706577a12.0
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 16:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703721807; x=1704326607; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J+nChfUKSb2m0urOd7n6/MYl+m/WZBr1+QmRZeRAisc=;
 b=y39Ali/8vokVPwxRkStwsZr3Xo1KN+VMUE8TkfOw91MHnuFtksfYu9r6Enmy5kQ3/d
 YXvQxkb40sCkxktPsCgffuF5sSHP+qGit/wm/GpsCAmBI7ax2fbnT1Gc/yje1vMr1OCj
 y1ZAafDjB6YaJQc6vg2wD61ma013r41XJ0o6V40PHiYaGPC3Xcr2F42eXZnorPhDq8Ff
 qgi6AGaj2nfVzwF6O1tbMX8FOnMQSxv3N4dTIHq4QlEopO6cbYhsIRjN52t0q8LLTEug
 M8d8hX1cD4n/lbP7hwcxKZIViC8qLlh/GJxbHxIt8hHomhfxd3h4+FncRVFOqGyhpe/B
 t8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703721807; x=1704326607;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J+nChfUKSb2m0urOd7n6/MYl+m/WZBr1+QmRZeRAisc=;
 b=bbhG3UldBhIreu1lFadGFqnYRi74yWt4nI+5KekOTcy5kglZ2CigEBW7NCrOEpdp81
 jbDpsjWM1rLx4GlKh0iB1Uz49a77EWwBA0IFX9Y7IshYoIF1RCwPnqHs9RlKhByzWRx4
 h5k9Rup/VNAjZL45OkaNWCffwnSZASKsvNOQfUhklofpQSVAhbyUg2TOnebETcPod2rQ
 jWPI5WezKMt1evDeSPlEWWpsgegNZ5MZVgWXrtPZsvLFi8TPR2Nkl+5SL/mbnq5M1g+y
 bL2KtBrUzcELK44wBdw6YWD0EAwJwqMZxQG+pneZ347wX5FuQa529vk90HdvGSKSj/4b
 zRqw==
X-Gm-Message-State: AOJu0YzKrsICINXR/KQYCuN53absDsdzgKAV2NNHrehl6MSNXISBIYYW
 LDUnCtf3V+mS81w9RzqXYnlHKnX1LIfGPw==
X-Received: by 2002:a05:6a20:42a5:b0:196:4a75:385d with SMTP id
 o37-20020a056a2042a500b001964a75385dmr154037pzj.58.1703721807558; 
 Wed, 27 Dec 2023 16:03:27 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a170903125100b001cfa0c04553sm12471567plh.116.2023.12.27.16.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 16:03:27 -0800 (PST)
Message-ID: <e0d3e790-a937-4f1d-9a30-e4ff04a7af93@linaro.org>
Date: Thu, 28 Dec 2023 11:03:22 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/35] target/arm: Report VNCR_EL2 based faults correctly
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: vIpb4zFZgKdI

On 12/18/23 22:32, Peter Maydell wrote:
> If FEAT_NV2 redirects a system register access to a memory offset
> from VNCR_EL2, that access might fault.  In this case we need to
> report the correct syndrome information:
>   * Data Abort, from same-EL
>   * no ISS information
>   * the VNCR bit (bit 13) is set
> 
> and the exception must be taken to EL2.
> 
> Save an appropriate syndrome template when generating code; we can
> then use that to:
>   * select the right target EL
>   * reconstitute a correct final syndrome for the data abort
>   * report the right syndrome if we take a FEAT_RME granule protection
>     fault on the VNCR-based write
> 
> Note that because VNCR is bit 13, we must start keeping bit 13 in
> template syndromes, by adjusting ARM_INSN_START_WORD2_SHIFT.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h               |  4 ++--
>   target/arm/syndrome.h          | 20 ++++++++++++++++----
>   target/arm/tcg/tlb_helper.c    | 27 +++++++++++++++++++++++++--
>   target/arm/tcg/translate-a64.c |  4 ++++
>   4 files changed, 47 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
