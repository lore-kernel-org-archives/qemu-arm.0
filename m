Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4717291lfp;
        Tue, 28 Sep 2021 03:11:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzElx9Zm3y12foi96Kg0mcWpn+201MxgTk09ezuxvgadDxpEInYzlk4XJGsCceziUMUrdNn
X-Received: by 2002:a05:6122:a24:: with SMTP id 36mr3744689vkn.25.1632823893318;
        Tue, 28 Sep 2021 03:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632823893; cv=none;
        d=google.com; s=arc-20160816;
        b=z46nABtvxmSVbJAeRhWYOrN5ZDgH76s3hhjAYoiI677vFxHgzuEiAefCU1tXvrizel
         yHIOlUJdtStONZU4xPwNibagmHqNDUp41LPevSdzyGWK/5KZ/QzxV4jhILWDazCj7LNG
         WEvRTX8xf337zc68VMvam2kyj2TMM/Y3PnPpJgnZGv30yauHdSaLimG3am9+I61o+wm/
         MBIIgsDQu66ZLfPnP1O0O3FH+QpUY1pRxTQAGsq5yMSppdX0cIS9SljGTPiBt8X1jHr9
         OC7WG4cw/qcDSnZH+PIiEb+VrJ1Gf8R9thoNPdTQ03lv4ra54zetlcgyDIF5A6/+XxY4
         KqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=no1nhw9PkARqev9XAgmkYpvr8t6B07vU5vuuZxlkx/U=;
        b=crRhdTlaQYiPSTpfkhBa0hJjkqcxmwMJe+N11+2V9a4MZ8NAVrQo9Xg+GxHSJ8I4Bd
         T279HBolXGvyfSQx7Lg/sk9GLq526o3AKyjgfJLnRpy2gd1gMv0pRf7VkBcCmo+JT+p7
         iF+p+xb8ujDmGTFQdwpYL+PDICiHvYWha92j59fPSUm44RXVKpxNrCPF5uUFSVi75PMY
         t6aGlaJbPHtyfbc2LfbrSGWGANc9WwYZtll6yE+x1+CeFnGTRyl37TOOtUOxbsPRLJ9D
         7F196U1vjfWXzho8y1IsTNCHxVhL8wH73Op3duA/K5Pp+hDEMBO/t7qeJvaWQ+pt91m/
         NjGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W1Rg8aZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si1169617vsa.43.2021.09.28.03.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W1Rg8aZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVA5E-0005DP-Jz
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVA4v-00056g-Ft
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVA4t-0002VX-6C
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632823870;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=no1nhw9PkARqev9XAgmkYpvr8t6B07vU5vuuZxlkx/U=;
 b=W1Rg8aZcOo9vQk4XJSyWr7zF5y80eZyRMHx/KT0X0gmxGTUbJsryvG5IlJMl3OiXHOuWEX
 P/a/1GPXZZvPeMOgEqgby/yQlBOxTFM/XAk8NeQy/LHJWI4HoUuta62htCkfmoGmi/ZVGj
 HvlLj6q5saNlWTdm5qQGoQ7eb0zNNEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-QvQH1zkHNbuOHbpiE9mraA-1; Tue, 28 Sep 2021 06:11:07 -0400
X-MC-Unique: QvQH1zkHNbuOHbpiE9mraA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E0EA1006AA9;
 Tue, 28 Sep 2021 10:11:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E831F19C79;
 Tue, 28 Sep 2021 10:10:45 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:10:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 04/14] machine: Set the value of cpus to match
 maxcpus if it's omitted
Message-ID: <YVLqIMqQE6YXDTH3@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-5-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: t3oMbDDMMUWp

On Tue, Sep 28, 2021 at 11:57:45AM +0800, Yanan Wang wrote:
> Currently we directly calculate the omitted cpus based on the given
> incomplete collection of parameters. This makes some cmdlines like:
>   -smp maxcpus=16
>   -smp sockets=2,maxcpus=16
>   -smp sockets=2,dies=2,maxcpus=16
>   -smp sockets=2,cores=4,maxcpus=16
> not work. We should probably set the value of cpus to match maxcpus
> if it's omitted, which will make above configs start to work.
> 
> So the calculation logic of cpus/maxcpus after this patch will be:
> When both maxcpus and cpus are omitted, maxcpus will be calculated
> from the given parameters and cpus will be set equal to maxcpus.
> When only one of maxcpus and cpus is given then the omitted one
> will be set to its counterpart's value. Both maxcpus and cpus may
> be specified, but maxcpus must be equal to or greater than cpus.
> 
> Note: change in this patch won't affect any existing working cmdlines
> but allows more incomplete configs to be valid.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/core/machine.c | 29 ++++++++++++++++-------------
>  hw/i386/pc.c      | 29 ++++++++++++++++-------------
>  qemu-options.hx   | 11 ++++++++---
>  3 files changed, 40 insertions(+), 29 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

