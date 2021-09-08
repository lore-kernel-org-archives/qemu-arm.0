Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp180407lfb;
        Wed, 8 Sep 2021 00:16:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyRQOt8hlVoTIqOjDyqvgktBlNhe2jUcdLCh2bl34qLZMsdLNurprLDSNPRg2BxSWIK4NA
X-Received: by 2002:a17:907:7704:: with SMTP id kw4mr2593326ejc.23.1631085395213;
        Wed, 08 Sep 2021 00:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631085395; cv=none;
        d=google.com; s=arc-20160816;
        b=XaEJTTZs6IP1Ty6fc1mC/NiHATLfCcl47vQA39ZQG89uzWg8XwgEhTEE7xvnxpaLbS
         i81rnLxcHZdOx5PzHpnRSG3FuG5zm9lvdPQDfYf4eRL8fgFOTQVIfQtMgLJWhChIaEJV
         oFpnNLzhPjssywg2dQJKdjYwrD0YXLm+PzargknXv3fYOFAgmZoOIW789rlW74wAhlQ3
         xNhs10DmoInbUjkPdlZKNDjouRUUcz4ba6Xt59EfKhQvA97f6LwTfdzz3mUHYxX6Q7RF
         J+1M2p+qWG6x+hFaCt0Qc79Dc2KdAisz0jS0VtwJ/yZ0EDKlaP0lFte6Xv5cMYP61OwG
         ZZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=6GDyXJ2SB7V/5WdoqQgmGo1qN+H2yQzdy99/HnZTZFI=;
        b=mqZRA1vc1QL9UT7kveYw3qkFPnONV6ft/sIwR8J+pyJzTUdW51XDgKc1aFr4DwxFgY
         1BtWeA4Qaw3KPqdUNnRrqjR5Y32SEfLhSvGTa3TC9BifqQSlIN5xTUy1Jx4A1cONCgI3
         J1xO057bZ920fJBW3hPPFKazhqQdFLL4CZoO2k5O9VuJ5iz2H2869WIjuLnvj3VSs/0G
         Keby/f+jThSCcIrVnh+klByQqNAZ2E9JFhxAPw2lM25mgxiQMfNffpO0F5hMFJsVpxXA
         YlrIbdY251anVJSYZQ8+TjkgkepDVQX9Fq0G1qdN8+15ZjAsOmBMGPI/IeeiSOJxIQKN
         bqDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eWprgtWD;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id qw28si1507509ejc.608.2021.09.08.00.16.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Sep 2021 00:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eWprgtWD;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631085394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GDyXJ2SB7V/5WdoqQgmGo1qN+H2yQzdy99/HnZTZFI=;
	b=eWprgtWD2CQkUj4bBj2dYPqvDmJnNRFVDErykzHUM3Q4PS7NqjmMLtrihYSJejGGzcEVKa
	KFSqZfVinBn/+kqCyYNOldiwgSK8OuAM6OFsaDpd239A5AqTC+5KHO9BwWSk7ywwa9dPUu
	HqyT2GBTAv5n2A1A7helmkvvOYuyD28=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-hjes5TbWOZ6bQLx8K-oKYQ-1; Wed, 08 Sep 2021 03:16:32 -0400
X-MC-Unique: hjes5TbWOZ6bQLx8K-oKYQ-1
Received: by mail-ed1-f70.google.com with SMTP id m30-20020a50999e000000b003cdd7680c8cso605280edb.11
        for <alex.bennee@linaro.org>; Wed, 08 Sep 2021 00:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6GDyXJ2SB7V/5WdoqQgmGo1qN+H2yQzdy99/HnZTZFI=;
        b=QLTLlZ9TG/OZ96Kd5U989xNNgyckDFXoQIhtqD42XLi1TgAV3jeDXXW9mzsQLmYDdG
         oFirav8IyCfq63ew72hSurDAjZO+g8fKw+inMUZaOMX1vw0ZG/ZwFtdfb6syuloyEOtz
         J1w50xe1PssavpsnBhvbch+ZLAdWdEcCW/FcvjXwLgPuLsKKrBmDnNVq5z9noQFBwQaF
         h9tvwrNTGZS9q8aDgIiyVSzs/G3ptyVft+bVVxfRsNZMvc5YRPARHW9OcVr6o/HJLj2V
         lcnDFwBTpi/6xxdhVbl6RHCD0NHbORwZD8twOVm8eSrgYqBURChgDKywkgW7frefORZG
         TOyA==
X-Gm-Message-State: AOAM531hW+92xjVV++kbBPgZ77dEJCuWd8YNTFKy6amP/Q0l0dCheWPe
	PfupEF8FFgBuFeUd2NqPh+rgT9cKRGHg+MMMggUZfTcU7VWd8SAGGKuoLn8DqqSHIFIrFeSjXp2
	dltorPfLkb+cu+C11
X-Received: by 2002:aa7:d601:: with SMTP id c1mr2346059edr.143.1631085391016;
        Wed, 08 Sep 2021 00:16:31 -0700 (PDT)
X-Received: by 2002:aa7:d601:: with SMTP id c1mr2346042edr.143.1631085390807;
        Wed, 08 Sep 2021 00:16:30 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id bm26sm514736ejb.16.2021.09.08.00.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 00:16:30 -0700 (PDT)
Date: Wed, 8 Sep 2021 09:16:28 +0200
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
Subject: Re: [PATCH 09/28] hw/acpi: Replace g_memdup() by g_memdup2_qemu()
Message-ID: <20210908091628.3f08afa3@redhat.com>
In-Reply-To: <20210903110702.588291-10-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
	<20210903110702.588291-10-philmd@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cksxohxasMY4

On Fri,  3 Sep 2021 13:06:43 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-mem=
dup2-now/5538
>=20
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
>=20
> Replace g_memdup() by the safer g_memdup2_qemu() wrapper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>


> ---
>  hw/acpi/core.c       | 3 ++-
>  hw/i386/acpi-build.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 1e004d0078d..9dd2cf09a0b 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -637,7 +637,8 @@ void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *pa=
rent,
>          suspend[3] =3D 1 | ((!disable_s3) << 7);
>          suspend[4] =3D s4_val | ((!disable_s4) << 7);
> =20
> -        fw_cfg_add_file(fw_cfg, "etc/system-states", g_memdup(suspend, 6=
), 6);
> +        fw_cfg_add_file(fw_cfg, "etc/system-states",
> +                        g_memdup2_qemu(suspend, 6), 6);
>      }
>  }
> =20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index aa269914b49..54494ca1f65 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2785,7 +2785,7 @@ void acpi_setup(void)
>           */
>          unsigned rsdp_size =3D acpi_data_len(tables.rsdp);
> =20
> -        build_state->rsdp =3D g_memdup(tables.rsdp->data, rsdp_size);
> +        build_state->rsdp =3D g_memdup2_qemu(tables.rsdp->data, rsdp_siz=
e);
>          fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
>                                   acpi_build_update, NULL, build_state,
>                                   build_state->rsdp, rsdp_size, true);
