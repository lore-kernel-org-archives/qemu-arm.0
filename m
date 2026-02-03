Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C639E83040
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 03:15:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn6t7-0005xh-I2; Mon, 02 Feb 2026 22:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn6t6-0005wa-4d
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 22:15:36 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn6t3-0007w1-Qz
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 22:15:35 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-8230f2140beso176479b3a.1
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 19:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770088532; x=1770693332; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WxrPbHTNEeaADeXIznhofRNMqAAB/euDk66cp0/yCAQ=;
 b=tblL+WzL+GpIRqzfp98NTY2uV0LNFl3++fCh4v4LBZXAhrnfcuguWlTvVOxrB7EbqT
 2EKLmuOoIJsQApEmb96U45XOV2KRnzx/NqJR8wJPPGmQ5AIUZOTfLXPaHBlsufD3eyVh
 5npwf7XFNZ5qO+tBwckWRlp2K2GLTSyHCtGNCAmFWzifje7u+JXvxJYVwhCvBX0fn4zX
 0YZl1TtYHoTXbfgMNTMTLkCv10wzpEqWJ8Xb7BImuTJcSbaBFbCVWrtrHH7q7P5eRYFW
 ikc2y232hxZe+uLUu+JIel2D/7amufj/jP3GV51z+jFg1AGw1l2rE1hupPU7kmjC34L2
 E+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770088532; x=1770693332;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WxrPbHTNEeaADeXIznhofRNMqAAB/euDk66cp0/yCAQ=;
 b=HbpJoDB0cgJ0Lq/qRv9AW+EsfZly1zKCFXFsIeuAjB9dAXAZVM5dbMiMO0KnVxIajx
 OsS03F/jrtA3cXPF3AxGaQin7CAhIK5WTFc4jyYBniyeHgC1DHDY8+xUZvrL04FTgq0W
 3v2Xuy460FHhd3gV/DTQQPG1qwKSkq+zxa9/bzqyzVSC3PK8BNppidvchG7Cn69IOh77
 skm6ubOGJe1vRGUMMPyDxW1oAOmLn0LuOjtvY6muA3BTtZT4r26hxoyyBKmbDyhMRHmw
 U/K5H4bzqBMmpnauggyxxxnPfzc78kdaIV0FlUnRcQeU8rPw+qkN/DQRG8voZmGeYSuW
 7ZGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa+TXjIB3H7LiBOw0991JqTUwqAkiFFlhAHolmqJkqfEj5L2+ATI0FyXYBuXBQZa3gleKEY5CbeA==@nongnu.org
X-Gm-Message-State: AOJu0YwcfDiwZyG4Pcrjl4Z3epcly5Yht5e0OKTGy8dTpGtdlQciAYYI
 k1u2nyIqBj80cPule/Amv/5hsfFJbQRr3sHvA5gQ6tJKN29xYtObRuDhCLq+kx8f0Hk=
X-Gm-Gg: AZuq6aLUb7sPKqijn4aBsmaY4a2olQRoAAu5SU73+4qJZPOBcaehOViG8tOC5HIgIbd
 38l0dU+VNngQQH28uwN/Z3wxU6/Yl2LOQtQUCYLbrvgCAi8j0VYb6pamdzB6KeFz8rNaUi66SCU
 l/c2xcm1wZiQBxNPp1YwtrtSogDAE8HU/BdeGGyMAqWjKdPr42/eqZDgLcVXq7oN8VaTsy3xuQT
 teueBaQtHfMinkWXkw2zWoLrEyYMnhIDELfo9vaX4U96y1q5ohrTlecdLi12NLdXV2h2iX2KS1M
 zi7TbGoxw1yRT7h6pBFYq2KCWevjuBcQTXtmp2IsZdNauAzA4dD6ENi3+Hc0++2m9+LH5ewMGDd
 jlztwtrwau/GuqDFxTSiIxqgrieSCukXu6O8uxt7rWgSJEXd6qMRppj5Jp30vu6tp9EOPbA5rOV
 CfD1wjk9xBFeMtvmE6rrakzKWVDYmlJzdHMEGO9Swy594nVkz98V8tebPJulWHqmDzCYZ9QSQE3
 i55erCjwO0=
X-Received: by 2002:a05:6a20:6a0a:b0:38e:6774:382d with SMTP id
 adf61e73a8af0-3935610a947mr1540932637.8.1770088532038; 
 Mon, 02 Feb 2026 19:15:32 -0800 (PST)
Received: from ?IPV6:2401:d002:dc0f:2100:1047:c02f:591b:6a5c?
 ([2401:d002:dc0f:2100:1047:c02f:591b:6a5c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3547aff6264sm305046a91.5.2026.02.02.19.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 19:15:31 -0800 (PST)
Message-ID: <a2af1084-de21-492d-a16b-0687682e3e92@linaro.org>
Date: Tue, 3 Feb 2026 13:15:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/15] target/arm: Add aa64_sme_or_sve,
 aa64_sme_or_sve2 features
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260202133353.2231685-9-peter.maydell@linaro.org>
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
> With FEAT_SME, even a CPU which does not implement FEAT_SVE is
> allowed to execute the subset of SVE instructions which are permitted
> in streaming SVE mode.  We correctly handle this when the emulated
> CPU has both FEAT_SVE and FEAT_SME, because sve_access_check()
> includes the logic for this, matching the pseudocode
> CheckSVEEnabled().  However if the emulated CPU only implement
> FEAT_SME, it will fail the initial dc_isar_feature(aa64_sve, s)
> feature check, because this doesn't match the check in the
> per-instruction decode pseudocode, which is typically:
> 
>   !IsFeatureImplemented(FEAT_SVE) && !IsFeatureImplemented(FEAT_SME)
> 
> Add a new aa64_sme_or_sve feature function that we can use
> to update the relevant uses of aa64_sve, and similarly
> aa64_sme_or_sve2 for where we need to check FEAT_SVE2 || FEAT_SME.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index a7ca410dcb..40393d88f0 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -1507,6 +1507,16 @@ static inline bool isar_feature_aa64_sme2p1(const ARMISARegisters *id)
>   /*
>    * Combinations of feature tests, for ease of use with TRANS_FEAT.
>    */
> +static inline bool isar_feature_aa64_sme_or_sve(const ARMISARegisters *id)
> +{
> +    return isar_feature_aa64_sme(id) || isar_feature_aa64_sve(id);
> +}
> +
> +static inline bool isar_feature_aa64_sme_or_sve2(const ARMISARegisters *id)
> +{
> +    return isar_feature_aa64_sme(id) || isar_feature_aa64_sve2(id);
> +}
> +
>   static inline bool isar_feature_aa64_sme_or_sve2p1(const ARMISARegisters *id)
>   {
>       return isar_feature_aa64_sme(id) || isar_feature_aa64_sve2p1(id);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

