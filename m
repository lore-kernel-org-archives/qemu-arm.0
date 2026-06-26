Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86899CDE008
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 09:34:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd2wP-0003n9-Pt; Fri, 26 Jun 2026 05:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2wO-0003mp-7d
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:33:40 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2wM-0001uW-OL
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:33:39 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-6611689dc10so889644d50.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 02:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782466417; cv=none;
 d=google.com; s=arc-20260327;
 b=BAFJpI/Nemns7OA8Xbv8rmp8IcL/v2YDXzmZqjMeGjDUsCZo5mdweN3uWLVEZDrICW
 XqVJV5w0rXvKA+xTKHDb4YucgXG0thxDMuPoy9VyWPyu5WhiwMbBTStSo2GlWPqAfYxl
 PPgeWwKp0QNoFfEdx5nxckyaaR9/4YaxoTuhCzaGAYNnila9DHKDjeeIvfgKqlYyx87t
 4leNkKXoTTEHHdh70VOqtaPwc4z43Z85iJW8dHfAGKJbb5lwyOSwGZc0h4ArqEIKxKKv
 vWScexx+Q+Ss0TGF23serDT0j+pkDx+RhyA/qRqpAlR0gXx5w0C44damEqWPazlqk5TD
 ZD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+byf6u883ONY0gYqOfy0J0XXrdqQIC6C5SXphvAqWz0=;
 fh=BlzorwQ7wjQu6aqUC1EGk+soQOzmIRpckf81NDzLTKI=;
 b=JWI1V0h3axs8dz5umJ/ez3+5SoNf7UwnnoMln1eqzR2asZ8CkRlJgKP/MJTJfozfvK
 v1RZfPFAGJFKKYidGoZruqndG+NgnO9dn6b8rMn0bl+Rfxcj4PCPIa49dNKrZV+3pHgM
 +snAMx8qG3zWrZWxNqn+NY1ihL390tIjiL2c2HmA17g2ho2XXHXnTxliTjKmE62ksDvC
 o8H2R/cVNXoaPSRkejtN8fccOBGJEKPDwgjPXGUUBuOXf9+HecoSoxEoNwcJ+olrvSwK
 i6r++aR1ChV6tIGKxUotxMysaslhHU/aT0XNizbCXc6AqiquJjgoDJ/J9JlRBkXEzJx7
 W/rA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782466417; x=1783071217; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+byf6u883ONY0gYqOfy0J0XXrdqQIC6C5SXphvAqWz0=;
 b=hei5D2V/mSNY+Jl9fka638T4RcUtwr/7Co9xmgLk/AUONQIU4ld9mcUvOoNA6ejDSb
 EgdSdkYN2S+jV4XIhT1K5wJoL41d0GUJ5HC92ki/ur5fkfA3a/oeV/uQ/T38eqHHhZMR
 bWKfMTE/Y1Dkn9Bh3aGjT8VQQNcV/9BlOCPIBrZtPhNoYb6WCqZ+MnxOPsTyW96BDmi+
 e2Jwz7KS4CUjhxWS1RcuqSSZmglfigPBnqu2ZEZot9ZUv1TG+J68FeIfIWidFduy5bCo
 s4jRRGVHKDoJcWnABNMPRKGdaksB+hhO/rgLyhOBDpT24MmmWuARjDctw43dh2ZP9DGd
 RN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782466417; x=1783071217;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+byf6u883ONY0gYqOfy0J0XXrdqQIC6C5SXphvAqWz0=;
 b=A+eA8XEblf//pkQvKDhVpkRMcSsGXMrCS6oMNcWNP4ZwkVMsxY6SYIfEUMHq71ofwW
 ITLYvN4zQFOhrmFyB9Bcj/vkkeJwMYrzjsBLegvRdpm80i/adYRNuwamvX/N53Qcy1xB
 zBTSq10q9JLgIgVQhzBBBTDrMFKw0WmyjEU+wnElqb/mThoHbJb4jLJhweQVSCs9ZaSA
 hg3CSlrzr/PJkmHaCKVFe43yBhIVBhEEMBApUxmv4UyEiKIsUdYGb6lvYg3Rk+J3g4Xn
 Hu2994lF490pMY2ea5hXPrKbywEcQdyLNrqNtEAeGSzphqryjWKxZDZOekh1uDVZcRBR
 vizA==
X-Forwarded-Encrypted: i=1;
 AHgh+RojSgp+X87BpWYQVTfBWpQ9TQdggoSerVqauJNR0kbhBI8lxy+aQsXpqvT02UxutrCWQGg8VEf4Mg==@nongnu.org
X-Gm-Message-State: AOJu0Yw2fQ6oPY7ylu0CgrCQVVZlDaXiGgVXRgPxjJBCc6/w7XBsEnnO
 x9FUgqq7FuKmmzIzERtTRIK6cz5o5klnv/z5eBO+ZH3caI7TTnLDmV3qNSBltIqShvXTySbBDhL
 j9Dl8disfxkbE8aXxxaHK5f/JYfIPQwCY7THxSAy19Nq/id21z+It8o7qAtFU
X-Gm-Gg: AfdE7cmNQ1dcZKvKq8FXr+naVOFnKrJh72vT4MKiGhOIYoTaJU2u7YaVVOOAS6d5lKT
 0h1quBS6sHAxTfuHRYbQGgHpdg2hwX1exz/CSXMBYP6YkrRRLepsPNUkWFI5KSbalE4TDZdYqNu
 VgOhflfa487HgauRi8iDvVm3hin+xXoHN134CRL1mW8JdXS6+fG9E8Xwqpm4zeIfU720rYOxEmb
 Tn2Hqrr2u/osWGanbiUhcRCw+JUJpjRrhMJuSA0j6BE1BMflWVjZKKkYMcjKI5Hm/MiwicaXuKR
 Wy+mEpCW7lWu8t4U6txyTiSvxEJN2KdptT/ygfH4or2wY4gRqV7sz3dE
X-Received: by 2002:a05:690e:4810:b0:662:b4ae:f382 with SMTP id
 956f58d0204a3-66487ea7608mr3628207d50.61.1782466417205; Fri, 26 Jun 2026
 02:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
In-Reply-To: <20260625015159.719300-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 10:33:24 +0100
X-Gm-Features: AVVi8CcsmRKU4YkWZKfY-dNAxCtRUBrFbLyyvU0un9qjepoDUeF2K38Eln39AUc
Message-ID: <CAFEAcA9Kz4TxX5q59Kj7YRNPf+mpZ_hXfeCfVq2_wDwxeZz7gA@mail.gmail.com>
Subject: Re: [PATCH 00/10] target/arm: Implement FEAT_SME_F8F16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Thu, 25 Jun 2026 at 02:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Another minor feature working toward SME2.2.
>
> r~
>
> Richard Henderson (10):
>   target/arm: Enable FADD/FSUB (half-precision) with FEAT_SME_F8F16
>   target/arm: Rename SME FMLAL/FMLSL patterns
>   target/arm: Implement FMLAL (multiple, multiple and single, FP8 to
>     FP16)
>   target/arm: Implement FMLAL (multiple and indexed, FP8 to FP16)
>   target/arm: Implement FDOT (multiple, multiple and single, FP8 to
>     FP16)
>   target/arm: Implement DOT (multiple and indexed, FP8 to FP16)
>   target/arm: Implement FMOPA (widening, 2-way, FP8 to FP16)
>   target/arm: Rename FVDOT pattern
>   target/arm: Implement FVDOT (FP8 to FP16)
>   target/arm: Enable FEAT_SME_F8F16 for -cpu max

If you agree with my suggested tweaks for patches 1, 6, 9,
I can take this into target-arm.next and adjust it there.
The only one that isn't totally obvious is the patch 9 one.

-- PMM

