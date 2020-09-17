Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp374198lfq;
        Thu, 17 Sep 2020 01:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT88MQlqNPK2wYIdkBhIv4m3wtTrDEK0gyLbUTlHDFdyVNbsBc6GRfl69sXicP/2IckwNR
X-Received: by 2002:a25:1955:: with SMTP id 82mr36898629ybz.28.1600330857062;
        Thu, 17 Sep 2020 01:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600330857; cv=none;
        d=google.com; s=arc-20160816;
        b=h5ywRBVb2U0wxyWCUthUG/IZj2ZeJD03q+XmelPjGm+NR0i0s/yc2tZGOQ4z/06qYb
         jVzSEYuyzTRYcRr2zJVk4KXNcgf6hQpXRK1F6N5Lzao8x65NSCDl7Z2nO/rdOjiY0a2P
         a8vg8RVYUcJk2IPcgaHxZfT4XzDfE4Yu1eK/0zebrBWCBKcAf0jTzyKB9p/YhlUQCUmx
         NKx+X3rEFpgdbAp50UU+dxdHK/TOkWnB0dWsDXogTDtzZy1uXn9AZGWFC6nVqeiQBMU7
         ziRL2Z62Bw7a3artI5Iim9nfXio92DIgKp08DRKhEFLok7r46YevqkM7OOgpPTjMbTO4
         fXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hr/0Dr1vQ77qJWSikSIM7DX2F+lvZqtKIgL8WRv1MIo=;
        b=Oo964LVmUk8YfQT6C5ZKS1SQe0BwDhB7LylUS1Fi+eqiJhp8VAC4avcSEHQpXDwC/d
         uW62uPuqV2ledEwm7g64WQsAZ02LbVPMy6CGnjBtxwHeCzUmyyXMyq7eskhcNVLjP3fj
         g3yiP5iZhuX6k9E2NcdMWjcmWEfosrJeV6+00MMLk31ZGVy5HBI+2eW2I8seo0OrcaAG
         5o+WUEcV98375WwFCSJgL02b409QS2fxuNLTy1QYDTNT5A8RQuTc49XZfWsBIPQUCJww
         b47k3uwiGc3moq4NM0jKge2OqXgM8xa7kF3IbAoRsdJaEka5nl06RPhmYG4A3OmkdBEe
         sk/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LLps0ylI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si15126697ybk.14.2020.09.17.01.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 01:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LLps0ylI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIpA0-0000sy-Dv
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 04:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIp9n-0000pd-Cb
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 04:20:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIp9l-00055h-G8
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 04:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600330840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hr/0Dr1vQ77qJWSikSIM7DX2F+lvZqtKIgL8WRv1MIo=;
 b=LLps0ylIxVYVgbEE3t+Ev9N4+cpOCXdyTKrjbsnNRKCF5yJ+a6DU5dOwLbEI2abY1g3ezr
 u0Y0JD15OMGojgssqZauOGfxBkCrnJGLz8oDyVBVWqvFhni/rtYp95KCj+Fnf6UyGt1bDG
 89Kh/T12GhC0wCoQqqLZQAqrjtvJnSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-7NFCSKO6OYWJ0d_mIw2SOg-1; Thu, 17 Sep 2020 04:20:38 -0400
X-MC-Unique: 7NFCSKO6OYWJ0d_mIw2SOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC363CD042;
 Thu, 17 Sep 2020 08:20:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 972505DEC4;
 Thu, 17 Sep 2020 08:20:34 +0000 (UTC)
Date: Thu, 17 Sep 2020 10:20:31 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 06/12] hw/arm/virt-acpi-build: distinguish possible
 and present cpus
Message-ID: <20200917082031.cmgwjk6s6mbechc6@kamzik.brq.redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-7-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200917032033.2020-7-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +IDc9Mzf1gVw

On Thu, Sep 17, 2020 at 11:20:27AM +0800, Ying Fang wrote:
> When building ACPI tables regarding CPUs we should always build
> them for the number of possible CPUs, not the number of present
> CPUs. We then ensure only the present CPUs are enabled.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)

I approached this in a different way in the refresh, so the this patch
was dropped, but the refresh is completely untested, so something similar
may still be necessary.

Thanks,
drew

