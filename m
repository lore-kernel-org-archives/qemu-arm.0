Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1392369wrq;
        Thu, 5 Jul 2018 02:30:10 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdtaA8CqVxuMgyf0o9TYJpWhEXAdcKOuuwIuk6hg7IaA8DjmKXaLZLC3f56CYJTShV2ZaMG
X-Received: by 2002:ac8:3835:: with SMTP id q50-v6mr4407715qtb.235.1530783010778;
        Thu, 05 Jul 2018 02:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530783010; cv=none;
        d=google.com; s=arc-20160816;
        b=AHVPC/n8D3BXi97SR1VG4q/Nsq5k8JKVYOMEVQkPm0gWHUHOdfxmQII6laLt2GIkAS
         v6NENRSnjT0SRnrleUXju0SG50vnCDngERW9qwIGA9F+/OfsZlHoYWcdHDoVUQ86bJDd
         h1WloU+okAmB7VwEUHFs0iLPLBaomb1yN+RAbkuITbEr1cwLKFLNrI+yalxPovgewcTO
         JzkBCbxCDpJNGwUFzmVr3fLelXkeN865Mh1tFO+i1yDVkVw1rP7OWVwy4ttWZQySkuuw
         G8BFwGDMwtc+yDKee66ktJ8ssx6WyUC0v9l/yWQlIuZP5HeB+isqvwAtB2RU0CKfj22E
         MCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=T/i/pXug8QmNwDRx/dymI4rptK+j7/k9J57KaM/1r1g=;
        b=gmpmbQzbsSw4UOMy4dC7/aO4OLZ/Rgd8CSfObefXcu9xhKaUSfnSNrolDKEDB37eYr
         TzMqnLbu1JFJd2HFe6gL+QjWSCCUTeVXf2qF0RRs6xg7r9vTI+78a+lqS0/CEZvr6q08
         6lpCyy5f2D2rNGmuCOK36Zm2kfEowttvNES7lE+x3fZsuHuiZ7dC8Bz9ei0q9kOP/1GB
         5nG24rxhnU96dmTxdNdPzFwExI+yOdwvoNe2QptkAyBgEYhBIVhyD37V9ywK6iIk0lOG
         p8zUKlgzKOLyuyIO+SEkaGqJywMeh/1MfRFf56r44Ge3ihIvpoQV7SkohkCSiSgxyQ4/
         Z/ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ce3273z+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7-v6si5178531qve.239.2018.07.05.02.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 02:30:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ce3273z+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb0aY-0004gC-Cr
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 05:30:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb0ZV-000491-Li
	for qemu-devel@nongnu.org; Thu, 05 Jul 2018 05:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb0ZU-0000Tn-Pm
	for qemu-devel@nongnu.org; Thu, 05 Jul 2018 05:29:05 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:44627)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fb0ZU-0000Sm-Jb
	for qemu-devel@nongnu.org; Thu, 05 Jul 2018 05:29:04 -0400
Received: by mail-oi0-x241.google.com with SMTP id s198-v6so15539567oih.11
	for <qemu-devel@nongnu.org>; Thu, 05 Jul 2018 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T/i/pXug8QmNwDRx/dymI4rptK+j7/k9J57KaM/1r1g=;
	b=ce3273z+w+DP2GyGx+RIHVbDs+GVd4KWepwFnI7emcPsCuW6aJAgZ9H3ccoJfcrZti
	NvPKFAUx2Lvo+K/IwMaqbOYHKTS977Cfk/0w8own0wuCDT0d4CvMK3UFvbnY4asu4Zmn
	gCyMygReZnnAq6HGgWOjEJCtZpoQQf1zgEGVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T/i/pXug8QmNwDRx/dymI4rptK+j7/k9J57KaM/1r1g=;
	b=h4wbLX3Lj/pmWk05/r24cYLcEnjB/AfgmGg1F2RKk43rMxBr0di2gYXOaeS7CfiGlc
	WEHgm1qo9qn+uc3HDqjUBE4HVfS4usdumSXmyQT4PiDGoqXKljc/ftiN+TWEFIJBwNBZ
	0cBbBQ7TB3d0lbDTJfYPtzTNXg8d8kO6MKsbyu54YwSiLAlkKGgtOssdT0CFjstGVYEf
	czntOD5qVFkIi2L3QJqROJhzGmwjnguxjORxGboX2LTJIZDiiFRUp2mE6IZC91jNhJTh
	8ki73q2H7g2BhoOgi9I7BoqntBBquhmmPjLJdqRGxntO069Gsy2dp74vjaQd2mzzyeOF
	r9+g==
X-Gm-Message-State: APt69E0fH2HFLzFqEXQPl1LJ3B5TYCoqwk6Mc/u2snksuAptLjQI+sjP
	k4Qz8BX3oLrWCtD2xEY7u+kVKUurx/sACs0dyP1Wsg==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr6126039oic.252.1530782943933; 
	Thu, 05 Jul 2018 02:29:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 02:28:43 -0700 (PDT)
In-Reply-To: <d4a776fc-2022-979e-cc68-beb3123d35bd@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-21-luc.michel@greensocs.com>
	<d8062fb6-8eef-eff3-fa92-9f9f791ee669@web.de>
	<a199e550-4576-3a03-a7c1-8c21bb502cf5@web.de>
	<d4a776fc-2022-979e-cc68-beb3123d35bd@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jul 2018 10:28:43 +0100
Message-ID: <CAFEAcA9yuiXF5UH3nwit09+VxVOmB9pmRVZsZUqnfbXCMaVU=g@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v3 20/20] arm/virt: Add support for GICv2
 virtualization extensions
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kD03rAOFYfax

On 5 July 2018 at 09:46, Luc Michel <luc.michel@greensocs.com> wrote:
> Yes I encountered the same issue with Xen in SMP (see my cover letter).
> Re-reading the GICv2 specs, it's now clear to me that a read to
> ITARGETSR0 to ITARGETSR7 should return "the number of the processor
> performing the read". Reading the message of commit 2bb3135 in Linux, it
> seems that older versions of the GIC exposed this value in IRQs 29, 30,
> 31, hence the
>    if (irq >= 29 && irq <= 31) { res = cm; }
> in the current QEMU implementation.
>
> I should probably add a patch to fix that. I'll have to dig in specs of
> older GIC revisions to see when this behaviour actually appeared.
>
> Maybe I wait for some reviews before sending a new re-roll?
> Peter, any thoughts?

I'm probably not going to have time to look at any of this
GICv2 stuff for a bit (due to softfreeze and other for-3.0
work), so don't wait for my responses if you think a reroll
makes sense.

thanks
-- PMM
