Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp180058lfb;
        Wed, 8 Sep 2021 00:16:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAmeGmLgifbjuqBpt6ha5eZOzajoZh97Wlu34gsWK64xI63JGqYdKESy8MdnJatW0TwQXW
X-Received: by 2002:a17:906:fc7:: with SMTP id c7mr2644274ejk.333.1631085363751;
        Wed, 08 Sep 2021 00:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631085363; cv=none;
        d=google.com; s=arc-20160816;
        b=YIf1iCIEhMuonzCjOL5eZ7BOZwBh14whn9qg78ERAVyHehdBXwigUIDAyyguwYvsg2
         MNXgTGhFOCu4e8hGv2Ul0ebQTx2HJPEdSxMPX7v+BorErdPg15PkLlK7K5D6aArlLLC0
         bfjkMwEd6Qq9BimP3QB+sJavmAPSSol9YpACmW5xBnmY2BMlF+f8+zzYL9BWzpiIUOTu
         AyJxp12hCDqjzqR5rBJeRH9eT0ntNFzcPZ89UXPTGn8vPNXCzfNc1wvsoUvjRy7Ftxzn
         E2se7SaxDoouUFCJtyg2++14kBTjw+WabVfZH+9M0o7ieo7kvtwgRe4LCS4dXfTj5CSU
         RfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=rYNJzjFh8jIWFpD2yeR88/tXIIZPuFUG/CAquxgxKVg=;
        b=godroRmwUZXEyolDbpGK1r7BXwpmyY/o7X9odA2h6z7JpvJnsM1Zen+EAQmJm1oSRp
         uWTlWXh60uopbbpeGDZQCr3CRI4X2L4gIjAoCoHmdsUWOeTxDxJvv+jTt1i9ydBuf9mL
         SdOu49tsjkBzLYXGUUnob0fHCljEXvl5nHevZsqeiSFQys4oWsL217LgpUUsQXuLSUn3
         KGNWMb7MZRmXR0XTn90JaQSAuhZPlqmmY1+E2A1BWSA/1iMkK+sFiJ2yOQstRaX9vn13
         5PbDZ1H7x20JMZV/gYcs5+bk12MOx3kElJ1i8MTwFywBcPgp1JROHBbDDhlQofQocPaO
         u7Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HxRO2DXQ;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id js20si1378656ejc.216.2021.09.08.00.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Sep 2021 00:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HxRO2DXQ;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631085362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rYNJzjFh8jIWFpD2yeR88/tXIIZPuFUG/CAquxgxKVg=;
	b=HxRO2DXQTTHIYhRZqdR+ZysgvvETa+gL2FRq8mT86xT7FAOVE2QJctoi6nmVqZda5fv3A1
	mTzwrBx8dWdyXqCD6mp0FmjGUZTKA+8znzbPSVs7f7COnscbAZmVIkFgnIxiHtOAlADL/b
	31jmAv261lVx0l0iOxFFFSOj1+Au6TA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-ZM4gXXT_NVKzzzIgZFUsKQ-1; Wed, 08 Sep 2021 03:16:01 -0400
X-MC-Unique: ZM4gXXT_NVKzzzIgZFUsKQ-1
Received: by mail-ej1-f69.google.com with SMTP id o14-20020a1709062e8e00b005d37183e041so531770eji.21
        for <alex.bennee@linaro.org>; Wed, 08 Sep 2021 00:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+HK4DwjshowkvDWESjpm/l2pWLn+JpLdOS6SO9jRqCE=;
        b=jTnOKyB+/JG2dDrah89mSR1kB8pqLAKE1bmLwG6JlQqRKd1lRPj3ghJLqo3pJZ/fii
         gVpI3HmdgnCywN15f9MoIuevYD/iBUzKL1c8YWCPa34p6CZAlCNQgKtOAgnOp1YoCqBm
         RwFGr3Sn7okyc00JPnnnLytYgZzo7SG3YD4dWRMigoHPmhgz4P/m/hC0THhCwAJ+bd5g
         EpdceO0ixjWmPPz1sfjyU3SIb7UAiubeQ1Y3+jSIIhGPbtWlxickdwgn0E0MEKTwfXVP
         ggP2BNA2XqPDJ2/72O5MTO4nturL/qJyLrq8dX3TWfdSAzccjLkiRXUV+1tspHvCHXDM
         wweA==
X-Gm-Message-State: AOAM532IzeyKcMkDgbD0fI6wKKyr1r9Rpp6PPf9eGDZ4ztdzZrgoFqPS
	RkDfK+v5HUiShUBj0wH3dXDvZ0vaCDkeZKOAHAlQQB49y5PosFVKa3Q+GBy2JwN5xeGq0HZyhy2
	iR1pPsPrHI61F/OQs
X-Received: by 2002:a17:906:4452:: with SMTP id i18mr2436708ejp.374.1631085360453;
        Wed, 08 Sep 2021 00:16:00 -0700 (PDT)
X-Received: by 2002:a17:906:4452:: with SMTP id i18mr2436690ejp.374.1631085360239;
        Wed, 08 Sep 2021 00:16:00 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id qq16sm506918ejb.120.2021.09.08.00.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 00:15:59 -0700 (PDT)
Date: Wed, 8 Sep 2021 09:15:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>, Alexandre Iooss <erdnaxe@crans.org>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Michael Roth
 <michael.roth@amd.com>, Zhang Chen <chen.zhang@intel.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, Stefan Weil
 <sw@weilnetz.de>, John Snow <jsnow@redhat.com>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org, Helge Deller
 <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Peter Xu <peterx@redhat.com>, "Gonglei
 (Arei)" <arei.gonglei@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam
 Zheng <fam@euphon.net>, Jason Wang <jasowang@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, Kevin Wolf <kwolf@redhat.com>, Yuval Shaia
 <yuval.shaia.ml@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Greg Kurz
 <groug@kaod.org>, qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 08/28] hw/acpi: Avoid truncating acpi_data_len() to
 32-bit
Message-ID: <20210908091558.0a00cd02@redhat.com>
In-Reply-To: <20210903110702.588291-9-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
	<20210903110702.588291-9-philmd@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IoHezPYEEW1c

On Fri,  3 Sep 2021 13:06:42 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> acpi_data_len() returns an unsigned type, which might be bigger
> than 32-bit (although it is unlikely such value is returned).
> Hold the returned value in an 'unsigned' type to avoid unlikely
> size truncation.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 2 +-
>  hw/i386/acpi-build.c     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 037cc1fd82c..95543d43e2a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -885,7 +885,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuild=
Tables *tables)
> =20
>  static void acpi_ram_update(MemoryRegion *mr, GArray *data)
>  {
> -    uint32_t size =3D acpi_data_len(data);
> +    unsigned size =3D acpi_data_len(data);
> =20
>      /* Make sure RAM size is correct - in case it got changed
>       * e.g. by migration */
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a33ac8b91e1..aa269914b49 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2660,7 +2660,7 @@ void acpi_build(AcpiBuildTables *tables, MachineSta=
te *machine)
> =20
>  static void acpi_ram_update(MemoryRegion *mr, GArray *data)
>  {
> -    uint32_t size =3D acpi_data_len(data);
> +    unsigned size =3D acpi_data_len(data);
> =20
>      /* Make sure RAM size is correct - in case it got changed e.g. by mi=
gration */
>      memory_region_ram_resize(mr, size, &error_abort);
> @@ -2783,7 +2783,7 @@ void acpi_setup(void)
>           * Though RSDP is small, its contents isn't immutable, so
>           * we'll update it along with the rest of tables on guest access=
.
>           */
> -        uint32_t rsdp_size =3D acpi_data_len(tables.rsdp);
> +        unsigned rsdp_size =3D acpi_data_len(tables.rsdp);
> =20
>          build_state->rsdp =3D g_memdup(tables.rsdp->data, rsdp_size);
>          fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
