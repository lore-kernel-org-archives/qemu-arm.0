Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2395583wrx;
        Tue, 2 Apr 2019 22:15:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqykCJBo+GZb2VZpHiMSLVIggYquGd4t5VGUrpTgDc741qHvQyCqJfi7K8OFQaquEDnLcrJT
X-Received: by 2002:a25:5c6:: with SMTP id 189mr63207684ybf.100.1554268527547;
        Tue, 02 Apr 2019 22:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554268527; cv=none;
        d=google.com; s=arc-20160816;
        b=KtIvgNnF2+a4RKtTALhbvzPpY9VBgL3ILt4g6jKxXft8LWezzClgV6Ns13uX375rw+
         S1Z8enWnto3bd5HU4uRtAcF5yWf60EZFL+NOQT9VSOZFgunH4l7E71LaMeWDOvMJ3/nw
         HL37RFtfuttKdo6H3RSR89B57huj2Sdgr6RWR1yj8nykEhzip04YqIYFeA7zGufUfyxR
         24XtrDJOAfJBsh9vVWYeQeIDHbsPJWjcB9p3PDpU7nSCSqQ4UOiPiKt8L7v2KeghbVHW
         HoybHEpAZOpZwg43txB2F0KFW6932BcR+dMjGHpZ4eXc+SJ9ZWg9NAX9PbZH+6gBj0vb
         /3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f7udFBX+6ulwFFC3ESWOem24wQsk0Wbr0S3Ld72HQNY=;
        b=rYzWbHv+5Mj+kN0/Zg4ow5RsLhf2zQ5v3+zgtyiWuS1kn4RRizAE7Rni8xjDkQQ7ze
         h3bbBtYDPXobDRFuiby//qndSdMm8GtjkcQoMLzvf24tybsaFeuzfy69Q/2US7twBTY3
         C3FOvRD3FOk3azL8s0kKEOCYWOnfwqFcPaqvmx8vaeEepG+nZoYtlu89cRcPJzGdEh4r
         suZ7L0GMFSiUPc4gb7+0qpvyF4eErBV5bQVjLk+LDFIOsQEX3dlGAFNjy/Y8dA30YC7p
         8abwoDRVYCxp+ojYE+YFd+55cl4KEorM2O3G0eLbp6iPX3xcVgcL9QQSmwNaObeqBOAz
         CPNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GxZtHRLJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si9254263ywu.63.2019.04.02.22.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Apr 2019 22:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GxZtHRLJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBYFD-0004CE-0c
	for alex.bennee@linaro.org; Wed, 03 Apr 2019 01:15:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBYE3-0003uB-30
	for qemu-devel@nongnu.org; Wed, 03 Apr 2019 01:14:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBYE2-0005UL-7L
	for qemu-devel@nongnu.org; Wed, 03 Apr 2019 01:14:15 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:36648)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hBYE1-0005Sj-VW
	for qemu-devel@nongnu.org; Wed, 03 Apr 2019 01:14:14 -0400
Received: by mail-ot1-x334.google.com with SMTP id o74so14328289ota.3
	for <qemu-devel@nongnu.org>; Tue, 02 Apr 2019 22:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f7udFBX+6ulwFFC3ESWOem24wQsk0Wbr0S3Ld72HQNY=;
	b=GxZtHRLJJoUr2s/+C16gWw+vqNWuZMqHhY3ylcX+2frrVYkg/19ViKRd+07Kd7UX/A
	3B39XPyyt4t1nBtCChb8LffLR5llbj+Kb3/K2LD1OkXDkWtZUTLUZdEMcgMlHp69BATB
	M1WyrrSn8LYInsNYpaaLZgMgT5ycc6FiyOp+q6LMYwGpoPI/Lysko2lwr0ed64DPF1zD
	XdUyoxrcxsWnOSw14H0VLEwFL/uyB4zODRDoJfRHhTUB7KnBxqRwLzwbJMVw7fZ7gj7y
	ohfJ5OPLuKJh0iJ66on3+ouZ5k0NRKAbjJ6fEYfE0TnCaIU2Nn41bIMq2Ly5CYcKNDYq
	nEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f7udFBX+6ulwFFC3ESWOem24wQsk0Wbr0S3Ld72HQNY=;
	b=XqqyqtjfqKe5sk+7mrgkllTpvHrbUxioMSrefqlybZYtQurjRTF8zf2b2+x50IT0WT
	djlITm88maGqoj0Lg7uKNPvIIGP0qO74fizIyG7VB1bTdUPl6rgaavHFzbC1I2ey3fTM
	Zp8FnOjESWzVCoZBOEYRsh/aAMtr1IjtXKR57i5YzdFguzKXaY7TmKa6ghQz3XDozJZS
	AsnONW1fGTt21s84bvo76ffdN6zPzXLbtKJh6tAFn5K4sv81kQATueJJgkFg02PCin8i
	MiW/mH+zMKPAF6jJxRE64bpVsAzFk7zZCt3QipUDWh+vVFxU85VlgguSUKOZqgrX61M6
	fE1Q==
X-Gm-Message-State: APjAAAV4B4rPlrYArHkC+Dxq5p/wMjRobdClmkA1mQw99ye0PU+fL0BK
	jVyVGoFB0VCm4EUXZTspipNMl8KtDoFflT0UDWOK9Q==
X-Received: by 2002:a9d:3b44:: with SMTP id z62mr56075901otb.319.1554268452663;
	Tue, 02 Apr 2019 22:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-5-richard.henderson@linaro.org>
In-Reply-To: <20190403034358.21999-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Apr 2019 12:14:01 +0700
Message-ID: <CAFEAcA_c+RSOmxHcoNueRtAoQAZZCfeSt-4F2GFe=BhSg_1jXg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::334
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 04/26] target/arm: Convert to
 CPUClass::tlb_fill
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VxoKxzMIkS2c

On Wed, 3 Apr 2019 at 10:44, Richard Henderson
<richard.henderson@linaro.org> wrote:

> +bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                      MMUAccessType access_type, int mmu_idx,
> +                      bool probe, uintptr_t retaddr)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +#ifdef CONFIG_USER_ONLY
> +    cpu->env.exception.vaddress = address;
> +    if (access_type == MMU_INST_FETCH) {
> +        cs->exception_index = EXCP_PREFETCH_ABORT;
> +    } else {
> +        cs->exception_index = EXCP_DATA_ABORT;
> +    }
> +    cpu_loop_exit_restore(cs, retaddr);
> +#else
> +    hwaddr phys_addr;
> +    target_ulong page_size;
> +    int prot, ret;
> +    MemTxAttrs attrs = {};
> +    ARMMMUFaultInfo fi = {};
> +
> +    /*
> +     * Walk the page table and (if the mapping exists) add the page
> +     * to the TLB. Return false on success, or true on failure. Populate
> +     * fsr with ARM DFSR/IFSR fault register format value on failure.
> +     */

This comment about what we return doesn't seem to match what
the code is doing.

thanks
-- PMM
