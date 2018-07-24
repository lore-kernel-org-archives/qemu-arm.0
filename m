Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp7143266wru;
        Tue, 24 Jul 2018 11:55:58 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcamQylhTUZ5FYcqDnzW+Kmd2N+5l7oQMUymdvkd8Z7qrIV0TIJVzZY4UzGQ9LvmtTUJIC5
X-Received: by 2002:ac8:2238:: with SMTP id o53-v6mr17619206qto.419.1532458558773;
        Tue, 24 Jul 2018 11:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532458558; cv=none;
        d=google.com; s=arc-20160816;
        b=Hscmu5ZXcCXxwx+WfZwomoU1b1v5ofK3oVw12FX+w9UI6JGJe10QcVJT7BSHhqDBaT
         84/imdmXWmHJDMkulLm/TKGabuCGPvU97G0+KP9X4BnOqj8UoyhZJvO2MhV/EL/g6M+x
         5mQ3G83OfDXoMFQRzJiHkedMBVUCm8s9mV8TgttRPM2TN6P8qqd5smHvoqUf2lVQonUy
         n4izqNg4dLPnr3ujw9q99GsZ+3Ji+UZA+CQ6BzIRXJ5i/BKHaLoCqySdW5ckqG4B/GLR
         fW1/EliBxCDQmj+RE3krb5Q0pc9Af8qFOAhZCu0i2G1Tr50wEr/UXLkMbMTJhZ6T4BA1
         jUxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=pycbeyTcGn2DcyEkhpF7wBXASSK1LMEY87vf527QuqU=;
        b=gvbFcFuLwj8jya2H8J/SSUUgGg1nnjz9ydkiIrnPKi0TsjvtIaptJlPQgf15nFhf/U
         iSeJYND/vp+na2vRhLAhBhOJDE0/XmsoPSPwgclHnKCk1mlQyNkO7iaxSYTF1hNx2bfC
         tlRh7GT+2JkfLTIhf940OMQl/KdQNUlZZAzHDyazeMxrgt487QZlFS3PfmQLWgXao0n0
         OU9PKvRBw6A3FiVh3xVJqxcW+sEDwMbd/ig7BEamsFekpHFv5IQBTQ2yJ7Xz/Pv8mxDk
         lnqW2tbv+3anc7DTg7ioAhFAecTRM6GtSBE/nGnWd9IFARdKPbWcTvGKNTbofEul4CI5
         sgEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQLkdEwY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75-v6si12298282qkg.314.2018.07.24.11.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 11:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQLkdEwY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fi2TW-0003vQ-75
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 14:55:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fi2TA-0003u1-Qu
	for qemu-devel@nongnu.org; Tue, 24 Jul 2018 14:55:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fi2TA-0007DY-40
	for qemu-devel@nongnu.org; Tue, 24 Jul 2018 14:55:36 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43270)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fi2T9-0007Bd-TV
	for qemu-devel@nongnu.org; Tue, 24 Jul 2018 14:55:36 -0400
Received: by mail-pf1-x441.google.com with SMTP id j26-v6so1058935pfi.10
	for <qemu-devel@nongnu.org>; Tue, 24 Jul 2018 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pycbeyTcGn2DcyEkhpF7wBXASSK1LMEY87vf527QuqU=;
	b=aQLkdEwYkpZAOzXLjkXPhZ4apXbZxyW1+HKQZIkCvMqu1uMMUm7jv+X1IP+pjjAFW+
	fDR3pzNuNarYvTlvwId8SdqbcgNq2Qf3WgXWou16fwZzslDZnWadgpCBvVVH5sHTFoZi
	U7w4xwbYauttJptlYTFntSX7t8EUT/Oz7toOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pycbeyTcGn2DcyEkhpF7wBXASSK1LMEY87vf527QuqU=;
	b=X2TAz7yPNqaWXLEDPs1vTqBvzzzYetQo6n9wrcT/UmQsrc+kbaWzTUyN+Zu9GYEQpB
	nDdt/bMR1S3zOdkyhT+U0lirLtVRRS5epSkTEYFf2fD0YPwQKq5zLS0Hhpy6WfArZl5j
	lhZHhswvLI4IQ9LMDaCOntJhHsYfanpyhmJ4q2wvilrJ2aRJ2XgMFH6cOo3zpqB1Acl3
	IJeP449Gscj9abbEmI/Pku/6RogWwRefanrYsXCSichcjxoOoyVTJi8Pmme8v8gYrkUw
	o/rwACNm5xbFgEBp1KDSKwJ3Wn9QGnUqO05xq/y5EUPpFylbsrQwb0DUAWZsHyiQD+1N
	ufzw==
X-Gm-Message-State: AOUpUlF4F/1cbG3EyuAjw9Et9s5xJKi/bmfimVVhEvntQbSouVb8HQrD
	QYzRH1chR+cAUMfvwzczdeMxLQ==
X-Received: by 2002:aa7:8713:: with SMTP id
	b19-v6mr18778998pfo.151.1532458534874; 
	Tue, 24 Jul 2018 11:55:34 -0700 (PDT)
Received: from cloudburst.twiddle.net ([2601:1c0:6100:a92d::e452])
	by smtp.gmail.com with ESMTPSA id
	13-v6sm17594318pfw.131.2018.07.24.11.55.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 11:55:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180724115950.17316-1-peter.maydell@linaro.org>
	<20180724115950.17316-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <81cef169-daf8-a25a-faee-033f58ea0da3@linaro.org>
Date: Tue, 24 Jul 2018 11:55:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180724115950.17316-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 4/5] target/arm: Provide accessor functions
 for HCR_EL2.{IMO, FMO, AMO}
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DdlRkfj8tWVR

On 07/24/2018 04:59 AM, Peter Maydell wrote:
> The IMO, FMO and AMO bits in HCR_EL2 are defined to "behave as
> 1 for all purposes other than direct reads" if HCR_EL2.TGE
> is set and HCR_EL2.E2H is 0, and to "behave as 0 for all
> purposes other than direct reads" if HCR_EL2.TGE is set
> and HRC_EL2.E2H is 1.
> 
> To avoid having to check E2H and TGE everywhere where we test IMO and
> FMO, provide accessors arm_hcr_el2_imo(), arm_hcr_el2_fmo()and
> arm_hcr_el2_amo().  We don't implement ARMv8.1-VHE yet, so the E2H
> case will never be true, but we include the logic to save effort when
> we eventually do get to that.
> 
> (Note that in several of these callsites the change doesn't
> actually make a difference as either the callsite is handling
> TGE specially anyway, or the CPU can't get into that situation
> with TGE set; we change everywhere for consistency.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h          | 64 +++++++++++++++++++++++++++++++++++----
>  hw/intc/arm_gicv3_cpuif.c | 19 ++++++------
>  target/arm/helper.c       |  6 ++--
>  3 files changed, 71 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

