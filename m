Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m35-v6sm943593wrm.51.2018.05.10.06.12.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 May 2018 06:12:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 532A23E03C0;
	Thu, 10 May 2018 14:12:09 +0100 (BST)
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, khaled.jmal@lauterbach.com
Subject: Re: [PATCH v6 0/3] target/arm: Add a dynamic XML-description of the cp-registers to GDB
In-reply-to: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
Date: Thu, 10 May 2018 14:12:09 +0100
Message-ID: <87lgcrvemu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GSVURfIJVgGy


Abdallah Bouassida <abdallah.bouassida@lauterbach.com> writes:

> The previous version:
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D33714
>
> Abdallah Bouassida (3):
>   target/arm: Add "ARM_CP_NO_GDB" as a new bit field for ARMCPRegInfo
>     type
>   target/arm: Add "_S" suffix to the secure version of a sysreg
>   target/arm: Add the XML dynamic generation
>

So I got a fixed up gdb and I was testing the reading of the virtual
counter:

=3D> 0xffffff800854a118 <arch_counter_get_cntvct+16>:	mrs	x0, cntvct_el0
   0xffffff800854a11c <arch_counter_get_cntvct+20>:	b	0xffffff800854a148 <a=
rch_counter_get_cntvct+64>
   0xffffff800854a120 <arch_counter_get_cntvct+24>:	adrp	x0, 0xffffff800896=
a000 <scsi_format_log+3568>
   0xffffff800854a124 <arch_counter_get_cntvct+28>:	add	x0, x0, #0x5a0
   0xffffff800854a128 <erratum_set_next_event_tval_virt+4294964112>:	mrs	x1=
, tpidr_el1

p/x $x0
 $6 =3D 0xffffff800854a108
p/x $cntvct_el0
 $7 =3D 0x0
stepi
0xffffff800854a11c	160		return arch_timer_reg_read_stable(cntvct_el0);
=3D> 0xffffff800854a11c <arch_counter_get_cntvct+20>:	b	0xffffff800854a148 =
<arch_counter_get_cntvct+64>
   0xffffff800854a120 <arch_counter_get_cntvct+24>:	adrp	x0, 0xffffff800896=
a000 <scsi_format_log+3568>
   0xffffff800854a124 <arch_counter_get_cntvct+28>:	add	x0, x0, #0x5a0
p/x $x0
  $8 =3D 0x7a5b32b
p/x $cntvct_el0
  $9 =3D 0x0

So I'm wondering why there is a disparity here?

--
Alex Benn=C3=A9e
