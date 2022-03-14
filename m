Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b006b0e62bee84sm7117295ejm.115.2022.03.14.12.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 12:22:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0921D1FFB7;
	Mon, 14 Mar 2022 19:22:15 +0000 (GMT)
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-2-armbru@redhat.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Laurent
 Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Corey Minyard <cminyard@mvista.com>,
 Patrick Venture <venture@google.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Jean-Christophe
 Dubois
 <jcd@tribudubois.net>, Keith Busch <kbusch@kernel.org>, Klaus Jensen
 <its@irrelevant.dk>, Yuval Shaia <yuval.shaia.ml@gmail.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>, KONRAD Frederic
 <frederic.konrad@adacore.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>, David Hildenbrand
 <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, Colin Xu
 <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk
 <reinoud@netbsd.org>, Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia
 Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, John Snow <jsnow@redhat.com>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 1/3] scripts/coccinelle: New use-g_new-etc.cocci
Date: Mon, 14 Mar 2022 19:22:09 +0000
In-reply-to: <20220314160108.1440470-2-armbru@redhat.com>
Message-ID: <87ilsg5ogp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NRbKM9mp4Kkf


Markus Armbruster <armbru@redhat.com> writes:

> This is the semantic patch from commit b45c03f585 "arm: Use g_new() &
> friends where that makes obvious sense".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
