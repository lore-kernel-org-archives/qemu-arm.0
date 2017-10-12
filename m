Received: by 10.223.197.9 with SMTP id q9csp1780603wrf;
        Thu, 12 Oct 2017 08:12:28 -0700 (PDT)
X-Received: by 10.55.159.77 with SMTP id i74mr940398qke.329.1507821148086;
        Thu, 12 Oct 2017 08:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507821148; cv=none;
        d=google.com; s=arc-20160816;
        b=AYs6eugacw7U9dUuP5kviNIU37fwrCxdlZnw5MKQkmZWN4jfwmxtqxouENr8MsQMC/
         f0O9yVSGWG+TCwX38AcLk7C3XX2g6Jd/IOOU5qCLljovPcQtohgGOhnV8xBLgAFjl5jV
         5Ks4f0J0ado56Cty3LP7TZQ6rTItbCoaDqRPXjRLMDMZBKBb3jAbn2e/vdYwG6xGWmbt
         IfHmDoJ0/BL1dtlL5ryHzriG4zi9Is2oSbftWZIb8EgMzZzUgv4bAGDpRSVHS1MnSBgp
         h2FR8uuThrHQHV9eego8dxEGJpv0SSFh8v5ToIdOXhyIlQrB73VEhwcxKh/Eqd5HNy9y
         Z6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=XlVgzwsYuBGtUi5Tckm7CpWVHomANM7ilHAABYzr4zc=;
        b=xsvhLX7Vi7VfbuNXeeWfRwGuH+eLvEAoIQIZuR/mMF/tGiSxs3zm8bwIr9pPPPO60Z
         ZNi+bCX1hIeppKqVyz86ZqDewtbYFuXPTV1UE/WetRzcmxnhgVZckpx7qYFCCFRv9POd
         1h4DT7jyOJyEcjYnQeuBcbNECvIM50UZH4y6+60R4u7ioeMc0k0ppRQuhIldcM6P6aT/
         yN8Xjb4pQbXkc3+WI7wpLkehHKqcaDPKqZaNOOxJo/pcQEtDeZe+v6gOlgHpjAM/ZbiP
         lIxdFY6RPy0zL74yhbVsTKL5Z0D2lB2VXL4tZE4T8UDGvYzfMvSuQZXSoqeRk4NXCywq
         Egsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hnDPsCgd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a125si6063997qkd.422.2017.10.12.08.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Oct 2017 08:12:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hnDPsCgd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2f9t-0007LS-O8
	for alex.bennee@linaro.org; Thu, 12 Oct 2017 11:12:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e2f8h-0006ZA-0P
	for qemu-devel@nongnu.org; Thu, 12 Oct 2017 11:11:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e2f8d-0004RQ-1I
	for qemu-devel@nongnu.org; Thu, 12 Oct 2017 11:11:10 -0400
Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232]:56134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e2f8c-0004QJ-Qi
	for qemu-devel@nongnu.org; Thu, 12 Oct 2017 11:11:06 -0400
Received: by mail-pf0-x232.google.com with SMTP id 17so5218665pfn.12
	for <qemu-devel@nongnu.org>; Thu, 12 Oct 2017 08:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XlVgzwsYuBGtUi5Tckm7CpWVHomANM7ilHAABYzr4zc=;
	b=hnDPsCgdcMIbYtsOMAyYDws9CWphddSGxo5v/ynNFj8ZDMIb+YIIeW8s/HKci9V/qg
	DjHsYujYFAYfTl+/yMNQO7+Ue5RqsB3JFSFcKW9sTYFLtZgPBtufKZ6odo0xAl/rBlzW
	Fq1scoWFvoflg/NrWSRR4P4O2dIEG3uz21Wck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XlVgzwsYuBGtUi5Tckm7CpWVHomANM7ilHAABYzr4zc=;
	b=koXmVApuHU/fWrVXRd6c+YNahHRfGmW2+Vv9b8YdpVc3UQ7H5a/HMXbIW2nsqEnZEq
	kSuUurS9XsWu+cwAfcu/56yGl1964IxS3rhSh02mAkbEgWeW0gaG4E6lIFkoYsuQAtSv
	W23qXaKR6rYpFfRRTkyd7bvtzVx0Jt3FCRbO0rJaa5CaYy7vMezdRjW1sZLrO4jRxiEs
	WMu6/FhkCebWsknF+bHi9IaBAgIWmbm32Y4BzBaIPucYVQ2Rk+HCKrmeUePViFOdeMqq
	1n+xF1WRQGUXbxxpxBN/SHk/3l9ZTKOKbCe0ac89zDn5SER3ZjzXaGoI59fXTLPnIY2h
	Qkdg==
X-Gm-Message-State: AMCzsaXivkdBpJ2MqqTMLPQOw6uFeibScq9GXt42pzY/z9mksQoSL0yu
	sIAODrrLP85d0WPANsbKHPekjw==
X-Google-Smtp-Source: AOwi7QDEUoejqrtYNGCdJDn6x2gtqEhYUBTeOoIPm2jBG+3Pzetzm2h7630WrHICq5S+hxU/OHKvFQ==
X-Received: by 10.99.6.75 with SMTP id 72mr500226pgg.350.1507821066025;
	Thu, 12 Oct 2017 08:11:06 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.gmail.com with ESMTPSA id
	y27sm18304484pfi.107.2017.10.12.08.11.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Oct 2017 08:11:05 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1507742676-9908-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00fd7671-5d50-98a0-dc5e-b890489502a8@linaro.org>
Date: Thu, 12 Oct 2017 08:11:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507742676-9908-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::232
Subject: Re: [Qemu-devel] [PATCH] nvic: Add missing 'break'
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
X-TUID: oZ9dlhrSaC7g

On 10/11/2017 10:24 AM, Peter Maydell wrote:
> Coverity points out that we forgot the 'break' for
> the SAU_CTRL write case (CID1381683). This has
> no actual visible consequences because it happens
> that the following case is effectively a no-op.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
