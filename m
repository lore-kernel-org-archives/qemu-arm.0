Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFDACD98C5
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:11:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWz2w-0006Ra-7F; Tue, 09 Jun 2026 12:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz2u-0006Oq-99
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:11:20 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz2r-000606-Sg
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:11:20 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-bec2ddee9bbso1147835166b.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781021476; cv=none;
 d=google.com; s=arc-20240605;
 b=DMnybQYVafH9Fju3C7O6lnR/M+makcZIPbmKhdHviu8zWBM3dnQLcbqGELQXkBo03h
 g5tTWlQ3IUZ2vnWZy4nF+t6mAV/nZlXuMuRQbfvY3hy+q3GU2NuRXdPfftfEABHd/HS6
 Khxp7J4/UHNxQBMn+444OgMAYoWd3CJVS7VxFJMDRsUfHBiX082X/On1jBk0WTvNHAC5
 ND9OXUpgcEH2J5FpejGbV7/Rxmh7g1LLmGzOYPFHE2oc00FICRPcSLB0jIFD9TeoNbAv
 UOL7lcdS6FxpKd2KbcbxUeSLnCzVvqxsMPOm3PVHa+7jn8akXDnCEq7jjYFd+i+emOfY
 2mMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bmbZtOBEhzGzWB5lH6BsUTwAB8cq+OSXLFA+O8hG9ys=;
 fh=KJMPMrUFqkkDgDYzTYLBQ3B7JXco102re+KORFTP6WM=;
 b=IUut4pE7KB9ezlSM3VtBGsM4w++fKkz1i0rUdBnSQmIBqNcbPwclmrQ2bUZCijecCA
 WNAY7FejcoOJUrBcDFawJ+vhFvNToKftUMPX2VsKjAiOaxzIdITd117AONFiNtij80Av
 nTpfL3DFUvowJCjgXKWEAIdSG7yJAvzaKK1vtod7RTQX7rdPPScyuUTzgbd1eBqC6DSK
 VacxeqDYbSSr/XiIoRZ0IVJP+Zj63GXIkkufzECrs7G+e0zYRoS4PcwKgA+05m/BKiym
 ZCcBa3jv4kkQ1Dis6F+qyZtMHlZCCZQlT4yM4IMu3ggqjLMV50Xd07XMRPmM558P6QvZ
 0Gmw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781021476; x=1781626276; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bmbZtOBEhzGzWB5lH6BsUTwAB8cq+OSXLFA+O8hG9ys=;
 b=FyFp2JE1o7tIUtskAV994KD/ltPUNMDCEtkE4dELd7tGv4uPTJd6kSZno01GjAIEtN
 17c6I2i/LIJx3S6zcoxSHeC4RJVPqCC0GAIRdS6QGZz1s1aUTkQcWiU10ux1PiIem2Kd
 2NH+Uf7ziImwRfhiJiSg7MEumAJr2nGMSiZnptgSXMdNP3UAMPsEmkov5NwiB1gpwBvE
 uoveM5oUbTg7hrjZl1nrdlpwW15Cl0Pmo/tupC2qMURmKaGOaHqWtuRkTn8MfqklXCnY
 4uoSD7NydjUJKV0wuSbSqx5YztuhirfrUlxG7tlcoW7v/YQvk290Xx+2QHDNPKsKndv+
 XVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781021476; x=1781626276;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bmbZtOBEhzGzWB5lH6BsUTwAB8cq+OSXLFA+O8hG9ys=;
 b=LxhBUX3PUKd2jT5hcNxU2TF1RYK3AyJ4n2CtSLsLsjThlgzkgnryVKz1iPjZQ4Vn9p
 uLJ7cmBCx5y4ClvOx12xOE/REr9m2LT3MHGwaa6ZXcWZmlosAimMnsf7N+9/FUb94dxQ
 Tz81xbC1s4X/8d6S0wopU6yjVB8Ai2C2+brNTb/OFy2VdhKYCHBhFO5cGeAz5/WrIudY
 Lg76q8/CQ7RC6h992ufO/JCfgyZnhH7d4WMXv4g1AxrAmssAXggTXnII3kNmJsT9c6Xa
 sk11Zxr6bg+iJokicG9xgxc2I4cZtEDTSTrq6Vmu7M4f7sWxV9VmxfhH9Ix15N8uQHCZ
 7WZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ++rDTG05gBLlO2EjpQGSTXU7bDkQanT2NdUrcnZ8rAW8ZmKC0t0Uxv5JEjVJ9+qGgJFm+jRlUXVA==@nongnu.org
X-Gm-Message-State: AOJu0Yzy6qPMLI1ET2p6PuEJcW3kUbN7K9PPj3FMiWfO1n7t4UXf6jjS
 eE1J1S6PW7xgDrAiViP+IZIpf/SdvJIsNPs5CSQoKFi9PFFpCaZkyP/fSX/VbLtHYJDuKT6FHTK
 2rX8xF5fN/Q+TrQlaDRahDNYmv+JbOplR5aDoYlbaAQ==
X-Gm-Gg: Acq92OHkUV9GWzJcCtNuvZCvq5Ew6QnZCBlGtX7Ojm5Fvp14YyhZc2wxUdbs4RPLPgq
 WuvSIdEclwnytIifQjlPGQqbN700l3MVCAi8na9a5ki5iyDMBET+fwsEkfR+8gpn3mU3eWyb/pS
 ZFqP2Hql+kUp83nQanMvo0ec25m1DBfEW+wiQEecltxIFDe6gV61QsIC4cvla3rntzOBjwjX+ku
 hSpwUPOAVw3mGgO/n3GTy7DeYANyf1+EWyx0OJWP6hlPehbU+rWjPqqJkXtSRsePcKsjXinadAx
 2kUnXyFA19QcJO/MVrcnzusM7SwkiNNeIjZl0HMojgMtp+wuOJDhncjChJO9FacwFL/85fR5fa+
 p+w==
X-Received: by 2002:a17:907:6e87:b0:bd4:6da5:d5b2 with SMTP id
 a640c23a62f3a-bf3703794a5mr911572066b.1.1781021475982; Tue, 09 Jun 2026
 09:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-34-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:11:03 +0100
X-Gm-Features: AVVi8CcgL6vAWIBrUePYMYsaq1j7dH9KveOcBIv8dUe_FINXbQIAN6wMiZQJMEQ
Message-ID: <CAFEAcA-TX97Vqv7VWUi1UzSq+=+yMTG_c=UX5Mu-r7SO6pG8nA@mail.gmail.com>
Subject: Re: [PATCH v9 33/45] target/arm: Enable FEAT_FP8FMA, FEAT_SSVE_FP8FMA
 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Wed, 3 Jun 2026 at 04:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 2 ++
>  target/arm/tcg/cpu64.c        | 2 ++
>  docs/system/arm/emulation.rst | 2 ++
>  3 files changed, 6 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

