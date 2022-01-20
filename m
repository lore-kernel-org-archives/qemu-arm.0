Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a9sm2978893wmm.32.2022.01.20.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 07:37:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CC4E31FFB7;
	Thu, 20 Jan 2022 15:37:49 +0000 (GMT)
References: <20220118203833.316741-1-eric.auger@redhat.com>
 <20220118203833.316741-4-eric.auger@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, thuth@redhat.com, pbonzini@redhat.com,
 lvivier@redhat.com, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, david@gibson.dropbear.id.au, clg@kaod.org,
 eesposit@redhat.com, jean-philippe@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 3/6] tests/qtest/libqos: Skip hotplug tests if pci
 root bus is not hotpluggable
Date: Thu, 20 Jan 2022 15:37:45 +0000
In-reply-to: <20220118203833.316741-4-eric.auger@redhat.com>
Message-ID: <87mtjq7702.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7gd/WRHN8FkO


Eric Auger <eric.auger@redhat.com> writes:

> ARM does not not support hotplug on pcie.0. Add a flag on the bus
> which tells if devices can be hotplugged and skip hotplug tests
> if the bus cannot be hotplugged. This is a temporary solution to
> enable the other pci tests on aarch64.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
