Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp539743lff;
        Thu, 12 Aug 2021 09:59:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxckvuk18T64t+gqrFlEjyBQIyfb7TTX0sMQRal0UyZ9665wfF4I9x6thweNRQl7VZW0++m
X-Received: by 2002:a05:6638:419a:: with SMTP id az26mr4587844jab.70.1628787581706;
        Thu, 12 Aug 2021 09:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628787581; cv=none;
        d=google.com; s=arc-20160816;
        b=xEUUv8TI1zU/3Ggr4gUqm+umILeREZ8mDmE0015XbuMa102FMscPNXDHfzqcNQv76D
         NH8fmnHijORbdBN//vMCW9fFwMmiLGf/WzZKXUBUSoDOoGmadMgH8iPNtL0aZ6DcnEnn
         VMw50KtCMIiFvwTaGE2UGHP0clALN9VRyQ+Gd4t24zWvwKq9LHdrGB0gOrU1ZxyxLZIK
         8ig3GtFAI+cxmRIZmel/+Uc1lfjqrRufBq7BNQIXs3P3/FMsH+sb3rnoumnO3COWxCqF
         Yqlt3ZWS3pW2RNxeKCjdt6CMnIWiEs767SmWkAx1YSbg/9wakpryvsuTXZMPUrotqmXU
         BP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=7Cz2NY+yZmpnb1sh7gEY1+iErXM+pf2N+zjyQd5cJRI=;
        b=wyKuz09tCrW6MuduQTSqVbE9SWIP1UWv2QSzIBiJVk4SWyodMmPFQyC6d2EA/u3aF0
         eyZBBOZfZdNjzgciF5scy7QzsxWbtZssDCWW+PMlvWUeMG2JVq23XzNvbbl3KeIkZ8jh
         pzKl8hdBABpStgQrTDEgt239M8CrYQeC3AX6qQSnb93OSkE/Nnv04T/c28BVvzMwUEZL
         UUaKMrX8VHchWkVcsnp2MoWzE4BYI/sznpOgtT4pEGlArTMCyHBQruJPRsoqwy89h5k6
         mejemV+UwQK27/e2XUJdYKQaeaa6y4znTXyPObvdLFSw1yzr8ksBHON7Xua/UoMD5Qiz
         G2vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NkxkasaG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7si3599014jav.38.2021.08.12.09.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 09:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NkxkasaG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEE3Q-0000tA-UL
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 12:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDyq-0001ID-Ur
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:54:56 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:36692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDyp-0006ZN-4Y
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:54:56 -0400
Received: by mail-qt1-x832.google.com with SMTP id w10so5765862qtj.3
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 09:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Cz2NY+yZmpnb1sh7gEY1+iErXM+pf2N+zjyQd5cJRI=;
 b=NkxkasaGO8bVeuawaDKnPVMaWSvqkRTZNCJMXvePsmBt9VorvtGwGss643a+ERJfyV
 grFru0exBgkHrX+8xAtr10TDEzqcP8Jnmw73a/WZ5OirsFj+1lR8+2GG7d/kpoNr5Aed
 gvVfYpx6Z0l1CVro28TFPIT1VKrk8aA3DOR1VEc2Weyl7Diea3l9tkppbBnv7HTd/Ku4
 s+h2SFliwIjbqsNtPNZIuBWqrYLIkaiFXE4tkEjaeXRWNmcr17/ZWP3WP4EAJT+6Yz+A
 uuHRZm0Gtfqtowxth/HbqUParjHJwj2QPPmqkNQPuFVDlVkqBDlPSl/WHPBvLyNOVnLK
 ZdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Cz2NY+yZmpnb1sh7gEY1+iErXM+pf2N+zjyQd5cJRI=;
 b=WoUPjUYmUnujfFrXQN+SPIF+M+APyBfKjWAzrCrz5KCZxnMOgpF+JlYX7eEyVXK/Dk
 FAg6AlIkWBnWy3OITGWNLi35u1CnLYJGM5Yj5R+J/KaC567ZFu97n1LvuZdCfZJHWbY/
 SKy1xMvMrMsYO4DZjg0uQCL3tDqkJJ03HfUVq2r4B/N2R6ziCN8sayijCafXz6Z/G/tB
 JMEKcA1nPtzgZ5w3JeMw9J2oCZyKsqeUaRYqf6n4ChcWY2VF1ty15Qqek089OnhVAcCN
 +RHKoIGJpMFD0oemjupwYTWcgMJPOSiKTWO778SlyNDaYOHD5aBKWv3Jybh6+unpDTih
 s7FA==
X-Gm-Message-State: AOAM530WOKE1u7NZgFSeDrLV9nlguh/0bIyuOK7WW1/2MHXsj43cXAk0
 o0eJUsW++fMvQ3ncUKZF0EYwAA==
X-Received: by 2002:ac8:7e8a:: with SMTP id w10mr2219230qtj.391.1628787293979; 
 Thu, 12 Aug 2021 09:54:53 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id s7sm961807qkp.105.2021.08.12.09.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:54:53 -0700 (PDT)
Message-ID: <d74939437128465b828d0c3c914965ddbb9b992f.camel@linaro.org>
Subject: Re: [PATCH v7 09/10] hw/arm/virt: add ITS support in virt GIC
From: shashi.mallela@linaro.org
To: Igor Mammedov <imammedo@redhat.com>
Date: Thu, 12 Aug 2021 12:54:52 -0400
In-Reply-To: <20210806130937.1a354b30@redhat.com>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-10-shashi.mallela@linaro.org>
 <20210806130937.1a354b30@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, rad@semihalf.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 leif@nuviainc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TqtF6yd/iEJt

On Fri, 2021-08-06 at 13:09 +0200, Igor Mammedov wrote:
> On Thu,  5 Aug 2021 18:30:01 -0400
> Shashi Mallela <shashi.mallela@linaro.org> wrote:
> 
> > Included creation of ITS as part of virt platform GIC
> > initialization. This Emulated ITS model now co-exists with kvm
> > ITS and is enabled in absence of kvm irq kernel support in a
> > platform.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/arm/virt.c         | 28 ++++++++++++++++++++++++++--
> >  include/hw/arm/virt.h |  2 ++
> >  target/arm/kvm_arm.h  |  4 ++--
> >  3 files changed, 30 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 81eda46b0b..99cf4f9dbd 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -583,6 +583,12 @@ static void create_its(VirtMachineState *vms)
> >      const char *itsclass = its_class_name();
> >      DeviceState *dev;
> >  
> > +    if (!strcmp(itsclass, "arm-gicv3-its")) {
> > +        if (!vms->tcg_its) {
> > +            itsclass = NULL;
> > +        }
> > +    }
> > +
> >      if (!itsclass) {
> >          /* Do nothing if not supported */
> >          return;
> > @@ -620,7 +626,7 @@ static void create_v2m(VirtMachineState *vms)
> >      vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
> >  }
> >  
> > -static void create_gic(VirtMachineState *vms)
> > +static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
> >  {
> >      MachineState *ms = MACHINE(vms);
> >      /* We create a standalone GIC */
> > @@ -654,6 +660,14 @@ static void create_gic(VirtMachineState *vms)
> >                               nb_redist_regions);
> >          qdev_prop_set_uint32(vms->gic, "redist-region-count[0]",
> > redist0_count);
> >  
> > +        if (!kvm_irqchip_in_kernel()) {
> > +            if (vms->tcg_its) {
> > +                object_property_set_link(OBJECT(vms->gic),
> > "sysmem",
> > +                                         OBJECT(mem),
> > &error_fatal);
> > +                qdev_prop_set_bit(vms->gic, "has-lpi", true);
> > +            }
> > +        }
> > +
> >          if (nb_redist_regions == 2) {
> >              uint32_t redist1_capacity =
> >                      vms->memmap[VIRT_HIGH_GIC_REDIST2].size /
> > GICV3_REDIST_SIZE;
> > @@ -2043,7 +2057,7 @@ static void machvirt_init(MachineState
> > *machine)
> >  
> >      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
> >  
> > -    create_gic(vms);
> > +    create_gic(vms, sysmem);
> >  
> >      virt_cpu_post_init(vms, sysmem);
> >  
> > @@ -2746,6 +2760,12 @@ static void virt_instance_init(Object *obj)
> >      } else {
> >          /* Default allows ITS instantiation */
> >          vms->its = true;
> > +
> > +        if (vmc->no_tcg_its) {
> > +            vms->tcg_its = false;
> > +        } else {
> > +            vms->tcg_its = true;
> > +        }
> >      }
> >  
> >      /* Default disallows iommu instantiation */
> > @@ -2795,8 +2815,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
> >  
> >  static void virt_machine_6_0_options(MachineClass *mc)
> >  {
> > +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> > +
> >      virt_machine_6_1_options(mc);
> >      compat_props_add(mc->compat_props, hw_compat_6_0,
> > hw_compat_6_0_len);
> > +    /* qemu ITS was introduced with 6.1 */
> > +    vmc->no_tcg_its = true;
> 
> given it's not going to be in 6.1, shouldn't it be moved to
> virt_machine_6_1_options() with updated comment?
Agreed,moved to virt_machine_6_1_options() and updated comment
> 
> >  }
> >  DEFINE_VIRT_MACHINE(6, 0)
> >  
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index 9661c46699..b461b8d261 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -120,6 +120,7 @@ struct VirtMachineClass {
> >      MachineClass parent;
> >      bool disallow_affinity_adjustment;
> >      bool no_its;
> > +    bool no_tcg_its;
> >      bool no_pmu;
> >      bool claim_edge_triggered_timers;
> >      bool smbios_old_sys_ver;
> > @@ -141,6 +142,7 @@ struct VirtMachineState {
> >      bool highmem;
> >      bool highmem_ecam;
> >      bool its;
> > +    bool tcg_its;
> >      bool virt;
> >      bool ras;
> >      bool mte;
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index 34f8daa377..0613454975 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -525,8 +525,8 @@ static inline const char *its_class_name(void)
> >          /* KVM implementation requires this capability */
> >          return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
> >      } else {
> > -        /* Software emulation is not implemented yet */
> > -        return NULL;
> > +        /* Software emulation based model */
> > +        return "arm-gicv3-its";
> >      }
> >  }
> >  

