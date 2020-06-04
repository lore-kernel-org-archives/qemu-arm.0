Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1704473lfc;
        Thu, 4 Jun 2020 11:43:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwktL0QY9yOkXze0zvj3pXsN/aQ7OvW4qfk/BdAp8gYmZHEsjZDV9anNKf0xTh4CPpPtjNY
X-Received: by 2002:a25:a165:: with SMTP id z92mr10113905ybh.48.1591296208069;
        Thu, 04 Jun 2020 11:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591296208; cv=none;
        d=google.com; s=arc-20160816;
        b=eqiBrRXBEbGsy0VvZWTlgx8N6BzhwYG28oBuNkV8QC0GdVpG8ergaAukCooknHymic
         wIMMZmCWjK/AC14yBv/N8AmxKo6Man/cuYqja6pO9YgfwybckJgqTbpa9xcVSxlsq+v8
         sP4HtcIg/+uriqt8oZaExIyptzhGRTwUqBSALYRAX5Ky0T4lgWE+A9aF6sf0sy6xsVwH
         TMFPaTTyXWqEJ0XaKKvYKomnml2fn2J8f6oS8v1pKmi6MvP3lodwiKk4eFLgZiisq9ES
         MUERnIkgCSv1Mld+MkqnKKgowWz13KkOmLdU/NFQEk/P5ORHdZapiqLH5JbiXsOWbUG3
         aAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V+tqJ4we1CwKNF7vfPzsSSNsnmnzFHhUB3cgyBqkxgk=;
        b=ry1xZypkiPo84Kn68ORYKAOJ1U+yZfAo4useJrScoppxXGmi7UF70rRkr+zMbcUivB
         zkpwihQk72WIb33MvtNiEDciJ+F2Zkm3NMwSL+08CflDLwjCQPA0H8D1Ablj0hJDwg23
         /1EoFbc+tAUamjPtXRySvz1ckGsVIkCIC3egkgWgzipFVOwLzbGzhGH14ZsZbg0njqe6
         WbgKkOaeJ+LMJ0iIBn6mWylckPxhNq3zDbEtvzwYIFILQvzSH+Yw/aqUeEW4IqQzCglD
         NssFo+vlC3oIlbzr3gJzYbhyxBdKiSZH5A02CdcuwBR7H2r5Livzr3AgvVHsnc8cA/RG
         qZhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JqgYANN6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si5156977ybg.174.2020.06.04.11.43.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 11:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JqgYANN6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgupr-0006vU-FC
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 14:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jgupk-0006uz-R8
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 14:43:20 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jgupj-0001p5-Of
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 14:43:20 -0400
Received: by mail-ot1-x344.google.com with SMTP id o13so5583575otl.5
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+tqJ4we1CwKNF7vfPzsSSNsnmnzFHhUB3cgyBqkxgk=;
 b=JqgYANN6wCRpfWlLBsko7YwgwNfwEaWNit+i2c5alu3KgyDbJVujVZkxQFwQkH46Wf
 7OVXpwcwfGe/EcYpm0heZcAtrB636jHZz3jtv5xdDxNtG8xoVrDASEVXZrWkRMgSo9lN
 YMJIoJUT+PA0WAKUR723LbTufO6g7MUD6Ea5tvU5vli1KhV5ddWMe518xwMxwsrnz8Mk
 fE3NjREHwI0OJjuY0tE7L573hdV3H94jcczLbleQlC/I6+hlHyv5vwycstK4ZWTGPqcX
 ar3SsGoapFv2eqcfhNECk+JtIp+PZtrG+7DA2aFTbeZjcXWQ5VOjwtcEtAsEsz9F1hje
 4y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+tqJ4we1CwKNF7vfPzsSSNsnmnzFHhUB3cgyBqkxgk=;
 b=E8Ukh8L/T/zuhdk5DXEtTxNF9DdPmscKELfnDHMGXTzwV/eeKBjuOUxjUzKWT0rwVp
 KL2hYCO11CmXbWt6jiVllW+3Aq4mqw8cwFH4ZwtACdqAdsEJrkEPAo3ZbYoma6dxr3uv
 gJBu3HrR1FoXVXGOPMb/+xiWigvtFLlU0CEWkgInoMEkI8kvt23Br+m+X9i1Qnb7+S5K
 15IwnrJDg0Djkyg3/KcHtfEWyE84wcexUQ9kvY6x2wn2NSvOT4JvKagDKVQPbv1wGpR9
 sWxmr5TH9aNqpKnfL9jnsAtmnnEHYxH8+xHnDOWWSWgSlWG1WkPT2TmVpeqAk0vq1VQP
 hlkg==
X-Gm-Message-State: AOAM532yvhc9KkNQEGYAlpwll4bjuduwj/xeURHnne1K4LcBPoX+uDgs
 Pgwhz56rHZ2eMPY1S9sg8AGoR7Mzvzn7qv4IbtUhtQ==
X-Received: by 2002:a9d:b82:: with SMTP id 2mr4528725oth.221.1591296197806;
 Thu, 04 Jun 2020 11:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200604125544.GW28566@vanye>
 <20200604131802.7w4hncgq2gopbw6z@kamzik.brq.redhat.com>
 <20200604160300.GB28566@vanye>
 <CAFEAcA8MTB5VQQbMuSfkGc9JcGeawL_GUY8Pcs3yxT9kdncZJw@mail.gmail.com>
 <20200604162607.GC28566@vanye>
In-Reply-To: <20200604162607.GC28566@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jun 2020 19:43:06 +0100
Message-ID: <CAFEAcA-wX-vKek_Zt5hmjiQNP1utCO7yGJQPcuny1M7xncYsQg@mail.gmail.com>
Subject: Re: kvm_target, QEMU_KVM_ARM_TARGET_GENERIC_V8 questions
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wps8lvT+CXm0

On Thu, 4 Jun 2020 at 17:26, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Thu, Jun 04, 2020 at 17:09:30 +0100, Peter Maydell wrote:
> > On Thu, 4 Jun 2020 at 17:03, Leif Lindholm <leif@nuviainc.com> wrote:
> > > But there's also things like:
> > > - a57_initfn explicitly setting kvm_target, then only being called
> > >   from max_initfn for !kvm_enabled()
> >
> > Expected -- a KVM 'max' is nothing to do with a TCG 'max':
> >  * for KVM, -cpu max means "same as -cpu host"
> >  * for TCG, -cpu max means "start with an A57, then add in all the
> >    extra architectural features that have been added since then".
>
> Sure. But why are we setting the kvm_target at all for the
> !kvm_enabled() case?

Because it happens to be set in the a57 initfn, and it's harmless
if we're not using TCG. I feel like some of your take on this set of
functions comes from thinking of max_initfn as in some sense the
'primary' function here, when it's the other way around : a57_initfn
is the standard kind of CPU initfn (behaving in and written the same
way as a53_initfn and a72_initfn), whereas max_initfn is an odd
special case which happens for convenience-of-implementation
to piggyback on the a57 implementation.

> > kvm_target being set by a57_initfn is specifically for the case
> > where a KVM user is using "-cpu cortex-a57".
> >
> > > - a57_initfn setting cpu->dtb_compatible to "arm,cortex-a57"
> >
> > What else would it set it to?
>
> Hmm, I had been hoping there was a generic v8a one - kvm64.c kind of
> got my hopes up with "arm,arm-v8".

Ah, that's the other way around -- yes, for 'max' we should be using a
more generic value, not accidentally using 'cortex-a57'. (Linux doesn't
in practice care IIRC, which is why this bug hasn't been noticed.) But
for an actual cortex-a57 model we should report as arm,cortex-a57.

https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml
is the official list of permitted strings, incidentally.

> > > - a57 initfn setting cpu->midr, max_initfn overwriting parts of it
> >
> > Also expected, TCG's -cpu max is "A57 with lots of extras".
>
> Maybe I'm being too rigid in my thinking here, but it does kind of jar
> to see code call a function called aarch64_a57_initfn to have it write
> a value where it then throws away the only thing in the value that
> made it a57.

The things that make it an A57 are all the feature flag and ID
register values (which is is what tells the TCG implementation
how the CPU should behave). The MIDR value is the least interesting
bit of the a57_initfn in some ways: it doesn't change the QEMU
emulation's behaviour and mostly guests don't care what the value
is except for purposes of installing errata workarounds that don't
matter for QEMU: your average guest would work just as well with
any MIDR...

> Not entirely unrelated question:
> Would you take added field definitions in target/arm/cpu.h for
> features not yet emulated in QEMU but defined in released versions of
> ARM ARM?

Yes in theory (you'll see that we have a bunch of field definitions already
which we don't yet implement, because we tend to define all the fields
for an ID register at the point where we want to access one field), but
on the other hand there's usually no need to actually use them unless
we're adding the emulation for the feature, so the question is: what would
you do with them if you added them?

thanks
-- PMM
