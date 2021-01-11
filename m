Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o3sm396503wrc.93.2021.01.11.09.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 09:48:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B2CE01FF7E;
	Mon, 11 Jan 2021 17:48:50 +0000 (GMT)
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-3-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, Greg Kurz
 <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Amit Shah <amit@kernel.org>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, qemu-arm@nongnu.org, John Snow
 <jsnow@redhat.com>, qemu-s390x@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Jason Wang <jasowang@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Halil
 Pasic <pasic@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Cornelia Huck <cohuck@redhat.com>, David
 Hildenbrand <david@redhat.com>, qemu-block@nongnu.org, Christian
 Borntraeger <borntraeger@de.ibm.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
Date: Mon, 11 Jan 2021 17:48:41 +0000
In-reply-to: <20210111152020.1422021-3-philmd@redhat.com>
Message-ID: <87lfcznz3x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fTQ28jspB0P/


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The 'running' argument from VMChangeStateHandler does not require
> other value than 0 / 1. Make it a plain boolean.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Seems reasonable

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
