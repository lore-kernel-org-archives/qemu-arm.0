Received: by 10.28.71.27 with SMTP id u27csp585698wma;
        Fri, 23 Feb 2018 05:22:51 -0800 (PST)
X-Google-Smtp-Source: AG47ELv/qmNJqr/ZoLoH7US5yC0FJXy6IVIhmjQcPE0POpdaWta2v1YPYSTVM7l0qnKDMDJ1A4rn
X-Received: by 2002:a25:6b45:: with SMTP id o5-v6mr987952ybm.206.1519392171523;
        Fri, 23 Feb 2018 05:22:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519392171; cv=none;
        d=google.com; s=arc-20160816;
        b=jTDuTXaQLaGSxE4s/Z6KUAvXz2ydTgYtHVsMaeuleJN/IvBtGGNCvBpbDQqN5K46Ts
         dCYkjZYy5i2phZPNF783gW60C5jUcAS30qpFi34lPlPNt8UrTKszLz1e8LlDR529Fgr5
         h2b0XeZg+nZKNheZfgcpCVMutm9ua7W+3ObtcBOGeuwSunHRrRzxBV38rFFXLKylk986
         AP6+5sJqJ25nFpTwCdBx9JbEANo0T6QOO34+FWedn7fvHhNjBsE2YQy5DNDnmLoxDhrm
         wvIEZPDcyDFUJlxSHEGMQtq1rAnn9ysodbcmWo2U5CCQIM8AuMp09z+sR/Fqm3wnH1kN
         EdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=y7gbemgFvkgsPt+DNoulxBLFy70GJg6e/+5qnOwVBuc=;
        b=dvHDdXgeJXu/PIeVqZyBIWvN7UX1K3JqFs4iuzYAZy0pweVDSfmOMMgbXkU+oLxgSM
         EX43ySa6yEH+EaokNP+CjGg5+TKB4KMdhiGx1AMasBd6CYgzC1+5aTQI72WrniZLKHwS
         ovQth4wUuTgcFL5MvRmmSR7d+4k5tccFF4R8jZ02Yss1OqSE1jSmDUG07Gfnypzn5n03
         +3YeNPvaG5lSivHobJ0m8f4oxl4FuYmpDNXkkUwrcKAotrReShQZc6P8Nbi1VisXPioh
         EP6PMuCE+Hdjwa24hk4XUURn6Jflwi1PAMoA/RtY06+Li9owltkbEBB7CFttcqQS8YWp
         RPGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QYNrPhvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i70-v6si399435ybg.192.2018.02.23.05.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 05:22:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QYNrPhvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epDJK-0003Zw-S3
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 08:22:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDJC-0003Zf-Fc
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:22:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDJB-0006To-MZ
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:22:42 -0500
Received: from mail-pl0-x236.google.com ([2607:f8b0:400e:c01::236]:37749)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epDJB-0006Ss-Gm
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:22:41 -0500
Received: by mail-pl0-x236.google.com with SMTP id ay8so4881404plb.4
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 05:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y7gbemgFvkgsPt+DNoulxBLFy70GJg6e/+5qnOwVBuc=;
	b=QYNrPhvZ2PWdCaj1OGFE/4ievCNC2NaIWgSaA0/KvfiPJZS+tFHY/ZBp/Pv+VFJQpq
	6JtZUux/3mq4+dgw3SlRO0RmfdG7Z/atqIN1bUzMwz47Sdj2+hhqueBZDlPk4VhfVu5h
	QhDMyBeayMTNCBjzig0xSSriXmWe+qP9anUnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y7gbemgFvkgsPt+DNoulxBLFy70GJg6e/+5qnOwVBuc=;
	b=gkiDS2rrpdvjTyD8jQpxtazF3xuTuJd8a3fg01ZxKQnmrdDdPrSnObvT+rDhqHAa49
	7NA+t2UAwm8/pwRnwHEWs/eeXcQCDAt4rRZFaroM3ILG1s+ca0Z4MSbhwdaFZOyrvqcE
	TA3rqOI1t+/JVGAovq3J0ijW+T93sXArXNC2klPV3k9CiLKErBGmTSeHRPcjJqw4yDEE
	/9Doyhngh9tAMl5QIwUQV7Xer6GaqjMFuy9raDqYmv5mc9LjOcCnuRQTl8zfTrqJ7M+/
	VY5R9Ntvio2xFf3WDkyOEMxSTNVpnvsaRoZKaReC9Ro4oWWE+fcWgdWeFVqDrlTCruuF
	R9JA==
X-Gm-Message-State: APf1xPAn2oDD9r7lLlUIhtdv4OBy3Qi3VRVzWFw57YAEMiRyflpphJue
	mLc4AAz3g6S/ds0pS1V2GK3hayUBGN0ipIVU/V1M6A==
X-Received: by 2002:a17:902:8b85:: with SMTP id
	ay5-v6mr1750181plb.329.1519392160581; 
	Fri, 23 Feb 2018 05:22:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 05:22:20 -0800 (PST)
In-Reply-To: <20180217182323.25885-18-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 13:22:20 +0000
Message-ID: <CAFEAcA_qhnWLwkL3dht5QVa2mvW-e9+gb6g2Y=MJQnnKidBUVA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::236
Subject: Re: [Qemu-arm] [PATCH v2 17/67] target/arm: Implement SVE Index
 Generation Group
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
X-TUID: Ee35x0UMk6ZV

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  5 ++++
>  target/arm/sve_helper.c    | 40 +++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 14 ++++++++++
>  4 files changed, 126 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
