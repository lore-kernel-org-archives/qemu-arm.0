Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r10-20020a5d498a000000b00314091d58b4sm6733967wrq.18.2023.06.30.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:12:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EC7011FFBB;
	Fri, 30 Jun 2023 09:12:53 +0100 (BST)
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-26-alex.bennee@linaro.org>
 <b08189c8-38c2-adbf-7bb3-0304f4845fc0@linaro.org>
User-agent: mu4e 1.11.7; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Juan Quintela <quintela@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>, Leonardo Bras
 <leobras@redhat.com>, Beraldo Leal <bleal@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, Yanan Wang
 <wangyanan55@huawei.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>, Radoslaw
 Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>, Paolo
 Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Bandan Das <bsd@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Alexandre
 Iooss
 <erdnaxe@crans.org>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Laurent Vivier
 <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
Subject: Re: [PATCH v3 25/36] docs/devel: introduce some key concepts for
 QOM development
Date: Fri, 30 Jun 2023 09:03:56 +0100
In-reply-to: <b08189c8-38c2-adbf-7bb3-0304f4845fc0@linaro.org>
Message-ID: <87fs69xta2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: se3KiM5TjVFK


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 27/6/23 18:09, Alex Benn=C3=A9e wrote:
>> Using QOM correctly is increasingly important to maintaining a modern
>> code base. However the current documentation skips some important
>> concepts before launching into a simple example. Lets:
>>    - at least mention properties
>>    - mention TYPE_OBJECT and TYPE_DEVICE
>>    - talk about why we have realize/unrealize
>>    - mention the QOM tree
>>    - lightly re-arrange the order we mention things
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20230619171437.357374-6-alex.bennee@linaro.org>
>> ---
>> v3
>>    - moved around as per Paolo's review
>> ---
>>   docs/devel/qom.rst | 58 +++++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 52 insertions(+), 6 deletions(-)
>
>
>> +Creating a QOM class
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +A simple minimal device implementation may look something like bellow:
>>     .. code-block:: c
>>      :caption: Creating a minimal type
>> @@ -48,6 +66,12 @@ In the above example, we create a simple type that is=
 described by #TypeInfo.
>>   #TypeInfo describes information about the type including what it inher=
its
>>   from, the instance and class size, and constructor/destructor hooks.
>>   +The TYPE_DEVICE class is the parent class for all modern devices
>> +implemented in QEMU and adds some specific methods to handle QEMU
>> +device model. This includes managing the lifetime of devices from
>> +creation through to when they become visible to the guest and
>> +eventually unrealized.
>
> Good enough but we are mixing QOM vs QDev...

Yeah, but one relies on the other. From the point of view of someone
coming new to the code I think we do want to mention them both together.
Most people implementing QOM classes will be for devices I think.

Maybe we should enumerate all the types that have TYPE_OBJECT as their
parent?

>
>>   Alternatively several static types could be registered using helper ma=
cro
>>   DEFINE_TYPES()
>
>
>> +.. _device-life-cycle:
>> +
>> +Device Life-cycle
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +As class initialisation cannot fail devices have an two additional
>> +methods to handle the creation of dynamic devices. The ``realize``
>> +function is called with ``Error **`` pointer which should be set if
>> +the device cannot complete its setup. Otherwise on successful
>> +completion of the ``realize`` method the device object is added to the
>> +QOM tree and made visible to the guest.
>> +
>> +The reverse function is ``unrealize`` and should be were clean-up
>> +code lives to tidy up after the system is done with the device.
>
> Worth mentioning hotplug devices must implement it?
>
>> +All devices can be instantiated by C code, however only some can
>> +created dynamically via the command line or monitor.
>>   +Likewise only some can be unplugged after creation and need an
>> +explicit ``unrealize`` implementation.
>
> Ah, here we go.
>
>> This is determined by the
>> +``user_creatable`` variable in the root ``DeviceClass`` structure.
>> +Devices can only be unplugged if their ``parent_bus`` has a registered
>> +``HotplugHandler``.
>
> TODO on top, mentions the reset() handlers are called after realize(),
> and can be called multiple times.

Where is this TODO? I'm wary of talking about reset too much as the old
reset handler is a deprecated API.

>
>>   API Reference
>> --------------
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>     See the :ref:`QOM API<qom-api>` and :ref:`QDEV API<qdev-api>`
>>   documents for the complete API description.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
