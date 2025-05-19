Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd5107f8sm139049185e9.16.2025.05.19.07.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:54:01 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 05BD25F87C;
	Mon, 19 May 2025 15:54:01 +0100 (BST)
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
Subject: Re: [PATCH v2 05/14] contrib/plugins: add a scaling factor to the
 ips arg
In-Reply-To: <cabfe49b-38af-4ecc-a338-1fe175dd7226@daynix.com> (Akihiko
	Odaki's message of "Sat, 10 May 2025 13:42:38 +0900")
References: <20250506125715.232872-1-alex.bennee@linaro.org>
	<20250506125715.232872-6-alex.bennee@linaro.org>
	<cabfe49b-38af-4ecc-a338-1fe175dd7226@daynix.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Mon, 19 May 2025 15:54:00 +0100
Message-ID: <8734d0slbr.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: I0/pC8WAhwe3

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2025/05/06 21:57, Alex Benn=C3=A9e wrote:
>> It's easy to get lost in zeros while setting the numbers of
>> instructions per second. Add a scaling suffix to make things simpler.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>> v2
>>    - normalise the suffix before a full strcmp0
>>    - check endptr actually set
>>    - fix checkpatch
>> ---
>>   contrib/plugins/ips.c | 36 +++++++++++++++++++++++++++++++++++-
>>   1 file changed, 35 insertions(+), 1 deletion(-)
>> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
>> index e5297dbb01..9b166a7d6c 100644
>> --- a/contrib/plugins/ips.c
>> +++ b/contrib/plugins/ips.c
>> @@ -20,6 +20,8 @@
>>     QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D
>> QEMU_PLUGIN_VERSION;
>>   +#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
>> +
>
> G_N_ELEMENTS() is already available.
>
>>   /* how many times do we update time per sec */
>>   #define NUM_TIME_UPDATE_PER_SEC 10
>>   #define NSEC_IN_ONE_SEC (1000 * 1000 * 1000)
>> @@ -129,6 +131,18 @@ static void plugin_exit(qemu_plugin_id_t id, void *=
udata)
>>       qemu_plugin_scoreboard_free(vcpus);
>>   }
>>   +typedef struct {
>> +    const char *suffix;
>> +    unsigned long multipler;
>
> I prefer to have an explicitly-sized type: uint32_t in this case. It
> also saves typing several characters as a bonus.

4Ghz would be a reasonable size and that would overflow a simple
uint32_t unless we start casting.

>
>> +} scale_entry;
>
> docs/devel/style.rst says
>> Structured type names are in CamelCase; harder to type but standing
>> out.
>
>> +
>> +/* a bit like units.h but not binary */
>> +static scale_entry scales[] =3D {
>> +    { "khz", 1000 },
>> +    { "mhz", 1000 * 1000 },
>> +    { "ghz", 1000 * 1000 * 1000 },
>
> Having "hz" as suffixes look a bit awkard. "1 giga instructions per
> second" sounds natural, but "1 gigahertz instructions per second"
> doesn't to me. Practically, it would be easier to just type "g"
> instead of "ghz".
>
> util/cutils.c has similar code though I guess a plugin cannot be
> linked to it.
>
>> +};
>> +
>>   QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>>                                              const qemu_info_t *info, in=
t argc,
>>                                              char **argv)
>> @@ -137,12 +151,32 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_pl=
ugin_id_t id,
>>           char *opt =3D argv[i];
>>           g_auto(GStrv) tokens =3D g_strsplit(opt, "=3D", 2);
>>           if (g_strcmp0(tokens[0], "ips") =3D=3D 0) {
>> -            max_insn_per_second =3D g_ascii_strtoull(tokens[1], NULL, 1=
0);
>> +            char *endptr =3D NULL;
>> +            max_insn_per_second =3D g_ascii_strtoull(tokens[1], &endptr=
, 10);
>>               if (!max_insn_per_second && errno) {
>>                   fprintf(stderr, "%s: couldn't parse %s (%s)\n",
>>                           __func__, tokens[1], g_strerror(errno));
>>                   return -1;
>>               }
>> +
>> +            if (endptr && *endptr !=3D 0) {
>> +                g_autofree gchar *lower =3D g_utf8_strdown(endptr, -1);
>> +                unsigned long scale =3D 0;
>> +
>> +                for (int j =3D 0; j < ARRAY_SIZE(scales); j++) {
>> +                    if (g_strcmp0(lower, scales[j].suffix) =3D=3D 0) {
>> +                        scale =3D scales[j].multipler;
>> +                        break;
>> +                    }
>> +                }
>> +
>> +                if (scale) {
>> +                    max_insn_per_second *=3D scale;
>> +                } else {
>> +                    fprintf(stderr, "bad suffix: %s\n", endptr);
>> +                    return -1;
>> +                }
>> +            }
>>           } else {
>>               fprintf(stderr, "option parsing failed: %s\n", opt);
>>               return -1;

I've fixed the other cases.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
