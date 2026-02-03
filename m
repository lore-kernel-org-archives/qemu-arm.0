Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB38AE83043
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 03:13:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn6qJ-0003B0-1r; Mon, 02 Feb 2026 22:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn6qC-00037g-FW
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 22:12:36 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn6q8-0006qf-Q9
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 22:12:35 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-81f4c0e2b42so2965090b3a.1
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 19:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770088351; x=1770693151; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=07V7MfFl/bioGoEebLtntbQdeaz9O9lILUnoX5oUsCg=;
 b=xnB5slQwB2mAM0zGXh1BUCpUc6wqyiYHQhxHbPZQIsWn+QkuNwVGYLhQlUv97Hn6SL
 AvbQ/YTLbCtdKJK/FGhh98O3cta2fy0sXghYtlXjcuS8Xn3zHBKunMPj1eDXEKrKHZTH
 /pB2gAEDcBq8CwWWC91c3mLYG4i6wti40HyClH0oIQgQYbTUE/zP1I7iJRFvJmkZ0f+D
 OXC0PLiOz4ocAJzh6Tkmj6Kkx8rK0aN+x94WmDuU080hXqG91J5eakEbu8Sh6dywRXQO
 hMJRaFf9/lAUXg7h863KRtCOSAZ18EyZ+e57VLRU5FP40Np83FWcpWA7H7jgLGu0xR7U
 6grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770088351; x=1770693151;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=07V7MfFl/bioGoEebLtntbQdeaz9O9lILUnoX5oUsCg=;
 b=pkOEpvmQzICnsn0WSRDSby8MG9qXVn1dlP2ntJBfxp9ndT1aSMNXKKhwoC8H2QhKxT
 CboTl//rMun6meymkzhS9qIb4XtVAa0Qy2eSOMO6/mKZSAyKavebl+1OPWZJ1oBKoNdM
 lNYXxXgx98FlrWF++4IAl0OhMw93NpD95uAXUZnRtPHAHrQjBMzF6I9HWr7j4wDbx3If
 9Y+6OaZxbLGOohXBmb7eomXvp8kKTLsD6VOp+QB4jI0X+M8LKioDn9xcnrTRKmEf9HEV
 kqjNUQ9kaRPStIyMxdZrglE21xMNL1Mr7OmzRFM4IuDFLTm5bePwCd5CZFT1y6/9U/OO
 aJpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2mfq+TNmek5EuyODnaFqfbs54mULL6iaFbPwG1md3wEbe5NqNPSg+LsGpQjx2OoOmdQ/3QhAmXg==@nongnu.org
X-Gm-Message-State: AOJu0YxWlpFHBuXnoNJ0eadO/LQsR4yBzyB5ueXZPnoU2UfLJy1E8ZQS
 CzWuSZJwDMG+5JMoFiaQ9O06QZa97V0QKGHx3hGdwTQfGsuyJiRyfxZq1eurROwH2Dg=
X-Gm-Gg: AZuq6aIMTxoKXy0dxYzdQdOrNzGbH7JYiw0l/JNnE4KcmFmQk/ckx/Ziz1oV4AXuCXf
 fKXhWKgdc/SJ6fmC9/892EEHWrJ0xCAVkxDPJxVwOlECQRzlGi+gLWub+Hqy+AeSV/9JRWoX5Ih
 wha3lywQXkfceuwVxVat1bpIXrPyReIx8Q6LLrjCgwPVC626EpHR9Rje3xGr8S7B/VDWOA6GQQt
 ptdnrzr27si1ZD/+l7vf7OcCljWRODTU9nTOoAka1gF2iSF063bdfwPtGZY1N4XfxyhC4/MV9Ss
 x7y6k7TKhwKdKDjalgo+gztkb7yFSq5SHCAaC19TvgWLJzDV1P0PVegeeSbW+N4GBpZEPbaxcro
 NioPvy5lYMuqTZXG1Kd3/sS4NVvgRWg80o6zjaAmw1uWNuPSTqyKO2dyLasRoZkqsdSuJ78avYy
 kj8XOxMtKg/l1UpATMJu/Qg4Of3qZWsES3V9FivVOMT50QfCRQqDQb6mnDRoU9bOUm4f0/aLUAZ
 gZi94C4UmI=
X-Received: by 2002:a05:6a00:2d01:b0:81c:92ec:ccf3 with SMTP id
 d2e1a72fcca58-823aa43a5afmr15378833b3a.19.1770088350945; 
 Mon, 02 Feb 2026 19:12:30 -0800 (PST)
Received: from ?IPV6:2401:d002:dc0f:2100:1047:c02f:591b:6a5c?
 ([2401:d002:dc0f:2100:1047:c02f:591b:6a5c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379bfb924sm17821845b3a.34.2026.02.02.19.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 19:12:30 -0800 (PST)
Message-ID: <4bcf78f9-e2c3-4673-b7de-88ba7776e1a8@linaro.org>
Date: Tue, 3 Feb 2026 13:12:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] target/arm/tcg: Allow SVE RAX1 in SME2p1
 streaming mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260202133353.2231685-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

On 2/2/26 23:33, Peter Maydell wrote:
> The SVE RAX1 instruction is permitted in SME streaming mode starting
> from SME2p1.  We forgot to allow this relaxation when we implemented
> SME2p1.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 7b1613a1020d2 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-sve.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
> index 81f487152c..e853b4dd0a 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -7803,8 +7803,17 @@ TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
>   TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
>                           gen_helper_crypto_sm4ekey, a, 0)
>   
> -TRANS_FEAT_NONSTREAMING(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz,
> -                        gen_gvec_rax1, a)
> +static bool trans_RAX1(DisasContext *s, arg_RAX1 *a)
> +{
> +    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
> +        return false;
> +    }
> +    if (!dc_isar_feature(aa64_sme2p1, s)) {
> +        /* SME2p1 adds this as valid in streaming SVE mode */
> +        s->is_nonstreaming = true;
> +    }
> +    return gen_gvec_fn_arg_zzz(s, gen_gvec_rax1, a);
> +}
>   
>   TRANS_FEAT(FCVTNT_sh, aa64_sve2, gen_gvec_fpst_arg_zpz,
>              gen_helper_sve2_fcvtnt_sh, a, 0, FPST_A64)

I wonder if we should update sme-fa64.decode instead of handling this per-insn?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

