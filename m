Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE15C88E75
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 15:14:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x68Nq-0002lF-AA; Mon, 14 Sep 2026 11:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x68Na-0002kW-JB
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 11:13:58 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x68NW-0000wY-PL
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 11:13:58 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so3434808f8f.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789398833; x=1790003633; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ak4js3aR4TqwiL+2WOXgTs7LZLuryUk+Z8TlyQNjfCs=;
 b=T2TZdRuJ/W5JSDzpB/FhEkvuTbn79n1yTsfvpwMDy3W2TBV1ObZUhAOuXFGZRL1lgA
 23grLbGC4HVRfoIornI6LU6+F9qZXBpG+WkmyUEStmGo2jKOJnhWZkLX2W2+6patExOA
 NuM/2WNTgKnhsEJo+7PmkCoItJt3lkSK6/Uw2P81lQ5fw6QkqXkhAwKmN99gSOQJLYhq
 tpYsrk00vHJYowNtJbCvCjzpdOj3yrW89OgHSJQ0vxf8E26yysaSNBmTsqmc75qz9IaQ
 5FaUn7Aqrhq8BhefkCRNvP3AZAvLILoze62AUUUDI+SbDCxoNblJ4CqJ30THJ+TZq437
 BbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789398833; x=1790003633;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ak4js3aR4TqwiL+2WOXgTs7LZLuryUk+Z8TlyQNjfCs=;
 b=oPXhJPPpaF8c4BoMTCrURGzfMpFxj4r4IayxXf4f8reZ2TwTuZh/LO+C0uQ7Nv1wpV
 fKyJnQnJqqEWxaFJZPiHnghhg5lpMsJF7w+4OeeK96fr8a48FgQXAu8xbCFtd+NVHorU
 2qbayubCWhqYyDkk+YSagq9VBSYP60s8a96YLZ/vn1MAwiEsyscnQRSIr2mk/Z6nuWLs
 QG6ymqX+hCXalvblDMMDSxmE/fwwvepdlBhE1uNAOiwUKIc/J1eBXXXsVsNOax2sbKc7
 Xf90ddXwOb3PNTpcBPVXsjf+/jflGnwzC7SV4SBOsWhxCUPb3PayY6iVmg2/NZzBowqi
 ygNg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdlrafiuSSfk0d2jfbb9002gv9XNi3kbK3M2HEAd6n68AJHfW517NjIe6l04nA4n7mHC47wxY19Q==@nongnu.org
X-Gm-Message-State: AFuF++mEi6Z0Uizi1YUtj9T1NdDI77BGTUoKPG35EtTzkrrU2BieZRJD
 IibtvGRi9jEfzsNxqsDrfLF5Rlu7Ob26RPHqN6Lx4fCcZkAloHAs5IW8/C+jF4RoN9JE5nbdfH/
 EeElIzvs=
X-Gm-Gg: AYBFou0ixSv65eM+F9rs3v/F0pdXiIMuFRmml93Ew+4zA2kH4pGGvYdBakk9wNRSCHh
 M87MIygQrD2ND9BXaw9PCf0MITwmzR5165uHlzE1fR93aHN9YAXO9P4rz6tDOl+XbIoBcbu6qTH
 jM+daryNNsnpk3EvhIOp2REyWeiLMG0fxsZm28JgOTxW0R+osDffMWI4N5Koj3owzm1Ehn8/7+5
 NXbO2tNuGv48avVVQp4CxOhakW3vNlK0a2SRS5vlFZNLVvx6Reduzs/CFkmMqw4qg866F8pP5XA
 fM+9hqyuAJTCECnwavk+5beXxhk3DXaCdygDSbSLGAy/mS+JISMx7XDnrkbN+MvYPatu4sz8jbD
 XMgtBdcKap15KjRV0vzXZjh9yWpUgOpZUzp7tTmR1JarxnUGPJnOj3jtaO2Klcr8J1YVRrJ9No2
 nYJuf1Xxw0miasgRnw1AHiPi7+cm5nNB3MNkAJDpi/xG1/ngPrrqk/0us9CLBkI2xaCKN/Z/iCo
 CqrrKmlCFI=
X-Received: by 2002:a05:6000:41ed:b0:486:f3bf:16a9 with SMTP id
 ffacd0b85a97d-48702b7240fmr3747619f8f.57.1789398832812; 
 Mon, 14 Sep 2026 08:13:52 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb32d3c7sm25753184f8f.10.2026.09.14.08.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 08:13:52 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EA34E5F81D;
 Mon, 14 Sep 2026 16:13:50 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: peter.maydell@linaro.org,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [RFC PATCH v3 00/36] arm: add Raspberry Pi Pico/RP2040 machine
In-Reply-To: <20260913181850.3301-1-gilles.grimaud@univ-lille.fr> (Gilles
 Grimaud's message of "Sun, 13 Sep 2026 20:18:50 +0200")
References: <20260906194438.93046-1-gilles.grimaud@univ-lille.fr>
 <CAFEAcA8s4UXp=hp9R=Pq1mMP6VvB8ergnsm7Yq1xooOGgTPsCg@mail.gmail.com>
 <20260913181850.3301-1-gilles.grimaud@univ-lille.fr>
User-Agent: mu4e 1.14.4-pre3; emacs 30.1
Date: Mon, 14 Sep 2026 16:13:50 +0100
Message-ID: <87o6dzdfwx.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

Gilles Grimaud <gilles.grimaud@univ-lille.fr> writes:

> Hi Peter,
>
> Thanks for pointing this out, and sorry for breaking the series
> threading.
>
> My university SMTP relay enforces a limit of 100 envelope recipients per
> hour. Since each patch was sent to the QEMU lists and to the recipients
> selected by scripts/get_maintainer.pl, the 37-message series reached that
> limit partway through the submission. The relay then blocked further
> messages as suspected bulk mail, and I cannot change that policy.
>
> I therefore resumed the series in two later git-send-email invocations. I
> passed the original cover letter Message-ID with --in-reply-to, but I had
> misunderstood how git-send-email threads a partial series: the first patch
> of each resumed invocation became the parent of the remaining patches in
> that batch. This produced the groups 17-30 and 31-36 seen in the archive
> and prevented Patchew from recognizing the complete series.
>
> This was my mistake. I think I can avoid it for the next patch series by
> using the appropriate git-send-email options to spread the messages over
> time.
>
> I will also keep subsequent review discussions on the mailing list. My
> earlier private reply was a mistake; I was trying to avoid triggering the
> same SMTP restrictions, but review discussion should remain public.

If you are having issues with your university gateway you might want to
consider using b4's web endpoint:

  https://b4.docs.kernel.org/en/latest/contributor/send.html

of course you will have to manage your patch series with b4 to do that.

I think you can set up via Source Hut's send-email web form:

  https://qemu.readthedocs.io/en/master/devel/submitting-a-patch.html#submi=
tting-your-patches

>
> Thanks,
> Gilles

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

