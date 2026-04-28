Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F6BFF885D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 09:46:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHf1P-00012X-Vw; Tue, 28 Apr 2026 05:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHf1O-00011X-IT
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 05:46:26 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHf1N-0004dx-6k
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 05:46:26 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-651cfaa21e6so9690277d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 02:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777369584; cv=none;
 d=google.com; s=arc-20240605;
 b=lyg8jO67AvNGFF1oh+35M8sC7v5DPwyqOPmr/Sf7sY0R3XANd9HG1KwwV8n1ChKe4W
 AYOK9rJpyWybPPvlwLEVMLANa4ugwM1cdDzIIyizlaESgc2JYbYFUNkuk0FA+J6AXCYS
 9yOu8DhU5fFH2WKJgAOj/DzLKaIILgOS4iB8Dcqx33QNfhHiiasvUF1pQPaRok+JbLCh
 SGp0wxXwk6GvuOUsyCfXJ3tHxVxx40yYcq4zG7VTdHlfPVh7R/TtIqhcWF1HPKbO4HTi
 gbPTQxKPdmj2M9+w3h60BOcrWpSs57w/IB5SQ6Ih3WneEtt7HvJU7nj3KgdNhxXmZNeB
 +f8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KnOTyoBONZL5lUhxgLh9D6qE6LWii5d0WK1ENz5fK6w=;
 fh=rwIb3RAEmhT6+4RaD7PSTfd136qSvKnBrsCW9M+27Ks=;
 b=kvolBj/GSQlLs+DZ+f5kmLxuthijeRKD58m3arKuyZWPU4p0SvUpVscegaXjoyy0h+
 AjwmsLfTHVdX27FqmVsorF/969yqzRPME6FDid5YKOjIwOVVL53sSJyjrL0Wz8ui5/Wu
 ZQsiNDF4w1M6VJQQSLJZIszi0tsOXrtAXjZHnsHSo1wmRLA+H4FIHvO2zPzJpCehZSeF
 XCnImpZ9IHu2jsPKpOSTuot7cv8Dsbf/KsbRrrk07qOD3NcIGFnsQkYt77i6TE+m0wA0
 Y5vu9N2MNKu+j2Atw6sG1Ljj8LOy5DBf+9pkTjRdOIEOZjTP0qe48yPaGX2UarzKL8q1
 GtOA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777369584; x=1777974384; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KnOTyoBONZL5lUhxgLh9D6qE6LWii5d0WK1ENz5fK6w=;
 b=PDxo7T4ZvJ1I1d8yg9i/oswde+NIVjkqjGiF5zorI4hY3IF7b9aYwIZM8Eqy8QgDFQ
 Cm4xTxdC0ShflmDEI3rn0ykqGooYZUCeAya/5NXdFBASbTqRqNiGbXX0i6at6hxXSh+B
 DhWhcKU5KShE1sV6I3XzZxYe1XWvVVko9TR/5M7kzBzKP91kXDVtR+tVeXSO9saW+uYB
 OxOj8xup25/Wm4ft4ga41jmn6CFOV3Lbmy02INdXNDNorbt00hjHxyE7UCsQWz8j0nQ9
 BbBr9O8JKLn4UiPHQbKs6UlAYsUPQbW6WjB/NlDQYB9EFjYNpVigteXNDVlPUzYkWoZA
 /PSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777369584; x=1777974384;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnOTyoBONZL5lUhxgLh9D6qE6LWii5d0WK1ENz5fK6w=;
 b=jnMakF9xTMawH2jfJsOI7+NWxfbtC/YBU+jLiLFk/mSQgRoLu2xOwHwq4FvHX5JnMH
 rNjCe5ePTIv50q/aBKWtwV4wpY47MDw7DOgzFd8aSD/zh+WNVp37YximAT/kH5UtnPGq
 qXWpwLTSBYkAWEtM7J+7uGfqZuU6x+P4eGed8Pfhfe3410/lwnr+rc1guazpQNSCqZ8k
 PU7YxtkWLykDMFWc/XhviOuKuA8ugQUKSf5fkiFpR8+Pr/No0Zio0jNKKa5Zq01SGjDA
 I6r0I+64ZCsQaFC2cKgmZvNii3loT1KFF+fnMYRbQLKQRlO/o+smR+OmJraTzVQgN4MH
 gZrw==
X-Forwarded-Encrypted: i=1;
 AFNElJ977Bj+o1wY6WMg0hkYxPL70r0w4KmdfmYl+LTjBAnjqewGcy9C2tbNxgrTLQNuA426222rdmFouA==@nongnu.org
X-Gm-Message-State: AOJu0YwP6efYqyK2OoFGRxwNG+BEsy2YkOAT3zhkDZSGhS+qeNxLfJqd
 QXsHtPl4l+/LlEcj2z0MzlYg7WgVPqjqM6t4H6OTISMlj/RIi6WVI3EzGsfMWJoUKZ2594+M6l0
 ViBR76pwctUgGux039fFbPtiSEutPIsjNHQOyvqlohg==
X-Gm-Gg: AeBDievx0JhgqhEHdWKw3DMMug3DWznc6IRXyiGTivxGTXWPVFgxOlgoQkUXgZMyelU
 qjk3IJUrCtTMMWC2hk7nOgnWLvUS5aKTDmzcFAexoQht9Wv8IN3aMrQtnsDs69AcXh0DZPVCdEL
 D9Q29yXXPjHHPJ2XLZZqVAnVfDzgdlmN85Rt+lb6FGAx6QcfiMu3tsYNEeJUM6LhU7yK47I/I4M
 geQOQWXO2Rv+OPbPt4JfvzgQWY6Fpuo9i4UHDWLx8bnTIsGsd1UIKTlxqC4fsWOfnZTMAm15x+b
 iqWM/Lhn0GB9FqKmM9+p/3/O3tCfvyGyYV+8dE9fmL2Hb/+NkBKrDyCBUzV+kBodcIilrFMyr+c
 nRg==
X-Received: by 2002:a05:690e:b89:b0:654:99fd:4a1e with SMTP id
 956f58d0204a3-65bee6e075bmr1723676d50.5.1777369583702; Tue, 28 Apr 2026
 02:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-2-shentey@gmail.com>
In-Reply-To: <20260308203516.160103-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Apr 2026 10:46:11 +0100
X-Gm-Features: AVHnY4Lp4-tZHtm8EalkPK5wy_ymIxgoTBUzDEEHaaA0m03tg5Dofjowu1o-E5U
Message-ID: <CAFEAcA_o9_j05GmXT79TF2z_BqwxmTWeqaaapUOv+E4=P-hh-Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/arm/fsl-imx8mp: Do not create redundant
 unimplemented devices
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The GPT devices are implemented. No need to create redundant
> unimplemented devices.
>
> Fixes: f8b26121762c ("hw/arm/fsl-imx8mp: Implement general purpose
> timers")
> cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

