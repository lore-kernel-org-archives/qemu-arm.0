Received: by 10.28.71.27 with SMTP id u27csp5256614wma;
        Tue, 27 Feb 2018 12:58:32 -0800 (PST)
X-Google-Smtp-Source: AG47ELtqxTttzq3qYfQY4kUu7A0c8ln1Q+DL8JEOJBsLJP6BZ3Z7RUT1s81h/5R1TDRtsunomi0J
X-Received: by 2002:a25:2d19:: with SMTP id t25-v6mr10840113ybt.79.1519765111925;
        Tue, 27 Feb 2018 12:58:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519765111; cv=none;
        d=google.com; s=arc-20160816;
        b=iOZpkF1HO6tHSV6d2OhvizHKrNrQFvcjcy2KYU31qflkWV1K17EqfAWjhLzrgU0RAs
         Rstb4L7amWvdMRp32QjKybBdDL/B7xnIiubdciOKpik8rZ8DBlQ9kb68hp4YuC/cBGK4
         EpGD7NKKxSDSoHgQaU/C+lMAp9Ju5oS+RjTa35LVct/wY8M2ahpGT4HTfTE4g5yO85qZ
         e8t4b3mQobXrI7Uvl4MBC2cGEUHiste5ZRdD4FsCzK2ftKId8pC3p1LJ0hCjeZkDMk5l
         FInWvrCznJ6kilmz08FeDeSL7F+izAFkgwSMRwaCfhzlW0YwrB0nOKRQIasVgVwDMrN9
         IZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=P5YIrUDoam/hPqH09cMKGR8oEzK56XLP00JEj2xUXYw=;
        b=mHDKQ5vMjZ1iu8tArWv8rkQ7nQquOpe+HDtq0DVZLl6qqSZXP/KGWQpT2UiacssJHd
         8MOV5Tn8isAOMEea0QaDrN8ap4HquXJKiL0eLJPYZ/Io+d+KfYl1EQzzTnN5i3mnpzOy
         8DltithRzcNzr4LclhVgx9xt8BAkWY+8xJ91cTRidWJPc6wZdJgj7F4dOgNMxlLIT8f/
         Gpjl7Ix25UWfux8AdIyEzVsp0mWnj5Gsejg5yHCitU3jDo4yqI4KxObx00lzMAwTs/KQ
         Xvti5xIkW66vAe8CaNr6vj5hLwIr744eCRtsX49zny+6M4iJKTUwsT7zTrAyuc0Eek+l
         1qyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z/Pbtd8G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 125-v6si4211ybs.794.2018.02.27.12.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 12:58:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z/Pbtd8G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqmKV-0004w6-Fa
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 15:58:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmKI-0004uE-Vj
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:58:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmKE-0005pA-3k
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:58:19 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:41210)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqmKD-0005oN-Sl
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:58:14 -0500
Received: by mail-pl0-x243.google.com with SMTP id k8-v6so121351pli.8
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 12:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=P5YIrUDoam/hPqH09cMKGR8oEzK56XLP00JEj2xUXYw=;
	b=Z/Pbtd8GcpdHI0Cwr6t2alTXhaCCJgGv1LhVrLhuLy2penclEP0M8sMjs301rX7Ri1
	bopEqHvHpdP3rUgTfAnQSWdd7Kk15+KKu2ygL1a8NenOuf+4bDMvQYMUyUM1G5f4zclZ
	VRYDNeI3obvipNSpC3wSsSMFHoEIxD7dS4Vlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=P5YIrUDoam/hPqH09cMKGR8oEzK56XLP00JEj2xUXYw=;
	b=W05IopenupJhbqwq0iZRwah+hQhs6zQpCxFF9DYpq+oTWFBbBcWeTu+WlU+aV+xHxX
	9xfrviKDleG6lrWlICLm9Vel4nagbZXSas2B/QIZ9BS3DV/avfafL3Axt9/XfDhQEFWv
	lbpOsAJgCFg6WUK/YPR/iwPxr4FIWfRzFCNl/R0Wz2kioBOHwWxEPpi+Asoar1RwrSvk
	r8k30QlDi0OP4tsceu8RlxlZ9L7vhoOPGc/Rv8p78qk1O5/H1mAzBvIeSqMP7lrUkhOD
	KogexYCY5mOLI7uWRQF+8j+7VAx06Cdz+1UZWCdvAF0cQir+4WI/1PKT6dozAFfrRxpJ
	4Qog==
X-Gm-Message-State: APf1xPCbUwoxxP4hxUrl1NQ6tWtjBM6ze4+sTyHsvoxs0zEzGMp9cs5Y
	8lHj6emR4NA+deji5ycFZRwqgg==
X-Received: by 2002:a17:902:6884:: with SMTP id
	i4-v6mr15430209plk.259.1519765092776; 
	Tue, 27 Feb 2018 12:58:12 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id l64sm41299pfi.142.2018.02.27.12.58.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 12:58:11 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a91e29e-8109-1cce-2b19-f70e1f20fdb3@linaro.org>
Date: Tue, 27 Feb 2018 12:58:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 12/19] hw/core/split-irq: Device
 that splits IRQ lines
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
X-TUID: Bu6JmRjU+Sir

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> In some board or SoC models it is necessary to split a qemu_irq line
> so that one input can feed multiple outputs.  We currently have
> qemu_irq_split() for this, but that has several deficiencies:
>  * it can only handle splitting a line into two
>  * it unavoidably leaks memory, so it can't be used
>    in a device that can be deleted
> 
> Implement a qdev device that encapsulates splitting of IRQs, with a
> configurable number of outputs.  (This is in some ways the inverse of
> the TYPE_OR_IRQ device.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/core/Makefile.objs       |  1 +
>  include/hw/core/split-irq.h | 57 +++++++++++++++++++++++++++++
>  include/hw/irq.h            |  4 +-
>  hw/core/split-irq.c         | 89 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 150 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/core/split-irq.h
>  create mode 100644 hw/core/split-irq.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
