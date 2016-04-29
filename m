Received: by 10.25.208.137 with SMTP id h131csp885315lfg;
        Fri, 29 Apr 2016 07:09:02 -0700 (PDT)
X-Received: by 10.55.77.205 with SMTP id a196mr19437309qkb.94.1461938942824;
        Fri, 29 Apr 2016 07:09:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t199si7522634qke.64.2016.04.29.07.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Apr 2016 07:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aw966-00085r-4g
	for alex.bennee@linaro.org; Fri, 29 Apr 2016 10:08:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aw95x-0007sy-OC
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 10:08:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aw95l-0005qw-Jw
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 10:08:32 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:50898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1aw95l-0005lp-BQ; Fri, 29 Apr 2016 10:08:25 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id E527CB9633507;
	Fri, 29 Apr 2016 15:07:57 +0100 (IST)
Received: from [192.168.161.74] (192.168.161.74) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 29 Apr 2016 15:08:01 +0100
Message-ID: <57236AB8.1020708@imgtec.com>
Date: Fri, 29 Apr 2016 15:07:52 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460995422-14373-5-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1460995422-14373-5-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.161.74]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v5 4/9] target-mips: Amend processor
 definitions in relation to FCR31
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, petar.jovanovic@imgtec.com,
	miodrag.dinic@imgtec.com, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de, aurelien@aurel32.net,
	rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: foVls6fCyZm2

On 18/04/16 17:03, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> 
> Amend definitions of some Mips processors related to FCR31
> (float status control register). Most significantly, FCR31 of
> processors mips32r6-generic, mips64r6-generic, and P5600 will
> be set so that its FCR31_ABS2008 and FCR31_NAN2008 bits are set
> to 1.

Not long before this series was posted I applied a change which sets
these bits for these processors (even though there's no actual support):
https://lists.nongnu.org/archive/html/qemu-devel/2016-02/msg05593.html

By looking at the description I'm guessing this part was subtracted
after you rebased the series. Now this patch does nothing apart from
setting fcr31 to 0 which actually isn't necessary and I think this patch
can be dropped.

Thanks,
Leon

> 
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> ---
>  target-mips/translate_init.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
> index e81a831..1094baa 100644
> --- a/target-mips/translate_init.c
> +++ b/target-mips/translate_init.c
> @@ -273,6 +273,7 @@ static const mips_def_t mips_defs[] =
>          .CP0_Status_rw_bitmask = 0x3678FF1F,
>          .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
>                      (1 << FCR0_D) | (1 << FCR0_S) | (0x93 << FCR0_PRID),
> +        .CP1_fcr31 = 0,
>          .SEGBITS = 32,
>          .PABITS = 32,
>          .insn_flags = CPU_MIPS32R2 | ASE_MIPS16,
> @@ -303,6 +304,7 @@ static const mips_def_t mips_defs[] =
>                      (0xff << CP0TCSt_TASID),
>          .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
>                      (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PRID),
> +        .CP1_fcr31 = 0,
>          .CP0_SRSCtl = (0xf << CP0SRSCtl_HSS),
>          .CP0_SRSConf0_rw_bitmask = 0x3fffffff,
>          .CP0_SRSConf0 = (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) |
> @@ -343,6 +345,7 @@ static const mips_def_t mips_defs[] =
>          .CP0_Status_rw_bitmask = 0x3778FF1F,
>          .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
>                      (1 << FCR0_D) | (1 << FCR0_S) | (0x93 << FCR0_PRID),
> +        .CP1_fcr31 = 0,
>          .SEGBITS = 32,
>          .PABITS = 32,
>          .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_DSPR2,
> @@ -434,7 +437,7 @@ static const mips_def_t mips_defs[] =
>      },
>      {
>          /* A generic CPU supporting MIPS32 Release 6 ISA.
> -           FIXME: Support IEEE 754-2008 FP.
> +           FIXME: Complete support for IEEE 754-2008 FP.
>                    Eventually this should be replaced by a real CPU model. */
>          .name = "mips32r6-generic",
>          .CP0_PRid = 0x00010000,
> @@ -485,6 +488,7 @@ static const mips_def_t mips_defs[] =
>          .CP0_Status_rw_bitmask = 0x3678FFFF,
>          /* The R4000 has a full 64bit FPU but doesn't use the fcr0 bits. */
>          .CP1_fcr0 = (0x5 << FCR0_PRID) | (0x0 << FCR0_REV),
> +        .CP1_fcr31 = 0,
>          .SEGBITS = 40,
>          .PABITS = 36,
>          .insn_flags = CPU_MIPS3,
> @@ -503,6 +507,7 @@ static const mips_def_t mips_defs[] =
>          .CP0_Status_rw_bitmask = 0x3678FFFF,
>          /* The VR5432 has a full 64bit FPU but doesn't use the fcr0 bits. */
>          .CP1_fcr0 = (0x54 << FCR0_PRID) | (0x0 << FCR0_REV),
> +        .CP1_fcr31 = 0,
>          .SEGBITS = 40,
>          .PABITS = 32,
>          .insn_flags = CPU_VR54XX,
> @@ -548,6 +553,7 @@ static const mips_def_t mips_defs[] =
>          /* The 5Kf has F64 / L / W but doesn't use the fcr0 bits. */
>          .CP1_fcr0 = (1 << FCR0_D) | (1 << FCR0_S) |
>                      (0x81 << FCR0_PRID) | (0x0 << FCR0_REV),
> +        .CP1_fcr31 = 0,
>          .SEGBITS = 42,
>          .PABITS = 36,
>          .insn_flags = CPU_MIPS64,
> @@ -575,6 +581,7 @@ static const mips_def_t mips_defs[] =
>          .CP1_fcr0 = (1 << FCR0_3D) | (1 << FCR0_PS) |
>                      (1 << FCR0_D) | (1 << FCR0_S) |
>                      (0x82 << FCR0_PRID) | (0x0 << FCR0_REV),
> +        .CP1_fcr31 = 0,
>          .SEGBITS = 40,
>          .PABITS = 36,
>          .insn_flags = CPU_MIPS64 | ASE_MIPS3D,
> @@ -601,6 +608,7 @@ static const mips_def_t mips_defs[] =
>          .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_3D) | (1 << FCR0_PS) |
>                      (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
>                      (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_REV),
> +        .CP1_fcr31 = 0,
>          .SEGBITS = 42,
>          .PABITS = 36,
>          .insn_flags = CPU_MIPS64R2 | ASE_MIPS3D,
> @@ -653,7 +661,7 @@ static const mips_def_t mips_defs[] =
>      },
>      {
>          /* A generic CPU supporting MIPS64 Release 6 ISA.
> -           FIXME: Support IEEE 754-2008 FP.
> +           FIXME: Complete support for IEEE 754-2008 FP.
>                    Eventually this should be replaced by a real CPU model. */
>          .name = "MIPS64R6-generic",
>          .CP0_PRid = 0x00010000,
> @@ -704,6 +712,7 @@ static const mips_def_t mips_defs[] =
>          .CCRes = 2,
>          .CP0_Status_rw_bitmask = 0x35D0FFFF,
>          .CP1_fcr0 = (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
> +        .CP1_fcr31 = 0,
>          .SEGBITS = 40,
>          .PABITS = 40,
>          .insn_flags = CPU_LOONGSON2E,
> @@ -722,6 +731,7 @@ static const mips_def_t mips_defs[] =
>          .CCRes = 2,
>          .CP0_Status_rw_bitmask = 0xF5D0FF1F,   /* Bits 7:5 not writable.  */
>          .CP1_fcr0 = (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
> +        .CP1_fcr31 = 0,
>          .SEGBITS = 40,
>          .PABITS = 40,
>          .insn_flags = CPU_LOONGSON2F,
> @@ -749,6 +759,7 @@ static const mips_def_t mips_defs[] =
>          .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_3D) | (1 << FCR0_PS) |
>                      (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
>                      (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_REV),
> +        .CP1_fcr31 = 0,
>          .SEGBITS = 42,
>          .PABITS = 36,
>          .insn_flags = CPU_MIPS64R2 | ASE_DSP | ASE_DSPR2,

