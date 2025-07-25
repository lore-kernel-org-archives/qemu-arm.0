Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC07C87FCA
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 14:51:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufJlD-0005wc-GX; Fri, 25 Jul 2025 10:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ufJiA-0001Uu-I3
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 10:47:52 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ufJi8-0004kq-RF
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 10:47:50 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7184015180fso23997377b3.2
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753454867; x=1754059667; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJOhDt3ZNCrxyA9hi2rK/8xUT+/pY7A3sm9i35epeJM=;
 b=WUWUt0fB7jD4UlQYiXjAM2iRvpznuFK/t88hnLYv0i2KE3wnWPO/lp6U+CZEjtGdph
 YsXWh3s4nN0mqxkPlOTOLX5AjWMV+tutXQPLAj5eMr2YbaGtuxJvWVqya5VmypbnNKg7
 FT5NoE9LQXl8fY75fLvVDg8LalYcUKrhVlb3Aila/wGJsYiQDJDhu+6STnDV4laPV4Az
 ySNwktGrqy4Sa7oSNWGox6zlrFiUjmCWjJfopIBiSK4CjVNgvEemHzefdvIVhVZprQzE
 twO/58wqGYoB2DegBk7DjUETIvw+o7ygemf4OGFTkHjbS2FDUkiJbwV7KfU+SRiUR5FD
 pp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753454867; x=1754059667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJOhDt3ZNCrxyA9hi2rK/8xUT+/pY7A3sm9i35epeJM=;
 b=jSwjNp52K3ARORibMYNXiTz1qAkyuuDpNnDon9nPF4isBKtVckS4/wvkyz9crHZiVn
 Fv0Mm0qgDZSs6nzVyAsPiGP3fgG0b/VP9g281t7RY/oUQUhQYtUp7fCmO1nwI5oyofLO
 if1hTyhxvN+Q6ZVeUeJU7dAJtjyQ4vt4iHt6blcYc5imjVeVAzNFfONGG8seAXq36IOz
 gPtuSrAXirt/yS550X6NS5l9eqPWr2DyEgBSxX8mjW+UDgX4heRulryHbocbKjgumbla
 mO7sfWurX6zll7dzBsn8RfVAbxuGgLKHQLnR76O4QYE62mPxHetr4BFteyomNCmdfNxk
 n7vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUARwMRYeyxvz3M1NRWkHtpfVjXK6NmTgIaTkX3XCXAh3tuBtqA9FisH8O8sQW1wGY9RZwO/9Dfgg==@nongnu.org
X-Gm-Message-State: AOJu0YwrhiimQzzKQYz0LWqYrVLNepBSBp5MNtuORaPzHkBH8CrRhJob
 /Or/AIG5otLsx6+ClyBjchgPxqVgizZZs2g37R1cQ8QF0FFm4nIjs0+8Wy+zlUSSOZKxjUv11xh
 6MBnqqTbJ9ZEWMRjGS+xH23RzFYhZh7YwjYRA5kgzaw==
X-Gm-Gg: ASbGncsBzlFe+pMZkLDPYfFARXGLE+7qA0WXcUiU4vZkmbT7oYMnW4k0YFaxcRpYuw8
 UCjF83G9TwaibqWrLd5h7/fLeGeReQHP8TdYBuvGSoS8/OkDuxVREKSHn+jj5HCX+7e0b9h5fVb
 LBcIwjVCQxYBvxPs17lZABZLvOoIAnDRz1gbK6QTxgFDxGFpqb5zQFrCLI1ur21hfSpcIntPxMu
 6Zs48AO
X-Google-Smtp-Source: AGHT+IFTJPVssmf7lYpJt01kNjkpqKW2sadjr4roZgDv9pHYduyLeLDrSwJ2hbNJpuhUJo8EFznmPxHPvNZEheGPmuQ=
X-Received: by 2002:a05:690c:640e:b0:718:4511:e14e with SMTP id
 00721157ae682-719e32c00f0mr27910717b3.12.1753454867409; Fri, 25 Jul 2025
 07:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250725014755.2122579-1-gustavo.romero@linaro.org>
 <17254b66-4902-4ee0-8c9a-4082146255e3@linaro.org>
 <aad0c640-b736-4f5a-a6cf-e5459f60630d@linaro.org>
In-Reply-To: <aad0c640-b736-4f5a-a6cf-e5459f60630d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jul 2025 15:47:34 +0100
X-Gm-Features: Ac12FXzDzGwCFKfwOapwgDTnFLNyyfOJ0D0ud4z9zLTmbjqkf2AbRr-AUSppCOA
Message-ID: <CAFEAcA8CN2GEGGrPZGweFHffSsBLF5Q-kfHwYhiRXfrgqGJ_Mg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Clean up of register field definitions
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 25 Jul 2025 at 15:38, Gustavo Romero <gustavo.romero@linaro.org> wr=
ote:
>
> Hi Phil,
>
> On 7/25/25 10:18, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Gustavo,
> >
> > On 25/7/25 03:47, Gustavo Romero wrote:
> >>           if (stage2idx =3D=3D ARMMMUIdx_Stage2_S) {
> >> -            s2walk_secure =3D !(env->cp15.vstcr_el2 & VSTCR_SW);
> >> +            s2walk_secure =3D !(env->cp15.vstcr_el2 & R_VSTCR_SW_MASK=
);
> >
> > FYI register API provides helper macros:
> >
> >              s2walk_secure =3D !FIELD_EX32(env->cp15.vstcr_el2, VSTCR, =
SW);
> >
>
> Do you know which form is currently preferred? I see that R_<REGNAME>_<FI=
ELD>_MASK is used a lot, .e.g, in helper.c.

Where a mask is the most simple or useful way to get what
you want, it's fine to use R_*_MASK directly; for instance
in this patch
 (env->cp15.vstcr_el2 & (R_VSTCR_SA_MASK | R_VSTCR_SW_MASK)
is better than
 (FIELD_EX64(env->cp15.vstcr_el2, VSTCR, SA) ||
  FIELD_EX64(env->cp15.vstcr_el2, VSTCR, SW))
and
  value |=3D R_FOO_BAR_MASK;
seems simpler than
  value =3D FIELD_DP64(value, FOO, BAR, 1);

I think (though this is to some extent a matter of personal taste).

Where we're using the mask to test whether a single bit field
is set or not, you could do it either way. I think in new code
I would probably use the FIELD_EX64 macro, but a test against
the mask value is fine too.

> Also, even tho the SW field in VSTCR is <=3D 31, VSTCR is a 64-bit regist=
er, so should I really use FIELD_EX32 (which works) or FIELD_EX64 (my first=
 thought would be to use it, i.e. based on the register size, not the field=
)?

Use FIELD_EX64 for working on 64-bit values, yes.

Personally I don't feel strongly about any of this, so I
would be happy taking this patch the way it is.

-- PMM

