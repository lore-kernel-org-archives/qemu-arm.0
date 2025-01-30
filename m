Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp189677njb;
        Thu, 30 Jan 2025 10:36:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfIzh74IDbjsomCsmuFTsgUdSk8RnvLy9HEzQchMWnnHTlABulD1Ak4bg40x9iPXNYvT1kwEg4rDkbug==@linaro.org
X-Google-Smtp-Source: AGHT+IGaDrfyvY+sfSTxVxTSGGU6JSluwdaTLBu8Zx1T7ZgJIfP1YA1hEDacJ2L6O7UmG82+tuwB
X-Received: by 2002:a05:620a:1923:b0:7b6:da2d:73f0 with SMTP id af79cd13be357-7bffcd070f4mr1335329085a.30.1738262209000;
        Thu, 30 Jan 2025 10:36:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738262208; cv=none;
        d=google.com; s=arc-20240605;
        b=NtGI+r+3q74oJJE54iWGteTsw80fqH2hZtbRW4n9P/BNAibUkK5IP2+2BqZbHHy8Or
         A54b3mo6d69KOcX+fwJqMTJ4BvCMDKH9KsqOaTmslENVj3vZggm5c5OTHIUqsxQMjrEl
         2CDITu34J1qNY5j6YNNV6vB2ST29MSYk9FiMk3idheloJGZI6iN1It8HgYCR0K9o4B3G
         5AdtQiHG7QC5vagogDdX/s8DNRNXED20WNV9rv1YbRqbk9gUaAd6vUzGlMnrFpjdNyHa
         05Y0nIgCL3nuJJIjW8cnQ/3Azj4daAgy2ZZvLBe55wvfkCqGTHsXeo9E4EALfolOwweB
         159Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JEwcy7h4f6qE+HwtPHkbkVOnvo40ozfrW8wEToVSXh0=;
        fh=6WSkeSncouqbQF7oPZ8pL6q/8l0mBDMGLnD28PTxaN4=;
        b=IvTgNz6yp4VHJIrteeRxRuackrlNmr7khZl2YmfE54ThhwVqt7bKnrq0aEgh6YvfgE
         hCDZHdiJvlY0vh9BJ41Cgk+cGRBDSGOrmHlUy9zzy8sRpKCQ/AVl2KjJMsDtbRX4YKp5
         hjic7gp8Zfy0m69NvoufdHCN2MqarnHPb6DmWfcLNbJc2J9UDzVfYPozOvo7fF4duNN/
         Wld2Q9sEcLfql+x8JR+UobN8tlE0vhObfvPmBvH2UBHQw3zgr9OwGRggBtCO1rv+2wFT
         S3VQsqzncXGO+Fmnm8sWSO0yJu/XWoeb3gqsjT6Y93AfhHuOhxJj+f+vSS98AA7AbLQZ
         DDFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xz31wYcx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8bf99dsi220703785a.90.2025.01.30.10.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 10:36:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xz31wYcx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdZP0-0007EG-3S; Thu, 30 Jan 2025 13:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tdZOy-0007DQ-5M
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:36:32 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tdZOw-0003wG-KC
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:36:31 -0500
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e58a7e02514so1910766276.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 10:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738262189; x=1738866989; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JEwcy7h4f6qE+HwtPHkbkVOnvo40ozfrW8wEToVSXh0=;
 b=Xz31wYcxM/Y6FhSy4acQz5KyxpMMcCGS6wJ6YQF78WAkkB8t5Bfy2F7T74rkGnnx9P
 8yUt/yK3RCZITlMHSb2uOJIWQlq6iHP6tmIpzYIfR20ebO1FBMeWj+UFnocbQHlDqXvQ
 ombWFwJEAqyZl3jkwNsuhsGqbR4gzp2lLMbX/JAj4MuCAxlxd7vCN0L6MYeDWBU/5ael
 +M1Ws6NkU6jO6KQZaRPzhRhtui8rNbjt49J1CHm58l/X3dzY1RK/IcGXk+vMFBkjj44J
 4eRDHI9EtOBCKOKZ1vgLqcXH3b39LOlfPMqhFjr7r7lfePwxpjPYpRSaE1nsZA60J35R
 PJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738262189; x=1738866989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JEwcy7h4f6qE+HwtPHkbkVOnvo40ozfrW8wEToVSXh0=;
 b=josz+Uq94xhxiMPst5I+Nhu3yNLmDdx75k8JiDo7YQmzrAUFNVKgLtGYRojuxe4l3w
 OhA1z1vYLXFumlKeGzjHxVSCOhv7JAJQz3HqciPMnfnp3KuM4PWDlRfJgl1W3DSo5lim
 ngLPVrYc1Rk72QeedLpX5MMqFnJathIMRCHbjdo0u38v+T1ety06Kq4Hnpze7aplaAmn
 CmQLxcjSspctjpi9HMAFXae3Hd5aAWjjTAclQCiT/HBCKQkzKQ5et5jb12ULEuxihE6d
 JUxRux5H5RWZQSm9ayUzRU+EEDOvUT6yv/qAXnGZQ/RG+ZBg6XTwCWgvufMPBlZh0h/x
 GV5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz5kxqUZaoiUHXyyWIsHBb3vj6F+vHeJI4CWYSMpTOcDwCAHtOT+K0z8KbpF6cML4HhWZKn8PX2A==@nongnu.org
X-Gm-Message-State: AOJu0Yz9MZV2yGhadqU+YcNVgbfJ74dQNdF1EnbJftE/cyGoPYHsz705
 96JGxXpzORKBYnTzvA9UoWs5AQnTyJjrkxgGc4axOIhURnSi1pRFFUZlSPlJWrh0mW0CWS1ZATR
 3NRZpNHYaztTHoELgklTNREcbaEAChVxtaMDM9g==
X-Gm-Gg: ASbGnctfeG0ym+6i0Ts9cQnL+TkAhIzYueJYuVJFPlS8L2wDnFQTcFiXG3mxVZptGxa
 SnRCDG0qK4UbGQ1GBUVK/tZlcdUwtzNxT+LMsFXZ8JakZZ5hVYcoq3R3x2WS33dA3AmAT3bA7Eg
 ==
X-Received: by 2002:a05:6902:102a:b0:e57:caaa:fe60 with SMTP id
 3f1490d57ef6-e58a4bcb243mr5833702276.30.1738262189059; Thu, 30 Jan 2025
 10:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20250130182441.40480-1-philmd@linaro.org>
 <20250130182441.40480-4-philmd@linaro.org>
In-Reply-To: <20250130182441.40480-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jan 2025 18:36:17 +0000
X-Gm-Features: AWEUYZnCnnaiudw6jv7nTwE4lc4CEaNyDGXyxBJIhOWFmnpL32Kah6sXkXtddIc
Message-ID: <CAFEAcA_PFSBdB0Uhb8K5aog0kj-HN=s_EBL=pQCkkNLuwUO42g@mail.gmail.com>
Subject: Re: [PATCH 3/8] hw/arm/realview: Explicit number of GIC external IRQs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
X-TUID: vJLiDFtiAem2

On Thu, 30 Jan 2025 at 18:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> When not specified, Cortex-A9MP configures its GIC with 64 external
> IRQs (see commit a32134aad89 "arm:make the number of GIC interrupts
> configurable"). Add the GIC_EXT_IRQS definition (with a comment)
> to make that explicit.
>
> Except explicitly setting a property value to its same implicit
> value, there is no logical change intended.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/realview.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 9900a98f3b8..4a62c83506b 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -35,6 +35,14 @@
>  #define SMP_BOOT_ADDR 0xe0000000
>  #define SMP_BOOTREG_ADDR 0x10000030
>
> +/*
> + * The Cortex-A9MP may have anything from 0 to 224 external interrupt
> + * IRQ lines (with another 32 internal). We default to 64+32, which
> + * is the number provided by the Cortex-A9MP test chip in the
> + * Realview PBX-A9 and Versatile Express A9 development boards.
> + */

On the other hand, this really *is* the Realview PBX-A9
development board. So we can just say that that's the right
number (and the vexpress is irrelevant, and the range of
settings the CPU itself can have isn't very important either).

(PS: there's no verb "to explicit" in English (ignoring some
obscure obsolete ones); French "expliciter" =3D> English "to make
explicit"; or you in the case of the subject line here,
"specify explicitly" is probably most natural.)

> +#define GIC_EXT_IRQS 64
> +
>  /* Board init.  */
>
>  static struct arm_boot_info realview_binfo =3D {
> @@ -185,7 +193,12 @@ static void realview_init(MachineState *machine,
>      sysbus_mmio_map(SYS_BUS_DEVICE(sysctl), 0, 0x10000000);
>
>      if (is_mpcore) {
> -        dev =3D qdev_new(is_pb ? TYPE_A9MPCORE_PRIV : "realview_mpcore")=
;
> +        if (is_pb) {
> +            dev =3D qdev_new(TYPE_A9MPCORE_PRIV);
> +            qdev_prop_set_uint32(dev, "num-irq", GIC_EXT_IRQS + GIC_INTE=
RNAL);
> +        } else {
> +            dev =3D qdev_new("realview_mpcore");
> +        }
>          qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
>          busdev =3D SYS_BUS_DEVICE(dev);
>          sysbus_realize_and_unref(busdev, &error_fatal);
> @@ -201,7 +214,7 @@ static void realview_init(MachineState *machine,
>          /* For now just create the nIRQ GIC, and ignore the others.  */
>          dev =3D sysbus_create_simple(TYPE_REALVIEW_GIC, gic_addr, cpu_ir=
q[0]);
>      }
> -    for (n =3D 0; n < 64; n++) {
> +    for (n =3D 0; n < GIC_EXT_IRQS; n++) {
>          pic[n] =3D qdev_get_gpio_in(dev, n);
>      }
>
> --
> 2.47.1

thanks
-- PMM
