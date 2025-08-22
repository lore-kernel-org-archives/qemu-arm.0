Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FB7CA0EEB
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 15:41:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upTtT-00019C-5C; Fri, 22 Aug 2025 11:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1upTtR-00017p-5U
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:41:29 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1upTtL-0002gu-F3
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:41:28 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e951bbc14c5so1194270276.1
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755877277; x=1756482077; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I1ZhQgi/AphyZW1302/6oH7vVHGZK5GMnmcfmT3ZWOI=;
 b=qGprZYmx7y45KNgE/ZciIpoV08ihbsetBIITUg0NQksGMlIUCeeONPDqkW5jS7itc8
 j9pazTL6MSGWPuRcAdFsLLAXT8v2nDv7Tc3Y7Lhkx17eTLFy9j9NefIRkW9xoIbi4HrJ
 K7O8/FqR+7Tco1bFOqp0/gCvOEFGFyBDCaVOJnVXCtcZgoZKEn0dCTzR9nWhUZM5aA+4
 vUnmO+JyvXY9c9CO/curIV1IroVz7gSccy5N3JPNmQkCPcVzxdUx8zi4vGzwTPYlyfK9
 +8sHylEgdxFiDTlzvz+mkk9CCoGRIqSMSZJfBMv7wFyFAkVgZXFOVc5Lynubdig0njOU
 LbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755877277; x=1756482077;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I1ZhQgi/AphyZW1302/6oH7vVHGZK5GMnmcfmT3ZWOI=;
 b=HwBJXoteLSzN3rdBa86ILQeM6jeah28kAiCS3lwImHz8Ku3U/xiCD/Auyp6Th3Rd//
 CdZcID0aUzPv2aQzyPjAU4CovtZRMRmXmsawrStkEeww3ENIdTMlHyNf50TC3ATK9Jx+
 bWcB/TyA17h5SRDOakz0aeHWCN1r1PL4INUwT69BBEUhVSpVOeGUPyyI76ai+oQKuvYR
 Ag6G2TYeDDS2GS+x9xTaucLozYovm4h6b8F4LqTjelIjFnAOrHJLAhdCbdsQj+MOX6Sj
 vsdSS81/Wpl1sOpLjYKv6WL3sgA8SVaZV0obCrwh5Ru11mYxZQlnmMgYrp6aI/M5twmt
 TThg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+a0B0PXMQlmiJWFgPserPnEML2XtN6+EollByyieiN5lVnXqSl3+aA6NAqGahKRgBf1DgVNM3ow==@nongnu.org
X-Gm-Message-State: AOJu0YxPxp0J3GpYwwIv1jj70iIkFXM3flT5+wL9KM5nTHP7jI/ihyyF
 iSYTegqPlzU4Cmb+CYVNf8lumlSt0XrtV+LsnfmBgGViNodbRU41TkZmyyDb8XN2h2hM0UqH4JW
 xj8+UWrUai8QuBgbON4+HV3HJkRKp4wL1Iz0PpRN+7Q==
X-Gm-Gg: ASbGnctEBaTFJzVobURK/xsXQwn8LA8jkpOP4y38zFhalDyhoCyDDHc+11XsWWNmKlt
 TCdtDLk8iDDrLMnmNssaRKG5FvW8egiIHSpJBhOIO8u9xy2EHQXQiuahV8grQ8OkJJNpwZxnstb
 0vAuiTdi4mJ98Rm1cxsPjAhX+QJZ4SrP3/o13YWXl06F9pa+sHkLJequrEW4pghOoQY1kJPG0Vv
 jBx/5ZLKgSOykh5OKs=
X-Google-Smtp-Source: AGHT+IEm5XydLy2xXZLZy9Xo155ysVofmOZ3yFnsU6psFBKId0GHdm1zWL77jo6IfZBY01Sd9+1deN6S/0wK3jBoFBE=
X-Received: by 2002:a05:6902:c0f:b0:e94:d144:d464 with SMTP id
 3f1490d57ef6-e951c1f8857mr4064995276.0.1755877276484; Fri, 22 Aug 2025
 08:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250716095432.81923-1-luc.michel@amd.com>
 <20250716095432.81923-14-luc.michel@amd.com>
 <CAFEAcA-x_CYWPM2TeGSTLjCj==3JY_uyvfFmR=nLi4pRLw-P2Q@mail.gmail.com>
 <aKMrBdNhtqHVHRYw@XFR-LUMICHEL-L2.amd.com>
 <CAFEAcA8eop95ojfZw3YbDrWfrv1fZ5QYSmwx_oDThxMCiMMeDg@mail.gmail.com>
 <aKV21WpfZ8u054zc@XFR-LUMICHEL-L2.amd.com>
 <CAFEAcA-HoghnZLWZLX7zBD=-_mztTQoZLReQRgS5TRE91eRbxg@mail.gmail.com>
 <aKiKlKGYlc0vMPwE@XFR-LUMICHEL-L2.amd.com>
In-Reply-To: <aKiKlKGYlc0vMPwE@XFR-LUMICHEL-L2.amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Aug 2025 16:41:04 +0100
X-Gm-Features: Ac12FXxKIWDtmMuTl36wZNHvqRg4zc4JWIxO_SFadLXDEa8FH5soRM9xr6wZswg
Message-ID: <CAFEAcA9AtKx9eu-fZDCnYOziUzUFPwFeYKZ8URTbrY9uVahL1g@mail.gmail.com>
Subject: Re: [PATCH 13/48] hw/arm/xlnx-versal: VersalMap: add support for
 OR'ed IRQs
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, 22 Aug 2025 at 16:19, Luc Michel <luc.michel@amd.com> wrote:
>
> On 14:55 Thu 21 Aug     , Peter Maydell wrote:
> > On Wed, 20 Aug 2025 at 08:19, Luc Michel <luc.michel@amd.com> wrote:
> > > > It would be helpful if you could run "make check" under
> > > > the clang leak sanitizer with your patches added, to see
> > > > if it complains about anything. (Unfortunately it will
> > > > definitely complain about at least some pre-existing
> > > > leaks, I suspect.)
> > > Yes I did that before sending my series and fixed all my leaks. As you
> > > say there are some existing ones, mainly in the register API (IIRC it
> > > does create an object that is not correctly parented).
> >
> > Yeah, register_init_block() seems to be broken in two ways:
> >  (1) it calls object_initialize() rather than
> >      object_initialize_child(), so the objects won't
> >      be automatically unreffed; but it doesn't manually
> >      unref them in register_finalize_block() either
> >  (2) the TYPE_REGISTER objects are a subclass of TYPE_DEVICE,
> >      but the code never calls realize on them. This means that
> >      if you fix point (1) then you trip the assert in
> >      qdev_assert_realized_properly_cb() which checks that
> >      every TYPE_DEVICE in the QOM tree was realized...
> >
>
> I'm willing to address this in a follow-up series.

That would be great; the leaks have been around for ages, so
there's no huge rush about trying to fix them, and they're the
"object was going to stay around for the life of the simulation
anyway" kind of leak where the major reason to squash them is
just that they clutter up the output when you run ASAN...

The "need to realize the objects" part is a bit awkward, because
the current API assumes you can just call one function in your
instance_init, and I guess we'd need to turn this into "provide an
init and a realize", or else insist that you only call
register_init_block() in realize methods...

There's also basically the same problem in xlnx-versal-canfd.c
canfd_populate_regarray() which seems to be rolling its own
version of register_init_block(), and doing it with at least
one extra bug. (Maybe that could be refactored to use
register_init_block() ?)

thanks
-- PMM

