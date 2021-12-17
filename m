Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f125sm840103vkg.27.2021.12.17.03.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 03:24:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F1C841FF96;
	Fri, 17 Dec 2021 11:24:10 +0000 (GMT)
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com> <875yrofxki.fsf@linaro.org>
 <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, Kevin
 Wolf <kwolf@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, David Hildenbrand <david@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>, John Snow
 <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-ppc@nongnu.org, "Daniel P
 . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Date: Fri, 17 Dec 2021 11:10:31 +0000
In-reply-to: <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com>
Message-ID: <87v8zneap1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4eawTFOqgvPh


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 12/16/21 15:11, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
>>> (Fedora 34 provides GLib 2.68.1) we get:
>>>
>>>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Us=
e 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>>>   ...
>>>
>>> g_memdup() has been updated by g_memdup2() to fix eventual security
>>> issues (size argument is 32-bit and could be truncated / wrapping).
>>> GLib recommends to copy their static inline version of g_memdup2():
>>> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdu=
p2-now/5538
>>>
>>> Our glib-compat.h provides a comment explaining how to deal with
>>> these deprecated declarations (see commit e71e8cc0355
>>> "glib: enforce the minimum required version and warn about old APIs").
>>>
<snip>
>>> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
>>> +
>>=20
>> As per our style wouldn't it make sense to just call it qemu_memdup(m,
>> s)?
>
> I followed the documentation in include/glib-compat.h:
>
> /*
>  * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above,
> allowing
>  * use of functions from newer GLib via this compat header needs a little
>  * trickery to prevent warnings being emitted.
>  *
>  * Consider a function from newer glib-X.Y that we want to use
>  *
>  *    int g_foo(const char *wibble)
>  *
>  * We must define a static inline function with the same signature that d=
oes
>  * what we need, but with a "_qemu" suffix e.g.
>  *
>  * static inline void g_foo_qemu(const char *wibble)
>  * {
>  *     #if GLIB_CHECK_VERSION(X, Y, 0)
>  *        g_foo(wibble)
>  *     #else
>  *        g_something_equivalent_in_older_glib(wibble);
>  *     #endif
>  * }
>  *
>  * The #pragma at the top of this file turns off -Wdeprecated-declaration=
s,
>  * ensuring this wrapper function impl doesn't trigger the compiler warni=
ng
>  * about using too new glib APIs. Finally we can do
>  *
>  *   #define g_foo(a) g_foo_qemu(a)
>  *
>  * So now the code elsewhere in QEMU, which *does* have the
>  * -Wdeprecated-declarations warning active, can call g_foo(...) as norma=
l,
>  * without generating warnings.
>  */
>
> which is how g_unix_get_passwd_entry_qemu() is implemented.

Yet later we have qemu_g_test_slow following the style guide. Also I'm
confused by the usage of g_unix_get_passwd_entry_qemu because the only
place I see it in qga/commands-posix-ssh.c right before it does:

#define g_unix_get_passwd_entry_qemu(username, err) \
   test_get_passwd_entry(username, err)

although I think that only hold when the file is built with
QGA_BUILD_UNIT_TEST.

> Should we reword the documentation first?

The original wording in glib-compat.h was added by Daniel in 2018 but
the commit that added the password function comments:

  Since the fallback version is still unsafe, I would rather keep the
  _qemu postfix, to make sure it's not being misused by mistake. When/if
  necessary, we can implement a safer fallback and drop the _qemu suffix.

So if we are going to make a distinction between a qemu prefix and
suffix we should agree that and add it to the style document.

--=20
Alex Benn=C3=A9e
