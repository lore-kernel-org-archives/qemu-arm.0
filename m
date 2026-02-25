Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F59FD3775
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 16:28:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvHkL-0004T9-Fx; Wed, 25 Feb 2026 11:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dorjoychy111@gmail.com>)
 id 1vvHkJ-0004SK-Sz
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 11:28:19 -0500
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dorjoychy111@gmail.com>)
 id 1vvHkH-00071W-SB
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 11:28:19 -0500
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-94abd52b274so1795503241.3
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 08:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772036896; cv=none;
 d=google.com; s=arc-20240605;
 b=VVwZeq3qaXPIwpJJewsdY0RNJxNyL0kNEwfsBTYJcHxXLb6rlc8jRO1OeDT7WwPVP6
 tH6tbHGB/wyd2X+ZSOWxCnSi2+6B7YQ1JQw6j2S9pBj5Z2kxNxy74eyrjVF2gmFKYeg5
 bOV0OX+Ucxbw57zso3C0D5kUEhAdW1Sp1aNsWvEw5wTARIUmZc5BJoAR7fYtQPtMakMb
 6dvOP0rFdYvW+ZByT6trQEhtJndgcFXTavOT5WDcbj7nC5x20wYWlJIq9uFqmGd+lN2J
 5KxfYAInptCRjJiKlJj4zqMvu1+IdEuozRcdliZqj9yN4NA0AS4rXMjGiC0DVs0qtjKP
 P5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Vvci/+7r/OdPSUDlYxPdHT/Wh6SfWVCuXQx4g5hxCyY=;
 fh=ikSADa3l0NJOOjFd9yOhz7fySJXbB0CA+MgdNiznDV0=;
 b=HWuY/wtom6J0p2m6opHKChZi8UW/0g7vZIOFzNOPAq3xG5XT5p6sbkhRjjcG1MmqF1
 +ec2RU0ALVI6wBkRnJGM0C9v6qqSOBrjk/lDHZS8xO6H5eKtdiIaWIltxBOMV+dl2Ymp
 2wGefvfvTo0CMexgPxpbwqrPL2Dk2vvxt6Y0zRbNyABgobidDb4Wx0XnwEYIz5m7nFU6
 MrH5s10O5Nc+dXCRbaPeAnxcOQy2R6h1geWmw76XRqMMyc0mmf+2RSQTZGFF086RTXSQ
 DAe5JTiIT4/ZHmaNBP2TRlltHQov17vUHkimw82/sbDmYKzKX1tShRq7m3UcBWvmqSpA
 ZqQA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772036896; x=1772641696; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vvci/+7r/OdPSUDlYxPdHT/Wh6SfWVCuXQx4g5hxCyY=;
 b=XdntenJyu6iHmn4lXQhjckIEj6hgxgOxuSBe+WFAnT3V8pywRzS2V+jSQKxfCCjY/x
 VIBuAOfL3zlc1gr0qg+ESAjn3BQvP7y8RfnMRrHXnSOgTg9LyPxh/0hKCdPc9pEMPQj1
 u5Zsz7LOJR2bUDi5J5xH8hODywDuJNubbwu3zvGf3coYM6bHZR+M1ohLZdzq9d95H3QT
 goOyiIWDc/nGhnPkWMhE+54QGtb5SoXAlqJm1GyUhQ0xTAyaUNN3x2QyAo+DCD7ABfNJ
 I7I0Ggu72SLLZ15uw0eXM7trTVsc9pru2DCovdigbnQpTE7aut9MUxbtMPtzt8GyUz1O
 yWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772036896; x=1772641696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vvci/+7r/OdPSUDlYxPdHT/Wh6SfWVCuXQx4g5hxCyY=;
 b=Q8sHuMhihWgyOkWKsATc7wqY417IVEi9o5YCYU6Z2+u0XeJdMUBydCcV17XNLTICXw
 9chkSu0v8f70jl6lOvgf0ygtmztYBdk2Q+ZDZLT7Zr5xXtHW8yOChZ78YMyjFbGa+XyZ
 6vKk7D5GqwKJkHXt+/x6oec7jOo7qeU0tfVJxdJbSJtXc8fU7XdQWunYJ2Hr6NWdvsoH
 fD6Kac7KJ5hTCrvBFhFwgnXNBlmDGg7gO4IK5446ddPuwVp0lNlo/v/qJn7s3F5IZMH5
 DeQBbh+mu0Ci3dBoCplNmp5AwZMkfcVaLtyEI9WgrOj2bqGxOiN/31A60kD3EoQ3jsnq
 D4BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfPXBSJGL1sZjagtk5AtqM6y17BSIB+6W2CVvF3C10NpCsvAVBY7rUgFVP94aB8pSstYQxhiJ9+A==@nongnu.org
X-Gm-Message-State: AOJu0Yzbltcn0MRJzUV20Bf+tw+RMfhavtikB4U3t72Np9zrV0oMIBsV
 UWYTKNsLgSnCFCTRrqrczDc8mEWn0RhLZxiVwcPMJiP6WeErVWZ5T09yPL5Ooac6FKc0u4Wc/jd
 rsgQ0tOlfTLds1CmNvEz2L/z8KaVHQ/A=
X-Gm-Gg: ATEYQzz9CV57rililslCdAQ9KF12rD7qgfkmlcs6nIvlPYrBUKy56jTJvm9xEm7ihmh
 dUAtmmYxLVivrGf8DIlltwx7DKC3lErhPxOgE+S2RTer9J5QTh5Lzf+J9yflantaXaE2cG2luZs
 +7+QBdz1jpzGzfYMyuRu2YQeVUrb9NKkbtTSLXjsw0uCX05nj+DJxQ/EDXD8kbv+jBhJS3+Z2JB
 u7jEW+353eoPf/ZM+T43rETngFtYbja1TUKTVxgXtxJ4tigl2K2Licbiw3S8cmyw+F9ixa7Pqrl
 xA3Km55nTVHIvlkzDScjD2kxudBaVOmXr4lwH0yYmRU=
X-Received: by 2002:a05:6102:c04:b0:5ef:ac78:3c71 with SMTP id
 ada2fe7eead31-5feb2f03598mr5193893137.14.1772036896163; Wed, 25 Feb 2026
 08:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20260225144532.84673-1-graf@amazon.com>
 <20260225144532.84673-11-graf@amazon.com>
In-Reply-To: <20260225144532.84673-11-graf@amazon.com>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Wed, 25 Feb 2026 22:28:04 +0600
X-Gm-Features: AaiRm52dz4nk8-egxiEvKdgM7dHszttAgHxDDx5wsEcMG9cHs_HrrWunQiWhjEs
Message-ID: <CAFfO_h4RaLGni60-EitiqBPZn08gem20McpHpLqcSU07rAEzgw@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] hw/nitro: Enable direct kernel boot
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=dorjoychy111@gmail.com; helo=mail-ua1-x92b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Feb 25, 2026 at 8:47=E2=80=AFPM Alexander Graf <graf@amazon.com> wr=
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

Maybe these eif building functions make sense in the hw/core/eif.c
file. There we already have the parsing code, so maybe these functions
complement the code there. That way we wouldn't need to move the EIF
structures etc into the header file in the previous commit.

Regards,
Dorjoy

