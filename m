Received: by 10.28.4.212 with SMTP id 203csp1227226wme;
        Thu, 10 May 2018 09:30:48 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrnhh85zg3GZpN1Nz45XI1ymSFgwjyh8Rt+ONYfv/PjJnyt952LB3RHpaDEpp851YRnFuDd
X-Received: by 2002:a37:91c5:: with SMTP id t188-v6mr1780181qkd.159.1525969848871;
        Thu, 10 May 2018 09:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525969848; cv=none;
        d=google.com; s=arc-20160816;
        b=BD1852rCTYkGGSt+JIAGTxjLSrfq8PRHtW7j3D8Lz1CkFyQJtD4qE2jOay9YGLn5cz
         zl5jbOYsNzUz+Wii3UV8paReWKqxnx7XYxVBOFvkjrYn8sSCrZ/dR/rhbeUVq3MdfpoE
         rMMwClJm9r3MXiSWuWeRv/IR4/hTO+ZUKkbbYqG96amVTCzoI6KnbjIrYUawgX+99gIt
         xiObzTJewjmzoFFH2R6/B9woEFJ9T/FvHwMGFWZASsvz5Q8JoxT4jGrwjsWCn0+SJ0tQ
         b/gWrzpgWlLgD0JWHKgjLnKCfqu6jmJ7SYYS1C1Y7WLPMbY5DWQDCnSNTONh6tJA6YBE
         cKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VrB36mimvQjU85a51pUheE+Cgjg3IgRuLeCaCe/gGj0=;
        b=nVKV9p7sT3Lc0h8mzAPdhXCGFlPjDWqt6zkahhCDEsXFe7h4tQSwrmsdHZxR++wLxx
         omvfzoGOZ8PpTLkaBhgIwyRkx37GlewYwV+R5UzqqFK0IFbmoyXAj+mL20ykpu45dQyw
         P4LIu+vOSqRiCXk+OalMz0NrXJ65e4135C/TLrOuWyZHL9NwaDzhB+usE8OqLz1L6Xhp
         t22PNpC2uPZ/yA9NYrpecFdgoHaSC+gTDPifTCfTsGrqavI6eTul7QYIt3QDc5AjEI7s
         ii9VuojlfIQ6gxcSGTfWL/U8W2GMCo5XDBvHaaghNZrHckvZitndfZ71/x+sn9kWVEcd
         XnTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HQdW6ZXb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s13-v6si1006616qve.15.2018.05.10.09.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 May 2018 09:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HQdW6ZXb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGoSu-0005X1-DM
	for alex.bennee@linaro.org; Thu, 10 May 2018 12:30:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGoSl-0005Ss-NJ
	for qemu-arm@nongnu.org; Thu, 10 May 2018 12:30:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGoSl-0001mc-05
	for qemu-arm@nongnu.org; Thu, 10 May 2018 12:30:39 -0400
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:44740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fGoSk-0001lf-RX
	for qemu-arm@nongnu.org; Thu, 10 May 2018 12:30:38 -0400
Received: by mail-oi0-x22f.google.com with SMTP id e80-v6so2272810oig.11
	for <qemu-arm@nongnu.org>; Thu, 10 May 2018 09:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VrB36mimvQjU85a51pUheE+Cgjg3IgRuLeCaCe/gGj0=;
	b=HQdW6ZXbMoPP9n45PZD/HTINzwveV0iN4yBvXMGi0XUBqxQZ7whLeYqKfQjoJf5uPL
	6ehV6WHP9MSpsEGOu39K4KQPObW68WfKewHwuXoKRTT2cxNw/Bb5RALR9GOKfNjHa8lp
	2qNjG57pBhW4RdYcAEnZGgushnATrRhcID1bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VrB36mimvQjU85a51pUheE+Cgjg3IgRuLeCaCe/gGj0=;
	b=WCOWIa/HOkeMjwcbWdu8Zwxs78bACwFgxqyyg00s50o1esxasRjmvJUkLaDagigTXz
	+T0cn4Nt+ruUIfGxwy9CMVv+x4isdLPXwTu5Mz+OSg5+TX11MD+ZxOeG6It5t8tntuMg
	l6aqaNMKpghL2JDR4kdUPT9fb2V/Tobi/AWBV5TMMkg5KZjRdihxB2OKncWMS413klMp
	aFOT3YdYhyMW9lmrIvyeOBtBDNP5K62cFypngdGhzIfKeBpxHxcmnmfBh6K1lkB08pby
	JXIYG9VW4vF3ZLLcvEd5Njm94DmRXlAokvH+09jcxT1+idcNpoyWF1I068DZ+GaIgyqM
	DXBw==
X-Gm-Message-State: ALKqPwfWyjnlVgGGhenK1ACvvHwvZZg/GyzsPRKn3CCLo3Fq2cqvaKSk
	7neHcIR1jDaNxGAWSWkrqWyNX33qoDQvIuLq1i9/yg==
X-Received: by 2002:aca:4384:: with SMTP id
	q126-v6mr1141047oia.164.1525969838126; 
	Thu, 10 May 2018 09:30:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 09:30:17
	-0700 (PDT)
In-Reply-To: <20180502221552.3873-9-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
	<20180502221552.3873-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 17:30:17 +0100
Message-ID: <CAFEAcA8+iOq7VPtesr=8J==3kV28Acu+XFqB1y5WFYFCaGpCFA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22f
Subject: Re: [Qemu-arm] [PATCH v2 08/14] target/arm: Introduce and use
 read_fp_hreg
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jSb1xc4vieI8

On 2 May 2018 at 23:15, Richard Henderson <richard.henderson@linaro.org> wrote:
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
