Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7326752lff;
        Wed, 15 Jan 2020 11:09:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxLLqwAC8C9OCHz7+BJNjjagCZxf6oRKjUngQhpITgRIKB5fmDVjhNXb/FAev/clLTHiwt2
X-Received: by 2002:a05:6402:c10:: with SMTP id co16mr31517946edb.180.1579115381559;
        Wed, 15 Jan 2020 11:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579115381; cv=none;
        d=google.com; s=arc-20160816;
        b=FG82wwx3zpeTZm0QXyXMAupwZOVvS7e8PhUVBhnycZQtD5c+YOoCjpOxYVCvVTWQEn
         mTsifp08Cn+iI1D281Mi71txql3sg8PJCvvCbIN366Fe6zUk58r6d3VQ4TDtvtz/C4AS
         1x+fN58TY0xLVQYNjYGkalHuHEFFT7doSCaUHZr3N9yf6DcEwu8gdlm9fYlGQLzfRfH5
         I5pL2jvvGtT1ZFmYYhQv0qg+eL2mjuPX80qYgoWFM1GKJgr4s8F2HwdUyIuOzLl89QpO
         G1CiPhOxoqm2EAD3RoN65EUAXPGMUQDN/hwmutGs7pDLxAUoesQEEIWbNjva0z5w7HKz
         kfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=j3WGN4h8twIwKSxPpWaiTigZEDCjxkpd0VlpwKYxcBE=;
        b=pCTx2mA8x3hN5yTos5J9UIftCYL610ZDYmS57P9nvagXqMYMzMbZcqmJ2oxXuqnkfJ
         bU9F+FLEfraHq59U2Vp2invUDJ22/GJX1jyWwyfh+k9+QkbU7fkwqzMvTsPN1G0BwAQ1
         BOV78wCAc/mjPL3DiZMmiI8XRlyRLdC0+N+u1dKaM+8p7AlOs3PusssER48PhDqUEdgQ
         +C9E58Gr+g5NDoOW6hH+0ntC2++iyYAfXhnYlm6u6nnM0HLl9qtNbGZvYQIPIPCwOIWH
         bu7CfeTMfBYU2FJKzA+TJLTsvzT50YuilNsJ5JZX0fHRFGJYmqRFviMCPfJh3y0s3NtY
         o3QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UPXR81Sw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ly6si12689394ejb.17.2020.01.15.11.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:09:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UPXR81Sw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iro2u-0004wQ-73
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 14:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iro2h-0004u1-RS
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:09:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iro2e-000159-Pv
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:09:27 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60173
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iro2e-00014G-Kk
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579115364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3WGN4h8twIwKSxPpWaiTigZEDCjxkpd0VlpwKYxcBE=;
 b=UPXR81SwwPcnuJmU5whDS8qE89MtY3SivHxWtjrMY5kl56W/tsQgKkbDF6wkAgfLiFbqdn
 ROpsTSCXkxEBat15fUBGZ9XYYoN4xktl/wHzkwDkU6BkbheIV4wrzWeF+XTKOoDoPa7xPf
 gkdF0SUNbMKk+sVwH0+X0m8cpWvaf38=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-8GsFq2vwM12734Auu2j4uw-1; Wed, 15 Jan 2020 14:09:22 -0500
Received: by mail-wr1-f70.google.com with SMTP id w6so8288121wrm.16
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 11:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IOIIOP4rckx4/aEwrE2xI1uhnc1Zmv7Ec+8ItoMmb9w=;
 b=c6Xlocu/sYnJhVXF3ItPNKejfXgLS9vZBOJV+tOqg0zqdrJsB0wIo3lDbNSZtBEI7A
 443/1y8dcJoNK3UhaTPlO+UyQtEkUPQ9Kxfuuz1Wa7A0bTO3MeBZ8IxEYak4Al533EME
 /WoeVML/K0J4KA9c9/+6LJvBqy+tbk3D6KTPzuTXxbFnOthUoieP0X0HYT74CD+7GK9d
 s3pMXWTKtNpqnOVk2auUtCnmw55HTHBLGDt8lc6mG2L92vEJTEPCvOkpfZqVqYrTG+Lk
 Cosmh8f3LDLOpckvzRiEoO6k/Axeu3O1UDVAzHSH+FxSJzCmdGtnUWBsz8fCg/Hol1Ad
 312g==
X-Gm-Message-State: APjAAAUquK2cwgwAEC1zE7sHyUkpePpjIMjVz3HnwhKfwvHNmbj+dvO3
 LzO6qAoCGdwiYG3Y18hjNWGvGMO4qrDB4Mw05xsXCIojtf1QueCO+aH6yBdiTnSAucZMescuI5/
 HRnYSZ08u3A9u
X-Received: by 2002:a5d:4752:: with SMTP id o18mr32072564wrs.330.1579115361662; 
 Wed, 15 Jan 2020 11:09:21 -0800 (PST)
X-Received: by 2002:a5d:4752:: with SMTP id o18mr32072546wrs.330.1579115361431; 
 Wed, 15 Jan 2020 11:09:21 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id l19sm992600wmj.12.2020.01.15.11.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 11:09:20 -0800 (PST)
Subject: Re: [PATCH v2 30/86] arm:sbsa-ref: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-31-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <604df138-113a-1067-628a-9ea6506e60bf@redhat.com>
Date: Wed, 15 Jan 2020 20:09:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-31-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: 8GsFq2vwM12734Auu2j4uw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 radoslaw.biernacki@linaro.org, leif.lindholm@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 64BaQRjIRln1

On 1/15/20 4:06 PM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>    MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> CC: radoslaw.biernacki@linaro.org
> CC: leif.lindholm@linaro.org
> ---
>   hw/arm/sbsa-ref.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 9b5bcb5..1cba9fc 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -593,7 +593,6 @@ static void sbsa_ref_init(MachineState *machine)
>       MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>       MemoryRegion *sysmem =3D get_system_memory();
>       MemoryRegion *secure_sysmem =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
>       bool firmware_loaded;
>       const CPUArchIdList *possible_cpus;
>       int n, sbsa_max_cpus;
> @@ -685,9 +684,8 @@ static void sbsa_ref_init(MachineState *machine)
>           object_unref(cpuobj);
>       }
>  =20
> -    memory_region_allocate_system_memory(ram, NULL, "sbsa-ref.ram",
> -                                         machine->ram_size);
> -    memory_region_add_subregion(sysmem, sbsa_ref_memmap[SBSA_MEM].base, =
ram);
> +    memory_region_add_subregion(sysmem, sbsa_ref_memmap[SBSA_MEM].base,
> +                                machine->ram);
>  =20
>       create_fdt(sms);
>  =20
> @@ -785,6 +783,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void=
 *data)
>       mc->block_default_type =3D IF_IDE;
>       mc->no_cdrom =3D 1;
>       mc->default_ram_size =3D 1 * GiB;
> +    mc->default_ram_id =3D "sbsa-ref.ram";
>       mc->default_cpus =3D 4;
>       mc->possible_cpu_arch_ids =3D sbsa_ref_possible_cpu_arch_ids;
>       mc->cpu_index_to_instance_props =3D sbsa_ref_cpu_index_to_props;
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

