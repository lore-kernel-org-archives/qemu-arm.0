Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp2170263lfb;
        Sat, 4 Sep 2021 05:25:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZHqODXN5B67azsX6KsgIZXjL+zCndh5Mb30BfHgUyQZIbICnj7q2QahZCv7wDlUFSwfRq
X-Received: by 2002:adf:b741:: with SMTP id n1mr3885399wre.354.1630758336127;
        Sat, 04 Sep 2021 05:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630758336; cv=none;
        d=google.com; s=arc-20160816;
        b=mzVPVSjNgCrn3PIkuY3heqyl/Uz58mwfwxdoJhUPVLkJgAJ6PuVDR9WamsnAizpK5U
         6s3t/H68Vp+u7vB+qVMoB4ldN1cYICdx1nobM70t9XEd0AE+yagl/UBhixY5mme/jJ13
         Ej3dFUF6Hg0SaNNf+wACoQ+X/7yYSboK7+0rF70A0V74gnTQu+P2bV2a6OjtwTnWmThe
         M92BnZZSdiLNw6CzKqVsKG9kTtzyTRWU3SkLubEPK2PuVSD5YUCk8hv8YXN6Mql2fmG0
         L6AoaXzul+FOTHRkGjJH1gNUwtD3MCmBaLqJWqkjZf1dpza0JKX5FPw7re6gQ3DHm0iR
         sy9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Zpei16J8rM2tjQRTfK64h0Z7P572C9xba9WUKHBB9ps=;
        b=dz2PLzQP7HAxKneou63g771pmJ68DylBXGrkgddVhPqEiDJPF96nSgjU8LQqF71buZ
         QKqDMydwZwRYwhjKpIgJJcgVnr/37tYDcehOtkQivohCHhzih2LI+FdneAMngFzEp3z2
         VUSnMgOz4GPR70MINiYwJEyXHMmvvHyfSUOiKmAX0Sw7vthryxWKtSl+U8ojYKuz3Qwk
         87VaGFdvxylSo7ig8KsiUdkA7y3EQNb4rWa9fJh2s6hynIC6a76orntbejml222XCLRm
         5sTxl1l1/QIVN1QS5RYWFdGcKEk+iyiwmp01cRASf8+KrJAfAekN66GhTPVu8RgglrjW
         eegw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b=Hndcwxt5;
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
Return-Path: <qemu_oss@crudebyte.com>
Received: from kylie.crudebyte.com (kylie.crudebyte.com. [5.189.157.229])
        by mx.google.com with ESMTPS id a9si2214387wri.395.2021.09.04.05.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 05:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) client-ip=5.189.157.229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b=Hndcwxt5;
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=Zpei16J8rM2tjQRTfK64h0Z7P572C9xba9WUKHBB9ps=; b=Hndcwxt5N2NDr7p5/+Xa9fIxAC
	EeNMbmfUEfjWG9XwuTsZvnYscP/W7W4M1qhRYNipRUsmcGlQPHAG3Q3st3BpZiqF5jV0h+L6RpmI4
	/scFL4PZLVnEZdFQNgcVAKYClug3ykyTb9oI/ifCySaWWLMtbEdwy5FOQwG2+UI60zTKIj+zp9Nub
	8zmePm1Qzoml2tAi1/dPH+xs2zawMERUimJX21TLO+z/RWTjlHtT6OALAlHKZiuKyWC5Phz8PW63m
	Qryh4Jz/VQDrkbnjLa88aYvenEcnq0DCerMd9f464OkdLrHOm4JMDGQxOlXVe9Jcfn4k34Ru/8Fe9
	pAcHIavmNd+u24CugNPoQCtlPOrQUzoQh2neCyFdO4v7ylrjLoUHfiSaaVXD4rpZe/gBg08mFQOEy
	F5dVEFvdJZRi2VbzqLHqdG0vGXPvG6HBhN5RUThuHzscWKiyhhUKeSgd+EfEZ1R1EOv6q6vR3W5J/
	KT0R0LskyUd38NHSP9GuzNmPH2V18AUEAyATbGGEBdHWhJY4qpa1seOiLV3MsQc6c9F7b9yYGlu1u
	tyxmloCkF8KGJyh7AOYXCusp+EKZ6GUdCz63iAaPP8yfdlY6ptP0lpAoynuxt7t8bzkYC/ExQ78P4
	jkMiiirnXFi/s/XBJvx7/AHOUYq2N362jNtMbz7Oo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, David Hildenbrand <david@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-ppc@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 07/28] hw/9pfs: Replace g_memdup() by g_memdup2()
Date: Sat, 04 Sep 2021 14:25:28 +0200
Message-ID: <4088864.kWaN8W1rKf@silver>
In-Reply-To: <20210903174510.751630-8-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com> <20210903174510.751630-8-philmd@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-TUID: T/41J21sLSMf

On Freitag, 3. September 2021 19:44:49 CEST Philippe Mathieu-Daud=E9 wrote:
> Per
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2=
=2Dn
> ow/5538
>=20
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
>=20
> Replace g_memdup() by the safer g_memdup2() wrapper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/9pfs/9p-synth.c | 2 +-
>  hw/9pfs/9p.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index b38088e0664..d6168c653d2 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -497,7 +497,7 @@ static int synth_name_to_path(FsContext *ctx, V9fsPath
> *dir_path, out:
>      /* Copy the node pointer to fid */
>      g_free(target->data);
> -    target->data =3D g_memdup(&node, sizeof(void *));
> +    target->data =3D g_memdup2(&node, sizeof(void *));
>      target->size =3D sizeof(void *);
>      return 0;
>  }

That's Ok, trivial change.

> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index c857b313213..a80166fcaff 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -202,7 +202,7 @@ void v9fs_path_copy(V9fsPath *dst, const V9fsPath *sr=
c)
>  {
>      v9fs_path_free(dst);
>      dst->size =3D src->size;
> -    dst->data =3D g_memdup(src->data, src->size);
> +    dst->data =3D g_memdup2(src->data, src->size);
>  }
>=20
>  int v9fs_name_to_path(V9fsState *s, V9fsPath *dirpath,

src->size is actually just 16 bit (fsdev/file-op-9p.h):

struct V9fsPath {
    uint16_t size;
    char *data;
};

Should (still) be Ok as well as V9fsPath is about file system pathes which =
are=20
currently limited to 4k (PATH_MAX).

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck

