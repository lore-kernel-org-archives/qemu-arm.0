Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp6136579lfy;
        Mon, 3 Aug 2020 08:17:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUwVOdcUrHlR9xzTEMSUtQeAI8PioVQBMCrpnN2Ej/OHnkl8gdzrtN/eM61xNqtLxAjUBD
X-Received: by 2002:a25:7d41:: with SMTP id y62mr25932366ybc.95.1596467821719;
        Mon, 03 Aug 2020 08:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596467821; cv=none;
        d=google.com; s=arc-20160816;
        b=HWQWYuU907bvmsEooAxgYJaGVtP9VvbIfvFxa3NilZ9ijrduJHWzfVCE8p9rA4p3ym
         /sq9ZnmwFm8qvLe57SjDW2d5Rx4SvaSclcEtePXklE4oXJvS2gd/Ueg0wAIYC8Dy6Qpg
         ipBdlPAdmj6IFCnHjUnWqNMV8Z8RPPTDqRHuiHax/dfhkE2U7qMpmdM3PSK0MKIsltiK
         A3HvdemeFx+K5ZVQl8Q9n6FuEdRgjOUQ+/PGGr6SLmbHlRlAKpQamxEe58wmd2B8TfcU
         LyOkVkDMT+EsVzFP/ZeGTXAEzekGDyQvvPtdzp4E/teOy2NJsFStijGRzphw6jV2KLNi
         6YwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=oWkqQO8NteYQ4DBZsaBy/o6tzsxxwI8DuxsbTGUnyb8=;
        b=XOCV8R9oYZtZ4u+J3B2C0NSHWMR4Iy7kUk9/4mde+rMWolj5yWq5KgRte6atOSeAaU
         guDZAZFlFLrgOnBuV7W4CWhgxsH6PIcOt00GhOSydNkFjpzTLDzvhbxi0QMeg0JEP7I9
         KzSBWg0mTCvEhzckeCStXgvz2tizyuo63tkOKS3dDZMyysRo5LyqJVdBjDcqB2WkdWdx
         E4UYrz3fshpNmoD6aBcr20lGSnLodjIJMAfzB0I7mocWUFgtAteKHJrepWqvLknWbAaw
         cwubaP7zDD6Ut/33cltnfVquiz+Qq1Vsyu4cdZVUb7BCs9yRqm9zOKWQCZsadR5FcOYi
         qzSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Li/KAqSB";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c187si715205yba.355.2020.08.03.08.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 08:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Li/KAqSB";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2cCz-000440-56
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 11:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k2cCG-0003ah-HE
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 11:16:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25360
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k2cCD-0003PX-4t
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 11:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596467771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oWkqQO8NteYQ4DBZsaBy/o6tzsxxwI8DuxsbTGUnyb8=;
 b=Li/KAqSBT3vw4NfBNoBo0eT+diG6RhOQZfGYhpZ6zyZYAGj6gzvWLGDaWpuSK9Y3IUoGUN
 P7lIDdnDBpTEG5+TFDgztlwGD1iPZdLfR5gH3MOWxp2a/u71RA/sSL57n/rhMxVBvJnD6g
 Fnqia8IYyg0r4CuaG/JFfRKbDyWQymg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-CCbqfj5VP9izZ2nk6Yh0EA-1; Mon, 03 Aug 2020 11:16:07 -0400
X-MC-Unique: CCbqfj5VP9izZ2nk6Yh0EA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FFFF1923761;
 Mon,  3 Aug 2020 15:16:06 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14CFE1001B0B;
 Mon,  3 Aug 2020 15:16:04 +0000 (UTC)
Date: Mon, 3 Aug 2020 17:16:02 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] hw/arm/virt: Implement kvm-steal-time
Message-ID: <20200803151602.bervmyxsqg2v5ird@kamzik.brq.redhat.com>
References: <20200711101033.47371-1-drjones@redhat.com>
 <20200711101033.47371-4-drjones@redhat.com>
 <CAFEAcA8h+6btvjvx=j5v7Gn12+bros_UgFScKHaWVxh0dmi-Qw@mail.gmail.com>
 <20200801120030.puzdwi4deczjm6gh@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200801120030.puzdwi4deczjm6gh@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 02:09:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QJZAw38AgLYn

On Sat, Aug 01, 2020 at 02:00:34PM +0200, Andrew Jones wrote:
> > >      if (kvm_enabled()) {
> > > +        hwaddr pvtime_base = vms->memmap[VIRT_PVTIME].base;
> > > +        hwaddr pvtime_size = vms->memmap[VIRT_PVTIME].size;
> > > +
> > > +        if (steal_time) {
> > > +            MemoryRegion *pvtime = g_new(MemoryRegion, 1);
> > > +
> > > +            memory_region_init_ram(pvtime, NULL, "pvtime", pvtime_size, NULL);
> > > +            memory_region_add_subregion(get_system_memory(), pvtime_base,
> > > +                                        pvtime);
> > > +        }
> > 
> > B: I'm not sure whether it wouldn't be useful to have the area
> > allocated with size determined by number of VCPUs instead of having
> > pre-defined size.
> 
> We can't go smaller than one host-sized page, so this 64k region is the
> smallest we can go. The assert in the next hunk, which was snipped
> out of the reply, ensures that 64k is large enough to cover the maximum
> number of VCPUs that could ever be configured. I don't think there's
> anything else we should do at this time. If the pvtime structure grows,
> or if we increase the maximum number of VCPUs to be larger than 1024,
> then we can revisit this in order to determine when additional 64k pages
> should be allocated.
> 
> For now, if it would help, I could extend the comment (which was also
> snipped) to mention that 64k was chosen because it's the maximum host
> page size, and that at least one host-sized page must be allocated for
> this region.
>

In the end, I think I will calculate the size based on host-page-size
and the number of possible guest cpus. The main reason is that it's
actually more awkward to properly document it in a comment than to just
code it. And, we'll also reduce the number of pages that would need to
be migrated when the host is using 4k pages.

Thanks,
drew

