Received: by 10.223.188.70 with SMTP id a6csp6179467wrh;
        Tue, 29 Aug 2017 09:15:08 -0700 (PDT)
X-Received: by 10.55.204.137 with SMTP id n9mr6277787qkl.125.1504023308094;
        Tue, 29 Aug 2017 09:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504023308; cv=none;
        d=google.com; s=arc-20160816;
        b=j7nf2T4e4hoJSiIRZFcBrCGYmgnHtMxewlATYF6lG5G3t0uECaEIjTxJOkxEd9vur4
         bcDZiZ7v8Ee36+xvly4yT6HzA6GN3RC0SV/EjbzoUpk+JMOuKFEXwxec3S4JA8j/LcFx
         qTvhzw0wlKK2aLdLK2dg/BLkCOsjLCX0LKUnG2vTNbXDLq1U1eXlr7jhInbZUSdsPhTM
         a+zEwqyjOXtLOVOcLscdg89mlGvuhpkD5g2GrK39af6m+P9GKLpjmpF4RNf49ADCcoer
         zuFJ/RSqwyjgtlZESdQj9W1N4bPQooqvKmSxhadolabJlr6wP9U6EaujiZ6KjkdyguDT
         cArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=1sJhxCObsGVu9KyQC3vD3oOb2M87yex/ftk005s7anM=;
        b=Vl06R1jfZQC7SUzQCJ8W0eEtokKVN27iaAPsjC8ATXk3LZiShe8U7r19UGKdeFwZ9Q
         jfeeHazIkzEAjYedJLDjWH6aJkTsCoJKYu7hZdMLucH1DH87K4UVMAy3eMIj4qAwnvcO
         SoZr9UkhzMEX2leFvxVfgLT1MNdGUOTkfVo+681wAf0qPLXcM6bojRMYOny6POH4SAe3
         9R4tkGHCKXN9XocslaavATICMX5gurTasi2ERF2G9+jUoypNtasQKuJvdFVo4cnEn0ew
         LjszClb7oJMXjP16B571owy0Mswm4ZOETsggmlDpfupG92+iXw7omnJVtOAA4MmP7Pzi
         BinA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SVAVKzZ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 28si3126844qty.168.2017.08.29.09.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SVAVKzZ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmjAP-0007hh-NP
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:15:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj08-0007Az-Ch
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:04:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj05-00026Q-7k
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:04:28 -0400
Received: from mail-pg0-x229.google.com ([2607:f8b0:400e:c05::229]:35869)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmj05-000268-2l
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:04:25 -0400
Received: by mail-pg0-x229.google.com with SMTP id r133so12018625pgr.3
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1sJhxCObsGVu9KyQC3vD3oOb2M87yex/ftk005s7anM=;
	b=SVAVKzZ2u1Qn/q6k0/VPmYML6C2ga2JfmNxTnI7VAzLkODgk7FrSHyz1ReeieDfh3s
	SrtyoINtAiZ0JK1DapkT7sUTh++nVu+40rB4NFJ+myxc6i7bsWiATkU9yvM7zVEtM3ZQ
	O9w9adx4bi7zJrkVz4KdULJvK7RkfJnG2c+Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1sJhxCObsGVu9KyQC3vD3oOb2M87yex/ftk005s7anM=;
	b=k9k7wezLqZfnJ2RDWafa5d35sn6QV7jfWL48xlJYzTCbMx8qdJka6gSMOM1S9M6/3G
	mROAIdpn7DMfDT7aRymVREqv27eCDUifVVYJIhRq/saJcqx1gC0eGJlETzEW1E+RB0WF
	ZlKAy246mHXbQa2tVzr0FtEsaBqf5z479bh48fg33x88WcMiGHAnsfOcBoy54/p7OgU0
	+qgslsvAFsYuwnAe/ATgs2TGRGs5SiR82EqhWqfqD1xvvZsWOIzSCribx2Ht0+yRe9he
	7MXZSz1c8NKYstY8t4oZdpPmUQ+RaNQJfWZhFi2WebV74KEcapofRFtLtimhD9FrR+2K
	EeLA==
X-Gm-Message-State: AHYfb5jNKSvxmtPvnXGpfc/TBAiJMVQe8qBF2scU86yV4rTYg1R7uTrL
	thSTEtnXo/XjhfNpS86yiA==
X-Received: by 10.84.215.149 with SMTP id l21mr1045606pli.308.1504022664055;
	Tue, 29 Aug 2017 09:04:24 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	186sm4858480pgi.11.2017.08.29.09.04.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:04:22 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-14-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0777d69a-88cf-4441-df0a-d7bb30571e80@linaro.org>
Date: Tue, 29 Aug 2017 09:04:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-14-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 13/20] target/arm: Make MPU_RBAR,
 MPU_RLAR banked for v8M
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
X-TUID: ZN7muD/RyCog

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Make the MPU registers MPU_MAIR0 and MPU_MAIR1 banked if v8M security
> extensions are enabled.
> 
> We can freely add more items to vmstate_m_security without
> breaking migration compatibility, because no CPU currently
> has the ARM_FEATURE_M_SECURITY bit enabled and so this
> subsection is not yet used by anything.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  4 ++--
>  hw/intc/armv7m_nvic.c |  8 ++++----
>  target/arm/cpu.c      | 26 ++++++++++++++++++++------
>  target/arm/helper.c   | 11 ++++++-----
>  target/arm/machine.c  | 12 ++++++++----
>  5 files changed, 40 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

