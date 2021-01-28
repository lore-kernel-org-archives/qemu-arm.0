Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp521965lfo;
        Thu, 28 Jan 2021 12:03:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqMWdfFuuz60RkNVbFhcBbf4XEvvH8LkCUbzLSWjrKoar2vrtKcrtsVt3P/hg35Vh+knEN
X-Received: by 2002:a67:7956:: with SMTP id u83mr893569vsc.54.1611864203346;
        Thu, 28 Jan 2021 12:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611864203; cv=none;
        d=google.com; s=arc-20160816;
        b=eRdPgt2YgG7k4U+zdP9NQzy3vIxKL6QEsJ/FEWly0zbAcs2vIQkpptknjbBqhdwelk
         VwcA8iua1ZKRluUXqLGTXkF+K2MWvLAiBKXqApXGlvnt7axk91mtBKqLl1OaIpLZ2aBu
         KNpvq4L057yRcSsJowKVOX+hGwL/hKr2/QPq+pXedpSWXiTXZ9TvjqWPfKMNf1BF7G3n
         37eMaDaHh/o3JmcECm7TCZ4Br8yw98tXhCKpvmR6alfrc6BMTFgi223+6d64WV3Ljqzg
         ktUw0ll7JGRu3TtwQOLAcy3NLcAp1zRY89U7uJ3bjmPHcfXavh2yvqztdwF8UOdDKkeB
         Z4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=2Yw+CxTJiwhviO2vWCtUF8T2PlqR8s06c7/qgVPsiU4=;
        b=1D3ON2yUDoIVHxFUL65Ky7Z/0DV7O0tbc9b9CaZPn9iRDypDtvkNni29ISHqPc8M/t
         YEmXUFOUF+srk6KTdC3WW5jY8B8e2vFyLns6yFqq2XNWWM0XMHgXLdMvHzHd8EbXjUeQ
         yAw4BsGb6w+GA4jLu79kUTdetFYFROzsHGvepb2RR4OJGHNOBp8FD7fzINSeojXGwg5H
         5UNkdcJ7xrjr4piP4JR39lVVbiYT5h6iS4Hoimstfbh3tK1xMIXiGJ4RiqQ0fhijvKWe
         R73DX2I2gbLRFHptVjnKBAIgFMgleZQZo5C+r09mjAtixeyz2KI5nh538jMmZO5Rda4T
         uXEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PTUgpmiO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11si1051621vsr.229.2021.01.28.12.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 12:03:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PTUgpmiO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5DVi-0005Zr-Lw
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 15:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l5DVB-0005Z7-8f
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 15:02:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l5DV9-0006Xq-8r
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 15:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611864166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Yw+CxTJiwhviO2vWCtUF8T2PlqR8s06c7/qgVPsiU4=;
 b=PTUgpmiOIzBIGWtEBwb2OBLrMt7J5bqP2eJkd2eygyQzllIx7hfz/Qe7IFlSCIAtvZaTu6
 ZFKvh09batsuSnBWy01kV2GCAKRYPyXKiFADrhlczLqQ5t01AXKMMHHo21CCkJPZzlFY8o
 r2z1ZZzqT8le8pQCMy1AoCss+D1rQfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-VHC5ONVENnWCf8m1qw9T-A-1; Thu, 28 Jan 2021 15:02:42 -0500
X-MC-Unique: VHC5ONVENnWCf8m1qw9T-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7805C107ACE4;
 Thu, 28 Jan 2021 20:02:40 +0000 (UTC)
Received: from work-vm (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79DEE5D9F4;
 Thu, 28 Jan 2021 20:02:25 +0000 (UTC)
Date: Thu, 28 Jan 2021 20:02:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
Message-ID: <20210128200223.GJ2951@work-vm>
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
 <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 jiangkunkun@huawei.com, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A4I9OD81xId/

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 11/01/21 08:34, Keqian Zhu wrote:
> > +static void vfio_listener_log_start(MemoryListener *listener,
> > +                                    MemoryRegionSection *section,
> > +                                    int old, int new)
> > +{
> > +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> > +
> > +    vfio_set_dirty_page_tracking(container, true);
> > +}
> > +
> > +static void vfio_listener_log_stop(MemoryListener *listener,
> > +                                   MemoryRegionSection *section,
> > +                                   int old, int new)
> > +{
> > +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> > +
> > +    vfio_set_dirty_page_tracking(container, false);
> > +}
> > +
> 
> This would enable dirty page tracking also just for having a framebuffer
> (DIRTY_MEMORY_VGA).  Technically it would be correct, but it would also be
> more heavyweight than expected.

Wouldn't that only happen on emulated video devices?

> In order to only cover live migration, you can use the log_global_start and
> log_global_stop callbacks instead.
> 
> If you want to use log_start and log_stop, you need to add respectively
> 
>     if (old != 0) {
>         return;
>     }
> 
> and
> 
>     if (new != 0) {
>         return;
>     }

Why 0, wouldn't you be checking for DIRTY_LOG_MIGRATION somewhere?

Dave

> before the calls to vfio_set_dirty_page_tracking.  But I think it's more
> appropriate for VFIO to use log_global_*.
> 
> Thanks,
> 
> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

