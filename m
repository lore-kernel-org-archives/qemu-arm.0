Received: by 10.28.71.27 with SMTP id u27csp637865wma;
        Fri, 23 Feb 2018 06:11:14 -0800 (PST)
X-Google-Smtp-Source: AG47ELuf/OobyStbgpw1zPp46McYFbuV9gxQg7/yfltgQlddl8FT19nSqDf8kFCNDSavM2/TCX1S
X-Received: by 2002:a25:a545:: with SMTP id h63-v6mr229256ybi.398.1519395074057;
        Fri, 23 Feb 2018 06:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519395074; cv=none;
        d=google.com; s=arc-20160816;
        b=YBBMIlYAuWz8X4LY9kVtiQiaPvGwRC32z4KRUezc/WqHGBgmOL/f/+cGFa6AsD6AMc
         akRm/noa9JIZQUn0YMgAI2ZmrInCTm1YomJlPqakdwKPhW549ZcE2ocVIdzTu/iZlMrD
         WalAuHv2OJtctXZWVE0arq3JJG4fnZYVoEwvDj/MbI//P7VHDSwyCLmgIcE0UlX9vRiQ
         7f9zkWyCbUq60Zru8f7HKTsdKV2K7lHj6tpUi4DQjCrl/YSU5u2aUnYrwkok/9ONJrKg
         Qn66Vc63cVnc9+aun8YFR7N+TvNwFWlbOvDV7DIutbaVO/ANUkupk2L3XRCkyiD+rmik
         Yhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SmzYOC71FYoJuwfoGYK1reriV4OoY2oZ97+PDE5UNic=;
        b=x2xHbbjiYPpJdT0Jm7ZlO9+4LRGnq022S2XaqlDMTI7OunxWP3lypzDXBn9SLkCePT
         o0rD1DQlo0tmcCj/W7NmxJJfHcTBAAgGKtp8Dm3SbQXwZSlGyhB/yCjfZVAvzoRpiLfW
         5duTbNenO6Xs563vAPdUt66W84J9MArusdcvZOZl1276E+JDv6ds8AxT5iWJpuH9jyLr
         f6bx9JrVryhkcl+NcXL3Eo/OjBFT7wQc67+uuBCxpejm+eqJbWX9Mt/Yj4zk9sZxeLxN
         4GQpFso9nS6bSTPJmbOyAnqWmjFoLv3JRKK58WApYOpnQqOzZ+ZEGDehBAxLxRwzot79
         Nl3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iFDy77GV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b15si408866ywb.619.2018.02.23.06.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 06:11:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iFDy77GV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epE49-0000WF-Co
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 09:11:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epE3x-0000Tr-Js
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:11:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epE3w-0007lu-QI
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:11:01 -0500
Received: from mail-pl0-x234.google.com ([2607:f8b0:400e:c01::234]:41824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epE3w-0007kK-Jq
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:11:00 -0500
Received: by mail-pl0-x234.google.com with SMTP id k8so4953155pli.8
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 06:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SmzYOC71FYoJuwfoGYK1reriV4OoY2oZ97+PDE5UNic=;
	b=iFDy77GVXE82zDOI2s/NMhxQzevgjdp9bI+qZqbevwQy2TyhDv37UmJIAB4GsNvCSP
	6Af90M693hgg7s7e+PK55HsfQwcjh5oVtlDgGydfQ1THGfeIPOfbCTs1FVFXUHB3H6Mv
	uEfCbJHvjijnsxm3PWfJZsRoohsbjHtp0zppA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SmzYOC71FYoJuwfoGYK1reriV4OoY2oZ97+PDE5UNic=;
	b=YwCA/1CwzQUv+6NhOqx5t1Q5KBud3d1tA6MpV8FjSUy6x8N8wpa75GbHWnIwbeAUgQ
	8anfTVfWZjBcUbF6b0aXLg7amgJxbeFzB/dFUvBcdjPxCtawVmwQw+TE7f4BwP1OXLan
	vyq9qjh7KDoHVUAU5Gv9KLldukIl4Jyb8x6PU372KxNIo6ZY5UNoFvmZRXWqVJKfNoW0
	clC1xxQlwroxFPAvgWE3cLnqeWc1lJDqBlbwhy0ebRB8Y38fH13cT3JRF8OitMtcMdXI
	07y6/QRENqYxNL6QGhWqu+vpl/eD10GHGlYB9BVcoUWtrhj0+EYOnxDCvokekYFa+I8O
	NjEA==
X-Gm-Message-State: APf1xPB9Gtb9+NpG0L4qMQnJ/8PJC843eOAnp2aWCwRchbDuWIe6PLMK
	lxOnsU3pZMo8I7kxOJTb/eGQnPHa/ORW9dr7XB0kBQ==
X-Received: by 2002:a17:902:8b85:: with SMTP id
	ay5-v6mr1886723plb.329.1519395059388; 
	Fri, 23 Feb 2018 06:10:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 06:10:38 -0800 (PST)
In-Reply-To: <20180217182323.25885-25-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 14:10:38 +0000
Message-ID: <CAFEAcA-ZeLDLjii2A+BeVjg923DT=Skw3gQLp3eZvuLM0aYfNg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::234
Subject: Re: [Qemu-arm] [PATCH v2 24/67] target/arm: Implement SVE Bitwise
 Immediate Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c/rjRafU6IvX

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 17 ++++++++++++++++
>  2 files changed, 67 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
