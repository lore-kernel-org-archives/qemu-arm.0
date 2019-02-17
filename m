Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1514078wrx;
        Sun, 17 Feb 2019 09:50:08 -0800 (PST)
X-Google-Smtp-Source: AHgI3IafiLL5GsZIfBgoUu1sSJkWWWZgcD5uQEMw6Y6f4RJ8F3sEYorINy1pu71EVMYP3xZJc4wE
X-Received: by 2002:a81:8384:: with SMTP id t126mr16042448ywf.200.1550425808320;
        Sun, 17 Feb 2019 09:50:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550425808; cv=none;
        d=google.com; s=arc-20160816;
        b=Ww9DmP9jc1p05unYO9EfVYpmZmP98aEj3xBAFlTxO5LCEgmNXBDvJ9KPpLmTEpcdFm
         FhScUhC6Vo+1TSs2AZSeB7NdVHNUIXyG18nJMqVK7jt5DX0vmi7/kTeAbcLyYbNTvQwZ
         TESf6wugRwzOECM7EiRRXHg8bBCbz1HKYm+6sK8usdx/M9v0cjBLq7BRsowv1LQgB4Ct
         0vK7nGys60XNc6ux+Lf5Wq16sYEimVgraEGzi1+vAZ5lg4/W7amErBPMT7TnjH6up3Ic
         YGHvpGGblCIimPVgfaiarLQEEmR5ER5KoAywZRiKqKiBQDNV+L/v3qDO0/NonoT4jiz4
         issg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=L228OAKBJW2IpIsgWV8pzkeW3hMe/6x3n7KfM2g0b5E=;
        b=CVEDJLRB7/BEIv5RTmXdhEoe5zvD4VpW3OtVWJHHyhkytgvMiapt7A7BiRPOcQq/cT
         Ga7BwEHBfjzMp7oZ0bMb7Ab+qz0O3/z8do4BC4ngEhf5F5K097txbN6aGQSwJQ738NZx
         qgAi4WIHBg2ckewgF+7DPCtilCeWM3kYwpbUhYN5n6NRonSHrjCSvBdLqXrJc1UwC4Qj
         U9bqIzCGYseHyFjY3OpnIjpJkeQ/AFy45ov41ELC5QL5751sYg7AtrsbUKlIzEYCRoE3
         0s482PSBSAZLPYFzh9UHTB/nWK1UU1NaMVcN1bTTtTKau2GqCfFRx94r2cZrQJJIJBdR
         NEfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bwNcgqSe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e201si6357364yba.438.2019.02.17.09.50.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 09:50:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bwNcgqSe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44543 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQZr-0002is-R7
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 12:50:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQZL-0002iT-Eh
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 12:49:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQZK-0002R5-KO
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 12:49:35 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41314)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQZK-0002Gv-6A
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 12:49:34 -0500
Received: by mail-pf1-x42f.google.com with SMTP id b7so7340190pfi.8
	for <qemu-devel@nongnu.org>; Sun, 17 Feb 2019 09:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=L228OAKBJW2IpIsgWV8pzkeW3hMe/6x3n7KfM2g0b5E=;
	b=bwNcgqSeSSvDSYrB9Fr59hlQnQe2avg6QoyZH85FJMUlqlOOq3F+Yp+/iSGPS1Lf/i
	tvNikqcwkuw0NI066f3iOsLNQwQ/AdxiXAyU7uzZNEzTFNady/N2XvAhl6ja49MGW0Ol
	cBty0jC8QBaXbIlpyEst+l9oCDrJpwQKBLA6seK6vfA5kInxEGaGjs6afb8hz9d4Kppd
	Jf+9t3KqCrcljIB4jNP5JbUOyowWu2apJ/FRmzWE3pz4gNDiEIfeGvCqIezksv2fhC+N
	Dp+PrEqjaytKyUtdbaUwrTJY7ubjSE4EipReM7BufOPTOd+WRNPbWCCl6kZsjU1O+R6p
	I1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=L228OAKBJW2IpIsgWV8pzkeW3hMe/6x3n7KfM2g0b5E=;
	b=XO94IR3w4h3jwjO+WC23UWfE1ystXxvjmJF6+q8HdFdmL+9oXGc/2aUqJVhjjrZiXg
	1QOA9tMwwzJwZhy1bBjhibSUATPRUgeeEf9SsDtD/dbQV3c5MHE+SHVT3PmTFSo/X2Yb
	07ygXp3V1AVCC3STwLjd8AJGM7pjpO3uHgd0dFOJEINTpZutLt2RuMnYqIT/DlGdPtVA
	h5N+YgC/keMnXWhGW+JWq81ouV1uAmqlvan6oBQCravs+f7uu92KSQfyl7hbncfxPovs
	x+KS+Ux4XwDCJH6vz7inCoueN76p1XVNCnDA63W5/9TYXiPxRYz9axncEPopiSMBiiUS
	KZZA==
X-Gm-Message-State: AHQUAuaIPfLOwRX4Uy1judumonmp7BNh96FrgaDV+bcw6pnIwHiYiPsg
	k3GwoM7ZFVKBiHLDjoJ3/34Yfg==
X-Received: by 2002:a62:3c1:: with SMTP id 184mr20278085pfd.56.1550425762066; 
	Sun, 17 Feb 2019 09:49:22 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	t3sm15240940pga.31.2019.02.17.09.49.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 09:49:21 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <65025d72-2213-bd18-f5e6-99d97547354e@linaro.org>
Date: Sun, 17 Feb 2019 09:49:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42f
Subject: Re: [Qemu-devel] [PATCH 01/14] hw/arm/armsse: Fix miswiring of
 expansion IRQs
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
X-TUID: fv7L4k0wz/1p

On 2/14/19 4:50 AM, Peter Maydell wrote:
> In commit 91c1e9fcbd7548db368 where we added dual-CPU support to
> the ARMSSE, we set up the wiring of the expansion IRQs via nested
> loops: the outer loop on 'i' loops for each CPU, and the inner loop
> on 'j' loops for each interrupt. Fix a typo which meant we were
> wiring every expansion IRQ line to external IRQ 0 on CPU 0 and
> to external IRQ 1 on CPU 1.
> 
> Fixes: 91c1e9fcbd7548db368 ("hw/arm/armsse: Support dual-CPU configuration")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/armsse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
