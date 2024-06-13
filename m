Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de5d5sm66893595e9.33.2024.06.13.08.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:56:36 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F36735F7A1;
	Thu, 13 Jun 2024 16:56:35 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  David Hildenbrand <david@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Marcelo Tosatti <mtosatti@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Mark Burton <mburton@qti.qualcomm.com>,
  qemu-s390x@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
  kvm@vger.kernel.org,  Laurent Vivier <lvivier@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
  Alexandre Iooss <erdnaxe@crans.org>,  qemu-arm@nongnu.org,  Alexander
 Graf <agraf@csgraf.de>,  Nicholas Piggin <npiggin@gmail.com>,  Marco
 Liebel <mliebel@qti.qualcomm.com>,  Thomas Huth <thuth@redhat.com>,  Roman
 Bolshakov <rbolshakov@ddn.com>,  qemu-ppc@nongnu.org,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Cameron Esfahani <dirty@apple.com>,  Jamie Iles
 <quic_jiles@quicinc.com>,  "Dr. David Alan Gilbert" <dave@treblig.org>,
  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 8/9] plugins: add time control API
In-Reply-To: <c4d36875-c70d-4e2c-b3a8-c50459c9db0f@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 13 Jun 2024 10:57:22
 +0200")
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
	<20240612153508.1532940-9-alex.bennee@linaro.org>
	<c4d36875-c70d-4e2c-b3a8-c50459c9db0f@linaro.org>
Date: Thu, 13 Jun 2024 16:56:35 +0100
Message-ID: <87r0d0vnt8.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /tKoZa6RxIay

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 12/6/24 17:35, Alex Benn=C3=A9e wrote:
>> Expose the ability to control time through the plugin API. Only one
>> plugin can control time so it has to request control when loaded.
>> There are probably more corner cases to catch here.
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Some of your patches include this dubious From: header, maybe strip?

I think because my original RFC patches went via Pierrick before pulling
back into my tree. I can clean those up.

>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> [AJB: tweaked user-mode handling]
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20240530220610.1245424-6-pierrick.bouvier@linaro.org>
>> ---
>> plugins/next
>>    - make qemu_plugin_update_ns a NOP in user-mode
>> ---
>>   include/qemu/qemu-plugin.h   | 25 +++++++++++++++++++++++++
>>   plugins/api.c                | 35 +++++++++++++++++++++++++++++++++++
>>   plugins/qemu-plugins.symbols |  2 ++
>>   3 files changed, 62 insertions(+)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
