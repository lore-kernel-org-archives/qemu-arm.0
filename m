Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E044AC83F17
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 09:57:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhQ2d-0008Hu-Cg; Thu, 31 Jul 2025 05:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhQ2a-0008C7-Dq
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 05:57:36 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhQ2Y-0001fM-O7
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 05:57:36 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7086dcab64bso8174327b3.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 02:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753955852; x=1754560652; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qORoCOQNnxBgMqUuwRNp2GcohRoORejFqelkzIBCvb4=;
 b=QsAxN6Yre7MUS9331aIiw3l1QVfXXmRvGaLYX7J7C4fpi3qpbOoJ5SxVuOwk9WBICT
 MRpybkre/AYM3Tft9UPvIyZEbCiTqx0gXGZqr5dz92gkaKr3+qnmixKinuBmpA6fa8x/
 3CvIbzxCPERgYrEPYJcmK+qpXOTkGf4NSDLZACeOxtGwjbGJ/VHd1aMbYkhxB+wZh6xs
 RPAMvWvwgS2qn1JC3s3tUHWXd4NMQy+eai3QaBj5yMPoGO0a5O6h1XE00JBkwFltlSzS
 yQPFr4DMrzvqwukLcqp8sxNVeo6eYOvBladjw5i+CzgjkBe/OM48NvQnyAn0NChRDFIy
 tW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753955852; x=1754560652;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qORoCOQNnxBgMqUuwRNp2GcohRoORejFqelkzIBCvb4=;
 b=D6aFMflhUnnADzj0xrpOS8yh1g1g1Hjd6LkVPXw17SwnuMTb0uTMuhjjaRGvyIwwaE
 9CR8hSQd1KGR8jKA0/vu5zo1uzYRy2rvysS4PJ/AaMTCg64gCl5f0EwREoem6iZn7J6k
 tpNtQdfXdeJ03pUOXVSuBV66S2+5Hd2rHkRlDwlB9c0DSHKcPCiPh2vlVV/UFcUxco5p
 KBPcfl0mM/wARvb1RmRD5LlOsOQ8C6F5XCp2qK0qJ92Z1/PyMYpzDrFCLtN/wg+P8MPN
 ZZKiEF8YkSWDyzDL8btUcQcTYdHSoWYEebKWCsrx7bnGX6yzd9+dManc56Mh7f4/QMAp
 tuVw==
X-Gm-Message-State: AOJu0YzImBH1ehcWbb9xlUUqVhJkgGJsci62M4i0lPzciP35P/Jwdxa/
 hjApFlxouJQ3CzPuAIBjb/93Zq5cAGRK2jgCCgkeYe17s2w+jqq3YHiIVpREOUQL1n7/cUP1kHP
 BgFGQO897asWZcJUVqkq9iOOMZtBMsynnSN6VjUaZWQ==
X-Gm-Gg: ASbGncsYcnEz2fC4t9qK1E4S/saWN/t6ZsckWp85g7KexD2gtGYfvr18JIxA7/2ysS+
 YfL/gGpPJDJNs/4gq/AcrdBRnYNt8ScN0TJhthSsjMPYoYFJdxTIwHwPnwQzmFrdgJsdXrv1IhW
 Nf6wih/fbcSkp+tS/w4TNRDSLEm+5ye++DVyLjn79dQ0H+jfxgLN/KZKx7mtPil5exVO4tUW0uJ
 AlcxMbeQgUPJE0zcxvkWazgTn34/Q==
X-Google-Smtp-Source: AGHT+IGd18sYjAtLzLeXZwPVR1ImIAe6YhJZ97BrhPImtbcjwG7Ope+w5o1pORKIy3+dkRGRjcpO0cAFWh4IuA+ltwE=
X-Received: by 2002:a05:690c:9c0c:b0:71a:3f7e:ff0c with SMTP id
 00721157ae682-71a466d4ed5mr91440737b3.32.1753955852537; Thu, 31 Jul 2025
 02:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250725175510.3864231-1-peter.maydell@linaro.org>
 <20250725175510.3864231-2-peter.maydell@linaro.org>
 <12d5df5f-7fb1-4665-aa10-621505a4a44b@tls.msk.ru>
In-Reply-To: <12d5df5f-7fb1-4665-aa10-621505a4a44b@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jul 2025 10:57:21 +0100
X-Gm-Features: Ac12FXxXBGG6_yM2agN9m9sSvj3lWmFvg0gMT9aFw9vdlRVYcQXjCxiJ_AipzW8
Message-ID: <CAFEAcA9FZ3DUkOUv7XSDi4gp7ub+G5XyrUnK5uTbs0g5Z74uzQ@mail.gmail.com>
Subject: Re: [PATCH v2 for-10.1 1/3] linux-user/aarch64: Clear TPIDR2_EL0 when
 delivering signals
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 28 Jul 2025 at 17:10, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 25.07.2025 20:55, Peter Maydell wrote:
> > A recent change to the kernel (Linux commit b376108e1f88
> > "arm64/fpsimd: signal: Clear TPIDR2 when delivering signals") updated
> > the signal-handler entry code to always clear TPIDR2_EL0.
> >
> > This is necessary for the userspace ZA lazy saving scheme to work
> > correctly when unwinding exceptions across a signal boundary.
> > (For the essay-length description of the incorrect behaviour and
> > why this is the correct fix, see the commit message for the
> > kernel commit.)
> >
> > Make QEMU also clear TPIDR2_EL0 on signal entry, applying the
> > equivalent bugfix to our implementation.
> >
> > Note that getting this unwinding to work correctly also requires
> > changes to the userspace code, e.g.  as implemented in gcc in
> > https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b5ffc8e75a8
> >
> > This change is technically an ABI change; from the kernel's
> > point of view SME was never enabled (it was hidden behind
> > CONFIG_BROKEN) before the change. From QEMU's point of view
> > our SME-related signal handling was broken anyway as we weren't
> > saving and restoring TPIDR2_EL0.
> >
> > Cc: qemu-stable@nongnu.org
> > Fixes: 78011586b90d1 ("target/arm: Enable SME for user-only")
>
> Is it worth the efforts to apply this one to qemu 7.2.x branch?

Well, it's an easy backport since it's a one-liner, and
it's not a complicated change so it's pretty safe. There's
no point unless you're also backporting patch 2 of this series,
though.

In the 7.2.x version of target_setup_frame() the "clear
SVCR bits" code is a little different, but it's still there;
the change should go after this part:

    if (env->svcr) {
        env->svcr = 0;
        arm_rebuild_hflags(env);
    }

(there isn't actually an ordering requirement, so it's
just neater to put it in the same logical place)

-- PMM

