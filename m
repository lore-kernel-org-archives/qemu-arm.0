Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3417414ejb;
        Tue, 21 Feb 2023 08:28:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8t+WV3toZt22V8IQEokvkZa2PUFXPyJSOinGijguycMeXMIglDC4doaL6edgJnamu2tlMw
X-Received: by 2002:a05:622a:1821:b0:3b8:3150:d229 with SMTP id t33-20020a05622a182100b003b83150d229mr7502007qtc.51.1676996898008;
        Tue, 21 Feb 2023 08:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676996897; cv=none;
        d=google.com; s=arc-20160816;
        b=RrEuYA1EbxF33S+U8BtaY3PYVcU9ottWGuQA35BVTOg5Oac22MNuVGyJCoTmFEH69P
         55W2RtB5NkTcuBxe49CGH1Jkknxlb4XV4aqx6eFvvXUYrCZ8rMZ4NVlIf0KYfNXtCeNX
         AESpwPZd4rUmVvI5uyTITCZf0XHOz2/Mgeiu9gpTdq+UkOLflSqiGWR2grdtfzxyV2Al
         S8/vRxGc8XaH9CF6auQtvx9XQjuygmuxrlX3OkxMUeXnLOVhGOyqTr+4Wey/G3qNzOHn
         HY+NAyg5Ow3XsRoLqovJAWZY+o2w8ED4lj9UhYTOloDRUT3SsGHjhyw4+0bgTZRUuhX1
         QoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7adh5Zpsike9uLB2dGKjB3/gxohGFUl9F2wMIS5DEeI=;
        b=W+WSoXrCHO9ov0eiRfV6lymH87NZkbDCpODHo4CFQ0qldV7YfCEyFV1JUNBmWQZDjc
         +/2ifwVVZr8BG29mLoUjMoLoP139g2uByCcEK4L5IY3fM7mjg18Mepd1xt8Bd58rJHTM
         m2QezM7paFkYv//2iIbJd/VXZLmgsfPiAc996hfWPEObX64gKThf2M4fUXpMjNoPCQhJ
         CDoFMisJhwjdxXMjX3G6vSu4leFbwdoFZSBA9gbhUhBfKJ46c7IQttrEor4mpfectkvI
         H3sEiaWFcg8bKWHCkK3CdgDvAe+tSqdANFMaeilh9i9qTHCxLQqfUJN1gTnAljnggQfb
         Q/JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6Lb9h4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt30-20020a05620a479e00b0073ba324ef6dsi175997qkb.104.2023.02.21.08.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 08:28:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6Lb9h4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUVUc-0000Tm-4q; Tue, 21 Feb 2023 11:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVUa-0000TR-Ny
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 11:27:48 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVUX-0003pQ-OQ
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 11:27:48 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 co23-20020a17090afe9700b002341fadc370so5473118pjb.1
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 08:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676996864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7adh5Zpsike9uLB2dGKjB3/gxohGFUl9F2wMIS5DEeI=;
 b=S6Lb9h4OjaaUk4GMngr3Dew9XWSmrTKr8hUbsbSj2ZXELR70SNqxfQKs7yKW32dWOC
 5au9f+7f5szdfeIUsnHK2zqt7kalbzE2CjMLkedbsOqVOBBG1+5sd79medgwYjx5wbWZ
 oHQAu2k6+pWtf2ALP1ee8g+uJwnC9x7AvBYcQV3ADeq7BqSCVd7uQ0KJN6pkPO2JTjVh
 8HwPtaMeTz3N9Bzpga4ZkjxawGf3CShvMqXVUoD8OUihuVK7E3g6IV9C2a706vSCYv7n
 qKRZLJ+rpKkzi9avsXJmzhMNfN9q04jou01xg+UHQhbo8VXvNEJXHUtoeNNrexTT1ejR
 1JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676996864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7adh5Zpsike9uLB2dGKjB3/gxohGFUl9F2wMIS5DEeI=;
 b=zEwmISxzD0amOV2Yhu10iwnwD2ZgctPs3MgtVLP/aBtn9JMsvXcyYWCatvhxN1klxl
 +sBXrBTNWSl2ua5zl7/lDdPcSqEPxPyJsu+g9tWqeIlkto7OVTBVYekt3MwIENi14WAH
 e4vHQVK74gtTPSy8+Z3PR5TZksj5sthniNkXs6fpxnsGQ7rF5PfG8PluTTH3ka4AfB/Q
 jETIHsD26/bFTRXPpyR5kdVKm1/WvQ78IcxTCdWoA3vZOSRJj0lXqbVu65bQGLEx36AV
 MJ9BSWrM/rE4W2olKLiq3wxgLw+FjIAs82j+H14ADayNIp+U+x4bxnJE93wBNhexaWOd
 VV7Q==
X-Gm-Message-State: AO0yUKXp5ELRlgLW1MupuCUmBOsuocWC10oRGAbQf6gHT7uxRV2MyLKw
 Ire6qloOmaDqSLq2V9fcB4Q4XFYGrj0vS4EJDCew3Q==
X-Received: by 2002:a17:902:ab8e:b0:19a:721b:bce1 with SMTP id
 f14-20020a170902ab8e00b0019a721bbce1mr845150plr.23.1676996863917; Tue, 21 Feb
 2023 08:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-6-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-6-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 16:27:32 +0000
Message-ID: <CAFEAcA_6pYvot1AGKfOQA89M9tdH-e6+9jkd3RtXJkGhSLdihA@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] hw/arm/virt: Enable backup bitmap for dirty ring
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com, 
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org, 
 zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RL03XfdoyifV

On Mon, 13 Feb 2023 at 00:40, Gavin Shan <gshan@redhat.com> wrote:
>
> When KVM device "kvm-arm-gicv3" or "arm-its-kvm" is used, we have to
> enable the backup bitmap for the dirty ring. Otherwise, the migration
> will fail because those two devices are using the backup bitmap to track
> dirty guest memory, corresponding to various hardware tables.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>  hw/arm/virt.c        | 26 ++++++++++++++++++++++++++
>  target/arm/kvm64.c   | 25 +++++++++++++++++++++++++
>  target/arm/kvm_arm.h | 12 ++++++++++++
>  3 files changed, 63 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 75f28947de..ea9bd98a65 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2024,6 +2024,8 @@ static void machvirt_init(MachineState *machine)
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const CPUArchIdList *possible_cpus;
> +    const char *gictype = NULL;
> +    const char *itsclass = NULL;
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *secure_sysmem = NULL;
>      MemoryRegion *tag_sysmem = NULL;
> @@ -2071,6 +2073,30 @@ static void machvirt_init(MachineState *machine)
>       */
>      finalize_gic_version(vms);
>
> +    /*
> +     * When "kvm-arm-gicv3" or "arm-its-kvm" is used, the backup dirty
> +     * bitmap has to be enabled for KVM dirty ring, before any memory
> +     * slot is added. Otherwise, the migration will fail with the dirty
> +     * ring.
> +     */
> +    if (kvm_enabled()) {
> +        if (vms->gic_version != VIRT_GIC_VERSION_2) {
> +            gictype = gicv3_class_name();
> +        }
> +
> +        if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
> +            itsclass = its_class_name();
> +        }
> +
> +        if (((gictype && !strcmp(gictype, "kvm-arm-gicv3")) ||
> +             (itsclass && !strcmp(itsclass, "arm-its-kvm"))) &&
> +            !kvm_arm_enable_dirty_ring_with_bitmap()) {
> +            error_report("Failed to enable the backup bitmap for "
> +                         "KVM dirty ring");
> +            exit(1);
> +        }
> +    }

Why does this need to be board-specific code? Is there
some way we can just do the right thing automatically?
Why does the GIC/ITS matter?

The kernel should already know whether we have asked it
to do something that needs this extra extension, so
I think we ought to be able in the generic "enable the
dirty ring" code say "if the kernel says we need this
extra thing, also enable this extra thing". Or if that's
too early, we can do the extra part in a generic hook a
bit later.

In the future there might be other things, presumably,
that need the backup bitmap, so it would be more future
proof not to need to also change QEMU to add extra
logic checks that duplicate the logic the kernel already has.

thanks
-- PMM
