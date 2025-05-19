Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e84acsm220509455e9.25.2025.05.19.08.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 08:14:03 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 15E0E5F7EE;
	Mon, 19 May 2025 16:14:02 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  David Hildenbrand <david@redhat.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>,  Laurent Vivier <lvivier@redhat.com>,
  qemu-arm@nongnu.org,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Markus
 Armbruster <armbru@redhat.com>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
  Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Peter Xu <peterx@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  John Snow
 <jsnow@redhat.com>,  "Michael
 S. Tsirkin" <mst@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Fabiano
 Rosas <farosas@suse.de>,  Peter Maydell <peter.maydell@linaro.org>,
  Alexandre Iooss <erdnaxe@crans.org>
Subject: Re: [PATCH v2 06/14] contrib/plugins: allow setting of instructions
 per quantum
In-Reply-To: <f0890b48-9b80-4ae7-892a-c45fd3dee089@daynix.com> (Akihiko
	Odaki's message of "Sat, 10 May 2025 13:45:28 +0900")
References: <20250506125715.232872-1-alex.bennee@linaro.org>
	<20250506125715.232872-7-alex.bennee@linaro.org>
	<f0890b48-9b80-4ae7-892a-c45fd3dee089@daynix.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Mon, 19 May 2025 16:14:02 +0100
Message-ID: <87wmacr5tx.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: pa/BKoasxFfJ

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2025/05/06 21:57, Alex Benn=C3=A9e wrote:
>> The default is we update time every 1/10th of a second or so. However
>> for some cases we might want to update time more frequently. Allow
>> this to be set via the command line through the ipq argument.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>> v2
>>    - checkpatch fixes.
>> ---
>>   docs/about/emulation.rst |  4 ++++
>>   contrib/plugins/ips.c    | 10 +++++++++-
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
>> index a72591ee4d..456d01d5b0 100644
>> --- a/docs/about/emulation.rst
>> +++ b/docs/about/emulation.rst
>> @@ -811,6 +811,10 @@ This plugin can limit the number of Instructions Pe=
r Second that are executed::
>>     * - ips=3DN
>>       - Maximum number of instructions per cpu that can be executed in o=
ne second.
>>         The plugin will sleep when the given number of instructions is r=
eached.
>> +  * - ipq=3DN
>> +    - Instructions per quantum. How many instructions before we re-calc=
ulate time.
>> +      The lower the number the more accurate time will be, but the less=
 efficient the plugin.
>> +      Defaults to ips/10
>>     Other emulation features
>>   ------------------------
>> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
>> index 9b166a7d6c..62ed8ddd08 100644
>> --- a/contrib/plugins/ips.c
>> +++ b/contrib/plugins/ips.c
>> @@ -147,6 +147,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plug=
in_id_t id,
>>                                              const qemu_info_t *info, in=
t argc,
>>                                              char **argv)
>>   {
>> +    bool ipq_set =3D false;
>> +
>>       for (int i =3D 0; i < argc; i++) {
>>           char *opt =3D argv[i];
>>           g_auto(GStrv) tokens =3D g_strsplit(opt, "=3D", 2);
>> @@ -177,6 +179,9 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plug=
in_id_t id,
>>                       return -1;
>>                   }
>>               }
>> +        } else if (g_strcmp0(tokens[0], "ipq") =3D=3D 0) {
>> +            max_insn_per_quantum =3D g_ascii_strtoull(tokens[1], NULL, =
10);
>
> It may be nice to have an error check performed for ips.

We do catch most errors bellow on max_insn_per_quantum =3D 0, but I can
check up here as well.

>
>> +            ipq_set =3D true;
>>           } else {
>>               fprintf(stderr, "option parsing failed: %s\n", opt);
>>               return -1;
>> @@ -184,7 +189,10 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plu=
gin_id_t id,
>>       }
>>         vcpus =3D qemu_plugin_scoreboard_new(sizeof(vCPUTime));
>> -    max_insn_per_quantum =3D max_insn_per_second / NUM_TIME_UPDATE_PER_=
SEC;
>> +
>> +    if (!ipq_set) {
>> +        max_insn_per_quantum =3D max_insn_per_second / NUM_TIME_UPDATE_=
PER_SEC;
>> +    }
>>         if (max_insn_per_quantum =3D=3D 0) {
>>           fprintf(stderr, "minimum of %d instructions per second needed\=
n",

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
