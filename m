Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u2sm3722489wrn.38.2021.06.03.09.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:36:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DFACF1FF7E;
	Thu,  3 Jun 2021 17:36:41 +0100 (BST)
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-12-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Markus Armbruster
 <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v8 11/12] qtest/bios-tables-test: Make test
 build-independent from accelerator
Date: Thu, 03 Jun 2021 17:36:37 +0100
In-reply-to: <20210526170432.343588-12-philmd@redhat.com>
Message-ID: <87wnra7vmu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: h9on3XHvweer


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Now that we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
