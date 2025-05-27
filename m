Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad892483c19sm51973666b.145.2025.05.27.02.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:16:40 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A26335F80B;
	Tue, 27 May 2025 10:16:39 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  Akihiko Odaki <akihiko.odaki@daynix.com>,  John Snow <jsnow@redhat.com>,
  Fabiano Rosas <farosas@suse.de>,  Peter Xu <peterx@redhat.com>,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
  Alexandre Iooss
 <erdnaxe@crans.org>,  Markus Armbruster <armbru@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>,  Gustavo Romero
 <gustavo.romero@linaro.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>,  Patryk
 'patryk4815' Sondej <patryk.sondej@gmail.com>
Subject: Re: [PATCH v3 19/20] gdbstub: Implement qGDBServerVersion packet
In-Reply-To: <b916fe83-180b-48d6-815f-da556b8e42fd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun, 25 May 2025 17:25:47
 +0200")
References: <20250521164250.135776-1-alex.bennee@linaro.org>
	<20250521164250.135776-20-alex.bennee@linaro.org>
	<b916fe83-180b-48d6-815f-da556b8e42fd@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Tue, 27 May 2025 10:16:39 +0100
Message-ID: <877c22o1l4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rnUGP06+pwCN

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 21/5/25 17:42, Alex Benn=C3=A9e wrote:
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
> g_string_printf() isn't really justified, we usually call
> g_string_append().

How is that meant to work with a format string?

>
>> +    gdb_put_strbuf();
>> +}

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
