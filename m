Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85B7FCE09B
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 14:46:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvcd3-0002bx-Aj; Thu, 26 Feb 2026 09:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dorjoychy111@gmail.com>)
 id 1vvccs-0002aX-Nz
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 09:46:04 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dorjoychy111@gmail.com>)
 id 1vvcco-0006OJ-DG
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 09:46:00 -0500
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-5ff0c095b69so678323137.0
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 06:45:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772117157; cv=none;
 d=google.com; s=arc-20240605;
 b=A576LV4k6ZQJnDxebyPvGYwcLfR/WJABQpWIA7EX7QlpPcEYUmGY1d29w6sww3J5Pu
 DqgPLdrhuTl+0HADLnmAYpAvFp1LD40ZlLA7917nLqCuenrM1UB4nOLAWyXNYsnKuZvV
 1zc7DNK6XEr8LQt7X5rwKTAP6fHnuE7JH6yYROABvNGhvDY61qkxqufcTW0Hm/BiGq4F
 2exTsIzRrN6VxJ4pKv9Ir3BCkKFnjPS87SnTmdvFSwB7f+qCVa3FD6wqTFOHKrNNgaLu
 I3EPEhYXDgy/uIedZiDDvNPEBMB4vJy/GiyROPvksnkwYE4/duDCKM78jpRpeRmXVom5
 7w7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=C452zTfBbAXAGkhCMs/t9Amzk4sI1gHu6f9LEBLYONY=;
 fh=9oy696J2XS1hv/Q1/DmU5nM9fyMpAa1VITzmYThHaa4=;
 b=WcWZ29T8mcUu42FJ/3P1qc1MhQdMnprXh9CfcWx2i53Xgq0rvSNRxala7D7BvNGprG
 siuGOT1E/D+qoLT+B+/r7GCT3dExnkbqF+EeVa1EBA8JTV0JI1kSy1ysuZjKU/q41XB3
 pktYnpy/vObtvgdpNahDe1FDRcBmXqgcOUpthFXCFxxfQ7rb9475HH3P+hSI3OGuhkAf
 64tG9Rlm5bt81x1Qhvr9yYKADXpOvDqvFyqP/QydgE9Lw1zdC5AlzXO+2bKxPUq54jQv
 UZ+GIh1ATP9W8mzHRduo++S1HrvdSxdtVyOHV4ojsBJHLU5V1QBjnFSoREF6gJiQYe9b
 VqCg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772117157; x=1772721957; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C452zTfBbAXAGkhCMs/t9Amzk4sI1gHu6f9LEBLYONY=;
 b=EjaAMJK89ZXGmKyPBqZSvkugiM7r5GtfkQtqBKixICkKzAsHSaJKSPwl6iiHKc4OLb
 +ZjWnFBS+8Vxq0C5ef1SMpQA4ndGtxx3AsPxlTLFqcfSKkECF1ZEdI0Q32fd+uPoUOIG
 nChv26XR2d8SIFNa5t+/vshl5OzB9kmIy8E6j1wRXTz0fx0V6Tz0k3ysQKCdHNHUqc33
 LZgs/YEAsT8cGt9psRS8RJGu7qMLIsGjQSCRFPfY/3SO00qP7C72wQuW76SuG9HFH1/i
 qLyOuQPQmI9XiB7Nt6yKYVZi0zMVugsSHhDpc2Owd89Ilkq6nkqqNOcMUoa3B74QS2o1
 CUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772117157; x=1772721957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C452zTfBbAXAGkhCMs/t9Amzk4sI1gHu6f9LEBLYONY=;
 b=fKx8WrVMT5WZpx8jTjlP1rkwP3NMpNWvFeno3h+4lgLW16EFRPfWNHA4x/4/tyLBzc
 79qKgh7XaKAbq+LJm8YzXrZblsnXGdFWb3hbwNEpsgwEKqUSXCd7tAUBItKzHSV1ZkrT
 2jqjsMK2SAn/7W+ICL+zuJzLZ14MjyrFuGB2/kh1KOHJ70N01nnVHyzA5/LYlyZBKApH
 tMQc7NVs7CmdqBmhTynGo6w0M3MF9v5Sq6jL9CSLJi7MXLYXtYpQvfUtkCjwm6kprG/K
 jrO1Y4bi1SNugkPoRB0K52qXa8rhO0CxHPmZBBlP1y8J/y7r8qbnnoq5suNfyP3gnB9p
 2IXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWut8FW3s1LJU5fvXHsWUvPZ9DGu7/X4pfO64MsB+kP572qsz4ByM9xLxuuTy4FqywmfN54vbc0AA==@nongnu.org
X-Gm-Message-State: AOJu0YxIqWU++sofxVxm98nYai0C2iY518R0XBb/rHCmLczr9qY1GMrO
 kUamJuFl51dGR7B/Jg6JvVOb4orbAxTKDZCWcMVWzKnZeSURN7AmdXxtgW2xoHM2ZlQwKI1OooD
 eFFC0LUYIE3yqCUMma+OnXhwWYQpgBpc=
X-Gm-Gg: ATEYQzzqM1TGXoe8V0BUQNLhMsCblL5hBJ3OVD4qlxrjdd+H/SnBJMUcvOXOsRBpNcH
 inoK1cO4V8XrDd44cYbKB+rqIWls4Sz6Uw0S9HNxUXVUkX3SRa6A/128ajQLgJ1IjClaFhSg4NN
 gU8BsdNfL4wbA+wWmDbk5M+OpiB0g40RyaVC4uuUKweg0w1X4Zp+qJ+REp6xurWfsI6Bu1etN51
 nsldFcIHC37XHOIOFgCsM/p4+OtAG1IryGkbBlqFNOEB+GpQH0vvgC3bWDWjAms11yBdNCzbllK
 VL/xoQVWo/sL1EGcTkm7grLbRqe9rNIS2IrO9GNbbg==
X-Received: by 2002:a05:6102:3a0c:b0:5f5:2b1c:7551 with SMTP id
 ada2fe7eead31-5ff20b98161mr1237390137.19.1772117156789; Thu, 26 Feb 2026
 06:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20260225220807.33092-1-graf@amazon.com>
 <20260225220807.33092-11-graf@amazon.com>
In-Reply-To: <20260225220807.33092-11-graf@amazon.com>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Thu, 26 Feb 2026 20:45:44 +0600
X-Gm-Features: AaiRm511qfrZmQJTBFYOd3G8idXlDFQW3noTE5elOQpZ4EmnosyZ6oCqfPHpzNI
Message-ID: <CAFfO_h6KOdwsL7Z_F89cnfMQWLi9AB2Rp2fN=+bw1derf-tJMQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] hw/nitro: Enable direct kernel boot
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=dorjoychy111@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Feb 26, 2026 at 4:09=E2=80=AFAM Alexander Graf <graf@amazon.com> wr=
ote:
>
> Nitro Enclaves can only boot EIF files which are a combination of
> kernel, initramfs and cmdline in a single file. When the kernel image is
> not an EIF, treat it like a kernel image and assemble an EIF image on
> the fly. This way, users can call QEMU with a direct
> kernel/initrd/cmdline combination and everything "just works".
>
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>  hw/core/eif.h        |   3 ++
>  hw/nitro/machine.c   | 116 +++++++++++++++++++++++++++++++++++++++++++
>  hw/nitro/meson.build |   2 +-
>  3 files changed, 120 insertions(+), 1 deletion(-)
>

Reviewed-by: Dorjoy Chowdhury <dorjoychy111@gmail.com>

> diff --git a/hw/core/eif.h b/hw/core/eif.h
> index a3412377a9..0c432dbc2d 100644
> --- a/hw/core/eif.h
> +++ b/hw/core/eif.h
> @@ -12,6 +12,7 @@
>  #define HW_CORE_EIF_H
>
>  #define MAX_SECTIONS 32
> +#define EIF_HDR_ARCH_ARM64 0x1
>
>  /* members are ordered according to field order in .eif file */
>  typedef struct EifHeader {
> @@ -49,6 +50,8 @@ enum EifSectionTypes {
>      EIF_SECTION_MAX =3D 6,
>  };
>
> +#define EIF_MAGIC { '.', 'e', 'i', 'f' }
> +
>  bool read_eif_file(const char *eif_path, const char *machine_initrd,
>                     char **kernel_path, char **initrd_path,
>                     char **kernel_cmdline, uint8_t *image_sha384,
> diff --git a/hw/nitro/machine.c b/hw/nitro/machine.c
> index e28c8e9bf5..8849959359 100644
> --- a/hw/nitro/machine.c
> +++ b/hw/nitro/machine.c
> @@ -32,9 +32,104 @@
>  #include "system/nitro-accel.h"
>  #include "qemu/accel.h"
>  #include "hw/arm/machines-qom.h"
> +#include "hw/core/eif.h"
> +#include <zlib.h> /* for crc32 */
>
>  #define EIF_LOAD_ADDR   (8 * 1024 * 1024)
>
> +static bool is_eif(char *eif, gsize len)
> +{
> +    const char eif_magic[] =3D EIF_MAGIC;
> +
> +    return len >=3D sizeof(eif_magic) &&
> +           !memcmp(eif, eif_magic, sizeof(eif_magic));
> +}
> +
> +static void build_eif_section(EifHeader *hdr, GByteArray *buf, uint16_t =
type,
> +                              const char *data, uint64_t size)
> +{
> +    uint16_t section =3D be16_to_cpu(hdr->section_cnt);
> +    EifSectionHeader shdr =3D {
> +        .section_type =3D cpu_to_be16(type),
> +        .flags =3D 0,
> +        .section_size =3D cpu_to_be64(size),
> +    };
> +
> +    hdr->section_offsets[section] =3D cpu_to_be64(buf->len);
> +    hdr->section_sizes[section] =3D cpu_to_be64(size);
> +
> +    g_byte_array_append(buf, (const uint8_t *)&shdr, sizeof(shdr));
> +    if (size) {
> +        g_byte_array_append(buf, (const uint8_t *)data, size);
> +    }
> +
> +    hdr->section_cnt =3D cpu_to_be16(section + 1);
> +}
> +
> +/*
> + * Nitro Enclaves only support loading EIF files. When the user provides
> + * a Linux kernel, initrd and cmdline, convert them into EIF format.
> + */
> +static char *build_eif(const char *kernel_data, gsize kernel_size,
> +                       const char *initrd_path, const char *cmdline,
> +                       gsize *out_size, Error **errp)
> +{
> +    g_autofree char *initrd_data =3D NULL;
> +    static const char metadata[] =3D "{}";
> +    size_t metadata_len =3D sizeof(metadata) - 1;
> +    gsize initrd_size =3D 0;
> +    GByteArray *buf;
> +    EifHeader hdr;
> +    uint32_t crc =3D 0;
> +    size_t cmdline_len;
> +
> +    if (initrd_path) {
> +        if (!g_file_get_contents(initrd_path, &initrd_data,
> +                                 &initrd_size, NULL)) {
> +            error_setg(errp, "Failed to read initrd '%s'", initrd_path);
> +            return NULL;
> +        }
> +    }
> +
> +    buf =3D g_byte_array_new();
> +
> +    cmdline_len =3D cmdline ? strlen(cmdline) : 0;
> +
> +    hdr =3D (EifHeader) {
> +        .magic =3D EIF_MAGIC,
> +        .version =3D cpu_to_be16(4),
> +        .flags =3D cpu_to_be16(target_aarch64() ? EIF_HDR_ARCH_ARM64 : 0=
),
> +    };
> +
> +    g_byte_array_append(buf, (const uint8_t *)&hdr, sizeof(hdr));
> +
> +    /* Kernel */
> +    build_eif_section(&hdr, buf, EIF_SECTION_KERNEL, kernel_data, kernel=
_size);
> +
> +    /* Command line */
> +    build_eif_section(&hdr, buf, EIF_SECTION_CMDLINE, cmdline, cmdline_l=
en);
> +
> +    /* Initramfs */
> +    build_eif_section(&hdr, buf, EIF_SECTION_RAMDISK, initrd_data, initr=
d_size);
> +
> +    /* Metadata */
> +    build_eif_section(&hdr, buf, EIF_SECTION_METADATA, metadata, metadat=
a_len);
> +
> +    /*
> +     * Patch the header into the buffer first (with real section offsets
> +     * and sizes), then compute CRC over everything except the CRC field=
.
> +     */
> +    memcpy(buf->data, &hdr, sizeof(hdr));
> +    crc =3D crc32(crc, buf->data, offsetof(EifHeader, eif_crc32));
> +    crc =3D crc32(crc, &buf->data[sizeof(hdr)], buf->len - sizeof(hdr));
> +
> +    /* Finally write the CRC into the in-buffer header */
> +    ((EifHeader *)buf->data)->eif_crc32 =3D cpu_to_be32(crc);
> +
> +    *out_size =3D buf->len;
> +    return (char *)g_byte_array_free(buf, false);
> +}
> +
>  static void nitro_machine_init(MachineState *machine)
>  {
>      const char *eif_path =3D machine->kernel_filename;
> @@ -74,6 +169,27 @@ static void nitro_machine_init(MachineState *machine)
>          error_report("nitro: failed to read EIF '%s'", eif_path);
>          exit(1);
>      }
> +
> +    if (!is_eif(eif_data, eif_size)) {
> +        char *kernel_data =3D eif_data;
> +        gsize kernel_size =3D eif_size;
> +        Error *err =3D NULL;
> +
> +        /*
> +         * The user gave us a non-EIF kernel, likely a Linux kernel imag=
e.
> +         * Assemble an EIF file from it, the -initrd and the -append arg=
uments,
> +         * so that users can perform a natural direct kernel boot.
> +         */
> +        eif_data =3D build_eif(kernel_data, kernel_size, machine->initrd=
_filename,
> +                             machine->kernel_cmdline, &eif_size, &err);
> +        if (!eif_data) {
> +            error_report_err(err);
> +            exit(1);
> +        }
> +
> +        g_free(kernel_data);
> +    }
> +
>      address_space_write(&address_space_memory, EIF_LOAD_ADDR,
>                          MEMTXATTRS_UNSPECIFIED, eif_data, eif_size);
>
> diff --git a/hw/nitro/meson.build b/hw/nitro/meson.build
> index e3f1895890..b9bd0d4300 100644
> --- a/hw/nitro/meson.build
> +++ b/hw/nitro/meson.build
> @@ -1,4 +1,4 @@
>  system_ss.add(when: 'CONFIG_NITRO_VSOCK_BUS', if_true: files('nitro-vsoc=
k-bus.c'))
>  system_ss.add(when: 'CONFIG_NITRO_SERIAL_VSOCK', if_true: files('serial-=
vsock.c'))
>  system_ss.add(when: 'CONFIG_NITRO_HEARTBEAT', if_true: files('heartbeat.=
c'))
> -system_ss.add(when: 'CONFIG_NITRO_MACHINE', if_true: files('machine.c'))
> +system_ss.add(when: 'CONFIG_NITRO_MACHINE', if_true: [files('machine.c')=
, zlib])
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

