Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4623537lfb;
        Tue, 27 Apr 2021 02:50:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxex0F96mrKMzgXujgB76tPFziTITEzPRJqg/7ODJUAGZueL21lfcEqrMia3WhXb1x/C4XS
X-Received: by 2002:a05:6602:1353:: with SMTP id i19mr18848487iov.202.1619517010327;
        Tue, 27 Apr 2021 02:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619517010; cv=none;
        d=google.com; s=arc-20160816;
        b=i21HA3rCmlDUGsv+DR1RRJ2rfNQE2CLMeN8tL1gt/8ih13lK5glPD7aUlMeoODKSww
         30pmoV9bEe9agAEXl58RkKXIUYrDlwlDkGk/li3wCj0LDLwcDjgF32zP/Gzh2KW3QemH
         yU05vgii9yqbE5HLhy10U/LTZJgGpEPcugLvDkTkMLbzOgzNMQuyzBzpQQ4+BaBeinvC
         oJelK3PQ79xnRyFMwj6nEZrCJAtXRJr1fykSnSrHUpigJX1ku/kN0NZ+SacsXy9HKwRH
         3iKozN6EQ2UzRaHc5tkBsoQjuTaUGv8TmjDknAw/W9mYucPwE0vWSji4m5xbsLbgxIEq
         3Rbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=dbf9k7NkgiykNbk+F3gqu3dl8GaLgDnz+fFA86m0Zpw=;
        b=0n+tVby3WfL1K2nS0p9dt8E+/6B4GNdFQpMY89Q28CQ7/2OTsCJYNjV3Jt4O+kwqd9
         fg8WB2eMAKSMmxkQ0W6fVnnM5j3Ty74xMvhUTlCFdpc7LBxkKhIWPzypoqvkWyIGZJnS
         RaQ7feCMSyOwIYHPli+kjZHKhAwBCe/TGgZJD1bwQ3JaygGT8l5tugwLBYZ/4s0DYKV0
         q/p8hR2oXQIAjoA3Ni0pJg4eJ80bRkOQhkXoAyEVvKjfTQeRYm+SdETAEtWR2DZJIXzk
         RN6VwZM2kbWuiV4ssyO90A/E/lkH/Zweu1fzaU0YhNiIEJEeJz5P1QP9rU0RVkmTtt2R
         pCAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OkFyX0PX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si3893274ilu.0.2021.04.27.02.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 02:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OkFyX0PX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbKM5-0001OW-O4
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 05:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKLW-0001Nh-88
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 05:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKLU-00071n-O7
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 05:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619516972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbf9k7NkgiykNbk+F3gqu3dl8GaLgDnz+fFA86m0Zpw=;
 b=OkFyX0PXgzq6liEHb2ADYP3QBzPwcv1wDeV8prXs2rV3WzF0Nfcmq2MiJTC+xTO+JzcSBd
 06H1TVFrgQZS7zT1g88ueWLElrkHGF8Z4+DCWXHc1mehtdXfGDLo8nxGK5IZntpWZVAFRd
 8J2+1fBmOaB/qcSyRhkisPl5tB1T/QM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-4Wq9pBYmNwWjAXisB143cg-1; Tue, 27 Apr 2021 05:49:28 -0400
X-MC-Unique: 4Wq9pBYmNwWjAXisB143cg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z21-20020a05640235d5b029038795ac4cdaso3661564edc.22
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 02:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dbf9k7NkgiykNbk+F3gqu3dl8GaLgDnz+fFA86m0Zpw=;
 b=itzK2BVe4MnmMloYu01hnr5oZcYe/hZSnSUgHqSI0SU7ewkyBgrl9MRUNm6gFEJjnm
 c2she19XNKsD2mWhBzDOWBpobdeE8YVoYCUkSe13BKji83XZ9YVB84vXZs6rsoUukNEQ
 L8G6kl63ujETm/pkape5aHbSJ2a28tw8vUqSCfwI6snQUIPN8sG9ut5ErsWYb+87ONwK
 wrJjGLbE9HAMojsQLc6wgDwbwm2+6YxCzqGftvQwe8LT0vjtiulbe8OUAy7mA8m2BLl+
 qDhp0xre9eYLHfA0z67/G9jnJ1q/LXJKe+dlsqE8vX0TISMS6ynAuWgp6oe0H5lfYYx7
 /51g==
X-Gm-Message-State: AOAM530EbnqC51ns6HjqgOdOpng5mNoTtlHFG/juu3Ive13FUS9eRbeZ
 aWgzaPKwGsutoXSj4Ab+XkP5jhaEiC+YFOg5nWrdv8cgL0DeOhjn5hFlg6rC7bxPf27Ds5K0UoS
 gZbbR2TYkeZd8
X-Received: by 2002:a17:906:fa18:: with SMTP id
 lo24mr22348675ejb.125.1619516967128; 
 Tue, 27 Apr 2021 02:49:27 -0700 (PDT)
X-Received: by 2002:a17:906:fa18:: with SMTP id
 lo24mr22348659ejb.125.1619516966950; 
 Tue, 27 Apr 2021 02:49:26 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j7sm1987322edv.40.2021.04.27.02.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:49:26 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:49:24 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RESEND v2 5/6] target/arm/cpu: Enable 'el2' to work with
 host/max cpu
Message-ID: <20210427094924.pgivurjrgtzovcwa@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <37df1b1872f15086dd1d066e53dc1eedaf114051.1617281290.git.haibo.xu@linaro.org>
 <20210427092423.q3ktw4kkd5xhapad@gator.home>
 <CAFEAcA9+VpFp70rwZ5rWEQX9TxPH558jCiSU6Z=qPnUfieSukA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9+VpFp70rwZ5rWEQX9TxPH558jCiSU6Z=qPnUfieSukA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UE37vWJtU1v4

On Tue, Apr 27, 2021 at 10:38:00AM +0100, Peter Maydell wrote:
> On Tue, 27 Apr 2021 at 10:24, Andrew Jones <drjones@redhat.com> wrote:
> > I feel like there are way too many ways to track this feature now. If I
> > didn't lose count we have
> >
> >  1) cpu->has_el2
> >  2) cpu->env & ARM_FEATURE_EL2
> >  3) (for mach-virt) vms->virt
> >  4) possibly (and probably should) some ID register bits
> >
> > I realize the first three are already in use for TCG, but I'm guessing
> > we'll want to clean those up. What's the plan going forward? I presume
> > it'll be (4), but maybe something like (1) and/or (3) will stick around
> > for convenience. I'm pretty sure we want to avoid (2).
> 
> For new features added we want to use ID register bits. However,
> a lot of older pre-existing features are keyed off ARM_FEATURE_FOO
> flag bits. Trying to convert an ARM_FEATURE flag to use ID registers
> isn't necessarily 100% trivial (for instance, the ARM_FEATURE flag
> is always checkable regardless of AArch64 vs AArch32, but the ID
> register checks often need to be split up into separate ones checking
> the AArch32 or the AArch64 ID register value). So we aren't really
> doing conversion of existing flags. (I did a few which were easy
> because there were only a handful of checks of them.) As a side note,
> some features really can't be checked in ID registers, like
> ARM_FEATURE_V8_1M, so env->features is not going to go away completely.
> 
> The only use of cpu->has_foo should be for the QOM property -- the
> arm_cpu_realizefn() should look at it and then either clear the
> ARM_FEATURE flag or update the ID register bits depending on
> which one the feature is using.
> 
> vms->virt is for the board code (and controls more things than
> just whether the CPU itself has EL2).
>

Thanks for the summary, Peter. For this series, do you recommend
attempting to convert from ARM_FEATURE_EL2 to feature bits first? Or keep
the ARM_FEATURE flag? Also, while I agree we can't use vms->virt for the
same purposes as the CPU feature (however that's tracked), do you agree
vms->virt should be true when the CPU feature is enabled?

Thanks,
drew

