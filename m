Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2053117wrq;
        Sat, 30 Jun 2018 12:20:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdrtqnDkjbTpnwUiYTChcq9AopQ9jne9IFVPvlQtKKmNDtpCTttE8EHqiNhuDuEThDvzrpH
X-Received: by 2002:ac8:3fda:: with SMTP id v26-v6mr18640843qtk.414.1530386433815;
        Sat, 30 Jun 2018 12:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530386433; cv=none;
        d=google.com; s=arc-20160816;
        b=wmHdCmxjZMcgGeNOUqXECPrUM7ye9QAeXIy6crpakS4QQKwlZFqNTHnNo7//z230Nz
         cZMxru0E5NOvE8y6YVyPgmDJuNoNbk0FjkkLF8/aVq/nvXRwUw6gfqxOi8z21ixEiXxW
         FjvwecxvQzXA0AYLCX1xokmizquy2CtEEbkVAIQ6pGcHBsGvc2Gr02cEbLERsBayN1BN
         MXNSR5Oh7S5nHk/jC3IRzmGXCKz7IA8/EDGzi/19KsntMJyXywuEYblae/tQKSCHvodu
         ik6IdBnjXon/GRcE0GsWoWlXIzJRzH3O7sWFOTuN+LEPKjaDwudlzJe7S0S8OmNHJq6+
         P9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vO40bXj6IUiBdVa4yVqIM1f3htJ9fc/5+K6L81CM/Rk=;
        b=f+0Jh6MDjkqJgNQ0+C/poWru9nAjq8mkD5jXXUgd27Rf3Hs///JrfEFp7h0f6Pl8dc
         Wxshl44FrhfvQQbXkX/EWNfvyJa8M4goFwas/fMFttf1+8cqJvYoC0NPL3uB3ryoVxXQ
         aUVBbFVfI65EP4q9bNSxq6USEdJfDhB/MxmeAeeuPA5/S0Zv/1XOv7A+8d/HH2eNQxjH
         DZm0bOqah7Mv00ET0BCd5q7fe5Wjpyuvu0f4I4QRH9f4S2diDGzAuFph86alFaLLuP+8
         TNEfKBAizeTnXhfivZFxBbfG8gjkzTm/cMi5S7JGm3tqqAuL9bzGKMQn1rAe59l498/g
         AEXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uwRfPlB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1-v6si71282qvm.176.2018.06.30.12.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jun 2018 12:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uwRfPlB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZLQ9-0004dD-AF
	for alex.bennee@linaro.org; Sat, 30 Jun 2018 15:20:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fZLQ2-0004d6-CG
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 15:20:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fZLQ1-0003Qk-GA
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 15:20:26 -0400
Received: from mail-yb0-x242.google.com ([2607:f8b0:4002:c09::242]:34593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1fZLQ1-0003QM-A3; Sat, 30 Jun 2018 15:20:25 -0400
Received: by mail-yb0-x242.google.com with SMTP id e9-v6so3763644ybq.1;
	Sat, 30 Jun 2018 12:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vO40bXj6IUiBdVa4yVqIM1f3htJ9fc/5+K6L81CM/Rk=;
	b=uwRfPlB0Pqpyi9Jd6pHMuy2CvJRZOXvDUI5sDkspEp1nyIlWLVW/3oMxAvIjXFLWVy
	vi4Om8ha4cl6GEGcUUspDDfprwL3dqmfGxLbIBg6vDWhTNpQqqtthHAI/RPdHRo7cJwN
	EUbN6UwqMkqYlSJQdO0LLe0y9B5uRQSKMuOpz4tNsv3sMdx5OIjVRFOxBMfru6szuzt6
	Y1LCSSkpCYCNp6Qt6UqX8qFp5vZTUNCz57otjEreREl7UeBR8IYaXnEqmjV/k6ReYJBH
	wUR8Xt1Hm301D4cUv2lLHaFimaPGbIy7+0D2fQeFKN/eMcWLs60N+2Z+nYpBHgmvajdX
	WI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vO40bXj6IUiBdVa4yVqIM1f3htJ9fc/5+K6L81CM/Rk=;
	b=V9Jy6QLi3IMT4dKLPsKDh8vZnRbjkfyy0+ElujuuBpdKzbovSLzfBTr+4cz/Ev4Gs3
	lnghHeVMCxrVXJrPacn1iSkR1d7uG5utOsUx4FDExpJNHBnNSPrqyXx1pqDt9xear9Zz
	OF28CiaZQF2/EEVB3EfiyZyD/lxZL4U5Xt69IC1DjzHs+md2tufqkcIBAscDqZluo7DU
	Eh0cFUBtNQvk+3VSjVOFTwcfbg3A32ix1fxhi19BNQJmxF52bZmgwFVBJyZW5wmyw6Pd
	ChF/ErgHnwIxgRUaIZI78pHMXZY7m1DR3YZSTo9D8apw5/9FK549ocS7RA3I0/ZHYENr
	Vh7g==
X-Gm-Message-State: APt69E3uDwmvAaS2qFc8TCReC5mxa7/ySNwIEDF4/+Y0LkEsI/BesZPZ
	jL0yeo5+tYezSgk/dYxjT0E6Y2iZzx71HkwF6Os=
X-Received: by 2002:a25:9d0b:: with SMTP id
	i11-v6mr10222545ybp.1.1530386424637; 
	Sat, 30 Jun 2018 12:20:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:620b:0:0:0:0:0 with HTTP; Sat, 30 Jun 2018 12:20:24
	-0700 (PDT)
In-Reply-To: <20180620130619.11362-2-peter.maydell@linaro.org>
References: <20180620130619.11362-1-peter.maydell@linaro.org>
	<20180620130619.11362-2-peter.maydell@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 30 Jun 2018 12:20:24 -0700
Message-ID: <CAMo8BfLRr16q4_nj0vacK4N4fb0EBymXZB6SHon72h7BJ9M5jw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] tcg: Support MMU protection
 regions smaller than TARGET_PAGE_SIZE
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YIHvztCpVC8Y

Hi Peter,

On Wed, Jun 20, 2018 at 6:06 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Add support for MMU protection regions that are smaller than
> TARGET_PAGE_SIZE. We do this by marking the TLB entry for those
> pages with a flag TLB_RECHECK. This flag causes us to always
> take the slow-path for accesses. In the slow path we can then
> special case them to always call tlb_fill() again, so we have
> the correct information for the exact address being accessed.
>
> This change allows us to handle reading and writing from small
> regions; we cannot deal with execution from the small region.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  accel/tcg/softmmu_template.h |  24 ++++---
>  include/exec/cpu-all.h       |   5 +-
>  accel/tcg/cputlb.c           | 131 +++++++++++++++++++++++++++++------
>  3 files changed, 130 insertions(+), 30 deletions(-)

I'm observing the following failure with xtensa tests:

(qemu) qemu: fatal: Unable to handle guest executing from RAM within a
small MPU region at 0xd0000804

Bisection points to this patch. Any idea what happened?

-- 
Thanks.
-- Max
