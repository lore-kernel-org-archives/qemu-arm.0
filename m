Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h14sm6551191wrq.45.2021.04.29.07.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 07:52:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5C81A1FF7E;
	Thu, 29 Apr 2021 15:52:17 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-4-philmd@redhat.com>
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
Subject: Re: [PATCH v4 03/12] tests/qtest: Add qtest_has_accel() method
Date: Thu, 29 Apr 2021 15:52:12 +0100
In-reply-to: <20210415163304.4120052-4-philmd@redhat.com>
Message-ID: <87r1itw3by.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cxTpjkAAyyC1


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce the qtest_has_accel() method which allows a runtime
> query on whether a QEMU instance has an accelerator built-in.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
