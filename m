Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d4sm9977797wmb.25.2019.01.09.08.10.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jan 2019 08:10:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8CF0A3E0116;
	Wed,  9 Jan 2019 16:10:37 +0000 (GMT)
References: <20190109152430.32359-1-agraf@suse.de>
User-agent: mu4e 1.1.0; emacs 26.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Tom Rini <trini@konsulko.com>, Michal Simek <michal.simek@xilinx.com>, Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [Qemu-devel] [PATCH] target/arm: Allow to switch from MON->HYP on AArch32
In-reply-to: <20190109152430.32359-1-agraf@suse.de>
Date: Wed, 09 Jan 2019 16:10:37 +0000
Message-ID: <871s5lx14y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: N+gUbYrmGUng


Alexander Graf <agraf@suse.de> writes:

> In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
> HYP mode. This dance seems to work ok (hence it's there in the code
> base), but breaks with current QEMU.

What EL is MON in this case? EL3? In which case I'm confused by the
terminology as the ARM ARM states:

  The principles of the ARMv8-A security model are:
  =E2=80=A2 If the implementation includes EL3, then it has two Security st=
ates, Secure and Non-secure, and:
    =E2=80=94 EL3 exists only in Secure state.
    =E2=80=94 A change from Non-secure state to Secure state can only occur=
 on taking an exception to EL3.
    =E2=80=94 A change from Secure state to Non-secure state can only occur=
 on an exception return from EL3.

We don't currently implement ARMv8.4-SecEL2 but that adds secure EL2 but
as you can only switch security state in in/out of EL3 you have to be go
to the secure monitor before you enter it.

> The reason seems to be that we try to see whether we are entering
> HYP mode from the NS side. However, MON is always considered secure,
> so we always fall into an error case when going MON->HYP and never
> manage to actually do the switch.
>
> Fix this by not using a different helper function that does not bork
> when we're in MON state, as that switch is supposed to work.
>
> Signed-off-by: Alexander Graf <agraf@suse.de>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f00c141ef9..9bf8fbd8f9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6297,7 +6297,7 @@ static int bad_mode_switch(CPUARMState *env, int mo=
de, CPSRWriteType write_type)
>          return 0;
>      case ARM_CPU_MODE_HYP:
>          return !arm_feature(env, ARM_FEATURE_EL2)
> -            || arm_current_el(env) < 2 || arm_is_secure(env);
> +            || arm_current_el(env) < 2 ||
> arm_is_secure_below_el3(env);

This seems to violate the rule that you can enter a NS state from
anything other than EL3.

>      case ARM_CPU_MODE_MON:
>          return arm_current_el(env) < 3;
>      default:


--
Alex Benn=C3=A9e
