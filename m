Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3814262sm98656845e9.25.2025.05.22.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 03:05:52 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DE8B75F8AD;
	Thu, 22 May 2025 11:05:51 +0100 (BST)
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
 <gustavo.romero@linaro.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>,  Patryk
 'patryk4815' Sondej <patryk.sondej@gmail.com>
Subject: Re: [PATCH v3 19/20] gdbstub: Implement qGDBServerVersion packet
In-Reply-To: <0e6cb7af-37eb-4e8d-b342-ecfcdb639f10@daynix.com> (Akihiko
	Odaki's message of "Thu, 22 May 2025 15:29:06 +0900")
References: <20250521164250.135776-1-alex.bennee@linaro.org>
	<20250521164250.135776-20-alex.bennee@linaro.org>
	<0e6cb7af-37eb-4e8d-b342-ecfcdb639f10@daynix.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Thu, 22 May 2025 11:05:51 +0100
Message-ID: <87zff56juo.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rXpTI+fkpOwt

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2025/05/22 1:42, Alex Benn=C3=A9e wrote:
>> From: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
>> This commit adds support for the `qGDBServerVersion` packet to the
>> qemu
>> gdbstub  which could be used by clients to detect the QEMU version
>> (and, e.g., use a workaround for known bugs).
>> This packet is not documented/standarized by GDB but it was
>> implemented
>> by LLDB gdbstub [0] and is helpful for projects like Pwndbg [1].
>> This has been implemented by Patryk, who I included in
>> Co-authored-by
>> and who asked me to send the patch.
>> [0]
>> https://lldb.llvm.org/resources/lldbgdbremote.html#qgdbserverversion
>> [1] https://github.com/pwndbg/pwndbg/issues/2648
>> Co-authored-by: Patryk 'patryk4815' Sondej <patryk.sondej@gmail.com>
>> Signed-off-by: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail=
.com>
>> Message-Id: <20250403191340.53343-1-dominik.b.czarnota@gmail.com>
>> [AJB: fix include, checkpatch linewrap]
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   gdbstub/gdbstub.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> index 6023c80d25..def0b7e877 100644
>> --- a/gdbstub/gdbstub.c
>> +++ b/gdbstub/gdbstub.c
>> @@ -28,6 +28,7 @@
>>   #include "qemu/cutils.h"
>>   #include "qemu/module.h"
>>   #include "qemu/error-report.h"
>> +#include "qemu/target-info.h"
>>   #include "trace.h"
>>   #include "exec/gdbstub.h"
>>   #include "gdbstub/commands.h"
>> @@ -1597,6 +1598,18 @@ static void handle_query_threads(GArray *params, =
void *user_ctx)
>>       gdbserver_state.query_cpu =3D gdb_next_attached_cpu(gdbserver_stat=
e.query_cpu);
>>   }
>>   +static void handle_query_gdb_server_version(GArray *params, void
>> *user_ctx)
>> +{
>> +#if defined(CONFIG_USER_ONLY)
>> +    g_string_printf(gdbserver_state.str_buf, "name:qemu-%s;version:%s;",
>> +                    target_name(), QEMU_VERSION);
>> +#else
>> +    g_string_printf(gdbserver_state.str_buf, "name:qemu-system-%s;versi=
on:%s;",
>> +                    target_name(), QEMU_VERSION);
>> +#endif
>
> I sugguest passing "qemu" as the name property.
>
> I guess LLDB developers chose to explicitly have the key-value pair
> syntax so that users can have one unified logic for parsing and avoid
> the mess of HTTP's User-Agent; there is a proposal for Web that
> introduces key-value pairs in a similar manner:
> https://developer.chrome.com/docs/privacy-security/user-agent-client-hints
>
> If we embed more information like to the name property, users will
> need to have an additional logic to know if it's QEMU or to know other
> information. Instead, we can emit:
> name:qemu;version:10.0.50;
>
> and we can use something like follows if we want to tell more:
> name:qemu;version:10.0.50;qemu-mode:system;qemu-target:hexagon;

I think we are getting into bike shedding territory here. GDB does need
a decent way to communicate about supported targets and when it comes up
with one we shall implement it. But I don't think we need to give too
much thought to this custom response for now.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
