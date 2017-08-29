Received: by 10.223.188.70 with SMTP id a6csp6179557wrh;
        Tue, 29 Aug 2017 09:15:11 -0700 (PDT)
X-Received: by 10.200.40.20 with SMTP id 20mr6991353qtq.180.1504023310990;
        Tue, 29 Aug 2017 09:15:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504023310; cv=none;
        d=google.com; s=arc-20160816;
        b=ByVq/lUGVCP9lK4e4L8CQqnyAoq4grBLWElWv/AldrtTVnxMVFvLEvWPgnp3+GJbjr
         P69IC7EIu392Y32Q+2S7UrqOPZN28DXCVy5oi4CFDYvITIuBdkzbsYDMEdUBzl02HfjA
         Fx1HTuBDmKxVtd+Hxf0hi0l5Lo4q/Av/0BQ1RSFzkRjNQS1ggrfMQcY9NpXfmlEXIU2o
         P+KGucMgQyT9xlNejWJnzyITUVxVAXkAfo0mMuwrvPs4kf4DDt2pjG18MDGjKRG8/mye
         GQ4efU8ggdcl31VIIgzYWiWtPWd80BlLVBuZLcyzaYLWbOYnX0BdGVjPWBTpR7JYEnZb
         LWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Y6nP+QcGxQdX5ZzJmphXBBeVVF9Q7p7MHjnKRVyTrmI=;
        b=mmrzX6cR0Vjxk1KOzvKclGduDLsWqHPCIgM1Ambgj4XWu/kcvHgF/gbjivrpMUQD3P
         Y06Avk5i71mtvvUBErN3+3Ah35EUBKQgL4pMq0E/k1CvIr2ZF11c+DLylfw9ZeVemWL4
         MiSj99CxjtfuK209F2gQXUoPYYUHWvLnDvP0IEM11sCSldAj035YM5UE46/PDMhzkTyt
         bwsUZgcvCee/VS7pwXEl/X3AZDBN1a8s82YT9FyZPyIVDKyYU9qLRKkm7tfNl6GfwU5c
         IrNgnFyviusC4vHtf47YVCWKnAK+OJKOaqIyEyeGwc79VcZrahB75SquYU4Bb/TsDU7W
         596w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MCsXHbd/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r7si3288725qki.247.2017.08.29.09.15.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:15:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MCsXHbd/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmjAS-0007kZ-AH
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj6U-0004XY-OO
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj6P-0005bD-1x
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:11:02 -0400
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:33064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmj6O-0005Zd-SX
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:10:56 -0400
Received: by mail-pf0-x229.google.com with SMTP id r62so11547622pfj.0
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 09:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Y6nP+QcGxQdX5ZzJmphXBBeVVF9Q7p7MHjnKRVyTrmI=;
	b=MCsXHbd/Hv6ApU5Q5h8SJhesxj+1NCpUV8st34ncmp79UvFustphn1430xvvcaRNGV
	9msCqXdKmMo8k8Cm2404PJdyC4OZveidfaLDznqI8neHmg0c6K/Mc5KOzb1OcMA7ojBt
	54HMJBDHskGnSeAQesOn1iL+6m2yO5Nxo53Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Y6nP+QcGxQdX5ZzJmphXBBeVVF9Q7p7MHjnKRVyTrmI=;
	b=L18HRTTy8wrqt/+ulq9iyl0hyuUcbiCV3WMuCIVYqEI44H9ZDRrlKXg+JtoScgwcRt
	f3Uu6i6pqNLIkKnz+CxQUVxzV88b2cSVgLQdM0IHz6aZzv3s/y+kjIX4nCIRDDNgzqwm
	MDL1clZXYTkIUPpl0s+r6u20/wGHBN5E18OeU/W+fuwqQ632279rAZBs4DrUb7Saztg4
	Uxf22XXzBPq/2Mel8uJJp/E+FhXoroSnESBz1YDZIi1Kvdu6YKuqcxkgkJ3322O0HWtt
	/lwIyCMMqWBxy3yPih4nOmb4tLy9IH/MxHp6C8PrgHxPlIZA+wutEtJ1s9fIcPuz5mNP
	3xRQ==
X-Gm-Message-State: AHYfb5iH8lGqTKeDz6MMwaeQbKNtZXmbJNcig4OJevAbEH2CH/zmQ7Xs
	G1lEuBia71BvUVnp
X-Received: by 10.84.130.42 with SMTP id 39mr1095297plc.260.1504023055979;
	Tue, 29 Aug 2017 09:10:55 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236])
	by smtp.gmail.com with ESMTPSA id l6sm5964950pgo.27.2017.08.29.09.10.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:10:55 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-18-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dfd92b0b-45c5-cdb3-702c-c746d77d74ab@linaro.org>
Date: Tue, 29 Aug 2017 09:10:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-18-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 17/20] target/arm: Make MMFAR
 banked for v8M
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
X-TUID: W7aa5ouKV1TB

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Make the MMFAR register banked if v8M security extensions are
> enabled.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 2 +-
>  hw/intc/armv7m_nvic.c | 4 ++--
>  target/arm/helper.c   | 4 ++--
>  target/arm/machine.c  | 3 ++-
>  4 files changed, 7 insertions(+), 6 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

