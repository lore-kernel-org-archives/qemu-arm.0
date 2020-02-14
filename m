Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2259935lfp;
        Fri, 14 Feb 2020 10:55:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwjYbFfHZkM+mnKeLXDs/FULt3xSvfDB5NL9X+AcVJPD7vIHfUHJ2anUyMa3JuAYFeM+/rc
X-Received: by 2002:ac8:1aed:: with SMTP id h42mr3604330qtk.270.1581706533121;
        Fri, 14 Feb 2020 10:55:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581706533; cv=none;
        d=google.com; s=arc-20160816;
        b=HkdK/oN+FLt6ehCfiDRZgURpKpqldVWoa6+wvud+GMDV568gGGCXrpS0yckjEnJPac
         mXpjxkxSwI4teI3diWUgAVYWHHDc75ocQDkWklfL6GkibDuYwugBhsij+3UxasMxnhOZ
         umbS7iNbzt493hC9HP8CL5MWPskT40vkumGsIg5By4xFT10QLE8jXeQh29UmsCcTWlWp
         6xTxrrBmSgTB1UR+i65GOa3vsoh9mzF+3JjYdBI4X1amE9Gi2K/vX54c5e4NNB4Ki0Hv
         jGc8VEF/8xoXuQGTEs9ZUhgCVPUI75+zD2Bz+o5C22S5sS1n+/rRFNw1BiFvwIebFqSL
         AYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EN8zjuPHGL5alcVnWz2YMgcaV5lO4slthD+6U+XV9Cc=;
        b=x3sKi8yUuT6Q+ZVdkreetsOzRPjF7lnvkkSJoZIJklYaztW3IJeaUU31JxucrsXR2E
         CG+dgsKXX8T1LfeP3u/V0YN30vFULtiW8EbYTRgsrJIFb0uptB8eMCgZaby4bTgxhf0Y
         GnE5cZj53CGEphWx1iqFtDJDWmYwmr+oSD22vu1tgpFoVgfV799HoWz2MZwupmWzJIPx
         403zP6IWcqfvxzfD4iAAvDeWYi7aTjDeoGmTgSiOfc8S+McokB7wFDCKbyrDsqWMQQAL
         ciCj8Z+yVbc2Of77/osDhMCwSayBcq/g6V/5WslOuUZ8Xl+NLXbVP8IdEZTmKZYM2sp/
         MdSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bW0B+k2C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si3021429qtb.297.2020.02.14.10.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 10:55:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bW0B+k2C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2g7g-0008RH-Dx
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 13:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j2g7X-0008QZ-9t
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 13:55:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j2g7V-0002zE-LE
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 13:55:22 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25810
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j2g7V-0002yu-Gu
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 13:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581706521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EN8zjuPHGL5alcVnWz2YMgcaV5lO4slthD+6U+XV9Cc=;
 b=bW0B+k2CwXx4EeYXBR6af7XwInTPZjWiykxnnjUWSco8K5XN4BdaX8aciJgxAWMmGuMxvs
 2g8JeBPF6eLxb+7OqE2zNRajdOQPNHGFaYcIEIiQjBf+Xf3dasLZIvDIRhbnxtetWgyH5p
 Bjgr5gDlJo4tL8A4pV559kLFsxAnLDY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-dLb_nq4TPfWG-2Q2bpLQCg-1; Fri, 14 Feb 2020 13:55:19 -0500
Received: by mail-wr1-f69.google.com with SMTP id c6so4490575wrm.18
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 10:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S3GH1oAA4Bad2Xr/3CgXymLB45XQFQaZUty8DiYaUTU=;
 b=unVGe78V5/ryIzES99augQPOIof86kxSvK0q2ZrnV163oDE3MluGn+10BjLtTrGZzl
 5XKPBrO/mqZEFZ3gYLwBUCINB5uy2kF6zSPqxZ30BMz/0EOSG+5VZ/7O8HSyCs/NdKBc
 QwDpFjgPKo9fXup5p20URZH0Ys7/tnSb5KCGrFyqCF8XcGCgfsVsA0AMgheJZurzI1Rk
 MlRbwqBV0SghGJJleGJ5ea7Gq4ILLdrObUzMoL9OnoStx0UvL66NTDe9Roa5PzeWUufn
 UWCfGAjjzLYYdbbEf0/dlp7Kb8Pqjq9NsKeBF8thlq49lAiOIhmDuXMkTxjFLlbX69i5
 XOpQ==
X-Gm-Message-State: APjAAAWl085zBzLKjc4ReKUNV/RaHjjlJ+CmG5GMzGrJU85V6Q7qP5JY
 mGypG5KEI0+XGkfm3iqKKtuRJb32oXtx6SrksjXLa0FV4/kbVH54tqHM2f3tm68gcq1lEyyGmI7
 cnpTTUJs4jRR4
X-Received: by 2002:adf:cd04:: with SMTP id w4mr5650753wrm.219.1581706517994; 
 Fri, 14 Feb 2020 10:55:17 -0800 (PST)
X-Received: by 2002:adf:cd04:: with SMTP id w4mr5650736wrm.219.1581706517773; 
 Fri, 14 Feb 2020 10:55:17 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id o9sm5260381wrw.20.2020.02.14.10.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 10:55:17 -0800 (PST)
Subject: Re: [RFC v2 1/6] tpm: rename TPM_TIS into TPM_TIS_ISA
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.ibm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org
References: <20200214183704.14389-1-eric.auger@redhat.com>
 <20200214183704.14389-2-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <29cc9864-a016-b251-506a-8c04b37efe28@redhat.com>
Date: Fri, 14 Feb 2020 19:55:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214183704.14389-2-eric.auger@redhat.com>
Content-Language: en-US
X-MC-Unique: dLb_nq4TPfWG-2Q2bpLQCg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3DCJmfZkzOaO

On 2/14/20 7:36 PM, Eric Auger wrote:
> As we plan to introduce a sysbus TPM_TIS, let's rename
> TPM_TIS into TPM_TIS_ISA.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/i386/acpi-build.c | 6 +++---
>   hw/tpm/tpm_tis.c     | 4 ++--
>   include/sysemu/tpm.h | 6 +++---
>   3 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9c4e46fa74..26777f8828 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2026,7 +2026,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>           }
>       }
>  =20
> -    if (TPM_IS_TIS(tpm_find())) {
> +    if (TPM_IS_TIS_ISA(tpm_find())) {
>           aml_append(crs, aml_memory32_fixed(TPM_TIS_ADDR_BASE,
>                      TPM_TIS_ADDR_SIZE, AML_READ_WRITE));
>       }
> @@ -2197,7 +2197,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>               /* Scan all PCI buses. Generate tables to support hotplug. =
*/
>               build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_e=
n);
>  =20
> -            if (TPM_IS_TIS(tpm)) {
> +            if (TPM_IS_TIS_ISA(tpm)) {
>                   if (misc->tpm_version =3D=3D TPM_VERSION_2_0) {
>                       dev =3D aml_device("TPM");
>                       aml_append(dev, aml_name_decl("_HID",
> @@ -2304,7 +2304,7 @@ build_tpm2(GArray *table_data, BIOSLinker *linker, =
GArray *tcpalog)
>           (char *)&tpm2_ptr->log_area_start_address - table_data->data;
>  =20
>       tpm2_ptr->platform_class =3D cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
> -    if (TPM_IS_TIS(tpm_find())) {
> +    if (TPM_IS_TIS_ISA(tpm_find())) {
>           tpm2_ptr->control_area_address =3D cpu_to_le64(0);
>           tpm2_ptr->start_method =3D cpu_to_le32(TPM2_START_METHOD_MMIO);
>       } else if (TPM_IS_CRB(tpm_find())) {
> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> index 31facb896d..c609737272 100644
> --- a/hw/tpm/tpm_tis.c
> +++ b/hw/tpm/tpm_tis.c
> @@ -91,7 +91,7 @@ typedef struct TPMState {
>       TPMPPI ppi;
>   } TPMState;
>  =20
> -#define TPM(obj) OBJECT_CHECK(TPMState, (obj), TYPE_TPM_TIS)
> +#define TPM(obj) OBJECT_CHECK(TPMState, (obj), TYPE_TPM_TIS_ISA)
>  =20
>   #define DEBUG_TIS 0
>  =20
> @@ -1008,7 +1008,7 @@ static void tpm_tis_class_init(ObjectClass *klass, =
void *data)
>   }
>  =20
>   static const TypeInfo tpm_tis_info =3D {
> -    .name =3D TYPE_TPM_TIS,
> +    .name =3D TYPE_TPM_TIS_ISA,
>       .parent =3D TYPE_ISA_DEVICE,
>       .instance_size =3D sizeof(TPMState),
>       .instance_init =3D tpm_tis_initfn,
> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> index 15979a3647..1691b92c28 100644
> --- a/include/sysemu/tpm.h
> +++ b/include/sysemu/tpm.h
> @@ -43,12 +43,12 @@ typedef struct TPMIfClass {
>       enum TPMVersion (*get_version)(TPMIf *obj);
>   } TPMIfClass;
>  =20
> -#define TYPE_TPM_TIS                "tpm-tis"
> +#define TYPE_TPM_TIS_ISA            "tpm-tis"

It should be safe to rename this "tpm-tis-isa" in this patch.

Regardless:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>   #define TYPE_TPM_CRB                "tpm-crb"
>   #define TYPE_TPM_SPAPR              "tpm-spapr"
>  =20
> -#define TPM_IS_TIS(chr)                             \
> -    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS)
> +#define TPM_IS_TIS_ISA(chr)                         \
> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
>   #define TPM_IS_CRB(chr)                             \
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
>   #define TPM_IS_SPAPR(chr)                           \
>=20

