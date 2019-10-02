Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp298370wrp;
        Tue, 1 Oct 2019 19:07:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrybw+4DDqyB/a8Mw9Q2BP893EMAyTstdrqrvlFhHa3KVT+0svB7NmVgZnHY5hSKQiDxNd
X-Received: by 2002:aed:3709:: with SMTP id i9mr1654589qtb.61.1569982041136;
        Tue, 01 Oct 2019 19:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569982041; cv=none;
        d=google.com; s=arc-20160816;
        b=YB6AshoSpvH/2wHViasRUuFBLJ4dLePOTMbTb9vp+Opdq0Cz8zwqpiIC/TdqVaszvZ
         pj3HQEiimNG5NQzv1VHCU8BMlZ0Fg2scSssPkmvLHTGjdEIJ8T+gC96v09nYIrDcyPpA
         L198C8t1+lm8Liy33Kz8bMOPz2KQO7NFaN0y/2QcUmhfi2sx86J7+wJDU+dfUnKMoacW
         ZjSi9c8cqdk5oxCx1WbGuvH/rPM3TsymQShH70YCC3F4xs4NSsRBDAf/OgRhREN86/U4
         +smZG4wqPphhvnXJ31i+s0vW4ndmLCqr5pV6rSdBTmTZQuFm7Rn3b6VSfMbFsKkMYVJ8
         wYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-filter;
        bh=6dcSwEMcurtKdlc8MOuo3Pi2gO8n+YqU1CsmRXDUSQo=;
        b=goYjDcHb2/NBq/Om3/Xupyy2vqkPXYuZNSfIfRO0xYNo/Bn8ObBiODnG79t5YomD6p
         EypwnR2Eb/+G0nZQKTTHJshoZOUVTZ6Zckm8Ujl/GO2+6ScSqpY6daK/yoeKDtbTAHky
         1dQxKmfiTpKcUOmvwDWOIoCsOjHan4yoRLpOWA5Ktfcts8InYubXZELUtHYfFbFeQbU/
         qPQ1SGbZEOrNi7s4IHN6byfGpM62RfJVddGwD8sGyV/RxCJ/MwL2n9H1P/kCFgsHXRQ9
         NyMVz0Z8Mc6GbRpgrA/J27HN9leIbXUQjHBwFQjjUTFQZEBDunyTaN1xVZ03zEB+HcCb
         ENdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si16339050qtb.326.2019.10.01.19.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 19:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1]:50568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFU2x-0004Az-EN
	for alex.bennee@linaro.org; Tue, 01 Oct 2019 22:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nramas@linux.microsoft.com>) id 1iFTVH-000250-Hc
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 21:32:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iFTVG-0005kC-4G
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 21:32:31 -0400
Received: from linux.microsoft.com ([13.77.154.182]:35386)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>)
 id 1iFTVC-0005eU-KQ; Tue, 01 Oct 2019 21:32:26 -0400
Received: from [10.200.157.26] (unknown [131.107.147.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 075762007698;
 Tue,  1 Oct 2019 18:32:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 075762007698
Subject: Re: Is kexec supported in QEMU for ARM64 (qemu-system-aarch64) with
 arm-trusted-firmware, optee, and u-boot.
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <21633062-b021-a8e7-0cc8-062f4c29dde5@linux.microsoft.com>
 <ca5c74db-cf5d-0c3f-eb6f-27d1092420ae@linux.microsoft.com>
 <65b49cb0-c9fb-d966-8dec-1e39d09ab8c7@redhat.com>
 <88878b22-803f-41fc-9df2-2c6eb551b98d@linux.microsoft.com>
 <CAKv+Gu8kwg_tsrH7qne3H11hUPyA6zw-J_jpUmiyJMvXo3-SNQ@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <5938a592-1494-ca0c-8a34-7df38dbbea0c@linux.microsoft.com>
Date: Tue, 1 Oct 2019 18:32:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu8kwg_tsrH7qne3H11hUPyA6zw-J_jpUmiyJMvXo3-SNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 13.77.154.182
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /iNUj4xmGFNv

On 10/1/19 9:30 AM, Ard Biesheuvel wrote:

> 
> kexec is a linux concept, so whether it is supported should not depend
> on the secure world firmware or the underlying host.

I agree Ard.
When I don't use ATF I am able to do kexec in QEMU and successfully boot 
into the new kernel.
Is the following expected?

When I execute kexec ("kexec -l <kernel>", followed by "kexec -e") I hit 
the following assert in ATF (in the file
arm-trusted-firmware/plat/qemu/qemu_pm.c)

/*******************************************************************************
   * Platform handler called when a power domain is about to be turned
   * off. The target_state encodes the power state that each level should
   * transition to.
******************************************************************************/
void qemu_pwr_domain_off(const psci_power_state_t *target_state)
{
      assert(0);
}

Thanks,
  -lakshmi


