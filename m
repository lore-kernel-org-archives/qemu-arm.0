Received: by 10.223.159.74 with SMTP id f10csp5932986wrg;
        Thu, 7 Dec 2017 16:29:51 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZqhtYSc8lkKL3K5tPRI6jjJYT88vRqMZysvvT6bFq1+tIQwvFcoo7GiB2aSICErHTVeF86
X-Received: by 10.129.155.140 with SMTP id s134mr19531603ywg.500.1512692991290;
        Thu, 07 Dec 2017 16:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512692991; cv=none;
        d=google.com; s=arc-20160816;
        b=hfnNcEgo6EBR6AAQzxzFdM0Jwwx8gkl6kIoDEpxLR9j29LyjFWQfY34PlLGS6UQAfa
         9QbFEcEj+vNLggBWlN1nN+Ltj+yyZ1XvW1ELsuaGJLK6a18CVKBkdtmjt18SKuIsMkgO
         O3jsBVPvBhZSeM288JbP7yUWiHMAX5htObFkBAFvtkxz6ny9SmexNpUThezCooKuphrO
         antLvEDY0/5G77d0jtuqNpoI8VwTXAfPuHWcMaolBEd4wDGFJxEx2x4o0BWQeG99dHv2
         igkYKlScxImy8PMPgHnztGLKJDiRL4NTcIhjmEWfa7aQZAZWcLXc8DGGEj+KBDPonf8E
         g9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=t2cRtZI3udFP5+GLBVeBS/tslSmr2Ok0nurVjtVBwj8=;
        b=e3zD7JCMJINWG5wE0f5E4A3N/95RfglcrurlYmokE/B7OFXpSBYuBdkBGhzPhn8zWz
         W4gjvcwwuBV+m3QmVinJHJppUkk9X28iA7FCQfe1NQoaqJV7N/e/i1MONMNZQR+lLUuG
         8BG60SBGflrq7dPfw4+t+zPUrjbQdpaAKO7ICRvIwxv6dErXFo0DrZUrCplTcUA8xIx4
         Io+piQdBUkFZAhBlc/3iAaDwKzEwTmygnt0OFB/eOEHpIR1sdppsT12ZLNUNg555+KqL
         ySuSh9MIl2V3JFGFmu7v6rOk7ql4Anmj8Rns498BozS4uJAB13U9gVIP0ZP19dkD+gFl
         8sIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g7qcujEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v66si1418366ybc.582.2017.12.07.16.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Dec 2017 16:29:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g7qcujEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eN6Y2-0005O9-OR
	for alex.bennee@linaro.org; Thu, 07 Dec 2017 19:29:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eN6Xr-0005Mj-DR
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 19:29:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eN6Xo-0004R5-Ad
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 19:29:39 -0500
Received: from mail-pg0-x22f.google.com ([2607:f8b0:400e:c05::22f]:38705)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eN6Xo-0004PX-3b
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 19:29:36 -0500
Received: by mail-pg0-x22f.google.com with SMTP id f12so5650553pgo.5
	for <qemu-arm@nongnu.org>; Thu, 07 Dec 2017 16:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=t2cRtZI3udFP5+GLBVeBS/tslSmr2Ok0nurVjtVBwj8=;
	b=g7qcujEQHj9sXCXNy2SAyjaRI9fnhRpaFsjXRXoVU4HlhnN2EUeSq/uy2HnxT1Af3l
	mKn6xEgq5q56XFlyYYT1u9xn8/nizqfvUnRDHDHcxZPBR8fhTs6hPoIud/koZQMbywhj
	DB1ZvACN9ZYYsA8XAs53Hf9n/fhB6ucFzsj3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=t2cRtZI3udFP5+GLBVeBS/tslSmr2Ok0nurVjtVBwj8=;
	b=UA1Vg9UP3ZU7Jv+ETnX7ffp5Sj32ng9rj2jJH4XQUlNGc7yk1zXTEQIRuz37qTlJUK
	fyFCP13gbibdQIfJRKnFyMGzuwvDB3X+kqJZFapeGpJUsVXw+WSBcYtw8wNzHIIkpqz9
	yjKRDpzoBRXCJiPyJ7PvBmNi5vOkOl9f8DetYJWdu7xO7hj4LJVl+NreVkemVpCfBTmT
	cEil/SMgVNcm1bGjHt974dVSumAbLG42uEVzw+oz/b7MpOFHH4nBHsXSfQPHMZe2MWzH
	/7U7a7iabwJYms3vYomaKkdK1fCA1Aajgq0wa3zne2G9uYSQ7TET7141PTrA3Sx92o+H
	qkNg==
X-Gm-Message-State: AJaThX6UbB2XBrStE5XFsnYbORtSFgbaXootknUucINLO/uO9R/vNSFx
	Jvum6Ejzc4eCIRYG+LVLRwzhdQ==
X-Received: by 10.99.140.85 with SMTP id q21mr27445127pgn.57.1512692974746;
	Thu, 07 Dec 2017 16:29:34 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-111-33.tukw.qwest.net.
	[97.126.111.33]) by smtp.gmail.com with ESMTPSA id
	m63sm10604723pfj.80.2017.12.07.16.29.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 16:29:33 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c0e18f3-f719-4a23-627e-b6bde8211a6e@linaro.org>
Date: Thu, 7 Dec 2017 16:29:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/12] Refactor get_phys_addr()
 not to return FSR values
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PThVYxZOAnWd

On 12/05/2017 11:46 AM, Peter Maydell wrote:
> Edgar E. Iglesias (1):
>   target/arm: Extend PAR format determination
> 
> Peter Maydell (11):
>   target/arm: Provide fault type enum and FSR conversion functions
>   target/arm: Remove fsr argument from arm_ld*_ptw()
>   target/arm: Convert get_phys_addr_v5() to not return FSC values
>   target/arm: Convert get_phys_addr_v6() to not return FSC values
>   target/arm: Convert get_phys_addr_lpae() to not return FSC values
>   target/arm: Convert get_phys_addr_pmsav5() to not return FSC values
>   target/arm: Convert get_phys_addr_pmsav7() to not return FSC values
>   target/arm: Convert get_phys_addr_pmsav8() to not return FSC values
>   target/arm: Use ARMMMUFaultInfo in deliver_fault()
>   target/arm: Ignore fsr from get_phys_addr() in do_ats_write()
>   target/arm: Remove fsr argument from get_phys_addr() and
>     arm_tlb_fill()

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

