Received: by 10.28.4.212 with SMTP id 203csp1067319wme;
        Thu, 10 May 2018 07:12:10 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpboXKZo3poAgL/qF9jUifIxlDCnEzmARVy+RK6CO3e63sB9761uwLecPYvP3spR87cpO8V
X-Received: by 2002:a0c:bd1a:: with SMTP id m26-v6mr1404555qvg.232.1525961530214;
        Thu, 10 May 2018 07:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525961530; cv=none;
        d=google.com; s=arc-20160816;
        b=lXbKz0Yj473DuJvofD0Cl7pCLWdR4wUHh03S6S7ur8GsDUS7Zk4uZ6bnWZNG3X5FYJ
         ICTciIjgxhj8mGPZE8JBEjkhcEGBfcuas1aHiK7/XlzIoZIaQAHahWLpT8nmgEakMYhY
         mPbjo67xLZwDM6wGG8SzLWzIcauC7zWCC+3NJel7jn59EskRoVSG1HrfgUvVG/dAwD+U
         pB5lG9kGrMDRArKDTo4Caz0x9VZsm0yAFSFQwl8TdQKWZpDoOW4wmwuhUZ6GlYl+y78v
         1l0QhADIG11kYHYac9rf3qctO33UvBSw5G23C14iakYaqq44YObU6jv0gmzLdaACUfpu
         KNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eOrk6s/BivvrS8rjdUA8q9Tmuz8WICB6//R7viWhv6E=;
        b=RaF8IC9TM+1QPmdcSFyu8HG022+eJCu+1YQblv6UjIJBZfkR3WnrKl+qKTGDT5TNP0
         6HveLmiqQOsV7BdeZ4CWPDXi6+OGrhj/Z+/JZ/DyIPPcGHBc3PkUOmQsYy3tfrSz3bVE
         FOQjywBkJL5btvF0+Bm2dH7p+LtY/oht2mXlOaMw8Q3O6Z2xE7eiwAArvj4X8jC7DfZS
         mNdnNuwoF8mJIlu/XFlblw1OLrpSnyTTOpVLIwOQlpfSfOZAl+fPi0K2M6Fd6how+8kR
         dUQcZn0hPe5DWya6xZL8qENLjw3pCz6DjXOHFmZATsaVoE0psvJ4A0mUZyGLxXNN2Rjk
         73hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OmpTv/Uv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v89-v6si813283qte.69.2018.05.10.07.12.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 May 2018 07:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OmpTv/Uv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGmIj-0004aU-MX
	for alex.bennee@linaro.org; Thu, 10 May 2018 10:12:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGmIZ-0004YU-QI
	for qemu-arm@nongnu.org; Thu, 10 May 2018 10:12:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGmIZ-0004dr-3G
	for qemu-arm@nongnu.org; Thu, 10 May 2018 10:11:59 -0400
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230]:33318)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fGmIY-0004db-VZ
	for qemu-arm@nongnu.org; Thu, 10 May 2018 10:11:59 -0400
Received: by mail-oi0-x230.google.com with SMTP id k5-v6so1886169oiw.0
	for <qemu-arm@nongnu.org>; Thu, 10 May 2018 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eOrk6s/BivvrS8rjdUA8q9Tmuz8WICB6//R7viWhv6E=;
	b=OmpTv/UvN1YOb9UWs0uVEOdnfIwLQzm6xOfrx/4Km07kCxHdgUIAHV3VREPJM5v35I
	kUtmpYgLGj8CekBlIpqnPXw36qqx2avgbAvNNqU+FU/D8uBfr3GzrpVg5arUEXr78MRz
	9ZlwaOfOaO6CPAIEECRYA4I5p4lSzWga4gjPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eOrk6s/BivvrS8rjdUA8q9Tmuz8WICB6//R7viWhv6E=;
	b=sNrL2xVUlVEu4yRFC3R2VKKik7dQN3DqIBMSlAOvy7/7SY5y0TbCeCENxTkc3Lwy8M
	Riw1g6KlwZXcSlknQ0P/d4QO3/sfLrUcIzlgSzxEpDJthrqx2yqixOChuulQqffVpyZn
	dc4aq3ikAfNVbM4mxnJVQQV8sx8LxTpOn79TY7Fmxyrm4/yGJjZnr2pKaXwilizeVAL6
	jR0tH3QQgPe73/W/f2OBAH1oswImoqwjZN1YYIssHnFkveemUkp1v5OXoTrOlm3SlznF
	7WMbUDtr2b7aYYivxkpnk4DCAWzNxg8S2LAK/9PsNpLcSqTAM3kJDQsDYry940Q8gO5d
	YWKw==
X-Gm-Message-State: ALKqPwf8h9xETyqUShKAouALtHATVckSmThNQopGvOdamfHjlceGGKqF
	euSMr3cJc8S4tgtnloXhgrZU1W1530tES8oTOSAFfIX2
X-Received: by 2002:aca:cd0b:: with SMTP id
	d11-v6mr816737oig.337.1525961518214; 
	Thu, 10 May 2018 07:11:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 07:11:37
	-0700 (PDT)
In-Reply-To: <20180510140934.22855-1-peter.maydell@linaro.org>
References: <20180510140934.22855-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 15:11:37 +0100
Message-ID: <CAFEAcA9xoFxqkCKzXTXHZ4D+chhaJP9=RFmyfx2HnJfFhvJWpg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::230
Subject: Re: [Qemu-arm] [PATCH] fix fp16 tininess
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m8FarSyzcngT

On 10 May 2018 at 15:09, Peter Maydell <peter.maydell@linaro.org> wrote:
> In commit d81ce0ef2c4f105 we added an extra float_status field
> fp_status_fp16 for Arm, but forgot to initialize it correctly
> by setting it to float_tininess_before_rounding. This currently
> will only cause problems for the new V8_FP16 feature, since the
> float-to-float conversion code doesn't use it yet. The effect
> would be that we failed to set the Underflow IEEE exception flag
> in all the cases where we should.

Oops, I forgot to fix the patch summary line from my
quick-hack commit. Something like:

target/arm: Fix tininess detection for fp16 arithmetic

would be a bit clearer.

thanks
-- PMM
