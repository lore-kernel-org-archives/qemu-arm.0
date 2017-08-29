Received: by 10.223.188.70 with SMTP id a6csp6134095wrh;
        Tue, 29 Aug 2017 08:39:12 -0700 (PDT)
X-Received: by 10.55.79.81 with SMTP id d78mr5892104qkb.19.1504021152427;
        Tue, 29 Aug 2017 08:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504021152; cv=none;
        d=google.com; s=arc-20160816;
        b=hyM87Q/ECWve8cfVaFiXai9988cC+wqeNqbtNx2gc4FVZsvKExFjCP1s7PEglMbP7S
         KV/hKkEK4fO5HmyavCxQGyWuUX2ms9thWfarVKhJQKsGhMwH8167mI6UKjpRR50yN+bw
         njVL5vPmyaEL/VqV3JgLXys+IbE9K4ORD7NQAgMy9fCU+x8T65jVhN8s8FrIrlzs9Xsj
         pbKWVSxCq7ZDKIryqyXdOGrg2ToZtVr7sX1HAjmJOTMVIxC3BfcnJWUrobLm4A5l4jIc
         D2qVhLB5tN+l8xLEPGszXAAI+lBs4mI/rDGiffp7codho7hUa8ypyGc0umuMU0CGgfXl
         ldkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=BupQuUJiOSTTbgIOk4J42UtplyPtwA3G5+nl7RYwaEU=;
        b=E4CK613YRDon0OaW2/4lqtV+35nX/qTQuWsoKxkBPWhLudvVRHE9BR4CifF4os4AXA
         bvIdYPB40Qm2dlF8jyDwQj9RNEk2C6rllS0BfSpxOirnl7mbr1Dx1b6sK6+ZHOfjzizU
         qht3l7F7pFQFO18K3xdljvABV1LhId53FBEHOUEyUN8fvMZGQY1BheUbYiLEjOeJnW+Q
         f6/oopUJtNYqMI0FBTK1EoU8H4PaB316oY59GHXtRge657GRdY82ocU9bla6/hX3jCX+
         TVfWirV7gSLSCPJTunk0ppC04L8KD7CjCkuK9PWP5mdlNM0kuSkZb9PgOyquSYdljxHf
         9Cmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NucB+Fdj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d25si3134697qtc.314.2017.08.29.08.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 08:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NucB+Fdj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmibe-00007X-4C
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 11:39:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmibV-0008V7-Nn
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmibU-0007cw-Us
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:39:01 -0400
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:34433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmibU-0007cS-Ox
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:39:00 -0400
Received: by mail-pf0-x229.google.com with SMTP id l87so1450573pfj.1
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BupQuUJiOSTTbgIOk4J42UtplyPtwA3G5+nl7RYwaEU=;
	b=NucB+FdjGYQ5Mn/UEo5yMyN/FgqlYnkzzPhBZbsjWcrhpiUzpVVQlDDQw1KmnCtXzn
	MKm5ToA51EGGnuD0k1j4vTnTe91rBCyQ3wYUVpebNQ0JLwSZxQLNHmf3vlBgV1M4esSZ
	ZWHtkBjgcS3zEIaAamMa/ALJ1syFgmq704lQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BupQuUJiOSTTbgIOk4J42UtplyPtwA3G5+nl7RYwaEU=;
	b=W0a2S215uowUO4uTaH6ecYO3fio75OFR6IALYYy4wyhYUDVv5l+BArAfhEZBUJ8OIY
	WcwKPe1GsyouV2EExlFGyDHq/GuoO+GR/nLZ7Wli+Oue4TbN5UR2hqXC669jH6/PdGY9
	SPW9Fve6BIUs7PyJluKb9uVnKLeFcKoz16K7tV4tz5oDoi5eDH04mTXfdgwKgM7yHTvZ
	FUGyx5H7wFdBOOvZctk3Ju8DvqqmOANcrbjztIBX7sbNVxD+Wh88rgl5rPvHGBMpEMA4
	zRDVwwe67GKZgSN8jnUuWKMDe+8OFyZvFWf77n9VZ1EvgLzonQIj354DrSYJOtVMfirS
	ss2w==
X-Gm-Message-State: AHYfb5gNMajcskDRUucvUVr32GweLEsDttLP6Mp9SCE2Z/gKwLByCFgN
	jNKLWmTKrbNDOvQK
X-Received: by 10.98.1.74 with SMTP id 71mr769004pfb.126.1504021139834;
	Tue, 29 Aug 2017 08:38:59 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	n18sm5647143pgd.13.2017.08.29.08.38.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 08:38:58 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-8-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <918b7d17-8a0a-1ff5-d31a-5ee09479ee2f@linaro.org>
Date: Tue, 29 Aug 2017 08:38:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/20] target/arm: Make PRIMASK
 register banked for v8M
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q/cOK//On36Q

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Make the PRIMASK register banked if v8M security extensions are enabled.
> 
> Note that we do not yet implement the functionality of the new
> AIRCR.PRIS bit (which allows the effect of the NS copy of PRIMASK to
> be restricted).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 2 +-
>  hw/intc/armv7m_nvic.c | 2 +-
>  target/arm/helper.c   | 4 ++--
>  target/arm/machine.c  | 9 +++++++--
>  4 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

