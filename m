Received: by 10.28.4.212 with SMTP id 203csp615408wme;
        Fri, 20 Apr 2018 03:57:30 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZro7XlhP99CUdfgrSlggVixPt3gVYcUeiKYt5JNlnM/7msYNrYhIxtIN4Pm5ueDxAj/BtDb
X-Received: by 2002:ac8:5293:: with SMTP id s19-v6mr4550549qtn.311.1524221849962;
        Fri, 20 Apr 2018 03:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524221849; cv=none;
        d=google.com; s=arc-20160816;
        b=CvCVKcAoKu2AXuiAjs0Ye6Z4pzoND0QILJT+eqD6fxwlo6oceHyY7JwQM56Fr1LDV5
         uHm+3ee3qSFL7+HG5GAlMs0LBRNQHPgtJsQHiBWa/XxLPPOWrHs9T0xgXRbWRjhS66Jx
         LFNsecg0Afee6niYnspt17p9LwVI0ZnW/HXO5BiZQg6AZgH9u8n+06V1C+Aot/6GLE3s
         0FNoTWQT6RFbb+0rn6TGJfYKZE0cA/xpqgr5+2xnWVNruIi1L1ABd6P4hueVcPTAuVfL
         BCcUPXNpwP3+jsS0FHWkpn/T3upamOl1T6q2NjUAJDqLX6qFBltHC9Plo2ysc8ADqcvM
         E/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=pVDXHFEQLQhTxAWXsDrxgDcknLZDFFq0FNFRxt5dGmA=;
        b=xZWHLZ6WQuG+e0EAW6fB+iBi2lDqC/gv9GZ6uVGF6TU/7ZMoLqxAdbtBY14zkDYG3o
         h9gPHBw5lfmugFEpQfnyYdtJb2wxsYjvUhGPiV25fFsdJaG1/j1EA37YSdaMKul3e8ae
         Cg7KzMZR58VfsKVy/QJZUk6dtzysnbbx8N+EXVZoe3rX0/2zriIeQBiMC06/L8HqJZ2y
         f6IsAb0jrbmYiYtYgNTKJjEO1BPxtoM0LUfT1TrppdvKfW2b6RoDlUh2/V1orOGs/is1
         0yPHeWFp/6Ks483r95Z2IKIcTKrYWJ0tNs8daZdGnjbvONU4ZjNicynpNX4mAEAg2/Ii
         4K3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EoZdXG4p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12si4047956qko.320.2018.04.20.03.57.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Apr 2018 03:57:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EoZdXG4p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9TjN-0001bF-GX
	for alex.bennee@linaro.org; Fri, 20 Apr 2018 06:57:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f9ThZ-0000TX-2j
	for qemu-devel@nongnu.org; Fri, 20 Apr 2018 06:55:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f9ThY-00031E-9q
	for qemu-devel@nongnu.org; Fri, 20 Apr 2018 06:55:37 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:35647)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f9ThY-00030w-51
	for qemu-devel@nongnu.org; Fri, 20 Apr 2018 06:55:36 -0400
Received: by mail-oi0-x229.google.com with SMTP id c15-v6so7651322oic.2
	for <qemu-devel@nongnu.org>; Fri, 20 Apr 2018 03:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pVDXHFEQLQhTxAWXsDrxgDcknLZDFFq0FNFRxt5dGmA=;
	b=EoZdXG4pPuR+2k115tsN87spfuioT4NH2SH95Zv+I1qxNlWL0zTb0z2j7uHgoGxG+w
	unglMs4G0EgJBR5kLCk0DBpE6iKXQn+0HwFmSehywJAf6iA+115Tx8FhkC7Oozqlil9E
	qpZbzJJ1oqLZ88ae3M4WT6tfgkAuhAkEUzW74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pVDXHFEQLQhTxAWXsDrxgDcknLZDFFq0FNFRxt5dGmA=;
	b=O3gJ/zjd+NknOujhHoD7rTdsZq2YpzDm/MDAdPcGKtmFYvKuIF3r9ZRzXlglDgNzej
	L+eDZJpIvYEyl2KqrOsO7ElEsJ2E+55VAUj+7m+QJcoHHbIbup2s+gZYq30AIGSgtXEY
	U7A7Ukz4G62dRegJHXRDdkuLauqAf9lfRy2h40/HTwXrj48aBYEnm0NdM2cyAqK8SgBa
	SGJoWQga1SOa20Dk+IH8L703BvFFDGjDbfzoWMcTauPA/ByvWmDT1hhLB0lqh86ZSOWi
	pXLgVwgb4/djK386ra6GzeXVUtxC61mDgaaELRZeK/zlTpyuyjpWaQM6aKz9nhR5Mm6G
	Qk8Q==
X-Gm-Message-State: ALQs6tAfO+y0a1xIVPYXlCin5o7YTsxdNXwvY0M/3EKBouDKBwJ8SFoC
	1dcC+wm+gpxDnaDaIWmYAx0xLINfhovqW/pInuqWxg==
X-Received: by 2002:aca:b3c1:: with SMTP id
	c184-v6mr5964513oif.12.1524221735336; 
	Fri, 20 Apr 2018 03:55:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 20 Apr 2018 03:55:14
	-0700 (PDT)
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Apr 2018 11:55:14 +0100
Message-ID: <CAFEAcA847b02nswyaUipGNnJUYRyMt5GyA3mgX_NbaUtqQWyBw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-devel] [PATCH v4 00/21] More fully implement ARM PMUv3
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
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4o5pzYHXe6Bd

On 17 April 2018 at 21:37, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> The ARM PMU implementation currently contains a basic cycle counter, but it is
> often useful to gather counts of other events and filter them based on
> execution mode. These patches flesh out the implementations of various PMU
> registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to
> represent arbitrary counter types, implement mode filtering, send interrupts on
> counter overflow, and add instruction, cycle, and software increment events.
>
> Notable changes since v3:
>
> * Detect counter overflow and send interrupts accordingly (adds a 'shadow' copy
>   of both PMCCNTR and general-purpose counters, possibly/probably Doing It
>   Wrong)
> * Update counter filtering code to more closely resemble the ARM documentation
>   in form and functionality
> * Don't mix EL change hooks and KVM
> * Don't call gen_io_start/end if not actually using icount
> * Reorganized a few of the patches to more logically group changes
> * Clarify and otherwise improve a few comments
> * There are also a number of less significant changes scattered around

In the interests of cutting down the size of this patchset for
future rounds, I'm going to apply these patches to target-arm.next:

> 1  target/arm: Check PMCNTEN for whether PMCCNTR is enabled
> 2  target/arm: Treat PMCCNTR as alias of PMCCNTR_EL0
> 4  target/arm: Mask PMU register writes based on PMCR_EL0.N
> 5  target/arm: Fetch GICv3 state directly from CPUARMState
> 6  target/arm: Support multiple EL change hooks
> 7  target/arm: Add pre-EL change hooks
> 8  target/arm: Allow EL change hooks to do IO
> 9  target/arm: Fix bitmask for PMCCFILTR writes
> 12 target/arm: Make PMOVSCLR and PMUSERENR 64 bits wide

thanks
-- PMM
