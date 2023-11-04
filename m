Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f11-20020a5d664b000000b0032da75af3easm3902343wrw.80.2023.11.04.02.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 02:14:14 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 454BA5F796;
	Sat,  4 Nov 2023 09:14:14 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Song Gao <gaosong@loongson.cn>,
  qemu-arm@nongnu.org,  =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Weiwei Li <liweiwei@iscas.ac.cn>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
  Yanan Wang <wangyanan55@huawei.com>,
  =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  David Hildenbrand <david@redhat.com>,  Brian Cain
 <bcain@quicinc.com>,  qemu-ppc@nongnu.org,  Palmer Dabbelt
 <palmer@dabbelt.com>,  qemu-riscv@nongnu.org,  Eduardo Habkost
 <eduardo@habkost.net>,  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Alistair Francis <alistair.francis@wdc.com>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  Cleber Rosa <crosa@redhat.com>,
  qemu-s390x@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Nicholas Piggin <npiggin@gmail.com>,
  Thomas Huth <thuth@redhat.com>,  John Snow <jsnow@redhat.com>,  Alexandre
 Iooss <erdnaxe@crans.org>,  =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>,  Bin Meng
 <bin.meng@windriver.com>,  Beraldo Leal <bleal@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Michael Rolnik
 <mrolnik@gmail.com>,  Greg Manning <gmanning@rapitasystems.com>
Subject: Re: [PATCH 27/29] plugins: make test/example plugins work on windows
In-Reply-To: <20231103195956.1998255-28-alex.bennee@linaro.org> (UTF's message
	of "Fri, 3 Nov 2023 19:59:54 +0000 (13 hours, 12 minutes, 33 seconds
	ago)")
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
	<20231103195956.1998255-28-alex.bennee@linaro.org>
User-Agent: mu4e 1.11.24; emacs 29.1
Date: Sat, 04 Nov 2023 09:14:08 +0000
Message-ID: <877cmxc23j.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-TUID: roSP3mKKuR/f

=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org> writes:

> From: Greg Manning <gmanning@rapitasystems.com>
>
> Generate a qemu_plugin_api.lib delay import lib on windows, for
> windows qemu plugins to link against.
>
> Implement an example dll load fail hook to link up the API functions
> correctly when a plugin is loaded on windows.
>
> Update the build scripts for the test and example plugins to use these
> things.
>
> Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
> Acked-by: Alex Benn.©e <alex.bennee@linaro.org>
> Message-Id: <20231102172053.17692-3-gmanning@rapitasystems.com>
> Signed-off-by: Alex Benn.©e <alex.bennee@linaro.org>
> ---
>  configure                      |  3 +++
>  contrib/plugins/win32_linker.c | 34 ++++++++++++++++++++++++++++++++++
>  contrib/plugins/Makefile       | 20 ++++++++++++++++----
>  plugins/meson.build            | 17 +++++++++++++++++
>  tests/plugin/meson.build       | 14 +++++++++++---
>  5 files changed, 81 insertions(+), 7 deletions(-)
>  create mode 100644 contrib/plugins/win32_linker.c
>
>  
>  if get_option('plugins')
> +  if targetos == 'windows'
> +    # Generate a .lib file for plugins to link against.
> +    # First, create a .def file listing all the symbols a plugin should expect to have
> +    # available in qemu
> +    win32_plugin_def = configure_file(
> +      input: files('qemu-plugins.symbols'),
> +      output: 'qemu_plugin_api.def',
> +      capture: true,
> +      command: ['sed', '-e', '0,/^/s//EXPORTS/; s/[{};]//g', '@INPUT@'])
> +    # then use dlltool to assemble a delaylib.
> +    win32_qemu_plugin_api_lib = configure_file(
> +      input: win32_plugin_def,
> +      output: 'qemu_plugin_api.lib',
> +      command: ['dlltool', '--input-def', '@INPUT@',
> +                '--output-delaylib', '@OUTPUT@', '--dllname',
>  'qemu.exe']

We need to ensure we have dlltool available before enabling plugins for
windows otherwise we fail here. Also we need to update the windows
images to include it.

-- 
Alex Bennée
Virtualisation Tech Lead @ Linaro
