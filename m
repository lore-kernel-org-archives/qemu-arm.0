Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68ACC531FA
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 08:51:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnBcn-0002fv-K1; Fri, 24 Jul 2026 04:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wnBcl-0002fI-Kc
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 04:51:19 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wnBcj-0004yN-3V
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 04:51:18 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-6688acd1a51so116734d50.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 01:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784883075; cv=none;
 d=google.com; s=arc-20260327;
 b=C/XWRR5MYqrUcamjlTSrXobP2ivj1sYTI6IIrAruqDHrd15Yf4khok+9pNqbNa3WHi
 ab1UvvAF5pKYJdDm/rRbCBvSi1x53v7xcEMulgfG9m+PmejKh99DKCUeZMbGiq27bgMX
 R6tVKAit6EyuRHFGyNZLd9wIE42eclhg4X3Xg2fPPKedqYZMSi+FVa1GEmYV4tvyrmAG
 yPs/SHHxV1vIAxuBTG2l3+ofjFTMPGFKYrHa5orGL/JaYcWa2TnOtLMEBm+GENXG2Gvq
 ClG7SDH0/lFUU3iXNMHazcqKGDzITH7ZE6bykoGNnlyTjcfYV1/h964QOvnxpC7k416J
 ez9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=83DBOW8oqGPBXm4HlQaeqeZrwMM6Oa9NcxRXyxiT6dg=;
 fh=cgNZB7SsXdOxk0qZpiKIOx8xcsh2meNnT5YBKJty8+w=;
 b=ExxwxuT1GCw0U9saclj9MB8oqY3s8wlyPk5eShcgoq0sM+a2pReA72qn9p/bD6WJlz
 ZI3YscDnQNsMnhmybJb578qgYRi9C/dTfBZEPULYEE/++Pj8ha2toRaHFNSG77oNcWKb
 XT+Mc3ti8Pi92xqI0LyscfUhebegOIQOyE2R2eOWdDm9jGhK6U7ZhJamjQhP+pE3LLGD
 gtJ+pg3igdPnllqq1gE9RSMDmOWPUQBQkA1Wi/SHDGGhWNqdxI4JBZpMy7LA8BdR1rhc
 hucZguEjIYkxmeQTNJzCr6M5Il85VF+JXCn7zcd99y2L87uyUXlxeQrkpnl3tcmGYRmy
 xciA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784883075; x=1785487875; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=83DBOW8oqGPBXm4HlQaeqeZrwMM6Oa9NcxRXyxiT6dg=;
 b=EKt1ppgFmsdU8czLtVcvZBeZ+Nhcef+c1NUxNHM8kT3QAftV+AoU46tRz2YFNEJhZk
 juKQntTdynTreIdlftR8A0r5LeJSjjZ4BVq5VUQJJzbKjc2Qxix9SRNJzLbsPCKGOPqK
 ci+I/Dz4fQMDxulHHwnKY7tRl6vY58XrEiY8JCbq9TxdIAxJWL6cHjsRRanN4lZ4FAMQ
 T7b6n2gMERUdDClkQeWqxIXCGxmnrg/NWGURtBzLgJ/9T4OhThfR1WD9GK+xNWOfqiZR
 dICH+SPwWALNviJe050VPzZvizQGrZuOBD6OBuzTIpGMPA9p/qMCmsRaXiEMP+LPYnFW
 8P4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784883075; x=1785487875;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=83DBOW8oqGPBXm4HlQaeqeZrwMM6Oa9NcxRXyxiT6dg=;
 b=bWXRKyFWua2C/Xjkyta+M22FJEY9YEt2JMnPggZQGF581rK/MBDiI0GIrZFHPq+waI
 p+wXd2iax3KfDkyBWTGL4oAbP+9Ll22hIi+tXUoJtm0PHf/jL6SVCRd0ZkCI7PlsNBEs
 z49Y8qR3dGp5y6kpUmkKt0nCdPvr2jlbMSeRB1Q5I44Z6Xq4DWU5N6nqascncc9lTlWr
 T53xTiJ2lAQjqBUteCTy0dZjo5ea6ZRyDmcSPJA3Pe/9WWW1k1AKNwGKHijXGCwcSiJc
 OvgGjmirSIbnSsfDG3VUgxI92thRDF1cei2OMeZi97oy7HuYmWIUJIfevl6yp2rQIqJi
 gS1w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp5vl8hezFh1sQCcmoPpy52yNUfR1YYMhqrj+OZOUIwe5JqGtZ+jkCe5pBot++XIRNPkuIjX8hx5w==@nongnu.org
X-Gm-Message-State: AOJu0YxZfhtj+KNPorAXg2MBV9WuQwE/kIGpgkfao3+ZLq1Djf5AaQlT
 jH8KRapd1M3rZ/3Lipmt+S/AbNy4q8Wp7ubKG59Diuj+ipYZqogpT6ANyy9tcfrC76xAuF7F5pm
 8EJ7hIldDE+mjzYDj5xTwQzU00RYtM6qsMonpfN0RTA==
X-Gm-Gg: AR+sD10buAZHV8oVOLNSf9GkQ5UiNmZBPf+4KG7wNor8V0HTonQReZ7jqcB3FepDLp9
 6o+ihbA+OGBot1MD0vfBpILpy0Oa1A9C6ZvA6lO8o6KB1FtRn3gB/3nEBn1i2s+xNsrQLBMLOjI
 grfHuT/xLJQkLlmYJYfRxZ4U52Rj3HASWzXGqMM/zdJWj6++SmLVUTeD9fyzZdNAU/9KMmPB9LI
 CnC8mmvNmRowRK6icQ4Dt1R7b6Dmj41FFAxFYZ8Y08HGIZltrWEJPTn759n3I7rEO5O8Jx3vmET
 Ra67010gmFp951mjwEbAUsdW0Gtv2m1JtwNnnessQ0DVtZgxzbvUHxy9
X-Received: by 2002:a05:690e:2504:10b0:667:f20a:4cc8 with SMTP id
 956f58d0204a3-668a4fa438fmr1410038d50.51.1784883075505; Fri, 24 Jul 2026
 01:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260723233605.805-1-simonxhy0404@gmail.com>
 <20260723233605.805-2-simonxhy0404@gmail.com>
In-Reply-To: <20260723233605.805-2-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jul 2026 09:51:04 +0100
X-Gm-Features: AUfX_myKoo3QaeYZUQ_jABz2gDQLLlgmCQErJTkBCf0s2CX3tFqr9yU4rGlaXGs
Message-ID: <CAFEAcA_Ybrqb0g-cZYf6yL2eHRUZ6PfeWQMiVrVVeFJFp3q8KA@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm/tcg/cpu-v7m.c: add cortex-m85 model
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Fri, 24 Jul 2026 at 00:36, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add Arm Cortex-M85 CPU, modeld after the existing M55 CPU.
> The new M85 feature PACBTI is not implemented in QEMU and the midr value
> is based off the r1p1 product revision identifier.

The major reason IMHO to add a Cortex-M85 model would be to
have a CPU that supports M-profile PACBTI, so wouldn't
it be better to implement the feature first and then
add the CPU and the board model that uses it ?

thanks
-- PMM

