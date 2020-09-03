Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp394643lfc;
        Thu, 3 Sep 2020 03:14:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysizNDOjVjkeluwiUIKEYNGGs5j7Sp0z0+zQhSobNC9RRdZYYZXhxW/sOwV1sFOtlK0H47
X-Received: by 2002:a25:6808:: with SMTP id d8mr1704676ybc.265.1599128092916;
        Thu, 03 Sep 2020 03:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599128092; cv=none;
        d=google.com; s=arc-20160816;
        b=qBSDBsLhcuF6Zp2Ob8xmIu93eWPJBVjatfiWQsWl6xyniDKmWCugTXHqEXAvVYu14g
         AhnYHp7NoguAFOJ5uFUn/RzhZE7KsFTsaQsoMa0MFjNPKz/UVTICIW25yH34RLkPi/7t
         uIULkrJ+125UohK4/XmPMwg4YTU1eQ4alizh51ZHE6LwlejDNAy/VyLmEIq7s9VlZtlb
         fMUFihK1eVcrghTPDBwF9MjiLo9VeH6lfpVH8O+a+KWdlt/vD4RlY0wuDUcMxowgFiZT
         QZnO9UWI73AQYCbHSqVRo0twXLeh+k9HPlPo2b7B7+qIo+0yGl4EM8LhGUjh6sQq2kZn
         YHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6kL2CH6UwWqRslXBpITScixS5axdiZInfiwVOoQvCfg=;
        b=Bm06c6M8wi734QBSnf1m7NRRm95RnKO/TAHVhIuBfoNhKimCCycqY5xr4G8pYHovKH
         ty7JueKbynUfElY4IIRbEN2Ip7xrQw0AIoX4uFr6kOC/pg6yrEGBZvZh3olq+EcHfyFi
         p2xCOtUX/d0TtF6IX3Do9W6N7u/zJGqnnaQRvHsMGYiLKnbsR0zrgh7HckD+oaGu4eLo
         p1854A9agXS/wisYvW8VVXbdf7P+x+BiAGv8zAI3DkkFS+gcLpq24JipkXHiAKSxJeH9
         hlJ4Qtbe36Sxr5JgPH+5nSaagk+kp3yZuome+HZq3/ldgRhUnahVJo45jk9JMfWze9Xd
         6C9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VeEQ84+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si2513280ybd.21.2020.09.03.03.14.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 03:14:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VeEQ84+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDmGa-0003eu-8c
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 06:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDmGM-0003RI-Pd
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 06:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDmGJ-0006R2-Q9
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 06:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599128073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6kL2CH6UwWqRslXBpITScixS5axdiZInfiwVOoQvCfg=;
 b=VeEQ84+KA6mUlVfH0AdBfmdil0AePxoDxhTU73wed+6lvU+ceyy4Nrm2KJ2O0QUdQWM8z+
 qAJBtY6dJwD7sRELdDjDfZR9rZrK8ffxcCqxr+PlY+KyEejNSPPjS0jws1eb+blbjlep/F
 9xMf34qLks/Z3SFNFzvSFBhi7I/bGcg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-q8QXyw4gMO-lOVT8hWaNhA-1; Thu, 03 Sep 2020 06:14:30 -0400
X-MC-Unique: q8QXyw4gMO-lOVT8hWaNhA-1
Received: by mail-qt1-f199.google.com with SMTP id e11so1770792qth.21
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 03:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6kL2CH6UwWqRslXBpITScixS5axdiZInfiwVOoQvCfg=;
 b=UiFrYbaEZ3JqKku1wF2xzgHPPlz6bcz8WVc/uBsG27GsbYCFKoEHNP00f/iLbeZEoJ
 XT6x0XkvgEEcUyaiYj5HXCS8tTucaWrpKASITIr00eH47GidSm6K3YcoMv1R0ByCtxn2
 ycmwl9mPiHXWi6VtTysgoL7IrQnsn3AkZGmPTnGquk3D9cshkeO9LTw/Zq5GgDyCQS0D
 f+Xaawed0tYfHnIQuP/ECSC5ZoSCoCirPz3PZbYNVdcMFRr4kzUhgVsNKLkA/njlGxGh
 XFFWYmjGrQTR1eGajNoQ7NkBgJswu+0fOPiVVMqzMnI7FLoZz8Qh/YNhXfRBdyOX7iQY
 FpVA==
X-Gm-Message-State: AOAM532ewZ0TIULX7/4bLEYP+gKfVkg4qFlmUE3MyYyOaM+6W3LJVNs6
 9v96ZtLOKLqLdCm9KvnE7KV+dpWrtQGfmmSoCrLEi3VBuhcDTppK55qEn8/F0ERBETs8PP7xaFm
 TPP4DbfJ33nNwcDvg8WWIE5KDNM9p
X-Received: by 2002:a05:620a:b1a:: with SMTP id
 t26mr2281953qkg.353.1599128069995; 
 Thu, 03 Sep 2020 03:14:29 -0700 (PDT)
X-Received: by 2002:a05:620a:b1a:: with SMTP id
 t26mr2281934qkg.353.1599128069745; 
 Thu, 03 Sep 2020 03:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-4-eperezma@redhat.com>
 <58783cf8-ef7f-1481-8c5e-acd76a8b752f@redhat.com>
In-Reply-To: <58783cf8-ef7f-1481-8c5e-acd76a8b752f@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 3 Sep 2020 12:13:53 +0200
Message-ID: <CAJaqyWeTruYQGz5CedQW3ogMNO_B77QFRYW-+M_e-pemjvoobg@mail.gmail.com>
Subject: Re: [RFC v8 3/5] memory: Add IOMMU_DEVIOTLB_UNMAP
 IOMMUTLBNotificationType
To: Auger Eric <eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PyjgxJvX4eNY

Hi Eric,

On Wed, Sep 2, 2020 at 12:32 PM Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Eugenio,
>
> On 9/1/20 4:26 PM, Eugenio P=C3=A9rez wrote:
> > Adapt intel and vhost to use this new notification type
> I think you should explain in the commit message what is the benefice to
> introduce this new event type.

Will do, thanks!

> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c | 2 +-
> >  hw/virtio/vhost.c     | 2 +-
> >  include/exec/memory.h | 2 ++
> >  3 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 0c4aef5cb5..cdddb089e7 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -2468,7 +2468,7 @@ static bool vtd_process_device_iotlb_desc(IntelIO=
MMUState *s,
> >          sz =3D VTD_PAGE_SIZE;
> >      }
> >
> > -    event.type =3D IOMMU_NOTIFIER_UNMAP;
> > +    event.type =3D IOMMU_NOTIFIER_DEVIOTLB;
> If this is used only for device IOTLB cache invalidation, shouldn't this
> be named IOMMU_NOTIFIER_DEVIOTLB_UNMAP to be consistent with the rest?
> >      event.entry.target_as =3D &vtd_dev_as->as;
> >      event.entry.addr_mask =3D sz - 1;
> >      event.entry.iova =3D addr;
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 1a1384e7a6..6ca168b47e 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -729,7 +729,7 @@ static void vhost_iommu_region_add(MemoryListener *=
listener,
> >      iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
> >                                                     MEMTXATTRS_UNSPECIF=
IED);
> >      iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
> > -                        IOMMU_NOTIFIER_UNMAP,
> > +                        IOMMU_NOTIFIER_DEVIOTLB,
> >                          section->offset_within_region,
> >                          int128_get64(end),
> >                          iommu_idx);
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 8a56707169..215e23973d 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -87,6 +87,8 @@ typedef enum {
> >      IOMMU_NOTIFIER_UNMAP =3D 0x1,
> >      /* Notify entry changes (newly created entries) */
> >      IOMMU_NOTIFIER_MAP =3D 0x2,
> > +    /* Notify changes on device IOTLB entries */
> > +    IOMMU_NOTIFIER_DEVIOTLB =3D 0x04,
> >  } IOMMUNotifierFlag;
> >
> >  #define IOMMU_NOTIFIER_ALL (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP)
> shouldn't we rename this one??
> >
>

Agree, but I'm not sure about the right name. IOMMU_NOTIFIER_ALL_ROOT?
IOMMU_NOTIFIER_ALL_REGULAR?

Thanks!

> Thanks
>
> Eric
>

