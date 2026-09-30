Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835EACA5FC1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 07:54:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBp8b-0008GR-V2; Wed, 30 Sep 2026 03:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBp8Z-0008EQ-7X
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:53:59 -0400
Received: from mail-ed2-x14.google.com ([2a00:1450:4864:33::14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBp8X-0005Hr-8Z
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:53:58 -0400
Received: by mail-ed2-x14.google.com with SMTP id
 4fb4d7f45d1cf-6aa0ee64afdso6050728a12.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 00:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790754836; cv=none;
 d=google.com; s=arc-20260327;
 b=n5atKjd4L/c9x2ij4FvTuMJi4fzmYB656Xb+v9iU1YoW3oTh+KqDxBlRDLTvYVx0JC
 zlgsAhSYmSq88QexljFZDsPpujTKynvnWXWPFg5+aLRYh/VELj27r9PhfCCq1BYn5naw
 wn08vV9OqYZUmG2zpwx+2U6rrHJvWnNdiJCux0usLOTwTURiadOH/hyySxMRF46rmV1q
 ueeFG4BNaAKjVrPe7HQxPnKMx1TdRhqp/yz6ZjyHwQuouO90OafNsDEKkc5uOO8nmzFN
 XzFtSAsk+IB+wHm2Yv+rA0NQD9fQs+qanOAE46q5wIvKbJ/uOMEwUJuiRR2eMUnomNLZ
 JgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=DbIPhEl6hnumKe3veCA6SZ0VYwnMfD336BtRhx0BWmw=;
 fh=mJts8MiC8NNg4EyeYFt+rZddZx3MUKSbRKiyGaxlbWk=;
 b=DNUQzR2My5lIMX+WpAw4fillMRTeYDk1wwxyQ6Y2a+rlT7BXtKTcABxzvAHrOx4aNt
 kqHN7/EiTjAvK/eGiMBmX2sINCHkouYlpM2dlNGvt/lnsURgc5xXHRSN9TTMZ+Z4IN+M
 XN+ylF9RUO/7XmnYqIJrul2BXsNrMcKiCaS3vdfLOB0NWGU60Q5N2KaZynBN7rux9pHX
 0Jik1CNBnO2NYxZ3+BQSeXXOfCf3kIRIrvYuczKZuw2SlXCy9M8u4VoYB2GHKGZfRCsC
 ftBXHakTrolYVmZnOb6gBDTqVZvG1LsR9pxQK4YWdQVWt1JwdbB0MrlnYQi9FuxcVaj+
 omsw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790754836; x=1791359636; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DbIPhEl6hnumKe3veCA6SZ0VYwnMfD336BtRhx0BWmw=;
 b=WxbBNzBb3hsysFFJstEAmbkFeUxH1FG51lUmdInhIVG3L5SoHXYfvJ3/T1l4n5xo5i
 zVT+bR+aDxHmDpH//orGBSyvMEQE8aWh/83iDxmHe459fEUlgKYr/NynqFDl3+fq4iIw
 OjlhEunvgVuVHCipVEJf2rb+VmvD3vnQ5aSxFGnK4k9dJriUbJDFdLYCv1voHLieuZLw
 XsQQpx+NteMxn6xOAu0dbPvxMid+WF8M6V8v2dTjhX+Bhae2mzDYURbb7Aqu4UGmXkZ/
 Pd8fxhK10B3Z5xShnRYwbwQ2fzdF4+uneQPzYuASUIh8f919g1bHg3hOI0OOjXWMjj0y
 vIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790754836; x=1791359636;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DbIPhEl6hnumKe3veCA6SZ0VYwnMfD336BtRhx0BWmw=;
 b=jKHbVAvctfnmLuCUkEjJ48jG7gjVOMSWgWvang8R11//4q2n0YbrkO/AMKd0OtJher
 FseZ6aBGv9I/Bt5mpoaR9+f+y1FHwPqEDTgEJ9lsXQ+CpUaLc8vi0GmDJpVkVxmAeN2A
 fGcbTUnaqiB3rZp/uwlp7UK9u/cuMpr/Y1BhFGAilYMnFIXJX2lRlQnW909dTsiugIsf
 lp30wX7CA21mTTL3IGV7LCEygdPZdpCK5LqI3tbKpAa8psBgZcTB14/RkI3dCM2ZlI94
 o7ViGX5SFCfY5JtC9k7SMysQILfoL01hIHpU8/pq8xvNWmOEmBu/c8D7ufUmNYrsZjvo
 sQvg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxAlu9lZYEQ8jareF7UBL9PXtp8/4H8nU7sgrhqL/GxeBfoGU+YCTuijC4ndEIgdMai7Xuyd4Oz1g==@nongnu.org
X-Gm-Message-State: AFq9FYKRkg+bshbqQRVFbhTiOPPV/NOTizFqiq3flvVPS9T2bQsBqgqk
 MHFLtsArAnVC1Oiop5j14YVrgNShMmQY13N/GxwP3EAmqlh5s+VdIvRNAXWvVkqY6PNjDTx54ng
 bnsX4kCxMtkINMormJbc/vYnTjLD9cHM=
X-Gm-Gg: AYBFou3ez+CF+pl/Q2u6T4hvKyuNL7btKJ4v9Qi20gWlAPnE2XzEjo914/vliOZdM1M
 o5dpQLE2dXdvRJWB8GVd5lyPN+zGYe7k2RUQcNU2tkmdQh01CD7XGbenf+3nmP4JpMhWDd3F/7L
 m2FSl/OvM5bNNnwhLQ/CSolbeZWBDWH83oXUL0Pr0CjaHdqLmLjVdBi/LIR320rtYnu6v58FSwi
 fdLsqlUq7E4J4zabee46XvXTHk2acQSjQUfxQkiDfDNurxsMM/lU0OmI8N8Q0cF3Q5BbogsA120
 Et9HAeyfrstjdmG61AZMy1FzArCrMQJ90vvUlwkzSqkAv/qiTPo3Px8=
X-Received: by 2002:a05:6402:324e:b0:6aa:fce2:7b30 with SMTP id
 4fb4d7f45d1cf-6ae1994611amr233447a12.18.1790754835426; Wed, 30 Sep 2026
 00:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260928052051.251-1-luoyonggang@gmail.com>
 <20260928052051.251-3-luoyonggang@gmail.com>
 <c7aadc02-6c5e-4ca1-875c-43050305f4ec@oss.qualcomm.com>
In-Reply-To: <c7aadc02-6c5e-4ca1-875c-43050305f4ec@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 30 Sep 2026 15:53:42 +0800
X-Gm-Features: AclHuK_AkJAslhEUYFEZ-FPW4v9lx98bN-SlXHVMCqGpvmbaqz9tw62QlduK1BU
Message-ID: <CAE2XoE-C15Y7MjqVCRdpqs=hBLw7+buGJWXdKei37WC7kQkkHg@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] accel/tcg: add cpu_loop_exit_excp
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Helge Deller <deller@gmx.de>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Chao Liu <chao.liu@processmission.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Eric Farman <farman@linux.ibm.com>,
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, 
 Glenn Miles <milesg@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, 
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::14;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x14.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Sep 29, 2026 at 1:23=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 28/9/26 07:20, Yonggang Luo wrote:
> > Add cpu_loop_exit_excp next to cpu_loop_exit_restore. Set
> > cpu->exception_index, then restore and exit the current TB the same
> > way as cpu_loop_exit_restore.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >   accel/tcg/cpu-exec-common.c  |  6 ++++++
> >   include/accel/tcg/cpu-loop.h | 12 ++++++++++++
> >   2 files changed, 18 insertions(+)
> >
> > diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> > index d20cece1c5f..31fed8e497f 100644
> > --- a/accel/tcg/cpu-exec-common.c
> > +++ b/accel/tcg/cpu-exec-common.c
> > @@ -118,6 +118,12 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_=
t pc)
> >       cpu_loop_exit(cpu);
> >   }
> >
> > +void cpu_loop_exit_excp(CPUState *cpu, int exception_index, uintptr_t =
pc)
> > +{
> > +    cpu->exception_index =3D exception_index;
> > +    cpu_loop_exit_restore(cpu, pc);
> > +}
> > +
> >   void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
> >   {
> >       /* Prevent looping if already executing in a serial context. */
> > diff --git a/include/accel/tcg/cpu-loop.h b/include/accel/tcg/cpu-loop.=
h
> > index f4d38bc2bca..856091020f2 100644
> > --- a/include/accel/tcg/cpu-loop.h
> > +++ b/include/accel/tcg/cpu-loop.h
> > @@ -65,6 +65,18 @@ G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
> >   G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t host_p=
c);
> >   G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t host_pc=
);
> >
> > +/**
> > + * cpu_loop_exit_excp:
> > + * @cpu: the cpu context
> > + * @exception_index: EXCP_* or target trap number
> > + * @host_pc: the host pc within the translation
>
> I'm not comfortable this is hidding the 'restore' part,
> not even mentioning no restore is done if host_pc=3D=3D0.

After thinking, maybe it should be cpu_raise_excp and cpu_raise_excp_restor=
e
That match the accel/tcg: add raise_excp and raise_excp_restore helpers?


>
> > + *
> > + * Set cpu->exception_index and exit the current TB, restoring
> > + * guest state from @host_pc the same way as cpu_loop_exit_restore.
> > + */
> > +G_NORETURN void cpu_loop_exit_excp(CPUState *cpu, int exception_index,
> > +                                   uintptr_t host_pc);
> > +
> >   /**
> >    * cpu_loop_exit:
> >    * @cpu: the cpu context
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

