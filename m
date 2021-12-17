Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h7sm1201963vsk.5.2021.12.17.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 06:55:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1F0B71FF96;
	Fri, 17 Dec 2021 14:55:21 +0000 (GMT)
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com> <875yrofxki.fsf@linaro.org>
 <YbyT7D/UpSGpmC24@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, Kevin
 Wolf <kwolf@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, David Hildenbrand <david@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>, John Snow
 <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Date: Fri, 17 Dec 2021 14:53:05 +0000
In-reply-to: <YbyT7D/UpSGpmC24@redhat.com>
Message-ID: <87ilvne0x2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fC5Ld7DQzlgS


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Dec 16, 2021 at 02:11:37PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>> > When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
>> > (Fedora 34 provides GLib 2.68.1) we get:
>> >
>> >   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: U=
se 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>> >   ...
>> >
>> > g_memdup() has been updated by g_memdup2() to fix eventual security
>> > issues (size argument is 32-bit and could be truncated / wrapping).
>> > GLib recommends to copy their static inline version of g_memdup2():
>> > https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memd=
up2-now/5538
>> >
>> > Our glib-compat.h provides a comment explaining how to deal with
>> > these deprecated declarations (see commit e71e8cc0355
>> > "glib: enforce the minimum required version and warn about old APIs").
>> >
>> > Following this comment suggestion, implement the g_memdup2_qemu()
>> > wrapper to g_memdup2(), and use the safer equivalent inlined when
>> > we are using pre-2.68 GLib.
>> >
>> > Reported-by: Eric Blake <eblake@redhat.com>
>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > ---
>> >  include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
>> >  1 file changed, 37 insertions(+)
>> >
>> > diff --git a/include/glib-compat.h b/include/glib-compat.h
>> > index 9e95c888f54..8d01a8c01fb 100644
>> > --- a/include/glib-compat.h
>> > +++ b/include/glib-compat.h
>> > @@ -68,6 +68,43 @@
>> >   * without generating warnings.
>> >   */
>> >=20=20
>> > +/*
>> > + * g_memdup2_qemu:
>> > + * @mem: (nullable): the memory to copy.
>> > + * @byte_size: the number of bytes to copy.
>> > + *
>> > + * Allocates @byte_size bytes of memory, and copies @byte_size bytes =
into it
>> > + * from @mem. If @mem is %NULL it returns %NULL.
>> > + *
>> > + * This replaces g_memdup(), which was prone to integer overflows when
>> > + * converting the argument from a #gsize to a #guint.
>> > + *
>> > + * This static inline version is a backport of the new public API from
>> > + * GLib 2.68, kept internal to GLib for backport to older stable rele=
ases.
>> > + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
>> > + *
>> > + * Returns: (nullable): a pointer to the newly-allocated copy of the =
memory,
>> > + *          or %NULL if @mem is %NULL.
>> > + */
>> > +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_s=
ize)
>> > +{
>> > +#if GLIB_CHECK_VERSION(2, 68, 0)
>> > +    return g_memdup2(mem, byte_size);
>> > +#else
>> > +    gpointer new_mem;
>> > +
>> > +    if (mem && byte_size !=3D 0) {
>> > +        new_mem =3D g_malloc(byte_size);
>> > +        memcpy(new_mem, mem, byte_size);
>> > +    } else {
>> > +        new_mem =3D NULL;
>> > +    }
>> > +
>> > +    return new_mem;
>> > +#endif
>> > +}
>> > +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
>> > +
>>=20
>> As per our style wouldn't it make sense to just call it qemu_memdup(m,
>> s)?
>
> Not in this case. We use suffix as we don't want people calling this
> directly with the suffix.
>
> In the glibcompat.h header we're attempting to transparently/secretly
> replace/wrap standard glib APIs.  All the callers should remain using
> the plain glib API name, never call the method with the suffix at
> all. This lets us delete the wrapper later and not have to update
> any callers. The suffix is basically just a hack of the impl we use
> for transparent replacement.

Right - at the risk of bike shedding names maybe we should choose a
suffix the better reflects the purpose like _alt or _internal rather
than overloading qemu?

We already document _locked for example.

> A method with a 'qemu_' prefix by constrast is something that callers
> are explicitly expected to call directly.
>
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e
