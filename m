Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d400d000000b00242269c8b8esm12286080wrp.25.2022.12.20.00.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 00:42:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AD85A1FFB7;
	Tue, 20 Dec 2022 08:42:22 +0000 (GMT)
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
 <20221116174749.65175-3-fcagnin@quarkslab.com>
 <CAFEAcA_QvfancWKj2hL3KxbyLm8FxkteSbgxvkF8QO119H7SNA@mail.gmail.com>
 <CAF8_6KkPDwe8-twtJEM3_HDuRVmxn25gJGDQVhRJF=DuA+fm3w@mail.gmail.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Francesco Cagnin <francesco.cagnin@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 mads@ynddal.dk, dirty@apple.com, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: Re: [PATCH v2 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
Date: Tue, 20 Dec 2022 08:31:25 +0000
In-reply-to: <CAF8_6KkPDwe8-twtJEM3_HDuRVmxn25gJGDQVhRJF=DuA+fm3w@mail.gmail.com>
Message-ID: <871qouihzl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CXzgQ6U+62tj


Francesco Cagnin <francesco.cagnin@gmail.com> writes:

> Hi,
> indeed, the patch doesn't keep separate copies of debug registers and
> just directly sets cp15.* values, as I was not aware of the issue=E2=80=
=94thanks
> for the detailed explanation.
>
> I remain available to implement the required fixes, but I'd need
> some guidance on how to proceed. Thanks,

In the KVM world we put of the final setting of the registers until
right before the context switch. I guess the equivalent in HVF would be
to modify hvf_put_registers() and make the decision about if to use the
QEMU supplied debug registers or the env values there.

Something like:

    for (i =3D 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
        if (hvf_sreg_match[i].cp_idx =3D=3D -1) {
            continue;
        }
        if (hvf_sref_match[i].can_override && should_override) {
            val =3D get_from_debug(...)=20=20=20=20=20=20=20=20
        } else {
            val =3D arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
        }
        ret =3D hv_vcpu_set_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, va=
l);
        assert_hvf_ok(ret);
    }

You will of course have to ensure the get_registers doesn't
inadvertently splat the env values with what we have just written here.

I'm not super familiar with the HVF architecture but maybe its possible
to do directly call hv_vcpu_set_sys_reg steps in your current
update_guest_debug function instead of copying to env and then and just
skip setting/getting them again in the final put registers just before
you exec.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
