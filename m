Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f23sm11053180wmf.37.2021.04.29.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 07:59:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B45F41FF7E;
	Thu, 29 Apr 2021 15:59:17 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-5-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost
 <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Claudio Fontana
 <cfontana@suse.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v4 04/12] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
Date: Thu, 29 Apr 2021 15:59:12 +0100
In-reply-to: <20210415163304.4120052-5-philmd@redhat.com>
Message-ID: <87o8dxw30a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: D7qpPDUV6q2b


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Use the recently added generic qtest_has_accel() method to
> check if KVM is available.
>
> Suggested-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
