Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1218736lfq;
        Thu, 17 Sep 2020 23:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPTHH2VvFraHMMR63/rv0JCrQHiwsuhz3tuSpnnjELFRZM8OHUBS0ooufipohnjH57UIke
X-Received: by 2002:a25:d94d:: with SMTP id q74mr4302013ybg.452.1600409235650;
        Thu, 17 Sep 2020 23:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600409235; cv=none;
        d=google.com; s=arc-20160816;
        b=MC/8P9VJJGwcB55pKI5kUPxY6qeADYnnCAH8vagUppBqdHvHb+kz54xMf0ZpXo9ni0
         YIgB/GkxJHyZJkW5DDcuF3LeGmU1k6NBiGzbf/FTTFHqblHhmv3ebmjHrNBpo/Puv5Gq
         LEpJJwNv//zA1PCcnF96ZqgBh8J+Z6HJC4/7PMuqQS4vMr41Jizh1BuPjdpAlH4Zn/4+
         YtzNc0q1s2Y8lc8LsVp3WjBD5PgQ29afy9T2/ZUGe4Nr8CJ6ewAFm94/Tt1X+gwHDvgL
         wVQyBB6rQjIxpT06h/y7jCtHb/FVTVQo0+/7gGeu/n5h1TVqh3XRySvUhk2AbsGoq0+X
         x4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=eCeaC09GJfaBk6/BODPIGS4nLmuzCYpOTPEr0hedHIk=;
        b=aXmLUzsTxVahqosph6c2kHOOWohmP7KaqGrELZ/z9UKy5Wuw4I/7XPpH/TIJn7brqr
         Utgpaqa7Vswc9Umth+Nf2lLDatCCdT2wTiyNj9PyKd6mFJX9v1DNOnC89nOpgqeQJS00
         q3AhPbxoF4UiKrLwODZRofXHEDPcOcfON6X67Qzduc02FlOsv3TfaQto1fIHXAMjDlPi
         RGyrzjOSqEiWR3x1GFcuzIM6Q2PqgunJaH/mS6AkvNWYxU198ZzHs3QqryCUYae1b25S
         cMxqavGw4sNGQT0qClXcAPEF003lYIa0ThBk16Tqm169m+IgKYOaBQ7g2vm2ygmHdw/R
         CMyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TWkPvnEG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si2086801ybs.374.2020.09.17.23.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 23:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TWkPvnEG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kJ9YB-0004Tg-1j
	for alex.bennee@linaro.org; Fri, 18 Sep 2020 02:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kJ9Y2-0004TN-6B
 for qemu-arm@nongnu.org; Fri, 18 Sep 2020 02:07:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kJ9Xy-0001F8-Kw
 for qemu-arm@nongnu.org; Fri, 18 Sep 2020 02:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600409221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eCeaC09GJfaBk6/BODPIGS4nLmuzCYpOTPEr0hedHIk=;
 b=TWkPvnEGdujedaDAJld5D+FKwQh5/a9QETKTqVDFZqU5qb8vOVK6It2o0fhgcKO2RBy6G9
 ED0WQqfolftZAvXqhC0hZbgh+vHgSJ7V/C+eGnTJFSnqgilcVrffDaYCufvVN4WUgNY1su
 w16ZqvjXjpgnRFe7HGu/SnLPVBUFR/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-jpQlr_-NPs-C3WjZ5USyVg-1; Fri, 18 Sep 2020 02:06:57 -0400
X-MC-Unique: jpQlr_-NPs-C3WjZ5USyVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 835E21868437;
 Fri, 18 Sep 2020 06:06:55 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D1C460FC2;
 Fri, 18 Sep 2020 06:06:51 +0000 (UTC)
Date: Fri, 18 Sep 2020 08:06:49 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [RFC PATCH 04/12] device_tree: add qemu_fdt_add_path
Message-ID: <20200918060649.oi5cdgouuopf45us@kamzik.brq.redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-5-fangying1@huawei.com>
 <20200917081239.bdfhkofodqvhg3i6@kamzik.brq.redhat.com>
 <a0ef33da132a411a8da14a8b05f78c1d@huawei.com>
MIME-Version: 1.0
In-Reply-To: <a0ef33da132a411a8da14a8b05f78c1d@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 00:20:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, Alexander Graf <agraf@suse.de>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 fangying <fangying1@huawei.com>, "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dwKvhbU19hyV

On Fri, Sep 18, 2020 at 12:25:19AM +0000, Salil Mehta wrote:
> 
> > From: Qemu-arm [mailto:qemu-arm-bounces+salil.mehta=huawei.com@nongnu.org]
> > On Behalf Of Andrew Jones
> > Sent: Thursday, September 17, 2020 9:13 AM
> > To: fangying <fangying1@huawei.com>
> > Cc: peter.maydell@linaro.org; Zhanghailiang <zhang.zhanghailiang@huawei.com>;
> > Alexander Graf <agraf@suse.de>; qemu-devel@nongnu.org; Chenzhendong (alex)
> > <alex.chen@huawei.com>; shannon.zhaosl@gmail.com; qemu-arm@nongnu.org;
> > alistair.francis@wdc.com; imammedo@redhat.com
> > Subject: Re: [RFC PATCH 04/12] device_tree: add qemu_fdt_add_path
> > 
> > On Thu, Sep 17, 2020 at 11:20:25AM +0800, Ying Fang wrote:
> > > From: Andrew Jones <drjones@redhat.com>
> > >
> > > qemu_fdt_add_path works like qemu_fdt_add_subnode, except it
> > > also recursively adds any missing parent nodes.
> > >
> > > Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> > > Cc: Alexander Graf <agraf@suse.de>
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > ---
> > >  device_tree.c                | 24 ++++++++++++++++++++++++
> > >  include/sysemu/device_tree.h |  1 +
> > >  2 files changed, 25 insertions(+)
> > >
> > > diff --git a/device_tree.c b/device_tree.c
> > > index b335dae707..1854be3a02 100644
> > > --- a/device_tree.c
> > > +++ b/device_tree.c
> > > @@ -524,6 +524,30 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
> > >      return retval;
> > >  }
> > >
> > > +int qemu_fdt_add_path(void *fdt, const char *path)
> > > +{
> > > +    char *parent;
> > > +    int offset;
> > > +
> > > +    offset = fdt_path_offset(fdt, path);
> > > +    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
> > > +        error_report("%s Couldn't find node %s: %s", __func__, path,
> > > +                     fdt_strerror(offset));
> > > +        exit(1);
> > > +    }
> > > +
> > > +    if (offset != -FDT_ERR_NOTFOUND) {
> > > +        return offset;
> > > +    }
> > > +
> > > +    parent = g_strdup(path);
> > > +    strrchr(parent, '/')[0] = '\0';
> > > +    qemu_fdt_add_path(fdt, parent);
> > > +    g_free(parent);
> > > +
> > > +    return qemu_fdt_add_subnode(fdt, path);
> > > +}
> > 
> > Igor didn't like the recursion when I posted this before so I changed
> > it when doing the refresh[*] that I gave to Salil Mehta. Salil also
> > works for Huawei, are you guys not working together?
> > 
> > [*] https://github.com/rhdrjones/qemu/commits/virt-cpu-topology-refresh
> > 
> 
> 
> I was not aware of this work going on. I am based at Cambridge and Fangying
> in Hangzhou and work for different teams.
> 
> Yes, I have it and have integrated it with the Virtual CPU hotplug branch
> and I am testing them.
> 
> I have also rebased virtual cpu hotplug patches and integrated the PMU
> related changes recently been discussed in other mail-chain. Plus, I am
> also dealing with the MPIDR/affinity part from the Kernel which has been
> discussed earlier with the Marc Zyngier. 
> 
> It looks some of the changes are common here like ability to set MPIDR
> of the vcpus at the time of their creation inside KVM. And the PPTT
> table changes which were present in your refresh branch as well. Changes
> related to the possible and present vcpus might need a sync as well.
> 
> @Andrew, should I take out the part which is common and affects the
> virtual cpu hotplug and push them separately. This way I can have part
> of the changes related to the vcpu hotplug done which will also cover
> this patch-set requirements as well? 

Whatever works best for you and Ying Fang. It looks like this series
only focuses on topology. It's not considering present and possible
cpus, but it probably should. It also adds the cache hierarchy stuff,
but I'm not sure it's approaching that in the right way. I think it
may make sense to put this series on hold and take another look at
your hotplug series when it's reposted before deciding what to do.

Thanks,
drew

> 
> @Fangying, will this work for you?
> 
> 
> Salil. 
> 
> 

