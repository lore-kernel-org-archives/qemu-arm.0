Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp58645ocs;
        Mon, 26 Sep 2022 12:08:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5eD5pYtO+u8HzkfZNHMfxrJcrwf4Br5AkFOUpzy/o5R5i3wjemPpEJIRZ2krdI7K4FAQki
X-Received: by 2002:a05:6214:5288:b0:4ad:7535:9b9b with SMTP id kj8-20020a056214528800b004ad75359b9bmr18523844qvb.89.1664219295287;
        Mon, 26 Sep 2022 12:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664219295; cv=none;
        d=google.com; s=arc-20160816;
        b=cxt5QefwJh8f9ohS5SfyiyjvbtC37IY7bMUsK4lYSi4YuxaPXSpHwwpoxMqbujGTyp
         OJMfTjQ0n5GMwudSOPGx9ofBY39GYmemt5+nHQhHOAd4ccOoA5/Y+PH5x6jd3qPp1lh1
         WKkDRcNfDvdb+tVLvuD0P1X007PL1Ne+a5nikenNCYAC2d7YiswtLb/1K7VWQUvm/KZx
         lMRb+Z3m4ijadfESPzZI0JTiYMcV2s1ulAUL3tPhKdk5f209cwEYV3xxhCG96ES/4jzP
         keW7qOVFkLsUn7FeLpT1lbtrNeL2zXo1FMx1qlgcQPdSn4lD2Q9oF+c9SJFApa8h8q3H
         Ni9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cW6SI3svECFkjaNcx7SDd/YGDU30luCGFo7onpRuRkk=;
        b=xAkth8kJu6BsV+ihMAYQQpfHnEKOX5xZ5Ue5iulsPtW/d6aZA1Vf9UpgcC2zoOJ8oW
         z5jjUwOl08qUYYOqp2tLd0AcgNEMob1oU4D5I9iPmU8bFrOUWK2l33O+ByOc/2L7xPoh
         dqebzLkNn9u2CzvyJmYUI4ImLgkVv3wDs6PEkTENJthpsI8DUcLMvxobYXdvIAlt0uwt
         aMts1ysyqbdB7dAD/LaWJeJjmBz/eFOSO4XkAIdDnudifKnY20PG6KaCRCwcMT3kXE9m
         WK5GNsQ7XKu4vo+8dQQHwbrp566KQemFoikeZS17KXJEe+JK9FKVtgL3pbD6AAVkDyns
         FxLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nX6T8Dmo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if14-20020a0562141c4e00b00499325c3a60si10297732qvb.533.2022.09.26.12.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Sep 2022 12:08:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nX6T8Dmo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1octSg-0004pJ-Se
	for alex.bennee@linaro.org; Mon, 26 Sep 2022 15:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1octRy-0004mU-R5
 for qemu-arm@nongnu.org; Mon, 26 Sep 2022 15:07:30 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1octRu-0007Yw-RC
 for qemu-arm@nongnu.org; Mon, 26 Sep 2022 15:07:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id hy2so16140215ejc.8
 for <qemu-arm@nongnu.org>; Mon, 26 Sep 2022 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=cW6SI3svECFkjaNcx7SDd/YGDU30luCGFo7onpRuRkk=;
 b=nX6T8DmolD0Bj2Vx+7MyC/iFTrawki3IN8Wu6M0EZVa//1zZK8Wd8xKl4GF4qnOVp8
 2zx+nqNMABUod37zvCWbEGHH6UlFZQRtJwix4wFNIXb3LHPXX2vMEN2/eichMIwhUyBM
 6d8irypnYesOn3BdkebVmONo05yKI1yJXVHpqS8mj913UElSmL7Rb0h4C6LIEVTGvK0r
 gGcq1nZ2N2xtt6TxTYCuBv6WmlvI1xbP/nC3QAcypKCu7aLTW/8z1K7P0VIzY5JDxOmE
 lf7FHjburwI1No+fozQnQ0jDEj0m5RTJskj0Gek05sejzoSfw3Bb5Bxq0KG8DUc77wJW
 gYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cW6SI3svECFkjaNcx7SDd/YGDU30luCGFo7onpRuRkk=;
 b=7HLXS/t53MxSg+JmKjct6GKPKFfpjjIPHp0BT5EdhZ4ttU52t+K5VkpVSpE6SBtIbW
 1vSCpkeS934Nql7Rd+0fjP1j9muwFI/FM138TbWfYbvBX+T9E7vMkj4vMKHWKsb6aKiS
 nd8RrSZNoqqEwdUawzKilW3+LRqCirIcG5WDB2Bsh6rPrPsokRCoaGYvAMB/oZDfb45y
 ujJDZ5dl7gTWTUyt0Y+FIBaaFUAmejhaX+qrPqavAVzLpHn4OOiWXbkeb8gv3ylNzj2E
 z2JXqZjjpOYukCgi8FfcntP6dOZ/xBSnxxeN2yZa+/v/D9+xuJNcDn4FNVcuiOsRfjSV
 sOhw==
X-Gm-Message-State: ACrzQf0XeYruPhyFoIE245DE0hOlBXUJ5lCFYx+fmiRLif+aCOBUWy2S
 uEC2C1YjbDCaO5RpRa6ZMuJyJDwWDNbMlWxrXpeIxA==
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr19190242ejc.365.1664219244633; Mon, 26
 Sep 2022 12:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133644.1345269-1-peter.maydell@linaro.org>
 <20220926180812.oojocmldqsf7kl2o@altlinux.org>
In-Reply-To: <20220926180812.oojocmldqsf7kl2o@altlinux.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 20:07:13 +0100
Message-ID: <CAFEAcA8tfam1tENE+O9Ae=69mbb=k=XOuJ0AsM9ErqURSnsuXQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
To: Vitaly Chikunov <vt@altlinux.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Dmitry V. Levin" <ldv@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VpSZ4NG9T/I1

On Mon, 26 Sept 2022 at 19:08, Vitaly Chikunov <vt@altlinux.org> wrote:
>
> Peter,
>
> On Mon, Sep 26, 2022 at 02:36:44PM +0100, Peter Maydell wrote:
> > Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
> > there is no pending signal to be taken. In commit 94ccff13382055
> > we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
> > generic KVM code. Adopt the same approach for the use of the
> > ioctl in the Arm-specific KVM code (where we use it to create a
> > scratch VM for probing for various things).
> >
> > For more information, see the mailing list thread:
> > https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
> >
> > Reported-by: Vitaly Chikunov <vt@altlinux.org>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > The view in the thread seems to be that this is a kernel bug (because
> > in QEMU's case there shouldn't be a signal to be delivered at this
> > point because of our signal handling strategy); so I've adopted the
> > same "just retry-on-EINTR for this specific ioctl" approach that
> > commit 94ccff13 did, rather than, for instance, something wider like
> > "make kvm_ioctl() and friends always retry on EINTR".
> > ---
> >  target/arm/kvm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index e5c1bd50d29..2982d216176 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> >      if (max_vm_pa_size < 0) {
> >          max_vm_pa_size = 0;
> >      }
> > -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > +    do {
> > +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > +    } while (vmfd == -EINTR);
>
> This does not seem correct. ioctl(2) returns -1 on error and will set errno
> to EINTR (in this case).

Oops, thanks for the catch. I was copying the pattern from kvm-all.c,
but there we are calling kvm_ioctl(), which does "if ioctl
returns -1, return -errno", and here we are calling ioctl() directly.
(We can't use kvm_ioctl() here because this stunt VM doesn't have
a KVMState.) I'll respin the patch with the obvious fix.

thanks
-- PMM
