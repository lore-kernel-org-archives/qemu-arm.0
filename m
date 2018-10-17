Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6655484wrt;
        Tue, 16 Oct 2018 17:02:32 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61oWCoWDnVg8E7G7PWTQd35yIB7CPR4bSwM7lqSqnL/+kj0zMxrtg/KwOeDtD6lxh2igEoR
X-Received: by 2002:a37:8282:: with SMTP id e124-v6mr22656871qkd.76.1539734552392;
        Tue, 16 Oct 2018 17:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539734552; cv=none;
        d=google.com; s=arc-20160816;
        b=Ltm3uqKwDagFO1g9NfFOpfD5pLzW9Lk/ABiSM+4oGJbSmbL+sp0x71BGLiAWWSXT5N
         pz0WPdJH4g791Cj6vO76Y8IAuArrRaeIGRsa9zKSC+603nQito4SVWT/x2iMyEeYYEqd
         t1YbPaY5Bkqcumj/3FOP9qxvpc3ZO4GO+wfd+pNh0GAfUtWCLCG/bUXBRJYgve2gjH/M
         MwBemUnc2nmY7AVZr2ufYyh820494SXCX776+M5NHQ2VJS7Pbu5PdeYmm4tT9lFKhGZp
         ZFHThTMgiFpfXTAFiCO/HCmXl4w3nOFWLAORMgsxD82PaRl7BMQGspaH6+pSPwXN8Kgb
         ea7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=45nTJKAbNM/z9G/3U7Q1CO3yvWfJxIngGUH9F9BJ2DI=;
        b=NIeukk0D4ELoyFqKlmXRUnu7fDRUJ6tAms8TFlCOLoWkcBf7A2U+PFgEx3BGC/DVjm
         zRVzq/rmvD2P5rvFdKB8FLUGLIKFVJF3tHtY/217Il9kmVnmxUdbuLeDskE1samwi3yu
         INa3WF/5MQmAjMxK3vDYkjbn3v9eicRD1YChTfLwXfmxGVPtrmqVy4vJXNRHxz2X3Eef
         yFl5kjqWghmcE1kRr+QIm4L4DWglKj3EEKofpH++fM40HYD3Znc/ONaPx4GrsAjAQAWX
         98nT6oT1DzwJ6j8nXtoUlNa7OBEEhk689y4/ijlBzyJfCTjipbz9m86fdW/zq53wO5fz
         KHMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YMdgyj9a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j5-v6si4032993qtq.0.2018.10.16.17.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 17:02:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YMdgyj9a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCZIF-0007yc-UK
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 20:02:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCZI6-0007yG-BM
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCZHy-0003Rm-CY
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:02:18 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45394)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCZHy-0003PX-4G
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:02:14 -0400
Received: by mail-pf1-x443.google.com with SMTP id u12-v6so12219611pfn.12
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 17:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=45nTJKAbNM/z9G/3U7Q1CO3yvWfJxIngGUH9F9BJ2DI=;
	b=YMdgyj9aPkk1Uscbu3pn8lJuZp7+gfh+ZxUnm4YOY7ypO7JD2dILjbd1Zp8DSRGjPj
	nnPTORQnBo+2ZDlIL1WHDAMrf4o7FA07roDYWkw1DU5xYKeZIGCjBpwMAYhsZwVCbyXW
	MjcAnMIY0OBxe0x/DPeYt9XerC/V2YZ6Ap61c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=45nTJKAbNM/z9G/3U7Q1CO3yvWfJxIngGUH9F9BJ2DI=;
	b=cVG8lKTA+AemdXr5AlVqxd7iXfFYHCu9j7Yg3rh6pxvgXPL6ox2GgdKGwjTj4njvmY
	yir4QdwSlbo5/MKA2GR5bPHGNPryUex71DwqCC/9FTYjCdTl/ULDDW0LXfb651CY/MMg
	BzkKROwKHaJ0BJQGK0eGvdvWR+qgBWXK9eD4G1M3t3SsLlAq6HdaA9YIHFR8yjTwaRpa
	5O+0b8DsIMXMqiQij8aRpa2x8sNkhKc4+O111PiMJNP0WmoqejsWjoNAW/TeAmNR8LpA
	4+msyka1GAN7jDGBDddGI1hgiL1eUjJA/48nlzsEGuuZpjDPmUlsnock5fxT5Xn3xRMy
	T+lQ==
X-Gm-Message-State: ABuFfoj/bnsIz3BB+L2f7X+NgnsTybKQ3vQpE4dRqHob4UDMJ6fWBJ+/
	6kj2rL5wnklWBYF+o4398sQsFw==
X-Received: by 2002:a63:3c46:: with SMTP id
	i6-v6mr22050828pgn.286.1539734532551; 
	Tue, 16 Oct 2018 17:02:12 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	h77-v6sm30566196pfh.13.2018.10.16.17.02.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 17:02:11 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-11-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <248e57f7-89f2-0e71-1da0-b358d10b62c5@linaro.org>
Date: Tue, 16 Oct 2018 17:02:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-11-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 10/14] target/arm: Finish
 implementation of PM[X]EVCNTR and PM[X]EVTYPER
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kmnL6B5F0JWZ

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> Add arrays to hold the registers, the definitions themselves, access
> functions, and logic to reset counters when PMCR.P is set. Update
> filtering code to support counters other than PMCCNTR. Support migration
> with raw read/write functions.
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
> ---
>  target/arm/cpu.h    |   3 +
>  target/arm/helper.c | 296 +++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 282 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
