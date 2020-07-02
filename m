Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1466869lfm;
        Thu, 2 Jul 2020 06:13:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytTEEvbgrIY8n1ilBAI9lnVrTgW/b4OmCpoXU0bRrYuV5j2vpIQpv2f/PHCMYBwb4LNXyc
X-Received: by 2002:a25:48d:: with SMTP id 135mr30683852ybe.236.1593695586170;
        Thu, 02 Jul 2020 06:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593695586; cv=none;
        d=google.com; s=arc-20160816;
        b=CRFzgMBhsmjiCnEzWREeGtDehPWA2NZpRCpwW7Pn19GIYDDqOrtOHk2euUSi0wK6Qu
         b58oHHlapLsIY2FcDgJHHk7VlJ4AKYJF2V2GBrNJrPVXtJ+7y4raFp+k0hv2QjBVqv8g
         uMiuIzUWeHt89XekAd3Q971nWSj80x+PqkXXxaSY1AG1GE6Px9nHVnugpmhP12IQyFm8
         O7nqy7EWw4aOqA+WgDODS6px4QQWJ61EdBkhOvtpIWha4vB3RVvZ4IKW6EdlWe8/p+sN
         sPXo9tU4MxcSUGr2bdyKrGnmijG4ucMHTrQAyQdRn7sfayHAuM76Y9Eiq66xxab7r3YU
         mLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wtoZB/DrdHCTwgcGC7eYMqB3u+s8DLGCkVcpAP9QXiU=;
        b=Vw9LNeHX0uyYf3aHMXoDU5ln6qcCc3C19yyVXPjGjkUQBPsCicchX3skNzUSiWe7MQ
         OGVPem2yqUeAQrkgfALB70EJ8MdWj6vWNLDrneEMGkEnwm8Wl2M07lyZdN7CnJTlYhuD
         7sneajDg6LBlsgj5pfRVmHYRXusrslt4MQrDZ6+/iH0gZ+pvzhW7LNMJ4kC8DB1d/lrs
         qbBA9FO/Bp+nCSyYJoEONm0EI1H9KYOqS3YgqdXlTOoZhw0JAH1K3B8J0nyf+EkwIcGY
         +ffPNsA70WuslomAUcMXLG2Sb6zy4dHf1nv862x0H1a44QwrUTZFmjTl1tSuBdDL4PPT
         nKvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Paoq3AuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i69si8734657ybg.483.2020.07.02.06.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 06:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Paoq3AuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqz1V-0004Kw-Fi
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 09:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jqz1L-0004Jp-Ku
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 09:12:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25806
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jqz1J-0007Nm-EU
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 09:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593695572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wtoZB/DrdHCTwgcGC7eYMqB3u+s8DLGCkVcpAP9QXiU=;
 b=Paoq3AuIN3cT3qRhbSy3fIaBZYuRyHd2BcM1rcLmQgKMqs8OAXE1qQS21DLu5MuV2S+uwe
 1HqJeJvl3Vsh8+fFb84yZgND7PRYRmhMa2QqKBmgE7kcCVCvajEx7hgFFo1dq9+fcHtI30
 zqE2jLtEzTlcGhdZWOwPAcdij5y8zuo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-e8gxnL_7Oq-kf89SRG_l8w-1; Thu, 02 Jul 2020 09:12:49 -0400
X-MC-Unique: e8gxnL_7Oq-kf89SRG_l8w-1
Received: by mail-wr1-f70.google.com with SMTP id f5so25635978wrv.22
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2020 06:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wtoZB/DrdHCTwgcGC7eYMqB3u+s8DLGCkVcpAP9QXiU=;
 b=S+T8mpH6CziRD2CQhavPmg0RHhGofgwY2DDXbEVJPWCXTxBmDtb2SPWFP/41RkSEIm
 3PPnRUisEJURuMHqywHiPJJ2gjxvosRNHUoqCdzZYFDr/wbkmD4MggUFz3tEExPzzJF+
 DOGqUjvJGgBfdVCdoC3SDSlmf/PaZ3urr1TV/0Mo4oqQBxCIfvW6UK02So0sbRGwOvuL
 tJu39GsoNhwVK3f5Xwe2hKqX0lWvcY13kggOb9BrWcPQ8RnRHujbpnUwnfWicFHBpVUh
 sQyuhjZiQTEBn79j/QfgVXkgd0bkbpHkY8sWhzUU20MgZbbnXKXl7OvAro3EfFMogyoR
 2qTA==
X-Gm-Message-State: AOAM530LWJh8ykKzj+qpVhwOaJC7qZoJIs48wj6fYkouAHfok/mPWCEg
 1VQBIxPxsPRLSbjbt2HPmjZilqlwSoYJjAgOwWoZ+AG7NQokud/WkjvJxcq7xolij7g05Z4GUnO
 i93MJeXiwl/oo
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr34077496wrq.56.1593695568011; 
 Thu, 02 Jul 2020 06:12:48 -0700 (PDT)
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr34077465wrq.56.1593695567699; 
 Thu, 02 Jul 2020 06:12:47 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 x7sm10933520wrr.72.2020.07.02.06.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 06:12:46 -0700 (PDT)
Date: Thu, 2 Jul 2020 09:12:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v7 0/5] VIRTIO-IOMMU probe request support and MSI bypass
 on ARM
Message-ID: <20200702091222-mutt-send-email-mst@kernel.org>
References: <20200629070404.10969-1-eric.auger@redhat.com>
 <20200702072655-mutt-send-email-mst@kernel.org>
 <e514c6d7-280f-6e18-659a-94854779451f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e514c6d7-280f-6e18-659a-94854779451f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, armbru@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IO22KhbPlxHA

On Thu, Jul 02, 2020 at 02:01:46PM +0200, Auger Eric wrote:
> Hi Michael,
> 
> On 7/2/20 1:28 PM, Michael S. Tsirkin wrote:
> > On Mon, Jun 29, 2020 at 09:03:59AM +0200, Eric Auger wrote:
> >> By default the virtio-iommu translates MSI transactions. This
> >> behavior is inherited from ARM SMMU. However the virt machine
> >> code knows where the MSI doorbells are, so we can easily
> >> declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
> >> setting the guest iommu subsystem will not need to map MSIs.
> >> This setup will simplify the VFIO integration.
> >>
> >> In this series, the ITS or GICV2M doorbells are declared as
> >> HW MSI regions to be bypassed by the VIRTIO-IOMMU.
> >>
> >> This also paves the way to the x86 integration where the MSI
> >> region, [0xFEE00000,0xFEEFFFFF], will be exposed by the q35
> >> machine.  However this will be handled in a separate series
> >> when not-DT support gets resolved.
> > 
> > 
> > virtio things:
> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > 
> > ARM tree makes sense for this, right?
> 
> Yes I think so.
> 
> Thanks
> 
> Eric


Okay. Feel free to merge through ARM tree pls.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> > 
> > 
> >> Best Regards
> >>
> >> Eric
> >>
> >> This series can be found at:
> >> https://github.com/eauger/qemu/tree/v5.0.0-virtio-iommu-msi-bypass-v7
> >>
> >> History:
> >>
> >> v6 -> v7:
> >> - fix the hint message
> >> - put the assert again on probe request
> >>
> >> v5 -> v6:
> >> - do not hardcode start/end addresses of doorbells
> >> - check reserved region type on realize()
> >>
> >> v4 -> v5:
> >> - Take into account some additional comments from Markus:
> >>   - reserved region type becomes an unsigned + some comment/desc
> >>     rewording
> >>   - assert if the type is not RESERVED or MSI
> >>
> >> v3 -> v4:
> >> - collected Jean and markus's R-bs
> >> - tool into account all Markus' comments in [1/5] (except removal of
> >>   goto)
> >> - use ':' as delimitor instead of commas
> >> - add example in 4/5 commit message as suggested by Markus
> >>
> >> v2 -> v3:
> >> - Introduce VIRT_MSI_CTRL_NONE in VirtMSIControllerType
> >> - do not fill the remainder of the probe buffer
> >>
> >> v1 -> v2:
> >> - check which MSI controller is in use and advertise the
> >>   corresponding MSI doorbell
> >> - managed for both ITS and GICv2M
> >> - various fixes spotted by Peter and Jean-Philippe, see
> >>   individual logs
> >>
> >> v1: Most of those patches were respinned from
> >>   [PATCH for-5.0 v11 00/20] VIRTIO-IOMMU device
> >>   except the last one which is new
> >>
> >>
> >> Eric Auger (5):
> >>   qdev: Introduce DEFINE_PROP_RESERVED_REGION
> >>   virtio-iommu: Implement RESV_MEM probe request
> >>   virtio-iommu: Handle reserved regions in the translation process
> >>   virtio-iommu-pci: Add array of Interval properties
> >>   hw/arm/virt: Let the virtio-iommu bypass MSIs
> >>
> >>  include/exec/memory.h            |   6 ++
> >>  include/hw/arm/virt.h            |   7 ++
> >>  include/hw/qdev-properties.h     |   3 +
> >>  include/hw/virtio/virtio-iommu.h |   2 +
> >>  include/qemu/typedefs.h          |   1 +
> >>  hw/arm/virt.c                    |  30 ++++++++
> >>  hw/core/qdev-properties.c        |  89 ++++++++++++++++++++++++
> >>  hw/virtio/virtio-iommu-pci.c     |  11 +++
> >>  hw/virtio/virtio-iommu.c         | 114 +++++++++++++++++++++++++++++--
> >>  hw/virtio/trace-events           |   1 +
> >>  10 files changed, 260 insertions(+), 4 deletions(-)
> >>
> >> -- 
> >> 2.20.1
> > 
> > 

