Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp830533lfp;
        Mon, 11 Jul 2022 06:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vX8bGSiFIxM/1DE8gdVpIRab0xuleyoRw8G3ou7+Q1uXdNbGdBjKBYYRRjAThUXtqJ6yYF
X-Received: by 2002:a05:6402:3886:b0:435:643a:b7ae with SMTP id fd6-20020a056402388600b00435643ab7aemr24344170edb.4.1657545860434;
        Mon, 11 Jul 2022 06:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657545860; cv=none;
        d=google.com; s=arc-20160816;
        b=Uqqj3U9xZuH8cZOwo6E78ziARZzofI/LgAuuMg1fNuR6f/nw8iJM19LDibpcyNWpJ5
         eolErGe3iR34S0MLkBvltPeXI6ZRb0S9TQsug3s3fIG14LCshplzB3ncxxGdu9HBG5Mc
         XofLAia6qWu+D4/k/FalrB9DpyXp4oUZXujI9QfxujT4nXTKoby2Ji7hAs3iPxeGTDrN
         pO9fknJDiCGZUMnXZH0/htMFt1YzdUQJHdnUwS0p5lv5b4E9dYz6xeWTdBAq0C8sgibU
         nSEdc3lV5FeTZ5bFCut20FOFgT3Wh64B05Uh2jY/oI9S9wsNqpDoRwm4bRy0u5aXUzFV
         DUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=lhVxvNjbjnB/fa4puPuW6uBZESUv0tQdSdTkI3nrexU=;
        b=JTxDGAimucYop04pFTGBOkCQwkPbpynL9hUUcEma9WGzNxdL/B/UAV0ozsFDJCdA3P
         kkmDXQuCFbB7gw4H6HEO1/UTxst7kyQS3ssi2qJU8HEbR3/FfZvcHw5WKw9ZfQOfGobA
         KLoc3IHnNL0EtQiLIJXotuBpgnxHknCLj5oqqOVMJPO3KeEcxE6lCBlb5h1J0PErmOLv
         uFXrvRC5gHBo7ZfpFjCgzcygIfVq4PObS9jeaU4DseWGQRY7g/Pn2A/KMmQ92CzXqIIw
         RWhcqp598fOqwVFGE2oiIHxFPqs0F13omg5BBB59ziPiR5fJcZ8fYhFmouxuFY9N6OzE
         KOug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jM06rFem;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id r17-20020a05640251d100b0043aa374346bsi67398edd.626.2022.07.11.06.24.20;
        Mon, 11 Jul 2022 06:24:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jM06rFem;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbiGKNYS (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Mon, 11 Jul 2022 09:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiGKNYO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 11 Jul 2022 09:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F2103F314
        for <kvm@vger.kernel.org>; Mon, 11 Jul 2022 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657545850;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lhVxvNjbjnB/fa4puPuW6uBZESUv0tQdSdTkI3nrexU=;
        b=jM06rFemicRV4SJaAxxa5Vr1I+evuElUArZkBOkIXtpfQiXxD6qWykQcH3JbOZwNkob8+4
        EprJYuGgzYnfueC/ysWs+DvWP3Tx5yqeb8eiEj7rvNhKqY1lo6acpALIFtIYKSgp7RXWue
        KgDpCCJ9hCo1NPEbWMZO2bzA/JdJ0r0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-N0b5t27PMkWkCLmq2RJJPA-1; Mon, 11 Jul 2022 09:24:09 -0400
X-MC-Unique: N0b5t27PMkWkCLmq2RJJPA-1
Received: by mail-wm1-f71.google.com with SMTP id t4-20020a1c7704000000b003a2cfaeca37so2626402wmi.5
        for <kvm@vger.kernel.org>; Mon, 11 Jul 2022 06:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lhVxvNjbjnB/fa4puPuW6uBZESUv0tQdSdTkI3nrexU=;
        b=AQx3LGCKOlWobYJ4p2Cqw3GAIZrPXQcfXA38rGnSOzpJi69NpvlC7715+vLT97DDiB
         TLiUdVZV9f1wrXEA7puUaud2YmAryOk8YYM5yaAwd1hGmOJvgVxYLEjgq376eZzcwZhB
         E6e7CpVOFUKl8txM4HgM7zzIIYli0LmH32erwSnZww8R6akmPykk20u4zZ9CRIB7b3ro
         3WZfYFF4IecUII+eRFFJJvO5Ge8AnPSOWfQViKkPbmZIz2z5ayyjASV5PQszGUYWUroW
         XM662MEYgbLag4xpPIahssknADasVWgdkSz7w52GS3YgjUwvWzeLZ4QkPoCEQGhXAJAP
         B2UA==
X-Gm-Message-State: AJIora/+QVr/yqimeEu/jK/K3o3Ff52+JLt0R/rXItPL4P+gVuUHPgnn
        /VVXgG4iEiKYSZ+ML3QasZosbhrA/DfummVqIMjWV32GVCFar0Ry5PbjTCUSmd/oDsDi/+W9+ED
        T0a0vuEm++yNQ
X-Received: by 2002:a05:600c:219a:b0:3a2:e4b0:4cfb with SMTP id e26-20020a05600c219a00b003a2e4b04cfbmr9502631wme.2.1657545848346;
        Mon, 11 Jul 2022 06:24:08 -0700 (PDT)
X-Received: by 2002:a05:600c:219a:b0:3a2:e4b0:4cfb with SMTP id e26-20020a05600c219a00b003a2e4b04cfbmr9502609wme.2.1657545848155;
        Mon, 11 Jul 2022 06:24:08 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id ay26-20020a05600c1e1a00b003a2e89d1fb5sm2235622wmb.42.2022.07.11.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 06:24:07 -0700 (PDT)
Date:   Mon, 11 Jul 2022 14:24:05 +0100
From:   "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Eric Auger <eauger@redhat.com>,
        Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
Message-ID: <YswkdVeESqf5sknQ@work-vm>
References: <20220707161656.41664-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707161656.41664-1-cohuck@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: czHhtT00lEZe

* Cornelia Huck (cohuck@redhat.com) wrote:
> This series makes it possible to enable MTE for kvm guests, if the kernel
> supports it. Again, tested on the simulator via patiently waiting for the
> arm64/mte kselftests to finish successfully.
> 
> For tcg, turning on mte on the machine level (to get tag memory) stays a
> requirement. If the new mte cpu feature is not explicitly specified, a tcg
> vm will get mte depending on the presence of tag memory (just as today).
> 
> For kvm, mte stays off by default; this is because migration is not yet
> supported (postcopy will need an extension of the kernel interface, possibly
> an extension of the userfaultfd interface), and turning on mte will add a
> migration blocker.

My assumption was that a normal migration would need something as well
to retrieve and place the MTE flags; albeit not atomically.

> My biggest question going forward is actually concerning migration; I gather
> that we should not bother adding something unless postcopy is working as well?

I don't think that restriction is fair on you; just make sure
postcopy_ram_supported_by_host gains an arch call and fails cleanly;
that way if anyone tries to enable postcopy they'll find out with a
clean fail.

> If I'm not misunderstanding things, we need a way to fault in a page together
> with the tag; doing that in one go is probably the only way that we can be
> sure that this is race-free on the QEMU side. Comments welcome :)

I think it will.
But, ignoring postcopy for a minute, with KVM how do different types of
backing memory work - e.g. if I back a region of guest memory with
/dev/shm/something or a hugepage equivalent, where does the MTE memory
come from, and how do you set it?

Dave

> Changes v1->v2: [Thanks to Eric for the feedback!]
> - add documentation
> - switch the mte prop to OnOffAuto; this improves the interaction with the
>   existing mte machine prop
> - leave mte off for kvm by default
> - improve tests; the poking in QDicts feels a bit ugly, but seems to work
> 
> Cornelia Huck (2):
>   arm/kvm: add support for MTE
>   qtests/arm: add some mte tests
> 
>  docs/system/arm/cpu-features.rst |  21 +++++
>  target/arm/cpu.c                 |  18 ++---
>  target/arm/cpu.h                 |   1 +
>  target/arm/cpu64.c               | 132 +++++++++++++++++++++++++++++++
>  target/arm/internals.h           |   1 +
>  target/arm/kvm64.c               |   5 ++
>  target/arm/kvm_arm.h             |  12 +++
>  target/arm/monitor.c             |   1 +
>  tests/qtest/arm-cpu-features.c   |  77 ++++++++++++++++++
>  9 files changed, 256 insertions(+), 12 deletions(-)
> 
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
