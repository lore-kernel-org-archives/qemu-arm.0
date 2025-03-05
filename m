Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf75c6d4f3sm499091766b.184.2025.03.04.22.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:57:23 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9F1E65F932;
	Wed,  5 Mar 2025 06:57:21 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Li-Wen
 Hsu <lwhsu@freebsd.org>,  Peter Maydell <peter.maydell@linaro.org>,
  Laurent Vivier <laurent@vivier.eu>,  qemu-arm@nongnu.org,  Alexandre
 Iooss <erdnaxe@crans.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Riku Voipio
 <riku.voipio@iki.fi>,  Warner Losh <imp@bsdimp.com>,  Brian Cain
 <brian.cain@oss.qualcomm.com>,  Mahmoud Mandour <ma.mandourr@gmail.com>,
  Kyle Evans <kevans@freebsd.org>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Ed Maste <emaste@freebsd.org>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 21/32] plugins/loader: populate target_name with
 target_name()
In-Reply-To: <44f7f6d6-2c13-49a0-8775-40a9a12ba86b@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 5 Mar 2025 01:01:50
 +0100")
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
	<20250304222439.2035603-22-alex.bennee@linaro.org>
	<44f7f6d6-2c13-49a0-8775-40a9a12ba86b@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 05 Mar 2025 06:57:21 +0000
Message-ID: <87pliw3qy6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NLwITvguAJgN

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 4/3/25 23:24, Alex Benn=C3=A9e wrote:
>> We have a function we can call for this, lets not rely on macros that
>> stop us building once.
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20250226140343.3907080-17-alex.bennee@linaro.org>
>> ---
>>   plugins/loader.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/plugins/loader.c b/plugins/loader.c
>> index 99686b5466..827473c8b6 100644
>> --- a/plugins/loader.c
>> +++ b/plugins/loader.c
>> @@ -297,7 +297,7 @@ int qemu_plugin_load_list(QemuPluginList *head, Erro=
r **errp)
>>       struct qemu_plugin_desc *desc, *next;
>>       g_autofree qemu_info_t *info =3D g_new0(qemu_info_t, 1);
>>   -    info->target_name =3D TARGET_NAME;
>> +    info->target_name =3D target_name();
>
> Unfortunately the declaration is in "hw/core/cpu.h".

I thought that was common. It didn't break anything.

>
>>       info->version.min =3D QEMU_PLUGIN_MIN_VERSION;
>>       info->version.cur =3D QEMU_PLUGIN_VERSION;
>>   #ifndef CONFIG_USER_ONLY

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
