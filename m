Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp3315678lfq;
        Mon, 21 Feb 2022 23:22:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYZ0WameXlmvBTSqR7klDukbl6rwJ3NaPdMEPn9VWRJVBBh9NEi90j2EldaJI8Ec+QwNoJ
X-Received: by 2002:a05:622a:1787:b0:2d1:83d8:411f with SMTP id s7-20020a05622a178700b002d183d8411fmr20828064qtk.10.1645514520780;
        Mon, 21 Feb 2022 23:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645514520; cv=none;
        d=google.com; s=arc-20160816;
        b=juHaAAzmunVGSI/0iK9ubZl9lHqHlvyRbO5QogIUt1MPgpiaN6ISc8JkGBe+pwjABH
         kE4wPopUWKuAuFx1JjctXwXb1do459+YdhEe44+IEV6hU1URkmOHV6xAcQiuNnaxCHX4
         XlPCFqLacWxAOUjIgLRHjpKUhQDlsGr9kwNNxZRJcPVoOrZnM+g6Zfo2QHeuYjOPDO/e
         RhDKKa/+O9541PK4YzK+SWm794SvCqPfSxvl+I+53oTwesA4fbiP6FrN3PoOZLW2yQPI
         3yuKWxIrODFsDEUUJUx3VSpZ2/tzUBhmzAosdbEGupUPXxc2qZfc3t6EdiaGGesdsrEe
         FlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZTxq2O7p3CYHqAUrR+1cQVu5DPU0BJmWgFrTXPzw/+s=;
        b=fvh2RDXk+mMf336cbGuQqcgmgE1ahDziGt2yqhHuaaR69IGKGj86RnXQllLB9bAaBh
         BxhZsCd1opiEQEb+yIlGGCtcQBliqUwD/seBAxQmyDNDnGu5XJZtc2dyZ7mlZhzXoffX
         f692Y9PqME1KkZ9Id4ZfuyYWshlMcprz3cnsJN76OYYj9CjuAD32IwF1cyfc9ZWsL2+l
         2AXSciAvrPTUDHae6d4kdjlBFPF/eQ5hm+yVTw9/Q+7r0gTUQSRvXiYJu2H8lm2J6Onf
         +21ioaNoaX2rsKPxEcTP2nbxKcOWoP3TX/qVTTxn5sEJJp4ljRyPXSiZS0IkEEJ0EQy2
         u8yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=WiymcIE+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si17031909qta.570.2022.02.21.23.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Feb 2022 23:22:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=WiymcIE+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMPUm-0002Bm-4H
	for alex.bennee@linaro.org; Tue, 22 Feb 2022 02:22:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMPTn-00026M-L4
 for qemu-arm@nongnu.org; Tue, 22 Feb 2022 02:20:59 -0500
Received: from [2a00:1450:4864:20::632] (port=33348
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMPTl-0002cm-LQ
 for qemu-arm@nongnu.org; Tue, 22 Feb 2022 02:20:59 -0500
Received: by mail-ej1-x632.google.com with SMTP id vz16so40071188ejb.0
 for <qemu-arm@nongnu.org>; Mon, 21 Feb 2022 23:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZTxq2O7p3CYHqAUrR+1cQVu5DPU0BJmWgFrTXPzw/+s=;
 b=WiymcIE+5eK4MtzDUrXKHdDlOUuC49V9dP1O3WKp5OTxzB3FYGeqOiT6jN+fdQ37gP
 JANs1dsVtonnDMV7hvi/Qvm99ZxGUoz0yycQ8lSbRE2+k7QbkccZGXIRvFGrgnW98qDS
 JXg/jaCpQQGWGtJL0LUNQXzjp/6vtDdnAyYWAOqTZLpEsieTq+AI35eIcEs5NiQYBNuj
 wjVODA1aLX+5AGDxH7pU1PoTa/SjFueyvj4RG47RSf7EhXasO2uDYmwI+AZP39K/C64b
 Jks91OAr44iWdPPUWHsm5b4OC/Me2eTFdOTVyU7yLP2ngGKysHyRV71IGfmLTyMZMC4c
 mCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZTxq2O7p3CYHqAUrR+1cQVu5DPU0BJmWgFrTXPzw/+s=;
 b=qgTDBC/AbOAfU9tGZnHY54oXpDEoHaAcWI6fNuCam3VZe5NzRYE4jYoVzwkOcBd0+v
 1uUHpSf3FnU6hX3vRSZjz6+fjQLM2rUCdFF4ZfGqohc1TnK4ArDHC3fxJgpaJomaXGFr
 lL9jaz1nGGu05r6aoJ1ErigXkX4bokNo7ChQwK4XIIgWwMNhKFswitKIgSAckenEGPJ9
 PpM8vkhuIhY9nZyjaCGURZstQRTbJOfcOU6LdBt/3072YWcMpYDEHef5F7jZqV5KeVJe
 KyRLfUSs7DN36n74jJigJMwh/DiOUI6NlZBpm/Jr1VKtDvtOKmG5IBDQLfXmF/CKboUs
 JDEQ==
X-Gm-Message-State: AOAM5317IoCl4PG3PkMr1/iKHpsk7/wu35CX4LcNTazEGyvt8bztJPN0
 8wGPZVV5MrJgPzx8JJdHaOfIXhC64d1+bIkDZYVuPA==
X-Received: by 2002:a17:906:abd4:b0:6bb:8aee:92c5 with SMTP id
 kq20-20020a170906abd400b006bb8aee92c5mr19048187ejb.660.1645514455646; Mon, 21
 Feb 2022 23:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20220221191323.617323-1-liavalb@gmail.com>
 <20220221191323.617323-3-liavalb@gmail.com>
 <alpine.DEB.2.22.394.2202221154300.697295@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2202221154300.697295@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 22 Feb 2022 12:50:44 +0530
Message-ID: <CAARzgwxC0g6HWGY_=roU5kbRbDR24vNDrwXAsSVXDkBReZY7sw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: Liav Albani <liavalb@gmail.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x632.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CmrYnhQAwro+

> >
> > diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> > index 68ca7e7fc2..756c69b3b0 100644
> > --- a/hw/i386/acpi-microvm.c
> > +++ b/hw/i386/acpi-microvm.c
> > @@ -189,6 +189,11 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
> >          .reset_val = ACPI_GED_RESET_VALUE,
> >      };
> >
> > +    if (isa_check_device_existence("i8042")) {
> > +        /* Indicates if i8042 is present or not */
> > +        pmfadt.iapc_boot_arch = (1 << 1);
> > +    }
> > +
> >      table_offsets = g_array_new(false, true /* clear */,
> >                                          sizeof(uint32_t));
>
>
> We should do the same thing for arm architecture as well?
> hw/arm/virt-acpi-build.c .

Probably not since the spec says
"These flags pertain only to IA-PC platforms. On other system
architectures, the entire field should be set
to 0."

adding qemu-arm for confirmation.
