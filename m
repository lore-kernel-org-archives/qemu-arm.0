Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C639DCE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 10:38:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKwcQ-0002iM-DD; Mon, 17 Nov 2025 05:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKwcP-0002hz-2g
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 05:37:57 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKwcN-0006Yb-Ay
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 05:37:56 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42b3c965cc4so2059881f8f.0
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763375873; x=1763980673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gt7KXN0kf51wppv42sreiYYOAhM1z4v1+z7/C1VrtNA=;
 b=KF3B9XCObKey6HD9OOuKm6wbxNBVokQTA8P9ORO2OYAnwIL82k4rTmqfc824hs7FbZ
 iovXWFd/WSCi7c5RMkaE1nXtZax6UqY2jU/C8HzfxjsXFXlS2CE3cLwboBJYmhqpyA/F
 iUiqm1z8tzPDBzKprRmaedrWOgHztW9494JexsOIpXm0p7tc63ODbNLxofiyBD4IJma+
 pGDG4crSk0mhp7nHxS86wZw3ueNAq4kOJiyomIQ6Er/FSSVqsRvwH37V6L5rmK7gREqq
 t/584aEAnTPZsK8lbBaueoS+oYTEpbwzOZxcMA5ON3ForTfq91VrdjLFfpUJamDLHfCQ
 20ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763375873; x=1763980673;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gt7KXN0kf51wppv42sreiYYOAhM1z4v1+z7/C1VrtNA=;
 b=BU2gDbB/b7JbP33hjJX8rxzfJIFT8EqWqjlAn6mKpKIkHA7LtOUG+K5haMmrWL/T/n
 RRIGJNx+tMuml/eQTo/BA+KFRUoRpRWpgP/nRWbwh4LiXDgMy6oTvl98w7ZorXOUt1JT
 A4KUqoxYwOHfYiuU+vTtXSb6H8kTG6Y+p6zyAUQtkU3t8Ci+HcCV1AO0w1NjRQOol5Dy
 lhEySxLs9GLuboQOsHPo1FvEi9OCGxeXORLUAHfJE9/UtvDlfv4jV8PqpzQj781K+S/F
 H2+6/HzbukEZ55vzC9lLiG4hBuIxqJiTYH8EK8B1MOKD4AvoXzX0f3HuRhWoXLeWIDlQ
 rO2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCURHt3lwxXQ69m73n6vwC9uTd9wfrD6RA6hqk+IJyTAxgCsQpGw8LeJWkcPznT6v32zPUO1LvMbGQ==@nongnu.org
X-Gm-Message-State: AOJu0YxheYNq/qtiQ8Jhhu5BTLCn1rs1lGvgv5BmHzbKNBjxVlwMfJT1
 BDBITqt3rbC8vx38/Ei4TQF0aUv8t6ONdbPsfXseWzH6jjVvunWmJQ4YmOZExznLfUE=
X-Gm-Gg: ASbGncte9WA89vDVl90BqMlNO4etpi8Yz5LRdptn8qxWIJinTyYDrv0Pza8xz1VPGrj
 Ckv8I49ARdTeAX1KGVYpzSPgArFUqWQpNuY+4sxcxk7yw1OJjE8ZTqZANCtjYp3hDs1C89pMdWr
 ZEG9WEwDmDPYfiuAyDzrT5lcTmHtNjXjNBjbewfrSrv9D87ChAPZfhzBeJ78dK4eUsQOpQtIc9Y
 0SXJYa4L95CYiBWTjr3NedrG8eS47oioG+ihQPqAT28ndtDcFsKmjq0mNqdtp7U5YGWSs6PEBWL
 hPC4c45bAWmJp1EoixivJYUZ8E2qEL7BjB4+BwZEH8yiCjhlji7uTjeYCcT5WZPYI7jc7uju1mO
 djT3l5fTrPoHWPs2x/P8fpt7YuNKw+/cco9yZggvki3eOOOvc5+90GApH4x8q+3OZfsGa/WKlXk
 lPAFICgjfHZGo=
X-Google-Smtp-Source: AGHT+IEM5VmR/GqIW+79w0HlLSXqMLmnMI8y+5EWXewb/sjOLZOLIRjGIMEhqHzmqcyE3N5EIr7bXg==
X-Received: by 2002:a05:6000:200c:b0:426:fb27:974a with SMTP id
 ffacd0b85a97d-42b52844e62mr14896404f8f.27.1763375873313; 
 Mon, 17 Nov 2025 02:37:53 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7ae16sm25667680f8f.3.2025.11.17.02.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 02:37:52 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EA6645F804;
 Mon, 17 Nov 2025 10:37:51 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Paul Durrant <paul@xen.org>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Zhao Liu <zhao1.liu@intel.com>,  Kohei Tokunaga
 <ktokunaga.mail@gmail.com>,  Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>,  BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,  Li-Wen Hsu <lwhsu@freebsd.org>,  David Woodhouse
 <dwmw2@infradead.org>,  Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v2 16/18] gitlab: make custom runners need QEMU_CI to run
In-Reply-To: <aRr3WQfFnD1gpXdH@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 17 Nov 2025 10:22:17 +0000")
References: <20251113102525.1255370-1-alex.bennee@linaro.org>
 <20251113102525.1255370-17-alex.bennee@linaro.org>
 <aRr3WQfFnD1gpXdH@redhat.com>
User-Agent: mu4e 1.12.14-pre3; emacs 30.1
Date: Mon, 17 Nov 2025 10:37:51 +0000
Message-ID: <87y0o5kkqo.fsf@draig.linaro.org>
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Nov 13, 2025 at 10:25:22AM +0000, Alex Benn=C3=A9e wrote:
>> In addition to not being triggered by schedule we should follow the
>> same rules about QEMU_CI. One day we may figure out how to fold the
>> custom runner rules into the .base_job_template but today is not that
>> day.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  .gitlab-ci.d/custom-runners/debian-13-ppc64le.yml    | 2 +-
>>  .gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml | 2 +-
>>  .gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml   | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml b/.gitlab=
-ci.d/custom-runners/debian-13-ppc64le.yml
>> index 6492d013de8..be73c14b95e 100644
>> --- a/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
>> +++ b/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
>> @@ -11,7 +11,7 @@
>>      - ppc64le
>>    rules:
>>      - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BR=
ANCH =3D~ /^staging/'
>> -    - if: '$PPC64LE_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE !=3D "sched=
ule"'
>> +    - if: '$PPC64LE_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE !=3D "sched=
ule" && $QEMU_CI'
>>    before_script:
>>      - source scripts/ci/gitlab-ci-section
>>      - section_start setup "Pre-script setup"
>> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml b/.git=
lab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
>> index c8adb8171c0..7a30a18d0bc 100644
>> --- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
>> +++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
>> @@ -11,7 +11,7 @@
>>      - aarch64
>>    rules:
>>      - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BR=
ANCH =3D~ /^staging/'
>> -    - if: '$AARCH64_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE !=3D "sched=
ule"'
>> +    - if: '$AARCH64_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE !=3D "sched=
ule" && $QEMU_CI'
>>    before_script:
>>      - source scripts/ci/gitlab-ci-section
>>      - section_start setup "Pre-script setup"
>> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml b/.gitla=
b-ci.d/custom-runners/ubuntu-24.04-s390x.yml
>> index fcb49ae884d..c30816a806e 100644
>> --- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
>> +++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
>> @@ -11,7 +11,7 @@
>>      - s390x
>>    rules:
>>      - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BR=
ANCH =3D~ /^staging/'
>
> As a separate commit this should be changed to
>
>    - if: '$CI_PROJECT_NAMESPACE =3D=3D $QEMU_CI_UPSTREAM && $CI_COMMIT_BR=
ANCH =3D~ /^staging/'
>
> $QEMU_CI_UPSTREAM defaults to 'qemu-project' but devs can override it
> to point to their own repo, in order to test operation as if it were
> in upstream.

I'll wrap this in into the template clean-up as that also cleans up
other bits.

>
>> -    - if: '$S390X_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE !=3D "schedul=
e"'
>> +    - if: '$S390X_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE !=3D "schedul=
e" && $QEMU_CI'
>>    before_script:
>>      - source scripts/ci/gitlab-ci-section
>>      - section_start setup "Pre-script setup"
>
> This means the job will never get run by default in upstream context
> unless QEMU_CI is set. This is different from base.yml where in upstream
> context, jobs all run by default.
>
> ie in upstream we implicitly have QEMU_CI=3D=3D2 by default, while in
> forks we implicitly have QEMU_CI=3D=3D0 / unset.
>
> To get this matching better requires:
>
>  rules:
>    - if: '$CI_PROJECT_NAMESPACE =3D=3D $QEMU_CI_UPSTREAM && $CI_COMMIT_BR=
ANCH =3D~ /^staging/'
>    - if: '$QEMU_CI !=3D "1" && $QEMU_CI !=3D "2" && $CI_PROJECT_NAMESPACE=
 !=3D $QEMU_CI_UPSTREAM'
>      when: never
>    - if: '$S390X_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE !=3D "schedule" =
&& $QEMU_CI =3D=3D "1"'
>      when: manual
>    - if: '$S390X_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE !=3D "schedule"'
>
>
> With regards,
> Daniel

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

