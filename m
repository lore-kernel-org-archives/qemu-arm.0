Received: by 10.28.71.155 with SMTP id m27csp326821wmi;
        Fri, 23 Mar 2018 04:08:18 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvsGjBZ7dDpFebNJMQIDbrONCQ6dHiuREvFLla8GjoqQ50mR5wEHv1P/vquTZRbX6Stiobx
X-Received: by 10.200.53.6 with SMTP id y6mr42290134qtb.58.1521803298240;
        Fri, 23 Mar 2018 04:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521803298; cv=none;
        d=google.com; s=arc-20160816;
        b=jyhQ1NJTVTOiAX4vf+7P5m2bEQp9sw/RlaiciG7vitM+g1PYM9986wHtcFd3fUEw5C
         UjcKjsr7aMU28kFAwjSSDt74dr1HSrUXDd/8Bz21zOate8rU/72nCLjWqEIcZag1X+U5
         ihoc85RpFLHmvcOpTnwYkKSw0JdoI4GkZnzo9vzaYBpnGVONNH4wD1pyCHL3n3TQN1QX
         meQgssAiPIFmnZBw0H5ol5Gu9uPflQOzfLaSqrhX+/6fYU0LanG7wyfvwGF5CAfG6p/S
         yddYAvLiso0g3eksJwQRGqoeIZHbQx193o44+0N9qewMoWdk2vssWuAlM9fStEctTcYu
         S0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BXPXZCi7w0GCScefp4ljWWBzdk07a/Hy+OxFaLa7g5U=;
        b=mR9FWlK5A9udmleOlFLpeXGLh2g9HRfP9nYpFB6KjvzFlsQpzfkzAkfshKfUar+LNs
         dYh8TS38EJ/wGhSipUrIL1g3OUEAWgJ5CbX8y57/9Nxg6YjaJkXjwbV+YAyq3ocJ+9zh
         W7uKwoCY8iOSQR49hzURZqj/lHEll5UHnf2YAZSPQRqH9Qp1R9Q9cMeI1vijY9OojQn7
         dFZOa4cUmPwMo3tLIKb/CmQ661SPU2RC4aq/kBNSHfG0eAqja+oufUdObERWmtuPFTUf
         0V5y50fL4GWnPlmSuWSn+pgJprenS2P0L3fWqc5v1YocP5A7JUKY3Gac7YMXz9+bKSWT
         PEAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WsKCngro;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15si572087qti.482.2018.03.23.04.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 04:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WsKCngro;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezKYT-0007YL-Pz
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 07:08:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezKYC-0007Y4-PW
	for qemu-devel@nongnu.org; Fri, 23 Mar 2018 07:08:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezKYB-0002Ct-PD
	for qemu-devel@nongnu.org; Fri, 23 Mar 2018 07:08:00 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:41492)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ezKYB-0002BW-JY
	for qemu-devel@nongnu.org; Fri, 23 Mar 2018 07:07:59 -0400
Received: by mail-ot0-x244.google.com with SMTP id i28-v6so12795247otf.8
	for <qemu-devel@nongnu.org>; Fri, 23 Mar 2018 04:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BXPXZCi7w0GCScefp4ljWWBzdk07a/Hy+OxFaLa7g5U=;
	b=WsKCngroUnGgDVLCrc4EDK1DujPHfVMaRWCyp450z6hQlj7bmq3bCj+Qe5Bkz3s2M8
	7yIkv5xWT7E85/lMO7/2aB0aarFMfilVnyqY4jpSnAooGcidcfL6IhYZlPT/QkMSvPVe
	uLrLqhsk7Q/KveRB8qekNUXuTDUbrh8jJcBnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BXPXZCi7w0GCScefp4ljWWBzdk07a/Hy+OxFaLa7g5U=;
	b=YZDeedH7VcihUmQ6RslzyO+25TIOwuv/Hy+PrOhlSx46/f8bYgmYNkIMiKARGPzUlV
	ioDYeziBVtYfymJ6Hcs0YmrAh4De3c99OuGC7rlgLJVavwHkztu+xKtqVLLaIpToTAHJ
	rvSwmpYiE7rwOolFj8+KXTRZxHnPwTcC8E0dBiZpL3EYdzOsosH9nswr5ivTvKbX9qaO
	vihKfk0GUmIagEgTFWxl7tgwqNm/vl7T5Z9GIyj1xafiGVAVL/KUHSzSfDvXbL+h2UVT
	AzSr5a5nzWuKMkY49VP//aD/b51eMERrXtMB7iokvPDyPv/JdmHL/sayubrifGunOazO
	U0pA==
X-Gm-Message-State: AElRT7Fb/Ilcy3wTjuZeq+roraLVgUeKNHNxL83y7LIMeiBeynzeUewd
	zyhyd8dk6ylnaiDkYcF+97tOiGATBtyqt91k9jGfkg==
X-Received: by 2002:a9d:56f0:: with SMTP id
	b45-v6mr10836898otj.294.1521803278825; 
	Fri, 23 Mar 2018 04:07:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 23 Mar 2018 04:07:38
	-0700 (PDT)
In-Reply-To: <20180320013657.25038-1-tpiepho@impinj.com>
References: <20180320013657.25038-1-tpiepho@impinj.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Mar 2018 11:07:38 +0000
Message-ID: <CAFEAcA_nHaMqGBdEW+yV7O1oA1ovrWGgB5zOE1OXey2AnCS=dQ@mail.gmail.com>
To: Trent Piepho <tpiepho@impinj.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [PATCH] i.MX: Support serial RS-232 break properly
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hJ3gmGY0HJrR

On 20 March 2018 at 01:36, Trent Piepho <tpiepho@impinj.com> wrote:
> Linux does not detect a break from this IMX serial driver as a magic
> sysrq.  Nor does it note a break in the port error counts.
>
> The former is because the Linux driver uses the BRCD bit in the USR2
> register to trigger the RS-232 break handler in the kernel, which is
> where sysrq hooks in.  The emulated UART was not setting this status
> bit.
>
> The latter is because the Linux driver expects, in addition to the BRK
> bit, that the ERR bit is set when a break is read in the FIFO.  A break
> should also count as a frame error, so add that bit too.
>
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Yep, the data sheet is nice and clear here about the requirements.

Applied to target-arm.next, thanks.

-- PMM
