Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C0CC88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 07:28:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x616q-0007hX-Rl; Mon, 14 Sep 2026 03:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x616k-0007hH-T0
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 03:28:08 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x616f-0005ur-Qh
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 03:28:04 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso13817795e9.3
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789370880; x=1789975680; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9Wr4UUfsftFAZNsHonDpEGv8jW7RYY1Ix8R2b/9+YfU=;
 b=rMTCjY3gkpqEk6Lx4Ox7EKAPGwUb/Q3NBwKsdzOreOTu++4O6QLHi8N+lVLHHAB1UH
 xiQnA2TNUROGjYaOR8PU78YiWNyH9PlttiZGrJC8T5xWnQNQiDaropXBtI7cQqxAbLI4
 LdncIM5snoVuzFwD57ot1pu0mVDR8Rz43Ad6FQgvW2N+HJ1TtmkoCCfOUuFannAEvhwF
 bTc/7YUGJcCHI44PrE6BJ5eiOE4tHNlWlC1NMPElpAIo3iRh8h/907yJrfT3oHFFSXJ4
 y9olbi7xAznq/HEFNg+ORdOBbVYhK3qZsQw+LX092pt8ACMYT1BgHZHfV+5B2tdiXtU+
 KtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789370880; x=1789975680;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9Wr4UUfsftFAZNsHonDpEGv8jW7RYY1Ix8R2b/9+YfU=;
 b=Im+c9+rDzcmIWY0grEux2YPXBSy8BOaCti9mG0y6zLnipH+bcx2cjKiVkKUQfD/lIL
 xHJ6CiwIcO1cqUpAthy4dxnVRPAXs0teTHeNQyNy9qdxIIKGHciE9i205bwb0bOxpLV2
 AeYtS4X40iB+17AxGUYF473SG2DnxcvmHTwip5tE2UbgMv8hSb9a6Zj+Hb+n5d6S8Kg/
 yfa5sT+OhzkS1+ff+Eyog3l04RY2gumC/k9ILfddfZzRnkcOPOl6ZyTjLpfZHOmCmIiQ
 uTsPo8TciE404nPsmN+6UW4kx284JSiqOtKM70rlO7k07tmTSkcxadqMWNHF/m8EXhXe
 QFDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzpSzo5Zdz0864ds6oeMyyX9ioqRfhVO0cUDxZ7I5f8ifw3sAB1DtjKO5keqLcg7uJK2i7mX7aijA==@nongnu.org
X-Gm-Message-State: AFuF++l82tvAtIOc0avZrs0oa0hOoHHXaCXRgV8gK01w4mdtvZWke5b8
 +iZ2Dajvwygfsb+Lv8EcHp75im7YZFAl3ow1RUAtQIHsd39mXgkO+aLrUatANARJJ2Q=
X-Gm-Gg: AYBFou2odzBsUpbUaNFf9+T9i/bbj08vof8PLaXD+OJl7ULTpO5eUhJTaRDthgHG7fu
 AUYtfy5nF/bBP0xR9R/TfrJNbYLpYj/5h8THhUt3MBNLpNFTKxoXpNXDY3OIqnuWXQ76V5gOrWs
 zGE0Ovvkj5zwpHGrxdmd5VmNjkoT43NI8RtnHd+PZeCLu6dp46y88jXViHE0jdR+aic3uwEtO7j
 eoiDQR2YgXmfFAfsrz2dM7UiujKvdHeYGhhQXtNs/8xx/inmgPqG1WgRw5jy42jnHj4oU/Ndd89
 +r8MQrtdUsbAg6JAQw6b07/qji00aSMDghzWwwSTBIBloifn2kVP3ANdlnP7bwh2263I69pfOdM
 vJF1TlkuCS7Wk2+apiTqTpaLste747MvSLxlB1ScyZ5/uzTxjswFqWoWugLPSH9N8f9iZ0SQvO5
 O/nhIiEiVUVi/4PstTY26auyy+NAQBTBmZtJPFtwuuC0zMUsgdtrp0foTD33q3RiICtF0b9By8J
 EvKDFfgkQ==
X-Received: by 2002:a05:600c:4e02:b0:49d:272d:74b4 with SMTP id
 5b1f17b1804b1-49e7a6387bcmr32632785e9.2.1789370879713; 
 Mon, 14 Sep 2026 00:27:59 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e7723d458sm92075965e9.0.2026.09.14.00.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 00:27:58 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 959A45F920;
 Mon, 14 Sep 2026 08:27:57 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Brad Smith <brad@comstyle.com>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Song Gao <gaosong@loongson.cn>,  Warner Losh
 <imp@bsdimp.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Cornelia Huck <cohuck@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  John Snow <jsnow@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>, Thomas Huth <th.huth+qemu@posteo.eu>,  Brian Cain
 <brian.cain@oss.qualcomm.com>,  qemu-arm@nongnu.org,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Kyle Evans <kevans@freebsd.org>,  Richard
 Henderson <richard.henderson@linaro.org>,  Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 4/9] tests/tcg: use --add-current-user when building
 containers
In-Reply-To: <78b4bda8-02cc-40b3-b9aa-137069a54811@oss.qualcomm.com> (Pierrick
 Bouvier's message of "Sun, 13 Sep 2026 22:15:12 -0700")
References: <20260910181504.1010916-1-alex.bennee@linaro.org>
 <20260910181504.1010916-5-alex.bennee@linaro.org>
 <78b4bda8-02cc-40b3-b9aa-137069a54811@oss.qualcomm.com>
User-Agent: mu4e 1.14.4-pre2; emacs 30.1
Date: Mon, 14 Sep 2026 08:27:57 +0100
Message-ID: <87wlso1ede.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x10.google.com
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

Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:

> On 9/10/26 11:14 AM, Alex Benn=C3=A9e wrote:
>> As the meson tcg build routes the container builds through docker.py
>> we can also clean up its hack which involved appending a RUN line to
>> the dockerfile. All the dockerfiles that care will work with the
>> --build-arg.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/docker/docker.py | 13 ++++++-------
>>   tests/tcg/meson.build  |  3 ++-
>>   2 files changed, 8 insertions(+), 8 deletions(-)
>>=20
>
> I'm not sure why this was added in the first place.
> Technically, running the container with a specific uid (whether or not
> a user is declared for it) is enough. The only errors you can have is
> if some specific commands ran expect to check if user exist on the
> machine, like sudo for instance.
> For our need (cross compilation), it's not needed, as a compiler will
> never check who is $USER. Files written will still have the correct
> uid on host fs anyway.

That's why you do the mapping. Before I was seeing a whole bunch of the
test files with a random group ownership.

>
> Do you have more info on this?
>
> Regards,
> Pierrick

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

