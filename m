Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1714447ejb;
        Mon, 23 Oct 2023 17:10:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYvJ8AgZRLiU19NcBHPqi1uQLfZ7q7NOz4liNMXdhBZOuo//5KPIb/wRZl0p3kbGU+3Tqo
X-Received: by 2002:a05:622a:7:b0:418:1088:7d83 with SMTP id x7-20020a05622a000700b0041810887d83mr11957041qtw.2.1698106251943;
        Mon, 23 Oct 2023 17:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698106251; cv=none;
        d=google.com; s=arc-20160816;
        b=ati0Lt1WDyOTWvgU0o4bae0SdazQXIJe0ayKCYw/1s/zsmkhnvrZ1ywFsHJorOt4aO
         s4gr7E+0/1i9sNAz5MAk27uTMZci/uEcHVAnYMMpvwIg+Rv4r5CpQhuxFhjyt4zls+Gz
         D6uSZacLM4WCx8F+Qqq6T5qAYyT0Odi1uk5CQ7tGfyR3dOZQD75R2yX8mmf6lrRZOzvu
         zgMPiw+plvwDmka2eRsUt29C8tw2AeOyWgqZfdDuQDGVh75KwG+2DGaZHHran/CUO9Bw
         VdMSxgcgkJhWG5std4Sb9/vFhYEN+NKwvvqeS5DhoTGfAWwWLwZ+K1KotWfFM9F6JtYW
         LvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5o/vcToECi4QgNxa/oeZJkGYImarRZqajfTlRbY8lGs=;
        fh=s+fDW8c5BHnNqsLbDSxABoDuumyLntKlJVceGns5WYs=;
        b=FvjWU5LSyCsU0w354JvoEPTtrHZZiN66jXUvreXR5YfUt6rdAY1cr7hzGlD9TMQFlj
         PRSy9ciZUgBmxlqtufP/zn+Ovn6A4Wag2vwcIr4oJy7GvPU0f2UXLWv9iqr5WUnQbqCI
         6+IFeNN80bmU+MJGl+4HvLHI2lCnP2gKSLiZeii1l4lp+rcW9WcWM9bLptSOdfqh9fS6
         JF30RyedChhInmLxu9d0ZYCZPJTEUJsXioc4U4wYV4uLZ2BCXKF2YmfA2YpJALsxvLPg
         D0rNC0UF2ArH9EG6Jkely7Wf9fpHiT7ec6ZpbOv9/HdMhg1YwSJm7Y96ZvP7WnWf8E2Y
         7aVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kmgo1jMW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020ac87d0b000000b0041cc117cfadsi6519890qtb.338.2023.10.23.17.10.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 17:10:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kmgo1jMW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qv50F-0006ge-O4; Mon, 23 Oct 2023 20:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qv50D-0006eb-Vl; Mon, 23 Oct 2023 20:10:34 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qv50C-0007nI-90; Mon, 23 Oct 2023 20:10:33 -0400
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7b64810aebdso1178960241.2; 
 Mon, 23 Oct 2023 17:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698106230; x=1698711030; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5o/vcToECi4QgNxa/oeZJkGYImarRZqajfTlRbY8lGs=;
 b=kmgo1jMWr8vepoyUocjkOCwiXbR8HUsZDy/puk5Ryj2KfjE+A8oWibB8/VdQZ0WRuQ
 25big+ijV71DzHwcRdK9U/5//zuevqpXB0QxDE9vIbiK/WJryYjIi0oy+K7xssceQg63
 ICsH8wqoudfYaRtMyP1/rGtWlfl3CRGE31rMTrVLWjYZTD172jEF80tVezRgX5r7cdF8
 NCwQu2MfSnW37RiihVLtgi9QXbdW9MEJ/xA7pIF9WV3lUCmsxKbySytGV7dzDlHkkGKF
 too2sl9coB5LEIrA0mmhHlE7x/bdMtoAmU7t22yQh/G0HmdnsX6DaDXDPdWa8iZnE4jl
 F+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698106230; x=1698711030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5o/vcToECi4QgNxa/oeZJkGYImarRZqajfTlRbY8lGs=;
 b=p0mbIgH1R/LQZN7YmRiqmUAzBEdTkfsSbFFkeWxEX/AcB+uGQinLc78uQicC+mLijT
 vHvA43XzRv2nIrNapl5KFdQK5lJuewWlkQ3w1BULPqDyb1iU0rZ5g+xdhgcRMFw1v1tz
 Ucv2KokxhzYRf+bkvRJM+x39C/f27ai6ZmhlXY80elcRMImW1e1bJ/paArlJ0vtBoZlS
 vtyTUkpcAMlLZacFwnNF+N3u7AtEFU7SJyGKe3mR6WDdTkDYOrdm4FFMN6tJOwI2HdUI
 lfnQs1Idjq5Bl/WzQYyigIAZprmm6ziLEIFRB3BNvvBLVLtOrIY4UiOtYUpopEHmtnzL
 Oijw==
X-Gm-Message-State: AOJu0YzrNnJ7QaebYhW1AH/NTusTDHQnONp0MjXxatK1eO7YTR5jLGtX
 I8JknLmczeQS9xr4pSV1LkwR0N3GbsPRoNcEdio=
X-Received: by 2002:a05:6102:20dc:b0:458:aa1:e0d6 with SMTP id
 i28-20020a05610220dc00b004580aa1e0d6mr9786308vsr.0.1698106230177; Mon, 23 Oct
 2023 17:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-6-sunilvl@ventanamicro.com>
In-Reply-To: <20231019132648.23703-6-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Oct 2023 10:10:03 +1000
Message-ID: <CAKmqyKP6nb27XKpzu-zG1d7vE+5Xh3u=i7CMfzvztJAm+-d5xQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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
X-TUID: 2SGxtazrUxrG

On Thu, Oct 19, 2023 at 11:28=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.co=
m> wrote:
>
> Add IMSIC structure in MADT when IMSIC is configured.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 073c85f327..7f1a370e54 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -281,8 +281,20 @@ static void build_madt(GArray *table_data,
>      uint8_t  guest_index_bits;
>      uint32_t imsic_size;
>      uint32_t local_cpu_id, socket_id;
> +    uint8_t  hart_index_bits, group_index_bits, group_index_shift;
> +    uint16_t imsic_max_hart_per_socket =3D 0;
> +    uint8_t  socket;
> +
> +    for (socket =3D 0; socket < riscv_socket_count(ms); socket++) {
> +        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
> +            imsic_max_hart_per_socket =3D s->soc[socket].num_harts;
> +        }
> +    }
>
>      guest_index_bits =3D imsic_num_bits(s->aia_guests + 1);
> +    hart_index_bits =3D imsic_num_bits(imsic_max_hart_per_socket);
> +    group_index_bits =3D imsic_num_bits(riscv_socket_count(ms));
> +    group_index_shift =3D IMSIC_MMIO_GROUP_MIN_SHIFT;
>
>      AcpiTable table =3D { .sig =3D "APIC", .rev =3D 6, .oem_id =3D s->oe=
m_id,
>                          .oem_table_id =3D s->oem_table_id };
> @@ -307,6 +319,28 @@ static void build_madt(GArray *table_data,
>                                    s->aia_type, imsic_addr, imsic_size);
>      }
>
> +    /* IMSIC */
> +    if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
> +        /* IMSIC */
> +        build_append_int_noprefix(table_data, 0x19, 1);     /* Type */
> +        build_append_int_noprefix(table_data, 16, 1);       /* Length */
> +        build_append_int_noprefix(table_data, 1, 1);        /* Version *=
/
> +        build_append_int_noprefix(table_data, 0, 1);        /* Reserved =
*/
> +        build_append_int_noprefix(table_data, 0, 4);        /* Flags */
> +        /* Number of supervisor mode Interrupt Identities */
> +        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
> +        /* Number of guest mode Interrupt Identities */
> +        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
> +        /* Guest Index Bits */
> +        build_append_int_noprefix(table_data, guest_index_bits, 1);
> +        /* Hart Index Bits */
> +        build_append_int_noprefix(table_data, hart_index_bits, 1);
> +        /* Group Index Bits */
> +        build_append_int_noprefix(table_data, group_index_bits, 1);
> +        /* Group Index Shift */
> +        build_append_int_noprefix(table_data, group_index_shift, 1);
> +    }
> +
>      acpi_table_end(linker, &table);
>  }
>
> --
> 2.34.1
>
>
