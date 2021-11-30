Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4878544lfk;
        Tue, 30 Nov 2021 06:34:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwhueoar9M+H63fg4TOL6qLWCbVswVGqS+wYqSvGW49xonDiZZaHXENIUAtvzhO/d1tiIB
X-Received: by 2002:a05:6402:270d:: with SMTP id y13mr83491868edd.362.1638282878039;
        Tue, 30 Nov 2021 06:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638282878; cv=none;
        d=google.com; s=arc-20160816;
        b=asYrERIPozIiLjZNfQBezGGiDo153mfyXoVIKxDWbt3bDP3j4WK8WaGMJyVJ9fCDXr
         44KFfDMmCfKkaJRWodY7bxA6/XG1/EN3B4jZYWs7HsMfuuKm/92dQcWGAJ9l3HK/hQjM
         ahRoBtc9P4HFBvyTt8xr8KtFuBU6f9aZlOUDEgYt0ZnsjjMCd+kw+l+JxD7R+H8v9XKd
         NZkdx6lEB/FNuh8PiUuXk2nl/odpGAjyJ83VJf7rCM0x7t1Y+MROujBXh6pxO+N3RDI+
         8Mbd73KkOjkC5JC7uXpBWbcFHsHZ+RNRSXTmbhCGB8QH5VAaNoPdfTVfnBYmYwxqIlH8
         loow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=lUXILyRo006H5l+ZcdqOJwD3xK1tyZFHAK4YXmJdU1Y=;
        b=SgxOxjL/qWv5ZpB0hruxf7+ab0EPYQDrmD3gqmZfGQTMcHpLNw8cx4zZdyzwErWRlO
         QbX/7EMcTEMJFMOtEs5Iz8S2FF/BEG2kZcCBx4EMZLZK26M1bTvyHUIqOtxJ3bEQ84TP
         pX21PWjjaQJOegQhhQvaRFLw9mie8GBlmkkdcb7e34fVxzgbpuXrbrKqRmG6yYurpdho
         sN40rra6mfgrKm8GyPiihbkq7THhQVi98lts82kAY9KFL+sQMXz6kZhK/LaHY9R6BP6c
         G7kq+JvZNtTYW32eY+yFt+jcb//lITHNv/bNIPei6LU3AYqTGzs4WixtnP81bLsLTd1E
         p68g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="C5NjV/dR";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id i7si23094346ejr.784.2021.11.30.06.34.37;
        Tue, 30 Nov 2021 06:34:38 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="C5NjV/dR";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235367AbhK3Oh4 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 30 Nov 2021 09:37:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54326 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233709AbhK3Ohz (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 30 Nov 2021 09:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638282876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lUXILyRo006H5l+ZcdqOJwD3xK1tyZFHAK4YXmJdU1Y=;
        b=C5NjV/dRx+aqM8fogtZVXcB61/84IU5q03+vr7swL6X2q5URc7EjWd8yAH/u7o36ijuzU/
        rqLxu58LPH3xbYLQmS1i38HU3TIao3kbUOepXyt8PAEAFlJZ3dHFzZ9RwpE3uymxsTW7CO
        pk18cUsbH0muKHRTXLrgSTjym3K+rmM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-wDfC9DV0OEivQGnSlli5qg-1; Tue, 30 Nov 2021 09:34:34 -0500
X-MC-Unique: wDfC9DV0OEivQGnSlli5qg-1
Received: by mail-ed1-f69.google.com with SMTP id d13-20020a056402516d00b003e7e67a8f93so17167657ede.0
        for <kvm@vger.kernel.org>; Tue, 30 Nov 2021 06:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lUXILyRo006H5l+ZcdqOJwD3xK1tyZFHAK4YXmJdU1Y=;
        b=fd7NJqht2+M/8VzSTzLpJkmp+yYGIlrWA+UbZjPQecerg0zgkJnzU6sb4Z6Eu05svD
         29/+HCOk8mAv/VW3I6C8iJoZCIRQk5wwOn7WhBR0vaXmMDvGGMOgMUl8U4/17EBvLNYh
         aDMXpHqxiVbX/A1cZOiqup3QS2NYRzbfjkLMFkMtD7J0y4CcBzyUVXtijYvroVK+b39i
         crPyh9X5rJBalZlwW7MZZTfpRT6/96fc0y2W4IwpBIq3go8NGpDEEGBIlRZZI5tho2+K
         f+lNmgrS9RMIIeEZDoUZSaXM5IJ6msEGgvAEQIKDCX3pBaMv6edl9uFOHtzF85SvWiRS
         XbJA==
X-Gm-Message-State: AOAM530NiTetFF9aurt0Qz+nMzWP4Sj+joP2aPA2s3wWA1q1Teg6A85Y
        GWuDXEOpqpDq7OgatHbsDNu7330OQW3zSG2IflvRQncPhF8QSzYoBUr5qZUR8LbxySGg8f56OpG
        adHahh2ikVRGM
X-Received: by 2002:a17:907:7d86:: with SMTP id oz6mr67730911ejc.312.1638282873401;
        Tue, 30 Nov 2021 06:34:33 -0800 (PST)
X-Received: by 2002:a17:907:7d86:: with SMTP id oz6mr67730877ejc.312.1638282873127;
        Tue, 30 Nov 2021 06:34:33 -0800 (PST)
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id g11sm12219088edz.53.2021.11.30.06.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 06:34:32 -0800 (PST)
Date:   Tue, 30 Nov 2021 15:34:25 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc:     kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
        qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
Subject: Re: [kvm-unit-tests PATCH v3 0/3] GIC ITS tests
Message-ID: <20211130143425.bh27yy47vpihllvs@gator.home>
References: <20211112114734.3058678-1-alex.bennee@linaro.org>
 <20211112132312.qrgmby55mlenj72p@gator.home>
 <87wnldfoul.fsf@linaro.org>
 <20211112145442.5ktlpwyolwdsxlnx@gator.home>
 <877dd4umy6.fsf@linaro.org>
 <20211119183059.jwrhb77jfjbv5rbz@gator.home>
 <87a6hlzq8t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a6hlzq8t.fsf@linaro.org>
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: OgcJ2hzhJR+3

On Tue, Nov 30, 2021 at 02:11:34PM +0000, Alex Bennée wrote:
> 
> Andrew Jones <drjones@redhat.com> writes:
> 
> > On Fri, Nov 19, 2021 at 04:30:47PM +0000, Alex Bennée wrote:
> >> 
> >> Andrew Jones <drjones@redhat.com> writes:
> >> 
> >> > On Fri, Nov 12, 2021 at 02:08:01PM +0000, Alex Bennée wrote:
> >> >> 
> >> >> Andrew Jones <drjones@redhat.com> writes:
> >> >> 
> >> >> > On Fri, Nov 12, 2021 at 11:47:31AM +0000, Alex Bennée wrote:
> >> >> >> Hi,
> >> >> >> 
> >> >> >> Sorry this has been sitting in my tree so long. The changes are fairly
> >> >> >> minor from v2. I no longer split the tests up into TCG and KVM
> >> >> >> versions and instead just ensure that ERRATA_FORCE is always set when
> >> >> >> run under TCG.
> >> >> >> 
> >> >> >> Alex Bennée (3):
> >> >> >>   arm64: remove invalid check from its-trigger test
> >> >> >>   arm64: enable its-migration tests for TCG
> >> >> >>   arch-run: do not process ERRATA when running under TCG
> >> >> >> 
> >> >> >>  scripts/arch-run.bash |  4 +++-
> >> >> >>  arm/gic.c             | 16 ++++++----------
> >> >> >>  arm/unittests.cfg     |  3 ---
> >> >> >>  3 files changed, 9 insertions(+), 14 deletions(-)
> >> >> >> 
> >> >> >> -- 
> >> >> >> 2.30.2
> >> >> >> 
> >> >> >> _______________________________________________
> >> >> >> kvmarm mailing list
> >> >> >> kvmarm@lists.cs.columbia.edu
> >> >> >> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
> >> >> >
> >> >> > Hi Alex,
> >> >> >
> >> >> > Thanks for this. I've applied to arm/queue, but I see that
> >> >> >
> >> >> > FAIL: gicv3: its-trigger: inv/invall: dev2/eventid=20 pending LPI is received
> >> >> >
> >> >> > consistently fails for me. Is that expected? Does it work for you?
> >> >> 
> >> >> doh - looks like I cocked up the merge conflict...
> >> >> 
> >> >> Did it fail for TCG or for KVM (or both)?
> >> >
> >> > Just TCG, which was why I was wondering if it was expected. I've never run
> >> > these tests with TCG before.
> >> 
> >> Hmm I think expecting the IRQ at all is broken so I think I should
> >> delete the whole pending test.
> >
> > Feel free to repost. I'll update the patches in arm/queue before my next
> > MR.
> 
> Actually I think the problem was with a regression in the TCG ITS
> support (now fixed in master). So I believe as of v3 everything is
> correct (and v4 should be ignored).
> 
> Are you happy to apply this series or do you want me to repost it as v5?

No need to repost. I'll retest v3 with latest QEMU.

Thanks,
drew
