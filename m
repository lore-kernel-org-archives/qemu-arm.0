Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60727b8bdf5sm750673a12.66.2025.06.05.01.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:51:01 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 869985F7E4;
	Thu, 05 Jun 2025 09:51:00 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Dmitry Osipenko <dmitry.osipenko@collabora.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  John
 Snow <jsnow@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Peter Xu
 <peterx@redhat.com>,  Fabiano Rosas <farosas@suse.de>,
  qemu-arm@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Alexandre Iooss
 <erdnaxe@crans.org>,  Gustavo Romero <gustavo.romero@linaro.org>,  Markus
 Armbruster <armbru@redhat.com>,  David Hildenbrand <david@redhat.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Laurent Vivier
 <lvivier@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Mahmoud Mandour <ma.mandourr@gmail.com>,  Julian Armistead
 <julian.armistead@linaro.org>,  Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [PATCH v4 03/17] tests/tcg: make aarch64 boot.S handle
 different starting modes
In-Reply-To: <e037e38c-dd8d-4f65-b2d5-2629be5f6740@daynix.com> (Akihiko
	Odaki's message of "Thu, 5 Jun 2025 17:29:16 +0900")
References: <20250603110204.838117-1-alex.bennee@linaro.org>
	<20250603110204.838117-4-alex.bennee@linaro.org>
	<e037e38c-dd8d-4f65-b2d5-2629be5f6740@daynix.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Thu, 05 Jun 2025 09:51:00 +0100
Message-ID: <874iwu372j.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5PUuG7IDOyGn

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2025/06/03 20:01, Alex Benn=C3=A9e wrote:
>> Currently the boot.S code assumes everything starts at EL1. This will
>> break things like the memory test which will barf on unaligned memory
>> access when run at a higher level.
>> Adapt the boot code to do some basic verification of the starting
>> mode
>> and the minimal configuration to move to the lower exception levels.
>> With this we can run the memory test with:
>>    -M virt,secure=3Don
>>    -M virt,secure=3Don,virtualization=3Don
>>    -M virt,virtualisation=3Don
>> If a test needs to be at a particular EL it can use the semihosting
>> command line to indicate the level we should execute in.
>> Cc: Julian Armistead <julian.armistead@linaro.org>
>> Cc: Jim MacArthur <jim.macarthur@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> v4
>>    - drop post eret nops
>>    - proper error string for EL0 error case
>>    - clamp any invalid target EL value to 1
>> v3
>>    - create system stack so we _exit cleanly
>>    - normalise EL string before compares
>>    - catch when we start in a lower EL than we asked for
>>    - default to EL1 when arg unclear
>> v2
>>    - allow tests to control the final EL we end up at
>>    - use tabs consistently
>>    - validate command line arg is between 1 and 3
>> ---
>>   tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
>>   tests/tcg/aarch64/system/boot.S           | 172 +++++++++++++++++++++-
>>   2 files changed, 169 insertions(+), 6 deletions(-)
>> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target
>> b/tests/tcg/aarch64/Makefile.softmmu-target
>> index 9c52475b7a..f7a7d2b800 100644
>> --- a/tests/tcg/aarch64/Makefile.softmmu-target
>> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
>> @@ -68,7 +68,8 @@ run-plugin-semiconsole-with-%: semiconsole
>>     # vtimer test needs EL2
>>   QEMU_EL2_MACHINE=3D-machine virt,virtualization=3Don,gic-version=3D2 -=
cpu cortex-a57 -smp 4
>> -run-vtimer: QEMU_OPTS=3D$(QEMU_EL2_MACHINE) $(QEMU_BASE_ARGS) -kernel
>> +QEMU_EL2_BASE_ARGS=3D-semihosting-config enable=3Don,target=3Dnative,ch=
ardev=3Doutput,arg=3D"2"
>> +run-vtimer: QEMU_OPTS=3D$(QEMU_EL2_MACHINE) $(QEMU_EL2_BASE_ARGS) -kern=
el
>>     # Simple Record/Replay Test
>>   .PHONY: memory-record
>> diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/=
boot.S
>> index a5df9c173d..8bfa4e4efc 100644
>> --- a/tests/tcg/aarch64/system/boot.S
>> +++ b/tests/tcg/aarch64/system/boot.S
>> @@ -16,6 +16,7 @@
>>   #define semihosting_call hlt 0xf000
>>   #define SYS_WRITEC	0x03	/* character to debug channel */
>>   #define SYS_WRITE0	0x04	/* string to debug channel */
>> +#define SYS_GET_CMDLINE 0x15	/* get command line */
>>   #define SYS_EXIT	0x18
>>     	.align	12
>> @@ -70,21 +71,172 @@ lower_a32_sync:
>>   lower_a32_irq:
>>   lower_a32_fiq:
>>   lower_a32_serror:
>> +	adr	x1, .unexp_excp
>> +exit_msg:
>>   	mov	x0, SYS_WRITE0
>> -	adr	x1, .error
>>   	semihosting_call
>>   	mov	x0, 1 /* EXIT_FAILURE */
>>   	bl 	_exit
>>   	/* never returns */
>>     	.section .rodata
>> -.error:
>> -	.string "Terminated by exception.\n"
>> +.unexp_excp:
>> +	.string "Unexpected exception.\n"
>> +.high_el_msg:
>> +	.string "Started in lower EL than requested.\n"
>> +.unexp_el0:
>> +	.string "Started in invalid EL.\n"
>> +
>> +	.align 8
>> +.get_cmd:
>
> Please do not send a new version without addressing all comments for
> the previous versions or at least noting there are unaddressed
> comments:
> https://lore.kernel.org/qemu-devel/7a76e746-9022-48cf-8216-775071e6d631@d=
aynix.com
>
> Following the best practices in docs/devel/submitting-a-patch.rst will
> ensure a smoother patch review. It is fine for me if you submit a new
> version noting unaddressed comments, but some may disagree.

There is no style guide for assembler. I have made the strings
consistently use the . prefix.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
