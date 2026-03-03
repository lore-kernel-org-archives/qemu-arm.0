Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF63EC0495
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:14:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxMl9-00030W-3P; Tue, 03 Mar 2026 05:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxMl7-00030F-RP
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:13:45 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxMl3-0005wQ-PG
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:13:45 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64aedd812baso4792276d50.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:13:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772532815; cv=none;
 d=google.com; s=arc-20240605;
 b=aaVO57iPdTvMsAQM9kzJ13MIMmDCvJMJUhoJIW2xndu7vvcBKGFNwUxny4SiZyLT1h
 ePX3dTiBHJsHEjMni45BnOAp6RQs3y7ZMIqpJn0C4hIM9BGXYXtQdXx7RrAIwTa6BW6V
 aqYkkbc183VLWnsmK6azCJ+x5ugrsyDQs9iCO3MOy8lv2gv1zQvCyRkzcyCg5kj2E8LH
 62hrqNMDQ9ra1QzW1XjzJaWoLl6nitoA3wvei8N+DQoUjyxpMY/Bu37bVGLuZ67J43qU
 pRjeGe8lW3/pZHDn/siwma/vhAuUpavHCu8L1yBUxJ9cCcLxpPJb86ckwa2FyqG3vCG0
 RqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=PAt/YTPKXaSvB81mXMyecr1xovNhVg3Nx2IXd1SSsKU=;
 fh=zeGYXz38yltqBnh7APwG5Shf3pQ8c3L+6NswUJIoInU=;
 b=hoP2GOjAfsTHACPYM8byLLglOjNxAc4AORhDOc1wh9DB8HuArCM+ln37Ny0guJm36o
 ePo4boYTOJiTJ1GFXkDFaMoi2o/mwWP9CzmSyR7Vx4tCz6LAtoD6LLIEZPkNblT8qjeZ
 fMWCZQljhJ9lztn0uDQuVi2sHdt1fmvRSN/NEJ6A5RXZCUjAO9kF83ksTygsQB/pDpLJ
 yHQNdfKJV8dvGHV5aCwU08ebxNUuEb5T/kqKak2CVsDZmv1B0fzxxipBGTs1VHatgpLr
 v5D0wB0CV9CWzMNtX5hZTmtacsvLhCtQVNhQ+7tETqI3Miiql6L1fGARwVJSoUeRSLuR
 pEkA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772532815; x=1773137615; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PAt/YTPKXaSvB81mXMyecr1xovNhVg3Nx2IXd1SSsKU=;
 b=GWJ1Rgw6dlk/H2q5XUYN68hGALyc6Q6cK4UV2NFBzEq7uKysfo8E7MjwKgnkc/kPUp
 /koS36YhmQ9NTKaq00oGQQS8thgQ2ZXUvI5FqNATba7PjsJj8o8gGDne4WAiPht0oS8P
 1cZkKpB4d+6odmhyimjB2Qrdp+oNSxTgvS72WZeoc1qYruWwnilX2G7AV+4Ven0DTEvV
 UToCMuTK/oVOmbd7Djrq5P+UdBx92vQNLH6O9YrurdP8xkmveH9Px9Lkd7ggeaULjplg
 7erdwtymWg7g3rfxKYi+uBaMlRRWWz5fepY/5KWMxlMP+Zs6bOyLpxESrZiJ76poecyP
 gWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772532815; x=1773137615;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PAt/YTPKXaSvB81mXMyecr1xovNhVg3Nx2IXd1SSsKU=;
 b=if3mObkVGGvDZf+gkeAKmvY7HcKf8D/dHzeUl+Q4VvfFemViNiZR/xPnOrFqjt+oc7
 grhUYy2tvAfd0DuX5+RW8ORTYHDeSs1W5yXseNBvVFwhJSBV0155YNQAcIGVxyTIbDmf
 +mcDq4FvqTWjStaY7urWCyt/eILVXJfkHiDhmXURdHA25NRW79OEcrbpm2UW/80t4Jcf
 HCKd52LhknoUlzZdHDJBt5ozgm4tdyrgvAcR8KNqIFu9Q2GSz6dJ+jrwQGeEj/0ZgCRr
 Al8bD3pV48TvfLmRAPAx2tRTYbPbuhiTWBA/1MiAsnW085/YbQSv61LYOIyGqUO0kygp
 tWZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEUjim6PhOS0RXsqVnhE2SmObIm5IwAQ3O7pZVLdo/niwBdIr3fb163UUMNGDfwbyxRTNN8G5/IQ==@nongnu.org
X-Gm-Message-State: AOJu0YzBfqQ1LZrVl0gt6nmik5RGRnzkZzCk0BApgbWJpKNOrnBU/Rqn
 9BTxNirly8fU+nEHl4HLkv4EVFkcaI8Qw5ycHgEN46UnL4rblv3sUZxiQTrU4FF7rzn0tXGzEQY
 ZRn6YrZxc/CbDilXMHhf711a1ZKwxKdKy+RH18xMX2g==
X-Gm-Gg: ATEYQzyN1fyA2rzEhWTuzpWyBPj+B8/Z3PZSJz42HTWWh6vLcKq+Pn6Gze2pXJZHsLc
 t0Aadfg752S//TqFAZzWNnaO8G3XbhzUgnxy0RQWMZ6tiddNEndm5Me70zzlTgVWkD1LN3ucQmk
 qxHzfl8uyAl7UuPHIOati6FFOfXqE90mEwerflRZUdb1W0osJuSRlv94RhAQSjFFRnJcCNObkb3
 QrbeYzQUQV5ttYQpw+ENgkZX7VPObFQz82Kj1uKKVqWTR9wl9w3tiLdE20r5JreMu2GaQ/TWUZD
 h1ORF7VZ2T07/2GoQ6zeCO3jjVEBWE1/3TYWVurdZWf5tMPIjsYFKMcHWRrLnVOGytE=
X-Received: by 2002:a05:690e:1917:b0:64c:ed5a:d1bc with SMTP id
 956f58d0204a3-64ced5ad512mr1040335d50.45.1772532814778; Tue, 03 Mar 2026
 02:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
 <d5dfad54-ef20-444d-821b-724540d052c4@linaro.org>
In-Reply-To: <d5dfad54-ef20-444d-821b-724540d052c4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 10:13:23 +0000
X-Gm-Features: AaiRm53WDZkJJnyISGgFF2do2ewYBuKWfHQo6LmXaImPPTLs9NNVMBUmkHLJzgc
Message-ID: <CAFEAcA8uNUwFE2PCHxmq8go7TrTn00ujhNH97ReuVuUy=vOLTQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] arm/hvf: Add SME2 support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
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

On Tue, 3 Mar 2026 at 07:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/3/26 18:42, Manos Pitsidianakis wrote:
> > Manos Pitsidianakis (2):
> >        hvf/arm: handle FEAT_SME2 migration
> >        hvf/arm: expose FEAT_SME2 to guest if available
> >
> >   target/arm/hvf/hvf.c           | 312 +++++++++++++++++++++++++++++++++++++++--
> >   target/arm/hvf/hvf_sme_stubs.h | 158 +++++++++++++++++++++
> >   target/arm/hvf/sysreg.c.inc    |   8 ++
> >   target/arm/hvf_arm.h           |  41 ++++++
> >   target/arm/machine.c           |   2 +-
> >   5 files changed, 505 insertions(+), 16 deletions(-)
> > ---
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

