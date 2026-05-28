Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5896ACD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 10:13:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSXkG-0000bP-GU; Thu, 28 May 2026 06:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSXkA-0000aU-B5
 for qemu-arm@nongnu.org; Thu, 28 May 2026 06:13:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSXk7-0000fm-4g
 for qemu-arm@nongnu.org; Thu, 28 May 2026 06:13:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4906238c62eso39803995e9.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 03:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779963213; x=1780568013; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gbyuZgG6AkLETi0yBsD+It6Az1xMY7xBHjetWH8EGuM=;
 b=nDg68BQC7hYASlR2rhTpoZeVLKa9NG7rR/tni8Qs0LtJAnXBQA2DO9WsC2NPbn0WuI
 4hFmLY2nixiURlbcGZXitJ+K9lbE/Oduc6QEx9QOuIG2sTlmpDn5zq8H3Oul4xgTK7pG
 5N2bfAx5R+oQheUrHezkI2K1KjZoEIdY5TwAmSF34TsRqpwe07XKgGNcVbMt852NG71N
 WLL8Fbas1iYifvC0B6GBQYcsUKWuaa+E85VuRaonysz+NkjqrYteuDjCuJXzVltC7LPH
 TexpqKjcDGoimlHi6BU0ln2tW1VgoehORphPFwF6u+VhvKt9Z1k27vnmzykeZmaBu7TM
 cppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779963213; x=1780568013;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gbyuZgG6AkLETi0yBsD+It6Az1xMY7xBHjetWH8EGuM=;
 b=W0EK/V+ZBqic6IfW1IeplwHcSx0gR4ORNV8j+66mWysXl7GXIkWx7Nnc8jyA/cMpVR
 pvqiq/m4TJBSpe9wkxmGMszlQ/vvoaS7sUD57r+aGfKbvF3ONAgyCAjKbb9T6R2zWWWq
 PAPLELwI1aInhAjj4b1BZe9KXFXafLOs15VVfKgk/V+llAdNoFYOSOrLMxpPG/znKELI
 jrUbqEjK/SuiFNZxXnWiiIf3zFdJZ/m1WGsEf4Ho1hOx7WwJb47dD9uK+lzl9JDUosof
 /K8T4iOmLVp3pgQdp9XufA/OXZONJjssKf6xBFR1S7FQOeK2spvxWZFMp/i8+Ak509r8
 KsZg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0jQBs1ijXPdsRaVncxSwygQpnKpBqdPfmA7nVs0E0pAgBxHRiCGqmpE66SWiQF2R+hfP8qx7CQg==@nongnu.org
X-Gm-Message-State: AOJu0YzlIJlZsFXp1fHeTWoDP94CKwXqz/VJDxaOfkUQnO846MFcVCq0
 uIKioA9smjvU9WH002ZOiSuSIyzf/218N28+GjeNaG6swyKuS4VVnXOC1FGHODq8WeE=
X-Gm-Gg: Acq92OEMvDXaPO9SjLRWZT9H9Z+CXRtoKI7XHPNk6Ltxj52QJjdrqSlHYOp+JENuKYg
 puiXbhpyXuvUs5Fb8xLeygBv5lvaoMSul1A1Z0mdJN8LdyCOaas9G/NfcKDnezGi3dgBCI9WtNc
 ZA8GlFvSrgytAvzTw2cesulrpagbwv0nIdkOEapwU9j9XHMzrjYiOuikWsPz1SR4cnizUOfj/8f
 JLICulqeSIlofi2+RS0BufTXiyJ7LbmLyZ36HOpcPhQ2HZLFB61H5aPIyd3AW32/9woJZ3thH5I
 GnpddyT/D5zKff154EAfG4yD3AHMCpNrDZ4zrrEbglgYKgrsPepvh/V0P6N0vihTyFbsm1LyyfB
 dOHBEH8y3BWgMfWIEjqV5mlGJQYZLG8AoY49yhNNNXh6Dns3vcyuXdmTYNNCfrBWRQyGyHuvd8d
 fCynWdhSlzmde9l0FSrWKgqcsJlciBaeBEeA==
X-Received: by 2002:a05:600c:6094:b0:490:625e:bb68 with SMTP id
 5b1f17b1804b1-490625ebc14mr289953765e9.3.1779963212662; 
 Thu, 28 May 2026 03:13:32 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909235f98bsm42288825e9.1.2026.05.28.03.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 03:13:31 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AF9625F886;
 Thu, 28 May 2026 11:13:30 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Thomas Huth
 <th.huth+qemu@posteo.eu>,
 Song Gao <gaosong@loongson.cn>,  John Snow <jsnow@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Kyle Evans
 <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Cleber Rosa
 <crosa@redhat.com>,  Warner Losh <imp@bsdimp.com>,  Brad Smith
 <brad@comstyle.com>,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Max Filippov <jcmvbkbc@gmail.com>,  Brian Cain
 <brian.cain@oss.qualcomm.com>,  Fabiano Rosas <farosas@suse.de>,  Peter
 Maydell <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-arm@nongnu.org
Subject: Re: [PATCH v2 03/16] tests/Makefile.include: add binary dependency
 to run-tcg-tests-% rules
In-Reply-To: <86385e93-5425-4145-8a9f-0f72ed5de022@oss.qualcomm.com> (Pierrick
 Bouvier's message of "Wed, 27 May 2026 13:55:20 -0700")
References: <20260521131739.540157-1-alex.bennee@linaro.org>
 <20260521131739.540157-4-alex.bennee@linaro.org>
 <74e8bc86-cd81-43f9-b5cb-7e3de3bcd3d0@oss.qualcomm.com>
 <87tsrzl138.fsf@draig.linaro.org>
 <093614fb-ced1-4b15-b1e1-5da755f87237@oss.qualcomm.com>
 <87cxymec7b.fsf@draig.linaro.org>
 <5bd51a1a-4079-4073-bbd8-f0206a1ad458@oss.qualcomm.com>
 <0f73d717-1621-4c3f-9c5e-9bfdfaffb0b8@oss.qualcomm.com>
 <877bor9vor.fsf@draig.linaro.org>
 <7d58926d-a36d-430f-828e-7ebdd9cc4eb5@oss.qualcomm.com>
 <87qzmyzbut.fsf@draig.linaro.org>
 <06092208-1b56-4fea-8d92-bf035fbd0fa3@oss.qualcomm.com>
 <87fr3eyrvp.fsf@draig.linaro.org>
 <8a878679-733c-451c-8053-663a74f8d4a7@oss.qualcomm.com>
 <87a4tlz897.fsf@draig.linaro.org>
 <86385e93-5425-4145-8a9f-0f72ed5de022@oss.qualcomm.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Thu, 28 May 2026 11:13:30 +0100
Message-ID: <87o6hzx2np.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:

> On 5/26/2026 11:17 PM, Alex Benn=C3=A9e wrote:
>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>=20
<snip>
>>=20
>> What do you mean? I run check-tcg all the time.
>>=20
>> Which containers fail to build for you? The main cross-compiler one
>> (debian-all-test-cross) is built all the time.
>>
>
> Build is working out of the box now.
> However, it seems that only tests for aarch64, arm and x86_64 are run
> when using containers without having installed cross compilers.
> Maybe it's another carefully handcrafted feature of tcg Makefiles?

Works for me over here. Do you have podman or docker installed?

It's true the Makefile has to jump through some hoops to compute
TCG_TESTS_TARGETS from TCG_TESTS_WITH_COMPILERS (config-host.mak) and
CONFIGURED_TCG_TARGETS (via $(wildcard *-config-target.h)). Is that
where it fails?

As I've said before I'm not wedded to Makefiles, in fact I would look
forward to a world when I can run an individual test directly from
meson. However I'm not prepared to throw away functionality, especially
the ability of new developers/testers to build the tests without having
to install cross-compilers. That would take us back to the *before
times* when TCG tests where hardly ever run and tended to bitrot.

>>> But well, if the cross-container thing is *really* a blocker, we can
>>> just wrap build and run in a script per cross compiler, that does
>>> docker/podman build && docker/podman run and call that.
>>=20
>> We still have the remnants of that in the docker.py script although for
>> most containers we moved to invoking docker (or podman) directly.
>>
>
> Maybe that's why I encountered issues in the past, and now it works out
> of the box.

The original script attempted to deal with caching layers and the
consequences of custom USER/UID on local machines. Nowadays it is mostly
used as a basic wrapper around "probe" for the runtime and is still used
by the binfmt_misc and toolchain wrappers.

For porting to meson it might be worth just having a minimal wrapper
just for building rather than mess with it.

>> Also bear in mind the containers are also used to cross build QEMU
>> itself.=20
>>=20
>>>
>>> Now we solved the problem with system tests, and cross compilers, is
>>> there another thing that is absolutely needed from Makefiles?
>>>
>>>>> If it's not the case, then we should definitely move into the directi=
on
>>>>> of migrating all this to meson, and rely on meson tests infrastructur=
e.
>>>>>
>
> To add on top of this, I would be happy to help with the transition, but
> I want to make sure you'll accept it first, with a list of
> requirements.

For check-tcg the requirements are simple:

  - support building tests with containers
  - handle all existing tests
    - per-arch *-user and *-softmmu
      - including post test validation checks (conditional-diff-out, valida=
te-memory-counts.py, etc...)
      - per-target overrides (some targets are broken for some tests)
      - custom QEMU_OPTS for some tests
      - including sub-arch tests (e.g. x86_64 includes i386, mips64el inclu=
des mips64 etc...)
    - multiarch tests for all *-user targets
    - multiarch tests for all *-softmmu targets with boot.S
    - gdbstub tests
      - don't forget gdb feature probing for arch and arch features (e.g. G=
DB_HAS_SME_TILES)
    - record/replay tests
    - tcg plugin tests
      - modulate plugins over tests to avoid combinatorial explosion
      - filter some plugins from general testing (e.g. patch)
      - filter some plugins based on mode (e.g. syscall)
      - specific plugins with specific tests (e.g. patch, memory)
    - support build variations
      - compiler feature probing to gate tests
      - custom cflags for some tests
      - alternate cflag builds for some tests (e.g. sha512-[vector|sse|mvx|=
...])
      - build scripts (e.g. test-mmx.py)

with meson TCG_TEST_FILTER should be obsolete.

> I'm a bit tired of seeing patches in your subsystems get stuck for
> weeks, without any proper review, to finally be (re)posted again in a
> new series, blocked for more weeks, and finally reach upstream one month
> later or worse. It's truly exhausting for everyone contributing in such
> places.

What can I say - reviews are welcome. I always list what patches are
still waiting for review in the cover letter. I should also add for
testing/next I try to be extra careful that regressions don't slip in
because keeping the testing sub-system stable is important to support
things like bisection.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

