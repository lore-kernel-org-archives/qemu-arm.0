Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp877016njc;
        Thu, 13 Feb 2025 12:58:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXaPCNtaHb3hnf4xYaUSMY2EHob6w90Gs0/FYYzWDa1wG6c0mb6snFrVSFhC0ssCsVUyb0La9MXGPqGfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEniXKHAxMsJIDcfHfzFqB642Oq1wWUj9dKer1TIXUSDXMgzuG0dAz+10veHOuQhp+4qoXE
X-Received: by 2002:a05:620a:4154:b0:7b6:e47a:8e1d with SMTP id af79cd13be357-7c07a14eca8mr700046185a.31.1739480332232;
        Thu, 13 Feb 2025 12:58:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739480332; cv=none;
        d=google.com; s=arc-20240605;
        b=fb566Kq0y75+vroRctMAfnCCymbnmfi+Hz9aX23Kcb9klthUdC6pIDANgqsvXCpJTT
         QxzuUShxr1kJLV5NtjsBNlt+mPCXwxLAGinSyJLroe0K1bPSUxTwMyuTGU8YxSTf2q8B
         qiWUUkfQDqplMTqDjFzlW/DBfF7kn2jN8xzvU6F5rcrjO1xSlVVKmQV2AVyk143kIHjc
         GOYHVSzKsYjphFVQVApf/l8gjxPFrrK08BvhwxGjQnBxho/F7t0lnlkE7A1YxQiLeQDO
         u3Vd++FNvXEwkpfJ0FfpQHtjYK8/xcQotHkL41yp9oyx2gHz3ec5ZqIWBxqi0eiDW94T
         o92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=vIwv28Eg9o+8B62iOwIAut8oKASTwz+J/sQ3Qky9Q8c=;
        fh=Tv69pGE2DMYt/edAGn69p7Nw3txNkgHUvJmq8XDvKFQ=;
        b=FByZsn4fbAR7Qy6BzUHLch7y67IxzS2Yd9Xt6Q5IVrsQvUe7bi/kxGC50vrsOTvoNE
         uawg0Q25qzvf4dxCaH3aLDwO2xlrF8UWyG+dfmsVysh+ti46UllDHNvPctzb23qKMWBA
         m9eG796BB7vkoZDI+iDCwEJBvZFDeTYMYIyNZdh6+B3JeLt6z6GgduPetuEORPvyABOe
         qgD/QS0iqGi3pmiVvIkZdPvChtI5NvFeFhkEpIXuD/tutqLb7D+zIAw3z2Jj3OUYf3Xk
         SNDF1E2Z3b81+GBXrfnBvsI8OLnvz5DNTuRUMuhdM4IGdOLfvhFzgeSleDNp9RNx19I0
         eKlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QaibO+40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c8bb1a6si191356485a.492.2025.02.13.12.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 12:58:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QaibO+40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tigI6-0001e5-0v; Thu, 13 Feb 2025 15:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1tigI2-0001dg-Ss
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 15:58:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1tigI1-0001BB-8q
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 15:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739480307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vIwv28Eg9o+8B62iOwIAut8oKASTwz+J/sQ3Qky9Q8c=;
 b=QaibO+40Jjy2NNhRIwRomSED4kjuaDp32hOQJRf79ZA4+8+4dbeiY5xwndWJW3MMaSFDc+
 cJU6KgvX6mgOkjL9yDb/dSO0EelpLhx8k144OeRZLBD3zfwMfgfuPaFfsWt/OeLjG3lHIF
 mv29QfYZ8oU6vbRE0U93B2MYZZNFQoc=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-NTyoB8uQMAqJbg4uCcd2Ow-1; Thu, 13 Feb 2025 15:58:23 -0500
X-MC-Unique: NTyoB8uQMAqJbg4uCcd2Ow-1
X-Mimecast-MFC-AGG-ID: NTyoB8uQMAqJbg4uCcd2Ow
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-2bc76a4085aso138383fac.3
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2025 12:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739480302; x=1740085102;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vIwv28Eg9o+8B62iOwIAut8oKASTwz+J/sQ3Qky9Q8c=;
 b=gZOEincLi4ODefQHcX1FX86zKifwF6nOK6C4xEWnq0hc/BQSFjnj5rmq7MjFLp0dAH
 jf+SlCchfIjjYyN4ixHu7Qz13mT4a6XCiQkv5JjrjYlbzVtA2rOkx26cuTZF9C+MjVaq
 zjdVcEdmyHGCXoRZ7Hf6owEdpPHY8xOprgYJZ3ciK6VTMJ4qNgwXX4fDANPMzednyOGe
 FHz0xQFEIXF7jW0KRu9wcujmasd4RCNIDkz6r2FhgYrOWLHdXHuGkdfmxrM+3LlTCohc
 iupbGDy/TePbDo6Sc2LgpKAdoMHUtvezKLzudqH5TD4T4dqY+u4DNKtz6TFaEyPCBkkC
 epWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsyW8nJJYVMaeDNtXQYBFwLO3ki+DsYFVAs3GYiY/+CDzHpkcXBmsrtDQJoUngFKCA6L7lMUrvrQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxq5/GUBoOUIBPx4smsBQDqbFrbvlrDqILdE2znhkH3Ux/ER3U4
 yIKDqcUOA4UsEuChc2akzSHMBY5C1PTZqXHeXA5WycWRhdD7URmcRIaqzIyvMAWLcmAjqeIooO9
 ssu2nKmEHXF66vnI3f4HPxqBqReA//O7RTZIcv7f2AMQ2TPdXHQ==
X-Gm-Gg: ASbGnctj3RiWKBZ3gDFBUiEfNGsbV9jPspnWQe+HiCiTkhfUKxjkOJdhOdhc3H+rda5
 C2p84zpJqWVa2g8vfqpw/oV+W1CRU30QjdOi3ySAeY/80mChVq4KCrDj73fYnXVlSH6WqR+D+qK
 gdZH4FSLK2QFYHp+rqTiDdIdbrL+MVIMNp/yTF8nRGdrl3d+QJe8SvT+G3mVZacs59w8CaBb/uq
 40pj9M8yJWU/d823aLH2QQFJ59pRRslM3QMc7E6Kr7OJKJ/wG8IS90o+Rk=
X-Received: by 2002:a05:6871:1c5:b0:2b7:f2dc:a4c2 with SMTP id
 586e51a60fabf-2b8f8c0129emr2590474fac.18.1739480302181; 
 Thu, 13 Feb 2025 12:58:22 -0800 (PST)
X-Received: by 2002:a05:6871:1c5:b0:2b7:f2dc:a4c2 with SMTP id
 586e51a60fabf-2b8f8c0129emr2590455fac.18.1739480301793; 
 Thu, 13 Feb 2025 12:58:21 -0800 (PST)
Received: from x1.local ([2604:7a40:2041:2b00::1000])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b954820707sm1112555fac.10.2025.02.13.12.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 12:58:20 -0800 (PST)
Date: Thu, 13 Feb 2025 15:58:17 -0500
From: Peter Xu <peterx@redhat.com>
To: William Roche <william.roche@oracle.com>
Cc: david@redhat.com, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, pbonzini@redhat.com,
 richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, joao.m.martins@oracle.com,
 Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v8 0/3] Poisoned memory recovery on reboot
Message-ID: <Z65c6W98c9hruUIE@x1.local>
References: <20250211212707.302391-1-william.roche@oracle.com>
 <Z6vQvr4dCCsBR2sX@x1.local>
 <6e8aedfc-f270-4fa8-a1d3-df0389e505cb@oracle.com>
MIME-Version: 1.0
In-Reply-To: <6e8aedfc-f270-4fa8-a1d3-df0389e505cb@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wSl-IorpHh6F25BDQkveC_aAr0gicNQofSTRff_5agY_1739480302
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mXV6mWhMPm0x

On Thu, Feb 13, 2025 at 08:35:09PM +0100, William Roche wrote:
> On 2/11/25 23:35, Peter Xu wrote:
> > On Tue, Feb 11, 2025 at 09:27:04PM +0000, “William Roche wrote:
> > > From: William Roche <william.roche@oracle.com>
> > > 
> > > Here is a very simplified version of my fix only dealing with the
> > > recovery of huge pages on VM reset.
> > >   ---
> > > This set of patches fixes an existing bug with hardware memory errors
> > > impacting hugetlbfs memory backed VMs and its recovery on VM reset.
> > > When using hugetlbfs large pages, any large page location being impacted
> > > by an HW memory error results in poisoning the entire page, suddenly
> > > making a large chunk of the VM memory unusable.
> > > 
> > > The main problem that currently exists in Qemu is the lack of backend
> > > file repair before resetting the VM memory, resulting in the impacted
> > > memory to be silently unusable even after a VM reboot.
> > > 
> > > In order to fix this issue, we take into account the page size of the
> > > impacted memory block when dealing with the associated poisoned page
> > > location.
> > > 
> > > Using the page size information we also try to regenerate the memory
> > > calling ram_block_discard_range() on VM reset when running
> > > qemu_ram_remap(). So that a poisoned memory backed by a hugetlbfs
> > > file is regenerated with a hole punched in this file. A new page is
> > > loaded when the location is first touched.  In case of a discard
> > > failure we fall back to remapping the memory location.
> > > 
> > > But we currently don't reset the memory settings and the 'prealloc'
> > > attribute is ignored after the remap from the file backend.
> > 
> > queued patch 1-2, thanks.
> > 
> 
> Thank you very much Peter, and thanks to David too !
> 
> According to me, ARM needs more than only error injection messages.
> For example, the loop of errors that can appear during kdump when dealing
> with large pages is a real problem, hanging a VM.

Maybe it'll be better to post arm patches separately so that it can attract
more attention from arm developers specifically.

I see that PeterM is in the loop, besides you could also try to copy Eric
Auger <eric.auger@redhat.com>.  I have Eric copied.  I'm not sure whether
Eric or the team would be interested in this too at some point.

> 
> There is also the remap notification (to better deal with 'prealloc'
> attribute for example) that needs to be implemented now.

Right, this one should be easy, IMHO.  And I hope if prealloc is the only
concern then the impact is low, I mean prefaults for hugetlb pages is less
important comparing to small pages - fault one 1G page which used to be
poisoned may not even be detectable from guest as long as there're still
free 1G available.

> 
> And finally the kernel KVM enhancement needed on x86 to return a more
> accurate SIGBUS siginfo.si_addr_lsb value on large pages memory errors.
> Qemu could than take this information into account to provide more useful
> feedback about the 'failed' memory size.

I confess this isn't high priority for now.  Before hugetlb pages can be
split this isn't providing much help indeed, as QEMU knows whatever the
kernel knows.

It can be more important until someone allows hugetlb pages to split so
poison may only affect 4k out of 1G.  In that case it must report with 4k
of part of 1G.  We'll see how that would work out at last, we may need some
new mm interface to tell the userspace that "when I say 4k is poisoned,
it's really only that 4k..", or something like that.

> 
> I don't know yet when I'll have the possibility to come back to these
> problems, but at least we have the recovery of large pages mostly fixed with
> the 2 patches queued.

Yes, thanks for fixing it.

-- 
Peter Xu

