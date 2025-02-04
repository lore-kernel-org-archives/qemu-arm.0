Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp228275njb;
        Tue, 4 Feb 2025 06:03:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUx7fuMrl67dgOWm6RLbzcjBdauTasC4v/qgAOpYUwmAs0c5KFBzQDVRtcaUrbwh/NgQICA5kc/INAdzw==@linaro.org
X-Google-Smtp-Source: AGHT+IHUmqihymsxwNi6QDv8jM2aRy88yVo4nybZSyWnC+yzN10pgLVEv0RHMKDyBF6d96VKvEuq
X-Received: by 2002:a05:620a:244e:b0:7b6:c324:d3a5 with SMTP id af79cd13be357-7c02eccf064mr476235985a.19.1738677838147;
        Tue, 04 Feb 2025 06:03:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738677838; cv=none;
        d=google.com; s=arc-20240605;
        b=c6RZz31bte4eUAp5UdmH7v1ZZuGbfJgcfRFxOFxx0yN4ld4p6t2JwGKc1eemXc+s12
         5JLn1I5/GhLyOdOhCQJBXNvOwhDzERviSMOVino98KJk7dBEbhtxxAzoL70bOoPmQOkc
         +NmJIjT3kbVCA7fPzxbS3/GgjGia06PGQwbVlYkqbCWG3lUfAzlyr6/dMTE+9RjpKUab
         iAGVK9wbLyYNg7mHdt5jL7+9DFxoo4sEMZPdqc1e2EhjavKEV/5dnW1fzpzfHbNwHqpm
         ktIYGyFAuozq+0GsI6dEMD6SlMd9xA5YzuZeAbtNZURLx05++d/stJbYodOCN4rwFi2K
         +7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TGEcgwdOq63SM+XpAFJuAZbtcoHs6MQceTH+qYFSB5c=;
        fh=uvDG7o7wTxKAPtj2LEYOV+amq6PJRkftx8R96VwhdBs=;
        b=CQ/QDjLJ7Jqvsv0OO3bK9x6cBtlX0oV97eK2ff4nXxmDNEXVK7PE5P9TVd4URD6MK0
         T+tsQTO9knWoXJd4TXrXOiYip1i7lkSo4JXez8ZFptU0eL+K2VJNPvCn95sTD38HtbXD
         EMJNNIiYfVPSGVxMkP9zSqs9HYcbp7G80hlE1i1/VdP+Bx0SgcBwMos0rE7lp7Hq5g4z
         5HBA6sMDmdv8hDKR6j6WpfW2lw9E0ppzEHS+ozR+OwqR4eWHk6hhKT3D9PLl4Uu7jvYT
         TLlxdWoG4z8c7h6Gm2+A5SjAsC3Ap7CyBUZSEpiAKLfNTluYFy9PVYrUneO3yWdUOWbz
         dxqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IjIwQN0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b9baa632cfsi2444493137.35.2025.02.04.06.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 06:03:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IjIwQN0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfJWp-0006Uk-K7; Tue, 04 Feb 2025 09:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfJWg-0006Tu-TE
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 09:03:42 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfJWf-0007q6-7o
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 09:03:42 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e5ad75ca787so4227867276.0
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738677820; x=1739282620; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGEcgwdOq63SM+XpAFJuAZbtcoHs6MQceTH+qYFSB5c=;
 b=IjIwQN0d3k4cq/J0WdnPSWTnxqIl5W9+KDXMKFKka1vaNRZvnXk/q2LdxhusTtwPdI
 bA+96PlMaAw042XcmGV1nK/4YIqoC8LU8ItLZxGdwFPUGbNrcuRty039vauDsg4h/P1l
 rkJPWo6q2nJGKWQNDccbVsLF4DQv6x/vyO9wTTwuTr+wlBJJ5pMUFTLNI47nR3zVZ6Wk
 b/izphE7AAXhIszugAycfOUU9vexnkTmwk3bJlGyikS0rNLnhDA6vvCOmNwou8ilowoO
 UZVqZA9ziVgII1U4R352BONAhUdqcK/OR7KjDtft9tKGJ+Oiv1LIVZdwWOeKDY3Fixy1
 NFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738677820; x=1739282620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TGEcgwdOq63SM+XpAFJuAZbtcoHs6MQceTH+qYFSB5c=;
 b=i8O2QDz3goljxP3128dCjnHX+QnOdZPRJeFu5bKZA9BiKxMK0jX6PEYF1ulXVNVjm7
 o5/28HTn+CY9hUATrndzAqB7/ZXxB2vhjBCL+Vu30ISTXnQUt9Uljt0/PwdhwTl10HSk
 g0GmpP71ig6hZlrhnoJfP9j8lZowfaWxmuOERU3IyBgdigre3zRZ/NwFAIiWYI/t7qcd
 +un5lvSGXeb0RGSIH0rOTJdg65FwHlJjJhAP7OIIgNDD+LaC8KXjiHIjGZpsQ2LSWvQQ
 Iwh3eZIjTfCwEhSARcsLz+9beQKFV+tLn3p2c1fT14RJ2mPR6DUm2mLDyJFgh0gX3SxW
 fCPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqjt7XWbgFEO/g1WERUS4LDjM96Bo5WwWK16afMwCAMNdVlyIz9uFXaXMSYhWm1UTg+QVNZXIuEQ==@nongnu.org
X-Gm-Message-State: AOJu0YzUIT4EY7UfOhe6z7tRI63Ul/pcd82FJewl8WNT1Sb3sN2r+edG
 DVCd6pK91GdO4IUw8olRC9FCRcZ1ymjvKMe+XV9hrubiRiEtSz4NpvJBFCi75z+n3tej3351nS+
 d2T5i5JK0tiWhnnzZ5j8QPrVmb+675hVCgDzXbA==
X-Gm-Gg: ASbGnctDw3y9aRsZ9CxmYjRtE6vB1vLn3wvGOsWUALX/E9Q+ou8osycDpkoFCw2nofa
 GIhzvDrbBVJpbHetFHdfqZ6g3XKlizbqZVGe375PBMQF/zQiGieTGJqour2r7T1A19d6eo2TiNQ
 ==
X-Received: by 2002:a05:6902:e05:b0:e5a:e7eb:280b with SMTP id
 3f1490d57ef6-e5b135ed77dmr3457761276.17.1738677819946; Tue, 04 Feb 2025
 06:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20250130112615.3219-1-philmd@linaro.org>
In-Reply-To: <20250130112615.3219-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 14:03:28 +0000
X-Gm-Features: AWEUYZntVqFRNM-9_6pImvMyLeQrhcdCtPME3sOhuUwZlQ9i0TSonCMq4dKYgjw
Message-ID: <CAFEAcA_UkvLU2erFMY0G9H5G-GnYEJuUP-Ox8kqtSNF=LOOEHw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hw/arm: Minor cleanups around MPCore code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-TUID: I5QR3rjzw46W

On Thu, 30 Jan 2025 at 11:26, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> (series fully reviewed)
>
> Hi,
>
> This series contains the non-controversial and already
> reviewed patches (rebased) from this previous series:
> "Remove one use of qemu_get_cpu() in A7/A15 MPCore priv"
> https://lore.kernel.org/qemu-devel/20231212162935.42910-1-philmd@linaro.o=
rg/
>
> Posted separately to avoid keeping rebasing.
>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   hw/arm/boot: Propagate vCPU to arm_load_dtb()
>   hw/arm/fsl-imx6: Add local 'mpcore/gic' variables
>   hw/arm/fsl-imx6ul: Add local 'mpcore/gic' variables
>   hw/arm/fsl-imx7: Add local 'mpcore/gic' variables
>   hw/cpu/arm: Alias 'num-cpu' property on TYPE_REALVIEW_MPCORE
>   hw/cpu/arm: Declare CPU QOM types using DEFINE_TYPES() macro
>


Applied to target-arm.next, thanks.

-- PMM
