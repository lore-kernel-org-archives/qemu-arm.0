Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AFED65C7C
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 17:13:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVv5U-0005GX-F8; Wed, 17 Dec 2025 12:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vVv5L-0005FA-UW
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 12:13:12 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vVv5K-0004r0-9F
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 12:13:11 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso2496591f8f.2
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 09:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765991586; x=1766596386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0uhcrtD7jnKn0rTYmKdWhCBWBmuzsgB6qyok4bl7+AY=;
 b=KTNChVIcBFyCT4o1fxAFmYnmRG6qhiOpuNZDug8fDEKZi0kBTP6+rnjsiLj4UaD7ET
 i7tskS2CrmubYV90TMHvQ1HkD1pHALKiULc4JT2V2oHPTw0ti4yEpeJCP834V8uZRXEQ
 MP+Yv2ShUkZLUSZutMZqbouHiKEmzmtOnRUkR8x5kxlGV/V+JvhjD2fTkRe6vOcdYRfX
 bwDruCruLVFTPdROVuIFugXPyyB2ZnouPrFV5OX7FmJ1sK+99jFrxhG6I8irVY8IF5lK
 +cB/syMm7WU8Sv+VG0D9Tbx1Q4YVzqiOvChDrGaKz8MlcytvqSnK1WGgqk9CjIvmn7Tl
 kz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765991586; x=1766596386;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0uhcrtD7jnKn0rTYmKdWhCBWBmuzsgB6qyok4bl7+AY=;
 b=GdF/z1Q04stGykB2c6jY4jPOkzPd4VoRDFWvDiepuh8n94B7DjAQh4JbtqVhED2AY0
 R4TpE33vJ9LtNGzrJNsIT6rsxO0NMPRNTPWYP7yd628WPN0/cGyBBAlqHA0VJ5Bx5Bn5
 MNQ6v6xlsLXtb4poJkS8wOUK0b2/TnTWwk3YoEGwK3AER1BBZ+BU/3vDq74ur7Qugc6P
 YjuZ8yKMbFuXX4iDR3RYiPeE08hFYnEb62xGIrX1mTLAOUqVxl8nJcWgVOKPM7I0jKNB
 rAsnHGUkIuEDcQ8ZFNZRuax2pqnYmisCczsrJJkMW17U4+PqvZCsrUpbA4jW/BHyjdAH
 w3GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVunLrxK1OQvaG3XvFFYjSuAGJ6HdI881BwDaeIfoJs6rRTu5ZGlqbnS8ms81fnBor8qr5xnCxwXw==@nongnu.org
X-Gm-Message-State: AOJu0Yz/mprE50C2MBkuk6uS+lSuVaBBJd7lw1kV2RWZvKbkh0cccqYJ
 9gxEya1zDjEJHO+I6VIzVlVOEXvWKmxWj7C2dcB/bVqw5Bf1uu0Y7m+IS28cXrAWEhw=
X-Gm-Gg: AY/fxX5A+Ic+MNGyetuX+7hv/CcdpY5a7lyg71EwXjcAJRN2So7PxAG4GnQ4/++cJDV
 dn9zyh0V4ZcRuCCiEgyhjYuyDWITbrx8Tr60gVWnIY2B33ntOUdvfgeaH8F1MIZ7f5pSX37Ewnb
 1gZAfd14dU27FMxzCj4knC+tPUtjv+fJNfenejFXq2chEsuIFk51wLLbZmsYR+WFEKOJWNeyB5n
 3Mr0AT+4uVtuEmG0fMm1vATz6AGXzw/152BzmSyFAAYXtXk7yxGSN0zUjDNmCNWys6xwVK0p94J
 qNudXmcyZn45v77p4LzP2kZwdt2O6N2nRSorbaTdFARfYMxit/a0OH9HA9rksYPxDqXzLn2KrSh
 TxR8h7J8PEfx9KMAs7XVNFUFFNkLm4Bkk6KURj+8esCOnVP+SQ9ajOi/gANWG9Hnvyv1DLBJS5O
 0o/DWmSGvc16M=
X-Google-Smtp-Source: AGHT+IHoZxiTcmP06/2wwQxulI9RIw3rEjz+BHixGX28IjJKlG5wt0th4U1OTJ8etmtlm0IAvNuTsg==
X-Received: by 2002:a5d:6282:0:b0:431:4b7:a309 with SMTP id
 ffacd0b85a97d-43104b7a3famr6454152f8f.20.1765991586050; 
 Wed, 17 Dec 2025 09:13:06 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43244998ed5sm39080f8f.35.2025.12.17.09.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 09:13:05 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 94E645F828;
 Wed, 17 Dec 2025 17:13:04 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,  Eugenio =?utf-8?Q?P=C3=A9rez?=
 <eperezma@redhat.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  devel@lists.libvirt.org,  Richard
 Henderson <richard.henderson@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,  Jason Wang
 <jasowang@redhat.com>
Subject: Re: [PATCH] hw/arm: Deprecate legacy VirtIO devices on big-endian
 guests
In-Reply-To: <aUK9f3qG78Plwmgh@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 17 Dec 2025 14:26:07 +0000")
References: <20251217140658.89715-1-philmd@linaro.org>
 <aUK9f3qG78Plwmgh@redhat.com>
User-Agent: mu4e 1.12.14-pre3; emacs 30.1
Date: Wed, 17 Dec 2025 17:13:04 +0000
Message-ID: <8734592frz.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

> On Wed, Dec 17, 2025 at 03:06:57PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> We couldn't find a way (guest OS with VirtIO drivers) to test
>> a legacy VirtIO device on a ARM vCPU running in big-endian.
>>=20
>> Deprecate for the v11.0 release, giving 1 year to users who
>> really care to contribute functional tests.
>>=20
>> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>>  docs/about/deprecated.rst | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>=20
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index ac31a2bce42..3a69facb0f1 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -515,6 +515,17 @@ It was implemented as a no-op instruction in TCG up=
 to QEMU 9.0, but
>>  only with ``-cpu max`` (which does not guarantee migration compatibility
>>  across versions).
>>=20=20
>> +VirtIO devices
>> +''''''''''''''
>> +
>> +Legacy VirtIO devices on Big-Endian ARM architecture (since 11.0)
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +There are no functional tests for legacy virtio devices used by ARM
>> +machines running in big-endian order, which makes harder to maintain
>> +the code path while the code base evolve.
>
> Lack of test coverage is not a reason to deprecate something.
>
> We deprecate things we intend to intentionally remove or intentionally
> change in an incompatible manner.

We also deprecate things that stop us moving the code forward. c.f. the
long process to deprecate 32 bit hosts.

> If something is not tested, that merely means it has lesser quality
> guarantees, and is liable to unintenionally get broken at times.
>
> If we're planning to *intentionally*  remove the ability to use
> legacy virtio on big endian, that would be a reason to deprecate.
> If so the deprecation message should say this, not talk about
> missing functional testing.

As far as I'm aware BE Arm is a very small niche and I'm not even sure
anyone runs BE Arm systems with VirtIO - let alone legacy VirtIO. If
there are people that need this functionality they need to at least make
themselves known.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

