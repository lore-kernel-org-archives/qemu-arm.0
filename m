Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2058753wrp;
        Fri, 20 Sep 2019 00:05:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwv/uGmeyiU663W65J5Rxh5IruT0aKtaXzXYhXeZQXv49hv5r878Zt8paP8NHYxwV9hpVtF
X-Received: by 2002:a05:6402:346:: with SMTP id r6mr20028341edw.124.1568963135829;
        Fri, 20 Sep 2019 00:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568963135; cv=none;
        d=google.com; s=arc-20160816;
        b=qq/45nijWvPkIL1XUdc8kLsyiH7+j/KPKxdG5X0ZauiILOqM/WF6jiDBmt6uZkatYv
         MoOzzVsmFTwXYyVWP+UFQdo5oM+6SkRzkgmeLWNv+e4YtCh9pIxvFudWoEJSoqIsPRAo
         /F1YzkW40CeAEYC2KjUXvvCk31PLAy4ivn94zpXpHi29+HFzpP61l1cISDbED3hITtQ8
         7HrQSsorgdl5eikAUK7K9tDS8upcEfmwm+kUb1XVY3khlWTb7hUb+lOpnFz/0Pru3QEr
         rJnxgrvT1oYu1GW0yzKGub0XceRk3Q+qM+Fo3Ucc5Z1kv7lprfp8SJFanyPbpTKow02L
         mqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=hSRYhm2K48EQG8evZk5DsTeY4cSgyEy/Jj/qASufXGM=;
        b=RvgFtIp8JinQ+QMwBlySkUgg4me9ytTBq5JdJ1XVnwW62YdkV3p1HlmhKMRFcrQDi8
         uA8i/pvlICGIUk5EuA8EJ4y4C8/hXQe9xmbrgldkPwBNrNdL/GWZY40UFa2CA+jbKfjD
         q+n3boel8EXiOTooTu0ve5KE2ymgFC52ztGJn3nwR7MaeWglPDxLPX0jo63gsvSJc/sm
         HEmplEo7zQgWDHbEBD0Scwh6nUN5biIG3CmtObrqNf6E2zK1et1uBibfohq6kc7oLDLU
         Yy67ER02vgJegfG0ZpqvsV44s2svpzRU8glL7jOZ+D6aaD5glIcKMw1JB+fcgXwE5XQZ
         AVSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z23si572008ejm.90.2019.09.20.00.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 00:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBCz0-0007PZ-Op
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 03:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iBCyq-0007Ov-9A
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 03:05:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iBCyn-0006N4-Q9
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 03:05:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53232)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iBCyn-0006LN-Kd; Fri, 20 Sep 2019 03:05:21 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ABE3B86E86F;
 Fri, 20 Sep 2019 07:05:20 +0000 (UTC)
Received: from [10.36.117.220] (ovpn-117-220.ams2.redhat.com [10.36.117.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2016D19D7A;
 Fri, 20 Sep 2019 07:05:09 +0000 (UTC)
Subject: Re: [PATCH v2 0/5] Allow memory_region_register_iommu_notifier() to
 fail
To: Peter Xu <peterx@redhat.com>
References: <20190919121845.29520-1-eric.auger@redhat.com>
 <20190920061628.GD12858@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <29a66cfd-b363-9c8a-4bc1-998ae4e3fbea@redhat.com>
Date: Fri, 20 Sep 2019 09:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190920061628.GD12858@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 20 Sep 2019 07:05:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jqsk82lQI204

Hi Peter,

On 9/20/19 8:16 AM, Peter Xu wrote:
> On Thu, Sep 19, 2019 at 02:18:40PM +0200, Eric Auger wrote:
>> This series allows the memory_region_register_iommu_notifier()
>> to fail. As of now, when a MAP notifier is attempted to be
>> registered along with SMMUv3, Intel iommu without caching mode
>> or AMD IOMMU, we exit in the IOMMU MR notify_flag_changed()
>> callback. In case of VFIO assigned device hotplug, this could be
>> handled more nicely directly within the VFIO code, simply rejecting
>> the hotplug without exiting. This is what the series achieves
>> by handling the memory_region_register_iommu_notifier() returned
>> value.
> 
> Could I ask what's the code path for ARM when the hot plug failed?  Is
> that vfio_realize() then vfio_connect_container() will fail with this?
> 
>     if (container->error) {
>         ret = container->error;
>         error_setg_errno(errp, -ret,
>                          "memory listener initialization failed for container");
>         goto listener_release_exit;
>     }
> 
Yes that path is exercised.

> If so, I would again suggest you to use Error** in patch 1.  IMHO we
> can let vfio_listener_region_add() to be the first one to use the
> Error** so that instead of this:
> 
>     /*
>      * On the initfn path, store the first error in the container so we
>      * can gracefully fail.  Runtime, there's not much we can do other
>      * than throw a hardware error.
>      */
>     if (!container->initialized) {
>         if (!container->error) {
>             container->error = ret;
>         }
>     } else {
>         hw_error("vfio: DMA mapping failed, unable to continue");
>     }

OK. I agree that's better. That's also more code change ;-)

But let's do it!

Thank you for the review!

Best Regards

Eric
> 
> We can also cache the Error** into container and return to user if the
> user is using QMP which should be better than the int number (or
> again, maybe return both errors?).  IIUC error_report() will not work
> for QMP.
> 
> Regards,
> 
