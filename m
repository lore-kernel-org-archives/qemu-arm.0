Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp438519dyc;
        Thu, 3 Jul 2025 03:32:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQnIjpKTE1iewz6o6B/lr4C4oeTOP+H9awVKXtDCcRf1mzplgfrE/RKRoPXusoQJ22koEpFxZKb8Wyug==@linaro.org
X-Google-Smtp-Source: AGHT+IHiJQC2e/H1pedHTIyuIHbmy8tF6+PRZgK56aHBYDL9vr9MTqHA84EAr2VbQKCBSso1Ae+I
X-Received: by 2002:a05:622a:134e:b0:4a4:2d64:a7e4 with SMTP id d75a77b69052e-4a987a53bf1mr46757491cf.35.1751538752415;
        Thu, 03 Jul 2025 03:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538752; cv=none;
        d=google.com; s=arc-20240605;
        b=LaDrRKPM99R9FPCFyktkO5PUvKi3Aq2L6ppnIOU/mSMlSWaToQHK+08HegXGJQTFsC
         lckFVXJol7qQ0GcLUwKcrJpBDI+kok7TLgxNaIa1rbgmQIvfYzhsbH2pwEceLgBp61Iq
         peyz+/0IR98vscLuNXvIPxVHmJ8PjOobNCXCYJbdC7O6JwAuGxjtl2gfWU1Nvf1+hF4w
         5Ro/eoIlhoX0PgAv8NMm+eVmkbt1mAMyLGGP+paFeu3frpMbw/IK4Aev2A4n41VbqCOZ
         suDOErzuwAkFJkqKggXdhtmwwqoobky1BKBxACI/lH3RVd3jpQq1xcOs9wbz8DhvFVBu
         buGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CgRI0mf69C93B+5/xP8v1dE/4zxG0F2LakoLMXmkSyw=;
        fh=gL7VHbQBPo/TFy7tL4RYHNwdORnc4UUBpu716HwnmUA=;
        b=VdWiPtMwzgNpIS70d0NLOzUY92KbSlbTrrZ1wR96U0TH/Bmgi8c5kDHZxVUSNDZvaJ
         s5zhPUbBL67oASQBbBR2j7yhIf2IcepZq0S38T4sqhAOkVyuwPw7qo5M9D/oWXisvqmX
         wFPkCsEJSO+mN6kNYeCHTSuJ2oQHpyl1ohgK5LRsUsoIm+Qzu0e9zmSFEWIYt8ElcOT8
         KtPR6beNn32D1gCD83UycHjGbcgVYbVDA2yF2BMYQEgsWOok79QJSf+J4XFemUtsBPNO
         i3WcgO2/+9iTScWp6QCvNdPn323nERyNwRdW2csyjyomzfTsgCne8cfhc7DbnNAkBWDK
         goHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UVQn9DS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0ffc23si138950871cf.106.2025.07.03.03.32.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:32:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UVQn9DS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXHEZ-0006rE-Bj; Thu, 03 Jul 2025 06:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHEW-0006oC-7n
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:32:00 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHEU-0007z4-Ek
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:31:59 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e81cf6103a6so5412304276.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751538716; x=1752143516; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CgRI0mf69C93B+5/xP8v1dE/4zxG0F2LakoLMXmkSyw=;
 b=UVQn9DS5m58jPl9kUl2jI6nYHScz0/0SgZ9PliOHxkBl/N5e9yl6obxuNxkp6wjaH6
 ebjAQakO2rDWLi14YFiclYkg1yAEAA+DzgElZBaXhVMGQv54W7G+i/hvgm67GnipYhhv
 JWDrxuqS9k59RQJuhxATEULZKAkhd+0wyH7TXGJavA8Rbjk9nAyHdfDAmHn/vP1NzB1l
 5ByVawkkGTKH1t0Msudu6F88Uuob65b0iXAfUSpuCWGxrqyU4gTxV9IFjC0pZ1hY/7mf
 BrtqlIBOJWtGVH7Exx6EFvhagBkl6MflvHfODgQC6XRfCZVXn2C+ayxpKhwx4QYiE4zl
 LsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538716; x=1752143516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CgRI0mf69C93B+5/xP8v1dE/4zxG0F2LakoLMXmkSyw=;
 b=mUlRIafQE8Kqdgmyaw8na5xIXXIp882ajuHCO54Hk2WjdbCwy8rSDM541NZrPP45Vl
 FWk686XEz4UAORLrMQluIuPMAMpME1d01FuLRmgaoitWGZHsrsnuRHWNiC5ldCYK+8mf
 IKwXbkwYn1u09JW3WHEr6VVW8AVdQKUFAuhuAqZqwJxI/rudKoP9yLhnZcsvKQiucnxu
 wTF8u1ve7/+4ienvo9ZsIPBEhZvv60TEE1i7JFqOICprYMamkHfua+yiUfui+YzXQoIp
 NT0QsnBOr4gk+0nbYbvQUFt7/jjOefnOmu0N4nR3rNkiBPmZc4pxcV7mUETPbqr9RVtG
 sAJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXMHX4WizXUamJghW79xOrz9S+MgR2rUf+x+JnMKwyhzL9MX2jF2Mblae3XJetwt6Ov85oQrUGiQ==@nongnu.org
X-Gm-Message-State: AOJu0YxrD/dt06nI8pIwDJ9xQX5p5Enai4s68Le8+UqPSNlthd7j0KtE
 S8V/R79IdbFqE6hgn2IRT+8sVhjaFFGTCM14QG0mo5ASbfI8tfcn4EdQAEXNtZKaKGjSH/D3hfF
 kEB+swB3NsSIwio/unMqLmENSuc+3Wa7h/wf1AQBy3b4MTfsaCxLK
X-Gm-Gg: ASbGncs90w+6ERmyGSG3WKm3QTcQso917dvbo4QzSglM1B0sCQbgv+0wFHFGcoO2L4o
 dZCde8X1tAzfH83WIaC2gyQq311EL0qY9ZLk0tglrHkfQ9QttbK+5VplFdYLEsIZPmSmEKpz6j1
 QcbPuiA5yvd3kY0MpSdXx+PeYMNxHkJ5exaarbHD4T0z2B
X-Received: by 2002:a05:690c:48c6:b0:70c:a5c2:ceed with SMTP id
 00721157ae682-716590e59ccmr42416697b3.25.1751538716304; Thu, 03 Jul 2025
 03:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-57-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-57-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:31:44 +0100
X-Gm-Features: Ac12FXzIOe0znHhi022o-baUYMo5L0pMKOEC86Od6da3qeTrip-we45jy5u7yoQ
Message-ID: <CAFEAcA91iFK-WtXL6pYRngjVU+8bDx+TgjAXhhMBUSd03wSU0w@mail.gmail.com>
Subject: Re: [PATCH v3 56/97] target/arm: Implement SME2 FCLAMP, SCLAMP, UCLAMP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
X-TUID: Qe00myxuvkos

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h    | 15 +++++++
>  target/arm/tcg/sme_helper.c    | 52 +++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c | 75 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/sme.decode      | 17 ++++++++
>  4 files changed, 159 insertions(+)

> +#define FCLAMP(NAME, TYPE, H) \
> +void HELPER(NAME)(void *vd, void *vn, void *vm,                 \
> +                  float_status *fpst, uint32_t desc)            \
> +{                                                               \
> +    size_t stride = sizeof(ARMVectorReg) / sizeof(TYPE);        \
> +    size_t elements = simd_oprsz(desc) / sizeof(TYPE);          \
> +    size_t nreg = simd_data(desc);                              \
> +    TYPE *d = vd, *n = vn, *m = vm;                             \
> +    for (size_t e = 0; e < elements; e++) {                     \
> +        TYPE nn = n[H(e)], mm = m[H(e)];                        \
> +        for (size_t r = 0; r < nreg; r++) {                     \
> +            TYPE *dd = &d[r * stride + H(e)];                   \

Probably worth a comment here that the order of the operands
to the min and max is important to get the right result when
some of the inputs are NaNs.

> +            *dd = TYPE##_minnum(TYPE##_maxnum(nn, *dd, fpst), mm, fpst); \
> +        }                                                       \
> +    }                                                           \
> +}
> +

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
