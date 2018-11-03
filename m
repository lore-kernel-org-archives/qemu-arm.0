Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp343984wro;
        Sat, 3 Nov 2018 02:54:12 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fqy4hxUnDWIIKwb7hQDsO0fRQeG/Q2cYgoRrYfolW9m4Xdw3Jns6KA7qnd2vk4WwP9bMoH
X-Received: by 2002:a37:bb86:: with SMTP id l128-v6mr14099159qkf.237.1541238852141;
        Sat, 03 Nov 2018 02:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541238852; cv=none;
        d=google.com; s=arc-20160816;
        b=Mu1vEbCyu6+JhM0+Tn5m3aZF9otNujAc20HKGlu92VB/+DrSHo9ROa6N98/cWpkd0W
         OBx8Dx8mgPtDuGQtuw0dHHnbQguuKUYghkUVkbron9+K44WtpUcU+7J59VeX0C7izcNw
         R7XIJyNF/0WIYriG7C0bwkAv5rWYOr8mndolXPkpQUTDF31khyeThsq4NhHrfY+n/KTg
         zqBJ/LTeDb7QVWapYbVlMPQ69xJSBIPYK6CKYODFwNtbfmH+PWKP8MF1ZRUljP5aKfer
         7aFhvrQDMOk22CZslsb35xldO0TuCW1A4zCeZo2jFbA6FAzalAPG3PaCKj8RWi0go2vr
         TEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=TAoNFQ7lP6MdxgEzCcwbNEWGwbhHONVORv6k3S2bRMU=;
        b=f4DOAXxTnFmE5mX4MNJPi3nPCeuvatB+rYvWgYbaCP9+fJCCOvXj4Q3un2zU4TmiV3
         r0ZZf4TBIMIZS8Jt47kgkQo6RWru+AgUuu/wVTJ5Ugln87ZCbogyADJ8cGso+34H9c0L
         Wb2dE2KO97qxZ9sbYwcwYREGZHoOPvk9fZhbfqfE7YawtK7dUIxDH9fPIV+QFhWvmfmm
         cILqmpw/Pc2lpdouNjmOZZaU4Sl5XicUrCouDHl1Be5yn5UsJTk3i/r6jP8W9CnAOECc
         fEDWQDz8FXw1RDiVxKx/U68AGlGI/ThisNwwHhwDfKvFT1prbp5K1ECkTzUF0BmIzN/e
         UxuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CG5HOJRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6si1881582qvj.187.2018.11.03.02.54.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Nov 2018 02:54:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CG5HOJRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIsd9-0002Gg-Bu
	for alex.bennee@linaro.org; Sat, 03 Nov 2018 05:54:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIscz-0002GV-ST
	for qemu-arm@nongnu.org; Sat, 03 Nov 2018 05:54:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIscx-0000Si-M2
	for qemu-arm@nongnu.org; Sat, 03 Nov 2018 05:54:01 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41132)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIscr-0000Fy-PI
	for qemu-arm@nongnu.org; Sat, 03 Nov 2018 05:53:55 -0400
Received: by mail-wr1-x442.google.com with SMTP id x12-v6so4309165wrw.8
	for <qemu-arm@nongnu.org>; Sat, 03 Nov 2018 02:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TAoNFQ7lP6MdxgEzCcwbNEWGwbhHONVORv6k3S2bRMU=;
	b=CG5HOJRZjFzXrFJuKWwgsiDWId/8oblAmRB5X8J3fdGJQh28uzjkZxBxxeJmyZ5Ls6
	O4GCxtpDKxw/TMusu0SPr6E7V07c4Ho0XnOYr9qmSAFz1ELRx27+qkGGC0pSO7+NnfSU
	LWGshsDYDkigpP0x57bn4pi9XHA0Mja7gJb/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TAoNFQ7lP6MdxgEzCcwbNEWGwbhHONVORv6k3S2bRMU=;
	b=r1o8TE+51mmB6IWJrSbyITfAfHeomiw0bb7GPfYw7rguZsjGxbWmi0/rwqigJ48A+a
	63CsjlJv7aN/v/amVt91q7A+cbDTj8srWdUVny/0EoVea+R4jqbChwviWxVTAtvlL1Ha
	LtqMjm+T+xFJCutINY6XKDgMRzOAxMeeH+zKQj9uXeNjb8sawyJZjiJm0c48F4LlaIEY
	RNudhkIT1rCKD/TmOtJsyDbVJ4i3baRUnmXs3MbZDDxQGxEmQSBOvOXtHCBfegVS4HlK
	GKi7d9DpcKANut5OyRzYgUujMAiCjvLe4woqtJqVi9hXpxsqSe0IsBkhNsaV6NJ7S7fF
	AndA==
X-Gm-Message-State: AGRZ1gKBRwdi828uWYAuBtT387wJNncwJGoHfZ1kUY0VErE1T9sqPSEx
	tzSC8i2UpnR4OLdiKC/QcvdVpA==
X-Received: by 2002:adf:8c09:: with SMTP id
	z9-v6mr12803556wra.82.1541238826999; 
	Sat, 03 Nov 2018 02:53:46 -0700 (PDT)
Received: from cloudburst.twiddle.net
	([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm14953327wru.39.2018.11.03.02.53.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Nov 2018 02:53:46 -0700 (PDT)
To: Christoffer Dall <christoffer.dall@arm.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
	<CAFEAcA_tcR_33Q+2ZFHdzo4_9khXggum=gRfZ8+L49KmP3hHiw@mail.gmail.com>
	<20181102193529.GB12057@e113682-lin.lund.arm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <effa3839-f0ab-e6ab-e034-a1a6d1d06923@linaro.org>
Date: Sat, 3 Nov 2018 09:53:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181102193529.GB12057@e113682-lin.lund.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-arm] [PATCH v2 0/5] target/arm: KVM vs ARMISARegisters
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zzmAC/UjmRTp

On 11/2/18 7:35 PM, Christoffer Dall wrote:
>> It looks like the kernel can handle reads of ID_ISAR0_EL1
>> through ID_ISAR5_EL1, but not ID_ISAR6_EL1, any of the
>> MVFR*_EL1 or ID_AA64_ISAR* or ID_AA64PFR*.
>>
>> This is probably because the kernel is way too old to be
>> interestingly supportable for KVM, but we did previously
>> manage to boot on this setup.
> 
> I'm a little confused. v4.8 used to work (although it was perhaps not
> the most stable at that time).  What changed?

We are changing QEMU to depend on ID registers to define the set of features
that are supported, instead of re-defining those same features with the
ARM_FEATURE_* enumeration.

For KVM, there are only a few of those that are important in the end: those
that affect migration.  However, it seemed to me to be most future-proof if I
just read in all of the relevant ID registers so that should a code path shared
between TCG and KVM test a field, we get the right value.

Which appeared to work, since I was using a 4.15 kernel.  But I hadn't imagined
that such support had only just appeared.

> 93390c0a1b20 (arm64: KVM: Hide unsupported AArch64 CPU features from guests, 2017-10-31)
> 
> Which Dave (cc'ed) wrote and which was introduced in v4.15.
> 
> As per my question above, I'm not exactly sure what (if anything) we
> need to fix on the kernel side?

It doesn't sound like there's anything in the kernel that needs fixing.  But it
does sound like we need a workaround in userspace to deal with old kernels.

Peter, what about filling in some defaults via MIDR and friends, using the
values we have from the TCG side.  Then overwriting that default with the
registers that we can read from the kernel.  Ignore ENOENT failures and just
leave the default.

There are currently only two features that affect migration, and so must not be
approximated: T2EE and SVE.  The former is in ID_ISAR3, which is in the set
that is supported by 4.8.  The latter you were never going to run on a kernel
that old anyway.

Although, while I have you, Christopher, is there a way to extract the Limited
Ordering Region registers without modifying guest state?  Those are multiplexed
with LORN_EL1.


r~
