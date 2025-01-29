Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3721077njk;
        Wed, 29 Jan 2025 04:18:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpfRpQzUuz+RlPZbKPK8wAzYjAPunRl1Car3Xg5oLjf/Qsv/kKNepo5UT1+4EjqcaI8SoOgMNkx8wpug==@linaro.org
X-Google-Smtp-Source: AGHT+IEKWHyT+dKv48KpuvJjnHG+YwxKhGBRW1kYhsWNoh91ZJVB7RncB+cZ5kuf93pj5HLnISL7
X-Received: by 2002:a05:622a:1b1d:b0:467:67db:ef7f with SMTP id d75a77b69052e-46fd0b68d6bmr52963981cf.39.1738153098008;
        Wed, 29 Jan 2025 04:18:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738153097; cv=none;
        d=google.com; s=arc-20240605;
        b=O8b3qngiTt11of/i9s7RlfzSqnMmtRuYCZcXSEM+swaMs0kDERBEtrndLaeamo5sLU
         yOekbCy28OBuGvQPVCKroSi0YWvfe4m7GCx97JxLIbgr4u7Q22CdNfsK/RX2DVhTcQ1+
         e22lHNeF88mrAlspKGQs8VNj5QtoSEj2/8JlaHain/5+QZs/DRIaEoaIJC/HVFayCtZt
         WT2ESumifg9UycDMpxC4be/fmFKx5G8qGwgLqimTi18XzvIcILXZzevZPlbub7wys2im
         2i1Ip2f+UHerrGZJNEk21zj7TlzYyHg9UJ3mNoWfSHVFoeTlsnGa+qPZgnPcsiz+RzCP
         Kzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ptZga5H1gf4FFJ72Pk0ns03O/gjUlQr7tb0icgzWqxs=;
        fh=Pok6wmP/sqH0InTRUl8DfGR/2gQ+Y6TbEz+GM5seuJk=;
        b=WhaRWeGgKJ9goZnXvaC7m4kMbWwVPRbB+kPtRNwEo+/5o5dtCmzqtqFBl+ngGZK3EV
         uu5qvQYDqfZyxyTkvhKoWw9yKhWH5sDbRIkRTL8lPsVgCdg+NaeKLncmLIJQiKuVY0g5
         los/PkGWZNqDLfrCMfJNUnkfW31mDCPHmlNaXct3VRQo8dE7/oHFPTGmfbqb+HR9lCPK
         DoY8QM0UgoUu2sNxnq8CVgQ6r6xBFA27P7p8OFaJWVTG83SKcyFG3vfLyLDywJTqTOBV
         XbBwaxwTE0keMIX1OR1vO4pV0Xs995vIqbI0IM3JX7CwpKrM2vMnqB1SvgF9IqV3p756
         FIzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ls3fcz6c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba75a2si158469551cf.530.2025.01.29.04.18.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 04:18:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ls3fcz6c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1td70w-0002Xc-9s; Wed, 29 Jan 2025 07:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1td70v-0002XT-7i
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 07:17:49 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1td70s-0003u7-UO
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 07:17:49 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e46ac799015so8970769276.0
 for <qemu-arm@nongnu.org>; Wed, 29 Jan 2025 04:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738153065; x=1738757865; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ptZga5H1gf4FFJ72Pk0ns03O/gjUlQr7tb0icgzWqxs=;
 b=ls3fcz6c4AR3rZNOD0/G+nLjEETmvgol0fNpSSc89Lq1ILUMtOOPdxpFFRnjSIDt2z
 ZpzV4bht3c/oFUjdKPyhSaNPMPHCd8G2/go1hhUwG/F8nWJsc5yaDHjReZDVWgTgpWZG
 6X7+pq0q6WOJWEZ2Z7eIfpcx98+wrMqdS9XKxAlREIlX3278DJ9orfjWuakl4xnGDynU
 ZsYeTrDkmyYg1/viZMMeGcyQMTkG3u41DYDl88sUswPR/0pw7MkOBKmPzbI+8Oe7NFAV
 7r7h8CkOpNGM/oajtAdWWYRlchOrGMZ4CnIxmCbrASQXXR/dw/rD10CpNwx6ZPV6jejW
 N7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738153065; x=1738757865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ptZga5H1gf4FFJ72Pk0ns03O/gjUlQr7tb0icgzWqxs=;
 b=kkdFCEL4KgTApXB4fDT/+E3bzvs+p48qPiIzXxmkM5YQqE8pvklTtsPeP0CaMA29rm
 PoIJZFgtw0hqhUqqUDHrOTS7i9z+XjHp/xgKwjWaXt95Q206aY85Z3V0S6DL4ZIFIHQl
 GBhZf3bD9y2XWLDQrJd/E7LH5j9i/Y2Y/aEN60f7g4i9BduE2liIx7FvdANBe1ks+v7m
 rZyFaZjwHbZpJMkuKdEF8nTHwnZohHpKtPjhjPua9qQAshzoHh23RIqPpVbqI+t4IBYF
 X8LjgevKP12oV6YMHB1Dr8OT9b5mzCUJEv83B9I4RpxJMtjqCf/0w6sAE6rKPFWHLGvx
 NobA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6J9yThcInhOAezl+n//FTC3Y3zHJbNAMOA3U1ooN4lBczDpRp+kV4Dhon6YvW2BhTiuZyNrM2Zg==@nongnu.org
X-Gm-Message-State: AOJu0YzMUBpshbxrskDu3ho9ZXJhdRWgYPZlbgvvdL1uEWG3lGf/k6PD
 02iyLjsDwO5qfc53Ftva6ruMOrQmDMtnlQETGGaod9R7gwVR27ZlDxZx5o842tVeETtjqBpAP80
 GY/cz3sDkMLnWtbbT/0g2NnAPEWJKghdsm396SQ==
X-Gm-Gg: ASbGncsQKfe3nu1+a28uVZSkZObLu2QeERoYEfbLXXq+1bxvuJG77T/x0agiZFBE4tl
 DmsziBjs90ZSRoYW70OtugLEn+JQrFyFKgDq5nT6/kLIREF8h0wf/RP+HobgQOJl0fJihL1GeLF
 zHVLvIJe4V
X-Received: by 2002:a05:6902:118d:b0:e30:ebdf:9643 with SMTP id
 3f1490d57ef6-e58a4a9a3ecmr1921228276.8.1738153064772; Wed, 29 Jan 2025
 04:17:44 -0800 (PST)
MIME-Version: 1.0
References: <20250120203748.4687-1-shentey@gmail.com>
 <20250120203748.4687-6-shentey@gmail.com>
 <CAFEAcA_NBPqbOrVJw=bDC6=dTGKBKe42XoXMm82jj7+pHEvW3Q@mail.gmail.com>
 <4EC5E99E-804A-4154-8D61-22D1358C0F6B@gmail.com>
In-Reply-To: <4EC5E99E-804A-4154-8D61-22D1358C0F6B@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Jan 2025 12:17:33 +0000
X-Gm-Features: AWEUYZmPJdkyfLwL73Fx_J6ci3Z3l64ovGh6AHYuylD5FXPAiehSzDL19rKViLI
Message-ID: <CAFEAcA8E4Ao_bJTxKzJ_kQ1n+Teqw6brmJKFN9cFpraM6jTYag@mail.gmail.com>
Subject: Re: [PATCH 05/21] hw/arm: Add i.MX 8M Plus EVK board
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w6yb6lTpHImG

On Tue, 28 Jan 2025 at 22:16, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 28. Januar 2025 14:29:53 UTC schrieb Peter Maydell <peter.maydell@linaro.org>:
> >On Mon, 20 Jan 2025 at 20:38, Bernhard Beschow <shentey@gmail.com> wrote:
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 846b81e3ec..cace8cf25b 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -819,6 +819,15 @@ F: hw/pci-host/designware.c
> >>  F: include/hw/pci-host/designware.h
> >>  F: docs/system/arm/mcimx7d-sabre.rst
> >>
> >> +MCIMX8MP-EVK / i.MX8MP
> >> +M: Bernhard Beschow <shentey@gmail.com>
> >> +L: qemu-arm@nongnu.org
> >> +S: Odd Fixes
> >
> >I'd rather we didn't take on a new board model that
> >starts out in the "odd fixes" state. If you don't
> >have enough time to look after it, it seems unlikely
> >that anybody else is going to want to take it over.
>
> I'd look after it, but I'd also not raise expectations
> regarding commercial grade support. What state would you
> suggest?

That's
      Maintained:  Someone actually looks after it.
(There's another step above that which is
      Supported:   Someone is actually paid to look after this.)

thanks
-- PMM
