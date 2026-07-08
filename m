Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24506C43602
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 09:00:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whO8m-00076f-UL; Wed, 08 Jul 2026 05:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1whO8l-00076E-VK
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 05:00:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1whO8j-0003P0-PI
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 05:00:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-472326ca506so276521f8f.2
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783501220; x=1784106020; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=997tmvnX6IgOYPteIIv/zG7YztiHCTJLZEAuy5rjumc=;
 b=r2tfeTQFvt+BSYlvQuo2/35dvS2GvojW0ys7RKS5vIGGHKhAZhQ1jv1WROAoalmGqh
 zhLqSQcmiDyOb9gDr7eTxNCVL3nLhPy+HtbdIAdZn2tiTxdcXlknYexN9CNpwTkB0YHH
 Ye3dYOXWwog/kX1NHGD2PQXMUnCc1qL90tRSiSBg6ehwCHnJKkg8o+mH3V1StXIMz9aE
 z8W/MCj3ChXRtwa2NIsfpEViexSbxI9rh3WNN31jRq26H54aHbZNHarWIumiPxLjAyTy
 uVGjfYyrTf6l2j1kUjYO2W/GNaVjGysvJw/n/HULy25Cq6wL9d9TmldOhQXg4FduNZQ1
 yR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783501220; x=1784106020;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=997tmvnX6IgOYPteIIv/zG7YztiHCTJLZEAuy5rjumc=;
 b=TFF5lkUmN0/H/+m9nhpS8oqJ7g5fTLqChMc+pV89SvaBLRgmeKPHDNK3UDYCht63fF
 hNq6cFzQ1LEOatUdIrIX2jDhAwPPwikbfv+fSItrn0wL9v1SpM2/u5pJ+mj8V3rD7aac
 weaO8Yp6AWstcHUV+vT9ia0qHktMxv1953+QMeIt1Yc7oV8wSmkzA1MkkV6hcu/jMFf7
 WiBMd86QSsYCLniRllRIufoUcNjWTg0dXiJoM16MZ7DAcp8lOSax8EFze1jUo5miWR3Z
 3pD832d5h4K59Dh/8u2yVVrMLBQq+PjBszw4MIr/tTPbJlU2CtoHzY/V+iQ0DlILrrAd
 btcA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrYcvPNHSPnzLkM4owisv+Gk88+PvNRsAu/aM9x0FQQtWSbTa37yW2yL7SQxPf7cNhGBlpg8iL4gA==@nongnu.org
X-Gm-Message-State: AOJu0YyGShTJblxhc58DR9REirFlah2orVpEMY0n/1nN8ukiQH6uFNWG
 VU2i7/QU6afR8NHPTzHMuu5DaG7+01I0lC4qpGlqwq9z78GQGpPVTsBuastz+svq4n8=
X-Gm-Gg: AfdE7cnbStlRcbK206i8f0f4ugon8XPVaC32mWNrIatLC2i4kBOym2MyUMAwrj8rjKS
 +cqQVHdtUs49vnrib3SkO8W6iCWs3CtHWsryh8tq8vYJgjmHH5M5xWcL+vyOmM7vYiLYWYOpIS1
 KhE23LCCSyNRqxvJ4YmiL02oBELbrTvaeCjJvLpm85dFLwn1YpGKjEHGDXH9ISFNr9lAiliowb/
 d85Csfc4pBXvGmuS1hi9UseVebaX+1gy7dOeXwH9o+QvqMPapuLaDn8sMtAcGfSYaVlooi8CV6B
 2QUKT4McSqmnAJbEkCzUgwWpQ1+v7Ha6mpcwUt1XZ3HXH5t0O67hjQH3mO7173AQHwl1wOam2f5
 k3fmtuf56AoA2ZWozQwk4RuWEzmWWnLaF6v19q4MOvibr5yMDxW+5zKSiCQ64zc0XCjoS8N2ziW
 k63LYDDZgnwz9k
X-Received: by 2002:a05:6000:41fe:b0:473:3241:26a4 with SMTP id
 ffacd0b85a97d-47df071e158mr1475669f8f.12.1783501219428; 
 Wed, 08 Jul 2026 02:00:19 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039af67sm47425569f8f.17.2026.07.08.02.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 02:00:18 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6CDEB5F8F3;
 Wed, 08 Jul 2026 10:00:17 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: gilles grimaud <gilles.grimaud@univ-lille.fr>
Cc: Richard Henderson <richard.henderson@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [RFC PATCH] target/arm: report M-profile BKPT to gdbstub when
 attached
In-Reply-To: <74CAA1D6-D549-4063-A8D2-98818ED474C9@univ-lille.fr> (gilles
 grimaud's message of "Tue, 7 Jul 2026 19:43:54 +0200")
References: <20260705224407.32464-1-gilles.grimaud@univ-lille.fr>
 <CAFEAcA9Heev=ydTzO2u3EzeF_2q7dytOF8=67qF8ZMMY6Ky2Tw@mail.gmail.com>
 <a14481eb-9eed-43c0-a29c-187798f7f769@linaro.org>
 <74CAA1D6-D549-4063-A8D2-98818ED474C9@univ-lille.fr>
User-Agent: mu4e 1.14.2; emacs 30.1
Date: Wed, 08 Jul 2026 10:00:17 +0100
Message-ID: <87bjchvota.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

gilles grimaud <gilles.grimaud@univ-lille.fr> writes:

> Thanks for the comments.
>
> Since this is an RFC, this is exactly the kind of guidance I=E2=80=99m lo=
oking for.
> I am new to QEMU, so I am mainly trying to understand what the right model
> should be if this patch is not the right approach.
>
> To clarify the motivation: I hit this while working on RP2040/Pico suppor=
t,
> but I do not think the issue is RP2040-specific. The Pico SDK uses a
> breakpoint instruction as part of its normal exit/debug path. On Arm
> M-profile this is BKPT; on RP2350/RISC-V the analogous pattern use
> EBREAK.
>
> So the practical question for me is how QEMU should model firmware that
> deliberately executes a breakpoint instruction as a debugger stop point t=
hrough
> The J-TAG.
>
> For Arm M-profile, my understanding is that BKPT can be consumed by the
> debug system when an external debugger is present, otherwise it follows t=
he
> architectural guest exception path. I was led to this interpretation part=
ly
> by QEMU's own gdbstub documentation, which describes the gdbstub as a
> low-level debugging facility in the same general space as JTAG-style
> debugging.
>
> That led me to the proposed rule:
>
>   M-profile guest BKPT + attached QEMU gdbstub client:
>       report a stop to the gdbstub
>
>   otherwise:
>       keep the existing architectural guest-visible path
>
> I understand Peter's point that guest breakpoint instructions may also be
> part of a guest-visible debugging mechanism, for example with a debugger
> running inside the guest. This RFC was not trying to solve that broader
> problem.
>
> If there is a better way to emulate this bare-metal firmware pattern,
> ideally without touching QEMU's normal execution path, I would be very
> happy to drop this RFC and try that instead.

Not for breakpoints but this is the sort of stuff that semihosting is
meant to deal with. On real hardware your code can make a semihosting
request and the jtag attached debugger will then service it for you. We
do support this in the gdbstub.

  https://qemu.readthedocs.io/en/master/about/emulation.html#semihosting

>
> Thanks again for your time,
> Gilles
>
>  Le 7 juil. 2026 =C3=A0 19:27, Richard Henderson <richard.henderson@linar=
o.org> a =C3=A9crit :
>
>  On 7/6/26 02:21, Peter Maydell wrote:
>
>  On Sun, 5 Jul 2026 at 23:44, Gilles Grimaud
>  <gilles.grimaud@univ-lille.fr> wrote:
>
>  While working on Raspberry Pi Pico/RP2040 support, I noticed that Pico S=
DK
>  programs deliberately execute BKPT from _exit(). On real hardware this is
>  useful when a debug probe is attached: returning from main() stops the
>  debugger at the program exit point.
>
>  Under QEMU this currently does not behave like the debug-probe case. For
>  M-profile guests, the BKPT instruction is routed through the architectur=
al
>  guest debug exception path. Without halting debug, that path should rema=
in a
>  guest-visible DebugMonitor exception when DebugMonitor is enabled, or es=
calate
>  towards HardFault otherwise. This patch deliberately leaves that no-debu=
gger
>  architectural path unchanged.
>
>  The problem addressed here is the case where GDB is connected to QEMU's
>  gdbstub. In that situation, firmware that uses BKPT as a debugger stop p=
oint
>  should stop in the attached debugger. Instead, the M-profile guest curre=
ntly
>  continues down the guest exception path and may end in HardFault/lockup =
rather
>  than reporting a clean trap to GDB.
>
>  This is not specific to the RP2040 machine model. It is a generic
>  Cortex-M/gdbstub interaction: firmware that uses BKPT as a debugger stop=
 point
>  should be reported to the attached debugger, while keeping the guest
>  architectural exception path when no debugger is attached.
>
>  Expose a small gdbstub helper to test whether a CPU is visible to an att=
ached
>  debugger. When an M-profile BKPT instruction is executed with such a deb=
ugger
>  attached, leave the translated block with EXCP_DEBUG so the existing gdb=
stub
>  stop path reports a trap to GDB.
>
>  Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
>  ---
>   gdbstub/gdbstub.c      | 13 ++++++++++++-
>   include/exec/gdbstub.h |  6 ++++++
>   target/arm/tcg/debug.c |  9 +++++++++
>   3 files changed, 27 insertions(+), 1 deletion(-)
>
>  diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>  index c3c944e965..9f259fc005 100644
>  --- a/gdbstub/gdbstub.c
>  +++ b/gdbstub/gdbstub.c
>  @@ -237,6 +237,18 @@ static GDBProcess *gdb_get_cpu_process(CPUState *cp=
u)
>       return gdb_get_process(gdb_get_cpu_pid(cpu));
>   }
>
>  +bool gdb_cpu_is_attached(CPUState *cpu)
>  +{
>  +    GDBProcess *process;
>  +
>  +    if (!gdbserver_state.init || !cpu) {
>  +        return false;
>  +    }
>  +
>  +    process =3D gdb_get_cpu_process(cpu);
>  +    return process && process->attached;
>  +}
>
>  No other architecture, CPU or board in QEMU needs to do this,
>  so my instinct is to say that M-profile should not be special here.
>  Richard, Alex: how do we usually handle breakpoint insns for the
>  gdbstub ?
>
>  We handle them via CPUBreakpoint structures; we never inject code change=
s.
>
>  The patch description explains the confusion: this is attempting to repl=
icate a feature of the Raspberry Pi Pico SDK, wherein a
>  guest BPKT really is trapped by an external debugger.
>
>  The only question is whether we want to follow that, and I suspect the a=
nswer is no.
>
>  r~

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

