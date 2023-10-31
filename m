Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id x4-20020a1c7c04000000b003fe61c33df5sm1567917wmc.3.2023.10.31.05.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 05:02:03 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 44A4D5F78A;
	Tue, 31 Oct 2023 12:02:03 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>, Mostafa Saleh <smostafa@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Jason Wang
 <jasowang@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Simon Veith <sveith@amazon.de>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, QEMU
 Developers <qemu-devel@nongnu.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Joe Komlodi <joe.komlodi@xilinx.com>, Prem Mallappa
 <prem.mallappa@broadcom.com>, Leonardo Garcia
 <leonardo.garcia@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alistair Francis <alistair@alistair23.me>
Subject: Any plans to implement more ARM SMMUv3 features?
User-Agent: mu4e 1.11.23; emacs 29.1
Date: Tue, 31 Oct 2023 12:02:03 +0000
Message-ID: <87il6n0zlw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WvAhf3JKWLIF


Hi All,

Since 8.1 we enabled the FEAT_RME CPU feature to allow for Arm CCA
guests to be run under QEMU's Arm emulation. While this is enough for
pure software guests eventually we would want to support modelling
systems with "real" hardware. One part of that is updating the SMMU
emulation to make it RME aware.

The recently published F.a spec is available on the Arm site:

  https://developer.arm.com/documentation/ihi0070/latest/

As we have a keen interest on tracking (and implementing!) Arm features
we have coded up the various sub-features as stories under an EPIC for
each level of SMMU feature on our public JIRA:

  https://linaro.atlassian.net/browse/QEMU-533 (SMMUv3.0)
  https://linaro.atlassian.net/browse/QEMU-553 (SMMUv3.1)
  https://linaro.atlassian.net/browse/QEMU-558 (SMMUv3.2)
  https://linaro.atlassian.net/browse/QEMU-566 (SMMUv3.3)
=20=20
I think the state of the cards currently represents what has been
implemented and what is left to do. As you can see it adds up to a fair
bit of stuff. As a lot of people have been hacking on the SMMU code over
the last few years I thought it would be useful to reach out and see who
else is interested in further enhancing the SMMU emulation support?

If anyone has any patches/branches cooking or is intending to implement
any particular bits please do let me know and I can update the cards to
reflect the current state of work. As ever we will do our best to help
review and smooth the up-streaming process for all Arm related feature
enhancements.

Thanks,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
