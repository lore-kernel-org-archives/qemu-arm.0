Received: by 10.80.166.35 with SMTP id d32csp102109edc;
        Tue, 11 Oct 2016 10:08:23 -0700 (PDT)
X-Received: by 10.237.41.39 with SMTP id s36mr4384383qtd.156.1476205703284;
        Tue, 11 Oct 2016 10:08:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s13si1894514qtc.86.2016.10.11.10.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 10:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu0XO-0000y6-M1
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 13:08:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1bu0XC-0000uT-Jg
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1bu0X5-0003ot-V0
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:08:09 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>)
	id 1bu0X5-0003oi-Mr; Tue, 11 Oct 2016 13:08:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 01C0861801; Tue, 11 Oct 2016 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1476205683;
	bh=F0Q099icMP6iV3As7/1eNscJ2crZMtgKSJ79s3Orqss=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=Ahug9RrtIzuCEwrGDQZMl1lhgohr+rTFSiwqXStecxJMDdlntOvSbVsCVGRIlWLLK
	keK7iX6Fya2qKnwcBK/itT1DsxHWFpUtu/cTeB7554IWftNOuzPfmvpT+m8GT88Nt8
	8TBXGadND0jX4Od9CMHU4zZTrEK5p2FbRk+YfcvM=
Received: from [10.228.68.87] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: cov@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 305A0611DD;
	Tue, 11 Oct 2016 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1476205682;
	bh=F0Q099icMP6iV3As7/1eNscJ2crZMtgKSJ79s3Orqss=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=pJAlFOUxB3CJiHR1dRFMPV7SL4Qu2CJco1BEu1GCUY8SQjw0msCQ5gzSpQYqkA6Vn
	p2KSI+R0dT2Ilf2cglSQl/l+OIIG0mIofSQPOpG0Re6Oz5g/OmVW5EcIixb/MV+X1t
	btEZLQB2+lBTcF0f91MHPlBeDiHWq/I6lUJahEOw=
DMARC-Filter: OpenDMARC Filter v1.3.1 smtp.codeaurora.org 305A0611DD
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=pass smtp.mailfrom=cov@codeaurora.org
To: Peter Maydell <peter.maydell@linaro.org>
References: <20161011163202.19720-1-cov@codeaurora.org>
	<CAFEAcA-4wmWBxj+T=A+vFO=oyLNCJZbbLfzbLNpemLXLyU6EdQ@mail.gmail.com>
From: Christopher Covington <cov@codeaurora.org>
Message-ID: <2af79c93-3c45-3f61-60d7-39e04aa15f2b@codeaurora.org>
Date: Tue, 11 Oct 2016 13:08:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-4wmWBxj+T=A+vFO=oyLNCJZbbLfzbLNpemLXLyU6EdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gic_kvm: Fix build on aarch64
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shanker Donthineni <shankerd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mm5NWhH+dMvd

On 10/11/2016 12:43 PM, Peter Maydell wrote:
> On 11 October 2016 at 17:32, Christopher Covington <cov@codeaurora.org> wrote:
>> Remove unused debugging code to fix native building on aarch64. Without
>> this change, the following -Werr output inhibits make from completing.
>>
>>   qemu/hw/intc/arm_gic_kvm.c:38:18: error: debug_gic_kvm defined but not used [-Werror=unused-const-variable=]
>>    static const int debug_gic_kvm = 0;
>>                     ^~~~~~~~~~~~~
>>   cc1: all warnings being treated as errors
>>   qemu/rules.mak:60: recipe for target 'hw/intc/arm_gic_kvm.o' failed
>>   make[1]: *** [hw/intc/arm_gic_kvm.o] Error 1
>>   Makefile:205: recipe for target 'subdir-aarch64-softmmu' failed
> 
> This builds for me on aarch64, so presumably this is a "newer
> compiler is more picky" warning.

From Fedora 25:
gcc (GCC) 6.2.1 20160916 (Red Hat 6.2.1-2)

> In any case, since we don't use the DPRINTF macro we may as well
> dump it (we should use tracepoints if we want to add interesting
> debug-logging in future anyhow).
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks Peter!

Cov

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc. Qualcomm Technologies, Inc. is a member of the Code
Aurora Forum, a Linux Foundation Collaborative Project.
