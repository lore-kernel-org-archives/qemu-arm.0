Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp465379wrx;
        Fri, 12 Apr 2019 04:55:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLnsrlSZXCk6YssqMELRBgL8HW5o4DCQrARZxKdmWX4l5QHwz0JNkMncSeVpK7NTG11hux
X-Received: by 2002:adf:efc1:: with SMTP id i1mr35193992wrp.199.1555070149074;
        Fri, 12 Apr 2019 04:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555070149; cv=none;
        d=google.com; s=arc-20160816;
        b=JRo3U+UC4NlbBHXdJVhwxQU9SmMR60Wco+jemGMmUcXgtLCeBHRTjqtPSlHVY/T3qz
         9gntU5We4MpBwnS3R2Btr4D0tVg4qAFZutyLHi08nM/P8hX3PGahT6AmwaCbCO/zAIu2
         m8B5vEK3v0d32bbxEQTCZD6w/iCM9BPMsT5l3imtOdC+LQXJimHyAR0xHtMXbjsj2p29
         9sywHjQqQ6+cRJVU+39SAHtuytXFE7yzyGHsUAgcm0OIQ4l+Zm04IHjs7BgpoUiBfweU
         GaXcTyyq0LYN+gppqjES3+xyiPbI5Wg1lG/K2H5ZtFpj2ndu1kQt1dPtBV7dvkqFoMjs
         dBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QSUhEcrMM6nXjWE7FcZiOeoP+fX/3itFG/b85YS5jwU=;
        b=g6yQUNiclNdOXRWeQz7Uqm1RW//sXhdIGC6pStvfj6vhB3FuBg62cQJoA4C5SJCWVR
         T4tQeNmcHrMtLCfB0mc92gOqNBlXE7DZPmd6Rz1TDAoN+06srq5DEMDOXPqK24WSb5dN
         QpOPDoyfwTCW8ly2a/pJ36N5mMi0ZlfhAGohIRWkD8URamFROSC3w94XyREJd+RSUyET
         Hh33y/wXs0tqsuFM7zXKir2WEqFWKH4sRJTgk5mcpxrlbcYWMwdBcsyPiBt0dw5UFQ/N
         OHSPprEsIo54sn4M7Uw4Mw7bsmYYfAzOQhaVDgC0/+vJd7eKCutEdRiVv26h/pCXse2i
         RpJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FRvRSIPP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17si27770058wrm.334.2019.04.12.04.55.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 04:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FRvRSIPP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEuma-0003EH-83
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 07:55:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEumR-00037L-Fo
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 07:55:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEumP-0000hP-HU
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 07:55:39 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44153)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hEumJ-0000b3-Uk
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 07:55:34 -0400
Received: by mail-ot1-x341.google.com with SMTP id d24so8089966otl.11
	for <qemu-arm@nongnu.org>; Fri, 12 Apr 2019 04:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QSUhEcrMM6nXjWE7FcZiOeoP+fX/3itFG/b85YS5jwU=;
	b=FRvRSIPPobww6sZaJX1IooydjG0274+F6Rw0ENgYb2LMe+uwfSg0Ge+xy0h8lFWPrN
	1+5KAinNyr5t7o76uNxHsJbDXmxIsg2u7v6ED86RQd5FVLUR0kHhRJbEo2o+yDYNLK8Z
	LGBLX7h0B115MSxH/4heEuaRolYka0jOZI4jhLYekv70s8iWjLzIeLOEFepkXC7gQDg/
	OpekBqqE7632PyF8fnkSMj9Au3OeYG9McxHQ7vOkYSlvM6fknRPwKDFWzLZ2ZB+wNJwx
	Wne0ibYGsyUmRAxf8TZYFMKjI+r24HlhG20XTqRfxdTwI6rXsv7QSoJNHVs7uEYx8neD
	SM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QSUhEcrMM6nXjWE7FcZiOeoP+fX/3itFG/b85YS5jwU=;
	b=lwZDLZyqtYrFgqwo2eVtkIVzcmYO2cF3CKUtfN+1UAWmzufknvp0ZE5+EZLc1QAsyu
	Kb68/UTkxwHk+kSanZUx/MY/3d0kA64CJhojLZJVowclE+e5tIcgzP/O4wwGxMFJnn8i
	1M4j9J/GDhLZH5aAWQVc4uhT45ZpFgJ4n33SdreCDVNC2qaRYZuP3X4x2Xvmf11J0GIC
	X7DP7W2t79DOxdIe/olSLKh41eUBABt96bxpyc7eFQGGdTAwpyUO0HMKH7jAB0ot+or+
	RkqGpPJ0+BWdkKFJiU/M3tbMaEU8oOXo/kQtwMoGyoFC5BvmesCp+CFc4sttnMP1C1DA
	Q22w==
X-Gm-Message-State: APjAAAX/uXaaxgsYgJVNEcG5kdU940KUu9j1dOGBjYjX/9YORf9ydt4M
	MOFwIBvJBqwiVWM1AM/fA2eXbWyHSZdb5POAVsVohQ==
X-Received: by 2002:a05:6830:1497:: with SMTP id
	s23mr33035642otq.236.1555070127971; 
	Fri, 12 Apr 2019 04:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190328062222.8409-1-joel@jms.id.au>
	<20190328062222.8409-2-joel@jms.id.au>
	<CAFEAcA_K1Rv1G-s=ndVYX6i_BvWME6ToShL6ZBpB4gnE3zdZdA@mail.gmail.com>
	<89438392-9a54-7f43-5dff-6ceeffaf9f3e@kaod.org>
	<CACPK8Xc_WeP3xuimjTBFRArteecikin9Qj8ZoCW-J2qBY4C=5g@mail.gmail.com>
In-Reply-To: <CACPK8Xc_WeP3xuimjTBFRArteecikin9Qj8ZoCW-J2qBY4C=5g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Apr 2019 12:55:16 +0100
Message-ID: <CAFEAcA9t+GUG8PK623gb4v6ZBEhDX_7coOPcgLHDnUXTsrcrvg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 1/2] hw: timer: Add ASPEED RTC device
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g8KR2nVzlFYx

On Fri, 12 Apr 2019 at 04:17, Joel Stanley <joel@jms.id.au> wrote:
> vmstate and migration is a foreign concept for the small ARM machines.
> As well as being a developer, I am an end user of Qemu for them (the
> aspeeds, microbit), and the use case is to boot up a firmware and
> check that it does correct thing. I've never considered saving the
> state and resming it, and can't think of a situation where that would
> be done.

It's a really useful debugging tool:
 https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-qemu-savevm-snapshots/

thanks
-- PMM
