Received: by 10.223.172.38 with SMTP id v35csp809903wrc;
        Thu, 14 Sep 2017 05:35:14 -0700 (PDT)
X-Received: by 10.200.35.153 with SMTP id q25mr31044906qtq.178.1505392513974;
        Thu, 14 Sep 2017 05:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505392513; cv=none;
        d=google.com; s=arc-20160816;
        b=dEI51apCfVakyo5jrZm+LDFyCoLgiZQkjASeyqbciV7/tPOh2I2RIzgUhQZfTRlRmX
         awZs51jrhYX0BwfugKzc2QfETAQeoBelTCFsh+iNQVZEYCU755nU3hlCyrnM6Gk9AQpJ
         dc/f6L8TlfBf40UT7gQK/NCw+oSjZtq091XfFzrCSYrYWxcBqbRmmjhxaoQZo93C/8Za
         5o1mSLiMEaiGkGKhhln0cVQ/Oz1NSclWtbcEBP66dCyn2Kym2I2UJzoy2wgM3x0lvyz4
         qdO5keHyz/f80SF4MR1rHU7kUniYUOi4yC2glkHFjntuB3wy60gGHIrvUqGuF0s9Oh/3
         7b/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=G+MebRNtbp+czYxcbUarIFSXo96/Od+mLtLgs0xfI1I=;
        b=hK6L3keP4f+wIGSR+tdTbXUIOuioPTpQSRMKSQqslLJ3FuxNDocLwcP0UMvghp0vuP
         GwNY4Z5jljSPb/u1BeGC8fpae6jm3qjx86trhrS4kojAAS8T7lZ0oFZeUUSNkdImlZgU
         eHrf6fUgUSb0MswuLhAvLM5/8ktPUwcJP3eWfoHvwTwyiuD7+i+WDA86jJnnWfpAMgEu
         unYElCEOmPbZiKATGe5s9fDfa5Rks8XA62y0qGwwn7kliOZXgLnUNj3pBpEsZnaxSycA
         m9kpAJ++dirkF1wORIEUzs5UxWSd0kNaoywaM5gXXz2kZpi652LUAjX9jXJCWVvs2YGj
         Kkqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UjEd+ENS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z76si17585455qkb.404.2017.09.14.05.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 05:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UjEd+ENS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsTMN-00072l-OW
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 08:35:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsTM9-00071D-HH
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:34:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsTM8-0001Ms-B2
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:34:57 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:48885)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dsTM8-0001Ju-3e
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:34:56 -0400
Received: by mail-wm0-x236.google.com with SMTP id r68so586054wmg.3
	for <qemu-arm@nongnu.org>; Thu, 14 Sep 2017 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G+MebRNtbp+czYxcbUarIFSXo96/Od+mLtLgs0xfI1I=;
	b=UjEd+ENS+CdCPgU93sK/DCxd2G11YYlJ11V66LN0RfkWdT9f+A+cheZ7VsFvRLcTrV
	6l3wAutdKOwStGOqlHjfpGb+W1YmSXhHomdDfQ71awQf4lbTBHcG1JP2/xds6FVTxu8T
	EUg+2IDXZldEKVd2pzdgq9zKelO16dEe7pTBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G+MebRNtbp+czYxcbUarIFSXo96/Od+mLtLgs0xfI1I=;
	b=khx0VvDKXjCGqAfcGUSG9e+o2z46A4VfqfPAHrfU43SiSwPDxKzkNR+R6O60vFV9bS
	D/qcVaGlNOSCZTEikR0ZF+gBLQkB9L3FAmz/0AnGIJA1n0UPzfkpYwAbaW09n2AS3WI7
	+IDRPp9rECBLqKus9dQ1KN5O2X+CrYYI/gPNS/pVyjkHa8ywQobBu0DBXxjgiMPfYuHn
	HnZbiwKVT5lvNhcIMOo7BDGFSZU+nN92G8Pu466PKhs9qjxkDtSNh3ACwyUqQcnkQt94
	puxOepphoDAWhivZqUtD68Pp/Btx6LetmL3AWfZjujaesM2HnimGVQ+XHzSAmSwAFcER
	wC9w==
X-Gm-Message-State: AHPjjUg7goq1cR9eYwUUE07YzYHWvNo2sjxNRzd2rhN0EoDPlRkaRKPI
	aV9YJAsWdTcBYHvALyoObcInqaazqIFD0SXXaWHxmg==
X-Google-Smtp-Source: AOwi7QB3Ck5nMwKxEGM5uGvbBkO2gkhUX5UMQHdo7l1GOg+IaQgWy4nhD+ZMRQixrVkf4paalcFPMwG/JYkLBXEJ5Ps=
X-Received: by 10.28.23.5 with SMTP id 5mr1746085wmx.62.1505392494924; Thu, 14
	Sep 2017 05:34:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Thu, 14 Sep 2017 05:34:34 -0700 (PDT)
In-Reply-To: <633f5a2d-a333-5c78-1e0c-3af2a4c896f9@linaro.org>
References: <CGME20170908110212eucas1p27c5eecf44c5501d23b322d3679a4f12d@eucas1p2.samsung.com>
	<001801d32891$ec40b930$c4c22b90$@samsung.com>
	<633f5a2d-a333-5c78-1e0c-3af2a4c896f9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Sep 2017 13:34:34 +0100
Message-ID: <CAFEAcA91W=NxnVkacqD+vH-73H+aGej2E+qm_YQMY9rpF8aMsw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] AArch64: Fix single
 stepping of ERET instruction
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>,
	Jaroslaw Pelczar <j.pelczar@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EnmDZJ0mQ/Po

On 8 September 2017 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 09/08/2017 04:02 AM, Jaroslaw Pelczar wrote:
>> Previously when single stepping through ERET instruction via GDB
>> would result in debugger entering the "next" PC after ERET instruction.
>> When debugging in kernel mode, this will also cause unintended behavior,
>> because debugger will try to access memory from EL0 point of view.
>>
>> Signed-off-by: Jaroslaw Pelczar <j.pelczar@samsung.com>
>> ---
>>  target/arm/translate-a64.c | 1 +
>>  1 file changed, 1 insertion(+)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied, thanks.

-- PMM
