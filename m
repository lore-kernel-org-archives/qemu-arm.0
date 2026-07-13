Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8312C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 08:51:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjCNf-0001ve-40; Mon, 13 Jul 2026 04:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjCNe-0001uj-8x
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:51:14 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjCNc-00042o-Ra
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:51:13 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-664dd23829eso2475163d50.3
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 01:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783932672; cv=none;
 d=google.com; s=arc-20260327;
 b=aatRg9/ZSGOMU2QTgvXowSHVQm7FSie1Sp3ucx672SrIpgUfpVhT0eHk14cz+fyxqz
 dbWRHZQR4rd3PB/R2JdNecUJUfvQugvqCOTEaWw5f8YV6u7ZvggY2v9edkl36RBPXAB7
 SFjx20qgJqTTDGhwkl1Srhmn6lhBfZLRfBekRRxRvUpXggkyDTVyAuHvGIVSiPBVGEMQ
 V2XINoc3KiZmgzZTiTL0QoyNVVP/M+a7MDxJfE9JBxWgykHjMjj1l7dmXt/AqDHXZOWB
 bpK8sWq94DUIVpZeX0AjxMxdUhc6fsdcusDGyJkjpDscMS8XUMX9O8JcWM/gEad3aKkS
 croA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=sQlT3EamjD68u+9QT9LalK+PZcnYjXGD0CPM12MbDeE=;
 fh=Bt3143oA6COQ6nXXs7yw0H31LFMPzVqZz6nttuEh2mc=;
 b=pueh43xKhs2QhYjucI1rnutL23Sx1v4Xxm2qVfoxSKj0Ci8Lv9ltLfTF4PhHK1egA4
 LXeZnfxeO84CVe8kXsqGYfuJoDSQjV5Qky7dHSslkiWHqMJ3VhZAq/CoJpleYgEsqpBE
 r+dVN2tqSjDuaq5vFIItK1RcnyqKawDcnZiSQGi7YLVY4IWPAuuE8IoZA6RVA8UfWqo6
 TcX2xJyrGLa3OEDDMS2tbJixH4Q7YGJxWOHrvf5dfcbcEHjmyzkz08irJsPyUXVQRoiR
 mN0S+MI4KkaszOU3LF9tZKf2rJPdaQdPMVnOBAmkGdqEIDgJUXtM1hQVANDs9WwwdeTl
 LdgQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783932672; x=1784537472; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=sQlT3EamjD68u+9QT9LalK+PZcnYjXGD0CPM12MbDeE=;
 b=jw6drx4Ut7OkHFbkMQ4tCgbJgVtmz5qh2zfrQypUlIXyFXmI3vcojs6ISYNUi97d7R
 g1mvXMrBjBiFH3q3xWKlH+9bPcMoe1Y8iQ6GF4vIicEK/LDGA5eFU30K6R8Dh8KiskTA
 erY1z2tu3qlBCsrvZ3Y4/PB20mapkJyKOmfDvDCUI4jK1b8i+9Y/d9Og4HcFkc2CZGsG
 kLESIfkVkjK+GcEufOlsHTD4Bj3ss0pakzrasgFA2W4Nd5v+5v0SRQvT/SqyvMfG9zHj
 kpe7fVr59L6aPuL+xpuI8jkBkVnb2LTBOVo0l7YW8xqmvToS+etRbutQUKA+8rdsLkQt
 ZC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783932672; x=1784537472;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=sQlT3EamjD68u+9QT9LalK+PZcnYjXGD0CPM12MbDeE=;
 b=rHuCZpFemFK1QUXpy/CthMIAWQlxahRVVPyKLH3dRNqTLtcUVqDNu104Ke0QZ98mKD
 8jawo5dNnftUjkfdx8g/veAYPr2dhfoKzywNi/HY+5Ry88BgEnbRY3+1q6GJlb/aM3Te
 RSZtcJ/kT95SCCDp4BWwJH6nkXKk6llfZd4gtdVgNgZAP6WkYh0n17Ru/tkLNCQkFrO5
 nXMWN+jgX0MySg8Kt+59JzomPVurMuQWqpi7/gYVWzFogfsfmtMBsjPBXrvRtgaoTEfV
 2dCVGJkQb24Jaf693lItk2ZRttDQIDiINpCVasjnSIyCcLVXHKH8d0tT6lE/3DYReXB6
 9+JQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ros5rZ0jWUWSj0R1u34OTHU9gva4rpqQnjm8Gq3p1wZcnywoIq/uzW31mXS1dFtGmWjSsG0INlEgA==@nongnu.org
X-Gm-Message-State: AOJu0YwLchUf4pNSeeLDtw2el+O2sAhbU0MNrDjZ8oecEaOKuhyvzblK
 BjNo25W3HeCFhDJ7m8A4oCnKn3XmLKLzbVDW9foopEXOj39Ul3dzNjfjC8ROa61uBz1rIdmsuJm
 H5UVFxMPiTt9bRj/le0/jq89tZfZiZVTUxWkW+9sM8w==
X-Gm-Gg: AfdE7ck04PUyVz24D+7rfPppZzHP2cnhawQ1pAon/+ptOhdfsWppF+idsxEvrsq0X4Z
 xO0F/YxN/Su4ZUr4VMaKD+pbfOMvXxf6Psjwcmt9znLA/t5ORyNKn7AY7ejIEC2tDwq4P4cuUbz
 zKIwPIJuYHb4FFl0uB9qLnH3x/KJckhb2Hb3MXvC+mQohj0nwIRNrC+6BULk6D0vHjsxAvpqYjW
 h1NYld8Uu5vKTs1sxyJVFEXgukRfOWByeg02br6hN0ZaAP8wvALVWCdQIOTLdqk06jt5oJb0JOc
 09ceWhaQON1OlaHGdx4qMReshd3cCCqvagvZxxT+xrkmRp69FgW+YTxq
X-Received: by 2002:a05:690e:1446:b0:667:e2e1:44 with SMTP id
 956f58d0204a3-667e2e130c1mr4071305d50.22.1783932671687; Mon, 13 Jul 2026
 01:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260710175818.528974-1-richard.henderson@linaro.org>
In-Reply-To: <20260710175818.528974-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2026 09:51:00 +0100
X-Gm-Features: AVVi8CcaXN8HVh-MZrReoWelY0YIbYhcOFtn-wGy6WzjjhZqQBWYtscYwM08W8g
Message-ID: <CAFEAcA_er-_1VAmokZWygtFAwJbiHRiJ3rrRdF94tV4hQwBB+A@mail.gmail.com>
Subject: Re: [PATCH for-11.1] target/arm: Be more defensive for invalid
 tlbi_aa64_get_range
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Fri, 10 Jul 2026 at 18:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> It's possible to program TCR_ELx with an invalid granule size,
> which could match passing an invalid granule size to TLBI RVA,
> which would then fall through to assert in arm_granule_bits.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 3c003f7029e ("target/arm: Use ARMGranuleSize in ARMVAParameters")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM

