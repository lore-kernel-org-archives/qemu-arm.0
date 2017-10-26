Received: by 10.223.161.27 with SMTP id o27csp899335wro;
        Thu, 26 Oct 2017 09:41:55 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Q+4oOGdodkgP2U2L2qPaBUslPig+W1OZE29l0/69/bQKnMzJ7Y9f8CDP9IT2hXljEuTsdp
X-Received: by 10.129.109.214 with SMTP id i205mr16383408ywc.509.1509036115178;
        Thu, 26 Oct 2017 09:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509036115; cv=none;
        d=google.com; s=arc-20160816;
        b=NCrziIXzfP/fMFTY8pone2GwoJIiguw5APgKK78aV8R5CSwndus/s6/5T05gZFOGC0
         WxW+YUTrS2BpVmdolNYy43uYjZc9w1PpA06+JNykNt5bRYjoUBR787oH0MhWBiWXnIra
         2l7ERZ0HP0GwyBp1OME1JNw4lp839g4bLtsB4hYdw2gUECwLDq0APOmdy2A3D6cSR70S
         HtZLwgFF8TT+Rfe6ykwYtOrQFi++le9FMULOXOGaHVMNFJw7sAZME34asm03zzKl6p1p
         a4RNzucTSE+9o0mkf/BI+3Ken+ng0GoABQsMrROku8Cjeae+5sWg0WOJHvUoBjc2xp/V
         BX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NTenEeKESlmecacNY3omZ3h7dxw8+tw4YqI8uB633FU=;
        b=KU/nuvQGMPG7jfbdKCWsz60iU/Iw0NdldcGrnuaVNnWiolUCnrq4LeXg0snOHqgMwx
         kIydHoJPO8Vad538M6Zz+zxEhND9ucJATQ/8CbRJQQcqe8yOxiWVMNwpT7vHgtLLwXrX
         Ux/eDz7dx5rTUX1fvaVUDTnmK9T/P4BV82tgjQQk2gVMSHc9ZUCzRx2uL6XycckTurdf
         fD/bNwPL7cA0SX/uUvcP/7hpdflCba2XTRIAAyzeMmWxNitxcYn/acIaHSllZfA/EC96
         o/h3kiORaLy/CgHUeqbTjk0lu9kMmblosrMyasoMm/GDXTkbdf2N2aFNARAgFvgIT2kb
         vAmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eNwanRQc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d145si861740ybh.139.2017.10.26.09.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 09:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eNwanRQc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7lEA-0005wq-La
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 12:41:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7lE2-0005wb-8g
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 12:41:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7lE1-0001Ve-EA
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 12:41:46 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:49434)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e7lE1-0001Uy-5R
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 12:41:45 -0400
Received: by mail-wr0-x244.google.com with SMTP id g90so3785603wrd.6
	for <qemu-arm@nongnu.org>; Thu, 26 Oct 2017 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NTenEeKESlmecacNY3omZ3h7dxw8+tw4YqI8uB633FU=;
	b=eNwanRQc7/6f8FJmYM3CjDMVD0ffQ1eQMUzFS0UKbBsZ1qM+77QWt4ImZGjDregTP9
	Sd7oTx2kJbHJrvCna2P5bFNGjN+ZLfhEdbZtT0ToPKV3D8UaCHlXIf0uUFb1VU5h9LuG
	iwOS2fqx7A2qX2Ryt9tpTzg0E/e3Y8l/rw2Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NTenEeKESlmecacNY3omZ3h7dxw8+tw4YqI8uB633FU=;
	b=YwYio3rWO+3TALA1uRtvjxAE91pR56bY1rgtWcknXD+fPdCMRHW6OXlnBf9WorZT3c
	wyR/6zsbqVIZ1cqfaAEXDPp1V8NpIcVllxyV5XaMpG6+zYZNkWiv4Gh0byGkz8ILfKdx
	kMgIQV13NvPbf2MySKXUcW58EFPJ4Ze6EU0ejrsdrloNgJ+kQI87hln9olcLWLWR55Wo
	Ugq7yj9E4O6onJKZeMkevCZ9pRycvPb8Bzd89FlBZyAc/VozPdUvnpQi4XRFQMH36b9t
	6MLtDpvApXIuY2pTU5y58G1fi0VTy6Wq5WjaqKjRwWpMdIfWiCy8qQwrV+NWWHuJz6V+
	v1ag==
X-Gm-Message-State: AMCzsaWN+9LhnSxOZF14fx/Fvs+R7KiFhb87iwMbLQW6Dv5NW22IwVV+
	p9GpsmKdMNxDjxWExR3XJ4JQh+gzyPrY+7WgSMdv9g==
X-Received: by 10.223.143.54 with SMTP id p51mr5579791wrb.138.1509036103762;
	Thu, 26 Oct 2017 09:41:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 26 Oct 2017 09:41:23 -0700 (PDT)
In-Reply-To: <CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
	<CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
	<CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Oct 2017 17:41:23 +0100
Message-ID: <CAFEAcA-bKPNwJpcny=1azScO8bzHsi0Ou+m3rYPq-=v52Gf26g@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: support 4 serial
 ports
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eJGI7jJbvuvT

On 26 October 2017 at 17:36, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, Oct 26, 2017 at 6:34 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Reordering it would break existing users of the trustzone uart,
>> whose command lines would stop working.
>
> I thought this was the reason for all of those virt26, virt28,etc
> types -- people who want stability code the revision into their
> scripts. Everybody else then gets the latest.

Those are primarily about migration compatibility -- you should
be able to live migrate a guest from QEMU 2.6's virt-2.6 machine to
QEMU 2.7's virt-2.6 machine. That's a stricter requirement than
the compatibility we want to keep for non-versioned machines,
where generally we don't want to break command lines but are OK
to make changes if they don't break those existing uses.

Command lines get baked into all sorts of scripts and so they're
effectively part of QEMU's "ABI". People don't like it when we
break their previously working flows :-)

thanks
-- PMM
