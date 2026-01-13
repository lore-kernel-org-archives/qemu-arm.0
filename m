Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F920D2F345
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 16:51:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfhcQ-000051-E9; Tue, 13 Jan 2026 11:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfhcN-0008W8-5A
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 11:51:43 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfhcL-0003gs-Ba
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 11:51:42 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-7926b269f03so28987657b3.2
 for <qemu-arm@nongnu.org>; Tue, 13 Jan 2026 08:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768323100; x=1768927900; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZ3xmBg/5+E5AU7vqt/R0sEj7r59u2o3tDSNNfAralE=;
 b=No1/8D3iEp9xgjwvPC8X6Bee2JY0DqphGNCSNLXVVuHn9wQJiOfbdbPvdrJ+y4iwoE
 W1UiBM/L9+8H4o7+1JqkMBj1wxb3Ce8Cad5t1HJauLnxpjyfYEyOpYdK4IJV9wnX5G35
 9oRDp1jcjURsnGGIXK7I8TuRX+KWIK2jP0+MumBruZjVHX+f+tZ3e4tGWtOE48gJCw3n
 OcvUdeKh1aiv9OZfvQsJFxa0BErgAq6uFie+2uNZISqgTlm9RrRcFFxmAJqtOeeARA5r
 /TS47153mH4glKLbytQdl4RD60e7mJAySSWxViJZz29xXS7UiF22r8E911wxqoJ62IXZ
 4hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323100; x=1768927900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jZ3xmBg/5+E5AU7vqt/R0sEj7r59u2o3tDSNNfAralE=;
 b=A46pnu5AaiIn2AJgDUdrdSE4ES33RDgzse/3DYI0CG18QvzO80jR3Jyuh43PfNMaNe
 r94xvdZCKfCTPT9ZuWSK5O2db4DmLKaiG+HG1ap4KOktiKnOpCyk63/T1JixMxsSSXf5
 0beUS+nTnSxe4jcp5/LOpnIGibj5oYNMqoKjbPV1ulZUzhKhEKY7QarzaZB+8TaDwBNy
 DXHLUINcQ3pgugHzfJ1PO4LjughQq8YXLd7IR3XDtJQa612o4V5/j5YTGAolxcyrzsD0
 vXGGm12dmfPnSvOGA1nV8ZY2nGRVSBwp7vKVF5RMLKznuQq2X3pdRQaYPyuWiMCeLe6f
 xQCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXugCdW3YjieR1qZT/tMytEm89e1fSZgqxoJS2rAsVrZExIC5nFa3+NuA4whb1WdYLUYzSeu4VNOw==@nongnu.org
X-Gm-Message-State: AOJu0YwtWfUyRIpO8TK0Ef/3YydwJCBJHiOTuLBx1wpoEarlXySnO15w
 KM0/SfpBt6j+Og+tHHEU734e2qGK/7DCRTaIWb6s8EFk0vF0kZ/cCrJDM5ehvnC8QJWPHguBYBD
 fSFUSt58nydCzFVENi2gRsy4nI27qigi47WxgaQ2xog==
X-Gm-Gg: AY/fxX538J1C/5d4xRo0CAUu0OCwY++HEgbUTzgSrv2gu+qCszb2q0vxkDjr0lfLEdy
 VbzWudk2v2RbYysjmU01zFSSTAHYb9YQfBaen4niR9YJ7viPesfm5UbcDZycxoLVAlq7kCLC2/l
 udR7IKulMgRthxMitat0QoeHf5KgmufHKBe+wQuDJPxlCcYQByGKzSa7EYQ1YC/KfiKxXdEdUvb
 iBNe2VEJ7WNHaTv4uv1baPZzExldwc5O1Ue/zTLtQDZIfffe9VsTF4hyM9olLBcRJ8GLhNGPhdX
 i6jtZwSU4ynuqcTpLfG9OF9QNiosxmUfqQ==
X-Google-Smtp-Source: AGHT+IF2rFAIWooJMvbtpXVH/O0+EyADvQ6+mWTRunfqqAp6f7S8Ger1FvKxKoZv5eVy4OI5NEn98EktOk07KlQfSSw=
X-Received: by 2002:a05:690c:e3c6:b0:788:e74:b267 with SMTP id
 00721157ae682-790b584a483mr429407617b3.65.1768323099767; Tue, 13 Jan 2026
 08:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <79bd03ad-3fc5-4d83-ab4f-55f8f840cc6c@linaro.org>
 <87wm1s83ng.fsf@draig.linaro.org>
In-Reply-To: <87wm1s83ng.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jan 2026 16:51:27 +0000
X-Gm-Features: AZwV_Qgwdi1AyXMBvtTqkVPyBmLb8O_D__UPtl40vsQaJPLBzsVOKHVIikahOWw
Message-ID: <CAFEAcA-PEY8utD0OiUmhOBJb24_znFpQwOtzS_BPgbYGJ=8cmg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] cpu_reset clean-ups for arm, sh4, mips, m68k
 and tricore
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, 
 Yoshinori Sato <yoshinori.sato@nifty.com>, Yanan Wang <wangyanan55@huawei.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Thomas Huth <huth@tuxfamily.org>, 
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Thu, 8 Jan 2026 at 16:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
> > On 8/1/26 15:34, Alex Benn=C3=A9e wrote:
> >> We tend to apply cpu_reset inconsistently throughout our various
> >> models which leads to unintended ordering dependencies. This got in
> >> the way in my last plugins series:
> >>    https://patchew.org/QEMU/20251219190849.238323-1-alex.bennee@linaro=
.org/
> >> where I needed to shuffle things around to ensure that gdb register
> >> creation was done after dependant peripherals had created their cpu
> >> interfaces.
> >> Regardless of that we do have a proper reset interface now and most
> >> architectures have moved to it. This series attempts to clean-up the
> >> remaining cases with proper qemu_register_reset() calls so reset is
> >> called when we intend to.
> >
> > Last time I was blocked at this comment:
> > https://lore.kernel.org/qemu-devel/20231128170008.57ddb03e@imammedo.use=
rs.ipa.redhat.com/
>
> From that:
>
>  --cpu_reset()  <- brings cpu to known (after reset|poweron) state
>    cpu_common_realizefn()
>        if (dev->hotplugged) {
>            cpu_synchronize_post_init(cpu);
>            cpu_resume(cpu);
>        }
>  ++cpu_reset()  <-- looks to be too late, we already told hypervisor to r=
un undefined CPU, didn't we?
>
> I would posit that the hotplug path is different as we online the CPU as
> soon as its ready. Maybe that is just special cased as:
>
>        if (dev->hotplugged) {
>            cpu_reset(cpu);
>            cpu_synchronize_post_init(cpu);
>            cpu_resume(cpu);
>        }
>
> Unless hotplug should also honour the reset tree in which case that
> logic could be moved:
>
>   void cpu_reset(CPUState *cpu)
>   {
>       DeviceState *dev =3D DEVICE(cpu);
>
>       if (!dev->hotplugged) {
>           device_cold_reset(DEVICE(cpu));
>       } else {
>           /* hotplugging implies we should know how to setup */
>           cpu_synchronize_post_init(cpu);
>       }
>       trace_cpu_reset(cpu->cpu_index);
>
>   #ifdef CONFIG_TCG
>       /*
>        * Because vCPUs get "started" before the machine is ready we often
>        * can't provide all the information plugins need during
>        * cpu_common_initfn. However the vCPU will be reset a few times
>        * before we eventually set things going giving plugins an
>        * opportunity to update things.
>        */
>       qemu_plugin_vcpu_reset_hook(cpu);
>   #endif
>   }

You don't want to special case anything in the cpu_reset()
function, because it is valid (indeed, encouraged :-)) to
reset CPU objects in ways that don't pass through it.
For instance, qemu_register_resettable(OBJECT(cpu)) is one way.

The problem with cpu_reset() is that it is not 3-phase aware,
so (like everything that calls device_cold_reset()) it will
call all 3 reset phases for the CPU at once, even in the middle
of doing a full-system 3-phase reset. It's fine for the
special case of "we are resetting nothing else except the CPU",
but there's a lot of places where we aren't using it like that.

thanks
-- PMM

