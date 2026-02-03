Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09FAE83040
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 03:22:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn705-0000rS-DV; Mon, 02 Feb 2026 22:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn701-0000qY-TG
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 22:22:46 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn700-0001z2-70
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 22:22:45 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8220bd582ddso2985173b3a.2
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 19:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770088963; x=1770693763; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7tEujU2jd2apFY7pqHGMuuQHSmW7OYpmY+BZ1+J4E8g=;
 b=krNpmps18agDeh20v3NWaPTUbq/9zXorQPuBGt2DKWf/nn7hjkA17ZKrWS9y+zaaLJ
 6TQc0MVYj4mhKZ3W9i4Z+gnKTiZcAnqykyulbtGNF33uxZMuIEQYdUl95ZkfHQQQwxA4
 Zpq96kS1SllO+yH6mDEL5CmBN+fj5jqaJ2BLS0NQoQi9N1JMNkEJ0ZFIiUpMue0h1964
 +mQkC9esneL6PKfoNzhLAQRYigox9kuJdbJH2FxKzLH1xmtFy054a1WDynByTUukePrW
 uiKtcdr4eJCdKyDTJ7su5xQ1SUboOW1coiD1Ghf4W8tZRaCx5O1ymR7arRL1oI9U8kz1
 a4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770088963; x=1770693763;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7tEujU2jd2apFY7pqHGMuuQHSmW7OYpmY+BZ1+J4E8g=;
 b=q3S4QJiSKutNK9ouLWD6E9BzjQkjNoBC3cW1+MLUqKZO+xysiPzRZBURd07dWJufTY
 ZF1b5BBmnr40oLKm8n2KtQ9aWQQUKkVRkndnFtvrBTR2brpzYm8clJabc9dgyxZ3ReB7
 zzqCRITFxScdud72JFhct2MMpL3Fc9Lej514uGrvWEWOnQ/kif9sRx820wEvweSe4Xiy
 HzwtA+tpr4BPtkh5KPgJbTXFgfGYSkSoxElCKBgKfmhClTWccnegGMnWsYPj/oN5HnyX
 WHN4ANmuZNpJHG0VwqqK07eTQDj5MgaPi52wFBkFlbaHhVObhGziNP+9pzKQoyetVcPg
 hauA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+CaLU4LBS8eXAsAhVj8ASD1vPDljcoi1hLLMaPOtCa1XLJ0R2mjf1WpGN1V8CmjNaZhp0seXdNA==@nongnu.org
X-Gm-Message-State: AOJu0Yx4W+2M23Hmyt/xWUgIZ892coOazkNArI1t0GnbVmp5dRSIYZ6o
 H7chw7bVIQQy5yEJyAST2EvshBlw7jznp/8dflGQ0IdUhrzT4mZdoRyKDq3qwHiIvdtrdscU6E5
 NV9h54piuQg==
X-Gm-Gg: AZuq6aIx70I7Y28f/v9aX+hKJPPF2bot2P89PKVUNETWa6GQKEzvCvqjL5aa/c+7evw
 XTFAnNa+6/BtcE6HrxfR/pGO+wtmJsv54ETFnaOtmd9fQJh/y55Nbsn/tOiCTULYdOBvwFAsvQp
 mHD+21Uc82b/k8wlFJbUZSRJiH5vVFr8ajwWZwq4lB84GKstU2k/MPgT8YVDv8dhMgJ64AFTzSu
 c7KiWIGM62pBMHgiT2I4P3ZTddZg+Sh05ojk1EpYsypNpJPDLB1AXQzRiPrI6GisqaC6+8S5DPb
 hxeJxggHfcoTVLeZ9odaYFLYX6XHv+QzRH3AdyWFL86/u3vePNPtAhGNh6oOheofpxVer5/5h70
 lXCeY+PGnq3AplW9goGph7XqS46FbN/d2o5sIvD5hrzwRYPQe7oCW+7PDet4PJcECUqX7+lTaUh
 S3NTquHsuNAq0Y8QbemE+Oj/+2sJx6wKQvBsVrhPaTQ1SXfciOKmdh9ORhcLk7ISZcHcEweevX
X-Received: by 2002:a05:6a00:3688:b0:81f:17b:c70f with SMTP id
 d2e1a72fcca58-823aa6ea514mr13425740b3a.29.1770088962311; 
 Mon, 02 Feb 2026 19:22:42 -0800 (PST)
Received: from ?IPV6:2401:d002:dc0f:2100:1047:c02f:591b:6a5c?
 ([2401:d002:dc0f:2100:1047:c02f:591b:6a5c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c24083sm17106430b3a.55.2026.02.02.19.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 19:22:41 -0800 (PST)
Message-ID: <a84842b6-32aa-48e8-9ea9-9220b98de561@linaro.org>
Date: Tue, 3 Feb 2026 13:22:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] target/arm: Don't squash all ID_AA64ZFR0_EL1
 fields for non-SVE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260202133353.2231685-14-peter.maydell@linaro.org>
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
> The ID register ID_AA64ZFR0_EL1's fields are not all for SVE
> exclusive features; some are also used to describe SME on an
> SME-only CPU:
> 
> SVE-only fields:
>   * F64MM, F32MM, F16MM, SM4, B16B16, SVEVer
> 
> Fields used for SVE and SME (in some cases there is also a
> field for SME in ID_AA64SMFR0_EL1, but it is just a "present
> or absent" single bit flag and the ZFR0 field then tells you
> what level of support is present):
>   * I8MM, SHA3, BF16, BitPerm, EltPerm, AES
> 
> Currently we zero the whole ID_AA64ZFR0_EL1 register in
> arm_cpu_sve_finalize() if SVE is not present, which wipes also the
> fields we need for SME.  Only clear the fields which are SVE-specific
> here, and clear the rest in arm_cpu_sme_finalize() if we
> have neither SME nor SVE.
> 
> This requires us to update our ID_AA64ZFR0 field definitions
> to match the rev M.a.a Arm ARM, as the F16MM SVE-only field
> is not one we had a definition for previously.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h |  2 ++
>   target/arm/cpu64.c        | 16 ++++++++++++++--
>   2 files changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

