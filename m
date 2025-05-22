Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8caaasm22312941f8f.83.2025.05.22.03.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 03:31:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C09BA5F944;
	Thu, 22 May 2025 11:31:53 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  John Snow <jsnow@redhat.com>,  Fabiano Rosas <farosas@suse.de>,  Peter Xu
 <peterx@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  Alexandre Iooss <erdnaxe@crans.org>,  Markus Armbruster
 <armbru@redhat.com>,  David Hildenbrand <david@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>,  Gustavo Romero
 <gustavo.romero@linaro.org>,  "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 05/20] tests/Makefile: include test-plugins in
 per-arch build deps
In-Reply-To: <15677d5c-cd86-4d75-a21e-0c011800cd55@daynix.com> (Akihiko
	Odaki's message of "Thu, 22 May 2025 14:37:44 +0900")
References: <20250521164250.135776-1-alex.bennee@linaro.org>
	<20250521164250.135776-6-alex.bennee@linaro.org>
	<15677d5c-cd86-4d75-a21e-0c011800cd55@daynix.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Thu, 22 May 2025 11:31:53 +0100
Message-ID: <87tt5d6ina.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QlzqhyYi/D6t

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2025/05/22 1:42, Alex Benn=C3=A9e wrote:
>> The user can run a subset of the tcg tests directly, e.g.:
>>    make run-tcg-tests-hexagon-linux-user
>> but in this case we fail if there has not been a full build to
>> ensure
>> all the test-plugins are there. Fix the dependency to ensure we always
>> will build them before running tests.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/Makefile.include | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 23fb722d42..7f7f62cbf6 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -46,7 +46,7 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
>>           $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-hos=
t.mak))
>>     .PHONY: $(TCG_TESTS_TARGETS:%=3Dbuild-tcg-tests-%)
>> -$(TCG_TESTS_TARGETS:%=3Dbuild-tcg-tests-%): build-tcg-tests-%: $(BUILD_=
DIR)/tests/tcg/config-%.mak
>> +$(TCG_TESTS_TARGETS:%=3Dbuild-tcg-tests-%): build-tcg-tests-%: $(BUILD_=
DIR)/tests/tcg/config-%.mak test-plugins
>
> I don't think this is going to work.
>
> test-plugins will invoke run-ninja, which is defined as follows:
>
> run-ninja: config-host.mak
> ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
> 	+$(if $(MAKE.nq),@:,$(quiet-@)$(NINJA) $(NINJAFLAGS) \
> 	   $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)
>
> $(ninja-cmd-goals) should contain test-plugins, but it doesn't if I
> understand it correctly.

It certainly does:

=E2=9E=9C  rm -rf tests/tcg/plugins/
=F0=9F=95=9911:31:03 alex@draig:qemu.git/builds/all  on =EE=82=A0 HEAD (61e=
51c3) (REBASING 5/26) [$?]=20
=E2=9E=9C  make test-plugins
/home/alex/lsrc/qemu.git/builds/all/pyvenv/bin/meson introspect --targets -=
-tests --benchmarks | /home/alex/lsrc/qemu.git/builds/all/pyvenv/bin/python=
3 -B scripts/mtest2make.py > Makefile.mtest
[1/14] Compiling C object tests/tcg/plugins/libbb.so.p/bb.c.o
[2/14] Linking target tests/tcg/plugins/libbb.so
[3/14] Compiling C object tests/tcg/plugins/libempty.so.p/empty.c.o
[4/14] Linking target tests/tcg/plugins/libempty.so
[5/14] Compiling C object tests/tcg/plugins/libinline.so.p/inline.c.o
[6/14] Linking target tests/tcg/plugins/libinline.so
[7/14] Compiling C object tests/tcg/plugins/libinsn.so.p/insn.c.o
[8/14] Linking target tests/tcg/plugins/libinsn.so
[9/14] Compiling C object tests/tcg/plugins/libmem.so.p/mem.c.o
[10/14] Linking target tests/tcg/plugins/libmem.so
[11/14] Compiling C object tests/tcg/plugins/libreset.so.p/reset.c.o
[12/14] Linking target tests/tcg/plugins/libreset.so
[13/14] Compiling C object tests/tcg/plugins/libsyscall.so.p/syscall.c.o
[14/14] Linking target tests/tcg/plugins/libsyscall.so

>
>>   	$(call quiet-command, \
>>               $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS), \
>>           "BUILD","$* guest-tests")

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
