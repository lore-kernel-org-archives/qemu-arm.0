Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j10-20020adfe50a000000b0030631f199f9sm6991877wrm.34.2023.05.03.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 08:36:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4824C1FFBA;
	Wed,  3 May 2023 16:36:50 +0100 (BST)
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Artyom
 Tarasenko <atar4qemu@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, Helge
 Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Stefan
 Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Mark
 Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas
 <farosas@suse.de>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Date: Wed, 03 May 2023 16:35:03 +0100
In-reply-to: <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
Message-ID: <87y1m5s9yl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Cr278Z4g1hgp


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/3/23 11:12, Alex Benn=C3=A9e wrote:
>> From: Fabiano Rosas <farosas@suse.de>
>> The 'virt' machine uses virtio-net-pci as a fallback when no other
>> network driver has been selected via command line. Select VIRTIO_NET
>> and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=3Dn
>> (due to e.g. --without-default-devices):
>> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
>> qemu-system-aarch64: Unsupported NIC model: virtio-net-pci
>
> With respect to patches 5-17, very few devices need to be present when
> configuring --without-default-devices, and thus need to be "select"ed
> by Kconfig.  You should select a device only if you cannot even start
> the machine without --nodefaults.

Which is the case here right? We could skip tests that explicitly
instantiate a device but these are tests failing with default devices
the machine tries to instantiate.

> Anything else should be added by hand to configs/ if you use
> --nodefaults.  In particular, failures of "make check" when configured
> --without-default-devices are *test* bugs, not configuration bugs.
>
> I didn't check if _all_ of the patches in this set should be dropped,
> but most probably do.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
