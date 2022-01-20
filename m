Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m12sm3531455wrp.55.2022.01.20.06.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 06:23:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DC4C41FFB7;
	Thu, 20 Jan 2022 14:23:51 +0000 (GMT)
References: <20220118203833.316741-1-eric.auger@redhat.com>
 <20220118203833.316741-2-eric.auger@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, thuth@redhat.com, pbonzini@redhat.com,
 lvivier@redhat.com, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, david@gibson.dropbear.id.au, clg@kaod.org,
 eesposit@redhat.com, jean-philippe@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 1/6] tests/qtest/vhost-user-test.c: Use vhostforce=on
Date: Thu, 20 Jan 2022 14:23:46 +0000
In-reply-to: <20220118203833.316741-2-eric.auger@redhat.com>
Message-ID: <87v8ye7afc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lY3fJhwR1U4h


Eric Auger <eric.auger@redhat.com> writes:

> -netdev vhost-user,vhostforce is deprecated and vhostforce=3Don
> should be used instead.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
