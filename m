Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1563254lfc;
        Thu, 4 Jun 2020 08:39:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2Uhiv3Rvc4biyUNLdxtvF3OYnpbtAlH1vQpG6TW19nBhLxT1mon3Q4w000dubv9PD3IJc
X-Received: by 2002:a25:ac5e:: with SMTP id r30mr9454290ybd.68.1591285141154;
        Thu, 04 Jun 2020 08:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591285141; cv=none;
        d=google.com; s=arc-20160816;
        b=SXTMwDQQwK69cKhUjfghXHK0SCG2Spu9OUw1prv54T/SPm1/3MfxwXqCvBxKDRV05+
         qSuE/bC2XDEObn/sA+HaXYhwuRVy894vQ7/fhOvqhFGdv7MiKxh3qwcO/hCYHkw7PcTc
         +9ZE/Qmg14EPT0NcZgMVsoDK2WUQyGjbXXFE1F/qT7jV+kOXoEJA14M7phCy6HQVsvtb
         gW9pHf6iC9ajDGTdu7ifqJeeZF0YBB+p9/fPyF5V4uhNhfIxu6n2vtNLFMhqmMdhmtal
         jWGbsvC4JboGSH4WHBZRJ0uAIq8j7GlhJP9K4MOzqmVFDwzyLHVm+hOzODp+DqcFNuQx
         brAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=qCXEcpG31wPJYLx+CXiCODOdNShDZ8WkTXBu5ixfjgY=;
        b=QRGhPHvDDl6VwNPMP9RgGJtKd7xwEM2AB6wmpTPD2XFp6Yv0DIR6xsa43Np7lY6bn5
         ntmjMR3hv/qnVkfFxkbpXXW5+7qKTeSD0UfbNSjKsCRtsTxToLjGX073uOrU1c/NENqK
         m5ya8etid/KcxZvEckubzlRQOgXkI81GKhStWL73Q7nIZEanpDRrtmIpsAcq4rfsHzu7
         aPKfnEz/6gntBWSx4EupuBi2VaDkeyomP9G7DBFk0dPz7KFNcSY9+WChrbOv5yBv03M9
         c7p40vnXWkwo+w6cGRTyv3bs2y6W9/l7JzIa221/XWg/uS/vY8SjUoiDvTJg1+ykes/E
         BnNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=mSbcvKIf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si5045935ybg.41.2020.06.04.08.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 08:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=mSbcvKIf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgrxM-0003i6-Hf
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 11:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jgrxF-0003hw-Ju
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 11:38:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jgrxE-00063a-5j
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 11:38:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id r7so6655050wro.1
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qCXEcpG31wPJYLx+CXiCODOdNShDZ8WkTXBu5ixfjgY=;
 b=mSbcvKIfERTCbok6Cr+Mg31u8V2shke/NAOnI9WBDNMYfcltPVw19bp7jPXiOHQgjr
 nbQEg2HvwilGsgwB+d3i+zt7oz9/lySDlaMoYjCRBOK0Gs44uA5zlfGdRDp9AQyg93U2
 xWvvMhqz7IPUXbfAbUDgxyavckvebVEPLNcsL3eFMoz1eUSSlpoIW1Eu+aNXBXXWPjH3
 eoAjkOcrsgifM/8Tc7WbJ7EH9yGGxDCo8yfAO9cmLsQpJryutUiU8AulWXAtHIfhT3Xk
 sWlAtm/YWgmQlxzPmqTF+imE48rR1f+0zsLInnByXNZTsgSI+aIysdkrx9qCtALwp9TL
 H2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qCXEcpG31wPJYLx+CXiCODOdNShDZ8WkTXBu5ixfjgY=;
 b=OAguH9RNiWn5+Z7X2ryrGcpX09USe+IjJip+KYD0aaXjkIWiN7hrDdKp1X1s2mz2oL
 1uVm5OXGAFF5IAfnp7UkOJSWCzsYV/BEHPs+3s6ynDld/AhmUgA0XncWYhbjtED5B1q4
 bVGWdhQkK8VANdIdKxgvkpD34OKQVape9A+osVaj1/R3vNmhaxgPAm+WTE88RpiO0iNP
 kU6k6r8S27DheDUtgCrY4NFAQch+fkwdXjJwaJESOiHtMKHUzY0pDAthbIZ3MIPIepHz
 5HUor4XepozRHxMZkDdawrV+uBZFxRyOtiLkU7d5jGEk4X7No9xa+qXAwFrz2h6r5abw
 Iw4w==
X-Gm-Message-State: AOAM530KWINl0SdOkwqoVxqT8XVqSrvIDCkIbJISjsAL3Q0yT4AkiNzu
 qf8JFaTcbpn6zOFmndMGL0GfZA==
X-Received: by 2002:a5d:4385:: with SMTP id i5mr4877684wrq.420.1591285129546; 
 Thu, 04 Jun 2020 08:38:49 -0700 (PDT)
Received: from vanye ([2001:470:1f09:12f0:b26e:bfff:fea9:f1b8])
 by smtp.gmail.com with ESMTPSA id a14sm8902248wrv.20.2020.06.04.08.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 08:38:48 -0700 (PDT)
Date: Thu, 4 Jun 2020 16:38:46 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: kvm_target, QEMU_KVM_ARM_TARGET_GENERIC_V8 questions
Message-ID: <20200604153846.GA28566@vanye>
References: <20200604125544.GW28566@vanye>
 <CAFEAcA-ACvx19HZBk-nusMCOkr-D3KReUJRTouL02rLEXOUanQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-ACvx19HZBk-nusMCOkr-D3KReUJRTouL02rLEXOUanQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rAb0N8E7K2Cq

On Thu, Jun 04, 2020 at 14:10:08 +0100, Peter Maydell wrote:
> [added kvm-arm to the cc list; the kernel folks tend to hang out
> there, not on qemu-devel, so KVM related questions are usually
> worth raising there as well.]
> 
> On Thu, 4 Jun 2020 at 13:55, Leif Lindholm <leif@nuviainc.com> wrote:
> > However, while looking at this, I noticed aarch64_a72_initfn doesn't
> > initialise kvm_target at all.
> 
> Yep. The kernel doesn't support "give me a CPU that looks like
> a Cortex-A72".
> 
> > So, then I decided to actually test things, and found that
> > (with -enable-kvm):
> > - on Cortex-A53 hardware
> >   - "max" kvm_target gets initialized to 4 (KVM_ARM_TARGET_CORTEX_A53)
> >     by kvm_arm_get_host_cpu_features (as returned from the kernel for
> >     vm_arm_create_scratch_host_vcpu)
> >   - cortex-A72 fails to start with "KVM is not supported for this guest
> >     CPU type"
> >   (fair enough, it's later than A53)
> 
> Untested, but I assume that -cpu cortex-a53 works on the A53...

Yes.

> > - on Cortex-A72 hardware
> >   - "max" kvm_target gets initialized to 5 (KVM_ARM_TARGET_GENERIC_V8)
> >     by kvm_arm_get_host_cpu_features
> >   - "cortex-A72" fails to start (umm...)
> 
> ...and fails on the A72 host.

From an explicit software test. If I initialize kvm_target to
KVM_ARM_TARGET_GENERIC_V8, I can certainly run EDK2.

> > However ... if I haven't managed to confuse myself somewhere in here
> > (which is completely possible), would it be OK if I submitted a set of
> > patches that:
> > - add a QEMU_KVM_ARM_TARGET_GENERIC_V8 to match the kernel one
> > - set kvm_target for Cortex-A72 to QEMU_KVM_ARM_TARGET_GENERIC_V8
> 
> This would be wrong -- it would mean that you could tell QEMU "give
> me a guest CPU that's a Cortex-A72" and it would not error on
> non-A72 hardware but not actually give a guest CPU that looks
> like a Cortex-A72.
> 
>  * If what you want is "give me something that works" then that's
>    -cpu host or -cpu max.

That's what I thought until I saw the manual A57/A53 setting of
kvm_target.

>  * If what you want is "give me something that's always this kind of
>    CPU regardless of the host hardware" then that's a lot of kernel
>    dev work nobody's been enthusiastic enough to undertake yet
>    (notably the "what do we do about CPU errata workarounds" question
>    would need to be solved...)
> 
>  * If what you want is "allow me to say '-cpu cortex-a72' and have
>    it work on an A72 host and not anywhere else" then I guess we could
>    implement that on the QEMU side by querying the MIDR and checking
>    whether it was what we expected.

I don't really.

> >   - alternatively drop the explicit settings for A57/A53
> 
> These explicit settings are correct, because for these CPUs
> the kernel does have a "give me what I want in particular"
> setting (which it will fail on the wrong h/w), and also as
> back-compat for older kernels that predate the GENERIC_V8
> define and only recognize the explicit "give me an A53" value.

Right. But then I got somewhat confused also by how
https://git.qemu.org/?p=qemu.git;a=blob;f=target/arm/kvm64.c#l494
doesn't explicitly list KVM_ARM_TARGET_CORTEX_A53.

> > - drop the call from aarch64_max_initfn to aarch64_a57_initfn, and
> >   copy the relevant bits into the former for the !kvm case
> 
> Not sure why you care about this -- it's an implementation
> detail of the TCG handling of the 'max' CPU. There's an argument
> for disentangling TCG 'max' so it's not literally implemented
> as "a57 plus newer stuff", granted.

So ... the reason I care is because I'm adding a new cpu in my local
branch, figured cpu64.c was a good starting point, and then followed a
long string of repeating the questions "why?" and "why not?" while
trying to understand why things were set up the way they are.

And I ended up in a state where it looks like we do some things for
A57 that we don't do for A53, and we do even fewer things for A72, but
then we do (end up doing) all of the A57 bits again for max (for TCG
only), and then overwriting them.

Then I tried to build some sort of consistent working model in my head
and send some questions off to the list rather than try to send out
patches straight away as I figured the likelihood was high I had
missed or misunderstood something.

I guess what I'm really asking is if there is some legacy in here
that can be cleaned up to make the expected behaviour for a new CPU
more clear from looking at available code? And if there are specific
legacy things that need to be kept around for compatibility that
should not be implemented by new CPUs, if they could have some nice
warnings attached.

Regards,

Leif
