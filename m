Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp1640654ejb;
        Tue, 14 Mar 2023 10:05:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set/uzjRlcj1hOO20rxBaEzMBk/3h3FKJ2YXTZEVmVU0uSexa0td85A4bB1JYs7JgjEj6NUiY
X-Received: by 2002:a05:6214:2523:b0:56e:a290:aa92 with SMTP id gg3-20020a056214252300b0056ea290aa92mr23230787qvb.9.1678813527895;
        Tue, 14 Mar 2023 10:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678813527; cv=none;
        d=google.com; s=arc-20160816;
        b=b0j6RcBAOYmDgXNJi5SD9oiy+4vvmxRZxGvcTd25dUV9ozh2i0rXdQte6nXgG0Bjm8
         1oXltizIw081Us+w7xOJAwBAREbvJgLvowlzf55z7gt0QwcBA1veMaAzYPOMKHLYVf1r
         UN9WCpmTjjOo7Xs8uQhz0qgEYf+3k8dODJNiV8ayzKnGsGITYaMvWzbmgZIPv8TjHbFx
         2JH2S27xxfhSRc9tpW+lc8PmvCtoAF2wZ9WZxpmeVY15dq5vlxLeNKCdWAXgGDiFAlXV
         4JxDhkpr+CSd8xYzPDOvJBCxoB1BygPbRNthrQW9pjQCijfAh98vFFgFcdthinZND6mf
         iJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sMG7llfNtooNocOJENG6MuSVf6E1WqgGs6wzJsB+Zs0=;
        b=AC37fQm7khB0jv3CBRXy2TCKV8Zd6OgOdWozkZj4JjQnUtSsg7QXasZqdO2qVxQAiJ
         JeFXvz/0ijtFB2+WMf65Ff2B2B5OUYZWWQKN0zW4ppH03XThKCB73te7+8FTieTojvTa
         5DVqYjKrO8pWzf6Zl7gOgSA6B/qR4Nsho4gpzb6RCOUG/aEq4iHNmUBCPK6C6CrYj9xz
         MQAxNKTNdX5Vd0zUmxn1FSsGuEIS3IGDax4LAFRUuYqgas3TK54Brbsav/o1EAQwn2wW
         kc+idhmiRzqIKD96sZGYDVc78G2qm4/p8jeSqsd7zmUqB6b5LX0Nf4A3hDT10+xcDKdk
         fvow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wyEcx1PC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a0c9c03000000b005a2fcc11fa4si2193632qve.513.2023.03.14.10.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Mar 2023 10:05:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wyEcx1PC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc85U-0003J1-Ga; Tue, 14 Mar 2023 13:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc85P-0003HS-2O
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:05:19 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc85M-0005Zv-EQ
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:05:18 -0400
Received: by mail-pl1-x633.google.com with SMTP id p20so17254674plw.13
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 10:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678813515;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sMG7llfNtooNocOJENG6MuSVf6E1WqgGs6wzJsB+Zs0=;
 b=wyEcx1PCTRmcJX3a68BxmG2ik+nrga9JPDQxJ1iEYlGsBEqJUYs2Oy06rQr44ReUD7
 47AFT5LWff8aCf0HishlREJxFad6aIH1RKovYRLri9tasZgHJEIOGC232YtjTYv4AouG
 dw09TttNHyY3wS0HBwg8E1VlBdvvrNUajI28t2qx0S+oTIQc/BdGG8v2V2oj46gHWDiW
 rLLa58rLDGjHlJPQ+jDJ8bv8iN7VY7XutTfGfdm3glqZb14PLutpTK/sGxg5bav/orms
 K2D406tp1csV7L/FKeJKNYQJ90gkXdJnkrdSTFu8zayRcnT4aPI7AAoPunZ/A9eXXL2i
 nyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678813515;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sMG7llfNtooNocOJENG6MuSVf6E1WqgGs6wzJsB+Zs0=;
 b=7z2Ut/VivK4OaTOsx6Qk79Jw1QT/nMTRSdV15dE9CIXGI+Hxmv9tA/1K8l1MciNx5v
 RjVN/x9R1hko+bjjaKL9UApoZKOMggdAiuJ2iHz2/uEcs3AqDqd1PIFAHclnSptcMlQT
 rWPeGyfgRbzXesEO70jg7wEKUoPOnGIRO1dCwDBr1bg6I4XdafAdLcU237hbPWv9uTQ1
 dNQ4YAyh0LihDGIhRNQE8pGkYqaXcR40gTaI8qnS60CQ8b2R2Et+g32uR42GQSPesaGN
 am3CEDNHAXwGN0tJI1BJrRYPbgzS5PxDsASJS3w3630j7jOT1e1UBG+n38iqkq/qDosI
 PjJQ==
X-Gm-Message-State: AO0yUKV7uRobiHmfwq7b3MSreAlA1f13Y+LmC8zjiv3EDooqN/6cHqAQ
 8UfDby+habhsqOBUf3+rgjQPIPfNLEsmZ7kXHfvSpw==
X-Received: by 2002:a17:902:fac6:b0:19f:3b0e:a463 with SMTP id
 ld6-20020a170902fac600b0019f3b0ea463mr3959106plb.9.1678813514827; Tue, 14 Mar
 2023 10:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230227042629.339747-1-gshan@redhat.com>
 <a4a28aca-449e-0b95-c3ca-e036b82d76e7@redhat.com>
In-Reply-To: <a4a28aca-449e-0b95-c3ca-e036b82d76e7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 17:05:03 +0000
Message-ID: <CAFEAcA_heAVWgcc8MsXovbOoea4NziBXZjNDLKpd1rF7cFoVDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/arm/virt: Support dirty ring
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com, 
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org, 
 zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8v9qNOqrYRnk

On Mon, 13 Mar 2023 at 07:13, Gavin Shan <gshan@redhat.com> wrote:
>
> On 2/27/23 12:26 PM, Gavin Shan wrote:
> > This series intends to support dirty ring for live migration for arm64. The
> > dirty ring use discrete buffer to track dirty pages. For arm64, the speciality
> > is to use backup bitmap to track dirty pages when there is no-running-vcpu
> > context. It's known that the backup bitmap needs to be synchronized when
> > KVM device "kvm-arm-gicv3" or "arm-its-kvm" has been enabled. The backup
> > bitmap is collected in the last stage of migration. The policy here is to
> > always enable the backup bitmap extension. The overhead to synchronize the
> > backup bitmap in the last stage of migration, when those two devices aren't
> > used, is introduced. However, the overhead should be very small and acceptable.
> > The benefit is to support future cases where those two devices are used without
> > modifying the code.
> >
> > PATCH[1] add migration last stage indicator
> > PATCH[2] synchronize the backup bitmap in the last stage of migration
> > PATCH[3] add helper kvm_dirty_ring_init() to enable dirty ring
> > PATCH[4] enable dirty ring for arm64
> >
> >     v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00434.html
> > RFCv1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00171.html
> >
> > Testing
> > =======
> > (1) kvm-unit-tests/its-pending-migration and kvm-unit-tests/its-migration with
> >      dirty ring or normal dirty page tracking mechanism. All test cases passed.
> >
> >      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
> >      ./its-pending-migration
> >
> >      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
> >      ./its-migration
> >
> >      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
> >      ./its-pending-migration
> >
> >      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
> >      ./its-migration
> >
> > (2) Combinations of migration, post-copy migration, e1000e and virtio-net
> >      devices. All test cases passed.
> >
> >      -netdev tap,id=net0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown  \
> >      -device e1000e,bus=pcie.5,netdev=net0,mac=52:54:00:f1:26:a0
> >
> >      -netdev tap,id=vnet0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
> >      -device virtio-net-pci,bus=pcie.6,netdev=vnet0,mac=52:54:00:f1:26:b0
> >
> > Changelog
> > =========
> > v2:
> >    * Drop PATCH[v1 1/6] to synchronize linux-headers                            (Gavin)
> >    * More restrictive comments about struct MemoryListener::log_sync_global     (PeterX)
> >    * Always enable the backup bitmap extension                                  (PeterM)
> > v1:
> >    * Combine two patches into one PATCH[v1 2/6] for the last stage indicator    (PeterX)
> >    * Drop the secondary bitmap and use the original one directly                (Juan)
> >    * Avoid "goto out" in helper kvm_dirty_ring_init()                           (Juan)
> >
>
> Ping, Paolo and Peter Maydell. Please take a look to see if it can be
> merged, thanks!

No objections here; I'm assuming that since it's only touching
KVM core code that it would go via Paolo. However, as a new
feature it has missed softfreeze for 8.0, so it'll have to
wait until the tree re-opens for 8.1.

thanks
-- PMM
