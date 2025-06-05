Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp229273njc;
        Thu, 5 Jun 2025 06:06:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGUbj7rxTzM9E4uHsYZYef0BzZfXQFZgMhukMcqwkcU1jzXOHwCQ+0I7jQHslgItqHmc3jf4Po/nZaow==@linaro.org
X-Google-Smtp-Source: AGHT+IEURvDXFDaOX6MIEKY4z/WLkOnfD5bXdNIQfzbvlb3XLVi/yXrsNsbRwVFSbmsFwIG4tR4D
X-Received: by 2002:a05:6830:6f4c:b0:727:ec1:73ab with SMTP id 46e09a7af769-73869d86a07mr5032648a34.19.1749128787444;
        Thu, 05 Jun 2025 06:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749128787; cv=none;
        d=google.com; s=arc-20240605;
        b=fWfe+bxlDl1JaMf3V/BqNvi0sJ0dVUYELFte+A1VDi3hCJz/jFa4rSv6O3b6JplwqW
         1K7iRk4E6XsYTjzF3oYBx0y6h5bnM9IKQmucmvnc4Pfclvq03FtxlGVx/HsUlNHf2XaJ
         HVaiU/tziWQMGBaMQhNSgdf2hczrbF6z+wSAVInhe1cy0yTYKz9HXO88ri14PoATSPKt
         792me4/vD20hOL1D1WVlMx1vZRCA34FKO9gge2mdVkHZBKRgwVi+JT+8D8C8iUDJfuXW
         Xvz/esjlsDxfLQZ0OOfyohE3Mh62pDwMiTGFih4PhkvLcr2kpVf+nQ3DT5zVG2enveQm
         Z84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=QLrI+nMGD2N6i2Cey2hmv9MFnuunz6SJvgFilWhKAno=;
        fh=XAKYccG2dcXwuCLdlRFkXhlKjQsNLKuaZseaEuPR+HQ=;
        b=OK2HIUnqkCwP6RmeB5YD/BHFtyKOwnhvq108y6zYOgFQipKNxRI67zyrul1AttUsWN
         Liv3DWsUb0ZS7kL5hODJy6oWjrez6PS/9q63fqyVAid74Q8ll2HhVYANu/1sqfkaLCD5
         PD8PbPRBIaIJhdttTepwB0FJJIiRi+DxESCX/2GRCFQpfAhbtdlpO/t6Z+f6EFnEGJju
         V9mRy4g+ek7VoiNwT4fyivRUpyGpnaVemfS8vp+FJWIfPdJ8oPL/qxmGGTufjX88VTpy
         QJuPMzc+T7Qw96BQ7aSlkDljksCBtOJqvaVL3UI8ZeS7H6oQrSQGnICmdMzTMr7a3o+7
         QkXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V7rl+eil;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e63885389esi5689157137.0.2025.06.05.06.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 06:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V7rl+eil;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNAI0-0007YL-TY; Thu, 05 Jun 2025 09:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uNAHz-0007Y1-NJ
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 09:05:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uNAHp-0005Jj-4n
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 09:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749128735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QLrI+nMGD2N6i2Cey2hmv9MFnuunz6SJvgFilWhKAno=;
 b=V7rl+eiljKWx7rM+Kxp7b7VdMnKL5OaGPcIB4BnRZ0LBipHZNZrQaTJLjjkXTta1/NKY0z
 c+bogadsjjtRqbODI7AV7vzR8L7tZYv6ZPn6MbLUf+/6taDkBMIHj3vvTTiAhTNjkOTZi3
 4HW5OylkhfGiQsugv003H9la3We3+AA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-faB4W6hYNLGWMmKr3R3lTg-1; Thu, 05 Jun 2025 09:05:33 -0400
X-MC-Unique: faB4W6hYNLGWMmKr3R3lTg-1
X-Mimecast-MFC-AGG-ID: faB4W6hYNLGWMmKr3R3lTg_1749128733
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-445135eb689so5202345e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 06:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749128733; x=1749733533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QLrI+nMGD2N6i2Cey2hmv9MFnuunz6SJvgFilWhKAno=;
 b=Tfavr+9ABzBLUbJWXB4mA+/zwezIJ2YQYVpHna9vbb3xgWaoSVD6IM9dZ+vyN2nWqM
 Clb0Bs5nnBUfJE91CjU5OqaZh+notY70DhqNj/Pr/ArbdQXQ70sHbT5HG+S2mDBCEIPb
 +Bd0ILZyOUi6kA4caGeRxtSXljN0zxC2eauWY2wBZVDhLaBnfCV6oBl/QbVdulynuTAw
 bcVcvkyc5mFYCt73Wci93dIeXQXtxyRkdanCn3zQ8NDSVpmWSE55uFJHDj2yDWoQIlzW
 d4S597WLgdB903agC+ZFo0KGD6LTaXrcdk/gclHAtdGPuuDjOQ9t+Iq8F1yRzt8Pc7i+
 c8SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsj0Xnr+/q1ngrgY/5BB5RmEDO2ozwQM8QohiCIdnHujyIXRD6UlyTi1fGHHDJNrh9ueOCF71osg==@nongnu.org
X-Gm-Message-State: AOJu0Ywvo8Ylx4h2aoIRHP7bpmzBHo89kvy+yBHzbnxhCnaT/oWW4Zls
 s7NzzEEzDu/FL7QTD0MKGoASSh3A0ajwIBtRie5IU5rh0cRFj6buMFToCpx4ZBmgEUYer4vUxB9
 uNuEXKgToL0BbJb8igHoOrKjMa3iZfdzDF62UnoLvIM2xDrKGV9zsnA==
X-Gm-Gg: ASbGncvHrK/DPMYySgMVU/QxJISXH+/cgkfLmkZvqqyMwAyaix41X3KNgM7Kd2E47Sk
 Q1EpsWh8F7MVqo8ukVLjmQA2dxDhJ+h8AMgJMqNQF+jbAOAIl69kzS66sOa1d8kRFHe40wR7GFM
 I+3r1aylxbAp+Gtv5L5cXOEuJEZCx7iwC+/jMEIE+eJSoQj13fQNvpAzycb3UvGI9ViFdVlUWXJ
 s0iHHcf/mkaHvgtwH+K+6pFruRTBklcjrEUC9t3b0s+vrpRhg1qxy1DkwoFraJ7akcHyuUwaCZ1
 me7do3KH7ry3yxZkppOl3m4mu1DYwcE3
X-Received: by 2002:a05:600c:528e:b0:43c:fbba:41ba with SMTP id
 5b1f17b1804b1-451f0fadeb5mr49864325e9.28.1749128732611; 
 Thu, 05 Jun 2025 06:05:32 -0700 (PDT)
X-Received: by 2002:a05:600c:528e:b0:43c:fbba:41ba with SMTP id
 5b1f17b1804b1-451f0fadeb5mr49863745e9.28.1749128731974; 
 Thu, 05 Jun 2025 06:05:31 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe6c7adsm23987373f8f.26.2025.06.05.06.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 06:05:31 -0700 (PDT)
Date: Thu, 5 Jun 2025 15:05:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Shameer Kolothum via <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, "smostafa@google.com"
 <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root
 Complex association
Message-ID: <20250605150529.0d0cbb8c@imammedo.users.ipa.redhat.com>
In-Reply-To: <83a0966672fc4785817784dbdf08aef3@huawei.com>
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
 <20250605125518.138f5172@imammedo.users.ipa.redhat.com>
 <065bbd4ee15442b58e15b298614cf5dd@huawei.com>
 <20250605141931.1704c6a5@imammedo.users.ipa.redhat.com>
 <83a0966672fc4785817784dbdf08aef3@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qg-BCyfwABpf1kgaCHja6XFdb2tcg8EBRFmb4DibZDQ_1749128733
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MQR7lyHjwrln

On Thu, 5 Jun 2025 12:36:52 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Igor Mammedov <imammedo@redhat.com>
> > Sent: Thursday, June 5, 2025 1:20 PM
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: Shameer Kolothum via <qemu-devel@nongnu.org>; qemu-
> > arm@nongnu.org; eric.auger@redhat.com; peter.maydell@linaro.org;
> > jgg@nvidia.com; nicolinc@nvidia.com; ddutile@redhat.com;
> > berrange@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> > smostafa@google.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> > <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> > Jonathan Cameron <jonathan.cameron@huawei.com>;
> > zhangfei.gao@linaro.org
> > Subject: Re: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root
> > Complex association  
> 
> [..]
> 
> > > > in QEMU with PCI, usually we specify bus to attach to with 'bus'  
> > property,  
> > > > wouldn't it better to rename "primary-bus" to 'bus' to be consistent  
> > with  
> > > > the rest of PCI code (and before "primary-bus" shows up as a CLI option,
> > > > so far (before this series) it looks like it's an internal property)?  
> > >
> > > That was tried in v2 and since SMMUv3 is not a pci device by itself(it is a
> > > sysbus device) reusing the default "bus" property to establish an  
> > association  
> > > with a PCI bus created problems,
> > > https://lore.kernel.org/qemu-devel/877c2ut0zk.fsf@pond.sub.org/  
> > 
> > that was an approach was trying to workaround by patching dc->bus_type,
> > which is obviously wrong.
> > 
> > I'm not talking about changing device type or something similar,
> > but about renaming 'primary-bus' property name to 'bus'  
> 
> I have tried that earlier and gets this,
> -device arm-smmuv3,bus=pcie.0,id=smmuv3.0: Device 'arm-smmuv3' can't go on PCIE bus
> 
> IIRC, the above mentioned patched dc->bus_type = TYPE_PCIE_BUS was used 
> to avoid that.
> 
> Or am I missing something here?

sigh, but you a right.
qdev_device_add_from_qdict() && co can't handle that without heavy refactoring.

 
> > so it would be consistent interface wise with PCI or other QEMU devices
> > that are attached to a bus.
> >   
> > > > > +    if (!bus || !object_dynamic_cast(bus->parent,  
> > > > TYPE_PCI_HOST_BRIDGE)) {
> > > > Also looking at smmu_base_realize, it has NULL pointer check already.
> > > > Which also rises question, shouldn't smmu_base_realize check for
> > > > TYPE_PCI_HOST_BRIDGE as well (aka can smmu be attached to anything
> > > > else but a host bridge)?  
> > >
> > > Not at the moment in Qemu. Though the SMMUv3 specification allows it  
> > to  
> > > be associated with non-pci devices as well.  
> > 
> > then perhaps move, the check to smmu_base_realize() for now?
> > 
> > if smmu + non-pci ever materialize, it can be refactored at that time.  
> 
> Ok.
> 
> Thanks,
> Shameer
> 

