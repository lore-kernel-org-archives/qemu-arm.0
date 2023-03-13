Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2166216ejc;
        Mon, 13 Mar 2023 00:14:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set92IFq8IECOV84DfBetad2+pJ/a7vOqwC8Yh0hyY6cCO9MyafCnRe8DBR5phVOyBQJNVNKE
X-Received: by 2002:ad4:5d4e:0:b0:573:c1d9:df40 with SMTP id jk14-20020ad45d4e000000b00573c1d9df40mr12552152qvb.49.1678691657013;
        Mon, 13 Mar 2023 00:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678691657; cv=none;
        d=google.com; s=arc-20160816;
        b=DldfC+Nj5nxXdXo4lB5N2HBG+i2UVko+IpCRZ4DnqOisf3bmYHat+5cExVoY1ZyE2t
         DW+Z4lAt3xT1d+lv+H1BdItFjENlADTFdbJ0/f3FFEXIvAVxprO1syf0rtIuVHBIvivt
         0ZAyjErWOY4xyvH/i0cUCKGTUN1cI+/rSNB/fQ3qsvKauR4pduL2nHHDcSKoMqR4jfi1
         75ycvCPjPx87bqQeVfC5kF51C9Jd0FJAJyQvSwOFT2883UR5LrNNjIs249YA2of8DBE3
         Yauvqx+i9Ijb5Vw8Zsgq3aTtIr7EDjrHSaCU5xA/mF6pdovaGGb76iPUcdPnTsfd3LZ8
         Fhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:dkim-signature;
        bh=cmRyXnIOyTjX7zkKLutbdXbLKJaXUEBZfMK37m3cVUQ=;
        b=azMEbuffMTbjrJhj3hd1fpl9d+QdU453UEpvprT+ZOa/xCGEyUQww04ek9qLuSet1L
         ujSAVhAaYgsqWSljXFpLlMGbCBzYNFyFByz8rLEjgi161tAIZVj/cDYRbNhOyCtchMg2
         HrmWZdu87BpOgMMZqi+ViO4uJww5haDdUYi5VJi49I1LiiB+XMCIeMp5kUGdpN/M57Ll
         /IYAxFn9l1jy731fQyWu1KwY76aC1DmAZvA5Zs85aUA6SWxLmk3DhGhUeXXjeO2t63ZA
         Bz5TjEHGwBJpxnieLjzQQz+GkIy+kQzlCGCHX5yHe5pDDgJqHJMk1gg4ch4KpSab/kgz
         DHtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ATG2346H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020ac85cd2000000b003b86aa56ae9si4952817qta.635.2023.03.13.00.14.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Mar 2023 00:14:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ATG2346H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pbcNP-00041u-QL; Mon, 13 Mar 2023 03:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pbcNO-00041X-Ng
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 03:13:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pbcNM-0004es-0j
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 03:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678691623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmRyXnIOyTjX7zkKLutbdXbLKJaXUEBZfMK37m3cVUQ=;
 b=ATG2346Hw3pTm9KV4WgrjzjLJyGJil7zNy5L7I/NIlMKZN4dP/ERUcl66ErefJmAlPgq31
 30edVlPsV9dUhu6FET33M7jV7b8AGjj3RH1deCZ6wPNrI1VMA6CxQAtsFKhdZjqc0Xq04Y
 nrZFDpq18gPevDuStFPnljKUz6p/XlI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-dfdI401PMTWjg5cvvLN3cA-1; Mon, 13 Mar 2023 03:13:36 -0400
X-MC-Unique: dfdI401PMTWjg5cvvLN3cA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58200101A55E;
 Mon, 13 Mar 2023 07:13:36 +0000 (UTC)
Received: from [10.72.13.125] (ovpn-13-125.pek2.redhat.com [10.72.13.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D61F40C20FA;
 Mon, 13 Mar 2023 07:13:29 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] hw/arm/virt: Support dirty ring
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230227042629.339747-1-gshan@redhat.com>
Message-ID: <a4a28aca-449e-0b95-c3ca-e036b82d76e7@redhat.com>
Date: Mon, 13 Mar 2023 15:13:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20230227042629.339747-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CVSQrUNuYau9

On 2/27/23 12:26 PM, Gavin Shan wrote:
> This series intends to support dirty ring for live migration for arm64. The
> dirty ring use discrete buffer to track dirty pages. For arm64, the speciality
> is to use backup bitmap to track dirty pages when there is no-running-vcpu
> context. It's known that the backup bitmap needs to be synchronized when
> KVM device "kvm-arm-gicv3" or "arm-its-kvm" has been enabled. The backup
> bitmap is collected in the last stage of migration. The policy here is to
> always enable the backup bitmap extension. The overhead to synchronize the
> backup bitmap in the last stage of migration, when those two devices aren't
> used, is introduced. However, the overhead should be very small and acceptable.
> The benefit is to support future cases where those two devices are used without
> modifying the code.
> 
> PATCH[1] add migration last stage indicator
> PATCH[2] synchronize the backup bitmap in the last stage of migration
> PATCH[3] add helper kvm_dirty_ring_init() to enable dirty ring
> PATCH[4] enable dirty ring for arm64
> 
>     v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00434.html
> RFCv1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00171.html
> 
> Testing
> =======
> (1) kvm-unit-tests/its-pending-migration and kvm-unit-tests/its-migration with
>      dirty ring or normal dirty page tracking mechanism. All test cases passed.
> 
>      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
>      ./its-pending-migration
> 
>      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
>      ./its-migration
> 
>      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
>      ./its-pending-migration
> 
>      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
>      ./its-migration
> 
> (2) Combinations of migration, post-copy migration, e1000e and virtio-net
>      devices. All test cases passed.
> 
>      -netdev tap,id=net0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown  \
>      -device e1000e,bus=pcie.5,netdev=net0,mac=52:54:00:f1:26:a0
> 
>      -netdev tap,id=vnet0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
>      -device virtio-net-pci,bus=pcie.6,netdev=vnet0,mac=52:54:00:f1:26:b0
> 
> Changelog
> =========
> v2:
>    * Drop PATCH[v1 1/6] to synchronize linux-headers                            (Gavin)
>    * More restrictive comments about struct MemoryListener::log_sync_global     (PeterX)
>    * Always enable the backup bitmap extension                                  (PeterM)
> v1:
>    * Combine two patches into one PATCH[v1 2/6] for the last stage indicator    (PeterX)
>    * Drop the secondary bitmap and use the original one directly                (Juan)
>    * Avoid "goto out" in helper kvm_dirty_ring_init()                           (Juan)
> 

Ping, Paolo and Peter Maydell. Please take a look to see if it can be
merged, thanks!

> 
> Gavin Shan (4):
>    migration: Add last stage indicator to global dirty log
>      synchronization
>    kvm: Synchronize the backup bitmap in the last stage
>    kvm: Add helper kvm_dirty_ring_init()
>    kvm: Enable dirty ring for arm64
> 
>   accel/kvm/kvm-all.c      | 108 ++++++++++++++++++++++++++++-----------
>   include/exec/memory.h    |   7 ++-
>   include/sysemu/kvm_int.h |   1 +
>   migration/dirtyrate.c    |   4 +-
>   migration/ram.c          |  20 ++++----
>   softmmu/memory.c         |  10 ++--
>   6 files changed, 101 insertions(+), 49 deletions(-)
> 

