Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB9606A88B
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 16:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gxzhy1Xf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xSzxx-0003ZF-3Y; Mon, 16 Nov 2026 11:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xSzxv-0003Vp-BB
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 11:53:59 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xSzxt-0007mO-Cd
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 11:53:58 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c45551fa84eso707318866b.3
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 08:53:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794848035; cv=none;
 d=google.com; s=arc-20260327;
 b=k1TQMiZ60Uwx8chTDqbalqshGG2WeMVKT6idhMJpRAQVPMR1xRXR5azz/2MROc075b
 o7Cnxev4a5U3K5DhDD++9sUulMN3ZnYFsadPskfxxIuj2iF4JmfeVrXt1oASi13x4gcJ
 Lqj9CwSy2p2/SdJFgfmwlbLOR4TjZncLv+zK65ZVpH15lNceFSYFMyilhGjpPBxDlOfq
 sQuQubsuw9AXmzMRVGG0ZooAvv+rI670Ii66JO21nGGvX3Cu2baC15IHmrXbSUuj/Zy7
 w4m+eQWT87OWyAeNy35G5e0ngSc6ILhfU/X4DpN1mWARMFrk/UCBXwN3y1YM/2hyGx/6
 6N/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FT+E1Vp3Esd1Hzvo9Hu0R33v6gMoSATWy3aSdvgNj88=;
 fh=DhaOpPa2FVpSiQAvEaKhwCD+1+q99IMA8hmmHVNAI8Y=;
 b=n9tm3HHnCQRxSwgugm1K+vi7CsuT8bg/fel3VpIHp2SznhXr9DH/OWWWI1NmcuaB3T
 aEY0HCnoZYwLX+u+9ko+zbKXrpe7ImMBCoq9vnHNduwAAz7qTcqtO9M68rjFgzsFQYue
 ZW5exTYvoRKYz/kru7l911dGPFdR70CZgT/iiLjb1VHJ/W+WPejyjZ2XwXQQIcFRW6XB
 NZGPtMKxgCJTlbBu/6MxyFpdDVskBkaZhC1kuPiPdqxFmDSTizjIPpIJmj344IaxYAnh
 D1WN1HTjMYF1EpYygs3tiribcqhE2ByQBlblQX6s4/btpvsLbuimgOGIIL8JI0M1KkrQ
 CrdA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794848035; x=1795452835; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FT+E1Vp3Esd1Hzvo9Hu0R33v6gMoSATWy3aSdvgNj88=;
 b=Gxzhy1XfH3EScoqRfM+HMTI6Q4QyCi4uSrc4W5JbJEQCfE9uVy6tfkelrxhDaqmizi
 g9sph7/Ud2n7Ukxba2jjkNb25Hy4tgvv607dIf6tCgTJScDOqj/1M5xpCCRoh76NHXVU
 diVsNdgkyII+ErWJr3jF+7LTbAFDMRYgwMpEl+655Urv3+O/uj4gmTIoTT4ZUoiykKkk
 s2wrQurgwB07ffiF9aBtDxty4ouVgbMFqYrEF7aAMhxYoAn2ISL4I3OB8wKs6Vk2HVvJ
 bg+5LkLB800eZ9tNIdRaCcvhpRKziNA7RwcVWtsA4/FhxAVjImaFUdlk+cKwzAti2tQj
 GKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794848035; x=1795452835;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FT+E1Vp3Esd1Hzvo9Hu0R33v6gMoSATWy3aSdvgNj88=;
 b=Tr/D4uvu9YAYBrihwyAUzdVzHDBaZy43f6+T3IPg5ht5mF4BXKAnEYgUNAHb25mMlk
 2M0RCKRlT+Dk3DzayPEYFmkmDDSPsGUb3VvTpjJx0L80FXCK69eb5+lpFHTtYmaPnoIM
 foRnmQD4XtPDeXOphKmZeC2o6jLhxSPDXeEu+R+8EpxtzFcdXRmsoCuznxE5xm0AD9PZ
 8evQv9wuy4/pbhN9zMr3ADmAT9WtP6NCXkSv+IUAcx8KZYD4uXYqhO1WliDAOCT2qhtq
 W/igCkcnDylDgPLXcwtyjKfJqdhzTX2rdhiWoI9as4XKU+r3IsZN6mjLezY9Jy05h8Ih
 uQ4A==
X-Forwarded-Encrypted: i=1;
 AL+hErEsu4rqjQZ5JpfVWg4pxwu8aoChA/cEvrYMVTh8yH6aXtYvTkRwsYuz3MyTouWZ1/oF1cLZ0cN5pQ==@nongnu.org
X-Gm-Message-State: APuU4Z/1iZF1TxXba6DUPpC7CBo9DmqT3WHXvN7AwPGoVCXJo1sGzzy6
 HsBrmSEnFxMOhOxFNNp1lkPm+zBoqbuu5UYfYu6JpNeTiCSKcvv/RCO2o4OP/L1wVmwNPcqgFWV
 4IB4sVGFAWaEd6UfNVCY1mcVwxsWv03K2UgEphaUqtw==
X-Gm-Gg: AYBFou0/VGHjsV2iBVWYXCrKAoHXx5RmzTHC1ahrMXG/0yAEKE1IzgypsadvvG6mt8A
 eF4UV01EKTuA/HvCxK0koa1CXfMUirn4qO0oHaNwyT4CohjdE9Q7PJSqkVLQRb385/rtbvVweXW
 BbgMfmIW1jlXrFofomSTcTkrlwiedlo8Qaewlr+ckMfiyAB4aqzt0jRCKI1jI6140d/ovcWTtz1
 Kk6EiH3D35Rk1qnwprLMzOxS4ZY2GRZy/EO25qx6Qr1t7+ZWlGnSUHTo2Vx1tvwqHHmctIY9sOq
 J6NfMZBDrlymuvY1+kWSRJ2aHiTNQUyJXt+kp1oqTTm5Sfkm1ZUjgXer8HXITosh4z/SXk7sWRu
 qz1IDs51qG/xhKkKgQw6MTw4xq8H56AZou2oNP+C1xpUA+IB3zaUxZ6qG+jRKQ2/BPGcMZvIm+d
 msi9H2k/NvHCK1GnC5ue0J
X-Received: by 2002:a17:907:3e11:b0:c2d:bf61:24d1 with SMTP id
 a640c23a62f3a-c5096199b77mr1022110666b.1.1794848035161; Mon, 16 Nov 2026
 08:53:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
 <9b64d3d9-736d-4878-80d7-4caa75eee778@linaro.org>
 <CAFEAcA8La+8TqFY0yCxRsXY2Ad9MA5Uu-sVEbysExZPkUXVawg@mail.gmail.com>
 <ccfcea11-ada8-4753-a71f-f59ed1bcb067@oss.qualcomm.com>
 <CAFEAcA9FE_dTUo5s2g7DMw9-ZhbjBUOfF0RJxdT7gMwm-rYuGQ@mail.gmail.com>
 <558f35d3-5a10-4652-8af4-4a88f382ca3d@oss.qualcomm.com>
In-Reply-To: <558f35d3-5a10-4652-8af4-4a88f382ca3d@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2026 16:53:41 +0000
X-Gm-Features: AclHuK9q24K3FKH_3KXHIk_yRqiPKQ5lWqYWByzl4UcmlwuWl7WvzEyDrzaqkK4
Message-ID: <CAFEAcA_gBzv7URWJNjXwjUbKOJuRQ=bd1NS9enpU_AW_tCZzvg@mail.gmail.com>
Subject: Re: [PATCH-for-12.0 v2 00/12] linux-user/aarch64: Support both
 endianness at runtime
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 devel@lists.libvirt.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 at 16:31, Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 11/16/2026 2:00 AM, Peter Maydell wrote:
> > On Mon, 16 Nov 2026 at 08:53, Philippe Mathieu-Daud=C3=A9
> > <philmd@oss.qualcomm.com> wrote:
> >>
> >> On 13/11/26 19:55, Peter Maydell wrote:
> >>> As a more general question, is this something we would want
> >>> for architectures where both endiannesses are relevant (e.g.
> >>> mips, ppc64)? At the moment we consistently for all targets
> >>> handle big vs little endian as "it's a separate target with
> >>> its own executable". That's convenient because you can at
> >>> compile time hardwire in things like variations in struct
> >>> layout between the two. We could switch to doing that kind
> >>> of thing at runtime, but what is the benefit we're aiming
> >>> for by doing that?
> >>
> >> I did the other conversions (Microblaze, Xtensa, PPC, MIPS, SH4)
> >> and wanted to test the water first where this would get more attention=
,
> >> with the series involving less changes.
> >>
> >> My motivation is MIPS where we currently have 6 binaries and I'd like
> >> to add binaries to cover more ABIs without having a combinatory
> >> explosion and have 18 linux-user MIPS binaries. With this approach I
> >> reduced the current MIPS set to 3 binaries and add 2 more, ending with
> >> 5 covering more ABIs instead of currently 6.
> >>
> >> In order to get there I need the few core changes introduced in this
> >> series, which affect all user binaries. I have the idea ARM users are
> >> the first ones interested by no performance change thus is where
> >> I started the benchmark to prove this approach have no impact in emula=
tion.
> >>
> >> The TargetInfo structure change (one initializer LTO-protected and
> >> all accessors via read-only exposed structure) is also what Richard
> >> was very keen to have (page size support planned) instead of the
> >> current approach.
> >>
> >> I'm thus returning the question as: why would we not want to do this?
> >
> > Mostly because what we have today works, and the idea of "the
> > target ABI is known at compile-time" is quite deeply embedded in the
> > way the linux-user code is written (both in terms of ifdefs and
> > also C types being defined appropriately for one specific ABI).
> >
>
> The last part is what we had for system mode, and precisely what we have
> been able to eliminate while working on the single-binary.

Yes, but it's taken a lot of work to get to that point. For
system mode we had some clear reasons why that work was
necessary and worthwhile. For user-mode it's less clear to me.
Keeping the zoo of MIPS ABIs under control seems the most
promising reason.

For aarch64 in particular I would prefer to deprecate-and-drop
big-endian support (probably starting with the deprecation for
12.0, rather than pushing it into 11.2), since the kernel just
did that in 7.4.

thanks
-- PMM

