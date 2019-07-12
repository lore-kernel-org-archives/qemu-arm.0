Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp562215wrv;
        Fri, 12 Jul 2019 00:24:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw67gbF/1zsgB2PxFVHaqQ01MR82CIdA0inx6wlJQhPWW0tAmbmQ0Me2xgVg0WwPA9ODqTy
X-Received: by 2002:a17:906:19d3:: with SMTP id h19mr6903286ejd.300.1562916247364;
        Fri, 12 Jul 2019 00:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562916247; cv=none;
        d=google.com; s=arc-20160816;
        b=X709j6N8MPYADpZs71atLz4zYYTlAr1yR+XHc+gr0J6LXwQ+1dmJ7ECsVWAlR9Y7Yc
         CXLsr3cY3CYy6S33HA0bQfqn4V3Y3i6Pqn7TazlPvJ8tbDpfUzuvXaHxWoRjomUE+50e
         vp4/9Z/IHXqraY6rkJCpdiuBF5OznHfL6M7dIaZ6HCfMln+QgE/vbLWErDMyZiAe+vG3
         uLjdJOvP5MqaDIjn96nE3MAE37QpRN6u3t7UwVmZQy5tOiXcwXcdVS3C/0W97TNf6c2e
         aqDzZhvgCfHjWUEZ6Dcwjztu3QwNmixedPXw5LI+yy2aW/95jgeDICXrDxI3k566Hz2k
         JcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=A5mWAEE4Kpns7QbCSjIik81PDK9IFtWWOZMAMmUlJvo=;
        b=zehki+6AHZTI49jFHq8lZFsuoK8mCARExWQffb1kbsNCXuRufxm8Nr64kLzwvvm45q
         sO1nRXLGP4sNaTIUhMz0XNdUjWnJ82l0CjxHkvExYHfZHkGtCVYcbuva1nB4DIWCfI9i
         WOJPSG5HIqKC01n5gsX42KgS5Aea2AZDKNqIfCVWWu7ZGiCgJW+VJL4MJyy2IPefHYrh
         r49BKR1uBAVU2pMej64qW26VzqPUA19m5cm8DzEZwDUOkSdwpZMHW9oPMzOmAXUO2q9Z
         QbGbiF1/w0GzWNP+YY/sT/CMwJ/k8nZviswIzfbV9syrle7Tiw7nx8awTSnsSkNGV3qM
         GaXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id by8si4593028ejb.129.2019.07.12.00.24.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 00:24:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlpuY-0005De-GR
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 03:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36156)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlpuV-0005DL-5b
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 03:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlpuT-0008SD-WD
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 03:24:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50402)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlpuT-0008RF-QK; Fri, 12 Jul 2019 03:24:01 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 31A5B1556B;
 Fri, 12 Jul 2019 07:23:59 +0000 (UTC)
Received: from [10.36.116.46] (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66EC95DDA2;
 Fri, 12 Jul 2019 07:23:49 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <156288396475.12463.8495950257512135187@c4a48874b076>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b0d9cfea-0060-7c44-59e1-fc109784f501@redhat.com>
Date: Fri, 12 Jul 2019 09:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <156288396475.12463.8495950257512135187@c4a48874b076>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 12 Jul 2019 07:23:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 00/29] vSMMUv3/pSMMUv3 2 stage
 VFIO integration
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, yi.l.liu@intel.com,
 mst@redhat.com, jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
 peterx@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 vincent.stehle@arm.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RrC3xMFCmjJq

Hi,

On 7/12/19 12:26 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190711173933.31203-1-eric.auger@redhat.com/
> 
> 
> 
> Hi,
> 
> This series failed build test on s390x host. Please find the details below.
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> # Testing script will be invoked under the git checkout with
> # HEAD pointing to a commit that has the patches applied on top of "base"
> # branch
> set -e
> 
> echo
> echo "=== ENV ==="
> env
> 
> echo
> echo "=== PACKAGES ==="
> rpm -qa
> 
> echo
> echo "=== UNAME ==="
> uname -a
> 
> CC=$HOME/bin/cc
> INSTALL=$PWD/install
> BUILD=$PWD/build
> mkdir -p $BUILD $INSTALL
> SRC=$PWD
> cd $BUILD
> $SRC/configure --cc=$CC --prefix=$INSTALL
> make -j4
> # XXX: we need reliable clean up
> # make check -j4 V=1
> make install
> === TEST SCRIPT END ===
> 
>   CC      i386-softmmu/hw/virtio/virtio-crypto.o
>   CC      i386-softmmu/hw/virtio/virtio-crypto-pci.o
>   CC      i386-softmmu/hw/virtio/virtio-pmem.o
> /var/tmp/patchew-tester-tmp-u52ljjk0/src/hw/virtio/virtio-pmem.c:21:10: fatal error: standard-headers/linux/virtio_pmem.h: No such file or directory
>    21 | #include "standard-headers/linux/virtio_pmem.h"
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
In the kernel branch I used along with ./scripts/update-linux-headers.sh
the header was not yet there. As a consequence the
standard-headers/linux/virtio_pmem.h was removed. I will fix that soon.

Does not block testing on ARM where the VIRTIO_PMEM device is not
configured.

Thanks

Eric
> 
> 
> The full log is available at
> http://patchew.org/logs/20190711173933.31203-1-eric.auger@redhat.com/testing.s390x/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 
