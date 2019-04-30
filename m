Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4636943wrh;
        Tue, 30 Apr 2019 05:03:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4Grws4sX++QgQXHsOjcKY/GRkqgyQ5/tSFPxwINq0fMPUFxeAElOP9GDGRHeOT7HXlQ/z
X-Received: by 2002:a1c:7a03:: with SMTP id v3mr2731059wmc.58.1556625810597;
        Tue, 30 Apr 2019 05:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556625810; cv=none;
        d=google.com; s=arc-20160816;
        b=xYiwfuaIHmqtGliFtdU6ob3C/yLxMVcO/Kmif3bEtfd7BY0Q5pZRj7qaHDuTdn/2Zc
         Z5Xwzz8Imjlm8GaCOx3YLqkjWgLfanQffRVqsHS/YnN/BmtEKe4M3lZT8uWjaKa0+aUr
         0S1PUbYuTrX0Eaiuo6epnSJDpsb/WeHTmViIQxFybxGWheOSB/Evxtoz7+a1kBTBdWZ/
         v7vluopaNxAfW8pGr5L0A6V0xcdp8CCLgy0SP4ddvdQkfuR+KMuNQ8g31/4IHlsmGEQP
         j0QrrfvxnP5qQcs23zhyVbkB6X/QPXGMEtQ6AuLJCQIhGhF5bK5IJajqYuaSgpzzN/IG
         pVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cS4uaBvy3LY9OTIBPNCwjPP1ljCyXx4TqP5D5AyFNkE=;
        b=rcmW5Q8NvTc5FszU4nlQiiPsjcH8dyifZ47NKh4l20jPK6iLM/qdwcT/Rg7hElHQ7P
         vpLbL4qOReL9WWPqroLBaHn2CCWEGw+bKIzbTK7VpfiSp+yVB8IdZMkcPPmFYLMyU502
         PyUVr0foQm87G2KkshL2FvOoV0gGi7QUTkRjXrc3QmOaogEzlmPMcBQNkEG0gwiGflDt
         PfQR7LLW7Xgo5gjEit3dMFbpCo3D2zo64JH35mkK5+ClsMAXXxCVi/A6NdWwIrchSuTV
         TvEBd5AelfaFl4oiJpC9YXakxEwXbLroqgbOmkduRSFgcDN2lpDRMP+hqSNkEvxuoV+1
         bVvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vP3+jh7O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si233149wmk.168.2019.04.30.05.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 05:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vP3+jh7O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLRTt-0006Kj-N4
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 08:03:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLRSp-0006G1-AB
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 08:02:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLRSn-0007x7-AX
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 08:02:23 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37733)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLRSn-0007vy-6I
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 08:02:21 -0400
Received: by mail-ot1-x341.google.com with SMTP id r20so10492692otg.4
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cS4uaBvy3LY9OTIBPNCwjPP1ljCyXx4TqP5D5AyFNkE=;
	b=vP3+jh7O25jR+WlqqmezY00RK6klpM8ZyskQqbSMKCkmr4+Bre+l2xVxocz1eD+LKX
	jYq24oZ3N7H/7tkowWkVXdJEaC0Ix85f/yTUFiiSzME2RGa4p5MLrIBhRXWijZdW11xH
	PayKTohQbVNvv0EEL9KDkbgppz+M6RWCfPy6FAvODBdpLugPRwySIWiXSnBVASMRQP93
	lAzxLd2cLyVSOz0ZRMC7R+pUpdRs8UCtxJVRVPyiPBy55WyJmNu11yiQS+7/8aBfWbuu
	2fF1qTPqrtjs/HnawYWcnYq2wvv6Dfahlv7hb+a4huWITN+yyRY6BCA6SU/YRwLhPiZD
	0kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cS4uaBvy3LY9OTIBPNCwjPP1ljCyXx4TqP5D5AyFNkE=;
	b=OO3LafRguYqU/epQ+EZBhokcoYPMpT5tMdfphuwV0EDwXdKKXdV0GIhOWeBR+25Ax4
	Uois/BV1z1H7OkY/uawXG5CPPPPNx2JvPXm04DLzfBSeMAAUvq0c9AbCR747OMQ2t8Ry
	o/GlKuNXDCo3iAAJ9Y8QdIuuLtnncAIeuM82NTNXnBHqgP4FJzGV5E9eH2i1gy4o1QdC
	x02sPuJQXOEmTvrZa6x1qzp5ryREsK6ocbWLrsDwHM/megs4ost6i5f01xuAEYa8qTSY
	M9Va8KC81sa/q23AW+HKFjSqx9gV9eVtDFDw0+dUi+yY1hODbbvoVgZDMkWM48kgzwtd
	MksA==
X-Gm-Message-State: APjAAAV2pp247qLIyeV9fkX8l1/2uSOE+vibuY6xY/j9c7gbZ2aGTFtl
	CsQN7Dl6CQWHwREhq17pcF2qr8+BzoYDZ2J5qxNUmw==
X-Received: by 2002:a9d:57c4:: with SMTP id q4mr7404320oti.151.1556625738346; 
	Tue, 30 Apr 2019 05:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-5-richard.henderson@linaro.org>
	<CAFEAcA_c+RSOmxHcoNueRtAoQAZZCfeSt-4F2GFe=BhSg_1jXg@mail.gmail.com>
In-Reply-To: <CAFEAcA_c+RSOmxHcoNueRtAoQAZZCfeSt-4F2GFe=BhSg_1jXg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2019 13:02:07 +0100
Message-ID: <CAFEAcA_hGbmmekSutR5t=DV2zTHnWWeSJ1+viaKipR9OVmW+HA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
X-TUID: STytfOAAxkib

On Wed, 3 Apr 2019 at 06:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 3 Apr 2019 at 10:44, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>
> > +bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > +                      MMUAccessType access_type, int mmu_idx,
> > +                      bool probe, uintptr_t retaddr)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +
> > +#ifdef CONFIG_USER_ONLY
> > +    cpu->env.exception.vaddress = address;
> > +    if (access_type == MMU_INST_FETCH) {
> > +        cs->exception_index = EXCP_PREFETCH_ABORT;
> > +    } else {
> > +        cs->exception_index = EXCP_DATA_ABORT;
> > +    }
> > +    cpu_loop_exit_restore(cs, retaddr);
> > +#else
> > +    hwaddr phys_addr;
> > +    target_ulong page_size;
> > +    int prot, ret;
> > +    MemTxAttrs attrs = {};
> > +    ARMMMUFaultInfo fi = {};
> > +
> > +    /*
> > +     * Walk the page table and (if the mapping exists) add the page
> > +     * to the TLB. Return false on success, or true on failure. Populate
> > +     * fsr with ARM DFSR/IFSR fault register format value on failure.
> > +     */
>
> This comment about what we return doesn't seem to match what
> the code is doing.

Other than fixing up the comment,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
