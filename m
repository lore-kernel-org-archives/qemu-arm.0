Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp235898ejq;
        Tue, 16 May 2023 00:26:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rIQCb+bpSWfow/s4brtNwuQvsOq7pVGYP3eifahklbigFTewJj3W4iSya3236nDFl0IxQ
X-Received: by 2002:a05:622a:387:b0:3ef:28dc:fdd0 with SMTP id j7-20020a05622a038700b003ef28dcfdd0mr57111570qtx.44.1684221976872;
        Tue, 16 May 2023 00:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684221976; cv=none;
        d=google.com; s=arc-20160816;
        b=SGJAElOfFz7iGHzT4V5XVqWGYsKne0/EdZqCOzgy9/oW/J5CYrqfnbZM0F2j5R7VuT
         EVix6DPmHMZWHQSRIfJMkqa7XnomcNR1Z6y+AOkbv35YtsvskWyXJNx3xXLmKVVyO36Z
         1hjm/Wr416J/FYVg7HtD39IaS4wQ+wRc6q++Vyuj2pXYd63wme7Nt6YtO0BbqpoRJWyA
         PJm+FLoQsD2tRgdpn5cY8cTp7rarlJFT3IIGTY62eXK1VyCpHX/MWqytcxdZjEppvoKM
         SaXgzPZ0I1o8qAiHgZcxaCOEzIkjt5GF/j742AWo01YeyakZVuIPAnjrL7VwtuzNvYJf
         zjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ezlM8Es+XSXRFIHZdp4OqyXuLK6zFFQqlNU9vq/9klA=;
        b=OjnDhk571I+Z32wc1RD2unD4Zm8yl3yl3nmx7WCLp0MnW6OSy03WSkZADb3JbMT/Qi
         h3JjJtP0gXxOjZVl2t4G5zjepaxSwF8EBrMRgns/BEU8ZDjGPrNWGsfO98p86tdW+HYl
         BwJG/AEhEn1ff3jwO3RnXzQJJg/Hpq8k0UkgVoE7Ip3FHHT236K6rKI3nKB5N12Hkk3h
         43SHyAQ59Z5BnjaspMiCIF/RPwLtUk1dSJdDccJ0hm9Qz7KpQHGZY/tRqVFfLBoWIUhO
         H7kwf+bf4aVi7XS3umYqAesLvrJ/e1MQhppOihR6bmyougLZHrJrPFd1cc5o0k13mM9o
         feSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@anisinha-ca.20221208.gappssmtp.com header.s=20221208 header.b=BbI5Hrdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020ac87e87000000b003d52e0543d2si10907496qtj.268.2023.05.16.00.26.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 00:26:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@anisinha-ca.20221208.gappssmtp.com header.s=20221208 header.b=BbI5Hrdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyp4M-0002Nj-Ow; Tue, 16 May 2023 03:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1pyp4K-0002Ky-Rh
 for qemu-arm@nongnu.org; Tue, 16 May 2023 03:26:00 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1pyp4J-0007dW-2h
 for qemu-arm@nongnu.org; Tue, 16 May 2023 03:26:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso3091718f8f.0
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 00:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20221208.gappssmtp.com; s=20221208; t=1684221957; x=1686813957; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezlM8Es+XSXRFIHZdp4OqyXuLK6zFFQqlNU9vq/9klA=;
 b=BbI5Hrdn53lZMZT8u4v+LqXfsi3mdPP3WEKdYO9WMD9Ra8fY0ccupCisGG5kROL9ew
 HVDZ8laKeOFBwrXMvyLvqy1uqPa2/7/kX+2WdNlxgg6Q8UBPzBzSEeTff0UcH4bmslTR
 EgcIxJknyN/V8QkFEoXGpOFIu11pdBmylbzUzX4W+brfQ1Clmzk66UxOIcUFjaKvBD6I
 TErZ0vNeH9WrwEoYeFXTzlXQIFdTtZnpdmd02JyN+sljIe+KuzNFGOJDkQ82o/G+xPKx
 nDEMP1H4PSgl7MUsNB7re1tw3qSO+Kc49nviVQH9bjwvD1zICWGUiPuxWcXLeGhzK5Mi
 giHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684221957; x=1686813957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ezlM8Es+XSXRFIHZdp4OqyXuLK6zFFQqlNU9vq/9klA=;
 b=Mt/pNEetwIpHXVBzpKgcyLWzdxdr9XFSNgE62sTescPBIM+FtePYLvg4/ICINHaJIW
 lZdJS/QXVsT8SRefc3Q66iVm751JkcsUgIlnGeaMujaJczu9GUI3IIflrY+l/qlLcaaL
 /NcIr4CWtVSlC2EO0RxDjOqfra66Uuy/AH9e++arejlcXGmq3wNKFpMMYkGrs5AeEPpx
 yaFjjyOcBwZoWWPfv4weYi+PvGnYhNuWlUMnGd2O/DeYvSxlzp16ev/+Dy0/AmgfyNHR
 LQq2+FTrYpD8c7N0YdT9B6a45pBhKLNPbBDNuAlg0QupxFabBRlC2d/HSyj7xifcESKB
 Xssw==
X-Gm-Message-State: AC+VfDxhErz5VZU4WldFxSYwYs488KE5YmBp6txyuTChkmee/UYVIrg5
 f7v7p3hjTJEI17ezUmF2La8Ccpm7VxYMdgYbC5HCKeMoJl7XPDZg
X-Received: by 2002:adf:dc04:0:b0:307:a33d:d054 with SMTP id
 t4-20020adfdc04000000b00307a33dd054mr17502713wri.49.1684221957408; Tue, 16
 May 2023 00:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230515203311.2139-1-eric.devolder@oracle.com>
 <20230515203311.2139-3-eric.devolder@oracle.com>
In-Reply-To: <20230515203311.2139-3-eric.devolder@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 16 May 2023 12:55:46 +0530
Message-ID: <CAARzgwyNkKh_2PWe+ca1FKgtUKy22d3n7TMKRFpQcZkcaAnhQA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ACPI: i386: bump to MADT to revision 3
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, mst@redhat.com, 
 imammedo@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org, 
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, richard.henderson@linaro.org, 
 eduardo@habkost.net, boris.ostrovsky@oracle.com, miguel.luis@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::42e;
 envelope-from=ani@anisinha.ca; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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
X-TUID: hwcm4oPCiYHt

On Tue, May 16, 2023 at 2:04=E2=80=AFAM Eric DeVolder <eric.devolder@oracle=
.com> wrote:
>
> Currently i386 QEMU generates MADT revision 3, and reports
> MADT revision 1. Set .revision to 3 to match reality.
>
> Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devol=
der@ora
> cle.com/T/#t
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
>  hw/i386/acpi-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 52e5c1439a..8a0932fe84 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -102,7 +102,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *=
linker,
>      MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MACHINE(=
x86ms));
>      AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(adev);
> -    AcpiTable table =3D { .sig =3D "APIC", .rev =3D 1, .oem_id =3D oem_i=
d,
> +    AcpiTable table =3D { .sig =3D "APIC", .rev =3D 3, .oem_id =3D oem_i=
d,
>                          .oem_table_id =3D oem_table_id };
>
>      acpi_table_begin(&table, table_data);
> --
> 2.31.1
>
