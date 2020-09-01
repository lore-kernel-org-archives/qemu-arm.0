Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4939180lfc;
        Tue, 1 Sep 2020 14:05:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPh1OZw3lW5yeuMddVvG0Yasup56xQxYFvzJOP6EV1Rbz0/4prTzmyo24WDG46etRbjqVd
X-Received: by 2002:a17:90a:dd45:: with SMTP id u5mr3408145pjv.198.1598994316959;
        Tue, 01 Sep 2020 14:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598994316; cv=none;
        d=google.com; s=arc-20160816;
        b=lbOopSxX/8Vyg22uPMo3u5j7awRgjz8TRDqcGQFdAqn2VHf+ugDBmLRR2FCYs0MDnF
         05A89h3mWwtqf5Y0qzU6HJk3z7J3ImGUkQE1IfcElM/PWLVyYB130Q6oGMA38eQ9h18i
         TuYltXABk4lBfS+1akk5hS3usIpDxl/onGME3dT7i6d2DtZvmWB0VgnidDTFa15hWQ8i
         7flb1r1CxGQWgL1ttDXxtSA/L+s3mRCek+qr+QsR+xkvT7ANeWyjYXue7a5T2Z4WaWuJ
         1FDSVbVDKozWQ7278bDXjJ2ftsMJT2bBkR3ewTG0HvkwpvtCyyNCbEac0a1AgJWAfKZ6
         heBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=+fiFIiGq9PugSs6Ix7HWJBRqGwTo9szrwno+bbtDCrc=;
        b=la/r0slesIwbTJyBw8gQcHBkeWAM+tKQJkvZem8eJAgM0kh0fq5KC1SzrCtXCN2q+S
         0o0YBctJ5v2HJZH8U5Uk8Bbe0eXUjtPKbQHV64sABkd5AmVJ0tdbjbjYEoeYjg7+tt4G
         bsUdjrBserz9j3H9e92b//hJ6XJTXfrwe2tE0pJ56H/XbZj2VnbAsJJcQCcBZVyMRjWg
         zLiFcDgv9PLen3cVhDUxGErEIFFzUaJhA6h5hlUELj+udfoNq8TOrYsa86HqSNJe6aqE
         LLLdybepJBuc2ZpKL6PESwiql+6i1kBNN41roQanBifP6aORMsnAAhyjTjH+KjuZVQmh
         pd2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T5cDkq8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r25si2214409pgv.342.2020.09.01.14.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 14:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T5cDkq8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDDSt-0005b1-Ti
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 17:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDDSj-0005ab-T1
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 17:05:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40917
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDDSi-0000ga-8q
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 17:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598994303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fiFIiGq9PugSs6Ix7HWJBRqGwTo9szrwno+bbtDCrc=;
 b=T5cDkq8bTATufg7gZJXbTa3jQjgIbJ1bNJwpOYYsjqjkVtymHMnT/dpDSTfUHIilUNx7IB
 0gmf/3Vg9oQ/cIA59XorggwiWIwWXiPKh+QR7VUe0rli8smcSaa/k9c56C/XSvNF/15HXJ
 vkxvXOo074l4aftjDxNymizfF1KbP0M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-ltFFmHjpNYKNpNipp61TiA-1; Tue, 01 Sep 2020 17:04:28 -0400
X-MC-Unique: ltFFmHjpNYKNpNipp61TiA-1
Received: by mail-qv1-f70.google.com with SMTP id dn10so1950580qvb.2
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2020 14:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+fiFIiGq9PugSs6Ix7HWJBRqGwTo9szrwno+bbtDCrc=;
 b=H/AtsO0+NbZK+3V+ZMhJIto4l+1Gv3S/uL7BPaCDr6ut3dBXSF3+5KtNxooe3qhngp
 /8s5R6t+GDsAHFFchzV94yQ74j8/na4K7Ub93A4I5CRtYPOlxnEDbk+YapTdHizMecvz
 63FRnzxfCRCEdg56K5OmNW1peYocqIgBUUaPjndUTuuNgCs6YTmQ3XAJO6sAJ6ZKqpFM
 bkky/GaexvDtIchEr3qpuaLk3qlVowcOD8WQXY5J99uykjR8P7bmNX2tqw+JgSq5YhiA
 75mAdeDA9hhME0FWHI5PZ/ihlNHlFBCWDnMw9TlFFJI/yBkSffFiz+2QoxnL77bSyXtH
 VRmw==
X-Gm-Message-State: AOAM5336HpV9O7P/sx+FE3qk/vccC2jptWa9D/JCDt1vJcMolmqNCfHI
 XrR2F9JcbQTfwQAV7MDfHjpIwxf0hV56rfngHY8JYXuy083lPMo+vnTP6GSk47Lu4KRUqtxJPPY
 pDkzFRKtj6I3j
X-Received: by 2002:a37:c404:: with SMTP id d4mr3753465qki.273.1598994267763; 
 Tue, 01 Sep 2020 14:04:27 -0700 (PDT)
X-Received: by 2002:a37:c404:: with SMTP id d4mr3753427qki.273.1598994267519; 
 Tue, 01 Sep 2020 14:04:27 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id m26sm3001780qtc.83.2020.09.01.14.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 14:04:26 -0700 (PDT)
Date: Tue, 1 Sep 2020 17:04:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC v8 4/5] intel_iommu: Do not notify regular iotlb to
 device-iotlb notifiers
Message-ID: <20200901210424.GF3053@xz-x1>
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-5-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200901142608.24481-5-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=peterx@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 05:11:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aaXrtlGYomx+

On Tue, Sep 01, 2020 at 04:26:07PM +0200, Eugenio Pérez wrote:
> This improves performance in case of netperf with vhost-net:
> * TCP_STREAM: From 1923.6Mbit/s to 2175.13Mbit/s (13%)
> * TCP_RR: From 8464.73 trans/s to 8932.703333 trans/s (5.5%)
> * UDP_RR: From 8562.08 trans/s to 9005.62/s (5.1%)
> * UDP_STREAM: No change observed (insignificant 0.1% improvement)

Just to confirm: are these numbers about applying this patch before/after, or
applying the whole series before/after?

Asked since we actually optimized two parts:

Firstly we avoid sending two invalidations for vhost.  That's done by the
previous patch, afaict.

Secondly, this patch avoids the page walk for vhost since not needed.

Am I right?

> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index cdddb089e7..fe82391b73 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1964,6 +1964,12 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
>      vtd_iommu_unlock(s);
>  
>      QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
> +        if (vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_DEVIOTLB) {
> +            /* If IOMMU memory region is DEVICE IOTLB type, it does not make
> +             * sense to send regular IOMMU notifications. */
> +            continue;
> +        }
> +

We want to avoid vtd_sync_shadow_page_table() for vhost, however IMHO a better
expression would be:

    if (!(vtd_as->iommu.iommu_notify_flags &
        (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP))) {
        continue;
    }

The thing is we can't avoid the page sync if e.g. we're registered with
MAP|UNMAP|DEVIOTLB.  The important thing here, imho, is MAP|UNMAP because these
two messages are used for shadow page synchronizations, so we can skip that if
neither of the message is registered.

Besides, we can add this at the entry of vtd_sync_shadow_page_table() so that
all callers of vtd_sync_shadow_page_table() can benefit.

>          if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
>                                        vtd_as->devfn, &ce) &&
>              domain_id == vtd_get_domain_id(s, &ce)) {
> -- 
> 2.18.1
> 

-- 
Peter Xu

