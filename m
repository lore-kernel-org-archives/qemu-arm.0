Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp259693ejm;
        Thu, 20 Apr 2023 01:06:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZOkLELz7RwvhJZpYUlFigBpYiz2EoM0nLgWYH1JcmiyCutPTc93GsIeTNNg5va0UtAo5Vt
X-Received: by 2002:ac8:5a8c:0:b0:3ea:16fe:5c9e with SMTP id c12-20020ac85a8c000000b003ea16fe5c9emr694991qtc.31.1681977983195;
        Thu, 20 Apr 2023 01:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681977983; cv=none;
        d=google.com; s=arc-20160816;
        b=D3w7uG9cPYejWuq4UUyXwNLzC6TcKEHVwnIn8KkxGtoCk079lXCEsG5+pMS3HRd8MD
         np8IOELsoC9HgloMPjo4I1qjd87BttKf3gWWTb3gcVXHrf/3U/kPLOtrVDQTq2yCPW3n
         +/RVZqL9YO1/HktEU1QtHVH33nLLYTS6uUGDKVhjUmAbBwzMWATJr90pb1iD4jgWiK1+
         1UG3ZwXnmuDzW6BDhQ9/YDkIZjLbXyn3vnFg9w/iiYEbBi+fdMh0xCobQOeMaMoN83sn
         V5zl6L2A99NVaw4vW9Xgz2AhU+b9ojRWDsG+jiXgUaygdeStwZvmwdv6FphZE9quClj8
         gyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CKOxyyL7AZDnCvvz/47DzqTsQzjXr1KI0sjQMLGyFPM=;
        b=a7njCD2hKPS4r3g+PgDVJ3oUSfVThoA8Hov4J5Kb9BQokjAaTQHBrqRJpegDnLFSr/
         2d45O5k7k2FSb+eP2Qm3yAWfB8pV4Lb7eSLuFBMQJTFZvtWMT28V6a/4vgSYX8MdktMA
         fvpehFZtIAvZV0bvlOsyygqt/XrRNWExq43rBS+A79smYXOgjaIBa9wkrj4/BjY5plg3
         fUcd4zmClsZtz2P60kTTghhHMwSX7z2aEJYSXc0yqvIAGJmZtRLhXUIO1OTFIUh2IZHg
         XYpYvoU487Y1g8dP8R8n2DskQag1soX8cnonPRqQgNpi139WidQG1U+DSSzTLeEj2Wdr
         XmKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@anisinha-ca.20221208.gappssmtp.com header.s=20221208 header.b=CxSQrP5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020ac8584a000000b003ef311b781bsi942230qth.315.2023.04.20.01.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Apr 2023 01:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@anisinha-ca.20221208.gappssmtp.com header.s=20221208 header.b=CxSQrP5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppPJ1-0003Ai-Sw; Thu, 20 Apr 2023 04:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ppPJ0-0003AF-50
 for qemu-arm@nongnu.org; Thu, 20 Apr 2023 04:06:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ppPIy-0007oK-0v
 for qemu-arm@nongnu.org; Thu, 20 Apr 2023 04:06:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 bi21-20020a05600c3d9500b003f17a8eaedbso2640275wmb.1
 for <qemu-arm@nongnu.org>; Thu, 20 Apr 2023 01:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20221208.gappssmtp.com; s=20221208; t=1681977970; x=1684569970; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKOxyyL7AZDnCvvz/47DzqTsQzjXr1KI0sjQMLGyFPM=;
 b=CxSQrP5jya5slh9FsYs/6Sou+yduTsad6fuRzV6FsxhHN0Gqp2Sn3aTutsd4Q6MuEW
 wk8tfNfyhOqYiUBY7xF8MNLjgLGoobnzKBS8Lp/BFFBbkwzkRfyOPR7WSlWgVZHsnLXS
 e+QTomYo8Gh0MezXjgnJ22xCzou8huZZ8xyYqdmMQ/wLNZmVaEXj2NSewhuq6lOU1TSg
 8YknAeyiXld9stY3KJjLlGl3Mv8GLbrNRxyaeCNT3Es83x8tDn6F4ZB6bfvAIC2ZzTf2
 ZQfQpQmbD4xAP1K/BWCq0DH0hSvH3G93SSvNfXZvJQnttx0gJE2Irrd4huqPhIq7JMzV
 B1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681977970; x=1684569970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CKOxyyL7AZDnCvvz/47DzqTsQzjXr1KI0sjQMLGyFPM=;
 b=FxWLs02MF4LsHNs7WBq0OHm8tjvO5B0GH0LWDzbIbz8QJyFvaeHpg2htED5UaLANci
 ev4of461tgKzIXK8DmTftA9BkJNaX5Vvc6cMc5Epg4iYyhm4du8CAE8kutG530LzK21k
 fKqgVUDvxdn1qyFxshsvyVUbiazNMdsIi/C6JTIQJfgixV5ZdcGS1Wa5+FagdlVAHZeR
 XpUqbUhMuqAGNGu8IIbQcM0ew7p2UbTDJx0ABlDhu9w34gNqSyA+SzVElDOFktqdE52J
 peTztMt5zy54RtpoQ3FJelKxs1NicwmouDzBjR1dGYZyJ8UIhbP0g9fG5QZJiNvg9obT
 HdNg==
X-Gm-Message-State: AAQBX9fJyCCJtR7nAN5t2DryuI7T2lxAh2IFlMtgfjsc86rvH/j/MtSg
 6W6MtYWcRhSfyuE61Utei3ExIf2pkKNSgQAz5TibEQ==
X-Received: by 2002:a05:600c:2182:b0:3f1:6527:df05 with SMTP id
 e2-20020a05600c218200b003f16527df05mr606024wme.22.1681977969831; Thu, 20 Apr
 2023 01:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-4-eric.devolder@oracle.com>
In-Reply-To: <20230418165219.2036-4-eric.devolder@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 20 Apr 2023 13:35:58 +0530
Message-ID: <CAARzgwwVAptvsR1_8ttUKroLuqKdLc1dHWtNe7S0S3N-Nq4otw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/acpi: i386: bump MADT to revision 5
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com, 
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, richard.henderson@linaro.org, 
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::336;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HhRHB0dZ7qbD

On Tue, Apr 18, 2023 at 10:22=E2=80=AFPM Eric DeVolder <eric.devolder@oracl=
e.com> wrote:
>
> Currently i386 QEMU generates MADT revision 3, and reports
> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
>
> For MADT revision 4, that introduces ARM GIC structures, which do
> not apply to i386.
>
> For MADT revision 5, the Local APIC flags introduces the Online
> Capable bitfield.
>
> Making MADT generate and report revision 5 will solve problems with
> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
>
> Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devol=
der@oracle.com/T/#t
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/i386/acpi-common.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 52e5c1439a..286c1c5c32 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *a=
pic_ids,
>  {
>      uint32_t apic_id =3D apic_ids->cpus[uid].arch_id;
>      /* Flags =E2=80=93 Local APIC Flags */
> -    uint32_t flags =3D apic_ids->cpus[uid].cpu !=3D NULL || force_enable=
d ?
> -                     1 /* Enabled */ : 0;
> +    bool enabled =3D apic_ids->cpus[uid].cpu !=3D NULL || force_enabled =
?
> +                     true : false;

how about "processor_enabled" instead of just "enabled" as the variable nam=
e.

> +    /*
> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> +     * if Enabled is set.
> +     */
> +    bool onlinecapable =3D enabled ? false : true;

ugh, how about uint32 onlinecapable =3D enabled? 0x0 : 0x2 ?

> +    uint32_t flags =3D onlinecapable ? 0x2 : 0x0 | /* Online Capable */
> +                     enabled ? 0x1 : 0x0; /* Enabled */

then here, flags =3D onlinecapable | processor_enabled? 0x1 : 0x0;

>
>      /* ACPI spec says that LAPIC entry for non present
>       * CPU may be omitted from MADT or it must be marked
> @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *=
linker,
>      MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MACHINE(=
x86ms));
>      AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(adev);
> -    AcpiTable table =3D { .sig =3D "APIC", .rev =3D 1, .oem_id =3D oem_i=
d,
> +    AcpiTable table =3D { .sig =3D "APIC", .rev =3D 5, .oem_id =3D oem_i=
d,
>                          .oem_table_id =3D oem_table_id };
>
>      acpi_table_begin(&table, table_data);
> --
> 2.31.1
>
