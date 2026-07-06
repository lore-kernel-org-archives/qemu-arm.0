Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0478C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 10:40:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wggjt-0002Ao-Iz; Mon, 06 Jul 2026 06:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wggjs-00024i-EE
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 06:39:48 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wggjq-0003vL-Bt
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 06:39:48 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-66666bad8beso2837470d50.3
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 03:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783334385; cv=none;
 d=google.com; s=arc-20260327;
 b=ganlED382z4KN6uTudeV+L2m1E7dchQcwONqBePOnrOPifjioLr8lF8BI+GriBBgUF
 wBffZ+QffksMB2bqm2f0qKFtyxqDMy16yIdhoTWFU3HetqWdvM0EYKKHIXWtNUiNOKdq
 VLAc6uczFdN5WFKGQ3cukbG0UPkUOQevWnK2mf4Mm+A0l8FnsfhHzvKCONhVSXrn2z+Q
 hlzSR1GJRWQuZH9+d9l/fIipORK/8+zdpErObr2c1ETKChY1cH+uRrHMEtVKAjn1pDSJ
 Vq2J+KbjVRbJEAX7LHqa6ZXDSL9rlKmUdbBwQsQwAsYh2H2Ju04mG8uXNt/Kn4I+On3R
 U40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3Mjb9mX869EBGtrKsAmi8SRPr2VxURoFvZfrQyutlSk=;
 fh=DwkEvz28rnyiY8jOr/eWWvUy51VWR98eIsoffMPlLOw=;
 b=ZeheywtELIgFVi0uUMP7wY6SQYcvxdBxe+EhH14H0nsGIoSIBH4D6oxyPG5U6+LOeE
 o30MRsUl7BXTBLJwneRBqlSb9IPcmVUDtV1MwMLG8xHp9vsHNhzoqeepKm5mHgUiHXa2
 XWb2HXT2bAwActxpMnsgAbUhKTky74oVScLvgNZKWWfyhtS5ud8zzgPb7GQdVaNc+nvP
 X6dKqC8UYSqFBsnHZUoFcmXNC/h5oHNCxwSXsSDLq3qje2mbDag+ASG/Ddg8JEYxK+Hu
 UL0d2ZqZy/n2RH7MP46XqEUpRo8FqoCAk/vPXlcSXK0IHz3y3Cbjm35z7kfFI2sZX7h4
 WR4A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783334385; x=1783939185; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Mjb9mX869EBGtrKsAmi8SRPr2VxURoFvZfrQyutlSk=;
 b=esPMjE6cqQuKr/PlBmbFM4BpfY5xaTe0hluEFhAhREeAIk8Tn9LuvMjco8zvahTz6U
 j7/nfRSuZjvuBBD6rcZKI6HcsxDsz8dHEkczY1G4QBusxaLFZKrqse7FvgLiHglWjUkt
 71jwtMDL51Xs/sheFCGwt0KhiRvY36cT3MCiPav9zmNdNtx1RW+/9ZAhlBHCQzZuZlvh
 rnt9p8jUQL3s8OxOrxIjn2byaKucQn9Ub+d87OHF8ych1htgufG0V2bluI9YjuxPS6Yu
 CDywdLPHm9hBydOV6k8r1e/IkFfKKy735KrKaMPh8H8tgmd+splU6sE8zvQQGKA54Mpn
 7FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783334385; x=1783939185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3Mjb9mX869EBGtrKsAmi8SRPr2VxURoFvZfrQyutlSk=;
 b=CmEf+vx6byiSnrhhbIKQmel1YvdKYlYQsjd5qz4hJ/qSaDPDex4FH32fVartVTtBMI
 lMchSBq/9qEgjw5g5TFgg0sk285zXsaJpiLrU2o7EhacZpHBFrQQm5xKbzVbEBIgKrmk
 frookrOM4XLrAPeWkWBhQ3uPYAog66qWFOvrzetOA2Zgq6WP+JZ1koq1QCMaOiyjSVNG
 zo890mbavuI7orKTbO4DJbuYQY5PiXEy4QzzXz1HHKDiAuls3tQ6wM57co4ZDutALc8P
 kpJG9D2Wyqz/SQfDaKrUZV0Eb0DQ2hFiqUqoKEUEnLY/+x7An0YFmNvmrCW9kJDjsRgX
 RXqg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro9gL/DOOaYm+3kD5nFfJQEJFwIaUMZ4Ys6TFLZaF8NGd92qvIJn35lcVGH0uVdz5moIqUYg5qv8g==@nongnu.org
X-Gm-Message-State: AOJu0YxBJhFfVgliEDFk74PcmLeT2zVz8BlLU1PSeablP5JUONltYnEc
 vLEyH658OioPgbNJ3wuUfQh/mOmrASf1/+tkJacaKo4OZlJBhVCTsvHxF90Zu4X8JJBOJxNjv1N
 VytPju63yWW5FjMqx3a930zZj/KyOlMxhXs/ku/9gow==
X-Gm-Gg: AfdE7cn9cLaS1vQEpB6+PQZCWYXhtticiGMDBbrAtbkuFaWhv7Ml5X2eSYsLkvuP24/
 SnyzEjN1nTs2IvdCY5ui14WyL+5oOq70nDtTfoXJId75Hv2ahK92oha7VhiA833hbfb4DDjtSMp
 lFLIx3P43aLlUnSUZya/I/TysclSCxEDAvQG7FziD7+nj9qM3MFY5Naah/H5ednpQFy3O41BmFG
 TbrXDqGby8y6KXuoe13E8FbhwpMC6ZGeNACP1x24vauEJz20n7LciIc6/gtL2POMldJD8Lnw2qi
 iu7d/TTJ9/9p+qFjJnLZkS7ToED5HWxjkpeNqHTcGLSJIYpgbvNUjzqosDCLxDzWvHc=
X-Received: by 2002:a05:690e:4083:b0:65d:dca1:ff89 with SMTP id
 956f58d0204a3-6677fa0c67fmr69497d50.12.1783334384869; Mon, 06 Jul 2026
 03:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260705224407.32464-1-gilles.grimaud@univ-lille.fr>
 <CAFEAcA9Heev=ydTzO2u3EzeF_2q7dytOF8=67qF8ZMMY6Ky2Tw@mail.gmail.com>
 <877bn8wgou.fsf@draig.linaro.org>
In-Reply-To: <877bn8wgou.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2026 11:39:33 +0100
X-Gm-Features: AVVi8Cdd5HhGK9IEOKZ6VhKNHcrP0xdbz80OPDfZcXClq3e3sKicAlLn9WjK3Vw
Message-ID: <CAFEAcA_2G-CogeB=8cFs37PNdYL88_PcsD6eNehev8A3XNH82w@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: report M-profile BKPT to gdbstub when
 attached
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Gilles Grimaud <gilles.grimaud@univ-lille.fr>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Mon, 6 Jul 2026 at 11:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Sun, 5 Jul 2026 at 23:44, Gilles Grimaud
> > <gilles.grimaud@univ-lille.fr> wrote:
> >>
> >> While working on Raspberry Pi Pico/RP2040 support, I noticed that Pico=
 SDK
> >> programs deliberately execute BKPT from _exit(). On real hardware this=
 is
> >> useful when a debug probe is attached: returning from main() stops the
> >> debugger at the program exit point.
> >>
> >> Under QEMU this currently does not behave like the debug-probe case. F=
or
> >> M-profile guests, the BKPT instruction is routed through the architect=
ural
> >> guest debug exception path. Without halting debug, that path should re=
main a
> >> guest-visible DebugMonitor exception when DebugMonitor is enabled, or =
escalate
> >> towards HardFault otherwise. This patch deliberately leaves that no-de=
bugger
> >> architectural path unchanged.
> >>
> >> The problem addressed here is the case where GDB is connected to QEMU'=
s
> >> gdbstub. In that situation, firmware that uses BKPT as a debugger stop=
 point
> >> should stop in the attached debugger. Instead, the M-profile guest cur=
rently
> >> continues down the guest exception path and may end in HardFault/locku=
p rather
> >> than reporting a clean trap to GDB.
> >>
> >> This is not specific to the RP2040 machine model. It is a generic
> >> Cortex-M/gdbstub interaction: firmware that uses BKPT as a debugger st=
op point
> >> should be reported to the attached debugger, while keeping the guest
> >> architectural exception path when no debugger is attached.

> > No other architecture, CPU or board in QEMU needs to do this,
> > so my instinct is to say that M-profile should not be special here.
> > Richard, Alex: how do we usually handle breakpoint insns for the
> > gdbstub ?
>
> For TCG guests we never insert BKPT instructions and treat the system as
> having infinite hardware breakpoints.

This isn't about gdbstub-inserted breakpoints, it's about
what happens when the guest code has a breakpoint insn in it
already (either hardcoded, or also could happen if we're running
gdb inside the guest). That's something that can happen for any
CPU type.

thanks
-- PMM

