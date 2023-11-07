Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c191300b004090ca6d785sm15361908wmq.2.2023.11.07.02.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:31:13 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5E5045F790;
	Tue,  7 Nov 2023 10:31:13 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,  Song Gao
 <gaosong@loongson.cn>,  qemu-arm@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Weiwei Li <liweiwei@iscas.ac.cn>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
  Yanan Wang <wangyanan55@huawei.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,
  Paolo Bonzini <pbonzini@redhat.com>,  David Hildenbrand
 <david@redhat.com>,  Brian Cain <bcain@quicinc.com>,  qemu-ppc@nongnu.org,
  Palmer Dabbelt <palmer@dabbelt.com>,  qemu-riscv@nongnu.org,  Eduardo
 Habkost <eduardo@habkost.net>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Alistair Francis <alistair.francis@wdc.com>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  Cleber Rosa <crosa@redhat.com>,
  qemu-s390x@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Nicholas Piggin <npiggin@gmail.com>,
  Thomas Huth <thuth@redhat.com>,  John Snow <jsnow@redhat.com>,  Alexandre
 Iooss <erdnaxe@crans.org>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Mahmoud Mandour <ma.mandourr@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Bin Meng <bin.meng@windriver.com>,  Beraldo
 Leal <bleal@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Michael Rolnik <mrolnik@gmail.com>,
  Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 17/29] gdbstub: Simplify XML lookup
In-Reply-To: <4659ec99-9b86-4c91-8ee8-116bff8b48c4@univ-grenoble-alpes.fr>
	(=?utf-8?Q?=22Fr=C3=A9d=C3=A9ric_P=C3=A9trot=22's?= message of "Tue, 7 Nov
 2023 09:46:21 +0100 (1
	hour, 43 minutes, 15 seconds ago)")
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
	<20231103195956.1998255-18-alex.bennee@linaro.org>
	<4659ec99-9b86-4c91-8ee8-116bff8b48c4@univ-grenoble-alpes.fr>
User-Agent: mu4e 1.11.24; emacs 29.1
Date: Tue, 07 Nov 2023 10:31:13 +0000
Message-ID: <8734xh7t3i.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 76HHMi5MOYXD

Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes.fr> wri=
tes:

> Hello Alex and Akihiko,
>
> this patch introduces a regression for riscv.
> When connecting to gdb, gdb issues the infamous "Architecture rejected
> target-supplied description" warning.

I tracked it down to 13/29 when bisecting which I dropped from:

  Message-Id: <20231106185112.2755262-1-alex.bennee@linaro.org>
  Date: Mon,  6 Nov 2023 18:50:50 +0000
  Subject: [PATCH 00/22] Maintainer updates for 8.2 (gdbstub, tests, plugin=
s) pre-PR
  From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>

So if you can check that series doesn't regress RiscV (it passes the
tests) then we can at least get some of the stuff merged during freeze.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
