Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01329E9A047
	for <qemu-arm@archiver.kernel.org>; Wed, 18 Feb 2026 15:51:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsjpW-0001iZ-8M; Wed, 18 Feb 2026 10:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dorjoychy111@gmail.com>)
 id 1vsjRM-0004hC-4Q
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 10:26:12 -0500
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dorjoychy111@gmail.com>)
 id 1vsjRK-0006Ks-87
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 10:26:11 -0500
Received: by mail-dl1-x1232.google.com with SMTP id
 a92af1059eb24-126ea4e9694so758617c88.1
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 07:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771428368; cv=none;
 d=google.com; s=arc-20240605;
 b=l3P9TqWXk3RE6kaJ5nN2ge4DZ50cEMw4dFui5FT3gjfhLY/zEECDwoKJPKw8wYSsH1
 mvjMm1secFmKYZ1fKhXMTCNcXLv5WlZGg0bU5xcp3d178IhAApj5UESj3RjsGRfDAjbv
 gaj+AebUWhqVny1zmw9MN5KvRG/RZNGyXgeB5L2K3dicRMMir/J0o0xAhZPKfCxHSu1i
 5GUjlBUYVrnKwmr/bM8TDtCymqcv3RRr8Hao4jrUqTvxFj58S75hynt3mIp3uuxNiKXo
 /HkwYLnjeLEzC6StkpPaRXZcCuPtz1/AFBxDrB1NyRPmw7MoWwUm/QPTejdfUifyNTxa
 9e8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2UsbvPdUzkpU92dkxDHalvZCOXMpxYS7kgECiTNSA90=;
 fh=NO1lEHYXQKCF065dJDdsDnCpO+k0qcGd2Z4J1148JlU=;
 b=QML8A/DUK++t2j/vMlpWB0Cu4S86hx9GBLt8MX1kzc0tAn71GZGR+6uEAa4+xzX0nF
 vExa0ULmk1P2OgRJKG2xsO7YWMVbkmR7mhXTiDtr/vSqFChJ8TDC4VpD8wcZeR1tMBjN
 W5K3ISTu/uEbNxCv051Rh88DgIdtunahkQnFfEJvuNhJnNJvG5gFQUNCxxmG48xn5K+u
 QcPBGYys4R0fMrl18fw0B3mIUPL7oCC+2tIqM138bgkN9QapIWaV4s7M4X803VBVdgKS
 EhvzLHr7euDJ87UUn4shtzyBSxJhHzRyr22d/Lh7Nh/J4FKtbg/b9VoFvJv+M9gD9wWz
 az2Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771428368; x=1772033168; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UsbvPdUzkpU92dkxDHalvZCOXMpxYS7kgECiTNSA90=;
 b=Cn+dFhAW5cNQ+idZrx+/eiGTMtU1tDYyCtFexIGMgBA4QPy6SpvunX3E/Cxdts7SlF
 TyLl1DLk6BxkIyD7/Z3jICb1CxLIdCnVwd58ovbgTvoMheudVI5CCCsKJPXwoeh4g4e0
 hLEEWq04ZfJYpTlSBDTXeb5isQpfeReQ+EZT8c76DAjVSyNb3UrHnuUVOmDZbaN0Ew0V
 7rlasmAAS9aQmTVtvwU8qSQlR/UBJXxNFehhak/zajJKaID77vp5KxfTTeYC/yAII25T
 aPo0zajLzkITXJlvy+kVOrILYPQl7ORYe0tfJqzg/XPW/aVePgs4IKz7aYTcreXH7cQT
 HJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771428368; x=1772033168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2UsbvPdUzkpU92dkxDHalvZCOXMpxYS7kgECiTNSA90=;
 b=GCiYA3f8IZBzv3Od6vWKZEd+1/MTVsxwBjZzjjy+MyIkUKJBlGVPdaGjJE2Rybdt5M
 3juKulmR/26Paggni54hwg/nOnaSpgerMCFTeU/bx/VN8l3Xkw12A9P6OacFbnLwNq5j
 DbXEaEpQeziw55ZF/2ZmB9PDWB+1VEg+503T7GNJ5Aqm2riXvRAxxvuVATrMv142x6KN
 NKM4FRJrQsy6ycdUyYu3500D4AFrKwLRpjgiVA9dZul++CKNL+u+wCWoHpHSRWrOUGPs
 VtK9t8dIRnvAFVxwkyF8ut49nXXn2tyx8DgTXTaeAxOQaB1+hK6htmU9wD45qTP8+PB8
 gWMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHY4mlcOawo0C3/JcZka7Lgo6L4ni9ENbF1xB+cwg0tAN/NHN+QkKX5wESsyzxvkorh4Ka+0VFeg==@nongnu.org
X-Gm-Message-State: AOJu0YwPyjtvwBs0rlvYXzoPZlhBlHIMpb61FEqhCnvyoY5tITnjemxT
 wRSJ2YkMey/+uusoq4N14w+MHnqmZLpOLbANk6MnXA6s6bvHnF8gp2PxdPKEP2JRYE4/n7+4H1Z
 yK5vKy+82ZCKdstOfyfyJG9Gifec/EL7d3Q==
X-Gm-Gg: AZuq6aL8RTnd4fDQaa7rXL6kSfdMH98rRyR5ymic2oE0pcSt2tjUsc6oOE01abw8Z2p
 1lHSuE68eWfq8qDZfnUtzgkPueaE6COQwCs8LKKID0C7uviKvgCVR+gAufA/SXRFixik6DHrcTd
 kbvdAtzmNBaIO2hIFKPWViKrVo+BpnrLjcg4wvG3KNy1MP0mcO53igXdGTTDygbgR0S1tKN4KcU
 IFB1RTDwELyBt1OiCmn/KesJFBhaI3O87RFDUAaD/Bk9e8IVxbCBAtvQVVg3uchmXMESHiNCwYv
 k7KWkltwyirb28CpGunX77ETX79n1Q9cSOKnIH6KGx0=
X-Received: by 2002:a05:6102:1621:b0:5fd:f2ad:c653 with SMTP id
 ada2fe7eead31-5fe1acde7ebmr7592163137.16.1771427580739; Wed, 18 Feb 2026
 07:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20260218015151.4052-1-graf@amazon.com>
 <20260218015151.4052-9-graf@amazon.com>
In-Reply-To: <20260218015151.4052-9-graf@amazon.com>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Wed, 18 Feb 2026 21:12:49 +0600
X-Gm-Features: AaiRm513RFggHu2TxwroliXKL5PLEVkM4Y1EBl3AzSXfa4BnC2Pr5o3HpsuJTqU
Message-ID: <CAFfO_h4xRp9RpP1_viAUbkuHG86q-S_tWunt_T2eC3Th3V=5NA@mail.gmail.com>
Subject: Re: [PATCH 08/10] hw/core/eif: Move definitions to header
To: Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 alex.bennee@linaro.org, 
 philmd@linaro.org, berrange@redhat.com, marcandre.lureau@redhat.com, 
 Cornelia Huck <cohuck@redhat.com>, mst@redhat.com, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Tyler Fanelli <tfanelli@redhat.com>, mknaust@amazon.com,
 nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1232;
 envelope-from=dorjoychy111@gmail.com; helo=mail-dl1-x1232.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Feb 2026 10:51:09 -0500
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Feb 18, 2026 at 7:53=E2=80=AFAM Alexander Graf <graf@amazon.com> wr=
ote:
>
> In follow-up patches we need some EIF file definitions that are
> currently in the eif.c file, but want to access them from a separate
> device. Move them into the header instead.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>  hw/core/eif.c | 38 --------------------------------------
>  hw/core/eif.h | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 38 deletions(-)

Reviewed-by: Dorjoy Chowdhury <dorjoychy111@gmail.com>

Regards,
Dorjoy

>
> diff --git a/hw/core/eif.c b/hw/core/eif.c
> index 513caec6b4..96f1d76578 100644
> --- a/hw/core/eif.c
> +++ b/hw/core/eif.c
> @@ -18,44 +18,6 @@
>
>  #include "hw/core/eif.h"
>
> -#define MAX_SECTIONS 32
> -
> -/* members are ordered according to field order in .eif file */
> -typedef struct EifHeader {
> -    uint8_t  magic[4]; /* must be .eif in ascii i.e., [46, 101, 105, 102=
] */
> -    uint16_t version;
> -    uint16_t flags;
> -    uint64_t default_memory;
> -    uint64_t default_cpus;
> -    uint16_t reserved;
> -    uint16_t section_cnt;
> -    uint64_t section_offsets[MAX_SECTIONS];
> -    uint64_t section_sizes[MAX_SECTIONS];
> -    uint32_t unused;
> -    uint32_t eif_crc32;
> -} QEMU_PACKED EifHeader;
> -
> -/* members are ordered according to field order in .eif file */
> -typedef struct EifSectionHeader {
> -    /*
> -     * 0 =3D invalid, 1 =3D kernel, 2 =3D cmdline, 3 =3D ramdisk, 4 =3D =
signature,
> -     * 5 =3D metadata
> -     */
> -    uint16_t section_type;
> -    uint16_t flags;
> -    uint64_t section_size;
> -} QEMU_PACKED EifSectionHeader;
> -
> -enum EifSectionTypes {
> -    EIF_SECTION_INVALID =3D 0,
> -    EIF_SECTION_KERNEL =3D 1,
> -    EIF_SECTION_CMDLINE =3D 2,
> -    EIF_SECTION_RAMDISK =3D 3,
> -    EIF_SECTION_SIGNATURE =3D 4,
> -    EIF_SECTION_METADATA =3D 5,
> -    EIF_SECTION_MAX =3D 6,
> -};
> -
>  static const char *section_type_to_string(uint16_t type)
>  {
>      const char *str;
> diff --git a/hw/core/eif.h b/hw/core/eif.h
> index fed3cb5514..a3412377a9 100644
> --- a/hw/core/eif.h
> +++ b/hw/core/eif.h
> @@ -11,6 +11,44 @@
>  #ifndef HW_CORE_EIF_H
>  #define HW_CORE_EIF_H
>
> +#define MAX_SECTIONS 32
> +
> +/* members are ordered according to field order in .eif file */
> +typedef struct EifHeader {
> +    uint8_t  magic[4]; /* must be .eif in ascii i.e., [46, 101, 105, 102=
] */
> +    uint16_t version;
> +    uint16_t flags;
> +    uint64_t default_memory;
> +    uint64_t default_cpus;
> +    uint16_t reserved;
> +    uint16_t section_cnt;
> +    uint64_t section_offsets[MAX_SECTIONS];
> +    uint64_t section_sizes[MAX_SECTIONS];
> +    uint32_t unused;
> +    uint32_t eif_crc32;
> +} QEMU_PACKED EifHeader;
> +
> +/* members are ordered according to field order in .eif file */
> +typedef struct EifSectionHeader {
> +    /*
> +     * 0 =3D invalid, 1 =3D kernel, 2 =3D cmdline, 3 =3D ramdisk, 4 =3D =
signature,
> +     * 5 =3D metadata
> +     */
> +    uint16_t section_type;
> +    uint16_t flags;
> +    uint64_t section_size;
> +} QEMU_PACKED EifSectionHeader;
> +
> +enum EifSectionTypes {
> +    EIF_SECTION_INVALID =3D 0,
> +    EIF_SECTION_KERNEL =3D 1,
> +    EIF_SECTION_CMDLINE =3D 2,
> +    EIF_SECTION_RAMDISK =3D 3,
> +    EIF_SECTION_SIGNATURE =3D 4,
> +    EIF_SECTION_METADATA =3D 5,
> +    EIF_SECTION_MAX =3D 6,
> +};
> +
>  bool read_eif_file(const char *eif_path, const char *machine_initrd,
>                     char **kernel_path, char **initrd_path,
>                     char **kernel_cmdline, uint8_t *image_sha384,
> --
> 2.47.1
>
>
>
>
> Amazon Web Services Development Center Germany GmbH
> Tamara-Danz-Str. 13
> 10243 Berlin
> Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
> Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
> Sitz: Berlin
> Ust-ID: DE 365 538 597
>

