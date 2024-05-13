Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp1929135ejb;
        Sun, 12 May 2024 20:56:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxusAE+VV7X/6Pky18nen+XuQLYfFFXLVJfgnwWh5VyK745O5f5IlEuVppLzkX2nRPyZBINk+YIrGM7bJ+7ha5RQjskz/y
X-Google-Smtp-Source: AGHT+IFIr9bxRiT0j/mW6+QjnPCtMZ0EWhoLQ+eTKNjCwt+Zu3RTkW8FV6ZIWaD2CSJan1yKJv8y
X-Received: by 2002:a05:6214:310f:b0:6a0:9388:885f with SMTP id 6a1803df08f44-6a168179594mr112789286d6.5.1715572589030;
        Sun, 12 May 2024 20:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715572589; cv=none;
        d=google.com; s=arc-20160816;
        b=I+BM44blauW3/KQi53e3/fZ0wgKMMaC9KKo8kJEwJIHrNjf/3okq3Q4cVMU3VSts2b
         gGXWcn9dO/xBFOOFKJWpnHZ48net/uBGUv7Z++ehEq04UdvmWpryCrn+TEfTHDTpp1rY
         2FfpFUTs9a5K73Tc9BN1TZXtWccf5CarSFg6xCkQZJwS8jLCkQVvBx/XXA1ltKfs8Jnb
         Q9/OiXhQWUfz9LwD3EhsHFAo+pUfi1EIeC1Dhmis9und8Dz5hVYWahbU2KalRf9vdIrF
         JAnA+JhHL40YASqATko/WSXmjs+he1et8x8taKA90RjQjUHxPGXjXEByaqG0IhZfEm2v
         p12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=03sqOwm5zCap8IA9yNiAEqe6zbS/Z3wNJuNh5s4B7Vo=;
        fh=iZhelkXUlC2Z4R5WIDB3Pg1Veu0JRiEn2VQBuEj3CXg=;
        b=Oo/Yo5GLDbtysQ3QgyaYbHn3g02scj0S885H1S9O4lYxmoaOIwRc8ZUR1/v+E0Ob96
         V6DcDkO39sJ3ijpQoS/N8gS6/TLL8Q5YezmGk70UBxzKi5+9E7bqc1cpcCRpcT6bkIgG
         oMKXtCSkR+LKha3eFgpNahgDz60eL4pBR/5y9L6jb+tWMhdkh9rffxOev0XzjqQg64b6
         P1RgeeX10f35XvP0s+73Xvx9t4U4F/YFMYvjyVNkdD6kEqkBJvuy40qt3dwmkvQX5dvl
         FPdQVaxdvhzy5Pn2GHpJ0erj/ZmZyACGlzzP5ipcxLP2qvbw8GKrnq7nvkH7/G8gR10v
         By+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=mqiyE3iL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f1d7e50si89492846d6.55.2024.05.12.20.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 May 2024 20:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=mqiyE3iL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s6MnZ-0000b7-QU; Sun, 12 May 2024 23:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1s6MnU-0000aD-6F; Sun, 12 May 2024 23:56:20 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1s6MnS-0000eH-21; Sun, 12 May 2024 23:56:19 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-47f1100e05bso731044137.2; 
 Sun, 12 May 2024 20:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715572576; x=1716177376; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03sqOwm5zCap8IA9yNiAEqe6zbS/Z3wNJuNh5s4B7Vo=;
 b=mqiyE3iLOdAIHqMCKEtUSGx25rpNdy+r8KY75e8TSUQed6u4bxAKic8/D9zuX1Zecf
 fyhhRZRrL2xokdj3Ynb2MsQlNiFFLEfYhwrCPNWUsdnGaQe5NjQj5uxLL0W7Us+Of54i
 pCoDmsLpRroV89/Dedt85FJKMolBP6uuVdDXKdPhjZ85ORWYKNKBg+1AaDe8Hjiht/WD
 v3lhag6DyC5MuRlQD94rWk+LSYBl7/UHm0YCs1R2r3FIZLCQlnh1y/juLBfFDCztz6MD
 gH7ggrP8IB5f5qcWS7H5lEYIVdCC2UkoslcEOGFLi4C2vCdl9Tkwd92vuW/+454z4tMO
 w4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715572576; x=1716177376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03sqOwm5zCap8IA9yNiAEqe6zbS/Z3wNJuNh5s4B7Vo=;
 b=G7xb2qZvXyP7pvMdllbYA65WVj6G23lqJ77NO+nL1HsB4po8S+NXuLCRdU9PoBGapx
 ++55scyN+a0p3JAJnWm9/LTqQY6oMfewO9eGRVaQke+Fq/wr5ZX/ibpNVFduCiFHg8fp
 oD01qVsT53Gji0r057WgrG8RHhVHcD2y6boVPZYH2BCHTtuhLOg6UAj7kEMi5MY+5xbV
 pPui4O213yE2tdYCvA9/Ndq0X79b7ZLxSNCUtFCqaWYa5nKE8m1wsbfse/Y1WVpwYrp4
 yPpbjH73EZAYaUI40Yb4REPV8Rz6/gHL62vGDNY7yL3S3+2hOD0ppN2BzUSGjGe4/lBE
 5Xtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX48MuSezdYidiu8YoxYO3jFHoe9gtjc4D4wSQ7C/qFtUimN2kaSDOs+vycesRs66JrYnKVICuAEEg+/d4W6OZSx98RwuI/KlYbt3hOaVAfzEo+yRvIa6QOsSPFjw==
X-Gm-Message-State: AOJu0YwGR+4ipTDa0yrypidtjgGIBEQjOVUvnbEOAt27BMc+f2U/KQ/Z
 cNiTJV9UA3fFJi1xcEqtJTEkIW39jJopkBFy10XfP8KEmtBzxetmJrGk02rJMSAa6o2Zj7aVgeE
 +OnGzQS510uBJldw5IupMrhAidEY=
X-Received: by 2002:a05:6102:dcb:b0:47c:2d52:8c08 with SMTP id
 ada2fe7eead31-48077e16d27mr6494190137.17.1715572576164; Sun, 12 May 2024
 20:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240507052212.291137-1-jeeheng.sia@starfivetech.com>
 <20240507052212.291137-2-jeeheng.sia@starfivetech.com>
In-Reply-To: <20240507052212.291137-2-jeeheng.sia@starfivetech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 May 2024 13:55:50 +1000
Message-ID: <CAKmqyKOmt1UAbSnVbQ2fLVwoPP3u=6r5hX+gVO2xhLKidQ-8-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] qtest: allow SPCR acpi table changes
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com, 
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tMCDaMiqd+aq

On Tue, May 7, 2024 at 3:24=E2=80=AFPM Sia Jee Heng
<jeeheng.sia@starfivetech.com> wrote:

Can you describe why you are doing this and that it will be reverted
in the commit message?

Alistair

>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index dfb8523c8b..3f12ca546b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/riscv64/SPCR",
> +"tests/data/acpi/virt/aarch64/SPCR",
> --
> 2.34.1
>
>
