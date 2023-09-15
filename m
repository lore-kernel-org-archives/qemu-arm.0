Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1293047ejb;
        Fri, 15 Sep 2023 07:51:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbfheCORVvP4NY87lkn4ytZB9NnF7D+Xsi9Uc5TaPXb8v86NnAA7WNSHRNluGy/qdioYwg
X-Received: by 2002:ad4:458d:0:b0:655:f4d0:a4d4 with SMTP id x13-20020ad4458d000000b00655f4d0a4d4mr2150258qvu.47.1694789473400;
        Fri, 15 Sep 2023 07:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694789473; cv=none;
        d=google.com; s=arc-20160816;
        b=RNXGLq+7uS6DTLRGYgmgIvHklyOQOCweuWTSWhGhjGJ9+NH4pow3GBURmdWbRE6CmM
         thxwjAlim16zNQTMCDsy58B51M6lVUvNwK4lF5Ng6F4ac+kVCPL+fPNr3g/FZO9+FRM5
         Kf5PqPCUX5Nq7zPuke4Y8Ia9Eb8B/qQxOEuZUY0oElcvnAMOMafxB6zam0v8QR3uWQ3J
         qlU7CRNtYm49kF9115hm/4h0/cFbPxPA5XK+IU5U0zzhx5z7u5G+vwTZii7JKmrYzL24
         2A4Ci8SgKSh0qWCUv/NOC1yzWZyh+JT7ZvF49nddG9UU2y1AdN7a9XIVXU50dUF2cvpO
         DmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=MtCgSiQxxkUwLODCl8bh9vKD4ivhlH7JDUMGKOPfP1w=;
        fh=owg6c3MiiBXfO016lLDV87jeVESnFolnEbHEua9as08=;
        b=mc3+OuDQwn24XNQhP3JdYfqtGEn+AntDT14N0FJ/xefPjwDT3gS1xlM1FyErym68QZ
         K+N6k8AVow9Uz6oWgNJ/nc+Ai05f9qfm5/gWb52/aU2oGagKxiYbp01Q8TW6DLNafeTw
         O3LWHkPkpdThK1pLr6BXSizE+5Gng/zi8fPkM0K9Y7RzqFAOoihePV5uWZ0JWF+ToiRH
         6bML4t2THwQwbAOZb0K7AGxuAb2+50xMSvi4EoVcBDE/glP6wOAn0FccLhUa4K2dAZTm
         VYYQz2s9ffXDAoDqQmhSVzJIyV8smYNGFV6roc+Nvb79U9cJnYdH+5q5bon4p8V8LR4b
         nAiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AwingHO6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020ad44592000000b0065623a9a1aasi1985631qvu.306.2023.09.15.07.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 07:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AwingHO6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qhA7w-0002wo-8U; Fri, 15 Sep 2023 10:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qhA7m-0002kN-Me
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 10:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qhA7i-0005xG-JO
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 10:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694789326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtCgSiQxxkUwLODCl8bh9vKD4ivhlH7JDUMGKOPfP1w=;
 b=AwingHO6Dxqv9yxkH++dqGGNkT5JIeWutGxEdqyqvIWeYpFRS4cxRGWrM8EYPhbEL/4lgj
 NKjA6tlNOx4Wgp3Bh8t1xf+bwiHm2DT/9LfP+K73G4t8ASLv+pY2RkDehrDDJEnFx36cjH
 6Hw7wTssbCdzaAc/YmVI9rau9Stp7Y8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-ZOOYSZISMWCxUHw-q4RWlA-1; Fri, 15 Sep 2023 10:48:44 -0400
X-MC-Unique: ZOOYSZISMWCxUHw-q4RWlA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-529fa33ac99so1611420a12.0
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 07:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694789323; x=1695394123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MtCgSiQxxkUwLODCl8bh9vKD4ivhlH7JDUMGKOPfP1w=;
 b=iE807a9SlQf24gzWgW8Tmsvx4G5UF+0heUtgjvg2IQSWt4F8d0t5ES/U/qkEg7EEPI
 ixMmIQNKTZe2dIZhQzKpsnlrf54KSYR/C+dDtVatJ3pu6KxTr/bvN+s1g7kxP2EsNPNu
 htSVmLgyJ44kQbGYEba/yBoDh9LBosQ3nmn3qYEyR3wPrzer9WcXLwOz9xWZAdhAqrBs
 aYSyzvbAAUFPafrYHkWnBAhkasOvBDfgKHn+5h8t0WcHDomj/phNNPVB8d4mYfJOEM6/
 jRFGzu3QxhyNwVIpZ0jCJMIXnln3UsUEPWM2vmheIv/f4U2dymvE2WQRu6FyUafFfIBp
 rcog==
X-Gm-Message-State: AOJu0YyO+euvNJYiVDF2dhQ2OxoWb1++vCcv68RUaHFJQB7qRrqO7cf/
 Z2cdt2b0VpTxtjT00eiMbgmUqKsRcxtv5iPDkdHlv/vtngRKRGLTIyKtivigdE/dd+pNHeOqu/h
 VMJilYGBYO0Fs
X-Received: by 2002:a05:6402:514f:b0:522:2ba9:6fce with SMTP id
 n15-20020a056402514f00b005222ba96fcemr1669369edd.8.1694789323188; 
 Fri, 15 Sep 2023 07:48:43 -0700 (PDT)
X-Received: by 2002:a05:6402:514f:b0:522:2ba9:6fce with SMTP id
 n15-20020a056402514f00b005222ba96fcemr1669346edd.8.1694789322805; 
 Fri, 15 Sep 2023 07:48:42 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05640204d000b005272523b162sm2352993edw.69.2023.09.15.07.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 07:48:42 -0700 (PDT)
Date: Fri, 15 Sep 2023 16:48:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron via <qemu-devel@nongnu.org>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, <ankita@nvidia.com>,
 <jgg@nvidia.com>, <alex.williamson@redhat.com>, <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <ani@anisinha.ca>,
 <aniketa@nvidia.com>, <cjia@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <vsethi@nvidia.com>, <acurrid@nvidia.com>,
 <qemu-arm@nongnu.org>, mst@redhat.com
Subject: Re: [PATCH v1 1/4] vfio: new command line params for device memory
 NUMA nodes
Message-ID: <20230915164841.15d20ecc@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230915152509.00003788@Huawei.com>
References: <20230915024559.6565-1-ankita@nvidia.com>
 <20230915024559.6565-2-ankita@nvidia.com>
 <20230915152509.00003788@Huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: eOu+PGCHlA64

On Fri, 15 Sep 2023 15:25:09 +0100
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> On Thu, 14 Sep 2023 19:45:56 -0700
> <ankita@nvidia.com> wrote:
> 
> > From: Ankit Agrawal <ankita@nvidia.com>
> > 
> > The CPU cache coherent device memory can be added as a set of
> > NUMA nodes distinct from the system memory nodes. The Qemu currently
> > do not provide a mechanism to support node creation for a vfio-pci
> > device.
> > 
> > Introduce new command line parameters to allow host admin provide
> > the desired starting NUMA node id (pxm-ns) and the number of such
> > nodes (pxm-nc) associated with the device. In this implementation,
> > a numerically consecutive nodes from pxm-ns to pxm-ns + pxm-nc
> > is created. Also validate the requested range of nodes to check  
> 
> 
> Hi Ankit,
> 
> That's not a particularly intuitive bit of interface!
> 
> pxm-start
> pxm-number
> perhaps?  However, in QEMU commmand lines the node terminology is used so
> numa-node-start
> numa-node-number
> 
> Though in general this feels backwards compared to how the rest of
> the numa definition is currently done.

QEMU have already means to assign NUMA node affinity
to PCI hierarchies in generic way by using a PBX per node
(also done 'backwards') by setting node option on it.
So every device behind it should belong to that node as well
and guest OS shall pickup device affinity from PCI tree it belongs to.
(I'd suspect that CXL is supposed to work the same way).

PS:
But then, I don't know much about PCI
(ccing Michael)

> 
> Could the current interface be extended.
> 
> -numa node,vfio-device=X
> 
> at the cost of a bit of house keeping and lookup.
> 
> We need something similar for generic initiators, so maybe
> vfio-mem=X? (might not even need to be vfio specific - even
> if we only support it for now on VFIO devices).
> leaving
> initiator=X available for later...
> 
> Also, good to say why multiple nodes per device are needed.
> 
> Jonathan
> 
> > for conflict with other nodes and to ensure that the id do not cross
> > QEMU limit.
> > 
> > Since the QEMU's SRAT and DST builder code needs the proximity
> > domain (PXM) id range, expose PXM start and count as device object
> > properties.
> > 
> > The device driver module communicates support for such feature through
> > sysfs. Check the presence of the feature to activate the code.
> > 
> > E.g. the following argument adds 8 PXM nodes starting from id 0x10.
> > -device vfio-pci-nohotplug,host=<pci-bdf>,pxm-ns=0x10,pxm-nc=8
> > 
> > Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> > ---
> >  hw/vfio/pci.c               | 144 ++++++++++++++++++++++++++++++++++++
> >  hw/vfio/pci.h               |   2 +
> >  include/hw/pci/pci_device.h |   3 +
> >  3 files changed, 149 insertions(+)
> > 
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index a205c6b113..cc0c516161 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -42,6 +42,8 @@
> >  #include "qapi/error.h"
> >  #include "migration/blocker.h"
> >  #include "migration/qemu-file.h"
> > +#include "qapi/visitor.h"
> > +#include "include/hw/boards.h"
> >  
> >  #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> >  
> > @@ -2955,6 +2957,22 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
> >      }
> >  }
> >  
> > +static void vfio_pci_get_dev_mem_pxm_start(Object *obj, Visitor *v,
> > +                                           const char *name,
> > +                                           void *opaque, Error **errp)
> > +{
> > +    uint64_t pxm_start = (uintptr_t) opaque;
> > +    visit_type_uint64(v, name, &pxm_start, errp);
> > +}
> > +
> > +static void vfio_pci_get_dev_mem_pxm_count(Object *obj, Visitor *v,
> > +                                           const char *name,
> > +                                           void *opaque, Error **errp)
> > +{
> > +    uint64_t pxm_count = (uintptr_t) opaque;
> > +    visit_type_uint64(v, name, &pxm_count, errp);
> > +}
> > +
> >  static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
> >  {
> >      Error *err = NULL;
> > @@ -2974,6 +2992,125 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
> >      vdev->req_enabled = false;
> >  }
> >  
> > +static int validate_dev_numa(uint32_t dev_node_start, uint32_t num_nodes)
> > +{
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> > +    unsigned int i;
> > +
> > +    if (num_nodes >= MAX_NODES) {
> > +        return -EINVAL;
> > +    }
> > +
> > +    for (i = 0; i < num_nodes; i++) {
> > +        if (ms->numa_state->nodes[dev_node_start + i].present) {
> > +            return -EBUSY;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int mark_dev_node_present(uint32_t dev_node_start, uint32_t num_nodes)
> > +{
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> > +    unsigned int i;
> > +
> > +    for (i = 0; i < num_nodes; i++) {
> > +        ms->numa_state->nodes[dev_node_start + i].present = true;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +
> > +static bool vfio_pci_read_cohmem_support_sysfs(VFIODevice *vdev)
> > +{
> > +    gchar *contents = NULL;
> > +    gsize length;
> > +    char *path;
> > +    bool ret = false;
> > +    uint32_t supported;
> > +
> > +    path = g_strdup_printf("%s/coherent_mem", vdev->sysfsdev);  
> 
> If someone has asked for it, why should we care if they specify it on a
> device where it doesn't do anything useful?  This to me feels like something
> to check at a higher level of the stack.
> 
> > +    if (g_file_get_contents(path, &contents, &length, NULL) && length > 0) {
> > +        if ((sscanf(contents, "%u", &supported) == 1) && supported) {
> > +            ret = true;
> > +        }
> > +    }
> > +
> > +    if (length) {
> > +        g_free(contents);  
> 
> g_autofree will clean this up for you I think
> 
> > +    }
> > +    g_free(path);  
> 
> and this.
> 
> > +
> > +    return ret;
> > +}
> > +
> > +static int vfio_pci_dev_mem_probe(VFIOPCIDevice *vPciDev,
> > +                                         Error **errp)
> > +{
> > +    Object *obj = NULL;
> > +    VFIODevice *vdev = &vPciDev->vbasedev;
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> > +    int ret = 0;
> > +    uint32_t dev_node_start = vPciDev->dev_node_start;
> > +    uint32_t dev_node_count = vPciDev->dev_nodes;
> > +
> > +    if (!vdev->sysfsdev || !vfio_pci_read_cohmem_support_sysfs(vdev)) {
> > +        ret = -ENODEV;  
> return -ENODEV; 
> 
> and similar in all the other cases as no cleanup to do.
> 
> > +        goto done;
> > +    }
> > +
> > +    if (vdev->type == VFIO_DEVICE_TYPE_PCI) {  
> 
> nicer to handle one condition at a time.
> 
>     if (vdev->type != VFIO_DEVICE_TYPE_PCI) {
>         return -EINVAL;
>     }
> 
>     obj = vfio_pci_get_object(vdev);
> this can't fail
> 
> Also get rid of assigning it to NULL above.
> 
>    if (DEVICE_CLASS(object...)) {
>       return -EINVAL;
>    }
> 
> 
> > +        obj = vfio_pci_get_object(vdev);
> > +    }
> > +
> > +    /* Since this device creates new NUMA node, hotplug is not supported. */
> > +    if (!obj || DEVICE_CLASS(object_get_class(obj))->hotpluggable) {
> > +        ret = -EINVAL;
> > +        goto done;
> > +    }
> > +
> > +    /*
> > +     * This device has memory that is coherently accessible from the CPU.
> > +     * The memory can be represented seperate memory-only NUMA nodes.
> > +     */
> > +    vPciDev->pdev.has_coherent_memory = true;
> > +
> > +    /*
> > +     * The device can create several NUMA nodes with consecutive IDs
> > +     * from dev_node_start to dev_node_start + dev_node_count.
> > +     * Verify
> > +     * - whether any node ID is occupied in the desired range.
> > +     * - Node ID is not crossing MAX_NODE.
> > +     */
> > +    ret = validate_dev_numa(dev_node_start, dev_node_count);
> > +    if (ret) {
> > +        goto done;  
>         return ret;
> 
> > +    }
> > +
> > +    /* Reserve the node by marking as present */
> > +    mark_dev_node_present(dev_node_start, dev_node_count);
> > +
> > +    /*
> > +     * To have multiple unique nodes in the VM, a series of PXM nodes are
> > +     * required to be added to VM's SRAT. Send the information about the
> > +     * starting node ID and the node count to the ACPI builder code.
> > +     */
> > +    object_property_add(OBJECT(vPciDev), "dev_mem_pxm_start", "uint64",
> > +                        vfio_pci_get_dev_mem_pxm_start, NULL, NULL,
> > +                        (void *) (uintptr_t) dev_node_start);
> > +
> > +    object_property_add(OBJECT(vPciDev), "dev_mem_pxm_count", "uint64",
> > +                        vfio_pci_get_dev_mem_pxm_count, NULL, NULL,
> > +                        (void *) (uintptr_t) dev_node_count);
> > +
> > +    ms->numa_state->num_nodes += dev_node_count;
> > +
> > +done:
> > +    return ret;
> > +}
> > +
> >  static void vfio_realize(PCIDevice *pdev, Error **errp)
> >  {
> >      VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> > @@ -3291,6 +3428,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
> >          }
> >      }
> >  
> > +    ret = vfio_pci_dev_mem_probe(vdev, errp);
> > +    if (ret && ret != -ENODEV) {
> > +        error_report("Failed to setup device memory with error %d", ret);
> > +    }
> > +
> >      vfio_register_err_notifier(vdev);
> >      vfio_register_req_notifier(vdev);
> >      vfio_setup_resetfn_quirk(vdev);
> > @@ -3454,6 +3596,8 @@ static Property vfio_pci_dev_properties[] = {
> >      DEFINE_PROP_UINT32("x-pci-sub-device-id", VFIOPCIDevice,
> >                         sub_device_id, PCI_ANY_ID),
> >      DEFINE_PROP_UINT32("x-igd-gms", VFIOPCIDevice, igd_gms, 0),
> > +    DEFINE_PROP_UINT32("pxm-ns", VFIOPCIDevice, dev_node_start, 0),
> > +    DEFINE_PROP_UINT32("pxm-nc", VFIOPCIDevice, dev_nodes, 0),
> >      DEFINE_PROP_UNSIGNED_NODEFAULT("x-nv-gpudirect-clique", VFIOPCIDevice,
> >                                     nv_gpudirect_clique,
> >                                     qdev_prop_nv_gpudirect_clique, uint8_t),
> > diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> > index a2771b9ff3..eef5ddfd06 100644
> > --- a/hw/vfio/pci.h
> > +++ b/hw/vfio/pci.h
> > @@ -158,6 +158,8 @@ struct VFIOPCIDevice {
> >      uint32_t display_yres;
> >      int32_t bootindex;
> >      uint32_t igd_gms;
> > +    uint32_t dev_node_start;
> > +    uint32_t dev_nodes;
> >      OffAutoPCIBAR msix_relo;
> >      uint8_t pm_cap;
> >      uint8_t nv_gpudirect_clique;
> > diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
> > index d3dd0f64b2..aacd2279ae 100644
> > --- a/include/hw/pci/pci_device.h
> > +++ b/include/hw/pci/pci_device.h
> > @@ -157,6 +157,9 @@ struct PCIDevice {
> >      MSIVectorReleaseNotifier msix_vector_release_notifier;
> >      MSIVectorPollNotifier msix_vector_poll_notifier;
> >  
> > +    /* GPU coherent memory */
> > +    bool has_coherent_memory;
> > +
> >      /* ID of standby device in net_failover pair */
> >      char *failover_pair_id;
> >      uint32_t acpi_index;  
> 
> 

