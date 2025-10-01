Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D36CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 18:57:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v420j-0004t5-Rf; Wed, 01 Oct 2025 14:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v420P-0004n3-Up
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 14:56:50 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v4209-0001Nz-Pc
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 14:56:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so1718035e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759344985; x=1759949785; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uU9GJw9JHFe7DtkaGrqjWk/KAYap+bJGvAOsEu9JNpA=;
 b=j5yzllx2MsUflt7dz4GtUZLeSC6ujw50wQeY1YgAxTf4vVd2HwNe1vhG7eBB7B0grN
 8OFvtPiXcDmO1u5vLH5gxop8Fzp+9xABwP8H3GQc+0EpCZEk27rq5kPKv8HfEZMvjLCa
 G4mxoJPHrxPY0UVHD7hynrsSiP/690AooIBVaQxAQGv6yr3onzX6/rY9GvpM5+8edRZn
 HUXwWE8CDc29d+tCdTXW/c7nzbtKCRX9WHkLc6TA7bnOoLEpr+WY1idEGePTFk5TJ32l
 UmMPVGV5CSZ14idpmSnPnXbTN5RGQK42Ms2lDGMS66T+TW0+2RnqK6O++M4yO/ZlQw48
 hTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759344985; x=1759949785;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uU9GJw9JHFe7DtkaGrqjWk/KAYap+bJGvAOsEu9JNpA=;
 b=lBpY2vdarbqcDNY6rHGMJRG+zC976poy1QEE/QWpoV4wtGkvh91P/NkyrlTtqWH5EJ
 t0Bh8Rd2yeVsdGLW++C5QE32LLzTjM7ocr5grRcoQrZS8mNTuNrFcdAtEVIG5kUExtzA
 9G1/WEv1UIFfk7990SKzO+Pr/XWHqNR6qahQkleb4TnkSAYTQ3MxT9iaZwi5hEV+PLNB
 Xzlvx7NLYOJ7155N0Fhpe7Sq+9KbiiGTTSNRsKRLXyVdfue6LnZrkKppg6NBrXHA1cVR
 7aukbibxq79mZKbe3yRxYUsrYme+Um/YKAYt0GjJXwGHE0B4v29g8lncc/YSBk91osjF
 kF/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXNVlpXwoX53R1t7+dBH7Gzcid18KzP+K65wkUWWsHkHGryp33z1E3Q+CswKeFU6ydpwd4UAs5Pg==@nongnu.org
X-Gm-Message-State: AOJu0YyB5RDBWQ3LtnLmsewvWmccjjjq2Jqk5NXJbvBcbkU8Skwrrgl6
 Uc3CZB6cOCmUSy5fPbQwbHEYr13zNpz7JuhNAFMv8WkK3kxOB63r6hpkdbUDAwhPnm0=
X-Gm-Gg: ASbGncuCLYP6Zbd4+Ok+fCfGl1JiB/Tdz8KuPFkVhA6C8L0lISGPIEOX/3CQVXhnV6b
 +8ByLYCDanCZ0b7fW+pw8CZ6cPnArU7T/Cn7wdfJLIvF4WiEoFLLRVQmzSXExvYwqbkDCCpnFFF
 mHGHIOyji10DEiiEaoZMV562cd2OFUkgoeIArx9Sj9O5NRnRqCB/xEvTY3fnyrN0DlJil3EyZtu
 g+8p/lOU/WwGztIvsg0KeiiVuiEJC3p9lgRM6UHIe67T94T7VLt14gHcw1QK2lkfB0iVNREwby0
 YHzP9hP4887EVKj+MqY8nF3zlB+F2VYJlNj3S1ertBmC5ZWbCWbKY999+8ApDAa2EYGHUlRvOLh
 jVEY14sJWSIW1u3/jxQmfrn7dasaI1P21FqQ2QzTk4KbAiUI=
X-Google-Smtp-Source: AGHT+IFOYKIQzFUQaMpA8x+W8ph+05jD7W521ofUtAa+A2WEkY5RbhfBhZDw4EHYFRLRHBJDqfPpxw==
X-Received: by 2002:a05:600c:37c8:b0:46e:2801:84aa with SMTP id
 5b1f17b1804b1-46e611dd02amr37904705e9.0.1759344985113; 
 Wed, 01 Oct 2025 11:56:25 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e96e0sm285870f8f.33.2025.10.01.11.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 11:56:24 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 78BC65F7A7;
 Wed, 01 Oct 2025 19:56:23 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org,  qemu-s390x@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Gustavo Romero <gustavo.romero@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH 0/7] testing and misc updates (docker, ansible, .git*,
 gitlab)
In-Reply-To: <4188260c-e8ac-9bea-5e05-6cd34c3e986d@eik.bme.hu> (BALATON
 Zoltan's message of "Wed, 1 Oct 2025 19:56:21 +0200 (CEST)")
References: <20251001170947.2769296-1-alex.bennee@linaro.org>
 <4188260c-e8ac-9bea-5e05-6cd34c3e986d@eik.bme.hu>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Wed, 01 Oct 2025 19:56:23 +0100
Message-ID: <878qhuih7s.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Wed, 1 Oct 2025, Alex Benn=C3=A9e wrote:
>> My first set of patches for the development tree. Should be mostly
>> self-explanatory. We still need to apply the upstream COPYING patch
>> the u-boot-sam460ex code but we should decide if its worth mirroring
>> or should we just treat the copy as fully "ours".
>
> Which COPYING patch do you refer to? I have the upstream because when
> I submitted this I was told to do it this way instead of adding the
> u-boot sources to the QEMU tree. It can't be merged with the official
> u-boot used for e500 because it has sam460ex specific patches from the
> machine vendor which only supports this u-boot version. There are some
> updates from the vendor for real machine which I plan to add
> eventually but it's still based on an older u-boot version. With
> mirroring I can update upstream and send one patch to update the
> binary once it's mirrored, otherwise I'd need to send patches for each
> update and rely on somebody to merge them.

OK I'll fixup the mirror. I think I need to delete and re-create the
gitlab project repo now.

>
> Regards,
> BALATON Zoltan
>
>> Hopefully I'll have the new aarch64 runner online by Friday and ready
>> for the switchover.
>>
>> Hopefully I'll also be able to pick up Gustavo's reverse debug test
>> fixes by then as well.
>>
>> Alex.
>>
>> Alex Benn=C3=A9e (7):
>>  .gitpublish: use origin/master as default base
>>  .gitmodules: restore qemu-project mirror of u-boot
>>  .gitmodules: restore qemu-project mirror of u-boot-sam460ex
>>  tests/lcitool: drop 64 bit guests from i686 cross build
>>  tests/lcitool: bump custom runner packages to Ubuntu 24.04
>>  gitlab: move custom runners to Ubuntu 24.04
>>  scripts/ci: use recommended registration command
>>
>> .gitlab-ci.d/custom-runners.yml               |  6 ++--
>> ...4-aarch32.yml =3D> ubuntu-24.04-aarch32.yml} |  8 ++---
>> ...4-aarch64.yml =3D> ubuntu-24.04-aarch64.yml} | 32 +++++++++----------
>> ...22.04-s390x.yml =3D> ubuntu-24.04-s390x.yml} | 28 ++++++++--------
>> .gitmodules                                   |  6 ++--
>> .gitpublish                                   | 16 +++++-----
>> scripts/ci/setup/gitlab-runner.yml            | 12 ++-----
>> scripts/ci/setup/ubuntu/build-environment.yml | 12 +++----
>> ...-aarch64.yaml =3D> ubuntu-2404-aarch64.yaml} |  4 ++-
>> ...2204-s390x.yaml =3D> ubuntu-2404-s390x.yaml} |  4 ++-
>> scripts/ci/setup/vars.yml.template            |  5 +--
>> .../dockerfiles/debian-i686-cross.docker      |  2 +-
>> tests/lcitool/refresh                         |  6 ++--
>> 13 files changed, 69 insertions(+), 72 deletions(-)
>> rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-aarch32.yml =3D> ubuntu=
-24.04-aarch32.yml} (78%)
>> rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-aarch64.yml =3D> ubuntu=
-24.04-aarch64.yml} (89%)
>> rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-s390x.yml =3D> ubuntu-2=
4.04-s390x.yml} (88%)
>> rename scripts/ci/setup/ubuntu/{ubuntu-2204-aarch64.yaml =3D> ubuntu-240=
4-aarch64.yaml} (96%)
>> rename scripts/ci/setup/ubuntu/{ubuntu-2204-s390x.yaml =3D> ubuntu-2404-=
s390x.yaml} (96%)
>>
>>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

