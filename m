Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6A4CD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 21:58:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXsS-0004Pd-Jb; Fri, 22 May 2026 17:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXsO-0004IY-FB
 for qemu-arm@nongnu.org; Fri, 22 May 2026 17:57:54 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXsK-00017O-Iy
 for qemu-arm@nongnu.org; Fri, 22 May 2026 17:57:50 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-36a3aff302aso2204250a91.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 14:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487067; x=1780091867; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5n8IQx7EY0CJn6G/bV7CipFELrrWflkQjUXgLKBAuYo=;
 b=Pr51OvTnb/ByMcPVUsvMR5aF9lH6MCCDPjADTDkRzX87//BrlUdixFKt1auNjy0NDN
 mOaXaWmdrC3clLH32ZKEMsR9T5QXmoil5U0HFjpkv4Sk+j1XuV6c+eECmnJ/qIJ4nTHX
 GXTV1jmXsokKThqtyiwm/x2g3Ju6rB14XktnMEPm0g8GnHo752N98vllDbQ8cyBDrsgG
 GywFlx1vklXPu9QR6Azo4TWu7D7CZCV3hDdKwNbjG9yIUY11WWJ4H43GEBwa81ueH6lm
 OSR4oEMHfh0UBrtXUYsCtqvatXWg9nty1qm6uGVVy11zFNfgHtb/N82aG5SZ0AIl9iJD
 JnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487067; x=1780091867;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5n8IQx7EY0CJn6G/bV7CipFELrrWflkQjUXgLKBAuYo=;
 b=X6A3nNdwUf4tpcSRbAj1a4f1gwe786x4h33fhUsy/LgDzK29nEoPGkSJ27p6I9CiG5
 kM+N+vOFOIQ6UNf91/jNkO6LJuUye/XlxSTbAYjrEGaTg0v9oBQWTpWdiE05izVKrGcP
 9s26/lPCqdhA20t+3nMTtDrS7YLVTWgVzjS8d9diNvMBOwBWBcWlISBfA9C2sfMjF6U5
 sFff7aVPxDbfBjZi8CqV0VUfOZfNnInbQJ3ZIUzeo6bOIhoXfBKyr397I6YBsIPHeVHS
 CkLZ7T3G5kTLeibrvGYJhS5RAXCYlF5IB+Bdok8dZoklvqDla5/wuElVmj4If4VCMahQ
 NiAw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9oc6JBD3dmkQAafvUJMsnd26FL9OQd7HKUrtqrQbQ/KlvFm7S1i8tmQ9SeuGKpqizinzc5P47nzg==@nongnu.org
X-Gm-Message-State: AOJu0Yxn+u4VfcHrSXsZjcGZqFKsRfX/wOGEBV57VZ4AveWExrbnCRJX
 CvQH4sySrvOVuJvF6EifWOiad9sHpSksbVx/dcyeLmgOg/4+JJodgj2yf87aGH8A6fI=
X-Gm-Gg: Acq92OHhVtJqYw4zGXI/mQob7ph52Lx4Bmc9/mW7i3MSAs3YIQlTZJTfUC3EeVqNqo0
 7gRxNP8cx6Ccp1Tx3s3oKY4EYcA4EbHlon2SnxYqU/JvU2AjIRQyyxFR/MsWd6JvyHd1KG3CSR0
 1SxTkxJfy+Rsk1XQnReIgVIHqDUmfjr1u94TnjD0f5YOK4ex9s3xytp97wnYOfs90E6/76VDWZi
 321jMWG2W2lj0D1El7L0jpA/4E2lu5TY4AS+iK99HY9m3yEnvCU9/HxUBbtGsL5zt05s26aetK1
 SHE83/65vRSNQsKKrCrzHm2h4XUKFLsn+DuIwMlFe6UQOKURcAs4USlnYqvatlGOC/xWPRI8vrQ
 MlAFs8AuCeblUJ2XJPM/7T9GBNQSw29hZTMvb6FsEopq08SJE2J5XETa2vk0ROBkZx0nTnbPv1u
 u7wKPrkraMardLZp8lRuyIPd1XHTN+BQkXzVHFqRBP
X-Received: by 2002:a17:90b:3bcc:b0:368:f179:ba07 with SMTP id
 98e67ed59e1d1-36a6746d070mr5128110a91.9.1779487066777; 
 Fri, 22 May 2026 14:57:46 -0700 (PDT)
Received: from [192.168.64.111] ([50.78.183.177])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85202901e6sm2259406a12.2.2026.05.22.14.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 14:57:46 -0700 (PDT)
Message-ID: <53e498ea-1110-42f5-aef1-b1233677954b@linaro.org>
Date: Fri, 22 May 2026 14:57:44 -0700
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

What is the difference between FPST_AH and FPST_A64 when AH is set, given that 
vfp_set_fpcr_to_host does the arm_set_*_fp_behaviours dance?


r~

