Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp909647lfp;
        Mon, 11 Jul 2022 08:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVpWm+gTjMbDNgoLsRPmGQ/qJYQEaOM8/zrrO27l2qLOlFO6SRx0kIZ97pB8gK0wX+9bJI
X-Received: by 2002:a17:906:8a61:b0:72a:ac73:e985 with SMTP id hy1-20020a1709068a6100b0072aac73e985mr18650799ejc.602.1657553419150;
        Mon, 11 Jul 2022 08:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657553419; cv=none;
        d=google.com; s=arc-20160816;
        b=DXdhlnGKKBvjF3JvfzHBucnhiyanp1C1W1rbUHmvNNm3+v8Fx2CqnRBBzHbYjyujsT
         C1HhM+c3vwkv57HQXARwyEOvIWzQOoMawB2mlIDojTING9e8SyksRt99TC1kaImSfmNz
         XvWiZWxVZHNoJcRnG3extlZYoBYnCk+6OWA0Rjy8fSu/AexEIiEvZvtltzq8nC64oH4k
         T9EkYMBgPtnIawe+xbrYGpP3/XxVBzk3xn8yfoljnIqZeZJGVeiGpMOLe6HXG8NpxZfu
         O2ywNMhR7OqvNJW93JTbXGtAVfoDyaZcq8K6jQAUIx8JxE5Ev2a4j+upCbBxhnjh904z
         WqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=w76bk0fg9jbKWFKSFIfS3MdCk1xiwLgmLQhkkHGDGFo=;
        b=bo6Xf7f+/pEiKIB2G4WSm73zPfKAvReksyBFt1JR1O6UwKo5CVjN+LSZkVnMaMk+ha
         7iNF1ljddeFMkEXpm1SKU7MGrZigKQ3DXFWft01I7ZzoL5BW8iiPVe3OCtILAyqbSHep
         whwYADdluPEtMKHC/lL4S6283z7Or07l2qMYwnyDuhYhhyIN1xWPFPqxNjB/iXffpFR6
         x8vUD1zIjbvQuQMoGxSRWrNwt/cPi/YGUwe//dpQS6lx3omTWm1XhkaD8oP0Ox9SGS8s
         eNsSd5/TcNG3iA8xATV1NEALjWkZRcgB/u+D7srOCIWuoXNQK9OQs5pg4C0+HPL1s35M
         upcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EZ2mCZoa;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id hr30-20020a1709073f9e00b0072b6504d411si2386412ejc.852.2022.07.11.08.30.18;
        Mon, 11 Jul 2022 08:30:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EZ2mCZoa;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiGKPaR (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Mon, 11 Jul 2022 11:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiGKPaQ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 11 Jul 2022 11:30:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7C831326C7
        for <kvm@vger.kernel.org>; Mon, 11 Jul 2022 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657553414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=w76bk0fg9jbKWFKSFIfS3MdCk1xiwLgmLQhkkHGDGFo=;
        b=EZ2mCZoanZB7C3UAiCvWeSGqtw5BHJRoUaZOFycruJYWsEF2etFM1wrjnSaPLiCFWSxmr7
        muq2aj2HzlPukgrGNPBDlIRxTD50dGG3pGKYpuJaszkOtyhbvbZzDETgQwKGP8J6cg5t1N
        9xZVFcZdms0Asd81/NQkHQhO5z/6t94=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-kgWLMHgnMuqAIxuxxxzxeQ-1; Mon, 11 Jul 2022 11:30:13 -0400
X-MC-Unique: kgWLMHgnMuqAIxuxxxzxeQ-1
Received: by mail-wm1-f69.google.com with SMTP id q15-20020a05600c040f00b003a2e5c8fca3so2163727wmb.7
        for <kvm@vger.kernel.org>; Mon, 11 Jul 2022 08:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w76bk0fg9jbKWFKSFIfS3MdCk1xiwLgmLQhkkHGDGFo=;
        b=RLM0HRPNtr69Viz+b3ZAt1EZcY14uDb+qVcvRz4Csz3l8+EHrc0CdjdlWy6wwQYDuh
         R3u4qD7unTfHlQe9pJ+QOiPvZjsd1fshB5tuB4aFuo+jvqVYC6rU+SRB7Kp3a4ZPg8lW
         TjwCUeIYEl7DfzwuDZVsX1L1LYFYTJ19zIK/oYsLD9TTTLu0DkD5B8mlCI/5jMbQlkZi
         IZHT+SoK09djBfbRuVU+MlBrmvP5fJfnDpUgkCNB6fTUMBObCPM+6cdIAho8fJqpNFqG
         ZvEGEM2+BTE/EX4Ym8GKcLxl6snQNrj/lXeG45CMPr/iuj6id3wDZkx9zzHIH0oIby2r
         BQEg==
X-Gm-Message-State: AJIora+SR7UZ9fG8+t+R81s9CjlV2yK/MrLFHW5LmZLDfS/SN5g1UT+N
        kSKR80ankBFsMYn69weadph1HlhEApECs0rkXteJCL90yCdGPzaRFiTR5XmPfWfjB1AeXlcjzH3
        gHKwg7D4wj+hL
X-Received: by 2002:a5d:6048:0:b0:21d:68e5:7cf0 with SMTP id j8-20020a5d6048000000b0021d68e57cf0mr17823717wrt.678.1657553411991;
        Mon, 11 Jul 2022 08:30:11 -0700 (PDT)
X-Received: by 2002:a5d:6048:0:b0:21d:68e5:7cf0 with SMTP id j8-20020a5d6048000000b0021d68e57cf0mr17823691wrt.678.1657553411753;
        Mon, 11 Jul 2022 08:30:11 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id s7-20020adfecc7000000b0021d7050ace4sm6013983wro.77.2022.07.11.08.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:30:11 -0700 (PDT)
Date:   Mon, 11 Jul 2022 16:30:09 +0100
From:   "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Eric Auger <eauger@redhat.com>,
        Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
Message-ID: <YsxCAYKDPd2JI89W@work-vm>
References: <20220707161656.41664-1-cohuck@redhat.com>
 <YswkdVeESqf5sknQ@work-vm>
 <CAFEAcA-e4Jvb-wV8sKc7etKrHYPGuOh=naozrcy2MCoiYeANDQ@mail.gmail.com>
 <YswzM/Q75rkkj/+Y@work-vm>
 <87r12r66kq.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r12r66kq.fsf@redhat.com>
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
X-TUID: bKJwNpiGcrlP

* Cornelia Huck (cohuck@redhat.com) wrote:
> On Mon, Jul 11 2022, "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> >> On Mon, 11 Jul 2022 at 14:24, Dr. David Alan Gilbert
> >> <dgilbert@redhat.com> wrote:
> >> > But, ignoring postcopy for a minute, with KVM how do different types of
> >> > backing memory work - e.g. if I back a region of guest memory with
> >> > /dev/shm/something or a hugepage equivalent, where does the MTE memory
> >> > come from, and how do you set it?
> >> 
> >> Generally in an MTE system anything that's "plain old RAM" is expected
> >> to support tags. (The architecture manual calls this "conventional
> >> memory". This isn't quite the same as "anything that looks RAM-like",
> >> e.g. the graphics card framebuffer doesn't have to support tags!)
> >
> > I guess things like non-volatile disks mapped as DAX are fun edge cases.
> >
> >> One plausible implementation is that the firmware and memory controller
> >> are in cahoots and arrange that the appropriate fraction of the DRAM is
> >> reserved for holding tags (and inaccessible as normal RAM even by the OS);
> >> but where the tags are stored is entirely impdef and an implementation
> >> could choose to put the tags in their own entirely separate storage if
> >> it liked. The only way to access the tag storage is via the instructions
> >> for getting and setting tags.
> >
> > Hmm OK;   In postcopy, at the moment, the call qemu uses is a call that
> > atomically places a page of data in memory and then tells the vCPUs to
> > continue.  I guess a variant that took an extra blob of MTE data would
> > do.
> 
> Yes, the current idea is to extend UFFDIO_COPY with a flag so that we
> get the tag data along with the page.
> 
> > Note that other VMMs built on kvm work in different ways; the other
> > common way is to write into the backing file (i.e. the /dev/shm
> > whatever atomically somehow) and then do the userfault call to tell the
> > vcpus to continue.  It looks like this is the way things will work in
> > the split hugepage mechanism Google are currently adding.
> 
> Hmm... I had the impression that other VMMs had not cared about this
> particular use case yet; if they need a slightly different mechanism,
> it would complicate things a bit.

I think Google's internal VMM doesn't use UFFDIO_COPY - but I don't have
details to be sure of that.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
