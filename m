Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp875128lfc;
        Wed, 26 Aug 2020 08:54:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8WI6GfntRS1lWwnELRgUrDY0gd7YKII64tVXB50Q902Xv7IjcrGCEEqN356JauRGFjJtf
X-Received: by 2002:a25:5807:: with SMTP id m7mr1927919ybb.456.1598457275892;
        Wed, 26 Aug 2020 08:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598457275; cv=none;
        d=google.com; s=arc-20160816;
        b=ecC17jSraeRKHLcJqzCSZwIgEMKWEiGj5XMo9COy2TpesdcEa/KM4NuDAQ//zEeIDu
         XD2PJDYUyxrPERh9TjQINySqKcMQL4zV9eXRL8XGP9eKSYTnCAK3ZONWMfCoK8mQZ9P1
         270CskzEUEA83swpg3i1zxoVgnY6vUKGz8A5RitUz/uaLY3+NdSwoHJtXejLYT0HCYVL
         MNHTDVim38ZT6OXFhufviDFcX7HQ5ZUphn9pel+EyxNcJAetADBGcS7pUzjKvPVC6COj
         8MTBGDoug2aN8+zYSrOXLordJs3KfLBH7gEKzgF1/AWXAJ+zRJTWkitiirlrvP71IrWf
         NR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=UC9RQr9mgbHg1iufnazAZQaDYmD//qufqDi9sj6lVP0=;
        b=cPdIZIG/i+ZrlJp7oErcVC40At+pdXQD+4GtHW44IOuAaYBv+beQW4z6Bq52+IZb5r
         VP+VPByT5Jbd4I3rfQYB8YwOSjWS7s0bRJHRlZQaKMb+UkOFDMoOBed586E9ZjK/lKsw
         hW2f1/jKU8MzQA8sl3CeFdIJe03ZAnUctilATNtpY9B0YNKlU9U1W+e+u+M4syrhY6B6
         9s3OKPG6fG5Swfw8KHaaPBvS7tvhnsFyp/33sSZEiOd+W2KHLWmoDfTaVQpG/npJJHdJ
         Zk1A5hZm352XZOvjkIBJO7MVjlKRPPMq2qJ8mA2XOcujhkSb8RuFY0BZxDw5DeXnEkoC
         /fbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KHistFr+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si2848970ybt.76.2020.08.26.08.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 08:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KHistFr+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAxkx-0001sZ-9y
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 11:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kAxkf-0001hl-0o
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 11:54:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kAxkd-0001sE-CA
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 11:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598457254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UC9RQr9mgbHg1iufnazAZQaDYmD//qufqDi9sj6lVP0=;
 b=KHistFr+77+Z+nJ3JD6qPoUabWCkuU1QOxB9x4B5CnCaK0EmBertioisheR01urhWEt4VS
 2qj6OHmltOgStFW9m3HWUv5lIQ8Bswxj2FQq0BIWBmpIqAJGginbJjfhvmwLMRk6a+HF2I
 OEiF7urMNjkL0DEXoknWihGyM9dAnQI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-ADX6XDdEPxSUipJWsLEcdA-1; Wed, 26 Aug 2020 11:54:13 -0400
X-MC-Unique: ADX6XDdEPxSUipJWsLEcdA-1
Received: by mail-qt1-f200.google.com with SMTP id e11so2035813qth.21
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 08:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UC9RQr9mgbHg1iufnazAZQaDYmD//qufqDi9sj6lVP0=;
 b=JDOFT0ObVsMHzxe2913RqLqRDLJza1wRWwUzJXfvRc/C7t/9sDBQVuoH2NFrXFKOvw
 71P0X32aS032aODiaBiHD9nkBPU/I+0usa4mtE0rBmgJp/IB01GCPcdBw+kM5+JWMF2o
 Jeb5XJCTVCpm1GycY/3oWU90RKPLtYu8C+8cwRK0QWacM+3nWuQbJvyqxkHBftZ1avKp
 W9TXNxJZhnMRH8pPyuzUWRzIQd1sklXtr9SJka85LdZZEks5sE8DKibqguubPv6BdYjo
 ivoiOSnUO70BjhArzb27H3HOvid6cjXYZ6hrbsGjG3mqKWcZgvSMhYPzLCIDWJstZ7Dk
 r4FQ==
X-Gm-Message-State: AOAM5331seZkt2Mot0EPOQAQWkY413REVuLxd17lPxxoG5aeJIDQbXOp
 hsIU2D8f7AOJHEFD40MgCfYJ9cv0swG+UjvSZFfL+5IlirP3ydo7JW+8McWj3yIRy6DY+bCUABp
 4irdiWTFXyUWr
X-Received: by 2002:a37:7f47:: with SMTP id a68mr14299583qkd.163.1598457252586; 
 Wed, 26 Aug 2020 08:54:12 -0700 (PDT)
X-Received: by 2002:a37:7f47:: with SMTP id a68mr14299557qkd.163.1598457252327; 
 Wed, 26 Aug 2020 08:54:12 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id y3sm1979374qkd.132.2020.08.26.08.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 08:54:11 -0700 (PDT)
Date: Wed, 26 Aug 2020 11:54:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC v6 00/13] memory: Delete assertion in
 memory_region_unregister_iommu_notifier
Message-ID: <20200826155409.GG8235@xz-x1>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
 <CAJaqyWf5vgSNvix99aWzrm2kDZ5xHQ_binRkpTe7WifDrLCjyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWf5vgSNvix99aWzrm2kDZ5xHQ_binRkpTe7WifDrLCjyw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 23:30:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YSMvwtxJQUk8

On Wed, Aug 26, 2020 at 05:00:30PM +0200, Eugenio Perez Martin wrote:
> Hi!
> 
> Sending v6 to see if that is on the same page as what you meant.
> Making each setting of "type" explicitly IOMMU_IOTLB_NONE if not used
> in notifications. This is done in different commits in case this helps
> review of different architectures.

I've also proposed IOMMUTLBEvent in the other reply, that might help too.

Since at it, there's also another trick to use - we don't need to touch those
"type" as long as the default type is "zero", so as long as we make sure the
default type (IOMMU_NOTIFIER_NONE) is zero, then we don't need to set it
everywhere either.

> 
> I think that this way we have too much freedom between entry flags
> (currently only access type, RW) and notification type. Since not all
> of them are valid nor used in the same context, I think this adds
> complexity. I'm wondering if:
> 
> Option a) We could make it private to memory.c, and make it a flag of
> memory_region_notify_iommu (like "bool deviotlb_type)". IOW, instead
> of making it a member of IOMMUTLBEntry, wrap the "entry" parameter of
> memory_region_notify_iommu in a new private structure defined in
> memory.c that adds that flag.

No strong preference from me.  But since you posted the series before you
provide the options... Maybe continue with what we have can be easier. :)

> 
> Option b) We could keep the IOMMUTLBNotificationType enum (open to
> suggestions for a better name :)), but not embed it in the struct,
> like:
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 477c3af24c..d9150e7b7e 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -72,7 +72,8 @@ typedef enum {
>      IOMMU_RO   = 1,
>      IOMMU_WO   = 2,
>      IOMMU_RW   = 3,
> -} IOMMUAccessFlags;
> +    IOMMU_DEVIOTLB = 4,
> +} IOMMUEntryFlags;

Just in case you didn't notice - IOMMUAccessFlags is actaully a bitmap. :)

IMHO we can keep the IOMMUAccessFlags scemantics, since it's still correct for
a general translated IOMMUTLBEntry object.

Thanks,

-- 
Peter Xu

