Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1DF606A31E
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 16:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YtsVf9kS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIq2E-0005qW-Hj; Mon, 19 Oct 2026 12:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIq25-0005pE-DH
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:16:23 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIq22-0000Gm-I9
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:16:15 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8b0f59a5fdaso14475167b3.3
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 09:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426572; cv=none;
 d=google.com; s=arc-20260327;
 b=TT1aG7nKhkw88lsgocjAoL2WMeI6zCgg7+LFG9Nsc0VjJ5fcA7IdTDanVThj4ojemq
 c1+Pddx4KM0fkWSm2Po49i4s6bNaRBj4RT/eHheWPCmGsBLNJUwTP/Lkm12arRBVTMV0
 kYZcCmBZxESMCMAalwB6PJSAGFM1oT+prkBcKatxrluI1VnBI8H6ZV+Y4Z1mDh237sPO
 W8hpCEG+fy/QRh9ctldX/aHcT+Lt9ntoZhP1J6PEi0Wqo01R0habM2FQZ08ZHqTwCP11
 gp2Ks8VgauuOqNU7BGSlbld8AWQsKx55V1Hc31xC4sseJos8mPSp0m8lrvs9/imuCc1i
 iBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cjTRbU1LBZ9spSw2mK1PCuLTMulEv+5KOYY8wSAXEXw=;
 fh=YFizooBTFJB6e7araPb33LRwZXDAgN9YsCVEuJYw018=;
 b=dxhbTWeXSwdzF7Tpqc+U4cXY/5jX0XIoS3cwV6r+XdYzn0rM+nljCxjzgjn9+ohVMl
 ZKZLY+GCovIYNbDyE5Fob4UPalQQdGOAAfXXynNLQ+ImZcthzRcNE0uEdo1yPGKvKz7K
 bxdyJQGvI6v0XBsslG9b9BcMh2uqQ2Qbge2WLgiX3JdOFuEGZh/rgi2xhUqImRRYDVhR
 Xq/LTqz8U52J9g111wO17ewiqSQdusRCFxfEafDJqEHvJLGckDlJEwgvUbMGyfjDC9N+
 nkZasTM1Ajzsm76yqNjpQFZ+uY0ZfmwHox7KNOS1Nx5Rw1C1DIOSe2ZVqYMH5lanvlU1
 J6iA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792426572; x=1793031372; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cjTRbU1LBZ9spSw2mK1PCuLTMulEv+5KOYY8wSAXEXw=;
 b=YtsVf9kSQDjjeB1HYJNk1vnwOLensmS/Z7nnU8bewQrRwus36y6eIYuprC0pOFq34V
 ybxLUeq/4bJT34RcsP4m9ryNmU3Lj7iMzirJAQsdSz1S5wGVymwpiFopKe1XY5v6y4yG
 WTMCKuhoT9pqHgsQn9dl+zVd5o4L7uISazYY1ygA4F1BtuMRxSFvjWuzqFuIfTD6NQLW
 scV6npIMtvxi6Pgbfx7UIVCOQaOYnysvU8vTsemSlfxl/2GxRwdAr57QNwIYXiCBQvdx
 itpW8gPKxITXKpgemmY9eJMv3s3DF0upT7TifUSzJ+4B5qccvo7wK+g54wEqLOGXj6pm
 Om+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792426572; x=1793031372;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cjTRbU1LBZ9spSw2mK1PCuLTMulEv+5KOYY8wSAXEXw=;
 b=vizWhOhL1ji+wAOrQC/kFhSZGouSRpo7ln0nhzng9fJPEvOjO4RURKF4Nh+PnxqBlo
 NIraArtobjE46y/EXw2O9AUNsbVi2OexFQKcoUR6RCyrfGOrKMwLUf5X/LfwAugtDFhX
 SJ4ZMmXQzEyDnfezRh6wwN0PXDS2M0d2Si25Pa4rZkRAzeXvsLh+7hmQU43C3Soszs8U
 QgB/9gB4pOWvyJPloyImF6S7jPpIVxyGcKyAyOM9r+Wak+sfr7wR3kTOuT5PkIVTx7U2
 kRWh00pBxbfZNpf8iZehwt1720uz1hxIg1mnn9nytX+ndj/q3xr2HFKuSTmjB+8e9/uG
 qUIg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFNaF3/6RPzXoiwxUHaobMPb4hPM+uHzPkl9L+UQYTGKd5EXNq5lopu3KtykGbutCk86y/8FdF+w==@nongnu.org
X-Gm-Message-State: AFq9FYKBShhA3kehppp1z3/0acTT0CWj4NJYyJ8pyZ79azfutND6qgCC
 sd2Sp5F0TpGqCQMhBaTxg10o7Fd6526LZ3iltyK7zBGR8T0HozcdxyZWhOIQBU1BDINT7Ncf83q
 yiptg2r8HoJohe4DlbVYF+L1ESoLjhadn9y/0NUV1fg==
X-Gm-Gg: AYBFou1v4qr5fmloA3KPughKZbBq8UaeWorKu3mDF5WEVjwy6VSqtFwbIk0vruE6/0j
 mu0YGNABlAmk1NoEhTVZZKuc5Hp4eho34R+3AUIFkflLTBcDnbpBf9Tii8jLYjOIIb4sA7vHboC
 QzSxNxVGMWvjYWkXrPB7gHaNPr0TuUrtStvo2FQmhMGXq+qYJvEI6AtFFjwUmO/QtbssctVSxzc
 RnoAZryg9ipY9hnRmxU81PxhD5FOtCdSPZehHaDK5GDVB7RvlimLC0DUY6uZwgfrf+fUF+XQyUP
 cqICMmVj7CV0pLC41lgyVuLv/HIYZzKt7XWwRIA0bjeOhLZTT+gpDqNgVflwVzrXB8HaRctQQ36
 N5UGj6f937y1GeQZ5J0rdBughHXhfN9Yzqy+WyBg75pCp3LSfZA==
X-Received: by 2002:a05:690c:298:b0:8b0:a176:fa5b with SMTP id
 00721157ae682-8b0f21e1720mr28769197b3.64.1792426571839; Mon, 19 Oct 2026
 09:16:11 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019155519.1302964-1-samanyu.goel16@gmail.com>
In-Reply-To: <20261019155519.1302964-1-samanyu.goel16@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2026 17:15:59 +0100
X-Gm-Features: AclHuK8ez5_ajExezvsC1O8Vj8rqTc91RB6BJ4JOKwGWecPbsGmlu_WHh9eqrO4
Message-ID: <CAFEAcA_QYXpjXdC8oiTfn2Z3E99hW0j-mcDSqGLhKfKKex8VsA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/exynos4210_combiner: Fix out of bounds access
To: Samanyu Goel <samanyu.goel16@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 at 16:55, Samanyu Goel <samanyu.goel16@gmail.com> wrote:
>
> In exynos4210_combiner_write(), the bounds check used req_quad_base_n
> instead of grp_quad_base_n. Because req_quad_base_n counts 4-group blocks
> rather than individual groups, invalid offsets were allowed through.
>
> For example, writing to offset 0x100 resulted in req_quad_base_n = 16,
> passing the check (16 < 64). As verified in GDB, this caused
> grp_quad_base_n to reach 64, leading to an out-of-bounds write at
> s->group[64].
>
> Signed-off-by: Samanyu Goel <samanyu.goel16@gmail.com>
> ---

This is https://gitlab.com/qemu-project/qemu/-/work_items/4709.

You've missed the equivalent check in the read function.

As it happens I was working on this bug this afternoon; I have
a patch nearly ready to send which fixes this and also cleans up
some other oddities about the checks in these functions.

thanks
-- PMM

