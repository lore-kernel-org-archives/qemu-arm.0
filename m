Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u8sm4271696wrb.77.2021.06.03.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:35:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D79C31FF7E;
	Thu,  3 Jun 2021 17:35:13 +0100 (BST)
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-11-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
 <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Markus Armbruster
 <armbru@redhat.com>, qemu-arm@nongnu.org, Igor Mammedov
 <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v8 10/12] qtest/bios-tables-test: Rename TCG specific tests
Date: Thu, 03 Jun 2021 17:35:08 +0100
In-reply-to: <20210526170432.343588-11-philmd@redhat.com>
Message-ID: <87zgw67vpa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0coNzIldsGEH


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Some tests require TCG, but don't have '_tcg' in their name,
> while others do. Unify the test names by adding 'tcg' to the
> TCG specific tests.
>
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
