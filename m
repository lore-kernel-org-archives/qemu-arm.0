Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp283910lfp;
        Wed, 29 Jan 2020 00:08:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqz2XpcT83DmMzZE8dOJoczpmDrdDI14rgR0cDRSp2LEj3V2EflrfdK10VFrytMw7pnm/5Mv
X-Received: by 2002:a05:6808:643:: with SMTP id z3mr5684030oih.19.1580285296254;
        Wed, 29 Jan 2020 00:08:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580285296; cv=none;
        d=google.com; s=arc-20160816;
        b=jeiZLA9qsFxdNq6RsEOija7nVwOyb+hbAbJ3FhOZ6HigknifyoopIWaYyxgSaPPqnZ
         GiJnpeGq93i5AwLHxIBVW4ujGowEoMl5EXFdQ3vupcDZ+in1E/89pUwHCw8cI/UEkKN0
         Q1Kjq/3buKwpne0kgez7kLaOBpSMGFlRY5CBBIyILPHteO87DJMBtpYNFTFSme0losCq
         uLPNgxMv9K/ZbdobQGYJsVkBARqCl/5O/qSwH+2Iwy1dlFL56K5JdZrWXYeufkEDr32+
         e1rqPjmPc4r/wUGJpABp8c9Axt1SU0pVvjI+cqO8oj8+a5wv+enYXKAIlj2WA3MbFFcq
         0RMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:dkim-signature;
        bh=6B1BQTixM1hGZ6QDPNmwN5NO9M03YJBxtfjfLjgPORU=;
        b=grdDS9MdU813oiFtlX6ocTqrVUOWPOkyWEKhybKsf2eheBbUulvVXS9muoQZeSvaNt
         dFLnbuD8ADBpg3jFNBl4CdyDI5FxUuUB5ZZfE6lf1qZYlSpXo/qPqGvDG/9qNeOek//k
         rVetKEaK0Q7l//W0BWLpXQoPi9UWG88a9zzwMiQ68BB2AtCExOkbLb4mRzZRZCPj+Qz0
         L5/Ofku0czynw7ByauRMzuKtfduk80QVxg6khHahBVgzIBEkRwD/EAwS08wtX0ZCJECn
         bP2aUfVACsmxh+SyERlZYO1yznxpAcGHDg8yk1/+t7V6riqYSayFojWVa+9R2QodxAu8
         CDZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IM5cepCX;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id e25si826863otk.62.2020.01.29.00.08.16;
        Wed, 29 Jan 2020 00:08:16 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IM5cepCX;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgA2IIP (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 29 Jan 2020 03:08:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46750 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726128AbgA2IIP (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 29 Jan 2020 03:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580285293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:openpgp:openpgp;
        bh=6B1BQTixM1hGZ6QDPNmwN5NO9M03YJBxtfjfLjgPORU=;
        b=IM5cepCXXlBpC+bjopM1+tF0UFR16ucNZDYW5rR8v0PMxdislUJ/TdzmsLjn7Etjs7daYL
        K5vv3vPLzEYyTsmfOiRsfnT69vIsEEF6sNVGsrfIJkaimQpp8eXpgUTegtlKedgGiOdrsc
        Fn86xMTSRyzlCcet/6LGvGi9bvCnV1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-ulYYoQhVNkGxvnZqYnfM7w-1; Wed, 29 Jan 2020 03:08:04 -0500
X-MC-Unique: ulYYoQhVNkGxvnZqYnfM7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09ACD18A6EC1;
        Wed, 29 Jan 2020 08:08:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-210.ams2.redhat.com [10.36.116.210])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EB6460C05;
        Wed, 29 Jan 2020 08:07:55 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v3 12/14] arm/run: Allow Migration tests
To:     Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
        maz@kernel.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com
References: <20200128103459.19413-1-eric.auger@redhat.com>
 <20200128103459.19413-13-eric.auger@redhat.com>
From:   Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3962373a-0e03-5ab9-30cc-3b385fc55702@redhat.com>
Date:   Wed, 29 Jan 2020 09:07:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200128103459.19413-13-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: d+2tyF2aQMKw

On 28/01/2020 11.34, Eric Auger wrote:
> Let's link getchar.o to use puts and getchar from the
> tests.
>=20
> Then allow tests belonging to the migration group to
> trigger the migration from the test code by putting
> "migrate" into the uart. Then the code can wait for the
> migration completion by using getchar().
>=20
> The __getchar implement is minimalist as it just reads the
> data register. It is just meant to read the single character
> emitted at the end of the migration by the runner script.
>=20
> It is not meant to read more data (FIFOs are not enabled).
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
>=20
> v2 -> v3:
> - take the lock
> - assert if more than 16 chars
> - removed Thomas' R-b
> ---
>  arm/Makefile.common |  2 +-
>  arm/run             |  2 +-
>  lib/arm/io.c        | 28 ++++++++++++++++++++++++++++
>  3 files changed, 30 insertions(+), 2 deletions(-)
>=20
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index b8988f2..a123e85 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -32,7 +32,7 @@ CFLAGS +=3D -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt =
-I lib
>  asm-offsets =3D lib/$(ARCH)/asm-offsets.h
>  include $(SRCDIR)/scripts/asm-offsets.mak
> =20
> -cflatobjs +=3D lib/util.o
> +cflatobjs +=3D lib/util.o lib/getchar.o
>  cflatobjs +=3D lib/alloc_phys.o
>  cflatobjs +=3D lib/alloc_page.o
>  cflatobjs +=3D lib/vmalloc.o
> diff --git a/arm/run b/arm/run
> index 277db9b..a390ca5 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -61,6 +61,6 @@ fi
>  M+=3D",accel=3D$ACCEL"
>  command=3D"$qemu -nodefaults $M -cpu $processor $chr_testdev $pci_test=
dev"
>  command+=3D" -display none -serial stdio -kernel"
> -command=3D"$(timeout_cmd) $command"
> +command=3D"$(migration_cmd) $(timeout_cmd) $command"
> =20
>  run_qemu $command "$@"
> diff --git a/lib/arm/io.c b/lib/arm/io.c
> index 99fd315..d8e7745 100644
> --- a/lib/arm/io.c
> +++ b/lib/arm/io.c
> @@ -87,6 +87,34 @@ void puts(const char *s)
>  	spin_unlock(&uart_lock);
>  }
> =20
> +static int ____getchar(void)

Three underscores? ... that's quite a lot already. I'd maybe rather name
the function "do_getchar" or something similar instead. Or simply merge
the code into the __getchar function below - it's just three lines.

> +{
> +	int c;
> +
> +	spin_lock(&uart_lock);
> +	c =3D readb(uart0_base);
> +	spin_unlock(&uart_lock);
> +
> +	return c ? : -1;

Just a matter of taste, but I prefer the elvis operator without space in
between.

> +}
> +
> +/*
> + * Minimalist implementation for migration completion detection.
> + * Without FIFOs enabled on the QEMU UART device we just read
> + * the data register: we cannot read more than 16 characters.

Where are the 16 bytes buffered if FIFOs are disabled?

> + */
> +int __getchar(void)
> +{
> +	int c =3D ____getchar();
> +	static int count;
> +
> +	if (c !=3D -1)
> +		++count;
> +
> +	assert(count < 16);
> +
> +	return c;
> +}

The above comments were only nits ... feel free to ignore them if you
don't want to respin the series just because of this.

 Thomas
