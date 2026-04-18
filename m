Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D36F99C6D
	for <qemu-arm@archiver.kernel.org>; Sat, 18 Apr 2026 00:09:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDtEy-00009M-Ut; Fri, 17 Apr 2026 20:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wDtEt-00008V-HR
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 20:08:49 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wDtEq-000630-Ig
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 20:08:46 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-82f1bfc9b8fso557923b3a.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 17:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776470922; x=1777075722; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KnbkQGrVB7bINDJ29Y/dXFuTqXc4UOVwMIevBemqQm4=;
 b=IkskD8fnn7p9xhGojjGAZCUkQjVWb7o8FXLCkgdVmZ06xL9kIseBRr+cIkE2tBrLsJ
 7aeFpJANQ4mpE44xIMX8HsIz2TnPQPk8ZnQt3szF95SlCk4TeRMtu1Ghk3bDZUCitJDe
 l4ik+fMUEkAKCPpI/G0IjKS5Yu9HPpJqYdQ00A9imLIYliy4fdzx4HAcYffo4FaIBstB
 dM644vFcy3cZWqyA4jAOFm/qE0w6Eh56TS6Ad6W42DICmfotvECsI5dy6avnpwiqO0hB
 tTglUVyZDgdEk+7n7EClHUc1oo88dVxig822yjHmPqdZ3OW5JDbCowBXxTrpESgbM6ug
 hD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776470922; x=1777075722;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KnbkQGrVB7bINDJ29Y/dXFuTqXc4UOVwMIevBemqQm4=;
 b=fUJetWoaWhM3kW+XXsDMBC1x9U/bruXSKOBzZK/xrsGUIUmyEtFpVHQ8sW5DpftsCn
 S6zm1ssw/XVDLOcBRCAFo5PWq/PMUfEAsib/WkKg+R4Ktl0eXA+qoceom54mYgt10BUm
 iE5soBe/UCcGyIZ+XTI+ugX7lWJVOY9Dokv7C1I0NPtDBbC7JitK++aR3S4zVCGfoxpk
 ZZJUdMBzCUToZlFxGyKRtvaZwW2gC9I6IPP/39kUqcJreEaTnAiy0X/+VjgT5xiShbt1
 JHvmvhcmpPY9yi0hiIgpSnuhJgGOzZlXHvq8qpSbWxJuPNc086VmSycf3FMG0EFJKKNF
 YoQA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MLZQVuOjR6Kr9OpXFKz7dOkc0KNxDRKWMQC363R8f4ZW/DeTS2jBRd6ciklTWQkk05qpvU2f4Kw==@nongnu.org
X-Gm-Message-State: AOJu0YzLYHUbbZ7dM2XPlLSVOW1bCjixxK2+FhoAuIPVQFFWJIvXMJle
 CR779keHKbFraIrqgpVEMvsK4nYbZwGQRoPUFJOshwVgBMm+2X8xf1V5x1m6gGSBpv4=
X-Gm-Gg: AeBDiesaU5pWc3U28zfCPAMry+eJYHzdBHHCMIZ3KPNO4L9fUUvCdfBiOX+lHizWAut
 BZSu3fpR/VirTaeODb9aiGER4y+X08fHiH4FmL2BPsX986t76JMFagDERQXnr3PH2PZMBDAqFwq
 xi55QDrKUY2eZS745JDaptXfLsmN4ZKi+p18gu6LH6fQQPjBfaiFtPIymIBKPFj5MqrU+a9TQjT
 4oTy+Q1Apkfu3eJBNkBayoaKMC+pIFEnGjExj92jkvqp35b02QF+n/Ii/1c+TG61AviNjt7u64V
 ofBUdDsozlnVsgR3gw35NqUdgK5P3gt4NHOQRSrZ0EpPuCbcyoLKNERFnaBrTP6z+4hsztvlUkl
 pBLJU2sHUo0GsWdCiZqiMB8uNE/ghIZ68BURv3/GAA1KO+NTH0RaOnUC/Q/X82U/BHPE8aTtC1w
 wtLtLAQezkFIzQIxfoCpwK/ARbz6dFvJK5nSZ8MuHIhaxc38HcS7cWYEfKgGYJPdA7CL8OARc1D
 SLdZnItUnMfLGZ7qmU+Mtfh67kuO7oNZ1i5VRrHuv1FRwqdykCb2wDp5BeOQxINKw==
X-Received: by 2002:a05:6a00:945c:b0:82f:9407:d155 with SMTP id
 d2e1a72fcca58-82f9407d4b9mr2691463b3a.40.1776470922052; 
 Fri, 17 Apr 2026 17:08:42 -0700 (PDT)
Received: from ?IPV6:2401:d002:dc0f:2100:742f:8dfc:5be0:dc23?
 (bg30dhzyct7sk57q2zln.ip6.superloop.au.
 [2401:d002:dc0f:2100:742f:8dfc:5be0:dc23])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8ec04448sm3708513b3a.55.2026.04.17.17.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 17:08:41 -0700 (PDT)
Message-ID: <641cb56f-7e38-4b09-8514-5301827242c4@linaro.org>
Date: Sat, 18 Apr 2026 10:08:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] target/arm/cpu-features.c: New fields in AA64MMFR4
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260417-jmac-feat_rme_gdi-v2-0-7cf5131aeb60@linaro.org>
 <20260417-jmac-feat_rme_gdi-v2-1-7cf5131aeb60@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417-jmac-feat_rme_gdi-v2-1-7cf5131aeb60@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/17/26 21:02, Jim MacArthur wrote:
> Added RMEGDI for FEAT_RME_GDI and other new fields.
> 
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>   target/arm/cpu-features.h | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
> 
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index b683c9551a..2d1a3196b7 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -346,8 +346,16 @@ FIELD(ID_AA64MMFR3, SDERR, 52, 4)
>   FIELD(ID_AA64MMFR3, ADERR, 56, 4)
>   FIELD(ID_AA64MMFR3, SPEC_FPACC, 60, 4)
>   
> +FIELD(ID_AA64MMFR4, POPS, 0, 4)
> +FIELD(ID_AA64MMFR4, EIESB, 4, 4)
>   FIELD(ID_AA64MMFR4, ASID2, 8, 4)
> +FIELD(ID_AA64MMFR4, HACDBS, 12, 4)
> +FIELD(ID_AA64MMFR4, FGWTE3, 16, 4)
> +FIELD(ID_AA64MMFR4, NV_FRAC, 20, 4)
>   FIELD(ID_AA64MMFR4, E2H0, 24, 4)
> +FIELD(ID_AA64MMFR4, RMEGDI, 28, 4)
> +FIELD(ID_AA64MMFR4, E3DSE, 36, 4)
> +FIELD(ID_AA64MMFR4, SRMASK, 44, 4)
>   
>   FIELD(ID_AA64DFR0, DEBUGVER, 0, 4)
>   FIELD(ID_AA64DFR0, TRACEVER, 4, 4)
> 


