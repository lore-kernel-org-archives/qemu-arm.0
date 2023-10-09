Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp70458ejb;
        Mon, 9 Oct 2023 14:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ7/xOLDwU2YKIjYlWBf0czM2rNb8XU8HgFTmT8cGjK3YuKc2JD49iUdBFbNhoJlf0VcWd
X-Received: by 2002:ac8:5a4e:0:b0:412:c81:eff3 with SMTP id o14-20020ac85a4e000000b004120c81eff3mr16466695qta.15.1696886899627;
        Mon, 09 Oct 2023 14:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696886899; cv=none;
        d=google.com; s=arc-20160816;
        b=VbnQJwgksMCuhoGfpdaZWTo0/WrLntOQ7irSsyk617wWalWcJJK16m42d0/kYYf37m
         0qZZMPTgSbovCAcr4fS4mttAvYBZ1kox8dBLuCK5XeE+bVkyLBwVTbkQvJWHqV6t29/s
         Yvc1ivfagHuuWxBp6/ws0qHPnGqIPXPGA8jnT7Zsz8s7n5a+nVNk+4+AbHJgUXIIMBN/
         nrwKWVRYCulu0H4yiZH4Utue5AdLIGNUEozXHDhL4IuqmS7ORlvQA7+AJs5fo4oiSHcQ
         XK0R97uSPfJofSxUKgzRbQyVZPSpABaIxxHKB7+8UWQVOt7Guko1Q4B2+xpolMCrf8qW
         5JjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=k3VBARoml2XeuseKnZjUU7dweEiU7QqIS1/01swcVTc=;
        fh=lXvi4ru3OWsMRah6AEh+xQL2hY8L/Fy5QDG8tYXxJ70=;
        b=YH3xgFzcsOGS8YEjdYt9K4SgczT2V6k1iUC5urA9ICzW83mpv6JfthjRN+NT2VQ2Vm
         w1xHGBhIRXe22AXC6R0I8FR4atRvbZfCwjPL1OAv6Hf5+lBXPzTIi5loAMBIgBLFsIhq
         LfhX7FQZxoYHw3NwKUA1tNceWe1Fij3Zl8D6e/xwbexr+/dOa6BnbjmocAhfnNE/DrK1
         6bpYF6+gKIaHx48iaxzbp4uTVZFEOR6Y+JrCAjob8qrsTXA0JjH9np5ajIarp5MiztEO
         3Kj64lIGzFUTe1gktWyeh+1hR6iTlXkA9ANss6WoJgmnQ/1NtnnnjDev/LrFtKaC4KRt
         SttQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LidxvYa5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020ac87dd0000000b00419785d97c8si6975652qte.564.2023.10.09.14.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 14:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LidxvYa5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpxn0-0002F4-AJ; Mon, 09 Oct 2023 17:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qpxmy-0002EQ-Vu
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 17:27:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qpxmw-0000ko-FA
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 17:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696886861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3VBARoml2XeuseKnZjUU7dweEiU7QqIS1/01swcVTc=;
 b=LidxvYa5ZEIDOxfZMu9yZ/clfRPIoLp7AsEG01jBZWXFGLi8MXTpwEYFUpCyf3YlBzNXrI
 LvDhzeOE3xFTeAE26W2Z2wDFAOEVX4Sev2nzE8CuuioVM3fuHdbzpXnWpAIQTI94B0xqw3
 87esEpAi21WZEKCrU3I/JWsZyFGfynA=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-0uuQerc1MpW8tLnxZ7P3Sw-1; Mon, 09 Oct 2023 17:27:39 -0400
X-MC-Unique: 0uuQerc1MpW8tLnxZ7P3Sw-1
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3514347fa96so30665415ab.1
 for <qemu-arm@nongnu.org>; Mon, 09 Oct 2023 14:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696886859; x=1697491659;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k3VBARoml2XeuseKnZjUU7dweEiU7QqIS1/01swcVTc=;
 b=wnIc/iVIpL1j1veqZnMlbawi32gnbkv/ksQ68jqzvQU7sFldZmg38axrTkXIAmbrrl
 UytPawDoo+CkpnM67Nmfb5JukZN0Vq9eyVs1X75XQKY8Lprmxk6ENsQEcQENv1WzdpAR
 lpqL4X//92kdwmt3/Yrt2+5PzZrQcsxu5aCdngwbiP9KcehJ2wseZwPOzTMHoH3/LHzr
 Xr9DijdOP5Qz7oNV6i6EVMnXhWc8QDWCphWI/BPL8cdOta3zofIcscf2moKrCK9Z6n7Y
 82HtVrFMruS7ndN3iwOLanv7h7gLk5Tn5DQoiIIO/xi7j0H4TVvAakgzIZeAv3D/QSjD
 HpCg==
X-Gm-Message-State: AOJu0YyWMgsyGjuubZfhxNRmhKiqmGDO1nh4CMWnWOAWfVmZDDz7KK5n
 EPr2nfIpA/cmzJjTivf4Kdu3tVbVHfPqgpSyZCIi8VIWwdL/waF5GMetlSFVY/wbIGpYb0Rqw9Q
 5I2ANFs4h2NcP
X-Received: by 2002:a05:6e02:78b:b0:34f:6b04:d8c8 with SMTP id
 q11-20020a056e02078b00b0034f6b04d8c8mr9472991ils.16.1696886858839; 
 Mon, 09 Oct 2023 14:27:38 -0700 (PDT)
X-Received: by 2002:a05:6e02:78b:b0:34f:6b04:d8c8 with SMTP id
 q11-20020a056e02078b00b0034f6b04d8c8mr9472977ils.16.1696886858527; 
 Mon, 09 Oct 2023 14:27:38 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 p13-20020a92d48d000000b0034e28740e35sm3177127ilg.78.2023.10.09.14.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 14:27:37 -0700 (PDT)
Date: Mon, 9 Oct 2023 15:27:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: <ankita@nvidia.com>, <jgg@nvidia.com>, <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <ani@anisinha.ca>,
 <berrange@redhat.com>, <eduardo@habkost.net>, <imammedo@redhat.com>,
 <mst@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <david@redhat.com>, <gshan@redhat.com>, <aniketa@nvidia.com>,
 <cjia@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <vsethi@nvidia.com>, <acurrid@nvidia.com>, <dnigam@nvidia.com>,
 <udhoke@nvidia.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 3/3] qom: Link multiple numa nodes to device using a
 new object
Message-ID: <20231009152735.658313f7.alex.williamson@redhat.com>
In-Reply-To: <20231009133048.00003535@Huawei.com>
References: <20231007201740.30335-1-ankita@nvidia.com>
 <20231007201740.30335-4-ankita@nvidia.com>
 <20231009133048.00003535@Huawei.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: KCpoVNJCch0e

On Mon, 9 Oct 2023 13:30:48 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Sun, 8 Oct 2023 01:47:40 +0530
> <ankita@nvidia.com> wrote:
> 
> > From: Ankit Agrawal <ankita@nvidia.com>
> > 
> > NVIDIA GPU's support MIG (Mult-Instance GPUs) feature [1], which allows
> > partitioning of the GPU device resources (including device memory) into
> > several (upto 8) isolated instances. Each of the partitioned memory needs
> > a dedicated NUMA node to operate. The partitions are not fixed and they
> > can be created/deleted at runtime.
> > 
> > Unfortunately Linux OS does not provide a means to dynamically create/destroy
> > NUMA nodes and such feature implementation is not expected to be trivial. The
> > nodes that OS discovers at the boot time while parsing SRAT remains fixed. So
> > we utilize the GI Affinity structures that allows association between nodes
> > and devices. Multiple GI structures per BDF is possible, allowing creation of
> > multiple nodes by exposing unique PXM in each of these structures.
> > 
> > Introducing a new nvidia-acpi-generic-initiator object, which inherits from
> > the generic acpi-generic-initiator object to allow a BDF to be associated with
> > more than 1 nodes.
> > 
> > An admin can provide the range of nodes using numa-node-start and
> > numa-node-count and link it to a device by providing its id. The following
> > sample creates 8 nodes and link them to the device dev0:
> > 
> >         -numa node,nodeid=2 \
> >         -numa node,nodeid=3 \
> >         -numa node,nodeid=4 \
> >         -numa node,nodeid=5 \
> >         -numa node,nodeid=6 \
> >         -numa node,nodeid=7 \
> >         -numa node,nodeid=8 \
> >         -numa node,nodeid=9 \
> >         -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
> >         -object nvidia-acpi-generic-initiator,id=gi0,device=dev0,numa-node-start=2,numa-node-count=8 \  
> 
> If you go this way, use an array of references to the numa nodes instead of a start and number.
> There is no obvious reason why they should be contiguous that I can see.

Yup, I was looking for other places we allow a list syntax, I only
found fds=a:b:...:z, which is also used for vhostfds=.  I didn't find a
property beyond the string type to hold this though.

> I think it is simpler the other way around though - so have the numa nodes point at the
> vfio-pci-nohotplug device. 

Do you have a syntax you'd propose for this?  I'm having trouble seeing
how it makes things simpler.  Thanks,

Alex

> > [1] https://www.nvidia.com/en-in/technologies/multi-instance-gpu
> > 
> > Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> > ---
> >  hw/acpi/acpi-generic-initiator.c         | 61 ++++++++++++++++++++++++
> >  include/hw/acpi/acpi-generic-initiator.h | 12 +++++
> >  qapi/qom.json                            | 24 +++++++++-
> >  3 files changed, 95 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/acpi/acpi-generic-initiator.c b/hw/acpi/acpi-generic-initiator.c
> > index 1ae79639be..8ef887c3a4 100644
> > --- a/hw/acpi/acpi-generic-initiator.c
> > +++ b/hw/acpi/acpi-generic-initiator.c
> > @@ -150,3 +150,64 @@ void build_srat_generic_initiator(GArray *table_data)
> >      }
> >      g_slist_free(list);
> >  }
> > +
> > +static void
> > +nvidia_acpi_generic_initiator_set_node_start(Object *obj, Visitor *v,
> > +                                             const char *name, void *opaque,
> > +                                             Error **errp)
> > +{
> > +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> > +    uint32_t value;
> > +
> > +    if (!visit_type_uint32(v, name, &value, errp)) {
> > +        return;
> > +    }
> > +
> > +    if (value >= MAX_NODES) {
> > +        return;
> > +    }
> > +
> > +    gi->node = value;
> > +}
> > +
> > +static void
> > +nvidia_acpi_generic_initiator_set_node_count(Object *obj, Visitor *v,
> > +                                             const char *name, void *opaque,
> > +                                             Error **errp)
> > +{
> > +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> > +    uint32_t value;
> > +
> > +    if (!visit_type_uint32(v, name, &value, errp)) {
> > +        return;
> > +    }
> > +
> > +    gi->node_count = value;
> > +}
> > +
> > +static void nvidia_acpi_generic_initiator_class_init(ObjectClass *oc, void *data)
> > +{
> > +    object_class_property_add(oc, NVIDIA_ACPI_GENERIC_INITIATOR_NODE_START_PROP,
> > +                              "uint32", NULL,
> > +                              nvidia_acpi_generic_initiator_set_node_start,
> > +                              NULL, NULL);
> > +    object_class_property_add(oc, NVIDIA_ACPI_GENERIC_INITIATOR_NODE_COUNT_PROP,
> > +                              "uint32", NULL,
> > +                              nvidia_acpi_generic_initiator_set_node_count,
> > +                              NULL, NULL);
> > +}
> > +
> > +static const TypeInfo nvidia_acpi_generic_initiator_info = {
> > +    .parent = TYPE_ACPI_GENERIC_INITIATOR,
> > +    .name = TYPE_NVIDIA_ACPI_GENERIC_INITIATOR,
> > +    .instance_size = sizeof(NvidiaAcpiGenericInitiator),
> > +    .class_size = sizeof(NvidiaAcpiGenericInitiatorClass),
> > +    .class_init = nvidia_acpi_generic_initiator_class_init,
> > +};
> > +
> > +static void
> > +nvidia_acpi_generic_initiator_register_types(void)
> > +{
> > +    type_register_static(&nvidia_acpi_generic_initiator_info);
> > +}
> > +type_init(nvidia_acpi_generic_initiator_register_types);
> > diff --git a/include/hw/acpi/acpi-generic-initiator.h b/include/hw/acpi/acpi-generic-initiator.h
> > index e8e2670309..3e4cf42064 100644
> > --- a/include/hw/acpi/acpi-generic-initiator.h
> > +++ b/include/hw/acpi/acpi-generic-initiator.h
> > @@ -9,10 +9,14 @@
> >  #include "qom/object_interfaces.h"
> >  
> >  #define TYPE_ACPI_GENERIC_INITIATOR "acpi-generic-initiator"
> > +#define TYPE_NVIDIA_ACPI_GENERIC_INITIATOR "nvidia-acpi-generic-initiator"
> >  
> >  #define ACPI_GENERIC_INITIATOR_DEVICE_PROP "device"
> >  #define ACPI_GENERIC_INITIATOR_NODE_PROP "node"
> >  
> > +#define NVIDIA_ACPI_GENERIC_INITIATOR_NODE_START_PROP "numa-node-start"
> > +#define NVIDIA_ACPI_GENERIC_INITIATOR_NODE_COUNT_PROP "numa-node-count"
> > +
> >  typedef struct AcpiGenericInitiator {
> >      /* private */
> >      Object parent;
> > @@ -47,6 +51,14 @@ typedef struct PCIDeviceHandle {
> >      uint64_t res1;
> >  } PCIDeviceHandle;
> >  
> > +typedef struct NvidiaAcpiGenericInitiator {
> > +    AcpiGenericInitiator parent;
> > +} NvidiaAcpiGenericInitiator;
> > +
> > +typedef struct NvidiaAcpiGenericInitiatorClass {
> > +        AcpiGenericInitiatorClass parent_class;
> > +} NvidiaAcpiGenericInitiatorClass;
> > +
> >  void build_srat_generic_initiator(GArray *table_data);
> >  
> >  #endif
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index 86c87a161c..c29ad1388d 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -793,6 +793,24 @@
> >  { 'struct': 'AcpiGenericInitiatorProperties',
> >    'data': { 'device': 'str', 'node': 'uint32' } }
> >  
> > +##
> > +# @NvidiaAcpiGenericInitiatorProperties:
> > +#
> > +# Properties for nvidia-acpi-generic-initiator objects.
> > +#
> > +# @device: the ID of the device to be associated with the nodes
> > +#
> > +# @numa-node-start: the ID of the numa node
> > +#
> > +# @numa-node-count: count of the numa nodes assocuated with the device
> > +#
> > +# Since: 8.0
> > +##
> > +{ 'struct': 'NvidiaAcpiGenericInitiatorProperties',
> > +  'data': { 'device': 'str',
> > +            'numa-node-start': 'uint32',
> > +            'numa-node-count': 'uint32' } }
> > +
> >  ##
> >  # @RngProperties:
> >  #
> > @@ -962,7 +980,8 @@
> >      'tls-cipher-suites',
> >      { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
> >      { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] },
> > -    'acpi-generic-initiator'
> > +    'acpi-generic-initiator',
> > +    'nvidia-acpi-generic-initiator'
> >    ] }
> >  
> >  ##
> > @@ -1030,7 +1049,8 @@
> >        'tls-cipher-suites':          'TlsCredsProperties',
> >        'x-remote-object':            'RemoteObjectProperties',
> >        'x-vfio-user-server':         'VfioUserServerProperties',
> > -      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties'
> > +      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties',
> > +      'nvidia-acpi-generic-initiator':     'NvidiaAcpiGenericInitiatorProperties'
> >    } }
> >  
> >  ##  
> 

