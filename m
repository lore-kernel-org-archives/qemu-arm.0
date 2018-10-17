Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1281323wrt;
        Wed, 17 Oct 2018 14:15:03 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62XW19IhSRu0TenXwsMTYGDg48A4XqQ+BzAhHxEd5b5drulZLCrHxmFM6QwJwnn3oY9Pl2J
X-Received: by 2002:ac8:2d33:: with SMTP id n48-v6mr25347347qta.38.1539810903244;
        Wed, 17 Oct 2018 14:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539810903; cv=none;
        d=google.com; s=arc-20160816;
        b=VJGnD4BYGh3dGEQFGYR+CT4Hi0VSKVT0E/CTKjiIKPA98+z+fMmfE6Fx5faaedT1yM
         DCLmvHVZfppGEanFvCpKjDPYveVAIEkWGEL/Ko4RjQ5X5NCzR5Y6DYK795XR1JZQUfbk
         l9hl2yjfh3ocqp3beIc8CcCGG+pX77Ibt0xt38bPhh7ZIPlpB6HHrejS8Im5a9WMU5Ax
         gei5fyk1WRKpeoj3m9wnBtgPpV073rPD7a+jzSpSV9idp8dsQ8XwJfZ8lMyFSL13D6ek
         oWzB3XF/mtkFcNyt1fBulfs57rleLGO2R86arX9xugdjykeJnFh7harTh4kAyppIxmok
         j5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=hyMlaNWTRZ1y49AGh8+lx4U8W5V2sKaYC6uL13k8wXM=;
        b=w6rET7KJOpjvxv1xBC392/T6TkIsk5W3Cf+ZfVD2v2vYdcnqUmIYjLHKBf+xJ65BRf
         iJ/Thx1kODyxK46LYZmw8CTOtBVGOZYui1mWtRrb3TrZDJpB6nWdx7OYGq7lIrZxNVWv
         TBY7RdZ2Qt9B6qJj8bGTF87a1c34c6KlNY0FrSftV0Pls6kNXf56bpm5163zqLMP3wrf
         XReASKlrymK3YNgZ1e2IcoGrJc70oLU/D15TarqyzPkb7w7KWAwiI9NBi2g49SNdZDus
         nt9vmcxRaI3ksIUMvtr40U6YivIi3gkQpqFLKEBUGo+8bAwnLJDIAereGIvVKFXC0mdT
         t97A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VFzM7gli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p31-v6si9051122qtp.114.2018.10.17.14.15.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 14:15:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VFzM7gli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCt9i-0007ov-P6
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 17:15:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCt9Y-0007nh-0E
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 17:14:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCt9U-0003gI-SL
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 17:14:51 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34222)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCt9U-0003fm-J4
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 17:14:48 -0400
Received: by mail-pl1-x641.google.com with SMTP id f18-v6so13286464plr.1
	for <qemu-arm@nongnu.org>; Wed, 17 Oct 2018 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hyMlaNWTRZ1y49AGh8+lx4U8W5V2sKaYC6uL13k8wXM=;
	b=VFzM7glioIZ9qQBNkUrkMPH2Kdp7uwTsK8XmTWn7SMqSezZ6MsfwgttiI2OJyItYtU
	YtMBwOlCX8lPFOk0f6D6xgik9AnDfhKeDQM2whPACr70p3KMnwYadthYEBsrpLueN8Xe
	mw907OkW78YVeCvRQNjP/rCOKdNZUxvUS5w6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hyMlaNWTRZ1y49AGh8+lx4U8W5V2sKaYC6uL13k8wXM=;
	b=EhRgRAON+FawuvYwAbiAleUzl1uDm8JqszF9XL4f0iPdlpKJJDI9m+c9k56mq9tO+R
	x9AXk5OXfXW5/g8+HUcpFIwhOwiBhiuOB4EUoQBFiG5hcFye4RCqHAlLXiVgYUQOrkbL
	BHVobfEf9CoOznN8xmaXdAsOjdhaVm7iHYalPbaEm7QKZLhuMYydZMI9NRXstLThbAlw
	310OE1PQd/3ug+59VGKW/CyG9KWjga5utoIsnG1D59KyFpB2cZ8jj02igeplmV2m+QYh
	Y8LHNA8cBOUXwl4/LMu9mO16o1G6BoLxqtpj3Zr3JOIK0+i3E2D+6OLd4hqsDY69MiBx
	Fcdg==
X-Gm-Message-State: ABuFfoh3p4x9R+bBGOYq09q88ZrRFjj3gtdLvlljAiRMZ+ITUAxlVNuC
	1qs+Ur2Zh1BR5P/vosDqrcVS/Q==
X-Received: by 2002:a17:902:744c:: with SMTP id
	e12-v6mr27509990plt.186.1539810887584; 
	Wed, 17 Oct 2018 14:14:47 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	a1-v6sm28624824pfj.38.2018.10.17.14.14.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 14:14:46 -0700 (PDT)
To: Aaron Lindsay <Aaron@os.amperecomputing.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-13-aclindsa@gmail.com>
	<0fdcad4a-c8b5-3309-d2ce-f9be901ec52a@linaro.org>
	<20181017192013.GA25905@quinoa.localdomain>
	<31f327f4-42ee-55fc-596d-97d935803867@linaro.org>
	<20181017202505.GC25905@quinoa.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ddceb720-97d2-22fa-e58a-7283fb416c29@linaro.org>
Date: Wed, 17 Oct 2018 14:14:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181017202505.GC25905@quinoa.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 12/14] target/arm: PMU: Set
 PMCR.N to 4
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
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2XlDooCndCiS

On 10/17/18 1:25 PM, Aaron Lindsay wrote:
> I suppose pmcrn (the local variable) should've been set to 0 before this
> patch and updated here to be 4.

That's plausible.

> Anyway, by splitting these patches apart, my intention was to separate
> the plumbing work from turning on the water. If you believe it is better
> to do both in the same patch, I'll make that change for v7.

Fair.  I'll let Peter weigh in for final decision.


r~

