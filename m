Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3651078lfp;
        Mon, 10 Feb 2020 02:03:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDWzUVCD0uA2R6Usa5659L+ArweuEPGE7jiiSHHyDv/SEqGBi6uo6WHDsekPaSAMcORMTn
X-Received: by 2002:a05:6214:1433:: with SMTP id o19mr7831307qvx.87.1581329025341;
        Mon, 10 Feb 2020 02:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581329025; cv=none;
        d=google.com; s=arc-20160816;
        b=FGll898ETJ6Kym9yLXr/q9ZTMeScS/IEl2PfNUPP0qssT1aR/ur2Ehabwfzyq3fNx2
         IEUFP6Nrd6ZPJZKI47P6Kh/eCj1OYu509klz5yrLIPJjW9kmV+dur+0QHtlRlOSxgKr6
         DMlAy9tNFdwhZm8kUqH84tTR4fIf8+kxbbQM/wJ+3vPP3Bum9bVPb6zA8pet7zY5/wWl
         k/uGugCYxkEHeyAGNxT00rnlXTQ7+n3E3Kbs7W0G/wGWsbHwPwigKjP5P7ENG1YvLUYz
         8Wjp8QMWJvElULmM5CZb/AN9ffuNsGSW41EgE0m+nJ4FfzyH4b7ghYZU6BNxRuR41frQ
         rKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=oZjQqRzdzg+WflgdYqNTxILvR89Vqzwk+EBS2DisVZ0=;
        b=Oy1r3vqpLpYW8enEyYjfpoiB0313GGcRv1/bTi51DNsrhSPDi+itUUfttv+CwOTrS0
         9+1HDNeVe7t/L+hP3vsXZCbaIR4/i9DMq/YSu5sQ54tbM5N/c3IUV+cx+CzWBwpiN/0Z
         tUQDTV2SiManBBQE/pEl+yW7qWLxjzoRgvUWSjJE/S7XKxtwsfSiMccymGZemaJgOJXk
         P6DZfZh54OzOIqVR3XheTpyV3FJhfEGEFAWU72qwXiqfs3VUj6CyxU/Guz1BSYFr27HI
         Gf+/rtZpQjwQB457RsdFHjqhN7NGMFKUFwb1Bn0l8dK5HziwQD6nYkQgVhpIwzCDPgEV
         yI6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Eoipgtmf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si3946532qvv.218.2020.02.10.02.03.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 02:03:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Eoipgtmf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j15uq-0005lb-Px
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 05:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j15ub-0005lB-ID
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 05:03:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j15ua-0000NK-41
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 05:03:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31095
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j15uZ-0000MF-Uk
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 05:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581329006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oZjQqRzdzg+WflgdYqNTxILvR89Vqzwk+EBS2DisVZ0=;
 b=EoipgtmfYXYvPEVPrAcF90NQCHveQnyjX4bZsjui+p0C89DlcB946zwxKfECpspmUg2tPV
 n12gls55xNE7i4/yEXslDDhhKtEAKE0uA0H63yeKCiqm0dEpVcA4wmjbyvSGMyJPTCOo3p
 inAG/XQZHHSgCrviYAd8qQnev/1PWgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-LVcXgfryMrmDbBh72SUNqw-1; Mon, 10 Feb 2020 05:03:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D61C800D53;
 Mon, 10 Feb 2020 10:03:20 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C37D07FB60;
 Mon, 10 Feb 2020 10:03:15 +0000 (UTC)
Date: Mon, 10 Feb 2020 11:03:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 13/13] hw/arm/raspi: Extract the cores count from the
 board revision
Message-ID: <20200210110313.5f692138@redhat.com>
In-Reply-To: <20200208165645.15657-14-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-14-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: LVcXgfryMrmDbBh72SUNqw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0YoTOG8L8x5t

On Sat,  8 Feb 2020 17:56:45 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> The board revision encode the count of ARM cores. Add a helper
s/encode/encodes/
Or better
the count of ARM cores is encoded in ...


> to extract the number of cores, and use it. This will be helpful
> when we add the Raspi0/1 that have a single core.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/raspi.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index bee6ca0a08..90ad9b8115 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -101,6 +101,21 @@ static const char *board_soc_type(uint32_t board_rev=
)
>      return soc_types[proc_id];
>  }
> =20
> +static int cores_count(uint32_t board_rev)
> +{
> +    static const int soc_cores_count[] =3D {
> +        0, BCM283X_NCPUS, BCM283X_NCPUS,
> +    };
> +    int proc_id =3D board_processor_id(board_rev);
> +
> +    if (proc_id >=3D ARRAY_SIZE(soc_cores_count) || !soc_cores_count[pro=
c_id]) {
> +        error_report("Unsupported processor id '%d' (board revision: 0x%=
x)",
> +                     proc_id, board_rev);
> +        exit(1);
> +    }
> +    return soc_cores_count[proc_id];
> +}
> +
>  static const char *board_type(uint32_t board_rev)
>  {
>      static const char *types[] =3D {
> @@ -307,9 +322,7 @@ static void raspi_machine_class_init(ObjectClass *oc,=
 void *data)
>      mc->no_parallel =3D 1;
>      mc->no_floppy =3D 1;
>      mc->no_cdrom =3D 1;
> -    mc->max_cpus =3D BCM283X_NCPUS;
> -    mc->min_cpus =3D BCM283X_NCPUS;
> -    mc->default_cpus =3D BCM283X_NCPUS;
> +    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D cores_count(b=
oard_rev);
>      mc->default_ram_size =3D board_ram_size(board_rev);
>      if (board_version(board_rev) =3D=3D 2) {
>          mc->ignore_memory_transaction_failures =3D true;

