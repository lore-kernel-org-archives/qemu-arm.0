Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d638fsm448745966b.18.2024.10.23.01.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:57:26 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 665CA5F89C;
	Wed, 23 Oct 2024 09:57:25 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  Beraldo Leal <bleal@redhat.com>,  Laurent Vivier
 <laurent@vivier.eu>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
  Mahmoud Mandour <ma.mandourr@gmail.com>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Yanan Wang <wangyanan55@huawei.com>,  Thomas
 Huth <thuth@redhat.com>,  John Snow <jsnow@redhat.com>,  =?utf-8?Q?Marc-A?=
 =?utf-8?Q?ndr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  qemu-arm@nongnu.org,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,
  devel@lists.libvirt.org,  Cleber Rosa <crosa@redhat.com>,
  kvm@vger.kernel.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Alexandre Iooss <erdnaxe@crans.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Riku Voipio <riku.voipio@iki.fi>,  Zhao
 Liu <zhao1.liu@intel.com>,  Marcelo Tosatti <mtosatti@redhat.com>,  "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 18/20] meson: build contrib/plugins with meson
In-Reply-To: <fe33c996-3241-4706-9ac1-85f00cb8f388@linaro.org> (Pierrick
	Bouvier's message of "Wed, 23 Oct 2024 00:51:32 -0700")
References: <20241022105614.839199-1-alex.bennee@linaro.org>
	<20241022105614.839199-19-alex.bennee@linaro.org>
	<fe33c996-3241-4706-9ac1-85f00cb8f388@linaro.org>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Wed, 23 Oct 2024 09:57:25 +0100
Message-ID: <87sesnkxhm.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fzqqAS1ZpfZD

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 10/22/24 03:56, Alex Benn=C3=A9e wrote:
>> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> Tried to unify this meson.build with tests/tcg/plugins/meson.build
>> but
>> the resulting modules are not output in the right directory.
>> Originally proposed by Anton Kochkov, thank you!
>> Solves: https://gitlab.com/qemu-project/qemu/-/issues/1710
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> Message-Id: <20240925204845.390689-2-pierrick.bouvier@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   meson.build                 |  4 ++++
>>   contrib/plugins/meson.build | 23 +++++++++++++++++++++++
>>   2 files changed, 27 insertions(+)
>>   create mode 100644 contrib/plugins/meson.build
>> diff --git a/meson.build b/meson.build
>> index bdd67a2d6d..3ea03c451b 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -3678,6 +3678,10 @@ subdir('accel')
>>   subdir('plugins')
>>   subdir('ebpf')
>>   +if 'CONFIG_TCG' in config_all_accel
>> +  subdir('contrib/plugins')
>> +endif
>> +
>>   common_user_inc =3D []
>>     subdir('common-user')
>> diff --git a/contrib/plugins/meson.build b/contrib/plugins/meson.build
>> new file mode 100644
>> index 0000000000..a0e026d25e
>> --- /dev/null
>> +++ b/contrib/plugins/meson.build
>> @@ -0,0 +1,23 @@
>> +t =3D []
>> +if get_option('plugins')
>> +  foreach i : ['cache', 'drcov', 'execlog', 'hotblocks', 'hotpages', 'h=
owvec',
>> +               'hwprofile', 'ips', 'lockstep', 'stoptrigger']
>
> lockstep does not build under Windows (it uses sockets), so it should
> be conditionnally not built on this platform.
> @Alex, if you feel like modifying this, you can. If not, you can drop
> the meson build patches from this series to not block it.

I'll drop from the PR and let you re-submit.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
