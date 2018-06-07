Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2228151wrq;
        Thu, 7 Jun 2018 08:17:03 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJbHqrvFiCDG92YYd0KLrE4MM4heB4AQByCjFFOmvWQi3qXNfYCNwaQZfnclPhzF1w2uMsQ
X-Received: by 2002:a37:1bc8:: with SMTP id m69-v6mr1925520qkh.264.1528384621640;
        Thu, 07 Jun 2018 08:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528384621; cv=none;
        d=google.com; s=arc-20160816;
        b=Y6jKj+UZCUljKa+nHAMUwY4fCmn3f3b8qMOr0Zui00wppLlAv49TmRUwXQTVbiNBYg
         1CV2FR6DxMDZQtZb1OtIYPDxC5KVko6YeAQmJV8Cuq0xbDxgYL5Kk2JYhoMpO7316kqs
         EIbrzhyDD0SXClor+JGULYptSdI5lherKkNlQSAcsxLqj763ikpDLR1qXl+DcPZSeqrV
         sakoI1RVuIKFcekYNp94An4RYhLSZqcYPS+uaCjVWZgmwT2zwlvVrkc1gVnAu9+DCpFo
         EL40Jl1YQ90jRRYeTi+MuwBUvPP7L856WpfiXT+PPiw2z6BA/OTPsYoTkP4OlmXGTzEJ
         xDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=6cI8THl140gpnLEjDyWGBo5Lb96pq9a8/YoGiCEdG7k=;
        b=C7Hqv4BmqKljd0Qrfnema9LIPXWoIyy4XhAmqAAXQz2FaKpNEB4XIf4DqgMpNp4IBS
         s89MQAHM1f7AmitFD3T0eA9gecAuMf3Cxu4KbnbIXC+GsNo2ynaiBD08rXjS/eMOZBwa
         LkH/cUKUwFxjMrZpt7VOckUwpOlgjeN1IIdU4osAJ+LxmwM8izNOeCwT4J+nJAYDWfV9
         gx+wZLEvgjdRyhby864/+uC+IJOvdGncstW42HEdZgCqKVwZW2vdTf9tsxJ9InV5e1RL
         H+K+rakqRHw6BXXYLrv1kszVlSoQAY75NrlgmrVz1uqmZzLQbdkBYwcjLsD3i9UnjtKa
         70hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bE4pxcgp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 201-v6si17735770qkf.155.2018.06.07.08.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 08:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bE4pxcgp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQwer-0007tm-6f
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 11:17:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQweK-0007eu-Lf
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 11:16:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQweJ-0005ZQ-KR
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 11:16:28 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:37556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQweJ-0005Yc-5G
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 11:16:27 -0400
Received: by mail-ot0-x243.google.com with SMTP id 101-v6so11962605oth.4
	for <qemu-arm@nongnu.org>; Thu, 07 Jun 2018 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6cI8THl140gpnLEjDyWGBo5Lb96pq9a8/YoGiCEdG7k=;
	b=bE4pxcgp1nxh1fgztlmVn6aNtoHXIBt+qxRKXK6l+h/vrSPuwe/BcIM1L03151daM4
	yYTf3m5r0a3tDja9JwFhS1+i/hPUIQWJ0m3vL9zq1r9Kd8HMOhUJoshjhlabnSfiODDq
	b3byS84B1vTl0E0ot3IvU7HZHfGuKhDt5BIJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6cI8THl140gpnLEjDyWGBo5Lb96pq9a8/YoGiCEdG7k=;
	b=LQgI6FUm8MxF2zLdwNJM9nUDtd6X1YMOgIQSPqVGEzS0vp/PlXPVHK+TFSuiu7u+Va
	KX5WstdmLv99pW0WxxiZKrHA0hAlxm4a+/VFvlDraWAzDySol/xffojY21fTDfce64lV
	qMsoucXbD9HETTX0rt8mC/aS/bt6Gsc/xAKoXtV65RMGXB9TU1ye/N3SlZq601W71fkd
	zkF7+BDOSYwNcgNe0EdsFpb+2dvFn3z6SaT3afKsNdqBdsyuzNM7ed+zoV6Ebg2U44t3
	COVAYEz6DVv8rQ0+xMm+VbO/3072Us4bv2D33nSpz7l9h/eSL1kzUsqYWi5xzP896Ibf
	xDkg==
X-Gm-Message-State: APt69E2KqSYPLK6+adRlCJJXjK21xdkzpGMNKDJEd1bHLgkwB3rgjTpF
	kJ4HC/IQ+GdNXq8SXw2sRl2715Iwy3K2zLzGvR6hjQ==
X-Received: by 2002:a9d:2909:: with SMTP id
	d9-v6mr1176015otb.258.1528384586293; 
	Thu, 07 Jun 2018 08:16:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 08:16:05 -0700 (PDT)
In-Reply-To: <b5db1ee8-68b1-a41a-be34-eba99ef5565d@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
	<20180603000827.30872-2-f4bug@amsat.org>
	<CAFEAcA_EDXyOHpdamg05=p35jazqgZsLKP2O+G1tg6BoR4b28g@mail.gmail.com>
	<b5db1ee8-68b1-a41a-be34-eba99ef5565d@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jun 2018 16:16:05 +0100
Message-ID: <CAFEAcA87m6GYQrvX-tCQLgFMFXBZ_GN=WLh6LxYvXP+OJAJvFQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH 1/8] sdcard: Update the Configuration
 Register (SCR) to Spec Version 1.10
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qt1k2hH4mlNK

On 7 June 2018 at 16:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> The current codebase is a mix of v1 registers and v2 commands (which
> were added slowly without updating all registers).
> As of now v1 is broken (See the lm3s6965evb machine can not use the
> card) and all users are using v2.
> My goal with these series is to also support v3.
>
> It might be more obvious to first enforce the current implementation is
> v2, then restore v1 support and go for v3. I think this is doable by an
> easy rebase of this series (keep v2 and restore v1).
>
> Do you think this is better?

I don't have a strong opinion (you have a better grasp of the specs
than me); I'd just like justification for why we do what we do
in the commit messages and/or comments as appropriate.

thanks
-- PMM
