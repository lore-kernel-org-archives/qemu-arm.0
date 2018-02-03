Received: by 10.28.71.27 with SMTP id u27csp910743wma;
        Sat, 3 Feb 2018 13:35:43 -0800 (PST)
X-Google-Smtp-Source: AH8x226a3L8hCS7E5Cn/yqEBhVBnIFUJIBts2Q9ckTOiH2EjnBdDzuLLz7w142x9WNe8bos0aFZM
X-Received: by 10.129.27.12 with SMTP id b12mr28863758ywb.489.1517693743660;
        Sat, 03 Feb 2018 13:35:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517693743; cv=none;
        d=google.com; s=arc-20160816;
        b=iQ/XCZc7PZRDVpbW/fIRj7I27wEguGHk3aW3HHuducG/UhiDQH0DQVK8SbLAGhn7ed
         ry6gUDXl4rk3w+x4/ZsIoTlIJ03TquqJVhEJRAR3Gb7ZFSutKGTaPHFWpMC3AfDp438i
         300wB5ACAFowVDd3rGECfzXwhzmLYj/+rai4eStd8rO4oqXBn5O9EcdV1PYchS7WupdG
         YPTmvay7UBfX+UolSzwjuxipBj27u5YXUe1Ilyjl8E6KhjCc59rfrVQDnoo81+U4oO+y
         JyBQy+PY5Q6eHbGvQD14pS/vclnwUa57VAq7ZBvY38dE1yrdsnmkN20p6ToXMFLWOM38
         D0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Osx4pw0Zr7MDHTRpnZctMYbOZGn9diGd2Bpf9HzgUdE=;
        b=CAFykBi2BiI7EroiWhr2b9hq//E7noPwsLsQXfRWTdA+SiNavuBN672g8upmR0et9M
         JN4Lwg2hpcurvnDblFnyqyHi7/8dOlDtZkz6mczm0xP3wAs9hgeUYqcoOLC+VCIJ7SDf
         ldDiywnX7DCy1pNwtomKtYZYuUQ9iMS9gn4k/2x/bn4QigsNtWUwN5tRiPa3Dq0vvXug
         l3gyKAbbcLzRj2hUcRPnfXQJLDUUMLF2hFnPw19pokONpCx1w1nNgrlNTDrpbE5nYA8x
         BA9P/Jp1+PlldmCuHvz2e29lI2BbfY8xVGfASZBCVZ63HtwjEjY+H71+Yow/cPXS8YhS
         Zzew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i9F68TS8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e123si950676ybc.477.2018.02.03.13.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 13:35:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i9F68TS8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ei5TL-00035N-5G
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 16:35:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ei5Qs-0001SZ-TO
	for qemu-devel@nongnu.org; Sat, 03 Feb 2018 16:33:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ei5Qs-0001BD-3V
	for qemu-devel@nongnu.org; Sat, 03 Feb 2018 16:33:10 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:46632)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ei5Qr-0001Ar-Tv
	for qemu-devel@nongnu.org; Sat, 03 Feb 2018 16:33:10 -0500
Received: by mail-oi0-x244.google.com with SMTP id x21so5582321oie.13
	for <qemu-devel@nongnu.org>; Sat, 03 Feb 2018 13:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Osx4pw0Zr7MDHTRpnZctMYbOZGn9diGd2Bpf9HzgUdE=;
	b=i9F68TS8wvnRHYQZA3MoUaGK/3Abf7oPPKIcO9JMJ4SI91+muD32luhDNQiENWaG11
	48KxBdYIy8tbU9uOZxVM8kajjSzoAz90xM1KPNpDEkI1WOAdJzVwQiyS1Vdnz2QKJsav
	t4Gjy2NjxiV3d4GQhhT4z8DkafMd6Mqfu8plw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Osx4pw0Zr7MDHTRpnZctMYbOZGn9diGd2Bpf9HzgUdE=;
	b=rXNSQoyG86ioYpcW6Ktpqwn1tkZlF/2Ke6PGG5O5uVtSyYVzzu8p+vTAANZuQYxnMM
	uqdU3TWMLF2GkEZt0asWqypPkyc/ohhTRlPtwRcsE5TTFIkg3SIyiJE9hCQtx51YrBgq
	8cFJ6zEaq8jYT9Jj6hRI3EJHUpXoPywiac0b1ZuqG5XZN/Dt1XHS5mmh1rB/jRfliCTL
	q7Ob5TtpbzLGzi2QWE1rO88cOTzNm2F71qhvbJkvKtL7UR4yOd5duOhbrHAl3QznU31t
	x+PBkTBzHLf8Yg2xwVcmbPTIzxg120lu/enbapp/n/d5mU7vmYadfnDLK8mKBkvUaNSO
	AmGg==
X-Gm-Message-State: AKwxytdOYTPWi0Zx8ZMGoaWjDFNc6gAPVrlhw0+P/T9AVYnnHATxj15G
	/NDr0Id9AFgMPqFoNswPtaWpCp+xJs6vcbHGf20X0w==
X-Received: by 10.202.252.68 with SMTP id a65mr14459108oii.256.1517693589214; 
	Sat, 03 Feb 2018 13:33:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Sat, 3 Feb 2018 13:32:48 -0800 (PST)
In-Reply-To: <1517324542-6607-5-git-send-email-peter.maydell@linaro.org>
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-5-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 3 Feb 2018 21:32:48 +0000
Message-ID: <CAFEAcA8AoyXwSUkkG+OYG8pbEH00aBktvz2XEh1A-5p-hk4xOA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 4/7] target/arm: Make v7M
 exception entry stack push check MPU
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oR/g9ay/eG5P

On 30 January 2018 at 15:02, Peter Maydell <peter.maydell@linaro.org> wrote:
> -static void v7m_push(CPUARMState *env, uint32_t val)
> +static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
> +                            ARMMMUIdx mmu_idx, bool ignfault)
>  {
> -    CPUState *cs = CPU(arm_env_get_cpu(env));
> +    CPUState *cs = CPU(cpu);
> +    CPUARMState *env = &cpu->env;
> +    MemTxAttrs attrs = {};
> +    MemTxResult txres;
> +    target_ulong page_size;
> +    hwaddr physaddr;
> +    int prot;
> +    ARMMMUFaultInfo fi;
> +    bool secure = mmu_idx & ARM_MMU_IDX_M_S;
> +    int exc;
> +    bool exc_secure;
>
> -    env->regs[13] -= 4;
> -    stl_phys(cs->as, env->regs[13], val);
> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &physaddr,
> +                      &attrs, &prot, &page_size, &fi, NULL)) {
> +        /* MPU/SAU lookup failed */
> +        if (fi.type == ARMFault_QEMU_SFault) {
> +            qemu_log_mask(CPU_LOG_INT,
> +                          "...SecureFault with SFSR.AUVIOL during stacking\n");
> +            env->v7m.sfsr |= R_V7M_SFSR_AUVIOL_MASK | R_V7M_SFSR_SFARVALID_MASK;
> +            env->v7m.sfar = addr;
> +            exc = ARMV7M_EXCP_SECURE;
> +            exc_secure = true;

I noticed on Friday that this code isn't quite right -- it should be
   exc_secure = false;

This is because SecureFault is not banked, and for non-banked exceptions
we want to always pass false to armv7m_nvic_set_pending{,_derived}().
Otherwise that function will assert().

v7m_stack_read() in a later patch has the same bug.

thanks
-- PMM
