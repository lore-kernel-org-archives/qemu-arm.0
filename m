Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2689881lfo;
        Tue, 15 Mar 2022 00:53:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1pRBu2kb1hrsCtVBim2JePK4vCitHLZ82kTDIMdTTGYO4mP9QGPEvMxixLhAUoDPcpEpF
X-Received: by 2002:a05:6214:9c1:b0:42d:b2b8:f760 with SMTP id dp1-20020a05621409c100b0042db2b8f760mr20445032qvb.123.1647330837800;
        Tue, 15 Mar 2022 00:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647330837; cv=none;
        d=google.com; s=arc-20160816;
        b=JuxJ1r7dolCh/mPj4zyktZcYcLhsl5Z1j74CEHVVjTh9fkD6aESxy70BH2adFN031m
         WHaVxbHMuQHWyCpKDt2I4sycGphcVQCXjVIvTeOJtOM2LsfL8XV8L8Hu8RVZXC98HEmq
         +3vo1nnWIiL/aVSjwTSaPIQBjupHXGbfkR29jpUORTIR/Rg5cbsoc/B+EL0eAaLoaCnl
         QnbcTHkWt6teRMcPt80lvnvq+WUxnTDcQX4gd7ZaCuzJZkSFbgCe8L6kRjlikSHUZlL1
         DZrE7YCuDjs3g1DRO4gIkLhCDZRPAnxJruF9EtZFuGldTFuH2RLKypK9QvjOUl7u2EkO
         be8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=RpOmwPb6DBwIXXsssfQkZvHsZHvJK4AWyNJIf3FBulQ=;
        b=Bkt8PgX8DAJ5nJyMEicUwmm4tia5pQkGXl11uzJBdrU0rzmX7IuNc3sRSRvwRPM7uF
         95NbufWgmaCprTBYwQD3sXnZHodgQ3eOiy3jZzNbABUOBzXBA9Fg1s+zDKlNB2boSI6t
         NQGXLgNoHJqwfbEJ5lsKqAe3/37wceU2gAQxub86JPPsIQa2vKub1Mq77Arpv0qsRrQU
         iOiIFtfzKckUxLBceCOfbdBSFQDMfu4YdboK4Sxh+3GD4V3BHhL/bUlplKOhOzUQa0LY
         V0PusdClaFikJK3eQiTArBWqjEtj9A75dtH70GziaJ6nPo5vFa/lhKTbB122tLaaVAqv
         M3rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning groug@kaod.org does not designate 207.211.30.44 as permitted sender) smtp.mailfrom=groug@kaod.org
Return-Path: <groug@kaod.org>
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com. [207.211.30.44])
        by mx.google.com with ESMTPS id x3-20020ac87303000000b002e1aa32ce95si5703156qto.787.2022.03.15.00.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Mar 2022 00:53:57 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning groug@kaod.org does not designate 207.211.30.44 as permitted sender) client-ip=207.211.30.44;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning groug@kaod.org does not designate 207.211.30.44 as permitted sender) smtp.mailfrom=groug@kaod.org
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-wQ12KsT-PDSqq8y9SNA3Rw-1; Tue, 15 Mar 2022 03:53:56 -0400
X-MC-Unique: wQ12KsT-PDSqq8y9SNA3Rw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25BE18001EA;
	Tue, 15 Mar 2022 07:53:54 +0000 (UTC)
Received: from bahia (unknown [10.39.192.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED3FC7CB810;
	Tue, 15 Mar 2022 07:53:43 +0000 (UTC)
Date: Tue, 15 Mar 2022 08:53:42 +0100
From: Greg Kurz <groug@kaod.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?=
 Lureau <marcandre.lureau@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>, Amit Shah
 <amit@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Poussineau <hpoussin@reactos.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Corey Minyard <cminyard@mvista.com>,
 Patrick Venture <venture@google.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter
 Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, =?UTF-8?B?Q8Op?=
 =?UTF-8?B?ZHJpYw==?= Le Goater <clg@kaod.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Keith Busch
 <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Yuval Shaia
 <yuval.shaia.ml@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Fabien Chouteau
 <chouteau@adacore.com>, KONRAD Frederic <frederic.konrad@adacore.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, Michael
 Roth <michael.roth@amd.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, David Hildenbrand
 <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, Colin Xu
 <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk
 <reinoud@netbsd.org>, Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia
 Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, John Snow <jsnow@redhat.com>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 2/3] 9pfs: Use g_new() & friends where that makes
 obvious sense
Message-ID: <20220315085342.2b07eff8@bahia>
In-Reply-To: <20220314160108.1440470-3-armbru@redhat.com>
References: <20220314160108.1440470-1-armbru@redhat.com>
	<20220314160108.1440470-3-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: JwOMtdHaIC3y

On Mon, 14 Mar 2022 17:01:07 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>=20
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>=20
> Patch created mechanically with:
>=20
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci =
\
> =09     --macro-file scripts/cocci-macro-file.h FILES...
>=20
> Except this uncovers a typing error:
>=20
>     ../hw/9pfs/9p.c:855:13: warning: incompatible pointer types assigning=
 to 'QpfEntry *' from 'QppEntry *' [-Wincompatible-pointer-types]
> =09    val =3D g_new0(QppEntry, 1);
> =09=09^ ~~~~~~~~~~~~~~~~~~~
>     1 warning generated.
>=20
> Harmless, because QppEntry is larger than QpfEntry.  Fix to allocate a
> QpfEntry instead.
>=20
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/9p-proxy.c           | 2 +-
>  hw/9pfs/9p-synth.c           | 4 ++--
>  hw/9pfs/9p.c                 | 8 ++++----
>  hw/9pfs/codir.c              | 6 +++---
>  tests/qtest/virtio-9p-test.c | 4 ++--
>  5 files changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> index 8b4b5cf7dc..4c5e0fc217 100644
> --- a/hw/9pfs/9p-proxy.c
> +++ b/hw/9pfs/9p-proxy.c
> @@ -1187,7 +1187,7 @@ static int proxy_parse_opts(QemuOpts *opts, FsDrive=
rEntry *fs, Error **errp)
> =20
>  static int proxy_init(FsContext *ctx, Error **errp)
>  {
> -    V9fsProxy *proxy =3D g_malloc(sizeof(V9fsProxy));
> +    V9fsProxy *proxy =3D g_new(V9fsProxy, 1);
>      int sock_id;
> =20
>      if (ctx->export_flags & V9FS_PROXY_SOCK_NAME) {
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index b3080e415b..d99d263985 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -49,7 +49,7 @@ static V9fsSynthNode *v9fs_add_dir_node(V9fsSynthNode *=
parent, int mode,
> =20
>      /* Add directory type and remove write bits */
>      mode =3D ((mode & 0777) | S_IFDIR) & ~(S_IWUSR | S_IWGRP | S_IWOTH);
> -    node =3D g_malloc0(sizeof(V9fsSynthNode));
> +    node =3D g_new0(V9fsSynthNode, 1);
>      if (attr) {
>          /* We are adding .. or . entries */
>          node->attr =3D attr;
> @@ -128,7 +128,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, i=
nt mode,
>      }
>      /* Add file type and remove write bits */
>      mode =3D ((mode & 0777) | S_IFREG);
> -    node =3D g_malloc0(sizeof(V9fsSynthNode));
> +    node =3D g_new0(V9fsSynthNode, 1);
>      node->attr         =3D &node->actual_attr;
>      node->attr->inode  =3D synth_node_count++;
>      node->attr->nlink  =3D 1;
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index a6d6b3f835..8e9d4aea73 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -324,7 +324,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t =
fid)
>              return NULL;
>          }
>      }
> -    f =3D g_malloc0(sizeof(V9fsFidState));
> +    f =3D g_new0(V9fsFidState, 1);
>      f->fid =3D fid;
>      f->fid_type =3D P9_FID_NONE;
>      f->ref =3D 1;
> @@ -804,7 +804,7 @@ static int qid_inode_prefix_hash_bits(V9fsPDU *pdu, d=
ev_t dev)
> =20
>      val =3D qht_lookup(&pdu->s->qpd_table, &lookup, hash);
>      if (!val) {
> -        val =3D g_malloc0(sizeof(QpdEntry));
> +        val =3D g_new0(QpdEntry, 1);
>          *val =3D lookup;
>          affix =3D affixForIndex(pdu->s->qp_affix_next);
>          val->prefix_bits =3D affix.bits;
> @@ -852,7 +852,7 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struc=
t stat *stbuf,
>              return -ENFILE;
>          }
> =20
> -        val =3D g_malloc0(sizeof(QppEntry));
> +        val =3D g_new0(QpfEntry, 1);
>          *val =3D lookup;
> =20
>          /* new unique inode and device combo */
> @@ -928,7 +928,7 @@ static int qid_path_suffixmap(V9fsPDU *pdu, const str=
uct stat *stbuf,
>              return -ENFILE;
>          }
> =20
> -        val =3D g_malloc0(sizeof(QppEntry));
> +        val =3D g_new0(QppEntry, 1);
>          *val =3D lookup;
> =20
>          /* new unique inode affix and device combo */
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index 75148bc985..93ba44fb75 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -141,9 +141,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState=
 *fidp,
> =20
>          /* append next node to result chain */
>          if (!e) {
> -            *entries =3D e =3D g_malloc0(sizeof(V9fsDirEnt));
> +            *entries =3D e =3D g_new0(V9fsDirEnt, 1);
>          } else {
> -            e =3D e->next =3D g_malloc0(sizeof(V9fsDirEnt));
> +            e =3D e->next =3D g_new0(V9fsDirEnt, 1);
>          }
>          e->dent =3D qemu_dirent_dup(dent);
> =20
> @@ -163,7 +163,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState=
 *fidp,
>                  break;
>              }
> =20
> -            e->st =3D g_malloc0(sizeof(struct stat));
> +            e->st =3D g_new0(struct stat, 1);
>              memcpy(e->st, &stbuf, sizeof(struct stat));
>          }
> =20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 01ca076afe..e28c71bd8f 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -468,12 +468,12 @@ static void v9fs_rreaddir(P9Req *req, uint32_t *cou=
nt, uint32_t *nentries,
>           togo -=3D 13 + 8 + 1 + 2 + slen, ++n)
>      {
>          if (!e) {
> -            e =3D g_malloc(sizeof(struct V9fsDirent));
> +            e =3D g_new(struct V9fsDirent, 1);
>              if (entries) {
>                  *entries =3D e;
>              }
>          } else {
> -            e =3D e->next =3D g_malloc(sizeof(struct V9fsDirent));
> +            e =3D e->next =3D g_new(struct V9fsDirent, 1);
>          }
>          e->next =3D NULL;
>          /* qid[13] offset[8] type[1] name[s] */
