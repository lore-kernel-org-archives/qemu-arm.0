Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3011815njb;
        Tue, 18 Mar 2025 08:30:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjqQ1pnj3i4R2NlhaTulgP99R5vP7rpPQhfsjPZJPd71YDYq7yeQ7LLj3GwjAhwut5P+WwxQzVOANmOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHRNLsQeOleoclzKPcTaGZ9a9oRwgrQddaLDDxutksgwT6gmatfzbZZ1RlR4+sS/8m3QPTB
X-Received: by 2002:ad4:5946:0:b0:6e8:fe60:fdeb with SMTP id 6a1803df08f44-6eaeaa08163mr240066486d6.17.1742311812426;
        Tue, 18 Mar 2025 08:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742311812; cv=none;
        d=google.com; s=arc-20240605;
        b=SCCOgpj7vfybfTEYY9beWisFBfcdKU6xFVH+CaiYnx7RX4pm7ZNFfsHOvdfviL282e
         hD881EZm6izRfzq5QdPMxUvPd8IQYdyYO9Wp7SPRYvvo+RomYWr21dGi9v0HG719t6Mg
         PbjKNGWFhCJ4XuCT/BA7rFg/IVEjLDFJ0rYpc5gWAbB7Gn+5wT2TvOjRfJr7cPrCtRIg
         5lPiWCUc9h1OEfxzGoTFsdJ8cIP91H8s22eF6s71Zixu33gDMY7kgnZZ1K/2UJGWn0+e
         SWagzjUssBipNRvZJIavNaBeGmmtnXCRxYNz4E/jaE4aJY6yVWVAdBAjape98BR2c3Gk
         eKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RzcYsby2Qz/PBO2uDcctGpE87+/O7tdb9aGwayLSNF4=;
        fh=OeY/Jd4dXIC/Npz2Xzh/QoORivkf/qQ1OMy1PJF75kc=;
        b=WY39XVJZU32lX2FkNO8fXlAVm03gXLtoEy4VAPFVZfLIMfMhvOI/GfxrZdRtDKTRjI
         JQWZVaw79dt7CzqWiWyZMJK4EnlgfebcWgem5R2BCN1BejU6d+G2BKbzHPJJe5iDwH2I
         mU3tB8GaDiJxO3rfU4GaGN3KhEnlpVgUy4IQKD67wlDsvh8y5ujJliiQUVw6X1piEzTQ
         AhpPyNAjz6S9naQLVhIjdvXWm8OXqFB0rg6+l6uwhbG8Vi0SM4zh6W5yyUJZCC+fNg1y
         DMYLJ9g1uGx5K0eUuot2glWeZJSPRL74XCPmdxtxroE2zndC0+g7d9x6bio1DhVnEr/M
         B8Cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a7FuoUcq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade36f30dsi124020216d6.442.2025.03.18.08.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 08:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a7FuoUcq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuYt1-0004vB-TU; Tue, 18 Mar 2025 11:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuYsm-0004pk-5R
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 11:29:34 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuYsk-0003WV-EZ
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 11:29:31 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e573136107bso5435304276.3
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 08:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742311769; x=1742916569; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RzcYsby2Qz/PBO2uDcctGpE87+/O7tdb9aGwayLSNF4=;
 b=a7FuoUcqfd3GF0TDpfbOjEoYwOCnyXQtoDytqgPxCg57YY/dFcSH0vBfDCnqyvg2B5
 WFleic9yV0O4Hil3zBG8Af5DNmqD2Ut/ZO+Po3uRiszl3pjRhMpQAT1W6geVfVlg75vO
 rnp0mWNt0c4dliwKJQBg89XIhgVI9/gCeB/KFN8pGrvaLU9qvsJOs1zS4wYlhCENVnQi
 332q0TGretzTD7o7iO7LcWjYZibYr5pGRohQwZ9zLAhb3oJYK1uUbSAAwcYOM9PCvYe3
 0Pm7hDaou/gQhjYpb/Zig6ojyXPGtD7VbM/8xUkrkDVEseAUBrsSeWdRCQF2Abjk8M9O
 FMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742311769; x=1742916569;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RzcYsby2Qz/PBO2uDcctGpE87+/O7tdb9aGwayLSNF4=;
 b=ZxwJ3Cf/xt04bCuPgpJYznZzMDkPa5y2do5Q47kjL856CFpTWjLjfR5Ow4vDRN4bh8
 tGgXDsyRiU/z0lPW78VqYuNxppPHb2pr4N64Fm7nQF1hdjRMXq3nAqkXpH3KTepgaVhW
 vqyVx5AuZmwHPz4rkYbVn2p3Bcxqz0QQGNhOkpNCOnWmXT3dC8eumaA5WFj6B/kRCZ8b
 lqIAKTQFlQnPHNy6/KPEsgLxp5J1CkRI0nMkqVwguz5/TBqCnYF5NSWs26UusmEgQBTj
 4xrO5DYby3hJA7odrkNf6GlKHYuCld0iRmm53NFzaxG/A6n09eYEkPVQW9A7yIk5MWHR
 07hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOW3XqJJjL6vworsfktxiYlzuumrroZmgmrOLdku33lxoYcwxr1gZOGB8KMIgaoJXj0K3dU7J9kg==@nongnu.org
X-Gm-Message-State: AOJu0Yy5rGFjjKG2APAnYJnidYxrt6prjfi0Rfph6zIneupoi5bRihyD
 DQpwBVr2vsA8QUjpWUzkSfvfh8Vmc/vV5J7vhLupWwPp0vLcBskJ7sMzxrefGLPWjYIaAArF3u0
 ZGWody5TQWENWnpRyss0nJoYltRs4+nyWkFkuuBlTp6HFbqT3
X-Gm-Gg: ASbGncvBh7aupGgsWKrNI+yET0vVVXldA3wKleN/LIIxo58+ynmEh/vk00fGM/0t7zx
 /5Na7jXtjHWmUn3slIBmh+8tu6Mha9KPN60fjdGXp7UhRAF65FJJfJ/1s563QDPqH7ge1TI2GC8
 6yjJK5JYDz19uZt1A3sAPryKnS9ls=
X-Received: by 2002:a05:6902:2213:b0:e63:efc9:721c with SMTP id
 3f1490d57ef6-e63f650d07amr20959132276.16.1742311769321; Tue, 18 Mar 2025
 08:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250314183224.21822-1-shentey@gmail.com>
 <20250314183224.21822-2-shentey@gmail.com>
 <CAFEAcA8DPonw1+GsBJ079AfeSyO9=3B93P1yj3uLTBzF4uf0Ug@mail.gmail.com>
In-Reply-To: <CAFEAcA8DPonw1+GsBJ079AfeSyO9=3B93P1yj3uLTBzF4uf0Ug@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 15:29:17 +0000
X-Gm-Features: AQ5f1JqgozX_Qt0rSTlFI0R_XebNnbZswWr4Hx8WBcVJh61Tq8gbY4hWYaMypSg
Message-ID: <CAFEAcA-jbRt7x7w-gA5KEBRK8_kHgHRcX4ri+vn-umz2wAsGxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/arm/fsl-imx8mp: Derive struct FslImx8mpState
 from TYPE_SYS_BUS_DEVICE
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
X-TUID: WwKafgEbhYrO

On Tue, 18 Mar 2025 at 15:27, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 14 Mar 2025 at 18:32, Bernhard Beschow <shentey@gmail.com> wrote:
> >
> > Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon machine
> > reset. It also makes the SoC implementation not user-creatable which can trigger
> > the following crash:
> >
> >   $ ./qemu-system-aarch64  -M virt -device fsl-imx8mp
> >   **
> >   ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread: assertion failed:
> >   (n < tcg_max_ctxs)
> >   Bail out! ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread:
> >   assertion failed: (n < tcg_max_ctxs)
> >   Aborted (core dumped)
>
> > diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
> > index c3f6da6322..82edf61082 100644
> > --- a/hw/arm/fsl-imx8mp.c
> > +++ b/hw/arm/fsl-imx8mp.c
> > @@ -702,7 +702,7 @@ static void fsl_imx8mp_class_init(ObjectClass *oc, void *data)
> >  static const TypeInfo fsl_imx8mp_types[] = {
> >      {
> >          .name = TYPE_FSL_IMX8MP,
> > -        .parent = TYPE_DEVICE,
> > +        .parent = TYPE_SYS_BUS_DEVICE,
> >          .instance_size = sizeof(FslImx8mpState),
> >          .instance_init = fsl_imx8mp_init,
> >          .class_init = fsl_imx8mp_class_init,
> > diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
> > index e1a7892fd7..f17d5db466 100644
> > --- a/hw/arm/imx8mp-evk.c
> > +++ b/hw/arm/imx8mp-evk.c
> > @@ -37,7 +37,7 @@ static void imx8mp_evk_init(MachineState *machine)
> >      s = FSL_IMX8MP(object_new(TYPE_FSL_IMX8MP));
> >      object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
> >      object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
> > -    qdev_realize(DEVICE(s), NULL, &error_fatal);
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
>
> You want sysbus_realize() here, not the _and_unref() variant,
> because the device was created with object_initialize_child().

No, that's wrong, we create it with object_new(). So
the _and_unref() *is* correct, but this is a separate bug fix
from the "should be sysbus, not qdev" bug this patch says
it is fixing. Can it be in a separate patch, please?

thanks
-- PMM
