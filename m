Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2404156lfo;
        Mon, 14 Mar 2022 13:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlt4P57lnuQSsQW6H9Gjgr17u/FVYfFFjKhewO8gOzTpFH03xWpN0L/GN+ZVOvcoxk7UQo
X-Received: by 2002:a05:620a:d96:b0:67a:ee04:d947 with SMTP id q22-20020a05620a0d9600b0067aee04d947mr16236913qkl.237.1647290233258;
        Mon, 14 Mar 2022 13:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647290233; cv=none;
        d=google.com; s=arc-20160816;
        b=vYg91ZntNVochJTVV3JEwYrjO/il7AGzcs2IeCPfZAjUMHmGxGOMba+baTAZikde+i
         d9YAOlshj7DX4WpSL4YUzyzQsh5Y3TWrw94pCUubeqM3EodqF+QHluwuoguW0tcFavmP
         XfiBrGKU1DH3zi+MPGJmFIkAZeSAL9QD+AublycWym/xzZaR7URWglNrAEB2kueEqBIR
         YPQt/aVkjcJGc0wVTeWAnFOhlJ4y4c5t9XlXIf5Wh0EYPar19OwoL5qCFXzuGY+iYLkT
         3V0f9G41oKTwFFE4N94UbyLNawypCSUNfNeWb3TB8Nrm8/1VAZxYA4+rY7FtVTHUHFl1
         L5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KF8x4q8MycoHpg2xC2ppJT33EhSOfBmOE9odyg8H5bM=;
        b=zstiZ0MmCjWPbdq2GoMfQcUNWymmdKXHHpoQFId6emkzdfKhp2zNcLcra1uXu5FFzp
         /nu2xK2v+6eL/OlqHn/je2FN8KWEUXxC1zqQ3S0BmV+9Im3im252efizXtNIsoMglHYF
         mKBvOu5mc0FTBAPPaC8bqAhc0ewxPwJWVNhHpXW7RPuL2wZu1qcegZ5JIoQ95/6K3bAy
         4QUOtLpHS+AxrJa+WBtgnFU9RHh/7TCtaHqv+TT10yBwguLhI4Q90LpEe0BcDNYk0dcB
         LNcwBcIqnnCXEDSqQDvMykohZ54xSddl7ZR+UQ9qOOpqY6qVGkKn8dEi9cybZEQh7rJV
         5VYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=lizzy header.b=VxWrwGsY;
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 91.194.90.13 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
Return-Path: <qemu_oss@crudebyte.com>
Received: from lizzy.crudebyte.com (lizzy.crudebyte.com. [91.194.90.13])
        by mx.google.com with ESMTPS id s12-20020a05620a29cc00b0067d4f866899si7006785qkp.383.2022.03.14.13.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 13:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu_oss@crudebyte.com designates 91.194.90.13 as permitted sender) client-ip=91.194.90.13;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=lizzy header.b=VxWrwGsY;
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 91.194.90.13 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=KF8x4q8MycoHpg2xC2ppJT33EhSOfBmOE9odyg8H5bM=; b=VxWrwGsYfWl0j+4yzzjaKIIlcc
	8xd/GykZchfzxIwxLFdMxPJ57GT1FerR4J3x/R5sOO6JSA+9Z9NURazqZ7GZ8oVe57BPVBDDlhR/F
	9ztGmpJHOGc4UA8v2Jy1E6t5jF57lE5IUPcgQI1GVprljnGfXZX3Le8Zl5nUsv62csdJTvh3+XtzA
	M80ScXk1eztYgD8SX1erdIPf7MnAgw2MadHs8zbf5fN2zrk1f72+DzklfbEeIXjsmV+/g0mUPsTuK
	IP3Gy5N1ORQjoPthZyvzqwAxdIaq9rCA8rKE7SewEkR8B50i951zLLV9CH5zt+HKYwKa0XLk2ubLw
	L2q1LeRw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, =?ISO-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>, Jean-Christophe Dubois <jcd@tribudubois.net>, Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Yuval Shaia <yuval.shaia.ml@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>, Fabien Chouteau <chouteau@adacore.com>, KONRAD Frederic <frederic.konrad@adacore.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, Eric Auger <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth <michael.roth@amd.com>, Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, David Hildenbrand <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>, Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, John Snow <jsnow@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com, qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Date: Mon, 14 Mar 2022 21:37:00 +0100
Message-ID: <3080370.YxCODQx3Uq@silver>
In-Reply-To: <877d8w5m9e.fsf@linaro.org>
References: <20220314160108.1440470-1-armbru@redhat.com> <20220314160108.1440470-4-armbru@redhat.com> <877d8w5m9e.fsf@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-TUID: TPRymyHZGOIy

On Montag, 14. M=E4rz 2022 20:48:47 CET Alex Benn=E9e wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> > g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> > for two reasons.  One, it catches multiplication overflowing size_t.
> > Two, it returns T * rather than void *, which lets the compiler catch
> > more type errors.
> >=20
> > This commit only touches allocations with size arguments of the form
> > sizeof(T).
> >=20
> > Patch created mechanically with:
> >     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocc=
i \
> >    =20
> > 	     --macro-file scripts/cocci-macro-file.h FILES...
> >=20
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>=20
> <snip>
>=20
> > --- a/audio/jackaudio.c
> > +++ b/audio/jackaudio.c
> > @@ -97,9 +97,9 @@ static void qjack_buffer_create(QJackBuffer *buffer, =
int
> > channels, int frames)>=20
> >      buffer->used     =3D 0;
> >      buffer->rptr     =3D 0;
> >      buffer->wptr     =3D 0;
> >=20
> > -    buffer->data     =3D g_malloc(channels * sizeof(float *));
> > +    buffer->data     =3D g_new(float *, channels);
> >=20
> >      for (int i =3D 0; i < channels; ++i) {
> >=20
> > -        buffer->data[i] =3D g_malloc(frames * sizeof(float));
> > +        buffer->data[i] =3D g_new(float, frames);
>=20
> Are these actually buffers of pointers to floats? I guess I leave that
> to the JACK experts...

That's correct. JACK does not use interleaved audio format, it uses separat=
e=20
buffers for each audio channel. For the audio stuff of this patch:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck

