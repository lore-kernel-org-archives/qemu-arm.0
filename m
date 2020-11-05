Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x81sm4272751wmg.5.2020.11.05.12.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 12:37:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C416F1FF7E;
	Thu,  5 Nov 2020 20:37:24 +0000 (GMT)
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-2-alex.bennee@linaro.org>
 <ea13af19-9ec7-3d91-e7b8-b4f59aa4cf1d@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 julien@xen.org, Eduardo Habkost <ehabkost@redhat.com>,
 masami.hiramatsu@linaro.org, andre.przywara@arm.com,
 stefano.stabellini@linaro.org, takahiro.akashi@linaro.org, "open
 list:Virt" <qemu-arm@nongnu.org>, stefano.stabellini@xilinx.com,
 stratos-dev@op-lists.linaro.org
Subject: Re: [RFC PATCH 01/15] hw/board: promote fdt from ARM
 VirtMachineState to MachineState
In-reply-to: <ea13af19-9ec7-3d91-e7b8-b4f59aa4cf1d@redhat.com>
Date: Thu, 05 Nov 2020 20:37:24 +0000
Message-ID: <877dqzbkvv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: v9zY3G7TyDvX


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 11/5/20 6:51 PM, Alex Benn=C3=A9e wrote:
>> The use of FDT's is quite common across our various platforms. To
>> allow the generic loader to tweak it we need to make it available in
>> the generic state. This creates the field and migrates the initial
>> user to use the generic field. Other boards will be updated in later
>> patches.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20201021170842.25762-2-alex.bennee@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Two S-o-b better than one!

Hmm I wonder what happened there? I'm sure b4 applied that patches for
me.

>
>> ---
>>  include/hw/arm/virt.h |   1 -
>>  include/hw/boards.h   |   1 +
>>  hw/arm/virt.c         | 322 ++++++++++++++++++++++--------------------
>>  3 files changed, 170 insertions(+), 154 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


--=20
Alex Benn=C3=A9e
