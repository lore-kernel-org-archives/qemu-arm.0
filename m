Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2409337wrt;
        Fri, 23 Nov 2018 10:51:02 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VXynuUIZekBQX+CHwiZsMDhTzo8imJ0+r6vWiuq+KZqBfQdb5PTRQVn1SWFu+6CaclV1fN
X-Received: by 2002:a63:6b08:: with SMTP id g8mr14995703pgc.119.1542999062144;
        Fri, 23 Nov 2018 10:51:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542999062; cv=none;
        d=google.com; s=arc-20160816;
        b=CNisDlbR4AaFdg/ireL7tCNxtCWxx4Je+o0DJ0SXkfofEaxuKasSxYgHiexlaisZ82
         5Rtl/yqka+XF0YF81Pz2wJrUqQ3/uWhwabCxB8kCvOSSJnviL/4njVYDEjaLztgT4ejt
         U1r6j1zPQokQfWe9DlGmOfgCpJTk1TdItklnernCJSmpEMTCNWISHGVHlHmT/FKYqTvH
         rizEE6kFTNfPAapNkloyOkfENU7HXUR1HqVEP22fmcxZrkdG5towXNcb4PBdPD6+vg0j
         MfdLKHlNZkLh1R/u4S0QGJNQ1aKdyQH8vVW99oJJRDZt8uMf8Er0D0C4oAw4Vxsnt4Ac
         Dyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fVDFIgjBQupfptdYgZ/IG6wKZRc7GmvJB6tgAN53kdI=;
        b=A4OQa37b3f4PERkWMjGxoFdplM4HS5A+bEc6qLq7wqomH9lW6/DIZGCEfPOtCz1Kkz
         AdQ1hke5vfoBxqstO5lnlbL/UIbuunYgUJkpYvmTGvbLU9ulK+W4olTtvGu6dVrh/+5U
         Na8hyOUQb4lZfZ/+74CP4uPhFL5J1eU3+KDPI2SUGaLwkTBcgH+kxgsg0qDr/t4sbNDc
         vvXUQoBvOVxZS7Pv4Ko6LSm847lRSVOa/fmk/6saeHBIug14MkJqgLp9tEsY9BJFWSGa
         Q2OXumb1gPEsaitF9Qp6B6cVwQ+5kF8XZmGHtDBAE+49UxaSPW9XzIbQiOakGKm1psLL
         wc+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPyJdgHa;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id ca19si35583512plb.238.2018.11.23.10.51.01;
        Fri, 23 Nov 2018 10:51:02 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPyJdgHa;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437308AbeKXFg2 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Sat, 24 Nov 2018 00:36:28 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34662 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395361AbeKXFg2 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 24 Nov 2018 00:36:28 -0500
Received: by mail-ot1-f66.google.com with SMTP id t5so11427254otk.1
        for <kvm@vger.kernel.org>; Fri, 23 Nov 2018 10:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fVDFIgjBQupfptdYgZ/IG6wKZRc7GmvJB6tgAN53kdI=;
        b=dPyJdgHaRtXRAtr9PQe3CYjkjKiCjc8veNNlWY5g0TjYrgrLxBFHzx+/MWuBNVDAMF
         xz0bFyziubD3FrnE7coBoMxoyvzPJsqjpfv+28afLn7IRPFSuKKui/3dSAVOqcIjknt0
         gwv5hSynZHsnUun9RW+FweLtA+MDE86p0+L7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fVDFIgjBQupfptdYgZ/IG6wKZRc7GmvJB6tgAN53kdI=;
        b=b8egH6ekj3p9VSGJPAaLgvXrswVKFsiH2PAMrY8OLH6Ncsi23cNDy3yHZp88rY5NZX
         fVnjHY8X0oGA/klRcBYbP3LYzeu9I+gml3HRuHcZlLLA0oRzh37K+bUh79fo6jVlwzXr
         3yLrsyaHay4fo30BQ8sijOsVJKUOlfGEsyxOMZHLCcgI7y0srq9odvDrFUmiuzMNIZbn
         DUB36GNTRC8wLpzOfAlB/GgVO401ejbinawo3u3AUPjfWGE9wubOZPhsVPfqNg4t2L1P
         /xVWeDqr504wWCEdhThspyD7cR4RstrE+lcZT/n1KAHO88yvHMATDjT6P49uLrKadKxu
         EHtA==
X-Gm-Message-State: AA+aEWZxynKJ9Ie69T3n5XFUbWntbi2zxM9n+Nj4b377+05Qt2eoZcB3
        /hcbVnGO17ZSZTSvK/AmJU0Y/Xq7M104GHGUZ23UnQ==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr9591773oth.238.1542999058887;
 Fri, 23 Nov 2018 10:50:58 -0800 (PST)
MIME-Version: 1.0
References: <0184EA26B2509940AA629AE1405DD7F201F85395@DGGEMA503-MBX.china.huawei.com>
In-Reply-To: <0184EA26B2509940AA629AE1405DD7F201F85395@DGGEMA503-MBX.china.huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 23 Nov 2018 18:50:47 +0000
Message-ID: <CAFEAcA_cZb_SG4MHocxB-wWGDPA0mCWUonjbuZF8srE_ZbOGbw@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH RESEND v15 10/10] target-arm: kvm64: handle
 SIGBUS signal from kernel or KVM
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ScIeeB1Qgkgx

On Fri, 23 Nov 2018 at 14:31, gengdongjiu <gengdongjiu@huawei.com> wrote:
>
> Hi Peter,
>   Thanks for the comments and mail.
>
> >
> > On 22 November 2018 at 10:28, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > On 22 November 2018 at 03:05, gengdongjiu <gengdongjiu@huawei.com> wrote:
> > >>> >
> > >>> Shouldn't there be something in here to say "only report this error to the guest if we are actually reporting RAS errors to the guest" ?
> > >>
> > >> Yes, We can say something that such as "report this error to the guest", because this error is indeed triggered by guest, which is guest
> > error.
> > >
> > > I'm afraid I don't really understand what you mean. Could you try
> > > rephrasing it?
> > >
> > > My understanding was:
> > >  * we get this signal if there is a RAS error in the host memory
> > >  * if we are exposing RAS errors to the guest (ie we have
> > >    told it that in the ACPI table we passed it at startup)
> > >    then we should pass on this error to the guest
> > >
> > > but that these are two different conditions.
> > >
> > > If the host hardware detects a RAS error in memory used by the guest
> > > but the guest is not being told about RAS errors, then we cannot
> > > report the error: we have no mechanism to do so, and the guest is not
> > > expecting it.
> >
> > If you look at the x86 version of this function you can see that it tests (env->mcg_cap & MCG_SER_P), which I think is the equivalent x86 "is
> > the guest CPU/config one we can report these errors to" test.
>
> MCG_SER_P (software error recovery support present) flag indicates (when set) that the processor supports software error recovery.
> env->mcg_cap 's value should be got from KVM as shown in the QEMU code[1], it indicates whether the KVM support software error recovery.
>
> [1]:
> -------------------------------------------------------------------------------------------------------------
>   ret = kvm_get_mce_cap_supported(cs->kvm_state, &mcg_cap, &banks);
>   if (ret < 0) {
>        fprintf(stderr, "kvm_get_mce_cap_supported: %s", strerror(-ret));
>            return ret;
>    }
> -------------------------------------------------------------------------------------------------------------

Yes, but if you look at the code which calls that, it
goes on to do:
        env->mcg_cap &= mcg_cap | MCG_CAP_BANKS_MASK;

which means that if the host kernel does not support this
feature then we will clear those bits in the env->mcg_cap
field, so we do not advertise it to the guest. But we might
be not advertising it to the guest at all, if env->mcg_cap
was 0 before this code was called. That happens if we
are presenting the guest with a guest CPU type which does
not have the feature.

--------------------------------------------------------------------------------------------------------------
> void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
> {
>         ...........................
>
>         if (ram_addr != RAM_ADDR_INVALID &&
>             kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
>
>   If it got to here, it means the host hardware detects a RAS error in memory used by the guest using above two judgments.
>   Maybe we can test/check whether KVM supports software error recovery in [3]
>

The question is not "does the host CPU / KVM support error
reporting". It is "does the *guest* CPU / system support
error reporting". These are distinct questions which may
not have the same answer.


thanks
-- PMM
