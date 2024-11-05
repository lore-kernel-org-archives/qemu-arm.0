Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3152638njc;
        Tue, 5 Nov 2024 14:35:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXp316ffIrczKT4B5ox4yq/HsXD4i8ZRjAYusnsqL6i+cAm7BWow0iMTBBR4GVTDHF0dZ0qDqcyCBsXnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IErKDASG5kx3SrWcf8/fgEfpdECYWI5L80OQ7EnApYHU0FFr/WD2NFWFy/9ZLLzgvZMoxfT
X-Received: by 2002:a05:620a:400b:b0:7a9:bafd:635b with SMTP id af79cd13be357-7b2f255633amr2780199585a.60.1730846127283;
        Tue, 05 Nov 2024 14:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730846127; cv=none;
        d=google.com; s=arc-20240605;
        b=UQ+mcNQ3grIOaQKZcpnm/fwDzDXNO/05kcsZQlLZ57JknK0SnfwdNwFJJ2vQcv70kB
         dua6O95Y3TulRmHOUXFcNrA4B2xqYw4I+Y+Uq8ulZEOpwQsmYWbVSFDDsW+CigG0J036
         8IIfi2/f0MUFZjsGWWmokRE4xJ1eNsOElV2IJ5a9B1JvHCsRjzTfPN1kYHgzTv9QN5uL
         3Qruar8HrGmPDViv9pFMnpLQUzKAqhPtnQ3CG+J/+guWsJ0+qsz2sBC+8HPYZrvoYJ38
         iIrIYKXcQUFh8ZCAJiTvMJLnDgvJkDaad62A8Nxoivb4U5M+UJu1BAkXa/3Urhott48s
         mFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HUPuM9NJ2R5BQ9TwKHhx/vPqhs6YfTIAfdUG396c+6c=;
        fh=GeiSv8eGmeFwKXSShoVxBnarI5jnHlmeGo8PW7KNOcY=;
        b=P9NKub+K1nvEEeIaneEGHlPYZeF0Cd9TlrTWKk1D9J3HrTyTM8KRKQ6wryhYf/c3dK
         imrdkUfpXP4J29qej3zmV1APSQi/ZI37t1fss9WgNhuuA+C+n9Vn8npOsudGjoXAysK2
         HBe6Zb7VrALO6emuZvuXDEUivfrsXp+gnn0QcD35xGNsbjCkL6DLMCStGsr5rXvrmMJe
         P1ah7HXvPfgaXUTbJHPqHt/JcvuI88HQHuTtVt+xrygpgm2p0zerlQ4ZN18Ryjr0hjzy
         ZGbBvmDPI/A6B+Gq2OkqAPglbuCFiiacMZBOzBM9FKtWYaMUH+85ESTWYBK5d3XQqJOx
         fZ/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Xckxno8/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ab6b7csi1519209585a.646.2024.11.05.14.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 14:35:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Xckxno8/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8S8u-0007gR-Tl; Tue, 05 Nov 2024 17:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8S8t-0007f7-37; Tue, 05 Nov 2024 17:35:19 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8S8o-00029I-Qx; Tue, 05 Nov 2024 17:35:17 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-5139cd0032cso1401961e0c.2; 
 Tue, 05 Nov 2024 14:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730846112; x=1731450912; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUPuM9NJ2R5BQ9TwKHhx/vPqhs6YfTIAfdUG396c+6c=;
 b=Xckxno8/mgpvUv8bW2XzzNnI3gKddYoMl6fMR4wTQ+t/yOcqMaTdJivpRFbitZ8qG8
 PnaMbX3hPVSY1v5nRDNcJSRwPv1rBXHrSayfNzZIlSba93xOfuR6IamTbe36lb7rHMCt
 7QpIiBnRRQTglZjMDrAdZlh5kgeKFVCLXMZYITDonI7s6ja2DR0l9ywZDTcu/TeAhll0
 0Gy9WJSEdMFw/qYgwnas+AgL4V4HM3lB4UxDhhqB148JhUS7OPuAFaGH8Whc8SWdayYd
 rjHXFxCYyedtj1aAj6R2aHXkKZWvUsc6vuC3jMNY14oqr9braX9nDSM+yTyHmqLmkXtv
 SHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730846112; x=1731450912;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HUPuM9NJ2R5BQ9TwKHhx/vPqhs6YfTIAfdUG396c+6c=;
 b=CiB7Go0EopW11anTySTbiQnoCczrBt/MtfXARcxQo/loVh5kg1rlXMYmF5LJhpxc0u
 vVXrcPFUrx4Wll+nzLuepPGlKheH32IYS4cN4ZOSZcxnEYviyyyJxq+J2cQ1hJH+Yj3I
 zWbWt/nsYSFEJLC3E6c1zswBoS4WEZbzMwHy+pl8nl9J0QtYuKcoaWdHvxOXAl1M/OnE
 IXX12qADYcAt6UMwDGIdjZh/6ehKQTQjNS6v91X5UdhbCMgrO1LFqzZxvhFxz03f3cs6
 h3X84n7WZtDXwUtfkRx3QVO6T/zHmvIgwVHwbpciiT/PrfjI0EAKhagJjXFOMjguzJuA
 QqVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU19EXmE2PekkkaU9/SuuQf3enDbcLFtZDQ8qmBnHttwiFYOVJiHVN3K6h2Q0E43OEBUm+ERDzp4w==@nongnu.org
X-Gm-Message-State: AOJu0Yz2uYhOJNPGUP67zBylq6xDX7l4ZdGi7/6ic9Q3B1RTC+KyJy3Z
 C1I2LlC/9T9IcScfDF1GTnZHNpvffmzCS0dsfY2QQvG9/aNlGNDuO9WtryJuoTwEloD174od3/a
 ZqG3JTDwPmEOcJLY5qJRJgvjwuPc=
X-Received: by 2002:a05:6122:4f84:b0:50d:66e1:826c with SMTP id
 71dfb90a1353d-5106b1c0385mr19920281e0c.11.1730846111873; Tue, 05 Nov 2024
 14:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-4-philmd@linaro.org>
In-Reply-To: <20241105130431.22564-4-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Nov 2024 08:34:45 +1000
Message-ID: <CAKmqyKOf05=ppeHYRzwU0MRF7PQLfaXEF4ErheevVbNU4AO1Cw@mail.gmail.com>
Subject: Re: [PATCH 03/19] hw/microblaze/s3adsp1800: Explicit CPU endianness
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: Gudm7+K+uyVh

On Tue, Nov 5, 2024 at 11:07=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> By default the machine's CPU endianness is 'big' order
> ('little-endian' property set to %false).
>
> This corresponds to the default when this machine was added;
> see commits 6a8b1ae2020 "microblaze: Add petalogix s3a1800dsp
> MMU linux ref-design." and 72b675caacf "microblaze: Hook into
> the build-system." which added:
>
>   [ "$target_cpu" =3D "microblaze" ] && target_bigendian=3Dyes
>
> Later commit 877fdc12b1a ("microblaze: Allow targeting
> little-endian mb") added little-endian support, forgetting
> to set the CPU endianness to little-endian. Not an issue
> since this property was never used, but we will use it soon,
> so explicit the endianness to get the expected behavior.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/pet=
alogix_s3adsp1800_mmu.c
> index dad46bd7f98..37e9a05a62a 100644
> --- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
> +++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
> @@ -71,6 +71,8 @@ petalogix_s3adsp1800_init(MachineState *machine)
>
>      cpu =3D MICROBLAZE_CPU(object_new(TYPE_MICROBLAZE_CPU));
>      object_property_set_str(OBJECT(cpu), "version", "7.10.d", &error_abo=
rt);
> +    object_property_set_bool(OBJECT(cpu), "little-endian",
> +                             !TARGET_BIG_ENDIAN, &error_abort);
>      qdev_realize(DEVICE(cpu), NULL, &error_abort);
>
>      /* Attach emulated BRAM through the LMB.  */
> --
> 2.45.2
>
>
