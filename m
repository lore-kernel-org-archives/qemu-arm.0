Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1583976lfb;
        Fri, 27 Aug 2021 06:27:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmTvQF3S2W4VBcqhPiG/2r3iHok7wuxil+yGcvwOV2+moeyjE7xHpY49hYRn8kJ5s3hobn
X-Received: by 2002:a05:6402:505:: with SMTP id m5mr9747690edv.217.1630070839961;
        Fri, 27 Aug 2021 06:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630070839; cv=none;
        d=google.com; s=arc-20160816;
        b=iTY3mJt8fITh5WkebeCIZHc8kp9OcNejjdiixLCd5ZvSDVG+ZIKSXoxetyHRPRY76S
         t+L/QaNmA16JEz9KGE4hRMp3fpu3FyI+5Peaue0edagE89VdPViwwydQl80dsEdLnxqG
         gzUUFEF4/oorRz9HeMWsXbiw21oGthFzG6Nb74VRDHhwubt7MlYj1iWWbLLgG09YK4aA
         jbj+OFrH2cVneDquVQVRLzC/fyUhoR4vz1Uqyuo/BsVP6290ofZZMu2CQx4MEUHZraKa
         kXJh3kslF3796t4+jjErqLeB34//Xg8QXTi6cIsyFpW08VJKA1fUINotA8nDNBS9h+x5
         n9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Ut2olzrp9AuPu5yCw+i3exqRUeLcgNF0bC6la2O5LxI=;
        b=mgtDunB9PCy/YwIAdOMS6mEqOaRzC4EwqGh6I5P5kITTQ59ILw0kMcqDr9cxxQHuaJ
         EbXgoIRohrFwa5bj2OfBo9PrxWnXf2YXbhZ+7JxU6epKpExny74LRAZN19Zo0rlFsSfn
         mfME6AWfquwsFqS8ZP9t1HSKH2jx8zhJKyGWPf0MfgZtEV9u+kCJfjg8tyhQV4+/bFzW
         1gky8w1NTjsYOUZiskJeb5L4yQU3itRv/8BHKVVPaD6IdncfVFivSpJ9uMGvpgl+KdPE
         tnji7BxYHMZjImxMBPT+Mx9AvENkiTdzqQo/AG5GRUiEUnMNibL/hjbkrcFl6wkBmtPY
         phpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EWkbx+RF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id nb18si7285059ejc.555.2021.08.27.06.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 06:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EWkbx+RF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJbt9-0002s8-1A
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 09:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbsw-0002rX-5i
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 09:27:06 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbsu-0002Dq-Ln
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 09:27:05 -0400
Received: by mail-wm1-x330.google.com with SMTP id i3so3882719wmq.3
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ut2olzrp9AuPu5yCw+i3exqRUeLcgNF0bC6la2O5LxI=;
 b=EWkbx+RFeIoqJA7ckRbNNDuaT2xWAmPm5Co5oXN64l06zowFUSIVR5+5fYBi8F4ejk
 EZooUrTIBsvrnwhXMDEcXFDcUxvbEoDiVxFRKVKMxLjPVwrs6sS7VtcaziwiNiah3oGI
 //pWysg84iBpZEYZL9pAgQCBHujjECjw77XhEbpGGoSOO+TN6V4kSkPjgTGRLqK6TYBx
 kDfxHBbG56hsb4wzzfJhrAdRqclOSVGDIWJWFT7fPXsky6gNA5zMklNK2Gq/Z2Sz2xsU
 VozYwbpSi+IMhioBZxMYHp8QN9+CDQ8X06z0viH7BmQLxxLtaMW5Q4y9+ZD/puVampS+
 x6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ut2olzrp9AuPu5yCw+i3exqRUeLcgNF0bC6la2O5LxI=;
 b=fsKHQjjKkJKzpOpyIVUvELjhspgvIMRI7ttaokEPEywOdhdEgkNi85dL3Vyi+1kBe+
 leUwy0jLg6LXTRg4OK8T06Nzn8347RX3ZxbP23ZHb73/xYae3Nbik/IM+Q+xJHHHr+Xy
 SWDRycqFvFq9Sk6xMca5vCQdI7uiDWrI07taG5UyM5d5QY1W/ySMAyMWjWVKsJEf0+32
 WX6PWp+WaEJAlCQAJfFS+m8QGLokTX98TSDxiVlWmRuC9a2zKwCSrBtVaKX6SlvkQEBq
 c2Z2nqmQUXYz/Z1lWRJNIuizlnjHqPKsoPC6BjzpXYfg/FV6JFenF6BoE5P3LimtrhN2
 E03w==
X-Gm-Message-State: AOAM530NHgpPq4gdN6w0PDgkgXbCHVMO6IbMt94zmt8c2FPT4ZqqgLUk
 C7WTvTSUYRFByOnSEutZ3uTkQw==
X-Received: by 2002:a1c:4407:: with SMTP id r7mr20155324wma.150.1630070822011; 
 Fri, 27 Aug 2021 06:27:02 -0700 (PDT)
Received: from larix (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id q195sm5743923wme.37.2021.08.27.06.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:27:01 -0700 (PDT)
Date: Fri, 27 Aug 2021 15:29:12 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 4/6] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Message-ID: <YSjoqGLKjcwCeBtn@larix>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-5-jean-philippe@linaro.org>
 <71dc152e-269b-fc32-e478-e2164008ff04@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71dc152e-269b-fc32-e478-e2164008ff04@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oz52xqQ19ReK

On Tue, Aug 17, 2021 at 03:42:22PM +0200, Eric Auger wrote:
> > diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> > index 770c286be7..f30eb16cbf 100644
> > --- a/hw/virtio/virtio-iommu-pci.c
> > +++ b/hw/virtio/virtio-iommu-pci.c
> > @@ -48,16 +48,9 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
> >  
> >      if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
> > -        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> > -
> > -        error_setg(errp,
> > -                   "%s machine fails to create iommu-map device tree bindings",
> > -                   mc->name);
> >          error_append_hint(errp,
> >                            "Check your machine implements a hotplug handler "
> >                            "for the virtio-iommu-pci device\n");
> > -        error_append_hint(errp, "Check the guest is booted without FW or with "
> > -                          "-no-acpi\n");
> We may check the vms->iommu is not already set to something else (to
> VIRT_IOMMU_SMMUV3 for instance).

Since that check is machine specific, virt_machine_device_plug_cb() in
hw/arm/virt.c may be a good place for it. The change feels unrelated to
this series but it's simple enough that I'm tempted to just append the
patch at the end. It also deals with trying to instantiate multiple
virtio-iommu devices, which isn't supported either.

Thanks,
Jean
