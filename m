Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp6165885lfb;
        Thu, 10 Dec 2020 10:40:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxruFg17fJMI94hRVdcwl4aRa1TWz+fwFcnL2XtzPtwHSLZFSP//fxmW590CgCate43CRTm
X-Received: by 2002:a25:b812:: with SMTP id v18mr14646661ybj.63.1607625645841;
        Thu, 10 Dec 2020 10:40:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607625645; cv=none;
        d=google.com; s=arc-20160816;
        b=KGNe1le06HdGjY7vF8SR3qWEWp611EKSzyNz70tB0BrZYhHX2i45KPo3J0hW0ynOAC
         tXRpyE+ScX3z5HUdVGrAzdGSbSxd23MxIDxsP9xf2VeD/SRT3gSYB8YiImmppwgSH8jE
         +1M8c09WbwixaBiK6hJ8oFeqm3LwN97VuXR+/v9VtdudVH/29Fke45Gb4O/MwfwCRiP7
         rt6nMh7Woqbx13C5dBPXfTPrspbnP2b7ac/R85Sy4OAN+plCDu5fhvaPebcR0wMB7XTk
         3EzJtSlGayQ+7FfnDXz0HHec+Blz+eZEPvKZoeDx9be5r9/9PxuxVpVtu8O+AY9V3ipX
         uvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=UyUf2z94P2VdxWHOSrvh5OP2sMM8+a+b2gFBtx5ni24=;
        b=P5CSftD+NDs24nM59YKao6kDvB1ycHFipSQZq1AEgxImeIrBwwjb5wJstmAP4SaY0x
         n8gRuG/wnPHOP1IetbTpjEykTDb7lDTL4o21+7u37Z6OBw9QV5Ay/Bpt53C8LWAC+r3l
         iI3veuSyhWdKV5reYLNOsOMTftW6uegY8fvoup4J21KUEQuYrSKi1BZauKWAn9T92usd
         m5mDOVtQUn7mejqrkZg6PYYsY/9yX+CBR4zG9xIiTBHTs2QYHR+ohV7mgD93vYJBiBqH
         nm8gTYQhep2VGzW6vMGWs8kst5kxn/WoEtcXv7L+2ixwjvRz/PqHUYEazjb19KqalgYo
         jIjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iV7dDLU9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y63si5655872yby.344.2020.12.10.10.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 10:40:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iV7dDLU9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knQrt-0005e3-5h
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 13:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knQrI-0005dZ-U0
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 13:40:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knQrC-0003dH-CL
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 13:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607625600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyUf2z94P2VdxWHOSrvh5OP2sMM8+a+b2gFBtx5ni24=;
 b=iV7dDLU9Q1DldNu8ZimLlcndVHzVE759sLM+m/sLdbdd/HMPUlzO23yauhj1WV4LK+mimq
 CM+ox7fn4JraLzE0lg7U6DHZmbF6CWKZ7+mjztl96CQ92HbCgkTf0cgCusRG1M6mEZeQbt
 dO1QSbKs02AQJZjewSlNKjKDgDmBkpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-geo25HAcMRqT69Ew2LGsZw-1; Thu, 10 Dec 2020 13:39:58 -0500
X-MC-Unique: geo25HAcMRqT69Ew2LGsZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABC53184214B;
 Thu, 10 Dec 2020 18:39:56 +0000 (UTC)
Received: from gondolin (ovpn-112-67.ams2.redhat.com [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D5FA1F443;
 Thu, 10 Dec 2020 18:39:41 +0000 (UTC)
Date: Thu, 10 Dec 2020 19:39:39 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v2 2/3] vfio: Set the priority of the VFIO VM state
 change handler explicitly
Message-ID: <20201210193939.5c29997b.cohuck@redhat.com>
In-Reply-To: <817ace0f-ddcf-db7f-8f92-f94cc450fb90@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-3-lushenming@huawei.com>
 <20201209134537.5c7ab401.cohuck@redhat.com>
 <817ace0f-ddcf-db7f-8f92-f94cc450fb90@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 mst@redhat.com, qemu-devel@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AeLrZY0PccqC

On Thu, 10 Dec 2020 11:11:17 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> On 2020/12/9 20:45, Cornelia Huck wrote:
> > On Wed, 9 Dec 2020 16:09:18 +0800
> > Shenming Lu <lushenming@huawei.com> wrote:
> >   
> >> In the VFIO VM state change handler, VFIO devices are transitioned
> >> in the _SAVING state, which should keep them from sending interrupts.
> >> Then we can save the pending states of all interrupts in the GIC VM
> >> state change handler (on ARM).
> >>
> >> So we have to set the priority of the VFIO VM state change handler
> >> explicitly (like virtio devices) to ensure it is called before the
> >> GIC's in saving.  
> > 
> > What this patch does is to make the priority of the vfio migration
> > state change handler depending on the position in the qdev tree. As all
> > state change handlers with no explicit priority are added at priority
> > 0, this will make sure that this handler runs before (save) resp. after
> > (restore) nearly all other handlers, which will address your issue here
> > (and possibly similar ones).
> > 
> > So, this patch seems fine for now, but I'm wondering whether we need to
> > think more about priorities for handlers in general, and if there are
> > more hidden dependencies lurking in there.  
> 
> As far as I know, as for the migration of interrupt, on x86 the sync from
> the PIR field to the Virtual-APIC page for posted interrupts (in
> KVM_GET_LAPIC ioctl) is after the pause of VFIO devices, which is fine.
> Not sure about others...

Interrupt handling had been my first guess, but it seems most interrupt
controllers don't use a state change handler anyway.

"handlers in general" actually also referred to use cases outside of
vfio migration, so out of scope of this patch...

> 
> Thanks,
> Shenming
> 
> >   
> >>
> >> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> >> Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
> >> ---
> >>  hw/vfio/migration.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> >> index 3b9de1353a..97ea82b100 100644
> >> --- a/hw/vfio/migration.c
> >> +++ b/hw/vfio/migration.c
> >> @@ -862,7 +862,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
> >>      register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
> >>                           vbasedev);
> >>  
> >> -    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
> >> +    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
> >> +                                                           vfio_vmstate_change,
> >>                                                             vbasedev);
> >>      migration->migration_state.notify = vfio_migration_state_notifier;
> >>      add_migration_state_change_notifier(&migration->migration_state);  
> > 
> > .
> >   
> 

In any case,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

