Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp733829ocs;
        Tue, 27 Sep 2022 10:41:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ucJQG10QdEMt2u7GsDRBaMo1rj2Ry5aRZv4kkDG4miqHtLS3iVYW23J/aH07LsplDVGyG
X-Received: by 2002:a05:6214:20a5:b0:4ac:c602:5670 with SMTP id 5-20020a05621420a500b004acc6025670mr22031713qvd.15.1664300504656;
        Tue, 27 Sep 2022 10:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664300504; cv=none;
        d=google.com; s=arc-20160816;
        b=eNeYLLqIoMNZuZaLcDV+VdgTDKLVh4Oytco5n93Vj3Aw96XHPjGLgfh2kl9/eFB++V
         uRseDiiuk3ec+9DGgLQCcsMGKjEedzUjGDjojFwq7Z9FV5vF+uNT9P/FfL/o563wkSY7
         9rtJ7hcbtQVUDclwXvPnFm6e54Z1JlPyz+eh2gcxP8A9GDSuFGaDYP6/ftL8Oxqk/H1F
         iAA0yeOszDigJeH9G6mhgqTnvh6IZisXIFOBLNG2AmsS+FeR2Aehp5D0+x/HvPl3dTi2
         VuVnumpm81xyWdAiPw6dF8NZ4wECA21fKbdNhSmw4kJTnsAcWRB/ZXHHb91LjQIVQyUR
         jA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8u3AVihglAkdz6OkHdZN1ld0QmEhCcRwpssqab1F93Y=;
        b=bWE3AB3SO3b7Ew+f4CU9fNuLV1Pc5BI+e9HRQpRceVm4Ox7bCwxLDmU9PvFYm+2hri
         DHzwqL3P5gfGYS8FtlelKY8FaGhdo27qhsrxC5762XUoPDywbF+Pw4/Rr4MbXdWStCN3
         BX6+YOfM9UE9NJf2sf6psIkjpsMYoodZAnOZdyqW4BPDS0ioW3ArP3jpPIy/WpS5sUVt
         mEnyDpmJaHqYVHUKf9FLAa3IcO3C5ptuILcGJa9RWU22hzjP64ICDBP8vSh1aSRuErjV
         WU+kRx3iG65i5xsGLzhLwRdaNUEGtzaIfy82pwb02BSLE48bGxYH95soLTuHQtqyTwP3
         ZeMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EtRmGWRR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020ac8574c000000b00342f85b668bsi1621695qtx.92.2022.09.27.10.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 10:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EtRmGWRR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odEaW-000621-8Y
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 13:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odEaE-00061B-Lj
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 13:41:26 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odEaC-0003HF-KU
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 13:41:26 -0400
Received: by mail-ej1-x636.google.com with SMTP id sb3so22209432ejb.9
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 10:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=8u3AVihglAkdz6OkHdZN1ld0QmEhCcRwpssqab1F93Y=;
 b=EtRmGWRRC9PRJ+K5at5j4u7n65Xy3ZtFORohLg/+ULPbF6cp8r2gWKb6yKtZDqkmU4
 3LvlgXudeyppcMVa34C8EbKZ5J3+ZjZ24WUsRBxzc/z9aSeARNMmCrfmKajnz1UscsA1
 ptdkY3ZSoA8wo9IHaXicaG+CqEzPGJV+nNGtqKVjGrco8W6fq3KEUI6SabtcyPDYlDZ7
 +j9ev5nSfnRlKmXNw+tY23026i9oy+CuGzqExjl2pQAz+wRNQ6C2kJpihWuPkqgiqsBU
 kk1Ej2AIr8whSgHRWTMt6tndeTBY+xS1fa2HSn6HziV9yKYPL8DobOfCNDX7zm3+Zswp
 pOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8u3AVihglAkdz6OkHdZN1ld0QmEhCcRwpssqab1F93Y=;
 b=2/DTaoC0iom2TQbx3bjmKxh27oWJ3M9i+OfMhHnNWqbiOGiDyAstGy6r3C7Z2UqT0w
 aLkT1fThQjYTUpDLZETdmRLJUQNhQ767gt7YY+vMgM6LJUSfTtf5YerIa2iKMPE2TsmU
 uXeOaY15YQhmlm//mLK9UtrnafC85ZMISOatRxfTWZ67bIYEoeVR/jp7fGIISu8kybIG
 T6G4DtxcFXvq+ke7lBhZCzF5n3YH8FXKvGHY1NJTTn9k5g/JUQF8/FoniqZwrOOJp89Y
 k9Q9IPDwhPPZN6k9xpuUzlUKnazidxoPXL4ofwHmpaEJdNlZsKGZZ3l0+f7xyg2GL9z7
 drmQ==
X-Gm-Message-State: ACrzQf3OnGdioV0RQV0joK57xhgRG42VpBVQCOQljosU4Uu5Gfgme0Zv
 F8QDdwPiIBjNxmeSkkQP9IwBAyMz61wzeFpKX60nGQ==
X-Received: by 2002:a17:907:724b:b0:782:f2bb:24d3 with SMTP id
 ds11-20020a170907724b00b00782f2bb24d3mr15519334ejc.555.1664300482405; Tue, 27
 Sep 2022 10:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220927164920.1502219-1-peter.maydell@linaro.org>
 <51698c38-468a-83e7-5ff0-be2175f1e17d@redhat.com>
In-Reply-To: <51698c38-468a-83e7-5ff0-be2175f1e17d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 18:41:10 +0100
Message-ID: <CAFEAcA95hJ-=yLqEg=3pmPsgxn0z1ad4w1fzCk=PduUwH=EVNA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/kvm: Retry KVM_CREATE_VM call if it fails
 EINTR
To: eric.auger@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
X-TUID: tGVXC169m+70

On Tue, 27 Sept 2022 at 18:07, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 9/27/22 18:49, Peter Maydell wrote:
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
> >
> > v2: correctly check for -1 and errno is EINTR...
> > ---
> >  target/arm/kvm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index e5c1bd50d29..356199c9e25 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> >      if (max_vm_pa_size < 0) {
> >          max_vm_pa_size = 0;
> >      }
> > -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > +    do {
> > +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > +    } while (vmfd == -1 && errno == -EINTR);
> shouldn't it be errno == EINTR?

Augh. Yes.

-- PMM
