Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF79C79F82
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 15:58:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3yD8-0003vi-DI; Tue, 08 Sep 2026 11:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3yD7-0003v5-Kt
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 11:58:13 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3yD5-0000qk-Au
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 11:58:13 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-855c26cf490so33927137b3.0
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 08:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883090; cv=none;
 d=google.com; s=arc-20260327;
 b=gvE6WYB4FrAFg/qYJ0Fh5kwgofaGCPNz2iWXq1O12BVkaqdwJAssXEjKAnvKhmTN5N
 6B3Tg7eDhKvAoGsMxBccvoywPr0SC8W/Sy4lgi+kV8ExTn3+RdVktOvp0gsdwrhQ7EOI
 0SitZbEX61RZIy1nuAre/uZNFnW832lKa/OlG8qDVJKy5hB6/qHVJ4Ig9gKrwhLNEH7C
 /cbU2eRkwxIwQzEPiEbD54K0uraQMtWtdL7eQCPFoBxbxjMQVXYwXvTjX4HoGO+/PbIL
 c6bfbz6jBc4o+qr4r7G+NWpGhnR8CUVy7cRP26sBZH61P8Iuxp7Jg4w4/WT01IkgR9E5
 mbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9U0azSGD0ntwc/h5lCEy4R7LeO4m6e1+YMN+Y5mfMV4=;
 fh=cxCoLKd/iPIxt1mF3fzZfXjpdPi6KDLHns7+yRnAtIQ=;
 b=oq1Ky3EMkXwitq5AjNtMMipJP39fMxwT1EdO8BJRTeQCuiVzP4hMY3OGKAzeHmsi30
 y8erQSB4xsxzPbhAIgW0i9obDUi7f4XMiTvQ0O1SizOYxeXwQn9UVfT2EDyTKrDq94+1
 tg9ybn3AjxyM8Zn9XUHmkACrbOF426aqj09gi28LtxvUvgdYmk0zhFFqeUAb6uoVDxkr
 khuBLySawU8Za6of+fuX5iH40d/jgS6yMFL/pNkATQ+lQs6FBHnVAxnLnCLnbLSKViYO
 Uqkk4gLkyC9aAg6AOj7Lum7FbOp6Y4RJ/aHZx7UEHQGP9HpgBjn5jhelu84r/GjWw86x
 5+rg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788883090; x=1789487890; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9U0azSGD0ntwc/h5lCEy4R7LeO4m6e1+YMN+Y5mfMV4=;
 b=a9tVTZs68dP4SBmc502pd7TqdUT7PbMjrtqydgDb6b3vtkKCrqeoYiAKFhB5TMzLyK
 j6qN8+P3pbWramhHksu4qL4/N9eFaZHSyLFeA/v2g6d8+RquaNzcbV2IXT/tWb17fVxC
 U676N+ZPRFaB0tKyB2T3v8ivnpaLsdXtWivm4AAbLv/+QPi9hGKUuxHScN3PgCywEefM
 PEi+phn1n0bvgQIosWzM0yXW9iFEEDXV0+AwogK6ZIG2hSgP0bZ/LuxEZO3ZSCuk8Y+g
 5SyqVCnjQg0SdpBVdIJMrbaLR5hXTLLcC8WnJo7+MOyrfqLsSrjQq/LKSPqrALEpLkRn
 8NKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788883090; x=1789487890;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9U0azSGD0ntwc/h5lCEy4R7LeO4m6e1+YMN+Y5mfMV4=;
 b=gAHuYkRWmedQCJi35ISHOClzlICPPgxj7oUapj3eH3CjefydZhFdAqt9ilKE931Nt+
 gC+S+ezI5d7gJdAhnAMJDq4RT6JlyxVw9bF0xCKjQmBXk18ju/bDBW0cP5Z/TB9glY3X
 3mVLyEcufNdX8rR1fpYDk1kxKMicg0qiK3T43UkADfj9w6Us07sGLKGadrFo/M0mq3//
 icMu2IzGl8EFNToqm3hzIxxG7AUy5139uBapYdMjilsX6RxwGNREnEmQFKy0DCAFTgl5
 bBc/55aLV3/vcZGgsCvRhoMi4NVSl3P/mWB6JTx/4lWv97GD++uqs27S1TAQXqJD1Q/T
 Onew==
X-Forwarded-Encrypted: i=1;
 AKwUvBypY1mUP2KCWKBW062BCj5H/10orVfBT4+rFxhAXz7bui+yVLUgF3SiK/Tp4HWTZtqpbXxJUsqVcg==@nongnu.org
X-Gm-Message-State: AFuF++ltV0DjqRtNpeEyx9fwgYfD2hx/4IlQU1o0U/IAvLwqKfB+FBK3
 v1kDbU0LDDsCJdTzsWHdBAfu5WD3OqHXVb+8vz46w/gaaBQyN6uk4Lh9+Ao9AnlmxvX8+FPA6NE
 Ti5VEEvOKH9wXI9ItPA+Q0U0NWi7EHCq1ljWmqugj1V4CxV8DTqVRAb4=
X-Gm-Gg: AYBFou0Sebz5WijR1THdug+K6jnSi/6lTlTt5DM7rU0jG9YLrZio8ccsHhEWHjnEWEv
 r7Jfmz57HIWyV0X2ESLDFx8Wyc/Gde+Lp88jDcMI6en5pwwnN6DKShSU7VtJIs25KdN+WpfOiAp
 i1lYwSd8UTRp3XG5OObJTxdeRQEMoPBNyxIS1ikezaIsjOITpFpNuNJznRIFiqhiNs2OJrgZNMQ
 W4E9UR6tw+L1znzSxmlBowmJkJy/pHBXT/aI8ipHOMDmDznPpyMCsjSxyoy75VH+BuSWmtko+6+
 JOQYj+qNI4b7TytH+EVmFn0ParS7boAmg6E392QZjh3SOgU3LMVzBbUg+NIElEhlJb+jKiGGwRX
 bw9MJ5rS8+Y7LIEuyOE4yxmQgUyLU
X-Received: by 2002:a05:690c:7:b0:85e:688f:3c52 with SMTP id
 00721157ae682-871290a4c74mr101887797b3.33.1788883089642; Tue, 08 Sep 2026
 08:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260905004800.5B560C92F2@bambi.snowrabbit.org>
 <0AC93E1E-4050-4B69-BE26-6FCC99A0E886@unpredictable.fr>
 <6A1F99FD-8C96-49EA-B678-BB6997F3EF79@unpredictable.fr>
In-Reply-To: <6A1F99FD-8C96-49EA-B678-BB6997F3EF79@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 16:57:57 +0100
X-Gm-Features: AcwNN1WF-8tk50h_gGpVoC3CoogjV9lDby3pY06bDZe1DewX8HCQfPmLMOoH2Xw
Message-ID: <CAFEAcA9nfjLsz1iU1BPFaAgcPGDAXWh8uUHOZXNheG3U_Lyriw@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: implement MDCCSR_EL0 as RAZ
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Showta Ishizaki <zakinko@snowrabbit.org>, qemu-devel@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Sat, 5 Sept 2026 at 07:40, Mohamed Mediouni <mohamed@unpredictable.fr> w=
rote:
>
>
>
> > On 5. Sep 2026, at 08:37, Mohamed Mediouni <mohamed@unpredictable.fr> w=
rote:
> >
> >
> >
> >> On 5. Sep 2026, at 02:48, Showta Ishizaki <zakinko@snowrabbit.org> wro=
te:
> >>
> >>
> >> A guest that reads MDCCSR_EL0 under hvf is killed.  The register has n=
o
> >> case in hvf_sysreg_read(), so it reaches the unhandled path and hvf
> >> injects an undefined instruction:
> >>
> >>   trace_hvf_unhandled_sysreg_read(env->pc, reg, ...);
> >>   hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
> >>
> >> The TCG path does not do this.  debug_helper.c defines MDCCSR_EL0 as
> >> ARM_CP_CONST with resetvalue 0, and the comment on the neighbouring DC=
C
> >> registers gives the reason:
> >>
> >>   However we implement RAZ/WI behaviour with trapping to prevent
> >>   spurious SIGILLs if the guest OS does access them as the support
> >>   cannot be probed for.
> >>
> >> That argument holds for hvf as much as for TCG, so do the same there.
> >>
> >> The read only reaches QEMU since 37863fff59 ("hvf: arm: enable vGIC by
> >> default for virt-11.1 and later").  With -M virt,kernel-irqchip=3Doff =
the
> >> trace point does not fire at all, so before that change the register w=
as
> >> never trapped out.
> >>
> >> NetBSD/aarch64 hits this on every boot.  vmt(4) probes for the VMware
> >> backdoor, which on arm64 is a read of MDCCSR_EL0 with a magic value in
> >> x7, and the injected undefined instruction is fatal in kernel mode:
> >>
> >>   [   1.0000000] cpu0 at acpi0: unknown CPU (ID =3D 0x610f0000), id 0x=
0
> >>   [   1.0000000] panic: Trap: fatal Unknown Reason (Illegal Instructio=
n):
> >>     pc=3Dffffc000003fa318 sp=3Dffffc000010262e0 esr=3D02000000
> >>   [   1.0000000] fp ffffc000010262f0 vmt_probe() at netbsd:vmt_probe+0=
x3c
> >>   [   1.0000000] fp ffffc00001026340 vmt_match() at netbsd:vmt_match+0=
x1c
> >>
> >> The pc in the panic is the same pc the trace point reports, and the
> >> encoding it reports is MDCCSR_EL0:
> >>
> >>   hvf_unhandled_sysreg_read unhandled sysreg read at pc=3D0xffffc00000=
3fa318:
> >>     0x0020c002 (op0=3D2 op1=3D3 crn=3D0 crm=3D1 op2=3D0)
> >>
> >> With this patch the same image boots to login on -M virt -accel hvf, a=
nd
> >> the trace point does not fire.
> >>
> >> Fixes: 37863fff59e0 ("hvf: arm: enable vGIC by default for virt-11.1 a=
nd later")
> >> Signed-off-by: Showta Ishizaki <zakinko@snowrabbit.org>
> >
> > Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> *Reviewed-by
>
> Oops.
>
> Will submit this as part of a rollup series or it=E2=80=99ll be taken on =
its own.
> >> ---


Applied to target-arm.next, thanks. I've added a cc:stable tag
since we run into this with a netbsd guest.

-- PMM

