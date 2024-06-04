Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2672898ejs;
        Mon, 3 Jun 2024 20:27:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKJ4lryEIk16g6z2sjq037wkZZ5YiKVc6jcQtSm5Sj2UImqRZZZJUxxBYtQ7waQ1OULLbvumgM8o1zC0DVSEHJQ5kB9NlO
X-Google-Smtp-Source: AGHT+IEtRLqgzKT5o0xokhj582/Ied/MwlOgokHtYSpcXSeqTI8sUeoyRUAAQJkJ3BcLWV1PICK3
X-Received: by 2002:a05:6102:370d:b0:48b:cc9e:7b5c with SMTP id ada2fe7eead31-48bcc9e7d0emr10228111137.3.1717471663608;
        Mon, 03 Jun 2024 20:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717471663; cv=none;
        d=google.com; s=arc-20160816;
        b=j5gTOKQLPeKG4zGI0YDFOigsrYr07Y67cN1Ioaf2+ceIZ/AFt65EgXTWraaedAVeY0
         f+dB08Nf+U08iQ3439+4tYffytP1clGtuNuFQqSG+YlkmAc3duKy2vDTrGMfJBC9SQ/7
         Ag0msHHtnW8M1zJqqHHKgu5Sd1T7EHs0aU8AYH/ZlBDo598zkMBqHAu2BzdjQKMANUqS
         oc1+b4yLao80ZJlc5DCGA0Ijaul1xq8ZAZHUhNzVA7uGqMFTvRHPYBzqf1xqSGK68Zrb
         mSBbTd7hGIUBjUPdKVbdoZLZpzdvB4aFQgZnoO4uWWKTUJpF017Wwee7YCY5D0EwTnBB
         pFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VFBi49EVUbzCfZZdNzdbeX+72Edejgi/LpWGcb1wyBE=;
        fh=at3a1k9pQ+jN5Xw+1ydGV1R7pOuKcAfyjOydbQgUjNw=;
        b=qn/jTFX91XRvg6WAzYytC7AwhnZ0oMNCAqI0kJsm9JypDTUM06VdC/WMMIN+JJ7iBl
         oPv8jBN/eX2fmQn3XbflhFYEpYz7Z6r0hbKLcoJP8zdDROFzIs78zJOVO972H+vZO+ZE
         1D9cAt71/2DTtM6vJZ0GKnV8t1gCQ8r/wmb7+/SH02zLS6nis+GFgBPG08q2FjyEtFnN
         a1/QxZvNCPCeFDdXosKcFkVZ6YxWKLCheMhtfTCRl1HajaLxARkJCLliuAR+WAj5v/e/
         8T6cERt8MkjmUjjMUk+IxV91iq2A83iWayRhFtSauXXDmc5ElyEABozOKSnT9Hf1iwNL
         Q5NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=h9JRNoEH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f32a520csi973959785a.563.2024.06.03.20.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 20:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=h9JRNoEH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEKpN-0004su-Lz; Mon, 03 Jun 2024 23:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sEKpM-0004sO-4t; Mon, 03 Jun 2024 23:27:12 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sEKpK-0003J9-Jc; Mon, 03 Jun 2024 23:27:11 -0400
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-4e8a6159479so1963645e0c.3; 
 Mon, 03 Jun 2024 20:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717471629; x=1718076429; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFBi49EVUbzCfZZdNzdbeX+72Edejgi/LpWGcb1wyBE=;
 b=h9JRNoEHCnCsBbB4AP/Fmme7237lIjb8qVbjOF8BEkno/JJbg1fNfgmocQwQvnjTYo
 XQrNZKzLeRXPexds2hK/AVcP/Y2rirX6R1Qaf1k3Ht7GlGhdssfKaKU2oTVwEsY456/e
 sX/K2HGG+rWI2bmPF2teYGdWD1qo35h+eSfWneKYhX3YqK/2HXVEnIFix8BtUaKBGgYM
 Oqx4WVnakt05Vk2XPLo2wsZGfULJZo1mqFlb+m/lRXuxIzVyyh0ta4skuglD4ticOlj3
 qEYxHd0ZkNmn30D3Px6CiRte7nOZG7niQAkuBlCY00/nHFTfLhdSF+D//SCoLPqpxpVT
 Xh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717471629; x=1718076429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFBi49EVUbzCfZZdNzdbeX+72Edejgi/LpWGcb1wyBE=;
 b=unF1PnK+wacMpnEmQc9PPuQLOir7bz2fSDyauuUot+bseXVQEycIdH4fVWN8FylrSm
 RvGLQl9soUC4jK00z9pZA0S3nPYpkmT2lygnqrD4fO3x6vc8p5a+C6WwlAcOB63Eng7v
 xDASCLsGhKCiYfS09ir4wbp0RZo/6PiPdK9Q6ZIZnfn4X3MP4Rw8d1S0NOBpI0XxUScl
 835Stxn57+6xhDAGGmRScrBcbPrWaFxVG0TOr81G/76QBmGBIIVL+vzedPiWsKPE14Xo
 ytzw04Ne5o04DER/dizhNb9fOH2cHs90nk1dHsL0Ql8vIbImHhvA7d8HVa91oT2vIh68
 7cbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiNw11didSzQVC7SiEC5DAKqxg87jWSEz7rQj/Zh0Dbwqaagl7W72/+WZsAQuzcRHVCmc6ijLiMdAFKKe+CaDtrjO+18WIARolXrvbRbNmfCJ0SRrkIuIy+L4=
X-Gm-Message-State: AOJu0Yyh8KnZvX/cqyVs6tRWYCeYiGizGBAJBMU58kjwGvMF8p6bno+D
 wtVDjGB7cRxtP3hfd66EB/fA5pWdoZI6ISjAJXm2itnYU+fRfxjvdUbU5ACEvAjOMI+D9oPG8PL
 BXkllGLpN8POdoyl8awc+prTgAg4=
X-Received: by 2002:a05:6122:d8b:b0:4d1:34a1:c892 with SMTP id
 71dfb90a1353d-4eb02e7ba68mr11172377e0c.13.1717471627180; Mon, 03 Jun 2024
 20:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-11-sunilvl@ventanamicro.com>
In-Reply-To: <20240524061411.341599-11-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 4 Jun 2024 13:26:41 +1000
Message-ID: <CAKmqyKOWfOSyRia4N9KtMwFj=40Optk0DLX7RLA==qKJEd3X8w@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] tests/qtest/bios-tables-test: Add empty ACPI
 data files for RISC-V
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sia Jee Heng <jeeheng.sia@starfivetech.com>, Haibo1 Xu <haibo1.xu@intel.com>, 
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2HjQl7XzVZfl

On Fri, May 24, 2024 at 4:15=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> As per process documented (steps 1-3) in bios-tables-test.c, add empty
> AML data files for RISC-V ACPI tables and add the entries in
> bios-tables-test-allowed-diff.h.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/data/acpi/virt/riscv64/APIC           | 0
>  tests/data/acpi/virt/riscv64/DSDT           | 0
>  tests/data/acpi/virt/riscv64/FACP           | 0
>  tests/data/acpi/virt/riscv64/MCFG           | 0
>  tests/data/acpi/virt/riscv64/RHCT           | 0
>  tests/data/acpi/virt/riscv64/SPCR           | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>  7 files changed, 6 insertions(+)
>  create mode 100644 tests/data/acpi/virt/riscv64/APIC
>  create mode 100644 tests/data/acpi/virt/riscv64/DSDT
>  create mode 100644 tests/data/acpi/virt/riscv64/FACP
>  create mode 100644 tests/data/acpi/virt/riscv64/MCFG
>  create mode 100644 tests/data/acpi/virt/riscv64/RHCT
>  create mode 100644 tests/data/acpi/virt/riscv64/SPCR
>
> diff --git a/tests/data/acpi/virt/riscv64/APIC b/tests/data/acpi/virt/ris=
cv64/APIC
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/DSDT b/tests/data/acpi/virt/ris=
cv64/DSDT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/FACP b/tests/data/acpi/virt/ris=
cv64/FACP
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/MCFG b/tests/data/acpi/virt/ris=
cv64/MCFG
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/RHCT b/tests/data/acpi/virt/ris=
cv64/RHCT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/riscv64/SPCR b/tests/data/acpi/virt/ris=
cv64/SPCR
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index dfb8523c8b..d8610c8d72 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,7 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/riscv64/APIC",
> +"tests/data/acpi/virt/riscv64/DSDT",
> +"tests/data/acpi/virt/riscv64/FACP",
> +"tests/data/acpi/virt/riscv64/MCFG",
> +"tests/data/acpi/virt/riscv64/RHCT",
> +"tests/data/acpi/virt/riscv64/SPCR",
> --
> 2.40.1
>
