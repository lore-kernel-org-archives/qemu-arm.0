Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp441883njb;
        Thu, 5 Dec 2024 13:39:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtTg82+P4RHbZw7SGh2ts+sscSQNH4f67BO0liQn5TVnVg7b8ycAmYkJ7mapDrgGuQLqrwwK2bWZpQQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEj6R4ks/7DW7C1Jaf7w7JFYrASCSl5jtctqtorLzxLVjQoLI0780+ciS0B5Z8DcKUymBfj
X-Received: by 2002:a05:620a:2901:b0:7a9:ad65:f4a1 with SMTP id af79cd13be357-7b6bcad34e3mr115335585a.26.1733434763284;
        Thu, 05 Dec 2024 13:39:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733434763; cv=none;
        d=google.com; s=arc-20240605;
        b=aInh0LaLs7YFx1zYNiEliqMHz3f5v2XIP6iyzfVIEdnBwgLSY3n1W5wfKuYn+TGFVV
         IVqfOw7U4poDRMr8YozS+Gh1U+B3jMtSHsXvmTTk3m5GXi0vCDYwaKBF0smZ1uNdk+iq
         QUxcYByOjol66KPvWZEEGoJywZv4S8MI2huNCj41u11Hynepl9EuAZ3Go8GcHMWmKBFD
         Zs7Dm34cZUR4oNnCWP1Av2oeLamTwzxm9D0+5/DIqML5ndm39cETWDyJEIX+zYjsDT4i
         Ic7VbHzNmyBxvs+Ev6Lqv4BsA7l+JcfeSXX5KS1Pbl3hpUQJwc9W9nn/mV7g+tuO+Z8d
         GY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=buspJ033yI4KQQjeGpDIGExXi5v1uGBltcHsCX1LZuM=;
        fh=u0HP/qi9piv2vVyG7dJbRKs7pQBp934ryQtatACl3zs=;
        b=fBJM7vIQqMh6Xxx7Yo2ha8wvCCMPXy37Y/Nw61uC6cKgYhA1vGsVsJdx54KC8pz4Qr
         g8b99mnafmWAzNdogPuo0ti7bGJWBDzhp8b69wR9yKp4l9RUnXPIfsPe9CFCIEMHiOyU
         YIA2AUIF0EjViQ2+xg51opjEf3qiP6XQtzSQIWGeWfU4ZleYPA4Yi88QNReRRNsk0/cD
         A9E0KSrSHaHWut08L2qykSbp1OfE9tfdzv6Ws5u+wMQzyq6b6fHGKcynqyILNuff9fQg
         1/xXo6vw6MMlzjlb96JztDqKUNucOY4RUJL1Q0T88Yaxt/3oHsFxBFtdfxChI/srWhap
         MQZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHpqvSVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a90123si267406785a.289.2024.12.05.13.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 13:39:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHpqvSVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJJZ2-0007uv-VP; Thu, 05 Dec 2024 16:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJJYy-0007uT-MX
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 16:39:08 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJJYx-0000Bb-7l
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 16:39:08 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d0bd12374cso1691142a12.3
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 13:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733434746; x=1734039546; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buspJ033yI4KQQjeGpDIGExXi5v1uGBltcHsCX1LZuM=;
 b=gHpqvSVdE5d4w4SLWU6rGRURq2gUZGwLbuPEH8HpfT1y0hTx4zneUAqSq/CsXomk5s
 tUKtMOLoZzEF2fGsHcpLKa/V53xG0+nrm0846xRhGLsqMDXhDnV4pkyHMvLoxw78BG0P
 v0Jk94lPWuXzUmMFU/avLwJu0QvesndyJWJ2IFlV7clAs70CzrEvwOnG1XG7VsfWzBzC
 LTMy3L0JTfIV23BoaqEZcHAbJaslbqZOvVvbPBARy1muj9nUSzxHTC8y6qOOFCnZcS77
 1hXpw52vnXaKBjQOrsFUjhw6HYmzBLefd4F5kKl3OWn/w4uDx4NHgIatg8XfdxJFPriz
 Nkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733434746; x=1734039546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=buspJ033yI4KQQjeGpDIGExXi5v1uGBltcHsCX1LZuM=;
 b=nNDqu1aAgLphTwF/V5s6urnGJ8wTfMXbdCEqnCdYNcppawhhh1kFwz7YKhcXvHJcoF
 XFSxtZaD31xY8M9J0pjLU+nT0mn7dO3eBpwIvXmW/Y87nXFFEVL7gRqiDZLPsbLZwQEs
 cuoOxTrfR2QAZILm3irlQnlcH+y4cRybwN0xzLYCEPUKXNTYLFspjaDq3gRrvAgYelzV
 syu5YmGXG+J7WiDiCiOk7QonGLP2U04ZVTNhPhzj9kM0SxyQw1BXmQCyo50pDawR1nj+
 43hi91s4pZLKTI4hgx/jr1xbdrSGFQsEq65BovD+qeAuWuMcRAdVeBAQV0ymf21GKXKg
 +fwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxRYhleIBmMc927RhZ8EYCZyJXofdxsg3fNrS15lY9x/vBlt9VkE4YkOE7Hny1FLdF9jS93MSxhg==@nongnu.org
X-Gm-Message-State: AOJu0YzXlS6vV11abzejQWmurTOtJ25BBkD9K3HIJV1Ec0sML1HWlOEU
 j4Zj8RlYxgS/skJoZRejkJMbXJfJlKbn6ZBWhqjEi24F3BdbwSn5oRE0Za2tRvFDjuGQcXbGfTW
 LeID6HqcIVUXYqHw34HYbJxWWTfZiayiOmCCulO6mQiaDMEptLGk=
X-Gm-Gg: ASbGncsjWtIUYhlAcznsB1f/sKEjKcG4ekB+i8sNL/wzBQyOr5Ny27JFnyU29R7ug9k
 lUOBHRAi0XIzB7v8XPid6Y398N2EJIJOj
X-Received: by 2002:a05:6402:458a:b0:5d0:fb1a:afe2 with SMTP id
 4fb4d7f45d1cf-5d3be680097mr1556576a12.10.1733434745776; Thu, 05 Dec 2024
 13:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-25-richard.henderson@linaro.org>
 <d02f5bc5-87b6-465e-871f-521a49a27b22@linaro.org>
In-Reply-To: <d02f5bc5-87b6-465e-871f-521a49a27b22@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 21:38:54 +0000
Message-ID: <CAFEAcA_dxY-mtq8Ys2ZWHQ9ugMnamhno3cUMcGUVpHMK2gAzEw@mail.gmail.com>
Subject: Re: [PATCH 24/67] target/arm: Pass fpstatus to vfp_sqrt*
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: l9TQ+Ta2KrRM

On Thu, 5 Dec 2024 at 21:21, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 1/12/24 16:05, Richard Henderson wrote:
> > Pass fpstatus not env, like most other fp helpers.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/arm/helper.h            |  6 +++---
> >   target/arm/tcg/translate-a64.c | 15 +++++++--------
> >   target/arm/tcg/translate-vfp.c |  6 +++---
> >   target/arm/vfp_helper.c        | 12 ++++++------
> >   4 files changed, 19 insertions(+), 20 deletions(-)
>
>
> > @@ -10403,6 +10401,7 @@ static void disas_simd_two_reg_misc(DisasContex=
t *s, uint32_t insn)
> >               handle_2misc_fcmp_zero(s, opcode, false, u, is_q, size, r=
n, rd);
> >               return;
> >           case 0x7f: /* FSQRT */
> > +            need_fpstatus =3D true;
>
> Should this change be in a different patch?

No, this is correct. It tells the common code in this function
that it needs to set up tcg_fpstatus, because in the next change
in a later switch() in this function:

                 case 0x7f: /* FSQRT */
-                    gen_helper_vfp_sqrts(tcg_res, tcg_op, tcg_env);
+                    gen_helper_vfp_sqrts(tcg_res, tcg_op, tcg_fpstatus);
                     break;

we will now want to use it.

-- PMM
