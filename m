Received: by 10.28.71.27 with SMTP id u27csp558399wma;
        Fri, 23 Feb 2018 04:58:30 -0800 (PST)
X-Google-Smtp-Source: AH8x227nuGyy0RjLnNS/J2+Q7sAoGtjSHe2sNn256cviY9ZNaEzbqV0mVXt3LWktL34pfCxoZPY+
X-Received: by 10.129.158.85 with SMTP id v82mr842262ywg.229.1519390710463;
        Fri, 23 Feb 2018 04:58:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519390710; cv=none;
        d=google.com; s=arc-20160816;
        b=KcI16kZ8k3B7a0z6zs2Uu0CcbumFMVK9VaFl18upN3aOIFAPdIYfOn4SiFIKmLVpk3
         UcgHRbHTH/cNhLg88je3KwW/A8xytb4fysc0yZzgh305SABXjbC751hBQIYSFYOGxbLc
         KiFUAicwim+3HnWuq3LuWFJyHcN7uu7AM56tVU65jb/hqM3FadO7XBHxJm7zEAW+Eh8C
         e+iSPdXSDC5cQ4BEtyDhA1892FhCmx9XX6PbYSLe5UfA22KRFRmr21DLB12uwZWpY9qY
         v4nOOTgbFVzUvFXHTYSHEnVh4tyGSJSCaVPwrhkYqdESib1y5ovPxFAdkxBKVqVVsZ0d
         a6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QGSmsjmTs4khC4o4Kmnrlbnat5Ij/VPpWI7bWgzTeFs=;
        b=cFHLBWx3x/lqTzlErfo9CUBssurTCv1OtgQSWxciGXbpU3rU5JmaxDNn0UASfIEVYH
         aDMOAK/zdA7CjNpKorsLDOI3fbhSIx7TUJkt4q0adp1JEOpfGBCJ0mOVa4L8xnXjn6ll
         vK+oa33RGFdT0MGNkE6kc42Ix3BKQ7iEqC3G162zI1qKbCaBdJhzcA0ZBSFRAuyowvpX
         fqigzp5Mo24T0RGPy7RaL9VJXKt9bnRxb+fwLLXVPOge+beB37TLFqDqGBp62VCZFmmh
         b7bd/RTTS1xNi1ZFwKxCVrPSGtpdldUwkxYQctv4g9Vy0N9fxaAj9TLxu98H/NbQDN6V
         Qaow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QoNKHcQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8-v6si387515ybc.278.2018.02.23.04.58.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 04:58:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QoNKHcQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epCvl-0003iE-VS
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 07:58:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epCvZ-0003hE-Iq
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 07:58:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epCvY-0008OK-W1
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 07:58:17 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:34618)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epCvY-0008NL-Oi
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 07:58:16 -0500
Received: by mail-pf0-x243.google.com with SMTP id j20so49043pfi.1
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 04:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QGSmsjmTs4khC4o4Kmnrlbnat5Ij/VPpWI7bWgzTeFs=;
	b=QoNKHcQPZ+mqGpc6y+tEJVq9xhSUY/0yXhwDE9eofdr1ryZwxRuMleP84I52+8Lnns
	EAkLizxxSOTylhvPJlygIjSyKuPSNvQTYVg6qWHqxujOKtYYjBZzLfyyN8EPOC/OuPjy
	1kQbvDXXT1O67DZW3r6rFTjIP8A3hq2HgX9/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QGSmsjmTs4khC4o4Kmnrlbnat5Ij/VPpWI7bWgzTeFs=;
	b=ExrLij4CUPChKYBTX4GxVIYQtIi8EgimS2q6QeKqx5jXhMDa2eOXFxREcBO8bTbAv3
	w0df737kKmZb96jElTq99u4qI2iyMPqJ3ovX0pdPMro1kRsXVZ8RL6NQwws6dCZPFYz0
	a9pIrcEm/KBSh0/JqZfCRk8Kn6usK/J9dhpfmzyAivIJDWU8X3KlfRqbB2NUMFpT4Cfv
	/PxZ9Owsan0XQN3mcWLSZ4N3WGJULOp2JBeNfHNJIcYS+vR5ZGMeU80hbMogQX5NVHHa
	YDtPkoZbHRjRiafJXghzfejXbbJB+11M++gDkq51angNQmJelMB4BfB1nIBJLBPmvkr8
	5iSA==
X-Gm-Message-State: APf1xPCsUvdv4HHBNlvqwtcVJfHS5trsjFmlq0vGuy/OfJMD0ifQf9JJ
	5pVMVOW56cO8+BYngOAZ0nMit0Gy6mWhbhHMDuGYLA==
X-Received: by 10.99.120.13 with SMTP id t13mr1405045pgc.35.1519390695571;
	Fri, 23 Feb 2018 04:58:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 04:57:54 -0800 (PST)
In-Reply-To: <20180217182323.25885-14-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 12:57:54 +0000
Message-ID: <CAFEAcA9VrN4qwOJ8ch2tkRURQOEngSSEzTP5vAT5JcAf9LA9cA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 13/67] target/arm: Implement
 SVE bitwise shift by wide elements (predicated)
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
X-TUID: C11pSoa+u/D6

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 21 +++++++++++++++++++++
>  target/arm/sve_helper.c    | 35 +++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 25 +++++++++++++++++++++++++
>  target/arm/sve.decode      |  6 ++++++
>  4 files changed, 87 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
