Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp106289njk;
        Tue, 16 Jul 2024 04:29:11 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVPDZMTqGbYZGmA2qof+bAkLu+o6EtgXxEwlr139xyPSAC3zb4ETsLUKoVauwNEUya7GvV9Eajdf8nPeF60ci8Xlv0J2Z/p
X-Google-Smtp-Source: AGHT+IGbSjQoWybbSIvtLGrFTlwuc63c2Y2PNKRKcI0OYBrUqYWe1B+JTRRit7T4AiA4RmZyGk2l
X-Received: by 2002:a05:620a:1a06:b0:79f:2f8:4e73 with SMTP id af79cd13be357-7a17b700d3bmr234298585a.36.1721129351539;
        Tue, 16 Jul 2024 04:29:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721129351; cv=pass;
        d=google.com; s=arc-20160816;
        b=avKPgWovWmUv3bH8+OQRLQIGTxtxabXlzoLR9n/xiX3gNDOjHJg7ZhYxRCOj4qK5ja
         zpyvzJGy0/xP0oWjb+87qY4x/iSuQU+FAydmHuZVyiIgdbZFWxODf2TY7prcvDfVzjGA
         dlnjw7IC5Pu2trxo0GKewykc+EfkZ6Q+j4wilbSZyC9M5h1i+lXj8QWVCM0Q0SURBj30
         eawqxTKJz4Lq3VjmZhqaNlawggA8Fo8n3h2zVvhl5eRfBD+Ikb1Qs85tWrxecdFdZhB+
         VRaO9E7mK8wtqRiV9L0LcUI6ny6VTaq9dGyn9qwvzmJ1AN2vXdLPpea2sld6M7wPKg5o
         zxuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=noVFkfv9hSGerHgQRa8ex8s8rIJyLdiXzsYUcNYuafY=;
        fh=uDuluAEEgtVU6/EHRFSuVW7Zolk8UjHtIbp3J1XOxGM=;
        b=E/7n3swFDQl5P9FaBF7Lz58+FTGkjJDueL1u1uoEAPlNX3UrZxMKiBgWj1/Wj77xe9
         Qcr0LIBYEce8GMXBb8dZAeEP/hdQaTIF4KgIOjYqS0TqToTbo5r4MHrfpO5c9nP8sV+n
         IwA9Qz5KT7epXf5GCfU7DP5xvLsYlaR7TwjjTgyiWPpCY2FRUc3LCxU60FJDh67s7hA3
         GnSUQk2hA9IL+G31quUsimUZYrmjdllDY05L6uFOGtZ4Mga5v6+imUoUcksbACk61KGC
         08Z5lR61dCH2przgbmweJGbb3AZORH1bxDFEFCq9X+PiNdNC7RP4Kh/ZLy1S81sUjg6n
         qwDQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dbvOKhGk;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21699-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-21699-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-21699-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c83dcdsi721233185a.673.2024.07.16.04.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 04:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21699-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dbvOKhGk;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21699-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-21699-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419F61C2169C
	for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 11:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19BE1990C2;
	Tue, 16 Jul 2024 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dbvOKhGk"
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A187CF16
	for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 11:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721129347; cv=none; b=CUVSUrjTQ5cgH1BgJIIJ1IngyumlaQf1f27Y2jI2rfVuDicmmRfr39g5njpobVIP8OokH3wOIur+upJZcZ1MzZqpqDvlqC+htoud4LVSuSdX8hcOix+xALHgvAfvEAY1Pcb70zeSs7guh9jq20mrMCCvNEdumQfSbbRQVz+xotM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721129347; c=relaxed/simple;
	bh=6ELtJIz8U2cGE9Shq6Kl1VnbZZ9rQ9n/Mgf45UNAHIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvwBHzD4jJ0FSs7TeBacvzByPkhZ/U7dqZseD0isL0pZFLY+Hcc78vPEp/9t+7SLIe/BUxQWBopzsnurwYna3ak6G2zOs/ARh/F80q+JS0Km1VPCYpQKroubVSTiXYd1Aw2/3UUAZIrB2SQlJxeoEiVnCaiOA1pDHHP1DrTgpco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dbvOKhGk; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58bac81f3f9so6226759a12.2
        for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 04:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721129344; x=1721734144; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=noVFkfv9hSGerHgQRa8ex8s8rIJyLdiXzsYUcNYuafY=;
        b=dbvOKhGkQlLY0FNirOT+HntrX4KKZaBMKoPaH7ovPJzmqRq/8r6lhE43O5rjgl6m4f
         OsVcXwv3rlqJ6gFjfgB7hg7lCjMn14UiW292D1fSUFc8gHl/ATMUoxln7Au+s50d7sVp
         jvyTq2QycZ2HaSwr4SwCoqbZZKrDrNOzf7f4AAIXKvLOmpe8qDWMVglSdrJOrbji2juM
         feom7fLrhtqi3A+/P72z8XoIgkiVzODF3FPRwVr1yixbjCJdhk4rtyv9LJ3p1dcMLUdN
         tsTR5APmdCg72UeRnWwnvpLWFCz3rKsquPc3eS6Vy04WgCrY30WxA5i77y4uPfVCe6Kl
         efPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721129344; x=1721734144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=noVFkfv9hSGerHgQRa8ex8s8rIJyLdiXzsYUcNYuafY=;
        b=J9RbCeSpjz/EBMcjVAUwINtKI8bYAAGvckMeCr3Bt+KCkYX/+McuDiuHJ7n7mAbVkE
         L+4jpFWCfBF8EJiZH4PUVYafxGcQYU06SqqwzSN1A2bIdhYuTvytww/5EBnu1sn+oLJt
         iIjhygncEqjUZ1DPsLQtWO/ogpgOkSzQ4FPo+Qmyaswqqz1igcGjJjijrFL159OqTYKT
         KhzwMAwVIh4bZkFv8hKKV/9BBf0LBvzfBWfPOD13ISh0E5hIbkMyDo+9/fvC3VPCnUjQ
         F25MFtt+0z3FidXwCwHCCeFtXtoyb1LdUgS8mWqmbYJ960AVUoPNNOxYOtnXGp1Ns+Hp
         6v3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU++LC75t51NII2YSS3sLcshqjVjvLG04en/fzzJxIu388ac/FAtGLIpe26HfmODpFw4cYf4ZBW1Lk3nAqSjh+dEK9z
X-Gm-Message-State: AOJu0YyoOG/Df6tgSUhDgoU4lI2DpfBMH7BMIb0iX9L5a7Ie4twy/P23
	b1LYGmSz4bnU8FzTKPu16usaucejIyY1G2YWVacB1QbPfwc8LdRK56Zj+wLbCuMxsBOBMAnozBS
	sMwdzgeODa2mNnI5e6Iu8sWNmW6n5YdrUVJ8hRg==
X-Received: by 2002:a05:6402:4316:b0:59c:2254:fcea with SMTP id
 4fb4d7f45d1cf-59eee14a85bmr1379462a12.1.1721129344113; Tue, 16 Jul 2024
 04:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com> <20240716-pmu-v2-3-f3e3e4b2d3d5@daynix.com>
In-Reply-To: <20240716-pmu-v2-3-f3e3e4b2d3d5@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2024 12:28:52 +0100
Message-ID: <CAFEAcA-uGXSvv1-+jjwtxEg3oD2a6umqtsNqnLvnkJ-RGnTL4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: Do not allow setting 'pmu' for hvf
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: 1Z1p6riULrQJ

On Tue, 16 Jul 2024 at 09:28, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> hvf currently does not support PMU.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 8c180c679ce2..9e1d15701468 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1603,6 +1603,10 @@ static void arm_set_pmu(Object *obj, bool value, Error **errp)
>      }
>
>      if (value) {
> +        if (hvf_enabled()) {
> +            error_setg(errp, "'pmu' feature not suported by hvf");
> +            return;
> +        }
>          if (kvm_enabled() && !kvm_arm_pmu_supported()) {
>              error_setg(errp, "'pmu' feature not supported by KVM on this host");
>              return;

Typo (should be "supported") but otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
