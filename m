Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB913CD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 15:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wScM2-0007WE-5Z; Thu, 28 May 2026 11:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wScLz-0007VT-LP
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:08:59 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wScLy-0003gG-1g
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:08:59 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7cfd0d8eb09so96606247b3.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 08:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779980937; cv=none;
 d=google.com; s=arc-20240605;
 b=G7NaJoMnpPD4R1XixF7UVCeXu2D7X5snQqTFRLoZPLDiVj1Aw5TrPYxlGqsURqLhsI
 PFaHMr+wurOLpIojF9+YwptE8pxvMYz9dsxanL49E9hcP4UOc4J4NVqRDSrEH8yQpqlK
 UX1hUFp9veOCCW7inbKsZKU1I8PZV4UBlY/fNqqoebPIi6yUK0LCK3cAcUntk3zG0F63
 a6lx467UkI0H1UokZHDertgDW5o+F774sUKrb9CtHwuxS+rN4kX9ECsDXnUOXrGyAwQO
 JSSLeobEL3g/yQK517Rtxi0rubSczL1/5Bi9blio5pfGPthvYZ9YWl3PJOKtAuHopeMg
 qqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ZH+Pr2gCxkUA8KclhiyGn3ySabYvxbuLNcuyTXCLJcg=;
 fh=pChtpq20mQRMNKJ/LBi7cJkW2puaig7AC0IysZbvTFs=;
 b=MHePs/0Sxy1G+sEXqcd/CMfbKFVwsYK2hmzhybj3Qto5ugiruihu4Ge6zunh9LCn7M
 ER4p2Ew6mnxSKKR2sLkcr1c6UYM+wwqSi9Plnst6bnVkgZaBHSeuY/5qZirRHk59pW2m
 O+ATaAV33FvCRCWktJimdLLiUNbJPBT1T/5pYPFaPud96Np9lIiV8pAhmM5aBkbXEjpb
 YvQmC+TjAXxD2CX1GECgZGZ67dn+R4hhYFBxbyMq72oZ3Z03LsicOXrQQ/IBjledJRNf
 M0UsYZbkphXmgzu6b8+9KglMmwg2pn/f/6V5okPX8mRzjpZPHBbyGZOY0TAZxWL7aIBP
 OtOQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779980937; x=1780585737; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZH+Pr2gCxkUA8KclhiyGn3ySabYvxbuLNcuyTXCLJcg=;
 b=IGAiBfPXaI5TMRTGAxGLTkdWRJXh18VXODX8pH0uew77gvJ8nh6B3js7mv8coLxJH2
 Mk7LitrAwrruQF8VmjILuQ1ZoQIwsoITzlnXVAUfAYF+fonnKTx8QpEuRIMpz0SxTyjS
 ert+Nx9Dg6u3UJKppybolOInOymCjI/tg21qRGOHq2b2KXK0+qjf6kIrGf/VQErx0Pxj
 QazY5pQCUX7pNDpnmOifHyYSi/AxSDUUxpJJl1R+YhyXIOw9hZPtZ2Funh0EJBLJzdef
 beToslwGlcjjt/34499/vqYIv71C/klwvQVojnvqwW3oe05DdxHH607cWTEOnmOlbnKg
 crHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779980937; x=1780585737;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZH+Pr2gCxkUA8KclhiyGn3ySabYvxbuLNcuyTXCLJcg=;
 b=i5sIrYOybgjcqykmmrhyIHRSFZ7ZSHxxp/a+Rz8QynE3JDluVD6XSM/J677SPjijZQ
 z2yH/yB0GlqvMHwzRYxuSb/GNRxQxZTSan9ME/hw+uW08tO6LWUD3tWxdfs3cTfEp5Th
 tJyv4krnsbM8SOI8+glWGkitvClip49E4K8mY78ORUZRFOv8YmAbOD/N/hdKMvelIw3/
 6Xyc/H3w7fYAJtOfvNZdpyTX/c7uI6BJodoKcIrvfBMf9sOK89tSdmmspkkAujFaRihT
 tYCJ8Cr3WJbFbcH9DWyZXcaqXaaFqk1GCfYSiyFsB2gRGvkHfzPI2w3ps+2cvAZx8eIU
 V74w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7N/YKJWxyz3+FRJYCefiGqgfdrUznQmV2RpsR0V0ZDT/Fv8l1OCMLNry9cb53R0C2V02RUJQ1bA==@nongnu.org
X-Gm-Message-State: AOJu0YwX1ByAJp8OzxwRDPGaqJB758YuotxmXc6vu8FOYqbF4wxr9DpT
 VpFNGpTS0/gIqdR2hwHjJogXs4QDkN2AEc2lTRF4PDrfwwKJMl6l+arsAeX0uIqz6hRJKco0beF
 iIVplrOx97+YIkM3Veyy4BFgR28iwyvmaNP3AvxCRcA==
X-Gm-Gg: Acq92OG/AuSn6o9m4i2PnYPin6FmRjl+u1L6jwpB/Xhk4sPZoLJxR7RkvALrkGMF1Rj
 zhFEyGhUUTOnnaFp35GzkFBg+usiG26Xp8EzQfIG2FZmg96zx4QSQcF0vaVXBMcIduluim/lRA8
 kWaIDJtZyvm/tInuq5kd8LIDTsRvKcTDnYjjAl66ha93E8howGzDnDeGRMwIuyhsBn0HMjyendH
 4/IFJIZgTdKFtlXcVsJsTyGtp8SUXEvtBd2NAZgVzvXBWNIOVTP9Hcu8OlEF+/0NR3dyPteToC6
 0UIM0SCbysSq7rZwatuVMgEmKo2Vvsr+Mk+ZYF9aOMDlaaOZ+CSh0AnUvJEusZPI3W0xeprWKfJ
 hrQ==
X-Received: by 2002:a05:690c:6982:b0:79a:daf7:c4fb with SMTP id
 00721157ae682-7d33b44d216mr290968997b3.50.1779980936798; Thu, 28 May 2026
 08:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
In-Reply-To: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 16:08:45 +0100
X-Gm-Features: AVHnY4IrFnMULkPvEJHqjIRbadQy4hTr57kVoMRxxpQGeVzzBA9-uSHz-ZVWP6A
Message-ID: <CAFEAcA9J0DVUbgKviEjwEN8K0M2aAJTLaOpkndus6HNCPNRH0w@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] target/arm: add support for MTE4
To: Gabriel Brookman <brookmangabriel@gmail.com>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Mon, 11 May 2026 at 15:01, Gabriel Brookman
<brookmangabriel@gmail.com> wrote:
>
> This series implements ARM's Enhanced Memory Tagging Extension
> (MTE4). MTE4 implies the presence of several subfeatures:
> FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_TAGGED_FAR, FEAT_MTE_STORE_ONLY,
> FEAT_MTE_NO_ADDRESS_TAGS, and FEAT_MTE_PERM, none of which are
> currently implemented in QEMU. This patch implements all five.
>
> Testing:
>   - Included for FAR and STORE_ONLY.
>   - The MTE_CANONICAL/NAT test from v2, modified so MTE_CANONICAL is
>     enabled in user mode (removed from tree in v3).
>   - A bare-metal testsuite that sets up page tables for S1 and S2
>     translation, to test the Tagged NoTagAccess fault.
>   - The bare-metal testsuite also was used to test LDGM and similar
>     instructions not permitted in user-mode.
>   - The bare-metal testsuite also was used to test the mtx related
>     patches.
>
> Thanks,
> Gabriel Brookman

For me this series causes "make check-tcg" to fail, because the
"mte-10" test segfaults:

$ ./build/arm-clang/qemu-aarch64
./build/arm-clang/tests/tcg/aarch64-linux-user/mte-10
qemu: uncaught target signal 11 (Segmentation fault) - core dumped

thanks
-- PMM

