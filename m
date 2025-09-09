Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E5ACA0FED
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Sep 2025 13:22:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvyIg-0002Ea-Hb; Tue, 09 Sep 2025 09:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uvyIe-0002EB-8j
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 09:22:20 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uvyIb-0006ht-JV
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 09:22:19 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso9545032a12.0
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757424132; x=1758028932; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4TYaLpbJWh8rhq9OPhSimGa7FvXK7jqaJQsRgzRiYZU=;
 b=y/WOmvnM0ubMYCmLm6F/WIyxHDYZXekR/GVBUIbC0tiZIcQtzLCFZy6EV1EIvVJjzW
 ExfBzemrWq0/N98MxL2XCexOCT6eKJAbVdORmkhhE+ndyOiGMa7wcohi50vrh0WmEdnz
 CxSmG1BzwZe8P70GGth9tK84igwOzZwhwZHyxaLHzSbHwdy5800Fzn/9jEsyOP6ojdu9
 lmK8zicI4CPj8vHC3OtzEjxSEBgEQBp3mklJFhek6IwD643M9VWCPt/kAIh2N2Bjh3UT
 d7CRYaoWpGIamuO00H3+qrVYOluq2iGWAS8qNs7tjQ2hM+vOQ5IM80GrOBU1PqPVX8Rh
 ElRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757424132; x=1758028932;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4TYaLpbJWh8rhq9OPhSimGa7FvXK7jqaJQsRgzRiYZU=;
 b=hMKxbMLVRfhqSTFY/khInQVm/aihRgm8rUUdKN5tw/ozxL1vwtI+50U/0PpQdSsyZD
 hrHswvRh3p6uCQf0Hk2nwCWmH+SDz5rFVf+iZMxapcyDTt55vxBF7JduAnRT1EZAavRd
 9Zltpr3fGc4K8wpo0ZWW6IJfziPFuVy+IaD2bL3ctrvUrGr0LTNRIWHAgm08TYmrOz6M
 6ZM8bMzFH1BnYqkrZn+Miv2uz42DCmigPkrES+BHhdXRfPmtjf+/jcyvOCzZ5e9f7Mk3
 AtMxnPLEgmLb/XAfOMu+c2UfiwwNbQZph+dk46I9FCK8gycXHGEJqL3Cd9dMpuhj5kE9
 XLww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtYBsgQSJOkgp/dEEsqAfp6PEzqfkt9mTw14x0Lo9SmZEc3fSpKvkQ0M/RwRspwtmiORSEyZqVJA==@nongnu.org
X-Gm-Message-State: AOJu0YwhoGtC/nuYJIMFOFcOaNud6srs545gHePKXQp+8/SGQtQP+Q91
 wy82W1rUAHf0/QdL8wcp0GSY44PqAywwVPO3xTgQ2jBeeeRVYKuHjAJyVUCbjtrqzBMXAk8bSg8
 4FWEyNR7kIVkqCLqZ8ZWeLdFiv9YxCqDlggR6DhAH1Y919xxujP4b
X-Gm-Gg: ASbGnctMEPWqLoktEpgKWZkDvCGZZ/K6/9XtcEppBly/9Co0KH6QUxO97q2sydjYm8e
 1/0IjyUwEMpzxMVTu8vWHOH5sAP0renHQhi+C1yDIFUjOVStI3Fq3pgFOpYOnCKcjbY+uLT0KJl
 08Cml9CtjzQ9rPd6DUWmv0MeIvtB/T+wf+f6Z+W7PfSb2TpXniqez1J08ylwntmPJDf76zdB9od
 rSQeWOJ
X-Google-Smtp-Source: AGHT+IHk6xFRFA5GEOfQEfBPpUSoyyYfEnkrnzZlQXQMFL9MTsUnreLnBbuktp33tbQFqZjgyCgmd49DqWBHaCuxbhs=
X-Received: by 2002:a05:6402:4557:b0:61d:3dad:228d with SMTP id
 4fb4d7f45d1cf-6237c235cd0mr9892184a12.13.1757424131614; Tue, 09 Sep 2025
 06:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250830054128.448363-1-richard.henderson@linaro.org>
 <20250830054128.448363-54-richard.henderson@linaro.org>
In-Reply-To: <20250830054128.448363-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Sep 2025 14:21:58 +0100
X-Gm-Features: AS18NWDoZ9Fv7-Ue2UU1ea_fC1MPRE_92x3kfdm6hZAv478OloazzvhbYYyfP1s
Message-ID: <CAFEAcA9QKunkHRKSHMmqdrT-_amq4JpeOnjUakjjxrQP5edtEQ@mail.gmail.com>
Subject: Re: [PATCH v4 53/84] target/arm: Split {arm,core}_user_mem_index
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Sat, 30 Aug 2025 at 17:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Separate current to unpriv and arm to core mmu conversions
> into two separate functions.
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 8c73f54e9a..ca1633540f 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -93,7 +93,7 @@ void a64_translate_init(void)
>  }
>
>  /*
> - * Return the core mmu_idx to use for A64 load/store insns which
> + * Return the full arm mmu_idx to use for A64 load/store insns which
>   * have a "unprivileged load/store" variant. Those insns access
>   * EL0 if executed from an EL which has control over EL0 (usually
>   * EL1) but behave like normal loads and stores if executed from
> @@ -103,7 +103,7 @@ void a64_translate_init(void)
>   *           normal encoding (in which case we will return the same
>   *           thing as get_mem_index().
>   */
> -static int get_a64_user_mem_index(DisasContext *s, bool unpriv)
> +static ARMMMUIdx arm_user_mem_index(DisasContext *s, bool unpriv)

This function is named get_a64_user_mem_index() to indicate
that it's the A64 logic, compared to get_a32_user_mem_index()
in translate.c for the A32 logic. It seems a shame to lose
the parallelism in the naming.

-- PMM

