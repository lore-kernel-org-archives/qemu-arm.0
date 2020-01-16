Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8728096lff;
        Thu, 16 Jan 2020 10:22:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNi5WvO2RnUq3SoD6dlpWkiyXU3NNPfZsk9zTFrDX0w7Vg5XUvo1D/4NjjCaQOAkjqRaHu
X-Received: by 2002:a17:906:814a:: with SMTP id z10mr4250352ejw.62.1579198974020;
        Thu, 16 Jan 2020 10:22:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579198974; cv=none;
        d=google.com; s=arc-20160816;
        b=ez/3aFWIv69/qlEXoSgF4/ox8iN9W3nYpK94+EyMpcVO7hY/GTDQ4AIv68HCFgof7t
         06xi+eEciV7kQSUcJsfahrhsezoBlnbfGCCU5sclDFfQNkSkv5uAF+Xg1UpPKj4VVWgL
         rnjEpnimO48HyENgLz+VrXNfBd162tKYzCIE8aAX/iFa7enTTTrOFmPxKD6BIHO6MIGA
         hvT7voZECOUAM++JI7BmFSh7E30XMRPwKeG4fSe0iDe8LmO31De8NQzNzIGcV/4wriu6
         H1r3mPbx8zfeOVTPShAfJJrNrgk8CcJ6mkq4IiVZUr2vmeEPq2eUZj53LdFOKC9Nu41n
         9B1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rhWoR3Ih7/md/kmjJ9inJ8JlkIrkEedEevUNAczPh9M=;
        b=N83iO0S0E1CuuPDFplpN8lqB1bhTT+/DBXOIlmvaloOnMhuLT2OaBoxQ1OSiqoYp1k
         r9HxBWZ6HrpyY9t1T6PRKRcSJRqe5spEr1FHZE3fhvAm4ZlDjfBHgLaEs8npwBxfbwlN
         5IP4FS4VA0MobE551SvHMZAZrR/pmEzr+gtp2s5bUvIcKyNjMHSS9RZAgTm2LKY3+pTW
         PnkLt5vLq6kGY1kwV+yhi+a/ekOnjX5iR9OsbdhzNEJ80amYZXi5ZlsuWPhq6k2bLtCI
         m8VmsfjQvGLmZJ7Bmjz7qI1Saypj+XocGixf64sL3MnF9sS9zi9mPodcruTBXaP9fJgg
         0hSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EOXx0fFm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dh18si16053743edb.400.2020.01.16.10.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 10:22:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EOXx0fFm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is9nA-0001EN-O9
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 13:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1is9mc-0000h2-Qg
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:22:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1is9mZ-00013u-Bv
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:22:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43513
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1is9mZ-00013C-7r
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579198934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhWoR3Ih7/md/kmjJ9inJ8JlkIrkEedEevUNAczPh9M=;
 b=EOXx0fFmigb+RrCdY9qUNesx0J7B198DPF4/OOVjOJ8WyWkSHdaAl7t9xXjN6MLhp1n72D
 ehHK+kMWA1jr9FHjS0bg4bGe1Uay46rcG64fy00piZC7xDReQI7CNrmeMJ1Zc2tNI7EoMv
 3AXwldSok1CByeZ9CWG7wIT7Dbl5Qjs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-gpEisMlOO8m-JwLqwylHhw-1; Thu, 16 Jan 2020 13:22:13 -0500
Received: by mail-wr1-f69.google.com with SMTP id c17so9482431wrp.10
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2020 10:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qtCklIdwpPVYr8Ly0ddeLirsK2OiFfS7Z5uBy8Fp7LM=;
 b=TmmTXQLAX2o4nhlWuZRdKiUowLaPhxYl/upwK99aixeLgbBHLiEXpzheWMjJ5vA6mq
 izLqGhkSfheAQlHV6OCGryUV6p/xjGW/bTVs5BYsLp5K2TdYCp7wUNKC+WI++qbwMA3X
 8/D9gG6NDnSv/3+SBy8N/Ntek+c+iVvoJlnwUOfnnFmJ9drG2jcsi5D2B6OVmevPgcxT
 HjFwAD4Wyjs7Z891/FPaVLmg69k26QC56bj/DetCzQGS8CLhajkGo35tzvOPAPew0MC8
 kOdydxh9MIBEfwb2qUZhTBn6ljJEY7lTR1XdXiHQYiNjfe1N+49UOX+BUQEqHxUoO4vr
 TUoQ==
X-Gm-Message-State: APjAAAU1a+4fI+S/sGCfq5cYKiiGdnpxYQ4aZoxOBF3UtMkg18UdLC3/
 EujgyRjaVi6+x+bWv98lPbKkcp0DkSC+I0qlAJgzYiCTy07hj40o/VBLbcc/5JCub2aHar/BX/3
 huOFESg2AQW9I
X-Received: by 2002:a05:600c:248:: with SMTP id 8mr300045wmj.175.1579198932405; 
 Thu, 16 Jan 2020 10:22:12 -0800 (PST)
X-Received: by 2002:a05:600c:248:: with SMTP id 8mr300030wmj.175.1579198932228; 
 Thu, 16 Jan 2020 10:22:12 -0800 (PST)
Received: from [10.101.1.81] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id 2sm29598142wrq.31.2020.01.16.10.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 10:22:11 -0800 (PST)
Subject: Re: [PATCH v3 18/86] arm:kzm: drop RAM size fixup
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <87sgkgv6dh.wl-Peter.Chubb@data61.csiro.au>
 <1579195564-95459-1-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dc8d8594-0bf8-e6c2-9ce8-94bf5361bca3@redhat.com>
Date: Thu, 16 Jan 2020 19:22:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579195564-95459-1-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: gpEisMlOO8m-JwLqwylHhw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Peter.Chubb@data61.csiro.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RdNfQF0DS5gt

On 1/16/20 6:26 PM, Igor Mammedov wrote:
> If the user provided too large a RAM size, the code used to
> complain and trim it to the max size.  Now tht RAM is allocated by
> generic code, that's no longer possible, so generate an error and
> exit instead.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>   * rephrase commit message in nicer way
>     ("Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au=
>)
>   * reword error message and use size_to_str() to pretty print suggested =
size
>     ("Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au=
>)
>=20
> CC: peter.chubb@nicta.com.au
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>   hw/arm/kzm.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
> index 1d5ef28..94cbac1 100644
> --- a/hw/arm/kzm.c
> +++ b/hw/arm/kzm.c
> @@ -25,6 +25,7 @@
>   #include "hw/char/serial.h"
>   #include "sysemu/qtest.h"
>   #include "sysemu/sysemu.h"
> +#include "qemu/cutils.h"
>  =20
>   /* Memory map for Kzm Emulation Baseboard:
>    * 0x00000000-0x7fffffff See i.MX31 SOC for support
> @@ -78,10 +79,10 @@ static void kzm_init(MachineState *machine)
>  =20
>       /* Check the amount of memory is compatible with the SOC */
>       if (machine->ram_size > (FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_S=
IZE)) {
> -        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
> -                    "reduced to %x", machine->ram_size,
> -                    FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE);
> -        machine->ram_size =3D FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_S=
IZE;
> +        char *sz =3D size_to_str(FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM=
1_SIZE);
> +        error_report("RAM size more than %s is not supported", sz);

Yay! Can you use this pattern the other patches too?

You might want to add:

#define FSL_IMX31_SDRAM_SIZE_MAX \
   (FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +        g_free(sz);
> +        exit(EXIT_FAILURE);
>       }
>  =20
>       memory_region_allocate_system_memory(&s->ram, NULL, "kzm.ram",
>=20

