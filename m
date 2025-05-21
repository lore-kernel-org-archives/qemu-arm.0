Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6436sm598125566b.182.2025.05.20.23.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:22:50 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 62DD65F9CB;
	Wed, 21 May 2025 07:22:49 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,  qemu-devel@nongnu.org,  Peter Xu
 <peterx@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Weiwei Li
 <liwei1518@gmail.com>,  qemu-arm@nongnu.org,  Nicholas Piggin
 <npiggin@gmail.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Bin Meng
 <bmeng.cn@gmail.com>,  Tyrone Ting <kfting@nuvoton.com>,  Hao Wu
 <wuhaotsh@google.com>,  Kyle Evans <kevans@freebsd.org>,  Alistair Francis
 <alistair.francis@wdc.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Laurent Vivier <laurent@vivier.eu>,  Riku Voipio <riku.voipio@iki.fi>,
  Harsh Prateek Bora <harshpb@linux.ibm.com>,  Fabiano Rosas
 <farosas@suse.de>,  Alexandre Iooss <erdnaxe@crans.org>,  Laurent Vivier
 <lvivier@redhat.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
  Warner Losh <imp@bsdimp.com>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Mahmoud Mandour <ma.mandourr@gmail.com>,  qemu-ppc@nongnu.org,  Paolo
 Bonzini <pbonzini@redhat.com>,  qemu-rust@nongnu.org,
  qemu-riscv@nongnu.org
Subject: Re: [PATCH v2 11/17] gdbstub: Try unlinking the unix socket before
 binding
In-Reply-To: <56e0a35b5c53b416db130c414cd0f3d6@linux.ibm.com> (Ilya
	Leoshkevich's message of "Tue, 20 May 2025 23:21:37 +0100")
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
	<20250207153112.3939799-12-alex.bennee@linaro.org>
	<ee091002-a552-49fe-ae5e-8916937dba15@tls.msk.ru>
	<56e0a35b5c53b416db130c414cd0f3d6@linux.ibm.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Wed, 21 May 2025 07:22:49 +0100
Message-ID: <877c2aa3eu.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 81PdD55RfpdC

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> On 2025-05-20 15:50, Michael Tokarev wrote:
>> 07.02.2025 18:31, Alex Benn=C3=A9e wrote:
>>> From: Ilya Leoshkevich <iii@linux.ibm.com>
>>> In case an emulated process execve()s another emulated process,
>>> bind()
>>> will fail, because the socket already exists. So try deleting it. Use
>>> the existing unix_listen() function which does this. Link qemu-user
>>> with qemu-sockets.c and add the monitor_get_fd() stub.
>>> Note that it is not possible to handle this in do_execv(): deleting
>>> gdbserver_user_state.socket_path before safe_execve() is not correct,
>>> because the latter may fail, and afterwards we may lose control.
>> Please note: this is linux-user stuff, which is usually linked
>> statically.
>> By linking it with qemu-sockets, we basically broke static linking,
>> because
>> qemu-sockets uses getaddrinfo() &Co.  The previous code, I think,
>> was there
>> for a reason, - to avoid this linkage.
>> How do you think about reverting this one and addressing the
>> original
>> problem without using qemu-sockets?
>> Alternatively, it might be possible to split qemu-sockets.c into
>> unix-related
>> stuff and generic stuff.
>> Thanks,
>> /mjt
>
> I can split it.
>
> However, wasn't it already broken in this regard?
> With fccb744f41c69fec6fd92225fe907c6e69de5d44^ I get:
>
> [2/2] Linking target qemu-s390x
> /usr/bin/ld: /usr/lib64/libglib-2.0.a(gutils.c.o): in function
> `g_get_user_database_entry':
> (.text+0xeb): warning: Using 'getpwnam_r' in statically linked
> applications requires at runtime the shared libraries from the glibc
> version used for linking
> /usr/bin/ld: (.text+0x2be): warning: Using 'getpwuid' in statically
> linked applications requires at runtime the shared libraries from the
> glibc version used for linking
> /usr/bin/ld: (.text+0x134): warning: Using 'getpwuid_r' in statically
> linked applications requires at runtime the shared libraries from the
> glibc version used for linking
>
> This comes from glib, but the ultimate result is still the same.
>
> Also, what are the symptoms of the breakage? IIUC as long as execution
> does not reach getaddrinfo(), which it in this case should not, because
> it is used only on inet paths, there should not be any issues, right?
>
> In any case, the new warning is annoying and I better fix it for this
> reason alone.

I sent:

  Message-Id: <20250520165706.3976971-1-alex.bennee@linaro.org>
  Date: Tue, 20 May 2025 17:57:06 +0100
  Subject: [RFC PATCH] util: split unix socket functions out of qemu-sockets
  From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>

Although I'm still seeing some warnings on my build:

  # QEMU configure log Tue 20 May 18:14:18 BST 2025
  # Configured with: '../../configure' '--disable-docs' '--disable-tools' '=
--disable-system' '--disable-vhost-kernel' '--disable-vhost-user' '--disabl=
e-vhost-net' '--static'

Gives:

  [142/142] Linking target qemu-xtensaeb
  /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libglib-2.0.a(gutils.c.o): in func=
tion `g_get_user_database_entry':
  (.text+0x287): warning: Using 'getpwuid' in statically linked application=
s requires at runtime the shared libraries from the glibc version used for =
linking
  /usr/bin/ld: (.text+0xe0): warning: Using 'getpwnam_r' in statically link=
ed applications requires at runtime the shared libraries from the glibc ver=
sion used for linking
  /usr/bin/ld: (.text+0x11e): warning: Using 'getpwuid_r' in statically lin=
ked applications requires at runtime the shared libraries from the glibc ve=
rsion used for linking

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
