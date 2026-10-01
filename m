Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7146BCA5FB3
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 09:55:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCDVk-0002gg-MK; Thu, 01 Oct 2026 05:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xCDVZ-0002VS-I9
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 05:55:21 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xCDVX-00054O-QV
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 05:55:21 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 00721157ae682-8ab445ac183so33710017b3.3
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 02:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790848518; cv=none;
 d=google.com; s=arc-20260327;
 b=JHIGLvK0hizqC76nywzTWm48QINhKqbAtnQsc8730eAh50ni6cc2MavhCY2/dr7Ocx
 AJsfffgWg/4MEfdAC6KYlU4M+gM+OVAn9Vt/z2i1MYc1To/lroZr5JEC51q8BPZdbnBF
 bwWUXV7XBesPKX8msbu7xitmxeW93qymY+V+6CpbYAVT1RFf0tO732uknlOHroocDujT
 tfrhAPPVRacOgJaAtoupW6OwecS65DDXFgWmwYh8H08lJ3n9KZDkDJHLJtG7o05t5/8L
 ghyWJLYJao4ElED0MTfUn6DidubnpBvA1a3eWdhc5I/ugt/S1X3vixD8M3D6ka2Sqtqk
 6PIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=oivvos2KYP62ep5QHwsceTgXDAlhyI54S3Dw3J5LmjU=;
 fh=Ek4wgYfHyCUL9K/ADL44zqJprGW/Ywe0Vztu3seX9vo=;
 b=jA4qi9YuaU+SSz6E/s2+jQuuLUXmzfk9o66LRj4Ose8fuPoxfPJsFD64Thw32ZQz+n
 X38fNb4z8njY+OD5tKBepCVvkvR1v6tm9yDU82zkhboa7wkmF12kBX/Yr5bSl4TVvyXp
 MGyZ/P9erfruF646i4qrlclRhQ4M/TXXOpXbS1EX3Bs47AEqEVwVux+lu4QiQtGbq3/l
 sKcMHQTPE5XZ5tnF+WP/03w75ZuGhrXdvpho6f5FV53DXyxBBSEQdUS5v1t5c/rshRqc
 jWiG5AcKOLFuHpteSEJP+oHyp08V24NQyUbMketDo74ZrWTqCg99StVlKxAd98HhZgYP
 7yNQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790848518; x=1791453318; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=oivvos2KYP62ep5QHwsceTgXDAlhyI54S3Dw3J5LmjU=;
 b=Vc79F7PzK7V81BPtaYkcRWYzWltQ1wDH1TdzbKud9f6TO9FN4Fpu1vIq7H/0ax+C8v
 rRQp9faB8PJ2adW4OUem7Vc4fDLpu7ePTwjdNdwo1pVRNRcgbe1vzRPy7VVz3mglBtcC
 iPEdA8pOEQ32rUv7hiWM84nUwb8GkOyJgeVocVKqf5bmLmpi8E1ju3t3DrRLA/cPS3Qu
 E0j9XCqLLOD9SzPqG0AQJoSEP9ryJD6eTdSvKwlVTKzi47r1nycaHB0RQE80JTqRVZqJ
 7kvQ/AVNkhyto/24HSn8bDoyiyC/jZbwt96KcWnu1sIUYCcZdK5fpnfUNVbIghswupgC
 POtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790848518; x=1791453318;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oivvos2KYP62ep5QHwsceTgXDAlhyI54S3Dw3J5LmjU=;
 b=kCCHOnzmew+ir3I3y5kGqx9r+kn7/eum8Vmjly++RrRbZahY8Xnik7GucXZElO9uUO
 aZ+iRFWSkd1Afa2nDBIwPtP4t20jLvDVpRP0RzIeMD3ZDoI3a5Ye/gKLzJHTeaazDBan
 OpoWEizYUgCXoZOSO1QA7lGJOKZ26xRZxSf2CbI/SuFMOO0xL+ucUh/Rwu4ngY48lMnn
 8x/rpBWj90V15afrCnX1bL5Ih+V9VTRzC83FZoQwzQIa+jHg447+5ARPqNtp9s6FbmeI
 SFD45DVM1P4XLvPXh9Wpgw7U32smOiJ/WtpXbVOlmqTayVGMVBHkEupaCUYw9O0/ac0K
 s00A==
X-Forwarded-Encrypted: i=1;
 AKwUvByHOTc+t7D9TfVpiYdBPKUCBeZvk1GXJQIZcVdD4bWI536QtjYfvknBHxGo1RR25mmaN4ueIHOk/g==@nongnu.org
X-Gm-Message-State: AFq9FYI4bVi8Lr8Lsl12/4l68ri9g20X4XjE6cvknlau4ZnLxgc39l54
 x2wWsUN6NKwHKjw2cFeihWPIT4m+1i0nwdZtpNMIysL/WrWybEhueXZj+yc4gxqjWqOO8aKNLWu
 R31WL+B61wOzLXJHfVumH40enOw0wSf4K5oG63M9HGA==
X-Gm-Gg: AYBFou1UZ84FUfoUh4vAOP3PhS9pCTvfUlaiRBxi/3NjNhMX839jqpiCkKXqQs149ik
 YYtooxzfiubxY2Tsi+DefvKkkAYUQNTHz78oWcHKlKjngkkOur5mrGLLaWwy3hn79oXpzFUQcuV
 c8LBV+WcFbK+Hx4ZyX+0aeELjOE0nIhdFFUubPWYhZnxneEnJmFbRjyNgCH4uvLTDaj5Vry3q2l
 2+MVKm+sHEDXI6yKtyK+91+xOEewzTCuHBFJfQ8ZLZmv5htMmEeVsmqDnTMoLkQtgzWeGku9HiT
 rnnS5ZSZhnigzZk2/mJ8xIf78pWTZNqoo9QtsNk2Qz6esXAeD6YtNoz2zZkRq1v3wFsobyRtAhL
 yb22PnBcou0vpvgD8WOwbtIbFFud5UC/IMzNI7sI=
X-Received: by 2002:a05:690c:dd3:b0:7db:ccda:a409 with SMTP id
 00721157ae682-8ac91ea3134mr22285337b3.9.1790848518386; Thu, 01 Oct 2026
 02:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
 <619e0b71-d58b-44ac-adc9-7a5d8f62f716@oss.qualcomm.com>
In-Reply-To: <619e0b71-d58b-44ac-adc9-7a5d8f62f716@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Oct 2026 10:55:06 +0100
X-Gm-Features: AclHuK8JZxwVDE44dVlnry6zJNEAiE0OBqE1yxEK0oMPWwPr9UBEPNUF1tKURiU
Message-ID: <CAFEAcA814CERnJctiaHzwiUOUa=ubYKcmA_0_W26xrLpG0rvuA@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] accel/tcg: Make halt-to-exec transition explicit
 and remove cpu_exec_halt
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 1 Oct 2026 at 09:20, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 30/9/26 19:49, Philippe Mathieu-Daud=C3=83=C2=A9 wrote:
> > Missing review: 9
> >
> > Since v3:
> > - Rebased (s390x, x86 and some ARM patches merged)
> > - RISC-V posted separately as [1]
> > - Better describe ARM PSCI power-state update issue
>
>
> > [1] https://lore.kernel.org/qemu-devel/20260930174508.81497-1-philmd@os=
s.qualcomm.com/
>
> > Philippe Mathieu-Daud=C3=A9 (9):
> >    accel/tcg: Refactor poll-while-halted flow in cpu_exec()
> >    accel/tcg: Introduce poll_during_halt() and leaving_halt()
> >    target/arm: Split leaving-halt handling from arm_cpu_exec_halt()
> >    target/arm: Convert cpu_exec_halt() to leaving_halt()
> >    target/i386: Split APIC polling from x86_cpu_exec_halt()
> >    target/i386: Split leaving-halt handling from x86_cpu_exec_halt()
> >    target/i386: Use generic halt transition handlers
> >    accel/tcg: Remove the redundant cpu_exec_halt() hook
>
> Since Alistair queued the prerequisite patches [1], I'm directly
> queuing the reviewed patches 1-8 via accel-next tree.

No objections here.

> >    target/arm: Kick vCPU after updating PSCI power state
>
> I might repost this single one (arm specific) later when the
> rest landed in /master.

I reviewed this one (as "I think this isn't a correct change").

thanks
-- PMM

