Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4726634lfp;
        Tue, 28 Sep 2021 03:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1Cy1GXyHHta714kPZC4eXVsTwZ6FtNwVdcls39/vy9IT3WVXX58OxRHt7py1PJO//kXDo
X-Received: by 2002:ac8:5392:: with SMTP id x18mr4671996qtp.180.1632824644913;
        Tue, 28 Sep 2021 03:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632824644; cv=none;
        d=google.com; s=arc-20160816;
        b=WKmzQkdTjnmleT75HgyFIVKS3nNXg0sDsSmgh3PeX5KhdYnGBYj2b8wumYiD7xXsDd
         4j0hYoD3MxJTgK/BgGykdoGzK+kM06glb3574z/kX9B3ZJEd5aLMNYSIm/K0QKVTFfAR
         7MnorPkMCNa601UC0VLiDNGHJIfvvuh7d8Yf+aAJFMNe8TOn6StbGqmWie3ciR+007Js
         En/2NPKgv7Vd4Oy4ITbiMCq+EWAv6QQg4b5r+4Qc1QlSDD5pwto4iwh1mwd7/1ZKod55
         HdxuP80Lhy39BmrVI4bmD7YZSROAMi2EIB8vlaYSLTqXdRMU9qCExrKRg2TpuZVRNHVm
         nFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=/iEBfxd/j4yfAySXLaub8F9a0c9TpFAzZl5IuFvEGT8=;
        b=CO9vtrP0CHZx4GDFRsguLIk5XCbOyXPWZT9N87JItVUaullKPb3mU38wkH9YfQdCMH
         dVNuGIgpJJtyBGyqR55Qzxp+VMfnw5/MemTilBaWoYBbIEi6q/YZygW1SE+Fv3ygWJ7Z
         FbpKPtRce41N8EHhNgkZzplpLhlUlexPAN1tzMLXM8klzG4knkuK1MLKpyXDYld1dUnB
         vxNm5eXtGiwNhsuGmWPwFjvrnSAXinlfxWyA4WAI36C5rr/vaESEHMEcCBJ/FWHhVLKv
         MF0aZmY3hoFIIV1EgZKKfnNn7bS8GeAP5MyGT5bDGv+ml18UOHGZh9zqVkzEjrNu3b5x
         W55w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BIqfDquK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y28si4619891qtm.274.2021.09.28.03.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BIqfDquK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAHM-0003cF-6z
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAH9-0003aA-HJ
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:23:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAH7-0004bx-Qy
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632824629;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/iEBfxd/j4yfAySXLaub8F9a0c9TpFAzZl5IuFvEGT8=;
 b=BIqfDquK1eRxul72epQEsEFtsYgvdLPupqSpM6w0RYqFZksWMNAXCyfkQsoIAJ4ovLyuYo
 Jg8Lsiu1FOMjtlZvMDn3ComCIipVRRs12yc+wWJF9QbhkYvJteUo/dwRmNYhTwKDq8NdMR
 v13KgMCQnB4UAM89iebxztC9hTGapA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-pu357fbUO8KzVXAz_iYV6g-1; Tue, 28 Sep 2021 06:23:47 -0400
X-MC-Unique: pu357fbUO8KzVXAz_iYV6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FC2D802947;
 Tue, 28 Sep 2021 10:23:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CE1B3AC0;
 Tue, 28 Sep 2021 10:23:36 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:23:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 10/14] machine: Tweak the order of topology members
 in struct CpuTopology
Message-ID: <YVLtJlY2erUtyNUK@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-11-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-11-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-TUID: On4un39BsfrI

On Tue, Sep 28, 2021 at 11:57:51AM +0800, Yanan Wang wrote:
> Now that all the possible topology parameters are integrated in struct
> CpuTopology, tweak the order of topology members to be "cpus/sockets/
> dies/cores/threads/maxcpus" for readability and consistency. We also
> tweak the comment by adding explanation of dies parameter.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/core/machine.c   | 8 ++++----
>  include/hw/boards.h | 7 ++++---
>  2 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

