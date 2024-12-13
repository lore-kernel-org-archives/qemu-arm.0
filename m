Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp378886njb;
        Fri, 13 Dec 2024 03:58:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXT0x4wJ6XejwdPJ1gee9MKYHXpAEXD5Xnq497zYaq9PGq+z7K6Hm5yS9olccumUqvGzuQEKWZ6ZCz08w==@linaro.org
X-Google-Smtp-Source: AGHT+IGR0mb8Njfx/EVttCSDif09oayFkU8ZkS7FizTttxeShwkxsMOs/4UJdS5Tsp5/7z6rBPMV
X-Received: by 2002:a05:622a:296:b0:466:af35:92d5 with SMTP id d75a77b69052e-467a578bd14mr41058511cf.25.1734091114337;
        Fri, 13 Dec 2024 03:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734091114; cv=none;
        d=google.com; s=arc-20240605;
        b=WTcuhl3S7j5vHOYKnazfPN7KH5tmBoXRq43yfstJtW5QarBw1eFfgvz5B+o9nU0gzN
         QzKq3/SVdAwlu6ihlsND7XXxdosSTKYSF0FBuwDFWFdhAyjuICD1Ff9UscNpg8gKS9SV
         uflSmNT9T2U3ytAV6GMcbWcYhnTAS1PrLHePzbRFJM6dpW8BjM87OSQccgnsF/eZMEJ7
         21DROwDB0wogkKc2Vox3UKz5Q8lQ/Xv+T9wVgatAVylqs4Sjp74WWGp+4FJqKdiCaWsR
         VFmA+FmgIELh4UFxWr2LXIRMQ5KujJ2fkUTuGjLveXAZrRbqto2tDKFdiMdcb8zH9Ght
         Ow8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=nxMbnyaUorfTKKXmmw3f2StfXgMcPiOVpu6RqO8X9SA=;
        fh=4NOrLBpLFN7DqzRLjh8SHMVpu3/lJorkwoNSBOInN+M=;
        b=doZY/OyVOnpAnm5/Zj7f+UwVxKU2HFrwZ4aOe8d/5yK9JtY3HKKqEbSgXLbLFswpht
         hIJUfD5RC5KEY+vCymhP7VvM6X+JN2Q8utpHScHqZR+DjBca4y0TUpqMjOkmyF9Q63Vj
         FUzrtsN1U3vqaC0x64xGkf4VdmId+QAleRJMVBiLkmc2fbenMOp8+ZswZLgnFXbxfHaE
         I+s4V3gpjhZQdvdOb9n6gBfqD+nP8UIDWRtBEBIbnaxclG1ccpO3EnImRTLoxl7AOzw+
         3axW8KMa9I53yZD2kzD7QCOmjFk5a6Ug6ZpHnZic9E0yB5TBC80POpX8gJU2vMPVr70x
         7B1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bQYVaXNL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467297b979csi217661941cf.338.2024.12.13.03.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 03:58:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bQYVaXNL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM4JR-0005dL-2V; Fri, 13 Dec 2024 06:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tM4JO-0005cS-BC
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 06:58:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tM4JK-0007RS-2b
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 06:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734091098;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nxMbnyaUorfTKKXmmw3f2StfXgMcPiOVpu6RqO8X9SA=;
 b=bQYVaXNLiKWRXxEtwv4i8byb8kZFyUZvfh4eL0irqN7Lq0pvagk3iRQVHJUnprZyvSOVtB
 lT6kagtSDZSRAsZK+Fgg+q4QOcoiNtMEYINFXt9sTTIqRYHSQvb0hANwxb6PxFr7pADdaY
 tduBuYLjArUlitU+U/A654OCS7SfFJw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-xXTLaKe9OHKJ2YW9Wzv8eA-1; Fri,
 13 Dec 2024 06:58:15 -0500
X-MC-Unique: xXTLaKe9OHKJ2YW9Wzv8eA-1
X-Mimecast-MFC-AGG-ID: xXTLaKe9OHKJ2YW9Wzv8eA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 11B441955F2B; Fri, 13 Dec 2024 11:58:13 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 84CFB300FA98; Fri, 13 Dec 2024 11:58:06 +0000 (UTC)
Date: Fri, 13 Dec 2024 11:58:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Nathan Chen <nathanc@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <Z1whSkMS_TVyYGsW@redhat.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <ZzPd1F/UA2MKMbwl@Asurada-Nvidia>
 <2a61079f-a919-43b1-906a-bae8390bf733@nvidia.com>
 <04024d09ebad4d83ab0679f6bb3b3774@huawei.com>
 <d2bc4fdb-3188-4063-8ead-f2ccefec9c81@nvidia.com>
 <4f657876547f4001935f7314ecb8f8ca@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f657876547f4001935f7314ecb8f8ca@huawei.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DKC2AkF1b0Xe

On Fri, Nov 22, 2024 at 05:38:54PM +0000, Shameerali Kolothum Thodi via wrote:
> 
> 
> > -----Original Message-----
> > From: Nathan Chen <nathanc@nvidia.com>
> > Sent: Friday, November 22, 2024 1:42 AM
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> > ddutile@redhat.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> > <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> > Jonathan Cameron <jonathan.cameron@huawei.com>;
> > zhangfei.gao@linaro.org; Nicolin Chen <nicolinc@nvidia.com>
> > Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
> > nested SMMUv3
> > 
> >  >> Also as a heads up, I've added support for auto-inserting PCIe switch
> >  >> between the PXB and GPUs in libvirt to attach multiple devices to a
> > SMMU
> >  >> node per libvirt's documentation - "If you intend to plug multiple
> >  >> devices into a pcie-expander-bus, you must connect a
> >  >> pcie-switch-upstream-port to the pcie-root-port that is plugged into the
> >  >> pcie-expander-bus, and multiple pcie-switch-downstream-ports to the
> >  >> pcie-switch-upstream-port". Future unit-tests should follow this
> >  >> topology configuration.
> >  >
> >  > Ok. Could you please give me an example Qemu equivalent command
> > option,
> >  > if possible, for the above case. I am not that familiar with libvirt
> > and I would
> >  > also like to test the above scenario.
> > 
> > You can use "-device x3130-upstream" for the upstream switch port, and
> > "-device xio3130-downstream" for the downstream port:
> > 
> >   -device pxb-pcie,bus_nr=250,id=pci.1,bus=pcie.0,addr=0x1 \
> >   -device pcie-root-port,id=pci.2,bus=pci.1,addr=0x0 \
> >   -device x3130-upstream,id=pci.3,bus=pci.2,addr=0x0 \
> >   -device xio3130-
> > downstream,id=pci.4,bus=pci.3,addr=0x0,chassis=17,port=1 \
> >   -device vfio-pci,host=0009:01:00.0,id=hostdev0,bus=pci.4,addr=0x0 \
> >   -device arm-smmuv3-nested,pci-bus=pci.1
> 
> Thanks. Just wondering why libvirt mandates usage of pcie-switch for multiple
> device plugging rather than just using pcie-root-ports?

Libvirt does not rquire use of pcie-switch. It supports them, but in the
absence of app requested configs, libvirt will always just populate
pcie-root-port devices. switches are something that has to be explicitly
asked for, and I don't see much need todo that.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

