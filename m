Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1320676ejc;
        Fri, 11 Aug 2023 05:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2kQeaN7bpFOO60gaejjiGlmlxadUI+Y4ufL/h8v0M1kDDTIomjxEXRgjpQ7kDQhEWzxXV
X-Received: by 2002:a05:6358:c16:b0:137:d0bb:6036 with SMTP id f22-20020a0563580c1600b00137d0bb6036mr2406266rwj.1.1691755873815;
        Fri, 11 Aug 2023 05:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691755873; cv=none;
        d=google.com; s=arc-20160816;
        b=HoX7xktuXLdqdDTJV9cabcECTUngxOqHBBJ/qK9qHGHQPMGzGTYkYyWV2a4GfirsLW
         GK32xP7lE5807zzTYXWpyuCG7oeixtSaNnoEn2vQ6jz54x1TfVeazYTjhra8Te0Rd+Vs
         P09QK+XkQAr4qSUbExJDixn1PZ4qKwA81VBDZMKFqbYsCCBLQhm2n5nqREIt+VRBa/Md
         x8+ABoNJKHLRzvG9txu0Hyyvr2hHfnBZUgm5UIVoZH+fjpT91AVK4FBpXzwYJQvu01xV
         C601xFFHqHt8dKt7LD/tzYDwxVpDy33zLpavdqGRKSf/Lo5qZTCVoerxkDecoqk9RbQJ
         S0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=R+YarypYTGCN4jmeBdUW732G4PzAZjpDFadIlIjD8OM=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=VQ+cYCbOL9DdDh3+gcRu42qUMaIv/w+G9B8+iYcQExGb3oDAP6YSH18FcEXsqP0rEH
         DajM6Zo7YHngPJFqrsoCn3AkSYRzzrB0WsXPedb2ID1ViY/ICWOyQjQZPWBxSv3ouuMU
         ZdWM8Ibf5QlqX05nHOAFX6bUNRXhX9OVrmRTSsWqhj3qRlObZq1kgQVhD2oB/uq2urQS
         FyI+qAc1uoCQGQ0Yv8tuWlvFzxxJB9YuYyNdfrVg7fZ6Tx3mrLngboTe8bNKqrh7jHTi
         ouvvNhaRANVOFIMaQ/5qEgExy0OWf8m3tfoUJ1VH8/w5DBEJpO3vc1idTtk3M9W8j1bG
         0WjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jOI6++QG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a05622a15c600b00403cb5ac55asi2152947qty.724.2023.08.11.05.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 05:11:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jOI6++QG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUQyb-0006dx-JF; Fri, 11 Aug 2023 08:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQya-0006bT-4O
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 08:10:44 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQyX-0003nO-6K
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 08:10:43 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5234b80e9b6so2515240a12.2
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691755839; x=1692360639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R+YarypYTGCN4jmeBdUW732G4PzAZjpDFadIlIjD8OM=;
 b=jOI6++QGG/LU8u4G1T+IsW7+1rI3UAin/8X9x/hLyLHP5WqQ2A/usxeJDmKgivMNzR
 rZo4tFc4FcjRSyKPRQxyjcBuhLjkmO0HLzn1IiAU8k+5fo9MKWUpPj2uJ3BJ+Z/NL93I
 k4amU+c5z2fxyrr8YGlMZkjw0scGOXLSiJu9MbZTt1TGHDX6Mpj78uEjiVxjTLdrhl7b
 0YCByy7czyhD/wsHhtYT+v6IHZeI1j9PALvCXnXysYrBAQnwXzianGOtx7ig2kXFQ3Fq
 ahKAs6mm48rBajuFjEFlu+O1FJdBXWOcJo4TxcwaODxY1J+kpJaBqLBAk9+FL66xq3RC
 Hoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691755839; x=1692360639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R+YarypYTGCN4jmeBdUW732G4PzAZjpDFadIlIjD8OM=;
 b=G4D39yZD6wRRh3RDAOQ8OMul4l2ULeKfb2EnMmGhldLUwNQUMlZdp9ZnRgRhRvZOkQ
 7rA7qkJ73EZSuHQhzEd63IzO4crSCvyCTmmLoSvr52HFeO5r+VILk9IGKxkqn2HnbNGH
 V88HCnIqZ1bmRlZ3MFGRbz7tQSGgha5MdS8DAYLHgjcHKvqqlS1S4C1U4j0A8VgO4ENT
 xNfFS6nVUrlhBGpDjUZuJ1SpYvnO6UwzP/q2KC9JDmM2eZpDBwjrwBYlAMbaPn2EnG54
 vEvMYoE4ZNazJlyOAErPZ2GJt5n4MYQt58y5cm8dzvcUvVYhMzOWhrJN/+soBsU6J923
 3nqA==
X-Gm-Message-State: AOJu0YytWzT7GilKPj8VNXo8GGEIAFtXtuxQAdXr6D40MtCWBu3MGp6G
 mKuk6v6ixOeQZSisDLUlOYsFL8I1HI63s6GnqTzR1w==
X-Received: by 2002:aa7:d1d5:0:b0:523:102f:3ce0 with SMTP id
 g21-20020aa7d1d5000000b00523102f3ce0mr1569364edp.21.1691755839657; Fri, 11
 Aug 2023 05:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-24-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 13:10:28 +0100
Message-ID: <CAFEAcA8ox9sM-86a=U22fOnmV1wBROiaCyT6vaUrXA46Kk=X=g@mail.gmail.com>
Subject: Re: [PATCH 23/24] tcg/i386: Use shift in tcg_out_setcond
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: X4gF35FPKVvR

On Tue, 8 Aug 2023 at 04:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For LT/GE vs zero, shift down the sign bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
