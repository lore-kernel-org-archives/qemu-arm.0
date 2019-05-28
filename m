Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6987728wrg;
        Mon, 27 May 2019 21:48:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoXpmBBkeBbWPnyPp//zweNPOF89p09L0VHmIsGLl9DzlpLvfILzk9iUr+rac0VkuSPMDh
X-Received: by 2002:ac8:2ac5:: with SMTP id c5mr89732863qta.332.1559018933052;
        Mon, 27 May 2019 21:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559018933; cv=none;
        d=google.com; s=arc-20160816;
        b=uqckbPatRtVWsXvr/jSmu7dy/U/8oug5bwH7uBO+D+3XI6cmSTLWGyjp5x/DVlQTAU
         lA5X9M/ECsFe0xca/10WHwnjfvQMkLHlfcxwOWLGYjLZa25VCMXLJNAynx7GAX63IdWg
         58j9peWGEgJLJwlIBEF7P7ODXGK6O+WK7J7+2qL3cambu8Sx5V+A+LOtqJ50VCUSVfDG
         cUzLPLxuQWq8ArYhwYq4J7AL/rQUySFP/B00IQGypdWewu+EoAgFMSeA/2zZGf13zaDT
         xEefptwHlHkx2a7iOdbEeCxQfPVHLGEOaA/L7JOGdFV9fDewAA5FDpUeZglGwzS38SIR
         M8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=zgM5lMo2nCzKq8swiS2rUDQSTxH/fPIvScbyV2rSWw4=;
        b=s48uvEZyqDUgKzxcHBNVcszyvWPSoxurAdnK0MmJ2EQhjpWzdX+0e1vRsd5o043MIz
         oOSkfMroo/FAb5CJaCnPC2r1C38QFM/iwIm81SWf6oIkXjyGEjoMlo+Bauwmy9axlx6T
         mRl6MGPfSLw/EuaMqZQEvyMrUGD0JbM+WwE0liRSNMM/n0aAn8Uhb3ux3cYHMzYszYpe
         hwB6BT8Zz720oMbVbKRVsSpkrLhJfba3Nj2AjIuICYrC/WlPTo1MwW66tvOInSAgT95h
         bHEncBjq263Q5xYsmUCb5Fh1s/cVveax440X7fm5EVUVfwrCpzVl60ZmN5SMiynjL7KE
         r8qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v30si1249416qtb.153.2019.05.27.21.48.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 21:48:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:57117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVU2e-0000ip-JN
	for alex.bennee@linaro.org; Tue, 28 May 2019 00:48:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hVU2T-0000ih-J0
	for qemu-arm@nongnu.org; Tue, 28 May 2019 00:48:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hVU2S-0001tg-MB
	for qemu-arm@nongnu.org; Tue, 28 May 2019 00:48:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1hVU2S-0001tE-FD; Tue, 28 May 2019 00:48:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E0C63082163;
	Tue, 28 May 2019 04:48:39 +0000 (UTC)
Received: from xz-x1 (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE9617A4E4;
	Tue, 28 May 2019 04:48:27 +0000 (UTC)
Date: Tue, 28 May 2019 12:48:25 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190528044825.GB23180@xz-x1>
References: <20190527114203.2762-1-eric.auger@redhat.com>
	<20190527114203.2762-10-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190527114203.2762-10-eric.auger@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 28 May 2019 04:48:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v4 09/27] memory: Prepare for different kinds
 of IOMMU MR notifiers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, yi.l.liu@intel.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	zhangfei.gao@foxmail.com, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	vincent.stehle@arm.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sdl1LbdX2iEu

On Mon, May 27, 2019 at 01:41:45PM +0200, Eric Auger wrote:

[...]

> @@ -3368,8 +3368,9 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
>  {
>      IOMMUTLBEntry entry;
>      hwaddr size;
> -    hwaddr start = n->start;
> -    hwaddr end = n->end;
> +

(extra new line)

> +    hwaddr start = n->iotlb_notifier.start;
> +    hwaddr end = n->iotlb_notifier.end;
>      IntelIOMMUState *s = as->iommu_state;
>      DMAMap map;

[...]

>  typedef void (*IOMMUNotify)(struct IOMMUNotifier *notifier,
>                              IOMMUTLBEntry *data);
>  
> -struct IOMMUNotifier {
> +typedef struct IOMMUIOLTBNotifier {
>      IOMMUNotify notify;

Hi, Eric,

I wasn't following the thread much before so sorry to ask this if too
late - have you thought about using the Notifier struct direct?
Because then it'll (1) allow the user to register with both IOTLB |
CONFIG flags in the same notifier while currently we'll need to
register one for each (and this worries me a bit on when we grow the
types of flags further then one register can have quite a few
notifiers) (2) the notifier part can be shared by different events.
Then when notify the (void *) data can be an union:

struct IOMMUEvent {
  int event; // can be one of the notifier flags
  union {
    struct IOTLBEvent {
      ...
    };
    struct PASIDEvent {
      ...
    };
  }
}

Then the handler hook would be simple too:

handler (data)
{
  switch (data.event) {
    ...
  }
}

I would be fine with current patch if this series is close to be
merged because even if we want that we can do that on top when we
introduce even more notifiers, but just to ask loud first.

> -    IOMMUNotifierFlag notifier_flags;
>      /* Notify for address space range start <= addr <= end */
>      hwaddr start;
>      hwaddr end;
> +} IOMMUIOLTBNotifier;
> +
> +struct IOMMUNotifier {
> +    IOMMUNotifierFlag notifier_flags;
> +    union {
> +        IOMMUIOLTBNotifier iotlb_notifier;
> +    };
>      int iommu_idx;
>      QLIST_ENTRY(IOMMUNotifier) node;
>  };
> @@ -126,15 +132,18 @@ typedef struct IOMMUNotifier IOMMUNotifier;
>  /* RAM is a persistent kind memory */
>  #define RAM_PMEM (1 << 5)
>  
> -static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
> -                                       IOMMUNotifierFlag flags,
> -                                       hwaddr start, hwaddr end,
> -                                       int iommu_idx)
> +static inline void iommu_iotlb_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
> +                                             IOMMUNotifierFlag flags,
> +                                             hwaddr start, hwaddr end,
> +                                             int iommu_idx)
>  {
> -    n->notify = fn;
> +    assert(flags & IOMMU_NOTIFIER_IOTLB_MAP ||
> +           flags & IOMMU_NOTIFIER_IOTLB_UNMAP);

Can use IOMMU_NOTIFIER_IOTLB_ALL directly?

> +    assert(start < end);
>      n->notifier_flags = flags;
> -    n->start = start;
> -    n->end = end;
> +    n->iotlb_notifier.notify = fn;
> +    n->iotlb_notifier.start = start;
> +    n->iotlb_notifier.end = end;
>      n->iommu_idx = iommu_idx;
>  }

Otherwise the patch looks good to me.

Regards,

-- 
Peter Xu
