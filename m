Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1910331ejb;
        Fri, 4 Aug 2023 10:32:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyVtH2cCFsekZiJWwt3YiVUyQA5CDhwJXxsqbCe+QaDfWW0Z9UGTVicjG4WNPXLMQ8njyf
X-Received: by 2002:a05:6512:20d3:b0:4f8:6a29:b59b with SMTP id u19-20020a05651220d300b004f86a29b59bmr1644613lfr.64.1691170373757;
        Fri, 04 Aug 2023 10:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691170373; cv=none;
        d=google.com; s=arc-20160816;
        b=QNFYgXhpmZ4sdMHDzNy2KILSEUG+aumywkshf2W+MHh2jx//mhR4VHrQVX3wx9AmzV
         TAmBWG5yegNgdYQXzy9BP8e6aNQg34w7PjDuZuElSwXOFkO2aGQXDrnp3ByH0zGqT8Wb
         bioMjGR9TtE+uj0B/ilOL1Edl1tjvYMv4zp4HeykLcioZI2CNK6E5mtoYp3Lzeq4Utjr
         X2h8DFOFZRW6+h0w2Tsh+xn7iqHZ4fTpkLpL2yT/2XSaikVa6zLlovPLqdsSz5bzAoGZ
         YZ3H7GXd1QI0YuP0KlNjJkbWZtq132BtZ1EQuLlt6I6vIL7+X1z1iArSouvQGsdYC90S
         bpNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=ouLmlWO0nxLEXXwAGQ0fQVcTHPFq6MPNEjQuiQXiic4=;
        fh=XsubhDhda3Jy2jwSl6ul4B/gOYNpncuz9O4UsSnbTZg=;
        b=IAWIxrLuktS6VqQi3Kns90dPY9a6xmoRMaqwi87T2FDHrC8in027VtVa94kQicxn3j
         gyX+XSpJEd3f/haBDOVZ75hqQIVOinvF+ldyvWGripD7SQjOuUv04DjVtgeZ3W/I6cfI
         b9nuxSNhWBf7HMjPoBzypcPNbjB8RwQh7dVebg9cpZUUHdF1bU38+18AWWXC7RZHqHaf
         IGz3XKy6PIp4C3+XnN00kSD8P494a4AGlstU8k1/pDiG946xLYGlE1iTCRN1asv+Cgvl
         Wpf05R9Nq/3ml4ezcnCecLVZ8CJY3jT8dHeisHcyE8PmMoL/MFkoRqx2PohoHOLoIqow
         LbSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfL5hYuy;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id t8-20020aa7d708000000b005222a3aed15si1037411edq.94.2023.08.04.10.32.53;
        Fri, 04 Aug 2023 10:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfL5hYuy;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbjHDRcw (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 4 Aug 2023 13:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjHDRcq (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 4 Aug 2023 13:32:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B92F49EA
        for <kvm@vger.kernel.org>; Fri,  4 Aug 2023 10:32:45 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so4080218e87.3
        for <kvm@vger.kernel.org>; Fri, 04 Aug 2023 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691170363; x=1691775163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ouLmlWO0nxLEXXwAGQ0fQVcTHPFq6MPNEjQuiQXiic4=;
        b=zfL5hYuy6XBwrVeD2HBxIdGLvh9mzH+53gxKBMybtnern7YY3syIqlsMMDxAv3TII3
         I/bKlgK0D0lIILWWRgSjGwD04V2gaAF1bwT3XXCXUZryQ0qToKc1bRp1xJoSgczgnTGN
         mp1cLOsDKHEqXf9jJJwTzolyAyp5LZrhh65uhruYd8gRmGvBizGNpS8y3TuSPjvkKwfH
         8Z5Ui67ARGzIVzSV01duJ0ZhYso3exEewfsO9xd4MSf8pbgXipM7V59fGSM3Fgt9KlLU
         mWCIbEUntrcxPE3MZFKaqTpEj4wVkh/wKfcihubmj/qx5kPZfKIcPNQSVkuDDB8RxUiv
         jafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691170363; x=1691775163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouLmlWO0nxLEXXwAGQ0fQVcTHPFq6MPNEjQuiQXiic4=;
        b=ffehf+CBanquQTiuP+OH4icVHy4ZF5HvR9VS9Kk0tacKQsQOW7EoPN9i+NWxUoHODK
         PkD6Uvpdiu7yHqo0lYBsn3K6C+Y6og13yMjecuOI6sfaWmhw5cc7Snpe6xvuMewLRWlh
         ANM0MIwlTYBCNuVjx1QCr8R2VzfePSckZy1rALF3qJtLeN1FndP6VBP6u4g8IZfew8FX
         6w6RsaWA7ucKNDzKP3/+6BRdesKiVIyASQRMgUux0WgEMaDIN9wcLq9Rg4I1/Cymg5eI
         v+JgfqvigwnU2/quiySexJqmkeNz/iRQEPb+62aIbW6pqrEchhR82gmsRNvqM+gk6T26
         dHpA==
X-Gm-Message-State: AOJu0Yyh8Ir8f/wZOgvus7J+w/6lxsqk1b4rx8auMr+ID3H2W0/d0ggN
        lwM9OTB8xhPu1f3R+undyxleZWUScNu/MjhWjWiVmKZ3tOjiD0Cv
X-Received: by 2002:a05:6512:472:b0:4fd:fadc:f1e with SMTP id
 x18-20020a056512047200b004fdfadc0f1emr1617634lfd.44.1691170363295; Fri, 04
 Aug 2023 10:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230727073134.134102-1-akihiko.odaki@daynix.com> <20230727073134.134102-3-akihiko.odaki@daynix.com>
In-Reply-To: <20230727073134.134102-3-akihiko.odaki@daynix.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 4 Aug 2023 18:32:32 +0100
Message-ID: <CAFEAcA90ujx5=r6eFwkYZniSCgKNwGaEjtcU8RQL43-ZtPPktA@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] accel/kvm: Specify default IPA size for arm64
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
X-TUID: rIY4NqjeQdXA

On Thu, 27 Jul 2023 at 08:31, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> Before this change, the default KVM type, which is used for non-virt
> machine models, was 0.
>
> The kernel documentation says:
> > On arm64, the physical address size for a VM (IPA Size limit) is
> > limited to 40bits by default. The limit can be configured if the host
> > supports the extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
> > KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
> > identifier, where IPA_Bits is the maximum width of any physical
> > address used by the VM. The IPA_Bits is encoded in bits[7-0] of the
> > machine type identifier.
> >
> > e.g, to configure a guest to use 48bit physical address size::
> >
> >     vm_fd = ioctl(dev_fd, KVM_CREATE_VM, KVM_VM_TYPE_ARM_IPA_SIZE(48));
> >
> > The requested size (IPA_Bits) must be:
> >
> >  ==   =========================================================
> >   0   Implies default size, 40bits (for backward compatibility)
> >   N   Implies N bits, where N is a positive integer such that,
> >       32 <= N <= Host_IPA_Limit
> >  ==   =========================================================
>
> > Host_IPA_Limit is the maximum possible value for IPA_Bits on the host
> > and is dependent on the CPU capability and the kernel configuration.
> > The limit can be retrieved using KVM_CAP_ARM_VM_IPA_SIZE of the
> > KVM_CHECK_EXTENSION ioctl() at run-time.
> >
> > Creation of the VM will fail if the requested IPA size (whether it is
> > implicit or explicit) is unsupported on the host.
> https://docs.kernel.org/virt/kvm/api.html#kvm-create-vm
>
> So if Host_IPA_Limit < 40, specifying 0 as the type will fail. This
> actually confused libvirt, which uses "none" machine model to probe the
> KVM availability, on M2 MacBook Air.
>
> Fix this by using Host_IPA_Limit as the default type when
> KVM_CAP_ARM_VM_IPA_SIZE is available.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
