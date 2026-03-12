Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7CD103E301
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 10:42:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0dUX-00069k-VK; Thu, 12 Mar 2026 06:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1w0dUP-00065S-3I
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 06:42:02 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1w0dUM-0004iQ-Iw
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 06:42:00 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-67bad873c3eso534157eaf.3
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 03:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773312117; cv=none;
 d=google.com; s=arc-20240605;
 b=iz9mRUobWPnfUUIlsMoOrFaKjtfjkR+LY+hg3hdZvDgVDOy4FVCv9OC93lLmKPib6L
 V8rpiz0RFsOK6VND8NLMzpP0Os2sTzMhv8XDOFBOqu9OpPR+jlCn0g5CYcORTJM2uiZ5
 lqBBwshmvDjWK+2sPRWC0mFWEMPua/Apa2J3Fn2sfGCK2t8eGgkV+iysL+71o+9h+FH1
 mevvuknMgqo7aakSjHBeQIO7l50riN926YOKzJTgbTaQo0VuzG+QdPJftBrUcxDRhmx6
 U51veoJzYHHS7bL3Hnql8FfdV1A5Zge4cx8ErgkFRUDJbEgORV7qvVv67KndWus3+rhg
 zNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Twiaz5YwQvCCXrClL7BJMAyTvcDxdAp97EtxNjxbYh4=;
 fh=czSVeN/5e81+CrxkYWIidvq7JH2y1509bDkoTZT+oTs=;
 b=C8KYpORzjZnS970j7Ao0pveTxQcXzhzMFS5VdqHaGJvJACag9isDDaKoKg/lRgFPh/
 ZiHHREDq1Gbj+cAggpNjfcFPoyM0fQUDIuHzAt/vx0eqZn/bzy28FWufrWCp2jypptN8
 aAp2pDFySLSXFavNjuc8R4U/Hpdn+9hmevq/CzhJLT2XOc5B/jeqQGFfkEzUFLSSt86N
 mMI1sV/ESTUfSe/qIqyvbFh1z9liA938Z93NrF0RVl9vGrqOVj0J2A/4ikfm3I204lXK
 rZ2ScAOjO4STjkrnpaZcw4Hx8kEX3ac+3VSbD+pbdCxrZA3e0PLxRgquDJiOqYU/rIgM
 hnKQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773312117; x=1773916917; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Twiaz5YwQvCCXrClL7BJMAyTvcDxdAp97EtxNjxbYh4=;
 b=JvNItalZX3le0K+vBiZP+6DuQEyg1xiSleh1MRIwXo0vDtk90cD2xwJDXUJxXszY3r
 eqIF43VwOm/9s0AAqQokGpCnfDape+EMGqZGjGV680STJ28Pg8w8lYG84yLcNf0cqGdF
 1tiX+ZXIFatsL5Xz0xZmpSovWzSMjjgB5AuaHuO94T4aN6uc1lqvihKlONdD5zzwtHOr
 huptzSdxyy+ROJW7P8F+woyKzKOVNg9TmEuMSbTWZ7Ekibd4XVHYmlQU3k23HQn+DN91
 x6pzAYh6n9Y9eoTV5li2YPHvlteqSgILVzkAtZiwg82WoDE9CpeWe2xPILPWyMulKwU6
 IYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773312117; x=1773916917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Twiaz5YwQvCCXrClL7BJMAyTvcDxdAp97EtxNjxbYh4=;
 b=ii0ycDpq06GWxRtN5WYRSiRmb1cL7Ja8OFJC8XHK6Zmw0xG2/1Bks1ccim5CDEt721
 ZYBWI8asL+DbX+4vCN1YETLxCJOBuOgtRkWg9CiGg+Wpwn0t/tP1nOLEDeTtegfnyxM/
 OSGf7ANq0jJ/VD2ckHimJx/Lsx8hmYDmSsOxMjMYCxAS4hrOtqtFwA6eMo/WBnuSYrKj
 qfjEandftfGnMVVIPCpsiRbT4tS87fbsYMn+wzjW5J6uG5s8vRLGpedXAuHlFR1fbr+Q
 bfXuXTTRaMWz/AvHykNqgm/IEzmFWzoRYB5yKUJqjhIKhCbFFwDVROc3LmKtWORPgO+X
 fyGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX90hjRDiJyrlnaGR6QXhmYqnFT/dvQ1vl8NstI2Yad5M71CCZJ2JMwX4+FBx5fCtvKuvfsYrrDnw==@nongnu.org
X-Gm-Message-State: AOJu0YxA69Zp4NXlVNm50RaUzdCbl2ynzV+loZvbaNDsi+bQ85KuBoSd
 riorV69/grud2SC/XEAFSJzmQ6pNqqMYJuPyRwYq0J3srIr7JicWR1SgVDpFizZgJL19fj4sXNs
 rtjGKF5Ysu77AOAt/4tDbU5EgTnqmmFWNvMVUjCWJvg==
X-Gm-Gg: ATEYQzx/CxGHyIjZwfxamygvTG8Vvb80DeOhHewLpuXjyosWOr8mpH83uk6YFwZwGVp
 rD4h/E6tXL/aWkX8ii7zwfbo8H14vHWK5Q+fFWFmufHgQWN313ggvxojPmjxFAw8Cp6xRtMl/xr
 pK0ongoM4EurPxugHwIHKvaZfUbUpcJu2gN8+/lZqB9g3/wciW8wpOsUlHPJWruGgMC1EF5bLg8
 75IfDQLwMkPz32RVTYDeqHVJbw8r1LVL0cj6Y10WZAfJIxKPNltHQN3QkWpip55Cu9RjXOiQToZ
 ynWqePQ5q+fjcp9pkg==
X-Received: by 2002:a05:6820:4deb:b0:679:e7b2:9fc2 with SMTP id
 006d021491bc7-67bc8877588mr3369800eaf.10.1773312116504; Thu, 12 Mar 2026
 03:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
 <20260306161728.2657486-2-alex.bennee@linaro.org>
 <78c8b024-6dd5-4f1b-a19c-c7a71c7acc9f@linaro.org>
 <7e6cdb4b-4cb8-4968-acce-56db2f0ee307@linaro.org>
 <97506340-18a4-4691-8017-110ab2fc76b8@linaro.org>
 <3c2bf09d-245c-4de7-b55d-37085ef24545@linaro.org>
 <c776bbc1-6021-45d0-a5ca-74e50d906f4f@linux.ibm.com>
 <1493fdd5-5254-4398-bb69-8c83eee8bef2@linaro.org>
In-Reply-To: <1493fdd5-5254-4398-bb69-8c83eee8bef2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Date: Thu, 12 Mar 2026 11:41:44 +0100
X-Gm-Features: AaiRm50JzZHcvlOUtB-EjRaqETmulbvHWdBVv8NVkYvVXr-KN5U_gGk0GQWSiBk
Message-ID: <CAPMQPEKPk1iySmCt0_Vi1=bcaG_ZkNfzYknCu14zzR2N7p-6zw@mail.gmail.com>
Subject: Re: [PATCH 1/7] tests/docker: add gdb-multiarch to all-test-cross
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=philippe.mathieu-daude@linaro.org; helo=mail-oo1-xc34.google.com
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

On Thu, 12 Mar 2026 at 11:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 12/3/26 11:11, Ilya Leoshkevich wrote:
> >
> > On 3/11/26 00:28, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 11/3/26 00:22, Pierrick Bouvier wrote:
> >>> On 3/10/26 4:07 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>> On 10/3/26 23:33, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>>> On 6/3/26 17:17, Alex Benn=C3=A9e wrote:
> >>>>>> This allows the gdb integration tests to be run as well.
> >>>>>>
> >>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>>>>> ---
> >>>>>>    tests/docker/dockerfiles/debian-all-test-cross.docker | 1 +
> >>>>>>    tests/lcitool/refresh                                 | 1 +
> >>>>>>    2 files changed, 2 insertions(+)
> >>>>>
> >>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >>>>
> >>>> I'm getting:
> >>>>
> >>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
> >>>> address 0x45001fff
> >>>> Error occurred in Python: Cannot access memory at address 0x45001fff
> >>>> qemu-hppa: QEMU: Terminated via GDBstub
> >>>> make[1]: ***
> >>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
> >>>> run-gdbstub-prot-none] Error 1
> >>>> make[1]: *** Waiting for unfinished jobs....
> >>>> qemu-hppa: QEMU: Terminated via GDBstub
> >>>> warning: Could not load shared library symbols for linux-vdso32.so.1=
.
> >>>> Do you need "set solib-search-path" or "set sysroot"?
> >>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
> >>>> run-tcg-tests-hppa-linux-user] Error 2
> >>>>
> >>>
> >>> To add more information, we tested it on GitHub, our machines and
> >>> GitLab, and for an unknown reason, it only fails on GitLab runners.
> >>
> >> Also we tested on our local Linux machines, where this test pass
> >> for all our targets ;)
> >>
> >>>
> >>> Which is unfortunate since it is where QEMU run its CI.
> >>>
> >>> Regards,
> >>> Pierrick
> >>
> > FWIW it passes on my laptop as well.
> >
> > Does this test fail only for hppa, or for other architectures as well?
>
> Have a look at these job failures:
> https://gitlab.com/philmd/qemu/-/pipelines/2376819801
>
> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
> address 0x7e085b4b1fff
> Error occurred in Python: Cannot access memory at address 0x7e085b4b1fff
> qemu-aarch64: QEMU: Terminated via GDBstub
> make[1]: ***
> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
> run-gdbstub-prot-none] Error 1
> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
> run-tcg-tests-aarch64-linux-user] Error 2
>
> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
> address 0x40802fff
> Error occurred in Python: Cannot access memory at address 0x40802fff
> qemu-arm: QEMU: Terminated via GDBstub
> make[1]: ***
> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
> run-gdbstub-prot-none] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
> run-tcg-tests-arm-linux-user] Error 2
>
> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
> address 0x45001fff
> Error occurred in Python: Cannot access memory at address 0x45001fff
> qemu-hppa: QEMU: Terminated via GDBstub
> make[1]: ***
> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
> run-gdbstub-prot-none] Error 1
> make[1]: *** Waiting for unfinished jobs....
> qemu-hppa: QEMU: Terminated via GDBstub
> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
> run-tcg-tests-hppa-linux-user] Error 2
>
> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
> address 0x7d742025efff
> Error occurred in Python: Cannot access memory at address 0x7d742025efff
> qemu-alpha: QEMU: Terminated via GDBstub
> make[1]: ***
> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
> run-gdbstub-prot-none] Error 1
> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
> run-tcg-tests-alpha-linux-user] Error 2
>
> So at least Alpha / ARM / Aarch64 / HPPA.
>
> (I haven't checked whether the test is run for other targets).
>
> We also run these on GitHub runners where the tests pass, and apparently
> when running on k8s private runner on GitLab they also pass. The problem
> is with public runner on GitLab.

Also another test we ran was to pull GitLab docker image and run the same
tests locally within that GitLab-generated image and they passed. So we
believe the issue is related to some container restriction with GitLab.

>
> > I'm asking because it may have something to do with /proc/self/mem or
> > with the architecture.
> >
>

