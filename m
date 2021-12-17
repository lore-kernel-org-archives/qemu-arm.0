Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o7sm1740886vkl.41.2021.12.17.04.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 04:15:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AEAFC1FF96;
	Fri, 17 Dec 2021 12:15:46 +0000 (GMT)
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com> <875yrofxki.fsf@linaro.org>
 <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com>
 <87v8zneap1.fsf@linaro.org>
 <c2ac9145-25a3-8b66-2039-64229247c403@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, David Gibson
 <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Markus Armbruster
 <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, David Hildenbrand <david@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>, John Snow
 <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-ppc@nongnu.org, "Daniel P
 . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Date: Fri, 17 Dec 2021 12:15:05 +0000
In-reply-to: <c2ac9145-25a3-8b66-2039-64229247c403@redhat.com>
Message-ID: <87r1abe8b1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: H3bOsj+VLLRP


Laurent Vivier <lvivier@redhat.com> writes:

> Alex,
>
> I've added this patch to my trivial patches branch, do you want I drop
> it?

No - the patch itself is fine. I would like to fix up the consistency
later if we can agree on what it should be.

--=20
Alex Benn=C3=A9e
