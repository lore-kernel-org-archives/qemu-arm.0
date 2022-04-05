Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s4-20020a170906a18400b006db0a78bde8sm5610712ejy.87.2022.04.05.07.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 07:37:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D86421FFB7;
	Tue,  5 Apr 2022 15:36:59 +0100 (BST)
References: <20220210145254.157790-1-eric.auger@redhat.com>
 <20220210145254.157790-4-eric.auger@redhat.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, david@gibson.dropbear.id.au,
 clg@kaod.org, eesposit@redhat.com, Coiby.Xu@gmail.com,
 stefanha@redhat.com, jean-philippe@linaro.org
Subject: Re: [PATCH v3 3/5] tests/qtest/libqos: Skip hotplug tests if pci
 root bus is not hotpluggable
Date: Tue, 05 Apr 2022 15:36:53 +0100
In-reply-to: <20220210145254.157790-4-eric.auger@redhat.com>
Message-ID: <87zgkzk35g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Zl1PR+zCt4hF


Eric Auger <eric.auger@redhat.com> writes:

> ARM does not not support hotplug on pcie.0. Add a flag on the bus
> which tells if devices can be hotplugged and skip hotplug tests
> if the bus cannot be hotplugged. This is a temporary solution to
> enable the other pci tests on aarch64.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
<snip>

--=20
Alex Benn=C3=A9e
