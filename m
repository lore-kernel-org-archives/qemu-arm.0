Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v13sm5337904wrt.65.2021.04.29.07.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 07:50:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 56D871FF7E;
	Thu, 29 Apr 2021 15:50:35 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-3-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, qemu-arm@nongnu.org, Claudio Fontana
 <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 02/12] accel: Introduce 'query-accels' QMP command
Date: Thu, 29 Apr 2021 15:50:25 +0100
In-reply-to: <20210415163304.4120052-3-philmd@redhat.com>
Message-ID: <87tunpw3es.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: r5mRVHXqsssP


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
>
> - Accelerator is a QAPI enum of all existing accelerators,
>
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
>
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>
> For example on a KVM-only build we get:
>
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "name": "qtest"
>             },
>             {
>                 "name": "kvm"
>             }
>         ]
>     }
>
> Note that we can't make the enum values or union branches conditional
> because of target-specific poisoning of accelerator definitions.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
