Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C708CFF8875
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 19:26:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIAXV-0005zj-E9; Wed, 29 Apr 2026 15:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1wIAXQ-0005yK-0x
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 15:25:37 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1wIAXO-0007J8-1w
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 15:25:35 -0400
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-47c3b830c99so124339b6e.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 12:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777490732; cv=none;
 d=google.com; s=arc-20240605;
 b=A+D7DKvc0KW6LZmrVtJgwe6xGizJOUvmSsfqcP0Ue/dITx4gjaoD7XOEYoNZDFGpMM
 xPXL5oLFqauY+JFXHjlbZFTXTnf0wsBQdazmI413ptU09oMh16nxzyeAu8v9TP93ByY5
 er87X7RBBa3itlTFB4guGCbN8wN2mRUl+t9cznl0kMTu5J49ufKbQl+hcjZkEnCgKyXl
 3OPuAKXQ+oTeNurV6INmC0RKd1eR8xWv/dL+0RrB836vckJwrP1kt40qfj/GSD1DmnwP
 xvMnN1H5q/lCn5dY/jRtYA5U0PFRrIDmYwbQsbSc1rqVpVgpcwTMfv7WpHTiUOFfZUix
 L/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PCfJVk5QzJgss4BpyoIAnlfL4C3sSPEnkOOMEArHUC4=;
 fh=BXx45KI7z6nO6T+AQuKVm05rLEJizDyKDVEnEZhcBpA=;
 b=SC2ANkWyyh96+sGTzedK6Si/5GgPj32CeUmoRTfEZLgrVHMqgBfMZd/Hq2/fHVJZ5O
 BCqmidycg/zzIJ29Xq7oArU1N7AB1sC6vSe2Nzyh9e1P2OeRkVn5o++jJSCgk4jOmdux
 VLXoFbV7jhDAMCHZjpbk56i6T0JOOtWQpb5idm0AdesunJPSpHi4LCRHOdt8JuAjoMO4
 /rm+ZbU/WbSdNzsCWm1WpO8BwziiX8Gg5VMLY96aJZkNXLu3/mQt97uYj0u7lIPGTokV
 wSW9y4hVR3uyTVbdvDfU2uqzLCl6KksLnq6KlHwZNOU+yL7jJ8SWn+FYARyRXqnW1tbX
 l0Xg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777490732; x=1778095532; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCfJVk5QzJgss4BpyoIAnlfL4C3sSPEnkOOMEArHUC4=;
 b=r+doJxrAlWrRoqN1eb5myZ3ZwJ9r2Wplkwd7hVYorPydJKryiF6db3SwzFOmytPk6d
 Ghe6mGL1s9cUTjn8rrsfNp6Y7QNhcgIHjw0kygFgk5s/bnVIXomonOGgG3PNYveAzmpc
 wjWuXX6sxr5Ariw5LPLW/uWDmZTin9HIXuW2od9LWaXxUrDmh/99Kfhr3P+b0z36Kmr+
 51vFYlot22VzfaHItoFXuGNhWSh2xBcM9olGYFXpMpzyY3wl/9Du4/V60YBInRVjbl9X
 6bG61gA81mLiSv/Edwp791oGECvF7F3kWpPLT/7YKTBBtf7Nch9BzQBGjRIGSU1HJ1Nx
 nEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777490732; x=1778095532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PCfJVk5QzJgss4BpyoIAnlfL4C3sSPEnkOOMEArHUC4=;
 b=EZ0RMAMVWXaP5Ro7/BbbgOAFABP3RFL/Qp3TqGHV1KAhNOr/i9Im/IAa5AgSnyIHbQ
 NKGbDJe8fxTnd//jpWdUWsjhhmkvA/3FLjlKhP7OBPFGIwqnvk4QLBUseJMBRxk4UP1H
 4gJI6DCJlhB4RSr6nmEQJyga/hazHpeqgDWIasUGQliBItR00rpZMw058fK3ghD8Q5x8
 lBFMfchmup5JKNBLM/cW+1m7rAQ/V838SBTzQ702Poa0Mi6LK4UtBq1AT4gLM0Xmx8fY
 cnaRKtyHoyN743OaWVSe+pVnKEfTesN6GEb3ZBy1kS9DE577n5nKDcexlsg0eNa25Dym
 WONg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8azwC8oIW9DHM+Hxvsy+VRKREq4ULasdLwdbOmC2x0i0AGVizMmw+l71EgBufQZ+2tOCMV03taAQ==@nongnu.org
X-Gm-Message-State: AOJu0YwprYbz7VBbPwbx5DxZKGeZhazDLjf0QS3Kf6cfxhOQuTZnOUAS
 tEMX3Ng+p2NDe3eqyVEZrvkEhk4lpMNJv9LmzTXyDBcPoxX0L+suZBgZQSS3CXG6VAlzcm5uOdg
 rWpM8+ONRW7gS5W9qhKNt6EeWCSLilTA=
X-Gm-Gg: AeBDieuZP+k4r9qBLkJXNVaelhdMXFPuTC5fT8ALUuYPxqBbTFhtXMoJEPlJtXvf+bZ
 c5cV8TfmuaOf9CZRacJaf7Tr6HZrjKvHOY5O17dvwYri9K16DMNzbEGKwa/LQSdl+G7UZqVqmeA
 AX6YFpGJ4uz0XORBBdGg15y1xL4JbxlOGjk/vwdeTacHTK0g7ddTVV3enOk7JITyKpjNhJcvU46
 H4WQ1Ev69V3PB7TG8mhMu9A174HFIaUjM1yNPn0UTKeo+eRRiyLmdKRtQaSZZTvdaW2UaB1lvem
 qLUOByujZF8GI4UV/Q==
X-Received: by 2002:a05:6808:d49:b0:479:fbdb:4f85 with SMTP id
 5614622812f47-47c5f19c0f1mr85724b6e.0.1777490732289; Wed, 29 Apr 2026
 12:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAN-aV1EiKRh-Zpb9=77rXYPD2uT7HZmeNfvVW-wAToT+gaVC=A@mail.gmail.com>
 <87v7dvgw58.fsf@pond.sub.org>
 <CAN-aV1ERB-vdvMyRuNo2tog9-EPPyCunXJkk-kC=DkX-kU6VCQ@mail.gmail.com>
In-Reply-To: <CAN-aV1ERB-vdvMyRuNo2tog9-EPPyCunXJkk-kC=DkX-kU6VCQ@mail.gmail.com>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Wed, 29 Apr 2026 21:25:21 +0200
X-Gm-Features: AVHnY4I9GvHD5cXveSzznX9tl0o9wlXsWSg_zblf_NvEG_gfuitDjsq989ddjyQ
Message-ID: <CAN-aV1HDZfoJv3OCm9_f3epNtvvr5CrvB-1Fi4y7jGLwF3Xx7g@mail.gmail.com>
Subject: Re: Question on preferred location for QEMU sample projects
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, artem_mygaiev@epam.com, 
 takahiro.nakata.wr@renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-oi1-x230.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Apr 13, 2026 at 4:04=E2=80=AFPM Ruslan Ruslichenko
<ruslichenko.r@gmail.com> wrote:
>
> On Mon, Apr 13, 2026 at 9:25=E2=80=AFAM Markus Armbruster <armbru@redhat.=
com> wrote:
> >
> > Ruslan Ruslichenko <ruslichenko.r@gmail.com> writes:
> >
> > > Hi everyone,
> > >
> > > We are currently preparing the v2 patch series for the Remote-Port
> > > Co-simulation protocol for interfacing with SystemC modules. The firs=
t
> > > revision was here:
> > > https://lists.nongnu.org/archive/html/qemu-devel/2026-02/msg01760.htm=
l.
> > >
> > > As part of this submission, we would like to publish a sample project
> > > serving as a demonstration of how to connect a QEMU Remote-Port
> > > frontend to a SystemC backend.
> > >
> > > The sample project implements a standard SystemC IP core and uses
> > > several external components such as:
> > > - libsystemctlm-soc: https://github.com/Xilinx/libsystemctlm-soc
> > > - VCML Library: https://github.com/machineware-gmbh/vcml
> > > - SystemC Library: https://github.com/accellera-official/systemc
> > >
> > > We have a question regarding the location for this kind of project.
> > > Could you please suggest if there is a preferred location or some
> > > standard practice for hosting such a sample project?
> >
> > Location within the QEMU source tree?
> >
>
> Hello Markus,
>
> Yes, it would be good to include this project within the QEMU source tree=
.
> To build the project, the mentioned SystemC, libsystemctlm-soc and
> VCML libraries and their specific dependencies need to be built and
> installed separately.
> Would this approach be acceptable?
>
> Alternatively, is there an auxiliary repository within the QEMU
> infrastructure that is better suited for these types of sample
> projects,
> perhaps somewhere under https://gitlab.com/qemu-project?
>
> --
> BR,
> Ruslan

Hello Markus,

Do you have any thoughts on the preferred location for this sample project?

Best regards,
Ruslan

