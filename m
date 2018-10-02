Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5173762wrt;
        Tue, 2 Oct 2018 08:14:44 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63OkGobZTCtooIi04fnF9kDvcXXj0yzIrWJJvRHVJqsJfGyQeHnbjQ/jTAug/CnNPddk7/+
X-Received: by 2002:a37:8245:: with SMTP id e66-v6mr12594206qkd.335.1538493284654;
        Tue, 02 Oct 2018 08:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538493284; cv=none;
        d=google.com; s=arc-20160816;
        b=BGYE/L/HzKiUhrSV+k6YBAVxndFlba0jBv67iztBmYD4qqkvgt/ogBU/mT9XgMgLUf
         BX2DgesOkdHG/SP5tMr9+LcM7J2M1/DnjyZqqFI5cbFH82Ysc7GPa2usrggECXms4s2/
         mva+hg7xcL5hRfjcK3/H8E/nzzt9GOZsOwQh4DQdcgq7YPPWTr1ypQ5sCvIwlDcgmOr9
         ETEhhsJlqvP03o/qlySvwxxn0/Np4NF5GwmRkjZxCuO85ex3fmRQKV9JqrkENC7KmbHA
         w6m+AbLXu9VfM13DUgsoypcbNNzw0CbhG94+JXgvXwhUfEYIen3M0invMpYeiLqJHIhP
         Ad7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=sNOwqVe0TWsORyS7SOlBKZHTuMuSbOUaAzPJwwo2oKg=;
        b=r+vG3e6QMHMCrlhaUyVx9n4DlNfvyb+U3Va4tXQxWaFMFR+Fk9oAtUeThFP0w203i9
         FYg9w64aH/rLC34C6hwKy/hD8AtxWs2kKpMQQLNNsNimpV8ut/NyrX8wnGHbDvg3XQHN
         z6b1H2LYgumwnLdWbwvQKtbj4ZAATw9ttzklPbOkfgUUzDJ/K+nQJd3aEJD6Wh52fnn5
         iF5IogMIjaj5uHLQsCos/MBxaq8db7/yB2LKYzZ5vKAw7hzeuOr/h94Aphm0fwplbCGU
         OuZXmkL/mzfBFQ8eas/mwk0men4C0FaEm4/vr+aSb36HLFqw66M5s57zGQ8kMXHHEMWY
         gXww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1-v6si176857qtm.169.2018.10.02.08.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 08:14:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44205 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7MNo-0004k0-5E
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 11:14:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7MNg-0004jj-La
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:14:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7MNb-00010c-93
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:14:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7MNZ-0000zo-3q
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:14:30 -0400
Received: by mail-wr1-f68.google.com with SMTP id 63-v6so2658207wra.11
	for <qemu-arm@nongnu.org>; Tue, 02 Oct 2018 08:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sNOwqVe0TWsORyS7SOlBKZHTuMuSbOUaAzPJwwo2oKg=;
	b=I/rtQTbuX9XAyIn7RCfvDLxV9JLdtrH6fcFJcMfDTqEGbp+9lY9StRuwgdCsrVn7rq
	Qt0pKP+8HmcVTq2hFdhz0uzhE0/nR0duJL2RZDi9SyxnoxkQz0rHhQQmy+Zsj6aYwflC
	MI6zzdWbbBlMGdBbG2/fsYQmC09ZGTvkiyLTAw7L5IG9OXuZEmeWvXXjFqWn4RclSisB
	goZtl1ye2D/QNoTLUCGRkXsg7jGyHWhV+2xHW8F2Ep7ZI/Dh7VdJhm4tYVbwPyKmI+jP
	LtUt0SAZM/LQPOHDZkN50kcQvL+JTdxZrQ2vdA6iEN/R88Z3rN8z3i5a4vBj6/WrttaC
	vrfA==
X-Gm-Message-State: ABuFfog+WXQw5CvzvnWGCUkgqGKZ2VRDIWuek/B4AQk7/V+GVEEzRSM/
	C+E4dGMiZkgphylnZ/UJ2drQ7A==
X-Received: by 2002:adf:b188:: with SMTP id
	q8-v6mr11118771wra.95.1538493263999; 
	Tue, 02 Oct 2018 08:14:23 -0700 (PDT)
Received: from [10.201.33.229] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	o3-v6sm3559533wrw.93.2018.10.02.08.14.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 08:14:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002150304.2287-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <601205ea-a318-8a2a-1ce8-00a946342f1b@redhat.com>
Date: Tue, 2 Oct 2018 17:14:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002150304.2287-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Don't read r4 from
 v8M exception stackframe twice
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
X-TUID: TRBMobQz6Yk4

On 02/10/2018 17:03, Peter Maydell wrote:
> A cut-and-paste error meant we were reading r4 from the v8M
> callee-saves exception stack frame twice. This is harmless
> since it just meant we did two memory accesses to the same
> location, but it's unnecessary. Delete it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/helper.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 073fb3c5cb0..5e721a65272 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7303,7 +7303,6 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>              }
>  
>              pop_ok = pop_ok &&
> -                v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_idx) &&
>                  v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_idx) &&
>                  v7m_stack_read(cpu, &env->regs[5], frameptr + 0xc, mmu_idx) &&
>                  v7m_stack_read(cpu, &env->regs[6], frameptr + 0x10, mmu_idx) &&
> 
