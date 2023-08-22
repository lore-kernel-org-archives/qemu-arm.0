Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp595639ejx;
        Tue, 22 Aug 2023 02:41:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu5E7V9KGwBEZtqH5wT+GU7qc00WQS2JG2Kvx3uUvZpj5IhVX/wcgfNUl4n/Xdkj81zzP7
X-Received: by 2002:ac8:5b14:0:b0:403:a262:7751 with SMTP id m20-20020ac85b14000000b00403a2627751mr12664490qtw.12.1692697273535;
        Tue, 22 Aug 2023 02:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692697273; cv=none;
        d=google.com; s=arc-20160816;
        b=m7n7mOMarmC1z9/PUv9kSZKR903P4WBn+iftElwm0769rpkaQYfLqF4pnT7rvoO31Y
         ex5YsHCz7d71wYyvn9xymoxxXMhJ6wT+eIm0m5f5GgMXU+ngh/7M9ddZApm/FiJCypKC
         is8K5jOwLFlZVe5pYU0TMXDrGXjIENcbn0eGY09olmNgy77MGL6NnY3L1AKGTi0KKeeu
         YBQMxP7HRw/eyXXc+zjV1Yzo+akFodUq2lU9OWcIGMvNQwVhd+uP7mJ/dRQlZ8wawQkJ
         wWnB9Eem2/QSKHURqMMOxYlhmulYTuYmIQk4KBxyNFQLT02ZMoGR7IUiGfKMRSDUgrzt
         96RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+99yKd7mHklJJwU1DmkVSdsTjQc5/6t9Ny9uz4G5Bwk=;
        fh=eij17B9Uql/X3wf7vgSENlzSWH9z1Lf9idyXxOT8QDE=;
        b=i22sHZHr9PC9yZKdzWNeuhWaj9een5bn/AJkP5rpTwF6pbc/2gi7K5v6jWcdsIctsk
         qO0HdGUIh0F1GhaSyVXy1ivz41a+TIJ3a3C85+YcL22s6R/vj0wclrJRvHfS/uUzx78O
         yw/TUmEqQbbksbParXbV1E1FQFnFjtky9SAC+eF99Wg2pL6YiIp4Qp/p2ZbBgXjwG8rR
         YVH586yg15m6ndabKGYbQG7Sp8Imm0Dwb4HoeE5yi1fozxrWV/LPYDtpJaf8OVxtt9r+
         FY4i+j0V3SMt7uk1JiKYRkoYItnggjJobM+62nwE4gvzw5ofuare58ctQpmkus5q7d1j
         LckQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dP7glGeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qs14-20020a05620a394e00b0076d9d214cfasi3780237qkn.165.2023.08.22.02.41.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 02:41:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dP7glGeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYNsl-00050T-G2; Tue, 22 Aug 2023 05:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qYNsj-0004xc-SL
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 05:41:01 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qYNsg-0002Rd-Tb
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 05:41:01 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-529fb04a234so3491235a12.3
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692697257; x=1693302057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+99yKd7mHklJJwU1DmkVSdsTjQc5/6t9Ny9uz4G5Bwk=;
 b=dP7glGeXNYRtxGDk1gqJR4TaODYrBmmUy1p9Xs9XhlCsWpBXsI6VXT/btsVposxuAm
 Ij0LPAtmnVRlSdXqi9ohfUgSvlLlyYlZAUMH+Gzm34eASunMH/1xtIEkXWx662F97tw6
 XbmSEMfpk1tuTDX8Wx46vKfSoJ/u1ffZI85PEeJJpcXTh76z5HnqJLJE/VA+7O2GVgOi
 dJZbL9ZOOw4gy5sge1vopeRt6bZF0cP0uLWaKajU/p8RaRvx9htEFxGhzD4t3ZSDQ6zA
 bx1I7W9gApy5lZ1fvaG/LUXHyqmSCnFA+sBXHGP6cmlIVopU4aXqK6/XkLOPbz4xi2Wk
 E/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692697257; x=1693302057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+99yKd7mHklJJwU1DmkVSdsTjQc5/6t9Ny9uz4G5Bwk=;
 b=BsGjxBYz+sgvHGjVKwLQpPngl2CzXFZlUKsxj7Ai7lcwi9dNn5OSdtD9jJmEdBnqcq
 DZl02ruhOuFR7Cwrwv08SR2HUpwOIezoykk9EqkXWXWLYk/H5RcZ9bPZkjbQZVWvBEyB
 8S2ive7inRSTzsSMna0zubExwB5XOU7FtSsPx9GlZQkuHqlF9Z8ib2gYlrcTsFB1MDbW
 Jp24/25oIwUjz2MBD6/bO+0Wpz/oECvSFQuP53vtNoe/mdE624GJ1x0VFH5hYhPFYik0
 7a6zTv/q1pcjqbRgZiZUeoCWQnqDO85FoeWoVpRTOAH1D2cCb0DS1OTYHj3ea1shxHUC
 ZETw==
X-Gm-Message-State: AOJu0YwmJ60tjnFGtZ7aDXvY1Pi/ZEHjcImvl18Bb8FNJACzOMcxDVOf
 nzRbF7XE4QiDcNbXA7o9ypHRgdjocJ3FtSc5GhAbGA==
X-Received: by 2002:a05:6402:88a:b0:523:a1f:1b50 with SMTP id
 e10-20020a056402088a00b005230a1f1b50mr7847296edy.28.1692697257067; Tue, 22
 Aug 2023 02:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
In-Reply-To: <20230822042530.1026751-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2023 10:40:46 +0100
Message-ID: <CAFEAcA_YEOXOfmRXcPCQZGbkhsKG-L2kMCr-68NJedGn4feb3Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Implement Most ARMv8.3 Pointer Authentication
 Features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Aaron Lindsay <Aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: EhuXw55q28kT

On Tue, 22 Aug 2023 at 05:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is an update of Aaron's v3 [1].
> There are a fair number of changes beyond a mere rebase:
>
>   * Updates to the test cases which fail with the new features.
>   * Updates to the documentation.
>   * Preserve pauth feature set when changing pauth algorithm.
>   * Rearrange feature detection:
>      - Add ARMPauthFeature
>      - Use it with isar_feature_pauth_feature
>      - Remove many of the isar predicates
>     The pauth_auth and pauth_addpac routines wind up making lots
>     of tests against the pauth feature set.  Rather than recompute
>     the feature set many times for each predicate, compute it once
>     and compare against the enumerators.
>   * Algorithmic simplification of Pauth2 and FPAC using cmp_mask.

Thanks for the respin. (Looks like you forgot to cc Aaron on this.)

-- PMM

>
> r~
>
> [1] https://patchew.org/QEMU/20230322202541.1404058-1-aaron@os.amperecomputing.com/
>
> Aaron Lindsay (6):
>   target/arm: Add ID_AA64ISAR2_EL1
>   target/arm: Add feature detection for FEAT_Pauth2 and extensions
>   target/arm: Implement FEAT_EPAC
>   target/arm: Implement FEAT_Pauth2
>   targer/arm: Inform helpers whether a PAC instruction is 'combined'
>   target/arm: Implement FEAT_FPAC and FEAT_FPACCOMBINE
>
> Richard Henderson (3):
>   tests/tcg/aarch64: Adjust pauth tests for FEAT_FPAC
>   target/arm: Don't change pauth features when changing algorithm
>   target/arm: Implement FEAT_PACQARMA3
>
>  docs/system/arm/cpu-features.rst  |  21 ++--
>  docs/system/arm/emulation.rst     |   7 ++
>  target/arm/cpu.h                  |  51 +++++++--
>  target/arm/syndrome.h             |   7 ++
>  target/arm/tcg/helper-a64.h       |   4 +
>  target/arm/arm-qmp-cmds.c         |   2 +-
>  target/arm/cpu64.c                |  86 ++++++++++----
>  target/arm/helper.c               |   4 +-
>  target/arm/hvf/hvf.c              |   1 +
>  target/arm/kvm64.c                |   2 +
>  target/arm/tcg/cpu64.c            |   2 +
>  target/arm/tcg/pauth_helper.c     | 180 ++++++++++++++++++++++++------
>  target/arm/tcg/translate-a64.c    |  12 +-
>  tests/qtest/arm-cpu-features.c    |  12 +-
>  tests/tcg/aarch64/pauth-2.c       |  61 ++++++++--
>  tests/tcg/aarch64/pauth-4.c       |  28 ++++-
>  tests/tcg/aarch64/pauth-5.c       |  20 ++++
>  tests/tcg/aarch64/Makefile.target |   5 +-
>  18 files changed, 409 insertions(+), 96 deletions(-)
