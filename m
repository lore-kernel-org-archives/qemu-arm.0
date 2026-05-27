Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1385CD5BDE
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 06:17:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wS7aG-0004dU-K4; Wed, 27 May 2026 02:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wS7a8-0004T0-Kb
 for qemu-arm@nongnu.org; Wed, 27 May 2026 02:17:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wS7a6-0004VU-CJ
 for qemu-arm@nongnu.org; Wed, 27 May 2026 02:17:32 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso71571455e9.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 23:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779862647; x=1780467447; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=muFvNJiYGBkBMOTJ+DCWFxdRk9ijjvf0RR6y8wSXTf0=;
 b=b/TYP/LPm14iTxA1QK5B0rVBPF/CdOeWYOohZy2GJcXbiLuPg9KocWys0afH56Hpf2
 jG36b91pbrLMxuVvikTcdBnU0p0c2fcttSi+5DoK52NVPHnTUAMSHw2/Eo08Joc84SMy
 AlNU5ljRe14gH4jWiDjUKurGLET6dMg5VD6IvDD+pn4dEBa4d0BSxyKhLwHY62aixYzJ
 CGZb9atQ4otNqkAyIdiQ/biBt0599JWBA5cplrlxlMowqX3k5yw3ATUHJOxt9q+pVFhh
 3RvKBgdXNZw297I1qGZ9e8tsucAEoNH9Tqw/OHvnR+CEFR6TqPCfCEF0lNFPrp4rf79V
 frzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779862647; x=1780467447;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=muFvNJiYGBkBMOTJ+DCWFxdRk9ijjvf0RR6y8wSXTf0=;
 b=n6fhDiYFr523WP31XDbmDuu2MrJY9OIDDdEnXLLqk3gzZiyR2CScVHpQr0MXt70ABq
 cD9P4wjXcuxkGZsUKFQsw7jpnJJrDJdxT4l1W9XNfSvlUEYrYB6Wygmzrp+yOU1OcvcV
 1PHHn7PTnHOsZnRY6Iem3jp18uqo24geuYqxe3/QrMXjmn/MtcSI8bJZfndhw4qcWFfH
 w4TC+oDMPOi+QxsB1NpBv68GzK+Rw5GflD0S10orYRG+47GXKyosXwU1U3GJo3S6gsYc
 46OHHtF3ooeol1/skTPKDFPk2f1JYfuXKS3Ol4xLaN/MtpQ6ios/xRSGvLEAHVZWo56+
 cTJw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+a1zhxBecyAmkaEP64rJGH0Nscv0/06gn7E8LmWtReYmuDtGqoZ+zt4Pn0ZxWtWl4pnGzOhRcOVw==@nongnu.org
X-Gm-Message-State: AOJu0YyEkAt2TIQQvkFlJM90zlNE0iakouiKsO53lR7EH6wIMWXD+mGh
 +/NhTdaUm4v61/QOkLJAjZxpPD8JkEhyQa/sySeP4hUz5amoneCUv2HnYwg3SUT4aXY=
X-Gm-Gg: Acq92OEEmHgsqJULN6ygULCpqq4sjB4hk0HIpr0LrDwiws8lssFRK7zq7GCVTgvC7oA
 cLF90bcOXnI1s3vlD20ia+gH44kgOfIwkAm/SXWha49bouKaZK9ROWDUy85tZP52XZKRB6rS3Li
 LawXeU2+2AyDrbtM53ziMTlJuHlzzzwGsqE0DYRlPHdi5uwQkONeGpzihMG/dVnkUNV2srU9zao
 IEVBFGfbP3E/lQgDLPhzt/gTXoFecGq3BokcvZz35r7Zlb+JOR+Hcrf7138hIh3AWa6qp2QTqQG
 z0bxhI5lmdfngdh3osC2NIKjSGygSM55f94TjdXTH8aSrh5ZGIK3bHs7Qod2xpxXjg1MCnMCmTy
 L3f+k4w/z8R9oyUe4Y2P7HvCmQZ3oN/JRZqL6vDBXHZRY1wCGNBtbf9ey8XYn/zKovOshs0rSkW
 KsOfB6GWu36yPDt9ifUagQj60=
X-Received: by 2002:a05:600c:3b02:b0:48a:5821:5ff2 with SMTP id
 5b1f17b1804b1-490425aa70fmr366042845e9.8.1779862646654; 
 Tue, 26 May 2026 23:17:26 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904526c926sm669073835e9.1.2026.05.26.23.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 23:17:25 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6109A5F81C;
 Wed, 27 May 2026 07:17:24 +0100 (BST)
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
In-Reply-To: <8a878679-733c-451c-8053-663a74f8d4a7@oss.qualcomm.com> (Pierrick
 Bouvier's message of "Tue, 26 May 2026 11:07:50 -0700")
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
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Wed, 27 May 2026 07:17:24 +0100
Message-ID: <87a4tlz897.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

> On 5/26/2026 10:58 AM, Alex Benn=C3=A9e wrote:
>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>=20
>>> On 5/26/2026 3:47 AM, Alex Benn=C3=A9e wrote:
>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>
>>>>> On 5/25/2026 11:43 AM, Alex Benn=C3=A9e wrote:
>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>
>>>>>>> On 5/25/2026 8:46 AM, Pierrick Bouvier wrote:
>>>>>>>> On 5/23/2026 1:56 AM, Alex Benn=C3=A9e wrote:
>>>>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>>>>
>>>>>>>>>> On 5/22/2026 12:02 PM, Alex Benn=C3=A9e wrote:
>>>>>>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>>>>>>
>>>>>>>>>>>> On 5/21/2026 6:17 AM, Alex Benn=C3=A9e wrote:
<snip>
>>>
>>> We'll need to remove the mechanic to build cross compilers containers.
>>> In my experience, it's clunky anyway and fails when building several
>>> from scratch. Try it yourself after cleaning your docker/podman images.
>>> It's just better and simpler to expect user to install cross
>>> compilers.
>>=20
>> That would loose a bunch of functionality and doesn't help users running
>> anything that isn't Debian.
>>
>
> Out of fedora, who does it exclude?

RHEL, CentOS, SuSE

The cross compiler situation may have improved since - Debian has always
been ahead of the curve in its multi-arch support.

> We can still provide a fat debian container with all cross compilers
> embedded for people who don't run ubuntu/debian.
>
>>> The only thing that prevented me to implement this before is that I
>>> didn't know if concerned maintainers would accept it, or just hold onto
>>> the precious handcrafted Makefiles, into which so much energy and time
>>> has been spent.
>>=20
>> There is no desire to hold onto Makefiles, but I do want to keep the
>> same capabilities as the current system. The driver for containerising
>> the compilers was that setting up cross compilers is a barrier to
>> contributors who want to be able to add and build tests.
>>
>
> Personally, this "smart" layer has been a barrier even on Debian, since
> by default it tries to build them, and it fails from scratch.
> Give it a try by purging your docker images, and run a make check-tcg
> -j$(nproc). I doubt anyone is really running check-tcg with this in real
> life.

What do you mean? I run check-tcg all the time.

Which containers fail to build for you? The main cross-compiler one
(debian-all-test-cross) is built all the time.

> But well, if the cross-container thing is *really* a blocker, we can
> just wrap build and run in a script per cross compiler, that does
> docker/podman build && docker/podman run and call that.

We still have the remnants of that in the docker.py script although for
most containers we moved to invoking docker (or podman) directly.

Also bear in mind the containers are also used to cross build QEMU
itself.=20

>
> Now we solved the problem with system tests, and cross compilers, is
> there another thing that is absolutely needed from Makefiles?
>
>>> If it's not the case, then we should definitely move into the direction
>>> of migrating all this to meson, and rely on meson tests infrastructure.
>>>
>>> Regards,
>>> Pierrick
>>=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

