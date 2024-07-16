Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp54774njk;
        Tue, 16 Jul 2024 02:36:47 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXL5AuaNO3Fhw8CR9xzGL4umH8IQAk9pYD33zB/ky8ZzNtngDJrtlWieeatWt1BLrlKwgE/eCL0QEDDF0YGqvAcnNgHofKO
X-Google-Smtp-Source: AGHT+IFnkFASRKB1QYnSA1efunXIuDanqVjWrQg8WVqgRAD9rEanQrDy2wfgKMkgLEHJnpKwf8Nm
X-Received: by 2002:a05:6808:2e8e:b0:3d5:628a:a41e with SMTP id 5614622812f47-3dac7c44108mr2228061b6e.51.1721122607426;
        Tue, 16 Jul 2024 02:36:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721122607; cv=pass;
        d=google.com; s=arc-20160816;
        b=od1v95MolxN65xuweY8g7G6cIIDkgTYTCyoGUUMwwyMQn84n1G6ks/DKezxbzB7hwZ
         vbk4V9e8LPdhsMrg63VQGNCF7ALKfZ/pJNqL3W9B2Y2Oc/TJIpID34b5hfvzPc3JiMkn
         RomKZKWcRZlynjbGUNA2M387Dh7CmI2NWKLeZl5oKUFVyrowBJOtIz0fFegkhX11XmKw
         +UDVXBztNYYW1L7js1dsTlLEf1QXHs1gSfr+fBLMlIqFrNQhdaXQ1E9XZBmUeUK6fqRF
         8bexv1J7MIZrHS/zZmZ6wHPwwBFmd/ajQLNrXJaMtwEt7dt4SgEsYdmjIfWi4D/BJ2+N
         vfsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=Dc/GStB3d5Kj1Bf0cTf6aqXmkTcJcXLB485vy4LOdzc=;
        fh=uqQ+/DzOhEK4FWDJjQJ562ZVw19Axw6LpVIyaRUhbBI=;
        b=Q58N1HprgP6mZLBPPElNC5bkXrNBUwIx1jc3sEDgdYbFkDN3VoQZAvgjAdQ+HvPzB1
         8RZGFyU4QrpYdhUjfXfRM66AISQFxJkM79ZZqN6W7EocuJf/1hAkiqwuxCbo9S4yTMAr
         2TNh3rz9ZZv24YEUvTOT1NX+hrI/nw2ZKm8StocjCMtHGxDxNRb4EzQtp2RbYILtDARO
         mSYHZqFchKXD/eAs0n6zvpJaa57Oe642SJh40IofJ6s1ocCWcRVm1Q0P1JhaUvVB+lJS
         3jjqUcV6HNG82EDgnB4vAQayN8ISZ1TY3pZRCCqljc1cIDoX6obJMBDEYj0zE3ya8nij
         EbXw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KoYKZkwA;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21696-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-21696-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-21696-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-70b7ece20d4si6811641b3a.329.2024.07.16.02.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:36:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21696-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KoYKZkwA;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21696-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-21696-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0662283682
	for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 09:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE132196C67;
	Tue, 16 Jul 2024 09:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KoYKZkwA"
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94256FB8
	for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122603; cv=none; b=i1JhN1g0GGQqwvcN0mL0GeWSPVLhO02rfGQDimkOoWUGyo9iMCbO1PJGTICICDnPBuONyrmhPpQKKTJAfi0aORXssrzAD0bR0/6SFg0IZ5HHjzAyUKv54GG5PLBoqzBMm4zNH1URbQ2wrCW3nDKh/bdHrwC5rSgWN8wPyrqzanc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122603; c=relaxed/simple;
	bh=TGuE0Csw2AYqDEukFLo4+DbbSxjFnqKhzFKK13SgBwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6JNjD3Uxd7zMm79NyfBOTwcjdhTsQ2y1bzyskl5nKFQUu7Vmv5sjcjD0d6Jyyoov0h+145Talp00YDnDFYfpjHZ6XQpJ9Lg88BRJhYYN3WfVWuAKtmQo91T0NAUoWdsvDjx40zoqZgIvPWltdnaZKHzS/FyaD3cjNj3R2tyF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KoYKZkwA; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-58b447c5112so363421a12.3
        for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721122600; x=1721727400; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc/GStB3d5Kj1Bf0cTf6aqXmkTcJcXLB485vy4LOdzc=;
        b=KoYKZkwAJBYHyMKhq0EPQ40nY09cQ1RYsUUDemrGK1mnoMV5zDyXnZiERWcRetsM+X
         8YB3Dk9e0Kzdo46v61rgDucJ65pVBIxrPhpKXfWE7vLwVmICZT/9eJFTOwwOuY40U1Lx
         Yx/RVAz9TGoFVx4gzQt43Oiqhjd6X2Y1ZvAeBSO1FNbpI02I0tQfLlfy3dwaJw+PtTty
         r+x4E6F2ExONtd4FooYxcZMe0loVB8ARy/+VWcJl9NACCfWPMSlp/3wgdhOo3UGt3eyY
         BjICBg7p4UmfFR1q9p6ixeZ7clXUnb51TvRetVX59144LWhiIix9QTGhhneO8uJYzAUv
         hb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721122600; x=1721727400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dc/GStB3d5Kj1Bf0cTf6aqXmkTcJcXLB485vy4LOdzc=;
        b=dUagTbjaUBxWGtfxr6iBO6bQhyvw6Gp9oHsV7XMokKfJbJ0fgVaM2z7Bow/F3L35Cx
         zH68I2WdxXl7ukjCU6wjnyYkFt7bcjO87UKaW4z3beBevJXhQ4sOBNCj6Nm+voro+9pO
         p+I2D7cF7L6Om4OLfD5Dkxd4HGadS1gszqwSqEkKHXFh8+/7afRF72zT02V6qYRVDFiZ
         03z9CYJex9KWJiFczXj8NrxSPAsQobN2CDGbwHqL4O+iSvuH5jt/NMMQrLbfopCkwNAJ
         IZsf54803Cc8BECkh3CFvpP2nKbE1P6eeR8xTuyevr54IWcAlAb50/XRv6NuhA882g1H
         Td6g==
X-Forwarded-Encrypted: i=1; AJvYcCV3FWv7ODyMXotDOtnC7DedTz9T/l5uWbr8jTLIPxdmTzjy9gc8LwVAURPPeLFwh4UgfLFM1Y0MWiplL9hlUNAZ+KNE
X-Gm-Message-State: AOJu0YzjMuu8CX6cb6Pzzawjmd9PBTwlWkTPR0TgkkxWAnhJC7a7RpS2
	dH11c9L9SSdzHckALwuDCQd8CAmitA9bSH4QHg9rCGs0WCbmeqVe1AQ3pa4huWtm5KNthvG1o95
	8pBVA47Ylxe6BeUYVxaP4khsYA5k6i4xKVO47IQ==
X-Received: by 2002:a50:cd19:0:b0:57c:70b0:d541 with SMTP id
 4fb4d7f45d1cf-59eef158729mr846034a12.20.1721122599935; Tue, 16 Jul 2024
 02:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com> <20240716-pmu-v2-2-f3e3e4b2d3d5@daynix.com>
In-Reply-To: <20240716-pmu-v2-2-f3e3e4b2d3d5@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2024 10:36:28 +0100
Message-ID: <CAFEAcA_Rw9ceo6D1mXUhzAim6FmGKvLJOmOFLdCpgbTnYYiLMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] target/arm: Allow setting 'pmu' only for host and max
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: CCy4C+NtTan/

On Tue, 16 Jul 2024 at 09:28, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> Setting 'pmu' does not make sense for CPU types emulating physical
> CPUs.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  target/arm/cpu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 14d4eca12740..8c180c679ce2 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1594,6 +1594,13 @@ static bool arm_get_pmu(Object *obj, Error **errp)
>  static void arm_set_pmu(Object *obj, bool value, Error **errp)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    const char *typename = object_get_typename(obj);
> +
> +    if (strcmp(typename, ARM_CPU_TYPE_NAME("host")) &&
> +        strcmp(typename, ARM_CPU_TYPE_NAME("max"))) {
> +        error_setg(errp, "Setting 'pmu' is only supported by host and max");
> +        return;
> +    }

This doesn't seem right. In general where we provide a
user-facing -cpu foo,bar=off option we allow the user to
use it to disable the bar feature on named CPUs too.
So you can use it to say "give me a neoverse-v1 without the PMU".

thanks
-- PMM
