Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a144sm4665475wmd.47.2020.11.17.08.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 08:44:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6C6A61FF7E;
	Tue, 17 Nov 2020 16:44:35 +0000 (GMT)
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, Pavel Fedin
 <p.fedin@samsung.com>, Eric Auger <eric.auger@redhat.com>
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org
Subject: Implementing GICv3 ITS support for TCG emulation
Date: Tue, 17 Nov 2020 16:44:35 +0000
Message-ID: <87h7povsp8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: LW+4xTgMMh7w


Hi,

I've been asked what the state of ITS support is for emulation. The
documentation explicitly states that there is currently no ITS support
under TCG.

Looking at the code it looks like there was a deliberate attempt to
separate common and KVM related code. Currently the only realizable
device (via its_class_name) is the TYPE_KVM_ARM_ITS device with a
comment saying emulation is "not implemented yet". My question is what
is left to do?

  - do we just need a wrapper akin to arm_gicv3_its_kvm.c?
  - do we need to implement more logic normally carried out in KVM?

Thanks,

--=20
Alex Benn=C3=A9e
