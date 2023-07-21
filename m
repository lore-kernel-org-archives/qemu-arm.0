Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp132328ejb;
        Fri, 21 Jul 2023 05:28:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHonQThYv/nUbf+xW3ORkzFZfrv/f2HXMFBV9CL9m9gKgSz8UUgCKltrNoYe9L67Dx23jEY
X-Received: by 2002:a05:6358:3421:b0:134:d24d:86b with SMTP id h33-20020a056358342100b00134d24d086bmr2281180rwd.16.1689942538777;
        Fri, 21 Jul 2023 05:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689942538; cv=none;
        d=google.com; s=arc-20160816;
        b=VgeYEQR7S1TKyfuvJrkozkyJx8lgCxx3vux2HVfXfn/1PXRUT7Qnq8HAuiedRVYNPT
         z9z/E2vUaW5x0dx8zjQtXye53sCHFnPzsSzYEQrITPkqcyP+Hmr0YS1aMbgLHurq4MZg
         +MmtcTO9F3q31M83OxG8EDtD2yZrAw+OxEP3P7ePy7kSiC95/GrhbWloTn+DIr7I04gy
         +/454M7rh0ts+pd6oRVqgTU8RitvCFmlLBa11insZHsmUKE2PqSO9OVNJR38uUnCgwK7
         yWCTxLrN5/akBXR25h5Hchdmbl/wTeMZ2JTQEwtCBsg0b+d9F0AY8GlDqPzVbvP0NGZq
         MOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=lMGrLA74ax3ZXDdbQTIvZqhbtdK8cEtRGYrB0J/L0kE=;
        fh=ethwcqtPxHdO0tDt/06mmMOLky3+NTx1ENrIFzoo90I=;
        b=SBWK7OmRzoD5hNtqE6f4Tbdnz8SpAyKJFeZ+8HHQNH4TawMajDYgbZ3N3NwjQxFUrJ
         mywD+QZ8z1MHeKcb/e0JQULzHwOC8yA2q7LrVFrgCiCpJa2LYTnGZ0nTmxRJyb3RmsjO
         m9Z5Rnw2RluRJQbzoFtoF+w5IsTZ70dfReeH5QVTBWqZr5IkoH0Y8PxOjgBDbZSIXW9o
         TZQfCfJ/3aFIlZD0YF74ZHixH6CFkeUIaYUCwLXxemgopaY+CgxmvDMzI69hhEe00d/a
         T2BRA83IDHeAVYQeGSF1iLPDSd+tkiowoN8kzmF80YBdL/Qq/dBMyyUaUfh7FcoQVg/y
         Biug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a85fv4Tz;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id w17-20020a63f511000000b005404f8dd0easi2726884pgh.292.2023.07.21.05.28.58;
        Fri, 21 Jul 2023 05:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a85fv4Tz;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjGUM25 (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 21 Jul 2023 08:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjGUM24 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 21 Jul 2023 08:28:56 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1F71731
        for <kvm@vger.kernel.org>; Fri, 21 Jul 2023 05:28:54 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51e6113437cso2508335a12.2
        for <kvm@vger.kernel.org>; Fri, 21 Jul 2023 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689942533; x=1690547333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMGrLA74ax3ZXDdbQTIvZqhbtdK8cEtRGYrB0J/L0kE=;
        b=a85fv4Tz9nVWuNNi+YAo/HFpozLqoOAh1YqMAiq7X6K3vPucvzi61+FHdM4mP5Q1km
         KEKiB1fnydjd8groHB84sFPJE8ATy0EPvt6DapSQKLTbtv/QYMd1K/N24Q9geNbLm6Tm
         zjW3cA+ufAjUgzDh+jwae+bsop1ZWrhFXszOaNWNaVbfbl3AO4ebsh3/iTMRnAG9Ctzq
         TC4AFjBIwN+sz9mqTr/pPyinvD3ZDu9wAOn02vHNkFy5WyaJtnRXlgCdnXB+YwOEP+6X
         gDtCphGeKhs6WamZ4YzvRzcoe+pnhBoUhWGIjziGShZcXuaq9YSJlSrHg9DnThAWS7OO
         AEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689942533; x=1690547333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMGrLA74ax3ZXDdbQTIvZqhbtdK8cEtRGYrB0J/L0kE=;
        b=b8Nqnr6DYmrxctmY7kPFfKAEyFwkW18egXl/dq4qVEUfrlKHMWRS9nO3OLk0tRmY6O
         XPFZ1z1JXbfkcODx+AAaXfVW4NwoflpmZ3j8tcYU0oXmTHM4JTORzwPme8xMDXRsVXpv
         iGnKTUlJsuZvLqWNxiFN8jPRrVCjJ6k9cCfIqthLeQCPYGZozujhT+qekb1sKT4cNqn4
         NxdNpVkMafk9+DKGE/kcgXPkMFsySevWy+SZkiKQhRjPG9AYdLSICZyzGY8fTcwskZ1k
         xvL52M4zek2ELn1sjTWC//PfdJ1kLB0Tn8E++LQy/Qq0t6jx5fyJX71+pUdbpov/i/WE
         aNjg==
X-Gm-Message-State: ABy/qLZU4gqYpx70O+ioLwB3kVajl9eLNdl3JALxb7ouWZXzcDXV0QZ5
        F9mGWAvRIHclhLoXPz3XmgLpXTJP7LWjatpOTs9OYQ==
X-Received: by 2002:aa7:d50f:0:b0:51d:d615:19af with SMTP id
 y15-20020aa7d50f000000b0051dd61519afmr1465566edq.28.1689942533305; Fri, 21
 Jul 2023 05:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230721062421.12017-1-akihiko.odaki@daynix.com> <05d4e5ff-dc5c-b2da-7ae8-ac135d4a73c9@linaro.org>
In-Reply-To: <05d4e5ff-dc5c-b2da-7ae8-ac135d4a73c9@linaro.org>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 21 Jul 2023 13:28:42 +0100
Message-ID: <CAFEAcA_xTAnZ+CO8L3yhUMht3fL=rspk94z-hmZKgdABLAgBNA@mail.gmail.com>
Subject: Re: [PATCH v2] accel/kvm: Specify default IPA size for arm64
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc:     Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: zG3g8xcBij1/

On Fri, 21 Jul 2023 at 08:30, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Akihiko,
>
> On 21/7/23 08:24, Akihiko Odaki wrote:
> > libvirt uses "none" machine type to test KVM availability. Before this
> > change, QEMU used to pass 0 as machine type when calling KVM_CREATE_VM.
> >
> > The kernel documentation says:
> >> On arm64, the physical address size for a VM (IPA Size limit) is
> >> limited to 40bits by default. The limit can be configured if the host
> >> supports the extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
> >> KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
> >> identifier, where IPA_Bits is the maximum width of any physical
> >> address used by the VM. The IPA_Bits is encoded in bits[7-0] of the
> >> machine type identifier.
> >>
> >> e.g, to configure a guest to use 48bit physical address size::
> >>
> >>      vm_fd =3D ioctl(dev_fd, KVM_CREATE_VM, KVM_VM_TYPE_ARM_IPA_SIZE(4=
8));
> >>
> >> The requested size (IPA_Bits) must be:
> >>
> >>   =3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>    0   Implies default size, 40bits (for backward compatibility)
> >>    N   Implies N bits, where N is a positive integer such that,
> >>        32 <=3D N <=3D Host_IPA_Limit
> >>   =3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >> Host_IPA_Limit is the maximum possible value for IPA_Bits on the host
> >> and is dependent on the CPU capability and the kernel configuration.
> >> The limit can be retrieved using KVM_CAP_ARM_VM_IPA_SIZE of the
> >> KVM_CHECK_EXTENSION ioctl() at run-time.
> >>
> >> Creation of the VM will fail if the requested IPA size (whether it is
> >> implicit or explicit) is unsupported on the host.
> > https://docs.kernel.org/virt/kvm/api.html#kvm-create-vm
> >
> > So if Host_IPA_Limit < 40, such KVM_CREATE_VM will fail, and libvirt
> > incorrectly thinks KVM is not available. This actually happened on M2
> > MacBook Air.
> >
> > Fix this by specifying 32 for IPA_Bits as any arm64 system should
> > support the value according to the documentation.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > ---
> > V1 -> V2: Introduced an arch hook
> >
> >   include/sysemu/kvm.h   | 1 +
> >   accel/kvm/kvm-all.c    | 2 +-
> >   target/arm/kvm.c       | 2 ++
> >   target/i386/kvm/kvm.c  | 2 ++
> >   target/mips/kvm.c      | 2 ++
> >   target/ppc/kvm.c       | 2 ++
> >   target/riscv/kvm.c     | 2 ++
> >   target/s390x/kvm/kvm.c | 2 ++
> >   8 files changed, 14 insertions(+), 1 deletion(-)
>
> My understanding of Peter's suggestion would be smth like:
>
> -- >8 --
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 115f0cca79..c0af15eb6c 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -201,10 +201,15 @@ typedef struct KVMCapabilityInfo {
>
>   struct KVMState;
>
> +struct KVMClass {
> +    AccelClass parent_class;
> +
> +    int default_vm_type;

The kernel docs say you need to check for the
KVM_CAP_ARM_VM_IPA_SIZE before you can pass something other
than zero to the KVM_CREATE_VM ioctl, so this needs to be
a method, not just a value. (kvm_arm_get_max_vm_ipa_size()
will do this bit for you.)

If the machine doesn't provide a kvm_type method, we
should default to "largest the host supports", I think.

I was wondering if we could have one per-arch
method for "actually create the VM" that both was
a place for arm to set the default vm type and
also let us get the TARGET_S390X and TARGET_PPC
ifdefs out of this bit of kvm-all.c, but maybe that would
look just a bit too awkward:

     if (kc->create_vm(s, board_sets_kvm_type, board_kvm_type) < 0) {
         goto err;
     }

where board_sets_kvm_type is a bool, true if board_kvm_type
is valid, and board_kvm_type is whatever the board's
mc->kvm_type method told us.

(Default impl of the method: call KVM_CREATE_VM ioctl
with retry-on-eintr, printing the simple error message;
PPC and s390 versions similar but with their arch
specific extra messages; arm version has a different
default type if board_sets_kvm_type is false.)

Not trying to do both of those things with one method
would result in a simpler
   type =3D kc->get_default_kvm_type(s);
API.

thanks
-- PMM
