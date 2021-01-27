Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp2319572lfd;
        Wed, 27 Jan 2021 06:22:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ3ySn1gWpYDVmcorx30eVy+/jqGWC3AqteEtxIB4V1ilYsyDB8UKKC+haG8lGlMiuL8/9
X-Received: by 2002:a25:7183:: with SMTP id m125mr10324019ybc.151.1611757322188;
        Wed, 27 Jan 2021 06:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611757322; cv=none;
        d=google.com; s=arc-20160816;
        b=s/unW66c54rmbNIC47XjI4mpYVbWV8ottN9x8pH25dDHRhOfe0TNOtWup3+UiwlWts
         la3OtlPxNCjTSXtqFXO6Qlcqti+QtsZI0mT9RjYOwbVCk1gRKfpsv84V9AKswY+GE4B8
         hkUYT3YlqWx5V9kYslKHYRa7arn7VdMyZE/TT7SH47QfjeBfqkgT4VXGl6HdTRpl2SY2
         nMqx4ACCHHG+TkJQpfmUy5vrnv/GsRFZ1czvXgFHIB/saYe6Zk7wC+Dpdt4Zmf5SATtd
         kmsM7PSFXLCZmSCLhhuTqMHHHk0NSpzthstyYEqitneLX9rdwShRhWLlVlvpuWk2sCOS
         UNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=2Niz399/BYlmCEs5CQLjTynYv5WHBFXxlRWI3ExuFy4=;
        b=i+kXl2OWy/JG9pxbbOsDGa/l8dyYexfuwfxWaci6bewbaNqn591UE3fBDX55y28o6a
         3aeChk8VBkdTmyK3OqSN2VEbVZKzb/WtSGN4HcAmqQ45zPr+8wYL6vJtAOYp1Zgl33oZ
         jnylRyWm0iMgaN56URi15bauCWjf6wwriYP+hEBWRHq1Hnrx56OPv4JhlLbXSs/AEYLd
         Ez+mLjuhbVm+4EMgml1hGGNbT3e0ul05EKP/ZAPnCky2uLBA45pYSyY4R6ciGPIUzemH
         /u9oKAu9iv7Ov5m+89uI7tks3P92GBcU/sud42zo2S+fCU3otHKVeF6ARwEe+LieK6Gj
         NaOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TXOqSWXp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si2118434ybz.51.2021.01.27.06.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 06:22:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TXOqSWXp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4lhp-0005xd-GR
	for alex.bennee@linaro.org; Wed, 27 Jan 2021 09:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4lhf-0005vL-G0
 for qemu-arm@nongnu.org; Wed, 27 Jan 2021 09:21:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4lhd-0005Wi-JZ
 for qemu-arm@nongnu.org; Wed, 27 Jan 2021 09:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611757308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Niz399/BYlmCEs5CQLjTynYv5WHBFXxlRWI3ExuFy4=;
 b=TXOqSWXpqj3YUbKCb8XV5gTj9sM8iA1qCCj0Lp3EY9ulLihFlDAJVchixBxk2l7dwmMOun
 28GkKkN/V3+ClACZsuXn4wc+BetA1/o35Xh9yAmYt+U3RYomeiXefgW+0wg45BJFv2eaDS
 d3CsfSk6Uzzf4EmXBpbrP4+g+zxkkfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-4IRsKCy-Mm-Ks42Vq8TlKw-1; Wed, 27 Jan 2021 09:21:47 -0500
X-MC-Unique: 4IRsKCy-Mm-Ks42Vq8TlKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B951801AA7;
 Wed, 27 Jan 2021 14:21:45 +0000 (UTC)
Received: from x1.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F4CD5D9CA;
 Wed, 27 Jan 2021 14:21:37 +0000 (UTC)
Date: Wed, 27 Jan 2021 07:21:31 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v2 3/3] vfio: Avoid disabling and enabling vectors
 repeatedly in VFIO migration
Message-ID: <20210127072131.1c778247@x1.home.shazbot.org>
In-Reply-To: <7e61e7ae-e351-4228-d250-660251dcb0c0@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-4-lushenming@huawei.com>
 <20210126143614.175e271c@omen.home.shazbot.org>
 <7e61e7ae-e351-4228-d250-660251dcb0c0@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aifkvwT2xECg

On Wed, 27 Jan 2021 19:27:35 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> On 2021/1/27 5:36, Alex Williamson wrote:
> > On Wed, 9 Dec 2020 16:09:19 +0800
> > Shenming Lu <lushenming@huawei.com> wrote:
> >   
> >> Different from the normal situation when the guest starts, we can
> >> know the max unmasked vetctor (at the beginning) after msix_load()
> >> in VFIO migration. So in order to avoid ineffectively disabling and  
> > 
> > s/ineffectively/inefficiently/?  It's "effective" either way I think.  
> 
> Yeah, I should say "inefficiently". :-)
> 
> >   
> >> enabling vectors repeatedly, let's allocate all needed vectors first
> >> and then enable these unmasked vectors one by one without disabling.
> >>
> >> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> >> ---
> >>  hw/pci/msix.c         | 17 +++++++++++++++++
> >>  hw/vfio/pci.c         | 10 ++++++++--
> >>  include/hw/pci/msix.h |  2 ++
> >>  3 files changed, 27 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> >> index 67e34f34d6..bf291d3ff8 100644
> >> --- a/hw/pci/msix.c
> >> +++ b/hw/pci/msix.c
> >> @@ -557,6 +557,23 @@ unsigned int msix_nr_vectors_allocated(const PCIDevice *dev)
> >>      return dev->msix_entries_nr;
> >>  }
> >>  
> >> +int msix_get_max_unmasked_vector(PCIDevice *dev)
> >> +{
> >> +    int max_unmasked_vector = -1;
> >> +    int vector;
> >> +
> >> +    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> >> +        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
> >> +        for (vector = 0; vector < dev->msix_entries_nr; vector++) {
> >> +            if (!msix_is_masked(dev, vector)) {
> >> +                max_unmasked_vector = vector;
> >> +            }
> >> +        }
> >> +    }
> >> +
> >> +    return max_unmasked_vector;
> >> +}  
> > 
> > Comments from QEMU PCI folks?
> >   
> >> +
> >>  static int msix_set_notifier_for_vector(PCIDevice *dev, unsigned int vector)
> >>  {
> >>      MSIMessage msg;
> >> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> >> index 51dc373695..e755ed2514 100644
> >> --- a/hw/vfio/pci.c
> >> +++ b/hw/vfio/pci.c
> >> @@ -568,6 +568,9 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
> >>  
> >>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
> >>  {
> >> +    int max_unmasked_vector = msix_get_max_unmasked_vector(&vdev->pdev);
> >> +    unsigned int used_vector = MAX(max_unmasked_vector, 0);
> >> +  
> > 
> > The above PCI function could also be done inline here pretty easily too:
> > 
> > unsigned int nr, max_vec = 0;
> > 
> > if (!msix_masked(&vdev->pdev))
> >     for (nr = 0; nr < msix_nr_vectors_allocated(&vdev->pdev); nr++) {
> >         if (!msix_is_masked(&vdev->pdev, nr)) {
> >             max_vec = nr;
> >         }
> >     }
> > }
> > 
> > It's a bit cleaner than the msix utility function, imo.  
> 
> Yeah, it makes sense.
> 
> >   
> >>      vfio_disable_interrupts(vdev);
> >>  
> >>      vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
> >> @@ -586,9 +589,12 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
> >>       * triggering to userspace, then immediately release the vector, leaving
> >>       * the physical device with no vectors enabled, but MSI-X enabled, just
> >>       * like the guest view.
> >> +     * If there are unmasked vectors (such as in migration) which will be
> >> +     * enabled soon, we can allocate them here to avoid ineffectively disabling
> >> +     * and enabling vectors repeatedly later.  
> > 
> > It just happens that migration triggers this usage model where the
> > MSI-X enable bit is set with vectors unmasked in the vector table, but
> > this is not unique to migration, guests can follow this pattern as well.
> > Has this been tested with a variety of guests?  Logically it seems
> > correct, but always good to prove so.  Thanks,  
> 
> I have tested it in migration and normal guest startup (only the latest Linux).
> And I can try to test with some other kernels, could you be more specific about this?

Minimally also Windows, ideally a BSD as well.  Thanks,

Alex

> >>       */
> >> -    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
> >> -    vfio_msix_vector_release(&vdev->pdev, 0);
> >> +    vfio_msix_vector_do_use(&vdev->pdev, used_vector, NULL, NULL);
> >> +    vfio_msix_vector_release(&vdev->pdev, used_vector);
> >>  
> >>      if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
> >>                                    vfio_msix_vector_release, NULL)) {
> >> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
> >> index 4c4a60c739..4bfb463fa6 100644
> >> --- a/include/hw/pci/msix.h
> >> +++ b/include/hw/pci/msix.h
> >> @@ -23,6 +23,8 @@ void msix_uninit_exclusive_bar(PCIDevice *dev);
> >>  
> >>  unsigned int msix_nr_vectors_allocated(const PCIDevice *dev);
> >>  
> >> +int msix_get_max_unmasked_vector(PCIDevice *dev);
> >> +
> >>  void msix_save(PCIDevice *dev, QEMUFile *f);
> >>  void msix_load(PCIDevice *dev, QEMUFile *f);
> >>    
> > 
> > .
> >   
> 

