Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EC7CA0EF8
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 15:12:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up6xN-0004FC-Gr; Thu, 21 Aug 2025 11:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1up6mZ-0000c6-1S
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 11:00:51 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1up6mW-0001pw-G9
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 11:00:50 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A7CAA3F7C4
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1755788444;
 bh=wIDXLb4yiVHHoMi6gEAZIdQ93SCz4Eim2SNd9VhToLA=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=BL0ynwoyTcV1QEDv/f6bOkYyxX5noUSN2zAG+SnT5aNnsPjfnOj3UouZXzHFLGiD8
 6IwspezomL51geJrl4gT+sxi2eui8N2hRsHNC9rHstG8ugqqcoP9aRtQKRNQeYsIdE
 iemLOvcxOnTElxKyqeDBECRLArbcGMGVPzoPPFKLpzEMOyWbSUlenFBgQWoJ0pYGUv
 FA/fI8xfPwWz7qNS8Q+WvWEdkbRtXy4TCoU9fUGQ/tJ5tIDeRovN9XcK9wcbB3CBYK
 dRCBiemU+j5Mz5yBObDaHHxyWK7u3pCYBnX4L0QekQ5JRc/aTYhS9rlyfBViF2Wwrq
 vcFKEd5MyvTVA==
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-61a2c95124cso923482a12.3
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 08:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755788444; x=1756393244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wIDXLb4yiVHHoMi6gEAZIdQ93SCz4Eim2SNd9VhToLA=;
 b=poPpq2KacXU3vmMgBy5WDMEACpZMwM5WAHvz9jQYi8t2527CogG5WLvw02ClNcSv5T
 4D8ttxv2WWylhzkAS3FH7eUXh2gchoDJoPZeaq9r6Rl3itC2RX1ZkopjxROgKmhr3Mji
 ZQnQPbjbYHMUcL34Q2XdRJJFORwhe/DiPyU7o+5I4mr+sYUr6R2bZJzMpZ8RRcMSJyoX
 xhojz34T06M6n4A/OV+iL5VUPjQKgXc7juaLVin69x6kuMWsfBCyjg/fO0KxtMfem4lb
 n9prfldeH4lL/ibpAhk6Rc5v5Gyl3+c7KEy8il4m5ZbIOfgR8b/BOwLttnjNvs6anFZq
 bBaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVJiCFMWWNfHkeJ08l4mVi26q1iVG2KTge1fOi/N/iMVO8ww7dw46norIwtXqAMp7D19bt/yXefw==@nongnu.org
X-Gm-Message-State: AOJu0YwVXsWQyu1L34WwSYDpK90gMdRZ/CepISY1l6s4kPminRvylVN9
 XeTcgqR/Sh6HlVQCn7MI7GVmqYtqQnsfwKVfznSlESNr6R2a2gCiMlwxeStaepeKFfFtHlgnTDA
 Uwf42MQx4HewzZi8Ojl9h/bQTiy9E+Tyuv6yHpQzM7QWLUBWhTJXHvQ0er+rjpd4vRn/uOm8dsR
 jnwdD8MSkIcfUiCU7YDNgcWU0bLGMVUh62SnAn6hK8/Vc2
X-Gm-Gg: ASbGncv8x26NzJa2zxnrXvD21yZJ/RIjxroIOjWuRili7kXAivHGugKrFCsjag5pQuW
 cb4ZfPFeJAxC9IYHH7+WIjCeFNjhzvo4u5I+kWQnS9mFtrr2Wl+lspGto3lfnNXS0Al6cH3t8V4
 x2VMOBmdK+i3nxOYp5eGmc
X-Received: by 2002:a05:6402:1d4e:b0:618:3a9d:53da with SMTP id
 4fb4d7f45d1cf-61bf8743ba2mr2515717a12.31.1755788444167; 
 Thu, 21 Aug 2025 08:00:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHo72/F6TZprEMSJRAYGSF+CUBdNAOIu/7sWErrSQrh/DcauK6ixiOjzfXlRSU5KQZw++EwHRfpTcIqJf+X7k=
X-Received: by 2002:a05:6402:1d4e:b0:618:3a9d:53da with SMTP id
 4fb4d7f45d1cf-61bf8743ba2mr2515683a12.31.1755788443659; Thu, 21 Aug 2025
 08:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAATJJ0K6coKjwwmkzaWP7dzQHLsEoL3rkU95T69rxZ6fdbnXqg@mail.gmail.com>
 <877bywlpzi.fsf@draig.linaro.org>
In-Reply-To: <877bywlpzi.fsf@draig.linaro.org>
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date: Thu, 21 Aug 2025 17:00:16 +0200
X-Gm-Features: Ac12FXxDQubVF5f36DOwIwyV7EwXMcW8S5vggDYGxvmzICFtbIV6YI8pIkGfC6c
Message-ID: <CAATJJ0J3w_QbHuyAtCqNN2_TtQPntBPEzOgaNOSq13Jrj0WdKw@mail.gmail.com>
Subject: Re: snek testsuite breaks in 10.1 for qemu-system-arm on armhf
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=christian.ehrhardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Aug 2025 11:12:00 -0400
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

On Thu, Aug 21, 2025 at 4:16=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> Christian Ehrhardt <christian.ehrhardt@canonical.com> writes:
>
> (adding qemu-arm and Richard to the CC)
>
> > Hi,
> > Debian and Ubuntu run the self tests of snek as integration tests like:
> >
> > `make SNEK_NATIVE=3D/usr/bin/snek SNEK_ARM=3D/usr/share/snek/snek-arm
> > SNEK_RISCV=3D/usr/share/snek/snek-riscv -C test check`
> >
> > Those tests recently generated signal by failing in the arm emulation
> > tests with `qemu-system-arm` - full log [1].
> >
> > ```
> > 224s Running test pass-precedence.py.
> > 224s     pass python3
> > 224s     pass snek
> > 224s pass-precedence.py:72 Syntax error at "".
> > 224s     ***************** snek-arm fail *********************
> > 224s     pass snek-riscv
> > ```
> >
> > 14 tests failed, but all with quite similar signatures.
> >
> > But that only happens when executed on armhf, the other host
> > architectures are all happy [2].
> >
> > I've separated the test and ran a git bisect on qemu 10.0 -> 10.1 as
> > somewhere here is the trigger.
> > That worked fine and identified this change [3].
>
> This is:
>
>   tcg: Convert deposit to TCGOutOpDeposit
>
>   Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>   Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> > I must admit, I was able to debug it until here, but I can't see how
> > these snek test failures could be caused by that change.
> > And yes - arm emulation on an armhf platform isn't the most common
> > scenario.
>
> Are any of your other hosts 32 bit?

No, only i386 but that does not have all dependencies and packages to
execute it.





> >
> > I can't predict if there is anything wrong in snek which now is
> > treated differently by qemu to trigger this or if snek is all fine and
> > qemu broken something - Therefore I've also reported it to snek [4].
> >
> > The tracking of the initial finding in Ubuntu is here if you want to
> > see more about how this commit was identified [5].
> >
> > [1]: https://autopkgtest.ubuntu.com/results/autopkgtest-questing/questi=
ng/armhf/s/snek/20250818_045020_246a4@/log.gz
> > [2]: https://autopkgtest.ubuntu.com/packages/s/snek
> > [3]: https://salsa.debian.org/qemu-team/qemu/-/commit/cf4905c03135f1181=
e86c618426f8d6c703b38c0
> > [4]: https://github.com/keith-packard/snek/issues/103
> > [5]: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2121124
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro



--=20
Christian Ehrhardt
Director of Engineering, Ubuntu Server
Canonical Ltd

