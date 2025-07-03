Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp504220dyc;
        Thu, 3 Jul 2025 05:35:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaj4C1wS/PfwiGJtCxZESXHpwK8+eQ2SQLLxmdekf5aEBAohAKIfWdmdqbJ+3PMjDWpER7i83hCxte9g==@linaro.org
X-Google-Smtp-Source: AGHT+IH+ml+VnZJf1MO+0PCXsQd8E8hMnbPu+6w4bnLo/QTqSKcbxI7ebZVnxczdaECQ/aFEEqm+
X-Received: by 2002:ac8:7fd0:0:b0:4a7:22fd:682f with SMTP id d75a77b69052e-4a987989ac3mr59694651cf.3.1751546158437;
        Thu, 03 Jul 2025 05:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546158; cv=none;
        d=google.com; s=arc-20240605;
        b=XXs4CQRYp6MNdJTIFycCja+7awf7ylrNULAr88LeB2tGhHGAxRPbnYf+rmxFb5XLFK
         dSfiIK2rzZNlTTUZTnFO5oh+JPrh3+DZcWM1x9OQT4LwtMGB+tdUhiB2vkX2S53MHsR4
         CJBBDKBHMrcHVcczAAT7pUZdjG0wODE4rISJTr3EOmelb8qe5byjSw0V823OGsoPo5OW
         EQPQNZaOZZUp2WKJNJ6o3JH6r5Gh+zzzLRlpDVnxs5wyDXrh7P2OUvqVbe6QIASs4o/B
         k4ws+nK30z2Q1G0eG3oYffclldASoy7dh6DnVJCXmh8ogWJGhpBa2CT9DYzZFXvD5KYF
         f1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ukwU3+QDrs6QMfVz3Z8sn/xC+wPkxCNFAHV7Cor+EFA=;
        fh=irBHAhhSuLVts/e3v1noDpNToGe7Ixe+QoT2VFDjg1g=;
        b=eAIDwyKlmTHyf2H0Insn971j5ZFRD74oAnMiyQ3YxLvvXwj0X5gwtpi2I+gUH+ZrcJ
         PGO9nnMf9ZeKQC7gCNhXFLd6hDNMRCTjyP21Hp623dYe1G/mSkgSwO+sYtVyQAkJiLVJ
         fCWUoMmG3cFLHTATN3U9p44pfums9MYKFUcCinitBhQ9ougU7hE93yCduMSEksxYjMzy
         Wu+Fh41P13el68xR21R7nu6cYv2t2zx5vljMmRCYMyo5N9w+rKKNdew/7wSUFbkwhxtN
         JXOEWDojLXReoqoUX0WxdXi9zt/YJoGl411wCkiuuoW+fy0zSffwrvh8zmKd/3Clscin
         rtHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pVdQLPWR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc369d86si149548981cf.451.2025.07.03.05.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pVdQLPWR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJAF-0006QL-9b; Thu, 03 Jul 2025 08:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJA7-0006Pw-6K
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:35:35 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJA2-0007cI-TP
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:35:33 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e7387d4a336so7175686276.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751546129; x=1752150929; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ukwU3+QDrs6QMfVz3Z8sn/xC+wPkxCNFAHV7Cor+EFA=;
 b=pVdQLPWR5+DJ2yOXdZfx2NNpA8sYtzV8BxDwRJ5jb+Lugy7Whi+BDNc0Zg2V1/B29e
 i5/4l4lHNS/PWC7rQbBASSp2l36eVcWkcBC18+awCVG3tBMtAUcL9zlObqQnZomxVPXJ
 +gePj32yLUzAa8SMAWjWKXjzeKXI7buUSHGik4ASkGXvvPsEQ0+5qFzAYoTer9/Hrcy9
 aQ2yjn+Ux8s+OK7zLkzz1i6x36SdQ6rfCyVZfD1OCLy/7a9SXZvSHWqs5c7lQrfC/0F4
 Jaq8r/cmyaRK9SenhueazYaVE2BxOPyjak4kEqq9eI9ZCnBKwutuQGTIWP2iLKFReJB1
 x7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751546129; x=1752150929;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ukwU3+QDrs6QMfVz3Z8sn/xC+wPkxCNFAHV7Cor+EFA=;
 b=nptNK6HCG1yMNE97nFlQVfg7uZa5yczAlSDXUk9i2w+QzNmbpa/x2Kj7BsI8+PCcGK
 U+Z0eBVV3/+bet3iTwFY0s+dK6j1OExJTuhRSQgMpfYNtUurSloAfPOd25Hrwngt+zgt
 COwb4l9nL7h+G9SWTQzEahPKPZNuIkWA9h6O1+vTUIpMaCgQOb4T2FM4MSGuD2mr8SFq
 uuDD61G+GqwS0y5KjepYQ4iDnAofD2KUmniqdyPJ7N4RvRQJXSV5L6Yv/5brUaqd81Jn
 M1RBDVFJ0SZlKaagtmMucLelM9t8Z9RNOlEJ4dP16iBnFxeBiikQlYs1XyvlhsNAjYkC
 lIRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwjWS+WRf9Cg6urTxPE3pkrYYy5lvO5IaHfjBD4UI4OZvIOcrDEI4Bkoc+zDFsE11NWanQcx2hSA==@nongnu.org
X-Gm-Message-State: AOJu0YxQNDJxFED5BWhQ/wYzUSjeHgYIkkxolv+nrIqlrtO4bPXjNDO0
 2kx5HdTm+soJx3l5NNOZi13ks0beao63jyeA3qfyN0L2FCtW50MSyJSTAezWzI0Z1xaDb/dsykP
 hw1ZeGffTTjDOEEtR34sgu1I+qqw5Vxv/FPDYKPOzsQ==
X-Gm-Gg: ASbGncu8Qoy76Is/Wx1ts1UtpquMmTL456DRVbE9bS2uJ7EmW35zvsnWf07WBIHQG1D
 UxQ5E38qqNdim1/Cjdz2I4eyV3yoxAVSDh05+FsMHFPb+OgY/zJ2IGmr2m9fRqumqT99Z0aiDna
 7HkOS+wyFPVlaJUBTHdP4B4gkude0Ok66Wu3n/aYDsIPPZ
X-Received: by 2002:a05:690c:9a89:b0:710:f39f:a2bc with SMTP id
 00721157ae682-71658fb9d60mr47207597b3.8.1751546129338; Thu, 03 Jul 2025
 05:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-86-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-86-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:35:18 +0100
X-Gm-Features: Ac12FXzGZ7cdhAWUMLqsbhUYVMlLo4R2y6R96IxXlAak-klTzTYB2iDzxi2933U
Message-ID: <CAFEAcA9KzEqGW2GufAqV-=--m0DGPKco5bV1vAfTF5xOYw-V2Q@mail.gmail.com>
Subject: Re: [PATCH v3 85/97] target/arm: Move ld1qq and st1qq primitives to
 sve_ldst_internal.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
X-TUID: CfD0tWS9zEDl

On Wed, 2 Jul 2025 at 13:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move from sme_helper.c to the shared header.
> Add a comment noting the lack of atomicity.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve_ldst_internal.h | 63 ++++++++++++++++++++++++++++++
>  target/arm/tcg/sme_helper.c        | 44 +++------------------
>  2 files changed, 69 insertions(+), 38 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
