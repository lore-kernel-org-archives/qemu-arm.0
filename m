Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844c0dsm4694225f8f.80.2025.02.28.02.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:39:41 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1D1A45F7DE;
	Fri, 28 Feb 2025 10:39:40 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Daniel P. =?utf-8?Q?Berr?=
 =?utf-8?Q?ang=C3=A9?=
 <berrange@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Kyle
 Evans <kevans@freebsd.org>,  Eduardo Habkost <eduardo@habkost.net>,
  Alexandre Iooss <erdnaxe@crans.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,
  Mahmoud Mandour <ma.mandourr@gmail.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Li-Wen Hsu <lwhsu@freebsd.org>,  Riku Voipio
 <riku.voipio@iki.fi>,  Warner Losh <imp@bsdimp.com>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Richard Henderson <richard.henderson@linaro.org>,
  Ed Maste <emaste@freebsd.org>,  Thomas Huth <thuth@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 25/25] MAINTAINERS: remove widely sanctioned entities
In-Reply-To: <a069dbfb-c0bf-417d-9925-e419c071eb4c@ventanamicro.com> (Daniel
	Henrique Barboza's message of "Thu, 27 Feb 2025 12:45:27 -0300")
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
	<20250226140343.3907080-26-alex.bennee@linaro.org>
	<a069dbfb-c0bf-417d-9925-e419c071eb4c@ventanamicro.com>
User-Agent: mu4e 1.12.9; emacs 29.4
Date: Fri, 28 Feb 2025 10:39:40 +0000
Message-ID: <874j0ewdxv.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: oDBT/SxlW6T/

Daniel Henrique Barboza <dbarboza@ventanamicro.com> writes:

> Hi,
>
> A bit offtopic: we just received patches from Syntacore [1]. Syntacore
> does not appear in the US sanction list website, but in a Google search
> I found out that Syntacore was acquired by Yadro in 2019, i.e. Yadro is
> its parent organization. And Yadro has been sanctioned.
>
> Does anybody know the rule in this case? If a parent company is sanctioned
> does that cascade to all its subsidiaries? I have no idea whether we can =
engage
> with these patches or not.

I don't think anyone here can offer any legal advice. We did reach out
to the SFC they never replied directly. They did however publish the
following blog post:

  https://sfconservancy.org/blog/2024/dec/12/linux-banned-russian-contribut=
ors-do-i-need-to/

but you should probably check with your own orgs lawyers about what you
should do. We have additional email domains blocked from our mail
servers to avoid accidental interaction but they don't interact with
MAINTAINERS which was the motivating factor for this patch (because of
processing PRs and automatic cc's from get_maintainers.pl).

>
>
> Thanks,
>
> Daniel
>
>
> [1] https://lore.kernel.org/qemu-riscv/20250227144200.69270-1-saveliy.mot=
ov@syntacore.com/
>
>
>
> On 2/26/25 11:03 AM, Alex Benn=C3=A9e wrote:
>> The following organisations appear on the US sanctions list:
>>    Yadro:
>> https://sanctionssearch.ofac.treas.gov/Details.aspx?id=3D41125
>>    ISPRAS: https://sanctionssearch.ofac.treas.gov/Details.aspx?id=3D50890
>> As a result maintainers interacting with such entities would face
>> legal risk in a number of jurisdictions. To reduce the risk of
>> inadvertent non-compliance remove entries from these organisations
>> from the MAINTAINERS file.
>> Mark the pcf8574 system as orphaned until someone volunteers to step
>> up as a maintainer. Add myself as a second reviewer to record/replay
>> so I can help with what odd fixes I can.
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20250221161443.2321327-1-alex.bennee@linaro.org>
>> ---
>>   MAINTAINERS | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1911949526..9cdfe19115 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2529,8 +2529,7 @@ F: hw/i2c/i2c_mux_pca954x.c
>>   F: include/hw/i2c/i2c_mux_pca954x.h
>>     pcf8574
>> -M: Dmitrii Sharikhin <d.sharikhin@yadro.com>
>> -S: Maintained
>> +S: Orphaned
>>   F: hw/gpio/pcf8574.c
>>   F: include/gpio/pcf8574.h
>>   @@ -3627,10 +3626,10 @@ F: net/filter-mirror.c
>>   F: tests/qtest/test-filter*
>>     Record/replay
>> -M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
>>   R: Paolo Bonzini <pbonzini@redhat.com>
>> +R: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>   W: https://wiki.qemu.org/Features/record-replay
>> -S: Supported
>> +S: Odd Fixes
>>   F: replay/*
>>   F: block/blkreplay.c
>>   F: net/filter-replay.c

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
