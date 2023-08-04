Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1913910ejb;
        Fri, 4 Aug 2023 10:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYNWztTbhlGuGqpeeaW6pPeFWp/YNhSvo0Ynuks6vpPGHeTKhufR1TJoX1hN8ybZtpXqbv
X-Received: by 2002:a17:90b:1e4f:b0:269:13f0:4b9a with SMTP id pi15-20020a17090b1e4f00b0026913f04b9amr2125424pjb.7.1691170744121;
        Fri, 04 Aug 2023 10:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691170744; cv=none;
        d=google.com; s=arc-20160816;
        b=zOsFxQVcaTGHmbQjeS1FhLpvakIUuBVGyGalCfgOrKZNd/TVTaMAHHklismFSJmC06
         GNZiKAhuAwYjxboW1svLzuOTD8uR85tzYeQF+L2o4MQITcYDwTgCvOOg7JKy5EwmjPXs
         EyzRY7BtXfIOyF2W0zMdgqyw+FOjau2IR0VeVKhTBJljCI601GIwU8hHcxO0eHrtkgBt
         YYWE+bXZ5lPjv/B8MRYB8Ogou4xjviwY0tCK/4pmrkMGOmidj63XbXCtWBnHFql0gBzN
         2gpScWFUgjvXa81O2eOoftl0zFKmh+jcpLAWAPAhb9kUNPjShPiYBi8Yovmj8ZerbBPo
         661A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=WJQF/s3rT1P+39oLCYPi5xllhzTzH9j+4r0ow7Ta0v4=;
        fh=XsubhDhda3Jy2jwSl6ul4B/gOYNpncuz9O4UsSnbTZg=;
        b=UmpKi9U0RwpguO+EgLeuctONxsrcaqPtY6avl1ut3OCAgv331yLs8nhf1OkBe4og4/
         f9V4QbTfQ6NJ0CXtpuIv1588fy+tezzGvDX6jpBjSaMgICnw/rZIJ2wN/1Ib/PlzSmgL
         3dohsYtKROVQInE7ZU+W9e+AxFfcONs9X00dE2//mTzIMDLi8QraZoQ8VmDMl0LvZH18
         l10+lato03R1vVZ+oWNFR+cDfHjMaHspAIRtAB6bP/MOX5R+YrM81E7FYmZh8MTtNgL/
         Nt6MKTJ9s8u8pO6g+eMu5MCRcmVrW0zBKRJzY2mu9Ef1wuqLwFbBIUMT0YtX7cIl4yry
         TMLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CJyUx8lo;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id om1-20020a17090b3a8100b002610f13639asi5465918pjb.91.2023.08.04.10.39.03;
        Fri, 04 Aug 2023 10:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CJyUx8lo;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjHDRjD (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 4 Aug 2023 13:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjHDRjB (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 4 Aug 2023 13:39:01 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D2746B1
        for <kvm@vger.kernel.org>; Fri,  4 Aug 2023 10:39:00 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52256241c66so5057590a12.1
        for <kvm@vger.kernel.org>; Fri, 04 Aug 2023 10:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691170739; x=1691775539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WJQF/s3rT1P+39oLCYPi5xllhzTzH9j+4r0ow7Ta0v4=;
        b=CJyUx8loeqVC+QoYGq4TsRo62LRMV5E4n6sHc9xUlC4rAUfYoqIHQQUopItKs2LyHn
         AZYLzFv3BHx1qyuT2nbvENd9nLtP5X91MUYD2+xZ5FW8SQXdjY/vNqG+fxhDRlZR7SIo
         33wTmnpBWHyQOb/6Ob2cb9ji1PH7VlZGWU2e1oapNct252S3fe2bZk8PnBOM9oA/KSu2
         Q0U50hFvPtOp53u4jfzDpv8LrErrHVNlULcSs5e/bfIH4dv3j51g2DCw6wg08+Y7jDgM
         x8PH8e8bXcynYWWGdW9t3MGr/N1y/ALAf6ULJPPyAH5GqyFH+QfZJTCjOhHf6n/EM0Xd
         +PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691170739; x=1691775539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJQF/s3rT1P+39oLCYPi5xllhzTzH9j+4r0ow7Ta0v4=;
        b=K8qionnXx/YgVVj8hjPHD3WYpa8q19KWQCT57uKHZwbqkiHxlbLXvxRhrakKer9d9A
         /YnfqBX3HQLTtAMshLIupPoYopveYHdR70nWPWz33jEeHMRGoWFouGfPwaKpWNL7HgY4
         NgNSSXmQBFMqAy9ITrYxsGNjpB4/MuAY/8WrAEMth9LSVWVF2jDLVu2q0d42m76OMqZY
         cB1ilOd6TDQN/hVspQbd8D4KzgGIj+bMNZ7rsLZwvxEiDzlpwc2ftHC79NLSR4BxJ46J
         Y5+1wn9Z8aXjTy1+L+LSI5tZioQtRYJMOuR2tytLUoULC+dKHue5xhujRG7Q2/uO81Ow
         wStA==
X-Gm-Message-State: AOJu0YxTCTilWIDqqtYShwUjQOC6lE0SMpIwvD2uSsdll4X39E9gf76J
        vKELvzLJ3BD2rrDmdJ6xn5f4ZubVC79JfhWnJB+4Lg==
X-Received: by 2002:a05:6402:2141:b0:522:582c:f427 with SMTP id
 bq1-20020a056402214100b00522582cf427mr434413edb.14.1691170739265; Fri, 04 Aug
 2023 10:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230727073134.134102-1-akihiko.odaki@daynix.com>
 <20230727073134.134102-2-akihiko.odaki@daynix.com> <CAFEAcA_26e2G_qLA8DEcv74MADgquhiVkWEZkh_wL0+JxAf91Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_26e2G_qLA8DEcv74MADgquhiVkWEZkh_wL0+JxAf91Q@mail.gmail.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 4 Aug 2023 18:38:48 +0100
Message-ID: <CAFEAcA9gkKy=GBXNw0rRLeN80ekFY5JQB1Jn2b+F70oC1C5uxg@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] kvm: Introduce kvm_arch_get_default_type hook
To:     Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ZUsu4/c1J7VH

On Fri, 4 Aug 2023 at 18:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 27 Jul 2023 at 08:31, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> >
> > kvm_arch_get_default_type() returns the default KVM type. This hook is
> > particularly useful to derive a KVM type that is valid for "none"
> > machine model, which is used by libvirt to probe the availability of
> > KVM.
> >
> > For MIPS, the existing mips_kvm_type() is reused. This function ensures
> > the availability of VZ which is mandatory to use KVM on the current
> > QEMU.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > ---
> >  include/sysemu/kvm.h     | 2 ++
> >  target/mips/kvm_mips.h   | 9 ---------
> >  accel/kvm/kvm-all.c      | 4 +++-
> >  hw/mips/loongson3_virt.c | 2 --
> >  target/arm/kvm.c         | 5 +++++
> >  target/i386/kvm/kvm.c    | 5 +++++
> >  target/mips/kvm.c        | 2 +-
> >  target/ppc/kvm.c         | 5 +++++
> >  target/riscv/kvm.c       | 5 +++++
> >  target/s390x/kvm/kvm.c   | 5 +++++
> >  10 files changed, 31 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> > index 115f0cca79..ccaf55caf7 100644
> > --- a/include/sysemu/kvm.h
> > +++ b/include/sysemu/kvm.h
> > @@ -369,6 +369,8 @@ int kvm_arch_get_registers(CPUState *cpu);
> >
> >  int kvm_arch_put_registers(CPUState *cpu, int level);
> >
> > +int kvm_arch_get_default_type(MachineState *ms);
> > +
>
> New global functions should have a doc comment that explains
> what they do, what their API is, etc. For instance, is
> this allowed to return an error, and if so, how ?

Looks like this was the only issue with this patchset. So
I propose to take this into my target-arm queue for 8.2,
with the following doc comment added:

/**
 * kvm_arch_get_default_type: Return default KVM type
 * @ms: MachineState of the VM being created
 *
 * Return the default type argument to use in the
 * KVM_CREATE_VM ioctl when creating the VM. This will
 * only be used when the machine model did not specify a
 * type to use via the MachineClass::kvm_type method.
 *
 * Returns: type to use, or a negative value on error.
 */

unless anybody wants more time for review or for this
series to go into the tree some other way.

thanks
-- PMM
