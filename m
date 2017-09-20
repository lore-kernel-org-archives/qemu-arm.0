Received: by 10.223.172.38 with SMTP id v35csp1146816wrc;
        Wed, 20 Sep 2017 14:03:16 -0700 (PDT)
X-Received: by 10.200.43.228 with SMTP id n33mr1791qtn.241.1505941396095;
        Wed, 20 Sep 2017 14:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505941396; cv=none;
        d=google.com; s=arc-20160816;
        b=aP3tCS+klAQgDwv5sokZyl/8qzq6sJ7HWvMvODqI9qj0cRV1u642wZQ+3bV67wbGXY
         p/ivlCpD42+yQ2Shm+DMOMK5ikOZPUEAX+LPr0eIx98WLDo2guJC8RH2WVqJLbbE7ARt
         8zz3ACCvN0p+rlyrAJBeVguxAq5ZQcamesuBGUVJafBZbEZoifl97kZ7vSwG5XIxCFsJ
         KjGqVTBBwsY+PzM9QwsKxlHlUdw1oxWpb4+4Y6AyQYKXuyG7Gb2aZzyr54qYtUWtGgq9
         aqJ2ZJ1EB9KtRT24ZxPcF13qeGtBPVHvIUNKzyOM63ZHOeo6sYCioZrYar/G/b54C7QI
         2qhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=O1879J9ByxyJrmoj8ZEV5qzs/7tAm4kehlJm+9WxAh0=;
        b=KgMyddGsRwyT0dOOwstTSsWG+HarXAo5Vyc9AoLludapStUv4Yvu9o3JNNi4Kg1d9H
         QT33yx7opD8bm6jn4d2nPIX2TacRjHDpyZ80p8smRzBH1/JVbKOW+xpvqpnSN8DVpzZz
         5SeQtjr8+nmQ4pPozV0BDEp7w/0q3y+/ivo+lVTJQDhiz4w8VjfFQ3wvr51KbZyim7UZ
         lk8c+rGN9CjKoWYmZGzs+E8F+VYd+WvUk0Wdw519aZkXXSaG+iUzsFoKw9u4CFqoBi/b
         eJY7wJwlOpOj179CFOuz/J3yZZM7qrOvvz/l4iVbT0tytOvLByrczHkIVK1oCGgA4j4I
         ekcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QKi0duY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x128si2544723qkc.234.2017.09.20.14.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 14:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QKi0duY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dum9J-0000yy-O1
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 17:03:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dum93-0000wg-Qk
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:02:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dum90-0001Sj-N3
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:02:57 -0400
Received: from mail-io0-x231.google.com ([2607:f8b0:4001:c06::231]:53671)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dum90-0001S9-IN
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:02:54 -0400
Received: by mail-io0-x231.google.com with SMTP id q11so6517038ioe.10
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 14:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=O1879J9ByxyJrmoj8ZEV5qzs/7tAm4kehlJm+9WxAh0=;
	b=QKi0duY4M5FCJkehbNlKPC8w00UKv0DSR6UeIIXWtVU2Td3wyVjJrjxjUzQJ6MEDro
	TxnNtOPzDOoCXx/aGjYZmpuCgZFt3ePxnqgE9mAYHQ/Cyiz/YF5CAkq2L+8248gRL1is
	1IzUcJnAFp8vILsKjhBVitS8yPMNc/CbDvyMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=O1879J9ByxyJrmoj8ZEV5qzs/7tAm4kehlJm+9WxAh0=;
	b=H1tFRXTEtRFtaNti/P+LitWLr5FeYzY6TebdjPQ3NaASNhMF3tF7/sbtQ6RCeRxs+T
	eNy91YUZ5Kq+t0fubIvOG3wRpXUOK7XYo6JGxwoeV5L7ZYSxU1yuDwo66fXXsrfOGy2U
	bpztNdo7piw1KfTNn0+LIxuU5j/iQLRbkfterQgrlLWneMZrHWxXfGdeCmd+2KYOIFLC
	8rfERDPaw7W5iD3FuDRQzJL2BcmqsoMzQLfK0pZb6jE2Jhb/PEBxRy7mcOEL3v0QHidH
	T9FpBwzPO0OEqbYkYDq9eDVND8EUWiLcpPts2WCyYN9WPv7g+OCa6lcWlFq1UPXM6MFc
	TH4Q==
X-Gm-Message-State: AHPjjUixffM8i0uIUEHELXtdtNucq9Qa9a2AKC6pHtFOP1PCVjLnlKrn
	uSqBwzgrf3Cook2X67SRZEPvrkIpdaQ=
X-Google-Smtp-Source: AOwi7QCezvecnArY+FpYbY8z+oQcv82Zvgi5Gs0aQOWHGAGPk3ZzZOOFl0xGYzvjg0ABvWJotJW0QQ==
X-Received: by 10.202.171.201 with SMTP id u192mr45599oie.6.1505941373804;
	Wed, 20 Sep 2017 14:02:53 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	f123sm3238632oih.19.2017.09.20.14.02.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 14:02:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
	<1505580378-9044-5-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f07b039-a844-1df3-a07b-20578b08b659@linaro.org>
Date: Wed, 20 Sep 2017 16:02:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505580378-9044-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/6] hw/timer/omap_gptimer:
 Don't use old_mmio
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
X-TUID: MRTbgj9LfRTY

On 09/16/2017 11:46 AM, Peter Maydell wrote:
> Don't use the old_mmio struct in memory region ops.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/omap_gptimer.c | 49 +++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
