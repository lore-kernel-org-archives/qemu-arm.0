Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4725535lfp;
        Tue, 28 Sep 2021 03:22:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzYL4Sb4/tWH7pnZ8trEI1A7R1AeBXM4xObsArgNgbsB0BcNNBjEOIW8yQteKrbQzzXlG0
X-Received: by 2002:a05:622a:1345:: with SMTP id w5mr165585qtk.259.1632824555161;
        Tue, 28 Sep 2021 03:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632824555; cv=none;
        d=google.com; s=arc-20160816;
        b=A8VLT+iK7XLwBT+mleiZTV5jldj2knwq4GiBFp4if5uXxxXjOGZStVjpSkxEQ9anFA
         vgSW6pOSxhtoKoMoPv/a2iTwJNkUkdW5+tmyoMNnbfqLABxQKRWL4qe+o0BF73iIMcjD
         TN5pR+YlIXvsYBTJrCufnLdIaZ6+36c3xbxycr8SA7e+jasnTeMm/j/2dCYMMkF3+Y2I
         Z5dORDcbLKolN4WrQ+nYKlmNdJNxar107uCNQz7P97w3zNyqfQL0XUfl9rqfJPCEf15T
         ubvxjQ9k2EfrQMzoAX0yFuOVIUmYH/636T5q7x/5c0Fos15tS6cvHMq4z+xAGkgd47rx
         CmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=zZn4z9hVG+JLfZQmsXlyh+XzabfgsxWS8202pB81dW8=;
        b=V4OUfQ20Z7IQTuuZYc6T3DU/hU49MTNqU8DIdhvFzl6m8E+aWT1wNdlOnVWrVQ70zU
         Z9lVBngvzTejtD3dz3uIhgx+KFbR9y6NtbRh9ALmCJOE7KP99/YFQE3+mY5k0XvE1jyw
         6h+HEs8yZ7K6TmV4h4NED69zMSeLIe+63bnmn2VU0cdvMns1zxUh0U/Wf03GyZbNRufr
         VTYplq2lzliZq9eYdePVrMYDYsd0mjxCqBl2v7/NTSB0R5CCJEq93zrw11IxBSEQbxtC
         Z3/khxcw1AGQA6JMVLZ+GxcTmyaAvIjl3idHnnhznWSbvgmYzBSh3iwAJPbta/uEWqsp
         wckw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F9TFhutu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si14260501qtg.213.2021.09.28.03.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:22:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F9TFhutu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAFs-0000pd-Sh
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAEn-0007ej-A0
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAEh-0002Of-0t
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632824477;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZn4z9hVG+JLfZQmsXlyh+XzabfgsxWS8202pB81dW8=;
 b=F9TFhutuOrVVWI3AcJNTsTM2i1rZWyZuVI23DIzirB3SyHrhCzhudDCumhkgEZa5xXiSdk
 EuJ7OBuXn/V9fCRwPfktj2XGo031bKVBcEUu2pU1EE52caP+rjyBaNRtCd3YC9LUfyBM35
 JjUFSmzZ6/nT4Ha10X8VlWiRyWrX5/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-lJL1oQaINlCWpaRz8FohjQ-1; Tue, 28 Sep 2021 06:21:15 -0400
X-MC-Unique: lJL1oQaINlCWpaRz8FohjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B49318125EB;
 Tue, 28 Sep 2021 10:21:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E99718A8F;
 Tue, 28 Sep 2021 10:21:05 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:21:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 08/14] machine: Prefer cores over sockets in smp
 parsing since 6.2
Message-ID: <YVLsj7G+vSjXph4c@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-9-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-9-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3MOfhTZS8jEl

On Tue, Sep 28, 2021 at 11:57:49AM +0800, Yanan Wang wrote:
> In the real SMP hardware topology world, it's much more likely that
> we have high cores-per-socket counts and few sockets totally. While
> the current preference of sockets over cores in smp parsing results
> in a virtual cpu topology with low cores-per-sockets counts and a
> large number of sockets, which is just contrary to the real world.
> 
> Given that it is better to make the virtual cpu topology be more
> reflective of the real world and also for the sake of compatibility,
> we start to prefer cores over sockets over threads in smp parsing
> since machine type 6.2 for different arches.
> 
> In this patch, a boolean "smp_prefer_sockets" is added, and we only
> enable the old preference on older machines and enable the new one
> since type 6.2 for all arches by using the machine compat mechanism.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/arm/virt.c              |  1 +
>  hw/core/machine.c          | 35 ++++++++++++++++++++++++++---------
>  hw/i386/pc.c               | 35 ++++++++++++++++++++++++++---------
>  hw/i386/pc_piix.c          |  1 +
>  hw/i386/pc_q35.c           |  1 +
>  hw/ppc/spapr.c             |  1 +
>  hw/s390x/s390-virtio-ccw.c |  1 +
>  include/hw/boards.h        |  1 +
>  qemu-options.hx            |  3 ++-
>  9 files changed, 60 insertions(+), 19 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

