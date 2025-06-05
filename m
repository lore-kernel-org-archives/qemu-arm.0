Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp259662njc;
        Thu, 5 Jun 2025 06:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZe72L27XC4c5E2pdbXpB+DHBN37vDx9oQNEDqUUDHYHmO1PhAevShok57ziz1gqQI0wCIqOJW9gl7og==@linaro.org
X-Google-Smtp-Source: AGHT+IFxmXjIxr1rGTppeVYAOdsHKXaAlU0BvnNpElWdZAAGvnWH0YKBOh+2DZGQ3dW5zNX17Ovd
X-Received: by 2002:ac8:4883:0:b0:4a5:911d:57c8 with SMTP id d75a77b69052e-4a5a5743a30mr93639961cf.1.1749131411061;
        Thu, 05 Jun 2025 06:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749131411; cv=none;
        d=google.com; s=arc-20240605;
        b=KRaUpy/wkYDJLtWKq0vpTvYL+92lRv6i3zCXJ26YCW91svKDB2FUpMsLfOdT89EFKc
         /ikEZuQos4F5Jm3lOT6omcl4lt+MVmaq8m3x28jDWft6y3Db9Za9CTqjYQTNkZea4xGc
         XFm5ZlryG5YacCy9WUo6uvxpq0udCDA4Ya/l5SIrPkqcQIznnX8j1FzrcnpnJTuv4u2m
         rj4yU8IU9uIAxDvUlHuuDwJ0cSYHkARBx9IAJdqZpIvNaG2oOz/4Fp9h8lTNCWUEdR3w
         wvNfo/t1wrqyy5rLyWNahnaxI6khhiIxHId4/ci0EXZVBSuieI4Jxt2IM1KlNEHUU2TA
         OlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=e2C9yfF827TfhVmyAPGhvIrsaLDolIyfzbvkudoivns=;
        fh=MF9SVcCegvMiZGwHUcy3UCUv5DaFhOZ51hhYoCCni3U=;
        b=DwzBqkylyhYqbv0C8ELRW1hrB6LRC3Ga3EEXRbr/s8iUGOHgJeahckBz6xuRoZ0qTv
         YTnhrmYkMRf2NrQiWGJZb1XpFCFTbpQbN/uidP9gm50BJgvfAvNuo/gPakPLBM5T4L4B
         W6OymEzQ+bcmOeDAhlu9QAHF13pC/P5Fa6BSv6wYno15l20+w0wGykHqLUQ1YhbXOn45
         NCQ27JrQUs6LZo5uRzzL0C1DjOTKRXoQvuZcG30R9zbiF9FRb+RibduHzXKNo8cWe1/d
         lBegyrFmusx3NtervXc9ZekbPOLHShs2daxpPJVI5n1d9JMPCTJt48f4R5iVI3gg+cF/
         k6ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B9KbEKr0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a4359f8de3si171405021cf.291.2025.06.05.06.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 06:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B9KbEKr0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNAyj-0005dU-2m; Thu, 05 Jun 2025 09:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uNAyf-0005dA-9T
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 09:49:53 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uNAyc-0002vb-Qs
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 09:49:52 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7080dd5fe92so9531927b3.3
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749131388; x=1749736188; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2C9yfF827TfhVmyAPGhvIrsaLDolIyfzbvkudoivns=;
 b=B9KbEKr04bvV0CMYVffF54CPxCWDi8G2Xj1nq3N7GCe9owq6WckfbINoQLPS+2cu9K
 s9UDDsfA9ZAhXQ8Rv2+0skWrvCRxlKP8se+Nqy+TcIXs4E9Y8Cjq4dcs7W3TqCg9VrP+
 JCg4d07dAOwpHPMrSA/m4xk8MDGEX+wF/l7ct1WdYJXRF7T/kdNWvLXi+Az8AlVNwiq7
 TvnX5rpRzNKBiFBf1wWEbnbBC8oOvCkEGWuLXjdRZfX4utLTRhnS1qnsaVOy6DUkLnx8
 PF0ePUV+l92W62NteF/1w2c2WVGseaOSbbmaSWLVRlAuI9JJDA83VaiASQ8AD6VYT5sY
 5GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749131388; x=1749736188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2C9yfF827TfhVmyAPGhvIrsaLDolIyfzbvkudoivns=;
 b=b+fMOHEiQjVWBNxk1+bEpJx/LfO8DsFcrx/5xq5GaLLqgyj2Jc+lI33xmUjaTR+Oi0
 dU9tkrzjLLikWKtYXncBAjHRL64H4zvJ/6vmBoQsrJ6JSTIt9JMd8OO2cS2fkUey17on
 QHppJl+hs5vU0pJDkatxJELydozf/n/zOyDnhxihJWvi/d0yADI2euP2U7uQiYAIfeWK
 mawqBtj/gWcXpdTIih8/es22HCk7rP6NWLyj22R9JU7Wp1C0GSAL/E1i5qvqL7TcJ+bm
 fusCQtdeGsAJ8UErO0G1KOSmh3GMm+KS3/p1EGze40cBhdhEGPOJQDEllmvWorUFESdi
 n8TA==
X-Gm-Message-State: AOJu0YzcawYWEXeYC28uxLVeJeIDGgGTOBrQohXcWq8xKlWqVArN82w4
 iFwo2fnu5j8z+37ijvOtt2ReE8C30GyX3nkkDDowVw7dZ6odjE10N7MStJq10BneHhtgkuGe2Qx
 rosrMdjUCKNYxnobODeAziO5ifvTgwsQXH2U50zo5Tw==
X-Gm-Gg: ASbGncuKjczLyRSGeqEM6qbPYfCcHHCNEb9NAnX9nu6EH8gkp+0Axs75/4fkeqnjdnY
 11dFZQg3sVNGraV63bflGtxC71wVs4VKRBbniht1MMispR5wTIWB6mzybbUmLwIndNlLFSZi1LF
 mPCF8d+/WXMkyPubIr6UsLeos7l+Wt3rTg0g==
X-Received: by 2002:a05:690c:61c5:b0:705:750e:851 with SMTP id
 00721157ae682-710d9e692b0mr99006907b3.37.1749131387658; Thu, 05 Jun 2025
 06:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAPwCrcOwX3Atxwzrk=Rtpya_i_STv9+Gi8uY6ryJigPvhk5+DQ@mail.gmail.com>
In-Reply-To: <CAPwCrcOwX3Atxwzrk=Rtpya_i_STv9+Gi8uY6ryJigPvhk5+DQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jun 2025 14:49:36 +0100
X-Gm-Features: AX0GCFvnqV4wsOgDOGMCeq3plRwwX6g2to3a8kvoWyl6IFEhMGw64YJnCwEwKXc
Message-ID: <CAFEAcA9y0P9KEQnv7fPxc8k5paCZQoQc2CqaVHTLFWm6+Aau5A@mail.gmail.com>
Subject: Re: Inquiry About MPU Region Limit for Cortex-M7 in QEMU
To: Corentin GENDRE <cocotroupe20@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-TUID: Z2tEmQ6ntAe8

On Wed, 4 Jun 2025 at 18:38, Corentin GENDRE <cocotroupe20@gmail.com> wrote=
:
> Dear QEMU Support Team,

There is no QEMU Support Team: just people who use it and
who work on it :-)

> I am currently working with the emulation of a Cortex-M7 target using QEM=
U and have encountered a limitation regarding the Memory Protection Unit (M=
PU). According to the ARM Cortex-M7 (and the MPS2-AN500) technical referenc=
e manual, the MPU should support up to 16 memory regions. However, in the c=
urrent QEMU implementation, I noticed that only 12 MPU regions appear to be=
 emulated.
>
> Could you please confirm whether this limitation is intentional or if the=
re is a way to modify the number of MPU regions supported by QEMU for the C=
ortex-M7? If this parameter can be adjusted, I would greatly appreciate any=
 guidance or documentation on how to do so.

This is a bug, but I don't think we are setting up 12 MPU
regions; we default to 8 for the Cortex-M7 and we aren't
overriding this for the mps2-an500 board. (This is because
this board shares code with the AN385, AN386 and AN511:
those are all Cortex-M3 and -M4, which don't have a configurable
number of MPU regions, so always have 8. The M7 does have a
config knob for this (you can select "no MPU", 8 regions, or 16)
but we missed setting it correctly when we added the AN500 handling.)

This (only very lightly tested) patch ought to fix it; I'll
send that to qemu-devel in a bit. Let me know if it works for you.

Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Thu Jun 5 14:36:16 2025 +0100

    hw/arm/mps2: Configure the AN500 CPU with 16 MPU regions

    The AN500 application note documents that it configures the Cortex-M7
    CPU to have 16 MPU regions. We weren't doing this in our emulation,
    so the CPU had only the default 8 MPU regions. Set the mpu-ns-regions
    property to 16 for this board.

    This bug doesn't affect any of the other board types we model in
    this source file, because they all use either the Cortex-M3 or
    Cortex-M4. Those CPUs do not have an RTL configurable number of
    MPU regions, and always provide 8 regions if the MPU is built in.

    Cc: qemu-stable@nongnu.org
    Reported-by: Corentin GENDRE <cocotroupe20@gmail.com>
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 58efb41e6db..50e1a1c1c80 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -224,7 +224,11 @@ static void mps2_common_init(MachineState *machine)
     switch (mmc->fpga_type) {
     case FPGA_AN385:
     case FPGA_AN386:
+        qdev_prop_set_uint32(armv7m, "num-irq", 32);
+        break;
     case FPGA_AN500:
+        /* The AN500 configures its Cortex-M7 with 16 MPU regions */
+        qdev_prop_set_uint32(armv7m, "mpu-ns-dregions", 16);
         qdev_prop_set_uint32(armv7m, "num-irq", 32);
         break;
     case FPGA_AN511:


thanks
-- PMM
