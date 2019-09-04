Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp142769wrp;
        Tue, 3 Sep 2019 18:59:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3K4/7QIzn3iATj7EDkl8o+M82m7vC+YFy5TTgkm1P3zcmoIXiSetQUiji2f83NE6xyIdD
X-Received: by 2002:a0c:afa1:: with SMTP id s30mr7111615qvc.23.1567562341632;
        Tue, 03 Sep 2019 18:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567562341; cv=none;
        d=google.com; s=arc-20160816;
        b=nfR7DjsDln3lFzoh6mIsZ2cbrWvPDxStDmHi3M+rZgVAeVoI4BvsoiG0OoiQynDSZF
         9gTWae0AjhLy70LzGoOOZ5PNmwcnyw6MW/hYvLTbpXUvuaGCJmhfniZ1xpFmZO5BRTkz
         rn8v0wXv/6apXYjplZHpl+l8HeKQvi7tLrFhY98e29kgQO50cniFo8TXffQSikV0Av+6
         nmXuZB3hs/RezOyjzlVdy6EHiIm6t/bHJe6sTQ0JkufPBowjUHXyizYpw11oIWSxpRit
         jAMHSyMqtl0s3pJJlva9hJFG4fqpJLFRNUQbbFnS9Kqn2Mf4h66zsAPgzqfU+/SFIcd9
         WSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=A7PjX/SXFR8o/059W3/K/OOcmKUuFkR+MHHL591vpNM=;
        b=ioNwDKS0383uwPWvtwhoz10qHtd8BsdrHwJozKBHjKNuszd1leJQdWG1nbJsczhddo
         EibekHrcQ+2LPEDFpsw9Az2FgoCOBYnJ18GSrnchhPDcnmE7a1GcNI9xqF9y+5DP581r
         JQCswRTrOXQq4PkbdEwnozymsx00K/slZiQd4F1AxOMf+4TcyW+Et/4Rub7uLkYTzzln
         Z29xh3KGeOERingD9xaRduqGUmAVKdTzKdg6EWTxmswBSYuN5iI+/tMtM/634tObD4mr
         zDIAowyIlmt/N+/Urw608YKe6Ay8t3ZyRYfAgajKtQZoRn0n309qg1I0vzBvROqmpg59
         K++w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si1980889qke.225.2019.09.03.18.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 18:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5KZZ-0002Iq-0K
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 21:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1i5KZP-0002IL-3x
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 21:58:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1i5KZN-0007B3-4Q
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 21:58:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45244)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1i5KZM-0007AV-T9
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 21:58:49 -0400
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E0C5A64127
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 01:58:47 +0000 (UTC)
Received: by mail-pf1-f200.google.com with SMTP id f2so11238886pfk.13
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 18:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A7PjX/SXFR8o/059W3/K/OOcmKUuFkR+MHHL591vpNM=;
 b=XBe6YiDqso6V4XRQHL2QoqIENVyfY7gQGS4KV3vTM5JXIlhFD9Ec1khfrzxVPkETPi
 hkL8+hgAgU2b5hCb/G3VABvfOchGcRtOCJNSTareYaetESH4Z3duIVkB7EtDnAdeGJ6b
 phj9hn3Ek7h/YY2MVl1CCOigpTF9muhs/RC1LYeG5gKqe2VgtrreSJpWyGo2aAHnl6W+
 lVZcaWy0g5yLc9kKiLrOTvA9eQfSAUq0kVJrevrUY3VB76cz+z3CwfkX5kWhj4XtMdEH
 UCGTu53bQjHAaGKQQIZC9ghDSJvK8O/wrUe6pegdspXzxF+XzbWnlBiQTaWRnNbMANAm
 DReg==
X-Gm-Message-State: APjAAAVXDDyfBRBBmnv9Q1LrbXFb5GmU9d6tu+zZ/S4oLkY7pNM3afN9
 rWRCW6sX7jCeMuCMfZT7i7W7dkXAc0tJ2MMY65ipO4+mC11t5xPYTPSW8Lb5e2XpXbN3HedgN/w
 rj7PNsCkdppBa
X-Received: by 2002:a17:90a:ec12:: with SMTP id
 l18mr2387367pjy.6.1567562327363; 
 Tue, 03 Sep 2019 18:58:47 -0700 (PDT)
X-Received: by 2002:a17:90a:ec12:: with SMTP id
 l18mr2387347pjy.6.1567562327152; 
 Tue, 03 Sep 2019 18:58:47 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s19sm4929268pfe.86.2019.09.03.18.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 18:58:46 -0700 (PDT)
Date: Wed, 4 Sep 2019 09:58:34 +0800
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190904015834.GC30402@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-10-eric.auger@redhat.com>
 <20190819082424.GB13560@xz-x1>
 <d3759ba2-6ae6-2ae4-a71e-69965285f3f4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d3759ba2-6ae6-2ae4-a71e-69965285f3f4@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 09/15] virtio-iommu: Implement
 translate
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QhYW47DLpFO9

On Tue, Sep 03, 2019 at 01:45:22PM +0200, Auger Eric wrote:
> Hi Peter,
> 
> On 8/19/19 10:24 AM, Peter Xu wrote:
> > On Tue, Jul 30, 2019 at 07:21:31PM +0200, Eric Auger wrote:
> >> @@ -464,19 +464,75 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >>                                              int iommu_idx)
> >>  {
> >>      IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
> >> +    VirtIOIOMMU *s = sdev->viommu;
> >>      uint32_t sid;
> >> +    viommu_endpoint *ep;
> >> +    viommu_mapping *mapping;
> >> +    viommu_interval interval;
> >> +    bool bypass_allowed;
> >> +
> >> +    interval.low = addr;
> >> +    interval.high = addr + 1;
> >>  
> >>      IOMMUTLBEntry entry = {
> >>          .target_as = &address_space_memory,
> >>          .iova = addr,
> >>          .translated_addr = addr,
> >> -        .addr_mask = ~(hwaddr)0,
> >> +        .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
> >>          .perm = IOMMU_NONE,
> >>      };
> >>  
> >> +    bypass_allowed = virtio_has_feature(s->acked_features,
> >> +                                        VIRTIO_IOMMU_F_BYPASS);
> >> +
> >>      sid = virtio_iommu_get_sid(sdev);
> >>  
> >>      trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
> >> +    qemu_mutex_lock(&s->mutex);
> >> +
> >> +    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
> >> +    if (!ep) {
> >> +        if (!bypass_allowed) {
> >> +            error_report("%s sid=%d is not known!!", __func__, sid);
> > 
> > Maybe use error_report_once() to avoid DOS attack?  Also would it be
> > good to unify the debug prints?  I see both error_report() and
> > qemu_log_mask() are used in the whole patchset.  Or is that attempted?
> 
> I switched to error_report_once()
> 
> I understand that qemu_log_mask() should be used whenever the root cause
> is a bad action of the guest OS (in below case, the EP was not attached
> to any domain). Above, there is an EP that attempts to talk through the
> IOMMU and this was not expected (rather a platform description issue or
> a qemu bug).

I see. It's a bit unclear at least to me on how to use these.  I have
seen, and used error_report*() to report guest misbehaves as well just
for the debugging and triaging simply because error_report*() will
always be there even without "-d" (because when issue happens most
users are without it...).  Then with these information captured by
either libvirt or direct QEMU users we can triage guest bugs easier.
I hope I'm not severly wrong, and please feel free to use
qemu_log_mask() no matter what.

Regards,

-- 
Peter Xu
