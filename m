Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l4-20020adffe84000000b003375cf3b17dsm1130163wrr.42.2024.01.11.04.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 04:37:29 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 93E4C5F7AD;
	Thu, 11 Jan 2024 12:37:28 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Song Gao <gaosong@loongson.cn>,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  David
 Hildenbrand
 <david@redhat.com>,  Aurelien Jarno <aurelien@aurel32.net>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Yanan Wang <wangyanan55@huawei.com>,
  Bin Meng <bin.meng@windriver.com>,  Laurent Vivier <lvivier@redhat.com>,
  Michael Rolnik <mrolnik@gmail.com>,  Alexandre Iooss <erdnaxe@crans.org>,
  David Woodhouse <dwmw2@infradead.org>,  Laurent Vivier
 <laurent@vivier.eu>,  Paolo Bonzini <pbonzini@redhat.com>,  Brian Cain
 <bcain@quicinc.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
  Beraldo Leal <bleal@redhat.com>,  Paul Durrant <paul@xen.org>,  Mahmoud
 Mandour <ma.mandourr@gmail.com>,  Thomas Huth <thuth@redhat.com>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  Cleber Rosa <crosa@redhat.com>,
  kvm@vger.kernel.org,  Peter Maydell <peter.maydell@linaro.org>,  Wainer
 dos Santos Moschetta <wainersm@redhat.com>,  qemu-arm@nongnu.org,  Weiwei
 Li <liwei1518@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  John Snow <jsnow@redhat.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Nicholas Piggin <npiggin@gmail.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  qemu-riscv@nongnu.org,
  Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 00/43] testing and plugin updates for 9.0 (pre-PR)
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
	message of "Wed, 3 Jan 2024 17:33:06 +0000")
References: <20240103173349.398526-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Thu, 11 Jan 2024 12:37:28 +0000
Message-ID: <87cyu8f3lj.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NgVxsq/K9Xw5

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This brings in the first batch of testing updates for the next
> release. The main bulk of these is Daniel and Thomas' cleanups of the
> qtest timeouts and allowing meson control them. There are a few minor
> tweaks I've made to some avocado and gitlab tests.
>
> The big update is support for reading register values in TCG plugins.
> After feedback from Akihiko I've left all the smarts to the plugin and
> made the interface a simple "all the registers" dump. There is a
> follow on patch to make the register code a little more efficient by
> checking disassembly. However we can leave the door open for future
> API enhancements if the translator ever learns to reliably know when
> registers might be touched.
>
> v2
> --
>
>  - Review feedback for register API
>  - readthedocs update
>  - add expectation docs for plugins
>
> The following still need review:
>
>   docs/devel: document some plugin assumptions
>   docs/devel: lift example and plugin API sections up
>   contrib/plugins: optimise the register value tracking
>   contrib/plugins: extend execlog to track register changes
>   contrib/plugins: fix imatch
>   plugins: add an API to read registers
>   gdbstub: expose api to find registers
>   readthodocs: fully specify a build environment
>   gitlab: include microblazeel in testing
>   tests/avocado: use snapshot=3Don in kvm_xen_guest

Ping for final review? I'd at least like to get the testing stuff
cleared out of my tree.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
