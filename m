Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4929613wrt;
        Mon, 15 Oct 2018 13:48:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62LX8QEXYYz/UVG0iKUwnk52xbGkyUYwvSIB9eu8PvImH8HX58UCDcj+N1z6utQdLBWNPDO
X-Received: by 2002:aed:31a3:: with SMTP id 32-v6mr17489893qth.191.1539636481242;
        Mon, 15 Oct 2018 13:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539636481; cv=none;
        d=google.com; s=arc-20160816;
        b=n3NglaUKHfVGIiOPBQ19SfsGtgemp7bmfwrNYWnSoGSCpusveoOTigZPTE8gsWyP3q
         oVGuGjVKE3TFEPI1Y8nP12hBiuJuwHi9F0pu6a6pDFwq2uvpZCGP1dTHq2j6oXxa14nk
         Z/sMCYt9nWH1R0+msXfdlYy/wmU5FayzPM5VzLp/xDAjMyXKNzVR+oYuiFGzt2u6aULn
         hL5z3PQXZT0rC+vxFUnJtlJofzfeyf5nN0CH36vP305wvpLzhPCSqwHq3FvuaejOs8vu
         7dhGPFdzYzDI2VDdntxXh0I/bMjR0nlHc99HE6Aw2+swTIrC8HfdaHkwhdhepc4o3/pG
         Tz5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=MR6ggYmkQ7XYO7Zi2rv6ic/75ejQ5bTGq5e6Qn3MBVk=;
        b=PEtq54lKYAMM1+4fdYc3jsz2avecJvZm8EsJ8bns0n3nj+tt8Bw4LZCIDa/UaV9SY5
         EvwUOkU+qdDNa6y4MlMOuU9rHFHLWeIqXcXLTzROcgxqQsDzbYLFRo/BU18aczpHS1Pf
         K/cKtmzoMA/dxPZFgvrfvM2NuT5mwMmbvtT0IwZrjAoBdp1Dem364koXcVNuZD3imuma
         4AOW7NPu0IsSkedQZe9zjNr6K33mBddzhSQyR2GYV+8QHb49vRgXqo3FJMJ5ZBEujIBG
         Y03wBF+r3+m77SK6puuvkMHXfRxVMKbi4pMs4VbJBw+0RCEmep2jd1mk6+RXcs/svP3R
         bfnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cju7ASDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g19-v6si3633222qtq.329.2018.10.15.13.48.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 13:48:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cju7ASDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC9mP-0000e8-P7
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 16:47:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC9mG-0000dy-SX
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:47:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC9mD-00013C-OG
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:47:48 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41680)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC9mD-00012C-FO
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:47:45 -0400
Received: by mail-pf1-x442.google.com with SMTP id m77-v6so10270843pfi.8
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MR6ggYmkQ7XYO7Zi2rv6ic/75ejQ5bTGq5e6Qn3MBVk=;
	b=Cju7ASDVED4usPIssQLscfgQetke2mI685ZMU0UFyoy9Y8SvT/vR1zuNg21cT5hzDk
	SWMbBKKtB6uLXoma2CkjCPdtIvxmPOuvzXSm5M7fzT5w/EOFjcj5Sd1TQHmuDFfUTCCD
	C2KyGRmdxmehLWzdvWSl687rAly0ILMuctxPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MR6ggYmkQ7XYO7Zi2rv6ic/75ejQ5bTGq5e6Qn3MBVk=;
	b=J5bAcyr8Q1dbJLadql3bXatPNufwZFkJ4rw9Jd9n2FSbE7J1jyDld6mWeZPooUNkAs
	Lq5rXYOqfkiGrpXCbM2VURgBvPNBgOwLXpi1Z0MRSbXbHB0DwwH1VZvG6BYoWYcjKP+0
	Srq/qUXrgbDuAPOEFNlNlxK1v1EDqg6zF+frVR8Nra77uSNeXKDHEkYDKFk5IqKqywyU
	mXnoPnZq13khhJoGbSCfkkFFpIiC8tqfZ7K+f6vyh4QqFY2tqiG/EabCD7G/dPqZnPHt
	G9607RFmCjs3ENVHjbUwuHLnBBLC1/0Y6P9pFTgiyUtU2ox98Bb9vMIUu/2jhcMxZSig
	/gLQ==
X-Gm-Message-State: ABuFfohz31XSnn7SiKwciVh/Ln9O7HUcsTDKvVwh6gsl72WnIIOLKLwu
	TCh2ZVRUWH0+fOYXnm3aB21Wjw==
X-Received: by 2002:a63:9c3:: with SMTP id
	186-v6mr17576188pgj.249.1539636464269; 
	Mon, 15 Oct 2018 13:47:44 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	25-v6sm26575101pfm.36.2018.10.15.13.47.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 13:47:43 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-6-aclindsa@gmail.com>
	<4fff310a-8fc6-91f9-6caf-315c84d983d0@linaro.org>
	<8e83cbd8-8c2f-f6f1-4423-f19a5f13aa5e@linaro.org>
	<20181015203037.GJ3671@okra.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <359e1a23-40ea-1e0f-5fe8-2f5806812f57@linaro.org>
Date: Mon, 15 Oct 2018 13:47:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181015203037.GJ3671@okra.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 05/14] target/arm: Reorganize
 PMCCNTR accesses
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ScLlTe8kI2AG

On 10/15/18 1:30 PM, Aaron Lindsay wrote:
> On Oct 15 13:19, Richard Henderson wrote:
>> On 10/15/18 12:50 PM, Richard Henderson wrote:
>>> Ok, looking at this follow-up makes more sense than the previous patch.  Would
>>> it make sense to squash these two together?
>>
>> Or, rather, split into two different patches: the first splits pmccntr_sync and
>> updates all of the existing uses, and the second which adds the migration hooks.
> 
> To make sure I understand, you're suggesting essentially reversing the
> order of patches 4 and 5 (and fixing everything up to be consistent)?

Yes.


r~
