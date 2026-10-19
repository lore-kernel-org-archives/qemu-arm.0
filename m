Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870A4606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 16:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jxxsvMLF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIqFT-0004vS-5y; Mon, 19 Oct 2026 12:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIqFQ-0004v3-MJ
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:30:04 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIqFO-0001hy-No
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:30:04 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-675676afc3cso2318428d50.3
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 09:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792427401; cv=none;
 d=google.com; s=arc-20260327;
 b=sRpsXs3V0xkhHR8cfy7kSmRWInIXkXiycOrLAEqZEyJUQCuK/pmOUxvNLpNwx1Xdxt
 yg3HKdPZJ/NUecMPE34nGLaOZY3d75NdzRZnlpIBxs2YpItBlh1a8aEt/UqfpCGYvt/M
 FL1b3niT9g4p4ZvK/nBpvV2Yykz40A1+YxHPu62vHGlSmuezdkHCX8Rb194PiHPaZQQs
 VPnDsOf9g1bA163rG6wmCajqnokDHwPf9tfp8X3kWOxQa/OsA9WKBrYq8chVDaIZe+Pt
 xFBdR1be+VkoToSxUkBXFBa6bDBvhiMuzX8QzSr19Gl9KFZtjlvIxTB8sP+dMh80WU4H
 WY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=z0n5kzwllhycJNwzz7O7iDXpRQDJOs+Vdz1EpH/TaT4=;
 fh=mJCYnvjJqVZRosiAf7sjYr/x6oeeHkvX2dmJRVqmuZ4=;
 b=JkgUDpSo/vkThViPKkyHGYDXuUFPJUV/L0v2IC1uoUzRVw21POMNoWl6GGWHdf1tYr
 pcaSaZmcviZEWMKeRxkZS6CbAVUcu37fCkgqxD18E1j4fM4uA4+kKIzsJa3tX74o6qX0
 KYonlmA6UF14I6Ln1vfuwfcGXqrOzcmANU7r56C1sml/WFa+dJZmxDQ6vqnTdObwhiFJ
 Daok59f8v6EbS1c/rMZcaU7/4nniUMw7P1UNygndoTP1Su8doek1G0lf2GH0No/F8Cfu
 zSx78teS9SG/cXb1N/YNaOjH8r7PjlfVO42u4YfJTD/toumNtRJHhYclXdxGOJ8WgnBO
 d4hg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792427401; x=1793032201; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=z0n5kzwllhycJNwzz7O7iDXpRQDJOs+Vdz1EpH/TaT4=;
 b=jxxsvMLFmUGx2rwft+iKBVShEZgz2/DlgSl4e2VekMiJxIVVCMvvFA4/ePr8uBA5N1
 F+h0tOz09tGqYx8QxX87Z3Kp12yzUwIFobn2np0QRfDorVnTMbmc8o6j7eqS9XzCwgBx
 XYRZt6kYo4X41bYePYRGqzdD689CsCsBg79oQ3iacplTOntaQJbCZhvsBGZcsHE+cwH6
 jwmpESYIc1dJ3IOMs/qoBI1NNIgKcrqTeXoDLUGqHrjEq+UmT+YAbO/+h4AlJiduCXh1
 YVt5nvH+nNybVw81/utsPRZsS4aKToNKp6YtterbePZBtpKNQ5BPP+gYx4niX1ySf200
 rtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792427401; x=1793032201;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=z0n5kzwllhycJNwzz7O7iDXpRQDJOs+Vdz1EpH/TaT4=;
 b=xQq1bgPL8nXaTImWMIdUOQVIkAEkAElvIBvhbu+TsQkRzvEAuKwnBuY/KNKQEzaZop
 61wYJrAdITZZhXDS+iBZ6inBGQ1txi9Cl7+mM0Tdsr+aag7vvpnTlmBW9GvyYUdQfHhH
 SY4xvMlMxM4TXWt5kzWqSW+MtcMSIEypG07f3bmue8BV52iDJT2GUvA0wJILCtSvCsbZ
 HhNNi/SuFFsuU2iLxKhDm1bOhBSgTUnaj7Hg7vdobf6dY3subBOFqiSY1hf9tYnJ/8VF
 0HKB4qDXFt+EBvUKtybDDXZWXHpVCDGcLuAp7iDnD7cmoCdrz/ln0B44ElSn0GLxP6a3
 kXzA==
X-Forwarded-Encrypted: i=1;
 AKwUvByZTov3XSZQKj4onohcxJKGkWaPPP6X4WoiXqxI5uhR/juPxflfUm5PNlfKHIdg18ZL2oyFpLHXNw==@nongnu.org
X-Gm-Message-State: AFq9FYJAUYP2PiXt2qGZzlDxi1dd0MeBaMPAUp+Z1n9DinTFfxrSGEYV
 7UfetF2KTSXmXqsg9DYV/55seLWuramfcHi+yaaiD/ACl1DnU1dxpfelmFOrZamV+FyXy16jOEk
 RWcDGP+txRlAyGFQqPSoLb4ihZ0wnTFrX/DEnI6CKWg==
X-Gm-Gg: AYBFou3KrsELDzHjZocR3U0ec1XPk9FGxok7hNWopbR26PajyWSoBVrRr3xBM9qQZaD
 j8Bc1d/9N6c62s2+nc/gSjWULtD8U+mBD/2IyPNMCE1cdIjzVWgt1HQzhYqoXfs50OwbGb/cc18
 Jk4A/tkdAtdmKovwx7YfDY2dmmrU76c3qRJ7YhYMFXjI8YupF1NNYFfuU6AO/wkKhET36/GSkBw
 E5tFUWwgENcxc5uodev6MXwuN7OK+pJhX7jifQBf/5s2YV8hlJ1sriIFBRcQroGrrmabKUtfk4d
 d8racI5vRTEb6UrSbdONWSWD/djzBALJzhk/jCR5op2gG2YRKmoQy+/11LUZhfaLoLA7DdtObFL
 TfXdL1nodf2ObT9c9+TI+903GsdeafzI1oZOsz4k=
X-Received: by 2002:a05:690c:c512:b0:8b1:9c2:87d6 with SMTP id
 00721157ae682-8b109c29015mr13609837b3.17.1792427401295; Mon, 19 Oct 2026
 09:30:01 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019155519.1302964-1-samanyu.goel16@gmail.com>
 <CAFEAcA_QYXpjXdC8oiTfn2Z3E99hW0j-mcDSqGLhKfKKex8VsA@mail.gmail.com>
 <CAL3-oQiGT2OSxq7casnW7JuwrCM5wa2L4SDpDe_As7+1hyEuww@mail.gmail.com>
In-Reply-To: <CAL3-oQiGT2OSxq7casnW7JuwrCM5wa2L4SDpDe_As7+1hyEuww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2026 17:29:48 +0100
X-Gm-Features: AclHuK_sCX-JTw-AdXEUU7Ddhih0pcFE2Vvyyw9uD0z3UURYvBh7lWGLNVxrmxE
Message-ID: <CAFEAcA82xogQU1vW=NLSxvZHOcz4KvaL3NutgXLZ17eNAvt7nw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/exynos4210_combiner: Fix out of bounds access
To: Samanyu Goel <samanyu.goel16@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=no autolearn_force=no
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 at 17:25, Samanyu Goel <samanyu.goel16@gmail.com> wrote:
>
> Thanks Peter! Good catch on the read function, I totally missed that part of it while focusing just on the main issue.
>
> It makes complete sense to clean up both functions together in your fix. This was a great learning experience for me, so thank you for taking the time to review and share feedback.

No worries, and sorry that we ended up duplicating effort.
I've got a bit lazy about not assigning issues in gitlab to myself
before starting work on them, I should be more careful about that.

I've just posted my series, if you're interested:
https://patchew.org/QEMU/20261019162217.3272337-1-peter.maydell@linaro.org/

-- PMM

