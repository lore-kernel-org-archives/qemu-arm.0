Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id gl2-20020a170906e0c200b006a767d52373sm6688323ejb.182.2022.04.06.10.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 10:34:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 01E081FFB7;
	Wed,  6 Apr 2022 18:34:55 +0100 (BST)
References: <20220210145254.157790-1-eric.auger@redhat.com>
 <20220210145254.157790-5-eric.auger@redhat.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, david@gibson.dropbear.id.au,
 clg@kaod.org, eesposit@redhat.com, Coiby.Xu@gmail.com,
 stefanha@redhat.com, jean-philippe@linaro.org
Subject: Re: [PATCH v3 4/5] tests/qtest/vhost-user-blk-test: Temporary hack
 to get tests passing on aarch64
Date: Wed, 06 Apr 2022 18:34:15 +0100
In-reply-to: <20220210145254.157790-5-eric.auger@redhat.com>
Message-ID: <871qyajetd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6MwjoF8TggHQ


Eric Auger <eric.auger@redhat.com> writes:

> When run on ARM, basic and indirect tests currently fail with the
> following error:
>
> ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
> assertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
> Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_ele=
m:
> assertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
>
> I noticed it worked when I set up MSI and I further reduced the
> code to a simple guest_alloc() that removes the error. At the moment
> I am not able to identify where ths issue is and this blocks the
> whole pci/aarch64 enablement.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Hi Eric,

I sent a RFC patch which I think avoids the need for this hack:

  Subject: [RFC PATCH] tests/qtest: properly initialise the vring used idx
  Date: Wed,  6 Apr 2022 18:33:56 +0100
  Message-Id: <20220406173356.1891500-1-alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
