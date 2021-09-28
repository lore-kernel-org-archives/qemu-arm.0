Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4732772lfp;
        Tue, 28 Sep 2021 03:32:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5M+7P7tMHAwjbGWfOi9U/lwZDDxdg3yOtvyi3rk0zihVRnYXs0ah/aG5dvBCJYaSwfbYw
X-Received: by 2002:a05:6102:3a59:: with SMTP id c25mr4065230vsu.15.1632825136067;
        Tue, 28 Sep 2021 03:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632825136; cv=none;
        d=google.com; s=arc-20160816;
        b=uLGWfxzfarOcDcWHM6KI9/u8CUchZiloUVR6ZkdOOIFVfqnlY1fJ4d6kY+0TTxXptF
         QztRsizqpaMOBCqaT2ojEhDzLqM8GPrWo7asgGtejhUwglWGXK0m1pgcE5qe05Z1j7W4
         e5aSJazXfhVqS5U+L2Yha1RdmE+fw0OXC2ZbsP1k3mXdAZflZ7YYr4sZYl9a2Q+bSlRK
         o5ypmwrQTpq/AGKprZVQF9Dl7lFLsRm+L11QNZHI5xNOmcb1J6wLY8MRGL5mtGkazU/0
         +DGP+f3as/+EgDIvOVZWfzB9cxQt7E/Od56LhPNrBleDuJ00Vmo3MERtfoccMq46YX98
         qhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=HuRE3TbMm14G1/yKNxZg9ok5o4RkN+uW40a8NcLQc+M=;
        b=ozdI89wTnmI3LuwY0lEcqQ+eX25Ede7UBCbMt1R2RF3eTshFneBjKYxKPMlGeDrO3T
         iyul5vmBymjEKEbqbjWMxi1eIwoE2HgG0ZbSjZ5AWp1UQnO1YW5bqihOTwLYrTC+Blqy
         FO/IYg6ZaBzXBnNfTfl1B53xP17YayMXaKSofkLUCvx+Tx0jV/Wd+bjuVO1FGIy+Ocjx
         QAgZMwlINQiwKxcvV0DSAuW/yjZJQ0m2+n2qKzd9hFvJaSGkNcgDsV15tXodXzNhOKCR
         037+ZVS28zYynleGZNj9qAs2ITAF3JuK1lkTm7T34UPkv1ColPNPVlY4f9kHW4kyLaIL
         OI0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bXGIaKXn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m40si3183258vkf.68.2021.09.28.03.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:32:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bXGIaKXn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAPH-0005lK-D0
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAKL-0008HP-8N
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:27:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAKI-0007Wt-8p
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632824825;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuRE3TbMm14G1/yKNxZg9ok5o4RkN+uW40a8NcLQc+M=;
 b=bXGIaKXnQ7LyFIcMgZs9vud/4luNlUQddbP4zA+G0DJCG+yRxEBu1lbqr3E3LQIPgO1rWC
 ssKzbOt+Jo/t6rDlNkoIxlpJZHp9EV1p693We5N2cg8Z2Hu1ZJjHtcVE0Ry0eGlxNNIp8G
 AtHMYsmoUkIfrYRgywdkaBTMQ8QdJJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-ABUu3RC0P_angFFVpW0uzg-1; Tue, 28 Sep 2021 06:27:04 -0400
X-MC-Unique: ABUu3RC0P_angFFVpW0uzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9472801E72;
 Tue, 28 Sep 2021 10:27:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7B03109B6E3;
 Tue, 28 Sep 2021 10:26:53 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:26:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 13/14] machine: Move smp_prefer_sockets to struct
 SMPCompatProps
Message-ID: <YVLt6x1U+hNM87A3@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-14-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-14-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 45tgRd6/7mXH

On Tue, Sep 28, 2021 at 11:57:54AM +0800, Yanan Wang wrote:
> Now we have a common structure SMPCompatProps used to store information
> about SMP compatibility stuff, so we can also move smp_prefer_sockets
> there for cleaner code.
> 
> No functional change intended.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c              | 2 +-
>  hw/core/machine.c          | 2 +-
>  hw/i386/pc_piix.c          | 2 +-
>  hw/i386/pc_q35.c           | 2 +-
>  hw/ppc/spapr.c             | 2 +-
>  hw/s390x/s390-virtio-ccw.c | 2 +-
>  include/hw/boards.h        | 3 ++-
>  7 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

