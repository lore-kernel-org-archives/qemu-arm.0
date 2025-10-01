Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4148CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 21:52:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v44jj-0000NW-3P; Wed, 01 Oct 2025 17:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v44jd-0000M6-0J
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 17:51:42 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v44jU-0005Ui-B1
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 17:51:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso163484f8f.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 14:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759355485; x=1759960285; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ur4mhRNtXG8Powdkfb/SpSMh0Nhqn2yaLbXpJbeZDI=;
 b=TCCH/fhjmzAzv3nlc2BhDKBLvCLFzjLe8pJOa9fSHtOL7a/EIcxE4B4wRcYgHC9a7o
 5ws79hrJTP5IzaijhML1ZGBsCYPAsWKESjicLGv0OKBpCocKNCD02jcT4diOYUwyeJOJ
 cOePi+namJq8sncJfpssKVNb163YN2bsinJvzIg68Fwz1GQaV59fKGGqWKvE4zyyYNrc
 /osc63uvDgUDcmzk1AsYFABgJASdNAZDy/5rKVakkPBR++DlZhiCzsYNZdOg5lLXDWvO
 KW754F/9o+37qo+AcwsCB030837ikiOW49Wp7zdDc+kSeEUtVg7pf2bJeMXUkpbfLw22
 sWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759355485; x=1759960285;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1Ur4mhRNtXG8Powdkfb/SpSMh0Nhqn2yaLbXpJbeZDI=;
 b=eQGdzO+SbLiN1pc4Jlr5PBVqGvjY35QiYh0bNmRZSQNIaVzoZnVOMvUKbOaF7qBLXD
 KCCOtZzA7q5KJkrUFo0MVNnfE2nH1WbBikIhkjbYWMVoF8wYHhSGeNXZz/4ddpdaE1YH
 gB+7pOnWveiIVsdlHvi7zZJ1gG4tpCrF1gV4LXKKnp1rST4QYp2Pc4YKOBH06sRTTSIT
 c/WMEk3buC/IY7Y1OfSutq7PhVMeulGPvHtADZljqpOVJh67adVayLnN1wio2T+ySk8q
 bWJVUgbNBWpMo0xL6WdeECBDfevdLZ0Sg0+UnqdUgQ4XPY5QjFoPi8wgkIFy3OwyHRbw
 uXQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYJnCTVX44FjEEiKyHFKZo3V7JAFygNWYN9N/A9lrQ8swq9iGMVSw2C2544JObVR7Z4F/acAO0QQ==@nongnu.org
X-Gm-Message-State: AOJu0YyFm4ks8QJv+p4S2Qel4C0/GeSsW5XHqqCfVJpci8lWb7PBQsQl
 xe2u7uooPVcBI4iC7gCVv2myCC15z4OwPTJUvu5chvdqN9jploTkDsx7HltYuko5/zw=
X-Gm-Gg: ASbGncubnF6lG5sgyyaa3/XpeNMeGdZVk9Ou9LLVJ1EyZ1dBzhsQNmNL9H+MW/N1OGZ
 6oCj45NkffAyNjvRcpogsgSaKU14csRb3ApmUyFe+DEq0Vfg9FPcFIi6EyNFvFbC9uPiygcaCV9
 dkp+rvt5SmHPp8XnT4DCRX+2uS/bj/RkDT0cs9hbmScV0EsuCWE/Aq9gsendbDf/qKHSeg1VLO7
 lwKM9jc9VirWgJOmlOhL0cFl7+RQkSJtGrBd1AmgqYVqp/fmsS5N1ObeFQ8TQUgEugkwG/mLAvB
 I+Z6sLZhlH73B8st39VarLlxQhrHTPZDNJp/1yM46YDeVlM0QeEYQHwvCrqrzoy1qAyhMJmtkJp
 acB9v6tPVr43OuCuZJcPfZgT+/2OwnqEA1hvoocHtK2VnIv4=
X-Google-Smtp-Source: AGHT+IHIJnCpMDYRNa3Homtuufr4MvWIMp9SG7sA9UQGXUwCyPgE/UHgzyVcjIm5Dwh50mr1WznPOQ==
X-Received: by 2002:a05:6000:2002:b0:415:7a6c:6a38 with SMTP id
 ffacd0b85a97d-42557821a1bmr3763742f8f.59.1759355484862; 
 Wed, 01 Oct 2025 14:51:24 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97fbsm752151f8f.34.2025.10.01.14.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 14:51:24 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3B6735F7A7;
 Wed, 01 Oct 2025 22:51:22 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,  Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?=
 <philmd@linaro.org>,  Thomas Huth <thuth@redhat.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH 0/7] testing and misc updates (docker, ansible, .git*,
 gitlab)
In-Reply-To: <1a86ebf2-161e-975c-1808-d8d960c4f7e6@eik.bme.hu> (BALATON
 Zoltan's message of "Wed, 1 Oct 2025 21:31:05 +0200 (CEST)")
References: <20251001170947.2769296-1-alex.bennee@linaro.org>
 <4188260c-e8ac-9bea-5e05-6cd34c3e986d@eik.bme.hu>
 <aN102hEBf6vny20l@redhat.com>
 <1a86ebf2-161e-975c-1808-d8d960c4f7e6@eik.bme.hu>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Wed, 01 Oct 2025 22:51:22 +0100
Message-ID: <873482i945.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

> On Wed, 1 Oct 2025, Daniel P. Berrang=C3=A9 wrote:
>> On Wed, Oct 01, 2025 at 07:56:21PM +0200, BALATON Zoltan wrote:
>>> On Wed, 1 Oct 2025, Alex Benn=C3=A9e wrote:
>>>> My first set of patches for the development tree. Should be mostly
>>>> self-explanatory. We still need to apply the upstream COPYING patch
>>>> the u-boot-sam460ex code but we should decide if its worth mirroring
>>>> or should we just treat the copy as fully "ours".
>>>
>>> Which COPYING patch do you refer to? I have the upstream because when I
>>> submitted this I was told to do it this way instead of adding the u-boot
>>> sources to the QEMU tree. It can't be merged with the official u-boot u=
sed
>>> for e500 because it has sam460ex specific patches from the machine vend=
or
>>> which only supports this u-boot version. There are some updates from the
>>> vendor for real machine which I plan to add eventually but it's still b=
ased
>>> on an older u-boot version. With mirroring I can update upstream and se=
nd
>>> one patch to update the binary once it's mirrored, otherwise I'd need to
>>> send patches for each update and rely on somebody to merge them.
>>
>> I opened this:
>>
>>  https://gitlab.com/qemu-project/u-boot-sam460ex/-/merge_requests/1
>>
>> but then learnt u-boot-sam460ex is actually a mirror of your github
>> repo, and haven't got around to opening a new MR for your repo.
>>
>> If you can pull the commits from that MR that'd be great, or I can
>> open a new MR, as you prefer.
>
> I can get the patches from the gitlab pull request above and apply
> them the my github repo, no need to send a pull request there. I just
> don't get notified about what happens on gitlab so I have not seen
> this.
>
> I'm not sure what Alex Benn=C3=A9e refers to as fixing up the mirror. Is =
it
> not mirroring now?

It was mirroring from github.com/qemu/u-boot-sam460ex - I thought I
might have to re-create it to get it to mirror from the right place but
it looks like you can tweak it in the config.
>
> Regards,
> BALATON Zoltan
>
>> With regards,
>> Daniel
>>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

