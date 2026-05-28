Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D8ECD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 16:28:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSdam-0002o9-Dy; Thu, 28 May 2026 12:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSdal-0002nh-FU
 for qemu-arm@nongnu.org; Thu, 28 May 2026 12:28:19 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSdaj-0007ds-Tk
 for qemu-arm@nongnu.org; Thu, 28 May 2026 12:28:19 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-836ebdeb969so5820141b3a.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 09:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779985696; x=1780590496; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PqE/hyiWAc2OYrVtFnbdWdCzfbp9l3B/SMhEsnWSY8E=;
 b=hlzZMcwBnajK87Yc8nimQwKqG8ZfnAcP+5H8MrGRawlQSg5lvIck31fnkHvvQeP2eP
 M0Xz/OJo7CWk1MzeAH9JH5v6sHZvIoe09tHFtF16OK+FgamhnDm8kN29QxVhvjo6Qmuv
 i1phng7u+oqOhGMDF9wqFvpBSSbQZJj6XAZ+b+Q1OJ/7f+Aa8kQ8mUrgWT/q6ptpCE5n
 5LgF1Unr9EVRWMGydzGXOGAj5IUVLelTWZj+m04q90IoLKKtvgfcaE/UsKvlJWptXuu1
 6wXRaSjlottrbd6NAIW9EqX9dPNPV78mQGezVpYlQ7XFbo0s3FYRocAl5jAyiAgUp4Ko
 /zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779985696; x=1780590496;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PqE/hyiWAc2OYrVtFnbdWdCzfbp9l3B/SMhEsnWSY8E=;
 b=V2C5FPVe3FUopqO3YEOqi9Jv93ynh7Jv6+SDFTachUErZEuWUeW4/Lu0Zdc9tORFhO
 6eW6K6uAOGpxVVzooMgnCy2zVipBGmwtmGIJAjNbQYzC24jSo8nRhPyPQ9OrZh2BS0tY
 QD5iVz2qsofdIrg5ZdD+TyRSIm2K+jgnZS+CeZKljzhmSFmtpeSnaoUTM2pFEPScx4L2
 d9NFQq8qZObLoPGkfFAe8CX9Fvet9MxzdxF+ScLyWE/nnkvwaZw2kW9TUkKaZyMZVPrt
 7+Ul2PC/9e2jb4XrrM8wrJdogV9vCvOHxjcr2zTXDZ2aJnsPDE8FMQlQzVNlXTxTByme
 F61Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Mz0Y2TNoT2iRE7wrkG3AY7UvIE0o1YFddqEGPFKJtPjCNWU7hdhwMsxzAvGUbev3DX/Uy7TKQZw==@nongnu.org
X-Gm-Message-State: AOJu0YwTeghMDmqVTujzMLCrzneKo4sygmJqQT1Gv3nsuSXSpaJBCqer
 K2MqncSVa2/gPYysn64q3eTg6sknAie+Eeo9USiKf8cZdjhBw/b7RA2oQNnQ1r5C55o=
X-Gm-Gg: Acq92OFuD/uhCg+Yl9Zs0251Kjrx0aDGPVFI7mTvCt5v0fU9PT7IJZQsJlWSsCHe1xa
 o8W1kNzUGJTeUoyioRowDMeIwGW3S8wCj5uH0GDHaK69VbaSSX5WD85EGMzS8asKATDgy264cvL
 owQ62if7X7/Dxdw+gwa9ovUd/axLenWc+alHKTntnVlBAFbH+q725fl5D9U/35T8fWe3970zcm1
 1ZSx5VahF3quw94T2HGoD70Cz4iuHIVEppUAfMHdn/l6TC2Smi6355Ue5vm3WxFciaOelaGrUjG
 urrxpo4EjST9I9FTFeZt9HEO3m8Fo0Yh5oraJ9RkP0hr6r5CegktT3PJImm890LZQnz2fGHAnF+
 4hFTz6mAGYFruKGoOm9t/xgxOu5v3JhQbRZe58HYoV8Cpu5mKzv2Ap5UBFPZE7smRDEEJL2YwaK
 GQUR0Sz1YbCnmq+9M0Nfnz0jBqYxpWIHht6CSqNEiEONHltr8=
X-Received: by 2002:a05:6a00:a90c:b0:834:e15a:19f7 with SMTP id
 d2e1a72fcca58-8415f3a5b7cmr27377190b3a.44.1779985696014; 
 Thu, 28 May 2026 09:28:16 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-841d70bb654sm6855410b3a.29.2026.05.28.09.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 09:28:15 -0700 (PDT)
Message-ID: <22833605-7e0b-466d-a3f1-f9771f5659ac@linaro.org>
Date: Thu, 28 May 2026 09:28:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: SME BFCVT, BFCVTN have "Alternate BFloat16
 behaviors"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20260521180854.1744788-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260521180854.1744788-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/21/26 11:08, Peter Maydell wrote:
> The Arm ARM A1.5.10 notes that some instructions have "Alternate
> Bfloat16 behaviors" when FPCR.AH == 1.  We implement these using the
> FPST_AH and FPST_AH_F16 fp_status words.  The list includes the SME
> BFVCT (single-precision to BFloat16) and BFCVTN, but we forgot to
> make those use FPST_AH_F16 when we implemented them. (We get the
> ASIMD and SVE insns on the list right.)
> 
> Add the missing logic to select the right FPST.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 465d36db0e1 ("target/arm: Implement SME2 BFCVT, BFCVTN, FCVT, FCVTN")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> (There will be a minor conflict with the rename of BFCVT to
> BFCVT_hs in RTH's FP8 series.)
> ---
>   target/arm/tcg/translate-sme.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
> index 08254b088e..8e56dedaa3 100644
> --- a/target/arm/tcg/translate-sme.c
> +++ b/target/arm/tcg/translate-sme.c
> @@ -1419,9 +1419,9 @@ static bool do_zz_fpst(DisasContext *s, arg_zz_n *a, int data,
>   }
>   
>   TRANS_FEAT(BFCVT, aa64_sme2, do_zz_fpst, a, 0,
> -           FPST_A64, gen_helper_sme2_bfcvt)
> +           s->fpcr_ah ? FPST_AH : FPST_A64, gen_helper_sme2_bfcvt)
>   TRANS_FEAT(BFCVTN, aa64_sme2, do_zz_fpst, a, 0,
> -           FPST_A64, gen_helper_sme2_bfcvtn)
> +           s->fpcr_ah ? FPST_AH : FPST_A64, gen_helper_sme2_bfcvtn)
>   TRANS_FEAT(FCVT_n, aa64_sme2, do_zz_fpst, a, 0,
>              FPST_A64, gen_helper_sme2_fcvt_n)
>   TRANS_FEAT(FCVTN, aa64_sme2, do_zz_fpst, a, 0,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

