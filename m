Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2268582lfp;
        Fri, 14 Feb 2020 11:04:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVpFhr4kBf9ovFQUjnh0gM1iZqgriPeCNIm8j3piOQ1lZh91dvfCGlmnVA8ORB7O+3m5Mq
X-Received: by 2002:a0c:b61c:: with SMTP id f28mr3549149qve.101.1581707073568;
        Fri, 14 Feb 2020 11:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581707073; cv=none;
        d=google.com; s=arc-20160816;
        b=xgeJ2oOOzuXqrif7g9iQYmRTuXYwJCxJWA23cGtDLWy5UZtQA7rRoTVBJD+hL9W5rL
         JNOQBxAtrnEOC1Wp4tiX8xC9IxJZnFtru/btJtN6xkW8iXntKQsFKpE3tPBAEWZoAihj
         kncT3ThyVsYf/Ilyi5llxYC3/AjA7Vw6zRsN5FfbNZ9HgopoV56PpSWKm3TKglUoneAU
         +NKDJGpT1dNK0bYGO2bA4OuELXOb90kxykvJVOUCpL0d2OLfpkAtOyP1WWLtT7FxKFFf
         /6EIDXMUbnLVjQ+r+/03d6CAs8fROj1QMGbKgiKGjYhB5eZkopUZbaGaq0jWRW0C+GLc
         V3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qoYzL2LEOco4e9zwEZfYWZWZLFtuQtc0d93sSkeSnUQ=;
        b=w+O5eT2KrVeBQ8Y/vh0wZPb4tYtFi6Mq+f3EDjwgNf4UBm7xp8BHvEkPSKzndYwkax
         0oE4CcNru7AlgxdOdzGLxsQTWxlt65Rk9l1wQtJKp4SWRTee2gvAbxMob7Us5EGjHLqY
         XuWPoWC8nhtuGYimDWmARxO9TTuKpUihOb6Utz0ocXXxqE+i7suWnTWS5ZbK+zRwehv7
         0XMTZe5N2YpSLYUKo9Y1w0WktqgaRGOD3ttDRr3OBAAVUBrskg0M5kM/MmBdvN6r23Fc
         UJvNTlfTeY/szRoxVLijBLRC7c3BfuGHAB+snrYHDSYgZ1O2yzdn/LujgRYK93DPoIKt
         C2cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZLGmMv/h";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si3404816qkm.183.2020.02.14.11.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 11:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZLGmMv/h";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2gGO-0004HV-T6
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 14:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j2gFy-0004GS-1C
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:04:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j2gFw-00019x-UY
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:04:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46031
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j2gFw-00019j-Qf
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581707044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qoYzL2LEOco4e9zwEZfYWZWZLFtuQtc0d93sSkeSnUQ=;
 b=ZLGmMv/hDLKvsTFSkoy4jyAIJQ6sKXxKBr8V4fIIfy7O6Xd7TvwULIXjnWOF95TC5zYGHR
 OqY5c9hh8PDyGIj3AZprnKw74su/gfKok5QYm3Fm4xxYUayJdZMDm4Fp/Chdab9lhWPGqQ
 LrM3vLGN2ISCq+dejv/ZRp+dVQUc9ek=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-PTp5OnjhMbuwYIHii4ntnw-1; Fri, 14 Feb 2020 14:04:01 -0500
Received: by mail-wm1-f72.google.com with SMTP id p2so4383150wma.3
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 11:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J/U3bvGjjbtRQR1Rj9D8e9HMzhFD3rb3ej8UVO46KKg=;
 b=LsKN+rQV4jih2NjQJv5JzN4yzmmYhhe97IZNxyUZtvqmykjZkl2XqcXlYsZ3GvOR6P
 KwWbz2TBapQM+HW14bW/rveOTL71tR6UCjEGkjWGFr0sPyHvJ+Hx9I5ayrQfz8M5Xm88
 piIxGCGdAvsOlZY/M9Lk47i3Ly6r7n4XkwmAUDfpNTT825+B8iwCz/N/eod87vNrJDDm
 /vms+504IPnzb8BUUuBiDDmRSZmK20QpE6MrholCj/LMbsdL8JQvOBpHiK8pVdDq9S0Z
 iLDQCHkBJ/USj/+OOoDfqd8qDYismNTQb4heZaUxYCUCUFIVMod9X4hDLIYUHAx0Jyy8
 1Hpw==
X-Gm-Message-State: APjAAAWkL2EUtERHmiTm/YD39Ekia1LisQGGugYwrI0KozMyYVxAG5xU
 ft0CWrmIGfSYOw03CqCX1wXZADNGjsqIKodihvlHvD7rc5hWIQYYy+u7J221brVBXQR9i033xfT
 WqtdXPR9G76Jx
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr5911776wme.28.1581707040111; 
 Fri, 14 Feb 2020 11:04:00 -0800 (PST)
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr5911763wme.28.1581707039927; 
 Fri, 14 Feb 2020 11:03:59 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id m9sm8129977wrx.55.2020.02.14.11.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 11:03:59 -0800 (PST)
Subject: Re: [RFC v2 4/6] tpm: Separate TPM_TIS and TPM_TIS_ISA configs
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.ibm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org
References: <20200214183704.14389-1-eric.auger@redhat.com>
 <20200214183704.14389-5-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3d53d213-0135-6b9f-7684-39c4d6ae1321@redhat.com>
Date: Fri, 14 Feb 2020 20:03:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214183704.14389-5-eric.auger@redhat.com>
Content-Language: en-US
X-MC-Unique: PTp5OnjhMbuwYIHii4ntnw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: u4G4xTwFEa8I

On 2/14/20 7:37 PM, Eric Auger wrote:
> Let's separate the compilation of tpm_tis_common.c from
> the compilation of tpm_tis_isa.c
>=20
> The common part will be also compiled along with the
> tpm_tis_sysbus device.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   default-configs/i386-softmmu.mak | 2 +-
>   hw/i386/Kconfig                  | 2 +-
>   hw/tpm/Kconfig                   | 7 ++++++-
>   hw/tpm/Makefile.objs             | 3 ++-
>   tests/qtest/Makefile.include     | 4 ++--
>   5 files changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-soft=
mmu.mak
> index 4cc64dafa2..84d1a2487c 100644
> --- a/default-configs/i386-softmmu.mak
> +++ b/default-configs/i386-softmmu.mak
> @@ -20,7 +20,7 @@
>   #CONFIG_SGA=3Dn
>   #CONFIG_TEST_DEVICES=3Dn
>   #CONFIG_TPM_CRB=3Dn
> -#CONFIG_TPM_TIS=3Dn
> +#CONFIG_TPM_TIS_ISA=3Dn
>   #CONFIG_VTD=3Dn
>  =20
>   # Boards:
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index cdc851598c..c93f32f657 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -20,7 +20,7 @@ config PC
>       imply SGA
>       imply TEST_DEVICES
>       imply TPM_CRB
> -    imply TPM_TIS
> +    imply TPM_TIS_ISA
>       imply VGA_PCI
>       imply VIRTIO_VGA
>       select FDC
> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
> index 9e67d990e8..686f8206bb 100644
> --- a/hw/tpm/Kconfig
> +++ b/hw/tpm/Kconfig
> @@ -2,9 +2,14 @@ config TPMDEV
>       bool
>       depends on TPM
>  =20
> -config TPM_TIS
> +config TPM_TIS_ISA
>       bool
>       depends on TPM && ISA_BUS

Maybe you can relax to "depends on ISA_BUS" ...

> +    select TPM_TIS
> +
> +config TPM_TIS
> +    bool
> +    depends on TPM

... since TPM_TIS depends on TPM.

>       select TPMDEV
>  =20
>   config TPM_CRB
> diff --git a/hw/tpm/Makefile.objs b/hw/tpm/Makefile.objs
> index fcc4c2f27c..3ef2036cca 100644
> --- a/hw/tpm/Makefile.objs
> +++ b/hw/tpm/Makefile.objs
> @@ -1,6 +1,7 @@
>   common-obj-$(CONFIG_TPM) +=3D tpm_util.o
>   obj-$(call lor,$(CONFIG_TPM_TIS),$(CONFIG_TPM_CRB)) +=3D tpm_ppi.o
> -common-obj-$(CONFIG_TPM_TIS) +=3D tpm_tis_isa.o tpm_tis_common.o
> +common-obj-$(CONFIG_TPM_TIS_ISA) +=3D tpm_tis_isa.o
> +common-obj-$(CONFIG_TPM_TIS) +=3D tpm_tis_common.o
>   common-obj-$(CONFIG_TPM_CRB) +=3D tpm_crb.o
>   common-obj-$(CONFIG_TPM_PASSTHROUGH) +=3D tpm_passthrough.o
>   common-obj-$(CONFIG_TPM_EMULATOR) +=3D tpm_emulator.o
> diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
> index eb0f23b108..33dd3c89cc 100644
> --- a/tests/qtest/Makefile.include
> +++ b/tests/qtest/Makefile.include
> @@ -54,8 +54,8 @@ check-qtest-i386-y +=3D q35-test
>   check-qtest-i386-y +=3D vmgenid-test
>   check-qtest-i386-$(CONFIG_TPM_CRB) +=3D tpm-crb-swtpm-test
>   check-qtest-i386-$(CONFIG_TPM_CRB) +=3D tpm-crb-test
> -check-qtest-i386-$(CONFIG_TPM_TIS) +=3D tpm-tis-swtpm-test
> -check-qtest-i386-$(CONFIG_TPM_TIS) +=3D tpm-tis-test
> +check-qtest-i386-$(CONFIG_TPM_TIS_ISA) +=3D tpm-tis-swtpm-test
> +check-qtest-i386-$(CONFIG_TPM_TIS_ISA) +=3D tpm-tis-test
>   check-qtest-i386-$(CONFIG_SLIRP) +=3D test-netfilter
>   check-qtest-i386-$(CONFIG_POSIX) +=3D test-filter-mirror
>   check-qtest-i386-$(CONFIG_RTL8139_PCI) +=3D test-filter-redirector
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

