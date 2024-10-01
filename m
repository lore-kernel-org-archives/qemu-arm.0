Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp236169njl;
        Tue, 1 Oct 2024 07:52:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUU+5YH0PO50clBknHU/5KGi8DRLpKFjJe6ueD5UNagPXy8sQ1brZWP1b/Z+1aKcYq/yVgCnLFfB22Mnw==@linaro.org
X-Google-Smtp-Source: AGHT+IGYpplZkl7cF4iNtmVnXU6MF/PAWeMltU31NMZMpucyKJkoPC2hZk5ntgudwnVDBHVUx+ar
X-Received: by 2002:a05:6358:7188:b0:1b1:acd4:d155 with SMTP id e5c5f4694b2df-1c0ced7c233mr6696255d.16.1727794339495;
        Tue, 01 Oct 2024 07:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727794339; cv=none;
        d=google.com; s=arc-20240605;
        b=HMawhUCXbkBV7g8N4TdKw0WZJIFpj+4cD8Qq0RVDqlvHUTUcJc9TQ0wvC3LpRCpRn5
         GgEDXUKyYzLbi5JZ8ARj0YajR4pjJLURpoUXuwFSqQuJuugIkhEJdKoLYJqHELc1F3cb
         R/NubfWb+OKV2B/Zu0O3qg+6XgmUjUr7G4TNVjo8IN3m5f8iHXeNMZbw0asT6OCxGoa0
         7oUnIcfdEcdGZi6KT6i8WZSXo+5TPeg2TNLG/wqBjEnlYPAm9UnGerv/KNk3UezSHT3G
         7QxIPiYDaj+gfxDGhi2DAu2PrnFr332st8aKZx3xbBEbLUtlA9sYyLvSan08jP/YLpl5
         KgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aIKDcHGJPe0Y/LbyHxS8dJFRL8c0zYf8re8eWH4BQYQ=;
        fh=c0AJip/Up27iDOHQOOVj4ByT1YmSHfTsesVeFVjvYYw=;
        b=BVtR18lTEU5FkCjf92tMfQbdiEogdrH+gY7VUoajrYGaWISQw3mhk6xFFNovEFF5HB
         j1ug/edGU+bYXTiua7XYxI9tQhoJAH5klOVHYkQv2w5kiZaJp/DkDAPyynyEOmpmVebn
         qMKnwtbKTEiOLf8RUowI/ngx8r6sYJApXf7RTR182KtvFovbLOcx4Z6Rq3a5DRBAd9nT
         u8dK98f1DDI21Ko//EgtPKaTE4baPsxK60sGWkdhy6FzNmBXE6s0pt/MRJHxQgPzTqDm
         KKa5t26+oAy+2U22j6xgaHQoCbFKYy1/MbMGJUoH6EPrlp3NK04kQePx0KE3f7KB2IhM
         0Bqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zy+AuKUZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b602e43si108102286d6.68.2024.10.01.07.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:52:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zy+AuKUZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sveES-0005GG-HX; Tue, 01 Oct 2024 10:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sveEP-00056E-Qx
 for qemu-arm@nongnu.org; Tue, 01 Oct 2024 10:52:06 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sveEN-0005je-81
 for qemu-arm@nongnu.org; Tue, 01 Oct 2024 10:52:05 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5399041167cso4053144e87.0
 for <qemu-arm@nongnu.org>; Tue, 01 Oct 2024 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727794321; x=1728399121; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIKDcHGJPe0Y/LbyHxS8dJFRL8c0zYf8re8eWH4BQYQ=;
 b=Zy+AuKUZNdHsAB8r5DLTUVvLHxCZ+R8FeQDwmHno0AGIkAIgqcZt6CV+M36zzTQG6m
 Xxbxeob5yoaQJYYcNJ6RAxPAow1+1sJbPbScCSQiAJ6PUnuVDpYTKae6BaoOcFmcSDhB
 Iv5mFuHJ4zkXf7Wik8OOxnCnKqVuU+foZWpfVT1/yW9sGJ+Xbt/UYEDzXNfr/zzEMiv4
 P4vpKMFaKY3GPQYJQgrD50aQYuYSvUPLM6Cp/UGDz3DBCxDE4UZIN5kWAYV2B4h8fDQ4
 wVxRwM8nj7HtL+B3DIce23JAlQMEv6EMLCwgK9QoOd4FJzX3yQxVF89uYZpfy6f7rU8H
 iHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727794321; x=1728399121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aIKDcHGJPe0Y/LbyHxS8dJFRL8c0zYf8re8eWH4BQYQ=;
 b=WPfehQZbzc3URtOcKaIGi8sXA6YRFDMimMrlJ8i2uVN6ae33XqEsWm8bDR0E9fTMxd
 WfiPRU4c+bs5GGVKxf3TxfnJwguLom5Qj2CBoWsoPPM7jTemRPoGrdWu4N4zDjNFT+td
 4NLX7oTF9ngw2hJmjMbMZDLxjwQLx48DjALASoEYzoevEFAI05fWGi2heB6MaO2mSMG/
 jP4vLO8X07dSbHJDQdvA0yoI/j3omEMKAk1NMqBcsYC1eJKAbFXpw/IEOs+g+ops5m1B
 +qQhACe+KDZgE/GZ3BuJGj52Jfv2JwpGFQJ4wi8QLmHm0pHaUrLeHp160+AfsDnTZpN7
 4Ljw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVevHI3glMJcp2C21P5X8Yy4251r/TuB5v05dpucbUZ4tMwJjtbDPWzJmuP5h+8HyhsyXyIzAg48Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx3ug7LPlI8QvbNg40/68DgQ1ktFarscU2AAJh+YpXHj8+pgIEQ
 NNO3zCrYlpfn87K1kSMOGSXWeZYsWByY9dSB+m8ovwH7ffTr39rsEZYWy0hYu+850GNCHg2RAEC
 iH04eqMoe3R96NfZXIRbu+eBj11gu7A4jNms5oraOMTcuZgtt
X-Received: by 2002:a05:6402:42d2:b0:5c4:23a4:ad5f with SMTP id
 4fb4d7f45d1cf-5c8824cd086mr22670202a12.6.1727775352820; Tue, 01 Oct 2024
 02:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240930221205.59101-1-philmd@linaro.org>
 <20240930221205.59101-4-philmd@linaro.org>
In-Reply-To: <20240930221205.59101-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Oct 2024 10:35:41 +0100
Message-ID: <CAFEAcA8YmpEDj=imO1r9zrp+XaybtV4eJszZtBZLubHPcDLcEA@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm: Replace tswap32() calls by target agnostic
 stl_endian_p()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, Hao Wu <wuhaotsh@google.com>, 
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, Tyrone Ting <kfting@nuvoton.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Anton Johansson <anjo@rev.ng>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 4n4MU4ZT610J

On Mon, 30 Sept 2024 at 23:12, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Replace the target-specific tswap32() calls by stl_endian_p()
> which does the same but takes the endianness as argument, thus
> is target-agnostic.
> Get the vCPU endianness calling arm_cpu_code_is_big_endian().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/boot.c        | 8 +++++---
>  hw/arm/exynos4210.c  | 7 +++----
>  hw/arm/npcm7xx.c     | 6 ++++--
>  hw/arm/xilinx_zynq.c | 5 +++--
>  4 files changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 6efd21f9c2..6e8dc00e6d 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -137,6 +137,7 @@ void arm_write_bootloader(const char *name,
>                            const uint32_t *fixupcontext)
>  {
>      AddressSpace *as =3D arm_boot_address_space(cpu, info);
> +    bool be =3D arm_cpu_code_is_big_endian(&cpu->env);
>      /* Fix up the specified bootloader fragment and write it into
>       * guest memory using rom_add_blob_fixed(). fixupcontext is
>       * an array giving the values to write in for the fixup types
> @@ -173,7 +174,7 @@ void arm_write_bootloader(const char *name,
>          default:
>              abort();
>          }
> -        code[i] =3D tswap32(insn);
> +        stl_endian_p(be, &code[i], insn);
>      }

This is a behaviour change. For Arm, TARGET_BIG_ENDIAN
is always false, so tswap32() is "swap to/from little endian".
But arm_cpu_code_is_big_endian() looks at the state of
the guest vCPU (specifically, its SCTLR.B bit) and so
may swap to either big or little endian.

These functions are also called before the CPU is
reset for the first time, and before do_cpu_reset()
has maybe set SCTLR_B based on the ELF file. So we
can't guarantee SCTLR.B to be set correctly here where
we're trying to use it.

Maybe we do get this wrong for the old ARMv6-and-earlier
BE32 model where SCTLR.B might be non-zero -- they're
such a niche case that I don't suppose gets tested often.
(ARMv7-and-up is BE8 and instructions are always little
endian even when data is big endian.) But we should
separate out bug fixes from refactorings.

thanks
-- PMM
