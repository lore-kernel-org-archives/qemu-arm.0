Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2545563ejc;
        Tue, 17 Jan 2023 09:01:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtH8YaWvuQJf5pvc/FiBZ/jEgtsk9/TsLT3sMpKec2kQ4r4LntXV+qEepwFTJQtLWMPo9lA
X-Received: by 2002:a17:907:8196:b0:7c1:6fd3:1efa with SMTP id iy22-20020a170907819600b007c16fd31efamr14821687ejc.28.1673974913226;
        Tue, 17 Jan 2023 09:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673974913; cv=none;
        d=google.com; s=arc-20160816;
        b=b13yeJ+W3dtCT4owGbs7sEb4mqJn6gMza2iUKE0yoIvHsKiXSJjlsfnGi8SsoK9YqT
         JKmF3o+EvTjgtcixl7pTBAqtGBK4a/baT86hFcbMQj9yT6wv45KQ1zoeLtvjEbHEh1oJ
         1k5IPJtvZEv3/rI8GmGhtcmE+WpU4PT+NNodtwDWjoUD7TSSX26qRH/GQ60HiOvffG2J
         dDMH5pQm01nkL99AJErv8cwq+Qcwkv6o266CUo8YIQdpuqNZwpL3NC6lh5Nu/2DCtJEc
         leaPEdixNeOcS88sCQ7P/ihzUGKoqh68G/7/tbtCXPOshoQLlHcoRUowNNA64Xz0Ik2S
         32VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=rZYOg2f+szhhX3cBVgOIK9JGWCbhOCSqTfu1Pg+gH+Y=;
        b=XnbEsQtmgixAf6sREG77FTXGBC7q1l5mxF+wNeJhUYMI2Gx6MTKv5+oJG6IetLIWAz
         +vOS/YY5uEURL5tHRtNZyURO4yFoeKu0V3BNcb/LP+rMbpiAvBIumok5+zLjc8Q9rj00
         a+lmZyk1Q74Je+lv7sSY4/of9BTVz9/DjBsouQMQ2hkdbk7Y+803KoVD8p+cOxMPrTNX
         YmpQlOfsWpxHePYn0td7JAJYL9lOYwMU4ihOct2Y06L4JS4oKtav3PeZb+Bmt6E9PNU3
         ERs77Ra1ceI1vtlQ3uKK7KKGVn5NSocvhq+Jjjmkqu0kBwH86dwWPWho7zuN0WeshETF
         vXSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u7YGpSfz;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id hg6-20020a1709072cc600b0086b31465a93si14751591ejc.401.2023.01.17.09.01.53;
        Tue, 17 Jan 2023 09:01:53 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u7YGpSfz;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjAQRBu (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 3 others); Tue, 17 Jan 2023 12:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjAQRBl (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 17 Jan 2023 12:01:41 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6E621A0E
        for <kvm@vger.kernel.org>; Tue, 17 Jan 2023 09:01:38 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id jl4so34166945plb.8
        for <kvm@vger.kernel.org>; Tue, 17 Jan 2023 09:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rZYOg2f+szhhX3cBVgOIK9JGWCbhOCSqTfu1Pg+gH+Y=;
        b=u7YGpSfziXUPkvB/gafuQpp2n2O9dmMUBX3rWS3KKN6ZokdDcMtvDAYv3XOMw+2h/T
         iD6qSMgkCtx10QxQcDOGuejP4c78ZAdJxc+9+H3z/UfiysUm7BlHsWQHhEOmEGhxpeOy
         7ESUswWmKjB+l8k0BuOHdYNXOTLlVcz+CTtX2hPpLX/r7KZwQBCmP5cEQ2nGx8ON0Lwv
         RqDhVFB3bPkQ+5ryUeOd/zJN+dPcaPhOKlochWNUuWmIlnsk8D6NCtAut3efDsUuE1hS
         5UDDbQJtOdCDuHjRhQFXBYg6orXmCb1JceLkLPScsHA9CiIMQsc8szFu83ccrCdL4t5Q
         s7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZYOg2f+szhhX3cBVgOIK9JGWCbhOCSqTfu1Pg+gH+Y=;
        b=JZ7Zn8ZSudq4iFtGSjVnve2X7bs60n2xChq9bq8tuEBgitzapHanlRTJbrzS/yFT7j
         WZumAdbrGMGX0NxHBhsTqwFW7LDtooMXJOoJy1pLkD9nu3p5iwyIUEL2XPaiKX0XeErL
         9qtGv2NbMjpDO2rHgKNItec6BNV5IfBjNrW6qO9BEdDRJNTCF3AMOR5iNoIKEm5enodj
         eChrQOxZJtHZnqiK+prKhcg0lXzaTmUCVEO8DtP4n9Jbw22zoIstr34LCz34msIpZuJD
         i8RHDYa6seOS92S7EdP3dcWjb4tcGErYpbHaELZSdiiRzq56JLUD+IiKhx9SDbe8xFuO
         ngmg==
X-Gm-Message-State: AFqh2kq+/gFLtB7kG8P81EJr70ZFiqr18ZW19GJMQcMzEoElD7K5Mhi7
        BTkV6frTFZoqbU5XCdsmX+CKGM18sKptR2qXy9EBKg==
X-Received: by 2002:a17:90a:ea92:b0:229:189b:6fee with SMTP id
 h18-20020a17090aea9200b00229189b6feemr340092pjz.221.1673974897929; Tue, 17
 Jan 2023 09:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20230111161317.52250-1-cohuck@redhat.com> <20230111161317.52250-2-cohuck@redhat.com>
 <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com> <Y8bR7xrsCMr5z6xI@work-vm>
In-Reply-To: <Y8bR7xrsCMr5z6xI@work-vm>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 17 Jan 2023 17:01:26 +0000
Message-ID: <CAFEAcA-rnb=fSW+ZiZkX7EAgTnmksr4Grow3P=UdQR1yhay4TQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
To:     "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc:     Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: oej+BYEw+XN0

On Tue, 17 Jan 2023 at 16:51, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
> > > +MTE CPU Property
> > > +================
> > > +
> > > +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> > > +presence of tag memory (which can be turned on for the ``virt`` machine via
> > > +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> > > +proper migration support is implemented, enabling MTE will install a migration
> > > +blocker.
> > > +
> > > +If not specified explicitly via ``on`` or ``off``, MTE will be available
> > > +according to the following rules:
> > > +
> > > +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
> > > +  preserves the behaviour prior to introduction of the feature.
> > > +
> > > +* When KVM is used, MTE will default to off, so that migration will not
> > > +  unintentionally be blocked.
> > > +
> > > +* Other accelerators currently don't support MTE.
> >
> > Minor nits for the documentation:
> > we should expand out "if and only if" -- not everybody recognizes
> > "iff", especially if they're not native English speakers or not
> > mathematicians.
> >
> > Should we write specifically that in a future QEMU version KVM
> > might change to defaulting to "on if available" when migration
> > support is implemented?
>
> Please make sure if you do something like that, that the failure
> is obious; 'on if available' gets messy for things like libvirt
> and higher level tools detecting features that are available and
> machines they can migrate to.

If we have a plan for how this ought to work when we eventually
implement migration support that's great and we should document
it. My point is really "we should make sure we don't box ourselves
into a set of defaults that we regret in the future, eg where
TCG and KVM always have different defaults forever". If we don't
have a plan for what the future is, then I'd rather we delayed
adding MTE-without-migration-support until we've determined that
plan.

Though the default for the CPU property is a bit moot, because
at the machine level we only implement tag memory on the virt
board, and there we disable it at the machine level (ie the
machine property 'mte' defaults to 'false').

thanks
-- PMM
