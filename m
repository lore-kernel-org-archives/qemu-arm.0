Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp852508njj;
        Fri, 2 May 2025 06:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcKU9SKdwqDStWrN+bvhWH+srJr4IxR4SxUBsPJH5+N9LDokWSg5Vrf4tK9Dny3wnP9x0+ZUFtFq6WHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IErzUQhDPwHMnVrtJ0ZCKYh1QEWUkn8+cWi+Z/0O57mSlbryQNdEMVasoH49oJszXVQA60l
X-Received: by 2002:a05:622a:5806:b0:48a:2171:9ede with SMTP id d75a77b69052e-48c32ebfa8fmr46474891cf.47.1746193136601;
        Fri, 02 May 2025 06:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746193136; cv=none;
        d=google.com; s=arc-20240605;
        b=dEXawS+eo7+2XbNONGcqymgM6B/oQs0K8bIP/ye4E40eEQHtdwGeHuZPV3ZvBLTaMm
         EeTsUyQzGJ+x5R9au3VFEfy10s7KQDXB6+lkvyjHv21Q6/W53JYFxSC8PclvAUooK1v3
         Oq9Ks5H+L9eJMHAobMVNdg0ATIIxzEbNKiQLriAF0HTTGTm7Y1TX1OWdqaIT95bUVtiE
         uL4fUbq2Kkc3QT/VhGLovPXgHOg9uoIJtHDU4ncIUKwZjraGwyjoyxFKgAWNNvT6mpJp
         36cK9bIEjbPwjAO+fwdJ2+jFpt2BrOaCSY5D1B0LB9Wei7WB9yTBLFC8QMTql6GRo2La
         x0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=X3luG/UIDY1/GfJNc0Jva/acqJgU7jY8Ei1u63tDiqw=;
        fh=bFp8C/Gl+oIw2+ozCRFD5PwK0lawYK0J/bqOPI7v4Ns=;
        b=T6Hjaaome+u4cBJ7qhKqdtY801obpG72pf7RCx6vIh1SvlTwJdj7WZ2IuxorRJ4L+S
         PNVPJoQPqXj/S/+hcvTcFrOUrg7+RGM0bQI2cFu559RkZ2U2+UvR3HWvcPFPQc+n3iS9
         Rbx9Afzb9Ac7/t8l4et99JYUBnsRxJd0ky6A2+kbbNU7st5OPnkjASnp/5yb63TEdzhM
         QYUtBTJXREViev2LL9uQ2eofqyJa7mEMHLkwHR1lckcp7ZaOIQbBq9y80bes+qEBwYIy
         v0Y77MlYztMIMu7MPYgjnhJgaUff4DGbeIvaIG+UgRzSA9vr8fKPf/A/NSuJk/5SXrOO
         PANA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WZVqYCpj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98e0d0d3si30966761cf.593.2025.05.02.06.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 06:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WZVqYCpj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAqad-0003CC-FH; Fri, 02 May 2025 09:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uAqac-0003Bp-6y
 for qemu-arm@nongnu.org; Fri, 02 May 2025 09:38:06 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uAqaa-0002Ee-1h
 for qemu-arm@nongnu.org; Fri, 02 May 2025 09:38:05 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e6a8aa771e8so1793333276.3
 for <qemu-arm@nongnu.org>; Fri, 02 May 2025 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746193082; x=1746797882; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3luG/UIDY1/GfJNc0Jva/acqJgU7jY8Ei1u63tDiqw=;
 b=WZVqYCpjAFuwQeyjXazYE2TSB1cfXCRtwbp75I0UeHdUuXN4al98TLm4YFhigxBcyY
 5Ct2LC2+D9kKQKl9kaNWADXdw7WPF8e6LrXvOKEuEIBagdzMF+1eOb/s1LiH3XUWTrKd
 IeEHbAAtm7OkI/cpkDz9o4zb/tZb9MkkIVM1pBFaMTCTkx2MmZSz7WMMc66tk0gzSxoW
 ihLt2wEvTs5BU56LEW3hEcHC5pBbs4lEMx8Ed5fsDVzM+oaGyXP3Y0g3JH/Oa7KUU4lU
 TNiBcKg9M7CbqfjhdCn78n+y1yE192NSeaB9BmwyPwVe/lzCJZr3uRBtEjwCFsa3c3kI
 7mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746193082; x=1746797882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3luG/UIDY1/GfJNc0Jva/acqJgU7jY8Ei1u63tDiqw=;
 b=J5UzdArAT7zb8cMARwp82mYo/ylXvvKKG1zx+DVyU2WBBu+rbPUpBDOGz4+zuyShb+
 vU8DeS7TKbd4xs3BB27JNVo9YmyoLAAA+j9Cz+hWYj/3KtRG3lVdPDu2WAVVb+ZOg2Iz
 lX+j3CsxV54iSBlhx+mBYjkt7mTiux4bR7gs+uzBR0+4RL8povzElEJYAocqTIoC6pQF
 XcFt+Naef0hG5XlVadJ5x+lc+69I2vFao6BxVtAy4y5hlg6GlwmiFrYX1mileEQotbuX
 cYzEzg3yRSvfQ3tRd2u5QpRo9Paemh/gYvu0cC0Ib59JJAXdN937l/U97d6hTSF2+rjZ
 AX0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsjfuKfQLOvn7jQHfaPWVbIV5WRxW/XumiJDt76kOsRIm/r3vRVvhcE0l02WjV93zlsK0bojaTcw==@nongnu.org
X-Gm-Message-State: AOJu0YwbLS/gUpppCC4BlLx2cgM6UkrluMRlZuiOmcw8H/04CtPwIDxc
 7w96Gz2xmFBrnbswrwUpHHwpvuu/U/k0wrSlvErILuu8q7CORfTwqNIXF7vf0/b2qRDObn17ZcX
 sfNXrma56Ox2bVOj92FGEUmyGcPxAQ0sGMsLwig==
X-Gm-Gg: ASbGncsFYyHJwzrcwoysaVM8TohAR6mGXUlRPRnK2h4so4FFxr74fFtvNtHgyeE9puK
 GmHpfK5QLmN6HRATjkBldi4XZxbAMPf4vEvNhIf6/Jf+I9pWhP6URXieKmsK5G64dJgA2AJCk1M
 M644nVJycNs0prY9xf0NfVAHw=
X-Received: by 2002:a05:6902:1607:b0:e73:22c4:117b with SMTP id
 3f1490d57ef6-e756566218cmr3817349276.47.1746193082647; Fri, 02 May 2025
 06:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250116145944.38028-1-philmd@linaro.org>
In-Reply-To: <20250116145944.38028-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 May 2025 14:37:51 +0100
X-Gm-Features: ATxdqUEcczldx5jH_6rLsaK17PZJwtYUB2WXlMy9Z2CyZaaALu6Olqh7QjkTdQ8
Message-ID: <CAFEAcA_7KfbhMj4c=HD4m+xivTK4NZcYc0O4NXt6MtVJ6bSitA@mail.gmail.com>
Subject: Re: [PATCH-for-10.1 v2 00/13] hw/arm: Remove virt-2.6 up to virt-2.12
 machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ckvMKIO6QyJm

On Thu, 16 Jan 2025 at 14:59, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The versioned 'virt' machines up to 2.12 been marked as deprecated
> two releases ago, and are older than 6 years, so according to our
> support policy we can remove them. Remove associated dead code.
>
> Since v1:
> - Corrected disallow_affinity_adjustment removal (Thomas)
> - Do not modify docs/about/removed-features.rst (Thomas & Daniel)
>
> Philippe Mathieu-Daud=C3=A9 (13):
>   hw/arm/virt: Remove deprecated virt-2.6 machine
>   hw/arm/virt: Remove VirtMachineClass::no_pmu field
>   hw/arm/virt: Remove VirtMachineClass::disallow_affinity_adjustment
>   hw/arm/virt: Remove deprecated virt-2.7 machine
>   hw/arm/virt: Remove VirtMachineClass::no_its field
>   hw/arm/virt: Remove deprecated virt-2.8 machine
>   hw/arm/virt: Remove VirtMachineClass::claim_edge_triggered_timers
>     field
>   hw/arm/virt: Remove deprecated virt-2.9 machine
>   hw/arm/virt: Remove deprecated virt-2.10 machine
>   hw/arm/virt: Remove deprecated virt-2.11 machine
>   hw/arm/virt: Remove VirtMachineClass::smbios_old_sys_ver field
>   hw/arm/virt: Remove deprecated virt-2.12 machine
>   hw/arm/virt: Remove VirtMachineClass::no_highmem_ecam field

Applied to target-arm.next, thanks (with the tweak RTH points
out to avoid a compilation failure in patch 3).

-- PMM
