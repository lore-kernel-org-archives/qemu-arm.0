Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63C5606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Nov 2026 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gnWiEo+9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRo44-0008AL-AK; Fri, 13 Nov 2026 04:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRo42-00087Y-Lp
 for qemu-arm@nongnu.org; Fri, 13 Nov 2026 04:59:22 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRo41-0006Y3-1y
 for qemu-arm@nongnu.org; Fri, 13 Nov 2026 04:59:22 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-677bc4704cbso693251d50.0
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2026 01:59:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794563960; cv=none;
 d=google.com; s=arc-20260327;
 b=hrro7s93REsDCvNwutPvYkBhxHNzkA2qfRNqB2v4hhpyWKmxbqR5QnBc2flPUbkyKo
 gTXlg8s4k/LjVoj9cH22R/6jlUsu4C/tYu+6gmLsSa8CnQY/7tfmjp68Tq60bVJvpYEa
 d2fqg34q2+b+Hfw0uhP21ATUz1HzxkSa0BjSC/Yb4Y7EmOUDMoUDrV3MpAdBR5AhI8Sh
 YTt/Bh08oTncHA2Wdphwz8aW08es9svg/kwBqldLcHXEmMMvycoqK6D83HXM5onb8qld
 m2acIGY3VH+n1HwtWT+YfXkDHbJJqsZoYIxazQuw4vJPwWpglXTT1q8ZTeurUMl+Jv1G
 QnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=A1R15BPCVezEKVROSd3Pf3UKuo0v/8TGSZKaMOdpKWA=;
 fh=dR30LaynauYMrDZHYuZn42NquL756ffpCYj00S/slZU=;
 b=Bt//ZnHONWb7DjdD5Oqarx9Q0modK7lrETHNZ7qkFMq8HtD9FS+GKXCLoyMHY7F8oP
 uGziiwGUOTeBhE+MNSGAN0JZv6GAvasGSAMDPYaUfMzYQ2qFOojzH6xrKGPXi8boF2ur
 WgfnF80svq4KO9GTn/bNvv7hWJyFKtLvmelSDRUua1uuE6W74VjQYfl15ZXHgSQun8cM
 Z/gSQh2OSmjS0lHPG6HrdYHg85gTb1ZSAE1I4QMLAvN2nAbB7Fys5wiIu4I5wZ3uK+mB
 0jLYxq0z5tc1KK7VBl+dKY7b/uJsLcgJ/CGBvIHNASUzROwCPp2v5cRMUokHtMkfI2OL
 JPGg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794563960; x=1795168760; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=A1R15BPCVezEKVROSd3Pf3UKuo0v/8TGSZKaMOdpKWA=;
 b=gnWiEo+9jAHepCsYEMssX0VMq7YwzXu5DxlIdULcnaUx4QziqTWxRd4rlCiSDgQVsp
 9k3alUgs53bce9rE6HhtV6nWYCk2mL3d04kjfN2BPvAAma9cVKpcbsaQZpEDH26Fv+Nd
 elhGb6R/W5mTRoZQQj1pITV2Qailj92jp4g2dJlaw9dj+mWQIRjSBJVSXNu99jVGMO5I
 9NsT2AP5YQlxa3omrsbNbnSTxyTZSSpOwtXhjsxcDB2uygmhawrCu8/M1ft2pYmDly23
 c44XZcY2CFYl33qa136Q6UCCH3JYrhYLNbvtIsJj+64TZbngHMzhTfwtycK54c+Sqrjf
 HWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794563960; x=1795168760;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=A1R15BPCVezEKVROSd3Pf3UKuo0v/8TGSZKaMOdpKWA=;
 b=r3iBR1oHCCuIV1zOWFk9fFvkzbrgCcaxXuT9FCtVr3kb0HNOJMO3SGeph8x6l27WKo
 LNSoyS71em1sV82XunV/UoCioqajLjIB7LnKKZWOS92UhY8/kignwTecSGsvv9ht0EYg
 rpq20X/TweVDWfQJCFJew6SlKUXm5wFYmR7NaOnscGjFFOsjIsnr03A1LMUuFHgZuPMz
 YMYLp/JFPCV0CCGiCWUOMDeAtNgPUp/+IPK+dTnbyGqMvnSJqUouaRK7Ozhveu3zRJp1
 VbdJYBiDXzW2pzS3Ldwo1NeYY92Zp1Pziv09CVCG8/3f/KsnMUJh0Pz/AHL0IEtv2qAP
 plhA==
X-Forwarded-Encrypted: i=1;
 AL+hErGXQyOfrcs8dp6XCy7aMC4gX3OPg4BiDEajyfj1VeH1FMUE8XhcmjgMqwg8EyHirLb+Kmia/BCNuA==@nongnu.org
X-Gm-Message-State: APuU4Z801yYPH8T1fWI84Z7V86r4YmsrKiVnvgAJ9B1/HdB0jT9X+mfH
 vIDxh8k3qrJl5BNVrph0REWCj3mYxw4q3o57Ai5NofM9Di+CewYpwtpvBXgf+jmn7ePNNBcRHTf
 HxD8DILE1jB46uw1ndHKw5C+ih0V8jyg6IPCZ7qNVRQ==
X-Gm-Gg: AYBFou2IY2ZSp9QNRbA/WNt6AT0MrkY6n3Z9ufgOYFfmf55aJ8a34mltq0CGdCa0D14
 QrRUcFYxXpEnbzx+AYDY9WKyNXqghHKxE8rmNJ/wBg6UQl53vCfTMGwf5uiGk4QaB9cBJYkyeId
 ifme9h6AR8p+hCva47Jfv9kGlVuAWf8PZUqJiiKmtyWmttfUsEwiKTM3r4s9pKw0G71D9K1vk5O
 s9MjIZR1kMz9U7sw2o2Sw7Pmj9UEzC9pZIjI32j2qLVfo6+lgPi9MWZz1WbVx5cv+0sjohIMgWp
 DSZmDLRJkM3VcSN7+cagUrYwh0Qlb4bolA4MteTDqvb3QZuXUBtfue9+uMjMvi2oqoPJ4fc2tW7
 JSrSYd80WTa9KAP/lBqFlYTsTxylgRJ2WbHik1M+vihnSXwYFt8nxSXrnjIwURvjjtI4G49VNRZ
 WiaBK5KAvdAsoJjuUPNUy4
X-Received: by 2002:a53:ac8e:0:b0:675:617e:6c2b with SMTP id
 956f58d0204a3-67d896b224cmr995829d50.77.1794563959602; Fri, 13 Nov 2026
 01:59:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109142319.73878-1-philmd@oss.qualcomm.com>
 <f24b1be2-d114-4760-a7a5-e292951661e7@oss.qualcomm.com>
In-Reply-To: <f24b1be2-d114-4760-a7a5-e292951661e7@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2026 09:59:07 +0000
X-Gm-Features: AclHuK9cy4bEn0EetVO-IzdNownmghV9yBrnWzcMthw8JnN-B6YMpTRHcUJHOLs
Message-ID: <CAFEAcA8ub6f9D+yBnhqOG+7jTD7uz0k_8FPnRd=H7zTvWgPo1Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Kick the other vCPUs on SEV under TCG
 round-robin
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Lorand Marton <lorandmarton.dev@gmail.com>, 
 Ashish Anand <ashish.a6@samsung.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 at 07:28, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 9/11/26 15:23, Philippe Mathieu-Daud=C3=83=C2=A9 wrote:
> > In round-robin (single-thread) TCG, all vCPUs share one
> > host thread, so qemu_cpu_is_self() is true for every vCPU.
> >
> > The SEV helper used it to skip the kick of the issuing vCPU,
> > and so skipped it for every other vCPU too: a vCPU sleeping
> > in WFE is only woken when the RR kick timer fires.
> >
> > Compare against the issuing vCPU instead.
> >
> > Fixes: d238858bff60 ("target/arm: Implement WFE, SEV and SEVONPEND")
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> > ---
> >   target/arm/tcg/op_helper.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
> > index 6a673e5ae6e8..173dd0e5151a 100644
> > --- a/target/arm/tcg/op_helper.c
> > +++ b/target/arm/tcg/op_helper.c
> > @@ -470,11 +470,11 @@ void HELPER(wfit)(CPUARMState *env, uint32_t rd)
> >
> >   void HELPER(sev)(CPUARMState *env)
> >   {
> > -    CPUState *cs =3D env_cpu(env);
> > +    CPUState *self =3D env_cpu(env), *cs;
>
> While rebasing I noticed I did that 1 week before latest ARM PR
> and this conflicts with c5ec1bfad103 ("target/arm: don't pass env
> to the sev helper"), then I noticed the previous 8def1f30d5d4
> ("target/arm: hold bql when SEV sets the event_register") which is
> a distinct fix. This patch is still needed but need this to be
> squashed now:
>
>     -    CPUState *self =3D env_cpu(env), *cs;
>     +    CPUState *self =3D current_cpu, *cs;
>
> Or even simpler, check @current_cpu in place (no @self local var).

Generally speaking, I think we should avoid use of current_cpu
where we can -- it's an "action at a distance" global variable.
If this function needs the CPU pointer for the current CPU then
we should revert c5ec1bfad103 so that we pass the env pointer
to the helper function again.

thanks
-- PMM

