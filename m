Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608EBCA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 15:16:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uo1ae-0006kR-5m; Mon, 18 Aug 2025 11:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uo1aF-0006ib-3d
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 11:15:59 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uo1aC-00022k-GC
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 11:15:38 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e931cddb0e2so3314249276.3
 for <qemu-arm@nongnu.org>; Mon, 18 Aug 2025 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755530134; x=1756134934; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zYjmHHxYxXFqB/8tmee0Z290/k/BPhB65OKRzelxvE8=;
 b=E2LjE9+p3n1WmjGN9BSyE5BgMPnXa/MhfFjfEAre1tfqOfDT/sWwVsUNK6VGTqe0me
 lHF2wNrCjnhRVO1LMRjLLQjLFUeV0yqG9X3ozxzlYGtVQ5s/ceFFAw2EImAPwQFOaZ1X
 v6RrMnXZcUGJzn/KpGo7oHZI7GoYcmPwXWqOfuvmPB3sJglOsX5rffSo3F1BOkYt5xuD
 jLaNsJnJJb069EJ7k/xUyoqWqkGY0epqFhv6e8pejGmLdoM3WTkRhx0T7ubVhYbn8wWR
 ybn6jGM7o/UXohqz32tQaYK3j+Ui6ORco2H6fmuKPf9vh5AeVxegPysj/DHG41IC0Pce
 tDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755530134; x=1756134934;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zYjmHHxYxXFqB/8tmee0Z290/k/BPhB65OKRzelxvE8=;
 b=raG9/KnEj2cJ1eBSxpRS1xgh2PNk+3vyHiYhPQ9YFx4fMnQxJmuY6SexLNmN1HGxVp
 Pz3YHHTvejv7g1dybnBfpoKCojQJilTeLyc5Ex6XDdvo1Lpmczzs/2w4FkH5M0BkQ3KT
 DgykC0J05CpOEsj4vgiwfjynlMA4DFzAIeGNj6fc1MwzcbZUhf2VZIAFOF9hdcYcZM97
 NKGFU23PzAXBnasgTNVMVSlFIae0t+uz8u3tRq5TIghABose6V660TOqehsEHCEXZH8Z
 5N9aLeOlbQxb6WwgQXTUCsl1IUmSdtoKm8+sdgBMqIOI6xcolvOSlA+/LYIpKC0EN8IM
 2xJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC1p7F824mKUqb8DTOBVzI3M0IpSx1EZMIZMn9S1r/BnszmoawfeQ3+3BWeelDUbQZ3vib0ctYLw==@nongnu.org
X-Gm-Message-State: AOJu0YyqXveVMfyyy1OMGu3i0xi2LZHFoM6OCjTlbJFs4nSCdDrIA8IJ
 m/OzTct1uyPKYHWjRiQbjb04z7okA+7DCT5mOgGAKlgJpzoLbKSeWfMFe8aWWH5se/zO5grc+Ms
 FGsirnwtyAQbPtwK6+NYgndp0gWbdQO3LePDDrzjf7w==
X-Gm-Gg: ASbGncvk5Eop6S41kgfZ5z4aW/J73wUAZfxY1DR7/q93Mg2r425/r0jA1J0CxOIm9av
 4IL+qF3/X2dYNd3oOvHsGhDqQnR26sn5Do32aTUk2vVegOhjRdNkACZg5cit6dpxsbhopE2pWMO
 ZmskY9hti5ws+RlO+Hx4Nn7zlbyTB6SvjXGux63Y6RS/XfoWsllMafDZ6Xyuuhl23I5s/4SNee3
 QbRLkI6oi0Xmh6AZuo=
X-Google-Smtp-Source: AGHT+IGf0JJ480OIFQa7S2de+oHD//5MEBdaPxcDJRC5bEPnFunuX5bCkvmq9SmeSloDyFGwNNo+ElKegLEWJDotY3M=
X-Received: by 2002:a05:6902:2b8b:b0:e90:8a48:c3c3 with SMTP id
 3f1490d57ef6-e93324bb68bmr16259782276.34.1755530134640; Mon, 18 Aug 2025
 08:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250727074202.83141-1-richard.henderson@linaro.org>
 <20250727074202.83141-6-richard.henderson@linaro.org>
 <CAFEAcA9gVv1-wwMQO0W5XMn6rTgS-WfeRAQszQ186K6Z_jbaLw@mail.gmail.com>
In-Reply-To: <CAFEAcA9gVv1-wwMQO0W5XMn6rTgS-WfeRAQszQ186K6Z_jbaLw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Aug 2025 16:15:22 +0100
X-Gm-Features: Ac12FXx-pBJ0wS8eTRR7SUfdRM5LqwJuEau7f2B_YlwOREkzYCaxLpJeLwIkbLQ
Message-ID: <CAFEAcA-EXkbB+8bo_ZS1w4MoFTi+qH_cNZHMsAcFSgSZn1Lf1A@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] target/arm: Implement FEAT_MEC registers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Gustavo Romero <gustavo.romero@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Mon, 18 Aug 2025 at 14:36, Peter Maydell <peter.maydell@linaro.org> wrote:

> So we need to:
>  * define a new ARM_CP_NV2_NO_TRAP ("This sysreg does not got
>    trapped to EL2 by HCR_EL2.NV even though its opc1 is in {4, 5}")

Better name: ARM_CP_NV_NO_TRAP (the trap applies for NV and NV2),
and matches that we don't have a 2 in arm_cpreg_traps_in_nv()).

-- PMM

