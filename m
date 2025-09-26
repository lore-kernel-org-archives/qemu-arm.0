Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981CCCAC5AE
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 10:08:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v25M8-0008IU-Un; Fri, 26 Sep 2025 06:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v25M6-0008IC-2d
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 06:07:11 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v25Lw-00063P-SB
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 06:07:09 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6353e91a04aso1460759d50.2
 for <qemu-arm@nongnu.org>; Fri, 26 Sep 2025 03:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758881214; x=1759486014; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iySpOkGs+Ete6W2p6L3KdbLpNC+/AbFkwUJlm2GV+vc=;
 b=x/y+CtQ8/xn85LRsHm5bz7KzTLDIa1bshGSPpUnZEDU/2WY5nQYM54qKrXK5qzyDpV
 X8vN3dQgjSV2vDbmhwJ5mataCdkERzgU6G3UxziU4TuBSveELjWUIWX+A+2bXeiiQ/GV
 mG5Se9XhIcBcZvRgT8WEJKcoSk/pO5GluuGHEXj9JZPWHU/kA5FCxRKYNgB/MFu6RYCy
 bx4n42w5srQc31RcNyQW2zYvXVGg7fONa4orFMI7E/Mm19gxHgsnxoFp/dVeS65hZqMS
 IroH+B7wYkDKdcZIxI9ua46ceeoVZYXMqadL4s0eNg8iy2C58WiKu0PfR5xxjVn/9fYx
 luVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758881214; x=1759486014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iySpOkGs+Ete6W2p6L3KdbLpNC+/AbFkwUJlm2GV+vc=;
 b=Z6PCislI28hAZKIBeX7MtK3McopNEgov80QxMUZqGuNjEw7AZ1ODRDjIrAT7Ab1SqK
 bo9YozU593mKQ7a/qnoWzwaRpkPjmzClzOmGKkgehQ6jy+t7p7HJ36/HCigFsCsj1xk8
 3KsmlWHT1Ci+gC72bxFvHnOGdnyVvhXKM2NUA3qnlFSut1INhAVpwFvVAAznkaYjcnPf
 8ZoI15oU/Adu8gSVIRCiFo9m0yItaZOWCaPh5ID/iglfAdhhQ9by+kxqpypgL9186LuF
 0WJS5yy9Fc1lVvXaPCgZpU6IIcFAuFYeR/cAaxFyOQArnDhtmjbwF9Z2umfME28DTRIK
 4ApQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA7gLK1AQqnYHFRxReBW7JDxvfSv2ac9c0sq6+XRTL5Md8VihTV6vIHGsBpVeWkeFGGTNhLUjVKw==@nongnu.org
X-Gm-Message-State: AOJu0YwwBy/sulrOUxzicntpjrACL4MqBxTdffSW95hZDkL0WqSWDSvJ
 A84Kw0RPL0BV58beP0ZwHV9yphRgU9SSKSBmXkXwyQ+vNLYuMbxFQiFele2GnJ//eNSpJaKbL/e
 ct4hWzVaL7od3M6qyoAG7tYcQGwfctfZELr6aRcrHhg==
X-Gm-Gg: ASbGncuap/GPeSj+pPua5XRXpb3zJGPyU9EJGWv+e7HFHmNPtPW2h/F10HBtblHCzWX
 Qhl/0apLOtBvhLy1C+fOWKimBjbjqvUTNdSNjBUvHX6OmRKE5zJ+xRKgzPJiVJbiWr/sxJg2z8n
 3ehqgxjlmGjUX073jSeL19u53qMmZbwY3gsSDSCrDdI0sT+bMxJ02TNReMwcqV/g5P6Z++6vx5p
 kpyrqB0
X-Google-Smtp-Source: AGHT+IH3aM7e2BoehfpDtgmDWSbVVS+bpHD9Y6xJi8R6LWGNA/M4FQuDLo2O/u3BUIYCO7d6x3T3qzGVUL3dlE//9og=
X-Received: by 2002:a53:ed42:0:b0:636:1c2a:28a with SMTP id
 956f58d0204a3-6361c2a1459mr4930234d50.16.1758881214450; Fri, 26 Sep 2025
 03:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250925032151.73250-1-philmd@linaro.org>
In-Reply-To: <20250925032151.73250-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Sep 2025 11:06:43 +0100
X-Gm-Features: AS18NWBa7bWD4CcOT00xsI1wHzg32K7bhAUF6eMq2SMOgz2DcU9Aoz1pIxzFQcs
Message-ID: <CAFEAcA9m+=M3Ds4oTSmWrreGxgu+cL2k_nvsbPj9f7Lc5bT+aw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Replace magic GIC values by proper definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Thu, 25 Sept 2025 at 04:21, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Prefer the FIELD_DP64() macro and self-describing GIC
> definitions over magic values.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---




Applied to target-arm.next, thanks.

-- PMM

