Received: by 10.223.197.9 with SMTP id q9csp846415wrf;
        Thu, 5 Oct 2017 11:42:19 -0700 (PDT)
X-Received: by 10.200.57.29 with SMTP id s29mr36437054qtb.309.1507228939464;
        Thu, 05 Oct 2017 11:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507228939; cv=none;
        d=google.com; s=arc-20160816;
        b=tx1pWktglVS0XBP6Rcz024UYXJZNJuRM4L3tAsG0spV2UEHN9EiQCaoXWVMN6BUEgG
         O8ffAWOszzcvCmOvRIZS6TmFE7TwhauZagX0xHxEPtb5oUZY854AkLOdgFf7R2uspq5Y
         zf0pf2zkpiU7sdWmZAXvjEEzFKHFF85EqFN9dUhtkI852aQdjdeUm4qTkTUuZixUriW8
         QQGiMaw43NsRBwBX5TQI09L877Q2eUXGJaJ0BSLG2SNkVmxCTQayPBTNKDAaGhxXxfX/
         /J05pmRvbhdaPitpUNuPqMBJnxkQkSLjgipDf2dYRfr93u0OwtZ5Y0dUSIvAcRKA3FYF
         ajEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=yXgbQmzU9gCa0KmxUqgpNmAWTUIE8yLqtVnRpDdlXPw=;
        b=qs1nkz9tgeww1CKVdd0XYEnONuoKCffiE56VVVFJ7cO3XaOqFA9fA1A0SvI5UJJdMQ
         Tb98dvXorcNnBZzmAcbV63tFjDz2l3am8mDulpwq8TWzJd/1ezzqJDBzOiQ/jhDWDEXJ
         SbDvSqmRoB83+NWYotKxXZGVr2z92OHV08q4grqw6vqBk6O4DtSCltpZWJTZ/YG9NBxJ
         wCVxb1mzWhZp5ipE0D9GZywo0AKdyeDLvKvIiYGP6vh5HQBmHMK6xLGWgppa9FH3AwbQ
         csD4CFqIFTnZtcXx/U31lWiBUoVFGU/RuVetRFvmz9IYOsz6JNvdaSvXIaLwXA8h8PIr
         M7XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JgGS5xRv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5si7451520qtd.506.2017.10.05.11.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 11:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JgGS5xRv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0B6A-0006EN-U2
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 14:42:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0B62-0006Dd-Df
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:42:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0B61-00047w-Le
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:42:10 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:49457)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0B61-00047E-HR
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:42:09 -0400
Received: by mail-qt0-x235.google.com with SMTP id o3so27217602qte.6
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 11:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=yXgbQmzU9gCa0KmxUqgpNmAWTUIE8yLqtVnRpDdlXPw=;
	b=JgGS5xRvOemmniMcktvo48BbpN7rYF4z9MaUJ+aPKIzT0JgxSBbkn8RzvLavoKmc9r
	YhbLZgWCHN89NXk80hTnYTEOAxCUuEIvJQ8ZLmCOZ/HxaKzOMC+BMO4mRP5v9wx+MY7n
	STfeCpLKgjJVf4CTVWUXYhS9tuGr8rT3EvA74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yXgbQmzU9gCa0KmxUqgpNmAWTUIE8yLqtVnRpDdlXPw=;
	b=VCRlbdlH2v8iCST4lqkTIn5dbhfG5J9b0G0gG5VQA0XxphTe6p8g13+xu1eIDnnrxD
	72Lz5aAlTYM9jastd1OJ7ps1bd+47UwbveggaFiLYvKYxXv+MNpCmQe14HGGcRDbrATJ
	yl0gpuAkjptQc/aF3XAQ4IA9Lls9ZkGZ5KhN5dZH8Nc+BHAt81Ges8n+ljNOTUaOQPEe
	K6ZzlF3jhiC5N3bcr/38JEC/BdEVMxyTndfS9eUOGv5Xf+Y2LhDVOdXr6HdJBEiL8yv6
	iiNbCywyTcstZHaoXYf0yxR5WeVpz1WD1SSVIHFPuzJz0f82tyKZ1LEodVOxsCfwYl2Q
	cuCg==
X-Gm-Message-State: AHPjjUirL6IQ+1GmaBVyttAlxVT2dDuVg2LXI/MzPzOr2daG+AvutjLr
	IWaH9PCF/tvAIE82H7sbgeRB4A==
X-Google-Smtp-Source: AOwi7QBrRMT42Zvr/vI492EFEs5jOAb+5JUiXhSXkOhZEL3sw/+wWqAF1ezE7+YHdAyEkj2+WdJgVg==
X-Received: by 10.13.222.131 with SMTP id h125mr21951238ywe.16.1507228928927; 
	Thu, 05 Oct 2017 11:42:08 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	c13sm8392863ywm.101.2017.10.05.11.42.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 11:42:08 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-17-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d5580cc-eea2-280b-5a65-0462e7af7cbd@linaro.org>
Date: Thu, 5 Oct 2017 14:42:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-17-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 16/20] target/arm: Factor out
 "get mmuidx for specified security state"
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
X-TUID: 619R95VSVBoW

On 09/22/2017 11:00 AM, Peter Maydell wrote:
> For the SG instruction and secure function return we are going
> to want to do memory accesses using the MMU index of the CPU
> in secure state, even though the CPU is currently in non-secure
> state. Write arm_v7m_mmu_idx_for_secstate() to do this job,
> and use it in cpu_mmu_index().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


