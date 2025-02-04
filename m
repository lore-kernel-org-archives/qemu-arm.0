Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp231764njb;
        Tue, 4 Feb 2025 06:07:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtPThyuX8kSYD/xrC7i7ncprnWgL+K0cQNkSnIeUglgxdTpO6u4yNvzpxupardH3NEnEEuuO6gWZWKbg==@linaro.org
X-Google-Smtp-Source: AGHT+IEQo+aEghUrftKCVa3RgytyrOpBi/eVc+52frJKiZraMjomoDQKRUlphvuc2sABnRoKWvJg
X-Received: by 2002:a05:6214:1d01:b0:6d8:9dad:e14b with SMTP id 6a1803df08f44-6e243bbc197mr399215326d6.13.1738678073638;
        Tue, 04 Feb 2025 06:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738678073; cv=none;
        d=google.com; s=arc-20240605;
        b=ZjUPXx1RZ4d6tufcHe23kl1oK9YyU8b0ZzoDrFXtOfSUGbO3AGCp3P58+pwPWNfsyX
         py3WAACiCodvLWYcpRmJS/JWvCkxkcR6ChNvlrRMVS8/OUOrFzPhk8qlWarkCzrVl7Y7
         xePfVtCUaw9n0knS4R92R/R2qValqHF7XEVyB0xf4kSpv+V1PBHPnP/7IowqFDnovkHx
         TpTAov1ZYZ0kquPACXqrbyTCjwp0KsYgrEZaqXj55/XqmYE3Z0Miha7GKnd2oxSMHub3
         jybC7rNIUlnwcl8u9/rmSma5gDd7nvO4bU2XI9L5tYKgjTMsKPGnNw2iUIJfVhkiLMb7
         Q74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JE0Wn+b0huPhD/K1pOO9dOg9txDWdNlboMoweuj7wMA=;
        fh=/Mq2VRZXJEBFZXwFo+Ub8gWC8rx94j4OIRt7WxbP2wE=;
        b=SNv23u2H/Zm6LCdhENRqPqUF+GUQnx8DKN65GgBwFJjqaOuor3EZP0qQwqu7y8YxLi
         1Tvi8zchlFRHgkdEZaBVFAvUsF5ZCdzVtsEzjZlb9SSbLY46fyQucMSFIsa/cEVgE1Q/
         nfefHKfSH+L4WcdAdkUy6UKx5VGQVTp4oN9g3m65T3E/j9BjIm9mxNJNuqDgmwRbwIyS
         44LmN3TlqXT4ZlGkhKUAt8QcULYpWCXOdt9hfJGQA4UehwCEQe3JhfKdjc+CW0qOMmU7
         OY5MDkUr3T1BI+4cvjMwA/d6H9TRSF4iCdeOAp5LCf1me0qF+KHcSQ1ksYpZyyMP/yk7
         bAAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v5FR1m/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e42b7db5fasi7161226d6.483.2025.02.04.06.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 06:07:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v5FR1m/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfJab-000847-Ks; Tue, 04 Feb 2025 09:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfJaW-00083N-VJ
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 09:07:41 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfJaV-0001y5-BV
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 09:07:40 -0500
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e3c8ae3a3b2so5031488276.0
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 06:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738678057; x=1739282857; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JE0Wn+b0huPhD/K1pOO9dOg9txDWdNlboMoweuj7wMA=;
 b=v5FR1m/L2U9ALI4YEqW82iluF4omViF6UEMF3rX1yeX1b6gwtwtfHPOVZU0DXJMH9c
 1+MQHOL3CwkpIwp6UJX97sMnIC69TxJBzFowbrRwAsNTCi1CC7OXuJD1u8f0NeSZzkSC
 6xQF2CibV6rFgTC3xFRWDh90KKHveKesTLTHFfZPmswo3IQGyVYZpEnjxBFaJ873O/W0
 sgvqDmo26zfUE5JhKV9ETx+r3PxNxIflWOEKhWRRlUFs51eY5LTHCGMd8Pt/R6n2S/na
 aTExBVPR74S8xTGkouAUE8+2DN37wKIoeyCu1uRZbwjPgV7JBabPZjy5I2BHvOvEMhZp
 foBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738678057; x=1739282857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JE0Wn+b0huPhD/K1pOO9dOg9txDWdNlboMoweuj7wMA=;
 b=DB6Coa9+Dti3uiW3tntfFSSfqLN6NLdbpg+huiLFFFkXxUOrTMCpdUwhgDeu9abXL7
 6DirZlytZ1qD3dnYtg9KFedsVsZF4cTU9JmVRRh7T/Iqm45fbPipSuwYwhP2Z9mj3QmS
 5mRnldixlzYY4IBJ2WcFj8giK90aZ75OdPS7wARCKGOZ/eiMLRi7PtDpWN0EBVdE8jAJ
 NxwajN+Ozz3NAtwS7bagzN0AidqxA7ry6MxZ2n3zvenj52e0QdQhqh6EaUr6DfMiFl3r
 +KzVEYtLuGtaLIRd9g1oPVwHdGED4MjAGi8GudJT/c2vFMtTUxOX6SxtODcy4uaQNKK5
 7PwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpuOWQWElrRPoK3DFZJIdGIbUg/kbuWOnjAmIiB69SVlRQ9FlOGoM8V1PUPaVNIe+liztyemxn5Q==@nongnu.org
X-Gm-Message-State: AOJu0YzRrcVQX5V72DC7ZQbugsArbARGj4QkgpWDr1nk7rkgBkjejowY
 MtpAbwb5Zg3dSFeMUdUaLdcBPNxWo0/S/XytprXctCZxe4KPFxQcJ8aBeJFBkV92FKQgZtLZTww
 1Wta+qy3k9U3gwdv3JsHwmaNXIdnu1op1dchGBQ==
X-Gm-Gg: ASbGnctyzwVb+CP9O4q8ERnEq8ZkwFUyNWyBW9vR0n3zMGCOJRd2fQHOzEWw1JNpNni
 VDiGUzG70VCWgBtXv61y8Aq9IHEbvR+g1Qocw6GALM3qHC0p5Apz9WLO11jEx7gjuAnYKZgFEBQ
 ==
X-Received: by 2002:a05:6902:10c5:b0:e57:d3c8:554b with SMTP id
 3f1490d57ef6-e58a4b04b29mr17947254276.22.1738678057462; Tue, 04 Feb 2025
 06:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20250130182441.40480-1-philmd@linaro.org>
 <20250130182441.40480-5-philmd@linaro.org>
In-Reply-To: <20250130182441.40480-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 14:07:24 +0000
X-Gm-Features: AWEUYZmvWhE2HyoYtu28_vp3DDTXE0z5RtFAFhMScPZGifWSlleIvq0uzHPBgHI
Message-ID: <CAFEAcA-Q2djC-64tw=0Xu7bX6Uew8zB2nBA+fdKm3jFEkYERwQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] hw/arm/xilinx_zynq: Replace IRQ_OFFSET -> GIC_INTERNAL
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hvlEaljDOkkO

On Thu, 30 Jan 2025 at 18:26, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> We already have a definition to distinct GIC internal
> IRQs versus external ones, use it. No logical changes.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/xilinx_zynq.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
