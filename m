Received: by 10.28.4.212 with SMTP id 203csp5202067wme;
        Tue, 1 May 2018 12:19:45 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZr6X5ugGqnm2YZzrGB7XmD/pAsUdb1bvO5ksWtJ+yQJHtmW8+nNE6C2FGnELSzERixGKd5f
X-Received: by 2002:a1f:9d8d:: with SMTP id g135-v6mr7736254vke.110.1525202385264;
        Tue, 01 May 2018 12:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525202385; cv=none;
        d=google.com; s=arc-20160816;
        b=fch0omBLQav6jYlU3agIZFQp27W0J/bxcAk2rmEOdAuFa9Lbq6dbUQaw3+8W9ruxmx
         s79F0ajPEtoe1N3vzdobArQEY/fZbFKu5ud7xs/N5Y3J4GqXlPL6fAlXGYf7hb9PKPBs
         B3DZSg/+DogxJtS3EWkc04o/xvit/asYqpcwV9T6P2RqZdA/bdXseT+S90niYH9vOlcw
         QOl7wE5dYQzNs8nR09vnRUmrjpRAlai23BLKCHLZN/HASOB4hs0+U2Z5th6DGGsl4uyI
         zhQurDZ6L+y9Cse+VrrcBHh0gMipHd0V1d/tKuMAM6V3bcihg+4clMiNLZxQv6sEIICh
         FyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ozGcl5dFY0/gLmuIuyaP0Dax6lkh9fukxsuaRaJkThE=;
        b=Mptnw3vdAX7Lr/fO+4b2RQhfv8Imu80OknCjurCS/47dlIjWhHNAtgvBg6dl68P+Fd
         Z/bBo2b59GLWAUWJtLG49AT3XaYKvA6vtZg9w3xzPCXIFSR1PXdr6vNkHwLS1x2us+KJ
         okYzXRsrY8M6rcD7cYf/t+OE4iLix27hHgvrmg0tt6SH/uef+9q4FelYB3sDry4Ad7i9
         wSz/Ug0/S8HdkZIrL1oqHjCv5JMzzPu6JQ4OJrG+J2ip09YSYWaXu5xExi+5gX2tPlSV
         Iw3RIIEoPa31TWB0s4fGPYg0ypE/IoLlVXm9sfV7wayW+T6Jfz8kBmisodwMS6K1Nur9
         fSIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fxSB0cN0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g19si5829470uak.2.2018.05.01.12.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 12:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fxSB0cN0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDaoS-0001f6-LP
	for alex.bennee@linaro.org; Tue, 01 May 2018 15:19:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fDamC-0000ke-Eb
	for qemu-devel@nongnu.org; Tue, 01 May 2018 15:17:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fDam7-0001l5-KA
	for qemu-devel@nongnu.org; Tue, 01 May 2018 15:17:24 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:46744)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fDam7-0001kr-E1
	for qemu-devel@nongnu.org; Tue, 01 May 2018 15:17:19 -0400
Received: by mail-pg0-x241.google.com with SMTP id z4-v6so8875906pgu.13
	for <qemu-devel@nongnu.org>; Tue, 01 May 2018 12:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ozGcl5dFY0/gLmuIuyaP0Dax6lkh9fukxsuaRaJkThE=;
	b=fxSB0cN07Qnd8rUxcXpEiQDqwr1yBhy8kEfKGY4aWFct00Olodcrnw0GXh1migRJ8g
	0IKAxOwb5ry8EuH/3dykZjapRmpDDgxRTpyG3XH4+7WTpE0l/56xb6Rv6NtTOI6y/75k
	igLH0AiTqItFZq4aMh3SXftrE+fBsiJTxU86I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ozGcl5dFY0/gLmuIuyaP0Dax6lkh9fukxsuaRaJkThE=;
	b=OnbDpY72XaGjf5RuD569Qtr+l45mORKPRpT1azoBo2OV2jGNT2kZaqH177K60pbh/S
	u4Ms/MRjap4zx2hmMKxwez38xcJA95hPL4KHmlpGB4yZ7WHYFHj/7CtHAI3M9lblcV9g
	Ae1HaqL8W8WdYsn1EKtgot1nMlpWq9UlMMxF7e30ZrHbDQ5+es3/XO5QCUuL3RWxaMJc
	iiuyhEGCHr6LsV8VcAqVx7DebgvE1KCUhyqcCDSRfqa2zCb9hfDjlFYkQkaunBOGDPey
	CYCVIw/vdtVZJKlNsaAdmerMnRn0AmX40tcjVj68Gq4rXTYJNWamtoC7YdFjOVmdD+5W
	rfXg==
X-Gm-Message-State: ALQs6tCgPnSFiM9NV1hY92KnjM0uBQyZbF2hXSG81J/D9MY++QSc925g
	uM67coOsmauv3glGnueE5/nkhg==
X-Received: by 2002:a63:6d41:: with SMTP id
	i62-v6mr13885819pgc.233.1525202238513; 
	Tue, 01 May 2018 12:17:18 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	t24sm18458184pfj.75.2018.05.01.12.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 May 2018 12:17:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180427173611.10281-1-peter.maydell@linaro.org>
	<20180427173611.10281-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cd534a43-88e4-2795-3c74-eefc3a6a7fe2@linaro.org>
Date: Tue, 1 May 2018 12:17:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180427173611.10281-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-devel] [PATCH 2/2] hw/net/smc91c111: Convert away from
 old_mmio
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
X-TUID: lec1EaXnVD11

On 04/27/2018 10:36 AM, Peter Maydell wrote:
> Convert the smc91c111 device away from using the old_mmio field of
> MemoryRegionOps. This device is used by several Arm board models.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/net/smc91c111.c | 54 +++++++++++++++++++++-------------------------
>  1 file changed, 25 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

