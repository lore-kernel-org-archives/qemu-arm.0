Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace733aa401sm868915066b.35.2025.04.30.03.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:24:51 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D0B675F8BB;
	Wed, 30 Apr 2025 11:24:50 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: qemu-devel@nongnu.org,  Akihiko Odaki <akihiko.odaki@daynix.com>,
  Thomas Huth <thuth@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  David Hildenbrand <david@redhat.com>,  Pierrick
 Bouvier <pierrick.bouvier@linaro.org>,  qemu-arm@nongnu.org,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Peter Xu
 <peterx@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  qemu-stable@nongnu.org
Subject: Re: [PATCH 8/9] virtio-gpu: fix hang under TCG when unmapping blob
In-Reply-To: <33ae8cd5-cc5c-4bfd-9c0b-dd71b80dfc0b@collabora.com> (Dmitry
	Osipenko's message of "Wed, 30 Apr 2025 00:26:30 +0300")
References: <20250428125918.449346-1-alex.bennee@linaro.org>
	<20250428125918.449346-9-alex.bennee@linaro.org>
	<8b123991-21f2-47b5-851d-6b53fbfaa691@collabora.com>
	<87o6we3bto.fsf@draig.linaro.org>
	<33ae8cd5-cc5c-4bfd-9c0b-dd71b80dfc0b@collabora.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 30 Apr 2025 11:24:50 +0100
Message-ID: <87ikmm2bgt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 15HbRAowrKaT

Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:

> On 4/30/25 00:19, Alex Benn=C3=A9e wrote:
>>> This change makes QEMU to crash.
>> What is your command line to cause the crash?
>
> I applied this patch on top of native context v11, ran AMD nctx and
> got a crash on SDDM startup.

Did you also include the pre-cursor patch which splits MemoryRegion out
of the container struct. The aim here is to allow MemoryRegion counting
to be handled without worrying about other structure lifetimes.

>
> (gdb) bt
> #0  0x00007ffff5411b54 in __pthread_kill_implementation () at /lib64/libc=
.so.6
> #1  0x00007ffff53b8f9e in raise () at /lib64/libc.so.6
> #2  0x00007ffff53a0942 in abort () at /lib64/libc.so.6
> #3  0x00007ffff6cbf18c in g_assertion_message[cold] () at /lib64/libglib-=
2.0.so.0
> #4  0x00007ffff6d2ea07 in g_assertion_message_expr () at /lib64/libglib-2=
.0.so.0
> #5  0x0000555555a42820 in object_finalize (data=3D0x555557c9d290) at ../q=
om/object.c:732
> #6  object_unref (objptr=3D0x555557c9d290) at ../qom/object.c:1231
> #7  0x00005555559f3df3 in memory_region_unref (mr=3D<optimized out>) at .=
./system/memory.c:1854
> #8  0x0000555555a003a7 in phys_section_destroy (mr=3D0x555559ef5b60) at .=
./system/physmem.c:1035
> #9  phys_sections_free (map=3D0x555559c2dd80) at ../system/physmem.c:1048
> #10 address_space_dispatch_free (d=3D0x555559c2dd70) at ../system/physmem=
.c:2692
> #11 0x00005555559f1d33 in flatview_destroy (view=3D0x55555a54a720) at ../=
system/memory.c:295
> #12 0x0000555555c278cf in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) a=
t ../util/rcu.c:301
> #13 0x0000555555c1cc68 in qemu_thread_start (args=3D0x555557993d30) at ..=
/util/qemu-thread-posix.c:541
> #14 0x00007ffff540fba8 in start_thread () at /lib64/libc.so.6
> #15 0x00007ffff5493b8c in __clone3 () at /lib64/libc.so.6

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
