Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp597013ejf;
        Fri, 23 Feb 2024 06:33:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJIpeMmU2qThptTdMc92mf1NOcDXQnrqakEGJr/onEIhQstyi5xn1935sYlkTTc2m9sthB/5eBZYT0g6zHFcocaJ77GEnY
X-Google-Smtp-Source: AGHT+IGLQAZ4ENYwqXxOKzyxvNCGGSvymuSFwkOwBp2HiVzSG3sTCCOEQbCMaK1O9id8QgBDGh66
X-Received: by 2002:a4a:6c5d:0:b0:5a0:2a65:a14f with SMTP id u29-20020a4a6c5d000000b005a02a65a14fmr10237oof.3.1708698831071;
        Fri, 23 Feb 2024 06:33:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708698831; cv=none;
        d=google.com; s=arc-20160816;
        b=H8uiytVb8MQs+84tYMMnyDvieXuF+4JxjabgdoZYPDQ7qFUqdYyGNH4yscFZpOlVzV
         Qo2i3Y36vTl55nVmTn0BwH04JjRzHO04Gov0GhH61y5Sod4nzov7aGE8xLhdZ/6GvWc5
         x/AVl5jtthraVqJ1VnfZ02D+6yU1HsyjoRkLP7mb0hUqrsj3Oi/50fUVQS+iUl+1grBB
         lSMtEDI24XMY0H/HeXq9T7btbpr04dpMBHYkqeM5DuQ18BHxq7x0anVGIJsAK399siPa
         +QbvPU3Cl4qtzAHJ6oTlVbkyOh20NIv8G3kwr7bYJpte/tsDjZ3rN3+NPS8L4i0QwYOC
         XaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+t5x9rR2LwXUuL+CTRbQc2GK1VB3ALj4Vmgi21EOVIw=;
        fh=14cg8Lio82p/H9WX2WcZAA4tkT1kcIB64o48FuOMMOs=;
        b=HMXHjYI1F27KxfB4J/FwVsjJymNYOEe7tS05Ou2qYci7MGwOKIm5AG54czfca/ZdUV
         yZy0b5pO8Vj2eZ6qmnX7fP4vyVOg30KzkRj7gzZ9eieEIAQa9d4L5y4wCLBlkUwJMjYZ
         TIRmm5DWPKsU9PZ9zkIKLYEsjZEuhgEPFEI6nq8SNkiJosUcAAAqW6GSkArDyRJQj4VB
         yJ19T3JcNomJdHN2XbhaUqoZ9zFtlrwU/wUjitfALljx1sHzwx84R8UmLYpTWuE+txE/
         IS/JMEmgA3NYGRBlFcA7k/WtNzQ5fTUH/sp/VFynZgBf5qpd0+nsfkMz6WdQqQSql/IL
         dlkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZE79DxZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ie11-20020a0561022c0b00b0046d1ad70070si2171506vsb.406.2024.02.23.06.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 06:33:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZE79DxZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdWcI-00082S-3Q; Fri, 23 Feb 2024 09:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdWVx-0006c0-O5
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 09:27:01 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdWVw-0008Km-69
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 09:27:01 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-564fd9eea75so570532a12.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 06:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708698418; x=1709303218; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+t5x9rR2LwXUuL+CTRbQc2GK1VB3ALj4Vmgi21EOVIw=;
 b=ZE79DxZuVZfytbxP2/pfLskhSGrqXKjk3suDt+cuTQGdxjGyOCiv6puE6/BFflX2qj
 0tZmn31LgPxrpA+zLJaZ+Re88EU/MYy4B8hIEGkDq/SZ2QZSk97Gl2eU60Jm5G/GQ5IS
 NNO3KIBWYFY9c53oqaKGN5Djc+nyJaO5m/ww09E18DXT7WUEBmOqFkGRShE6UzNJxXcC
 lXbpZu4qp8aflj20R1H0PkITMX7AlWN3yTvAks69fhRTy4W8q9oBUfnIZu+J0lKjvX+d
 e2G87BugO+tcJMtyTVVZM71WTZuODHOgEfphKPD5zJpdJwfpCXdx8q4tzzyKOM72ZjDn
 tmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708698418; x=1709303218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+t5x9rR2LwXUuL+CTRbQc2GK1VB3ALj4Vmgi21EOVIw=;
 b=MF1uxcw7e0duy8zArcJnkyYkef2KGomhoyeBGQrPPhbv725wmjVQrs/EkslhRGVmnz
 omChJ9bCS29CnJTL0rNmxvkrN0pylNRO6/hWCnl+gan4Ut2xCDRzdJA09GtqLiZpqse2
 W2UYL4exo7GzF71Ddt29xG6RxOY8yxsHmsI8pWuu1HJkQjtd56vHrMZMFjVMfy1Dl22v
 SA/bpgEoGvyLHyDB5jTZGJc5xIVdHismPVZ6sL4wO2y4Cp/LhEXQD4XUvJAVQdBOw3qU
 se+zTCrBVgS0SAxRjtJ3JVgSYhqxAi1E84PIK82EK0mBeE/0hK/5Ya7cf+QPhbZREqZZ
 jcww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzRleyNwaWutl/qhj2Rhb/1mLniQGUl+XO92V5pS1LtnoZHLmH9iOw7gWw7gpApGo8kb8NzLC1XMr1IRhai1no+poq
X-Gm-Message-State: AOJu0YyXWqkpOjdyMHfghDx4Jv3v2hN+aLOW+jUI+xniilM7zNDLf8db
 3TxnIf64QLN0UO3T5bJMWvX0hTA7Eq6VkJC7KoSSjewlvPddYSx/wG8rVuLozWsnMgIq6GjEkh2
 /9vF228RnAt/EXrx5ohYVIVuwA6ASQxDVPK7EAdVUYC/urMP3
X-Received: by 2002:a05:6402:160a:b0:564:7350:cac8 with SMTP id
 f10-20020a056402160a00b005647350cac8mr1367755edv.15.1708698417766; Fri, 23
 Feb 2024 06:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
 <20240219200908.49551-2-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240219200908.49551-2-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 14:26:46 +0000
Message-ID: <CAFEAcA_LZ6oGj_y+_9zKDZNVSk8zOb4hQG+OKETXyE3-ezP_Rg@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] Implement STM32L4x5_RCC skeleton
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xW7Wph1NIAlI

On Mon, 19 Feb 2024 at 20:11, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> Add the necessary files to add a simple RCC implementation with just
> reads from and writes to registers. Also instanciate the RCC in the

"instantiate"

> STM32L4x5_SoC. It is needed for accurate emulation of all the SoC
> clocks and timers.
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---



> +static const MemoryRegionOps stm32l4x5_rcc_ops =3D {
> +    .read =3D stm32l4x5_rcc_read,
> +    .write =3D stm32l4x5_rcc_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .valid =3D {
> +        .max_access_size =3D 4,
> +        .unaligned =3D false
> +    },
> +};

What's the .valid.min_access_size ?
Do we need to set the .impl max/min access size here too ?


> +
> +static const ClockPortInitArray stm32l4x5_rcc_clocks =3D {
> +    QDEV_CLOCK_IN(Stm32l4x5RccState, hsi16_rc, NULL, 0),
> +    QDEV_CLOCK_IN(Stm32l4x5RccState, msi_rc, NULL, 0),
> +    QDEV_CLOCK_IN(Stm32l4x5RccState, hse, NULL, 0),
> +    QDEV_CLOCK_IN(Stm32l4x5RccState, lsi_rc, NULL, 0),
> +    QDEV_CLOCK_IN(Stm32l4x5RccState, lse_crystal, NULL, 0),
> +    QDEV_CLOCK_IN(Stm32l4x5RccState, sai1_extclk, NULL, 0),
> +    QDEV_CLOCK_IN(Stm32l4x5RccState, sai2_extclk, NULL, 0),
> +    QDEV_CLOCK_END
> +};

These are input clocks, so they each need a VMSTATE_CLOCK()
line in the VMStateDescription. (I think only input clocks
need to be migrated.)

> +
> +
> +static void stm32l4x5_rcc_init(Object *obj)
> +{
> +    Stm32l4x5RccState *s =3D STM32L4X5_RCC(obj);
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
> +
> +    memory_region_init_io(&s->mmio, obj, &stm32l4x5_rcc_ops, s,
> +                          TYPE_STM32L4X5_RCC, 0x400);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +
> +    qdev_init_clocks(DEVICE(s), stm32l4x5_rcc_clocks);
> +
> +    s->gnd =3D clock_new(obj, "gnd");
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
