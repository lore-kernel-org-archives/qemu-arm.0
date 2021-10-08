Received: by 2002:a0c:90cc:0:0:0:0:0 with SMTP id p70csp1803133qvp;
        Fri, 8 Oct 2021 08:26:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDjC+yOi+7S2XJPsyqgjzbzS5ZzY79KdU1KHD0TMCe3aoWAnEN55Qme9ys2KkSTA7Y1Elg
X-Received: by 2002:a05:622a:202:: with SMTP id b2mr12366208qtx.205.1633706773217;
        Fri, 08 Oct 2021 08:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633706773; cv=none;
        d=google.com; s=arc-20160816;
        b=GeAKkhdCnCTR6cPJFFluFHFZ16PJvYsAIq8rqQRJDPz7q8k5STS8BFv0yvsXHPn635
         EE5qnGAQqt2gBBGZA9z0ltrq/0oS19AyQClAFnbzDxT4B3vWIlGTyHF6DECMfhE7suQU
         awX0HUHSGxILUdaNuvr5JEbKLzRspjL4LKNhIiwdGniNZARqjR2Y8uqfvmBEFEW8jZek
         fDvZd9Z2mUY2WcxS3wKzHPgn8DnqHE97t58Ug1wmyqE8OcuXlS8ijferyPE46cfzZnxo
         b/9mRxo0J9OShrixZOwPZ+XpcNLB4VFLdi4Ml0UjaI/dE6kplZpKXS4nenCigMyXrZLM
         F99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=VNabXKhYcjV6fLHI6e8xkRNQIZAKA0eLj8zphGSrurc=;
        b=yQ+JPVo0jcZcrAgvM70/MucOLra52riHtx3/4I5mA3RetbB1pNNzs7FR3M2hmKbWpn
         paTq9mwLV7aPb7Xl9asFZGKbuz6VBzcGDfFUY6Fh60A5rh1+wXkSE+t2gid5YsI0rXqw
         /z6WQ2R9HvbjPZh9fRPByJDfFuQEE/6ks9RzFzczu8SMY67iK6wb7XAONcUC4QsddQJz
         7DKNQqgbp1TShDQGHIcb8P//TnvCO7ftOvr0dRrUWiFjjXsO5jJ5/U2MClrfvRE3W/nj
         ToTrcXdlgS/csGwr5ZEezbnCwKYQTA/xrx9e3FQ88eEhzjhgWsvj7O/Jor3mF0s0hosE
         OB9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rn4i3PVo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk7si2877180qvb.124.2021.10.08.08.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Oct 2021 08:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rn4i3PVo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYrlE-0007lL-Pq
	for alex.bennee@linaro.org; Fri, 08 Oct 2021 11:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrkL-0007PZ-Kr
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:25:17 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrkI-0005Ee-W2
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:25:17 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r18so31003920wrg.6
 for <qemu-arm@nongnu.org>; Fri, 08 Oct 2021 08:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VNabXKhYcjV6fLHI6e8xkRNQIZAKA0eLj8zphGSrurc=;
 b=Rn4i3PVocIZ3oR/exvO4kdZRtTy4hXBMWkKGMR/6noeQxRH4+bu4MEC2+rx0rtXskI
 bHXBjjkZBk4LDQgM+fJg3kcuWWe2vo4KzpbTH9QEYQKTuoVaAo6v5P5d8HurWIZPSvMc
 WSmzfOsvYJi2Yq2yeoSpuLt+KobWRpnLvTjz9O9ba+fT/VKu8aavpcE8bpejtheqcUDM
 gmVG/dPzon5lxGywkdpUP2Wzb2Nsvshvd8W6JqSOJBYhgG4entmkFzgq0jv5GDNGBGao
 /sZY12BGzEZa+/P2NxVcqgkbUfwJnD83ZuUAQeJo3u8HOBXQYdqQbjgPuyg7m+KlbGVR
 yCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VNabXKhYcjV6fLHI6e8xkRNQIZAKA0eLj8zphGSrurc=;
 b=QSLUQTnZCsz8iT/+I4G091uyFEadF7Wwmq50pYECwRca8kqur30mD0awCjheOs+50t
 FnVlrjNBNzWBR1XWo+qdp5q9ad4peAlaHKWT4Y/XQLHA6UjjiBWDCcfDMCJIYDS8Byme
 2i98GGs1G0qdpE/poFksn36CiGZTGaU6BtdPHm66FqQSZ07YZTUCJA9qGtI6cgZSio6K
 +wV6O8dm8UzF9T88toteWtFeUatwmHSXLuzHJGYzKJqpjLsYiO9aQmACNJqtlifkl6jt
 FDK3U2bi5B5ILKMYNVzhKRMWx+A4sLKqqCSnoodA3qCfCPhYpVrfKzb9kzgYwpeZYqqu
 jyLQ==
X-Gm-Message-State: AOAM531TbNYQ/ja8pRbHvfbvCFawmKdKR6cUjoGA/rb2oZ8bAeE/LsYp
 xX/AJKzxadFaby3lq1Ncbi5ccg==
X-Received: by 2002:adf:9c02:: with SMTP id f2mr4926818wrc.201.1633706713581; 
 Fri, 08 Oct 2021 08:25:13 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id g188sm2880849wmg.46.2021.10.08.08.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:25:13 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:24:50 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 07/11] pc: Allow instantiating a virtio-iommu device
Message-ID: <YWBiwiyrLfDYiZNC@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-8-jean-philippe@linaro.org>
 <20211006091954.79fd0a8d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006091954.79fd0a8d@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 83wo2O+b3Gt1

On Wed, Oct 06, 2021 at 09:19:54AM +0200, Igor Mammedov wrote:
> > @@ -1367,8 +1368,11 @@ static void pc_virtio_md_pci_unplug(HotplugHandler *hotplug_dev,
> >  static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> >                                            DeviceState *dev, Error **errp)
> >  {
> > -    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) &&
> > -        x86_iommu_get_default()) {
> > +    PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> > +
> > +    if ((object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
> > +         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) &&
> > +        (x86_iommu_get_default() || pcms->virtio_iommu)) {
> 
> this check is getting uglier,
> may be instead of introducing pcms->virtio_iommu boolean, better approach
> would be adding 'Device* PCMachineState::iommu' and setting it to IOMMU
> so the check would reduce to:
>       if ((object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
>            object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)))
>       {
>           if (pcms->iommu)
>             err
>           else set pcms->iommu in plug handler or here
>       }
>       
> that also will let to cleanup/get rid of x86_iommu_[s|g]et_default()
> and x86_iommu_default 'global'.
> Maybe replace previous patch with one that would remove
> x86_iommu_[s|g]et_default().

Ok, I can't figure out a nice way to do this at the moment, will think
more about it. Callers of x86_iommu_get_default() still need a helper, and
most but not all assume that the returned object is for IRQ remapping. At
least adding Device *iommu to pcms should be nicer, but not sure about
removing the x86_iommu_get/set_default helpers.

Thanks,
Jean

