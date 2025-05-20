Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ca731sm737835166b.166.2025.05.20.08.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:52:26 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A95CF5F7A5;
	Tue, 20 May 2025 16:52:25 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Weiwei Li <liwei1518@gmail.com>,
  qemu-arm@nongnu.org,  Nicholas Piggin <npiggin@gmail.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Bin Meng <bmeng.cn@gmail.com>,  Tyrone
 Ting <kfting@nuvoton.com>,  Hao Wu <wuhaotsh@google.com>,  Kyle Evans
 <kevans@freebsd.org>,  Alistair Francis <alistair.francis@wdc.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Laurent
 Vivier
 <laurent@vivier.eu>,  Riku Voipio <riku.voipio@iki.fi>,  Harsh Prateek
 Bora <harshpb@linux.ibm.com>,  Fabiano Rosas <farosas@suse.de>,  Alexandre
 Iooss <erdnaxe@crans.org>,  Laurent Vivier <lvivier@redhat.com>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  Warner Losh <imp@bsdimp.com>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Mahmoud Mandour <ma.mandourr@gmail.com>,
  qemu-ppc@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,
  qemu-rust@nongnu.org,  qemu-riscv@nongnu.org,  Ilya Leoshkevich
 <iii@linux.ibm.com>
Subject: Re: [PATCH v2 11/17] gdbstub: Try unlinking the unix socket before
 binding
In-Reply-To: <ee091002-a552-49fe-ae5e-8916937dba15@tls.msk.ru> (Michael
	Tokarev's message of "Tue, 20 May 2025 17:50:10 +0300")
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
	<20250207153112.3939799-12-alex.bennee@linaro.org>
	<ee091002-a552-49fe-ae5e-8916937dba15@tls.msk.ru>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Tue, 20 May 2025 16:52:25 +0100
Message-ID: <87cyc39t52.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4hXG+VfwLj0s

Michael Tokarev <mjt@tls.msk.ru> writes:

> 07.02.2025 18:31, Alex Benn=C3=A9e wrote:
>> From: Ilya Leoshkevich <iii@linux.ibm.com>
>> In case an emulated process execve()s another emulated process,
>> bind()
>> will fail, because the socket already exists. So try deleting it. Use
>> the existing unix_listen() function which does this. Link qemu-user
>> with qemu-sockets.c and add the monitor_get_fd() stub.
>> Note that it is not possible to handle this in do_execv(): deleting
>> gdbserver_user_state.socket_path before safe_execve() is not correct,
>> because the latter may fail, and afterwards we may lose control.
>
> Please note: this is linux-user stuff, which is usually linked statically.
> By linking it with qemu-sockets, we basically broke static linking, becau=
se
> qemu-sockets uses getaddrinfo() &Co.  The previous code, I think, was the=
re
> for a reason, - to avoid this linkage.

Oops, how come we didn't notice? We do have a bunch of --static targets
in the CI.

> How do you think about reverting this one and addressing the original
> problem without using qemu-sockets?
>
> Alternatively, it might be possible to split qemu-sockets.c into unix-rel=
ated
> stuff and generic stuff.

You mean move all the unix_XXX() functions into a new unit that ensures
we don't need getaddrinfo()?

>
> Thanks,
>
> /mjt

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
