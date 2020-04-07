Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp5091032lfi;
        Tue, 7 Apr 2020 04:24:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypIsHhCXim4FFIc1FQo5F/DUSYzDUgKXeMGT2PZD2fot8dCrVLWXBGVDg5LSnQKfFmSEbu04
X-Received: by 2002:ac8:5048:: with SMTP id h8mr1695417qtm.189.1586258692709;
        Tue, 07 Apr 2020 04:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586258692; cv=none;
        d=google.com; s=arc-20160816;
        b=s8Xd6kU2RZPQc3nJLXdvG+9R7Bco7Hv+jw8IAxuJykJaDTTbzaa5PGW5diGAH+dvM7
         EjWfa6G5/Ct/nHWKXG783mX+ulsmsmgkq7h55Z9SXxUVRqPclppBP61K7EjpiP0qVME9
         Qn5SxDs80ODRn52r04QxGHv+85J0z+sL4N5hAWT82VScmHwJJEJ8ixBBRA4hvYlyCaaf
         MGBWZMdBiOCKNVcmxdA9BxdHIAV5puQ5Sy7JR/cTXFjMEmxgrvLAt2/tguaiTmFkzZ4x
         9fz3wOwY46H4ppu+akce+0EqCeQDpfraYvL43wf5yLLFvAmm6uyOnmog6hmBZq7fY0wG
         fs3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LXvwgutg6QqPQ6IkR6//I/yPvDj6d1Qbzcm+hvKs3wE=;
        b=sn6LnprUCeeo2MeZrV+fqGfZ0K9uXyxWXMxjfWQXnFLGmZgCtc8PdbP4sxlZKfr8Fu
         v6bCR2egTLE5EaQ00h6E7HtWt06xdWBvqvKC7FjOnqjaRnEfARG63iUCVJX8+P8cbCQM
         UO/03x9BemaZxCCmnlEnGsPt9j8V5XIkmRYk+CScoQhiRbVddtD/WgXPsEP4R1lBWnG1
         fI9YIabUS4wLczNUvVwlQEx//DTaZkX3MCYObkoDj9uEOzpWjqWbesRbZYuZygWgHnj0
         vY9UfE05feTlm13aWtL3d3YgbL/1bnleZg2PxHGoourAX9Unhds+ONS0o0BJqPrWvLXJ
         pvBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=EbXmjYLX;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id z13si1551811qkz.311.2020.04.07.04.24.52;
        Tue, 07 Apr 2020 04:24:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=EbXmjYLX;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 601954B16F;
	Tue,  7 Apr 2020 07:24:52 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bI69vLejNwgC; Tue,  7 Apr 2020 07:24:51 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 52A444B13F;
	Tue,  7 Apr 2020 07:24:51 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 4A8C84B11B
 for <kvmarm@lists.cs.columbia.edu>; Tue,  7 Apr 2020 07:24:50 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llfXEUD54yQC for <kvmarm@lists.cs.columbia.edu>;
 Tue,  7 Apr 2020 07:24:49 -0400 (EDT)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 4FC534B0BB
 for <kvmarm@lists.cs.columbia.edu>; Tue,  7 Apr 2020 07:24:49 -0400 (EDT)
Received: by mail-ot1-f65.google.com with SMTP id x11so2693916otp.6
 for <kvmarm@lists.cs.columbia.edu>; Tue, 07 Apr 2020 04:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vnASXYJpk92WfwXwrbznymfvmBuY/sr1MK3eKQbxoXM=;
 b=EbXmjYLXGFUiUbEFtAJaqtqhT8nbqdKnXm7EOymQju+AN8pQQ7Ef53P0WOOAz16/PG
 Dwd+qvFdFskuTztzBDkxAQ8oIOAUb5IOCREHuwCc6T1J6BjZ3E83XY0BC0gbQA7anguE
 7equgXH3Dlk69uqnIdhQCFtIory02zJbM6DSdr6koV4uIad58tXvm86vsgIhf4svgyaA
 ct+y1lHmlF399tLELCzzLxND8iNu7DFOfzbTskxZSIXqWJqXMRTa9gSt+hJrbMpNbFCX
 8E7wC/KDBPfnUiuIg3eBSQ1K7PfcTt+X8u5cOccwt+9o5HveC1KRIzcSuC4dwrz32k8j
 gnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vnASXYJpk92WfwXwrbznymfvmBuY/sr1MK3eKQbxoXM=;
 b=QoTk8INv25h5TR66OWF4UZDclMopVDFynKjwT5EDWtrMp6bPlNDWPoh18T2nMpoQjZ
 2YBjoBx6zDf+R26koVX09tKmLwp8UTYEjuMDlBKsxntCPZ+zs1KkFquo5NH6V21aCJlD
 4IJiT49RibXRatrYtC6nJ/JUgr2PAjv5tANWhorXNYO23j/2BB4UURjj6YEJqeMV0ob0
 1VZq3KATHRuu482yb25NsBHNaVujR7IGbZBhPoqsmxGr3Rn4Yg1sIRQ0ZhngkfMAP/Uv
 ut26MbBTQjXSFzi/5LeUTx+Y2yGMltyW7ka9PFPcv2wU6iS+HIBrwbaDyQf6C9PaOkeA
 Gg4g==
X-Gm-Message-State: AGi0PuZauJFJGrYK4R+e8t0JVdcOq3KggIZFpgxOsntnBldV10flRaHO
 IDGg/Zq1FyquPh+ZcMg4LA3Rrshe4Xb4Y9GvJ44IQg==
X-Received: by 2002:a4a:2a09:: with SMTP id k9mr1439312oof.64.1586258688530;
 Tue, 07 Apr 2020 04:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200323113227.3169-1-beata.michalska@linaro.org>
 <20200323113227.3169-3-beata.michalska@linaro.org>
 <20200403084435.zvfewiivn7orsnll@kamzik.brq.redhat.com>
In-Reply-To: <20200403084435.zvfewiivn7orsnll@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Apr 2020 12:24:37 +0100
Message-ID: <CAFEAcA8fMzWhvt0R9MhXuLYb4Wo+Yz484HNC9YAE59yxz5xD0w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/arm: kvm: Handle potential issue with dabt
 injection
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: dizpRWAVxdfF

On Fri, 3 Apr 2020 at 09:44, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Mar 23, 2020 at 11:32:27AM +0000, Beata Michalska wrote:
> > Injecting external data abort through KVM might trigger
> > an issue on kernels that do not get updated to include the KVM fix.
> > For those and aarch32 guests, the injected abort gets misconfigured
> > to be an implementation defined exception. This leads to the guest
> > repeatedly re-running the faulting instruction.
> >
> > Add support for handling that case.
> > [
> >   Fixed-by: 018f22f95e8a
> >       ('KVM: arm: Fix DFSR setting for non-LPAE aarch32 guests')
> >   Fixed-by: 21aecdbd7f3a
> >       ('KVM: arm: Make inject_abt32() inject an external abort instead')
> > ]
> >

> I'll leave the decision to take this KVM bug workaround patch at all to Peter,
> and I didn't actually review whether or not kvm_arm_verify_ext_dabt_pending
> is doing what it claims it's doing, so I'm reluctant to give an r-b on
> this patch. But, as far as the code goes, besides the comments above, it
> looks fine to me.

I think that having the workaround for the broken kernels is
reasonable (in fact it might have been my suggestion).

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
