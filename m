Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4651498lfq;
        Tue, 29 Sep 2020 07:48:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiVC7gQAHEQXQ1557mNdsafFkS5MKKz5emcetusYWv1XP3hxuHV2cJZ4lJO+kFWM7RSE9D
X-Received: by 2002:a25:16c4:: with SMTP id 187mr6937895ybw.496.1601390882534;
        Tue, 29 Sep 2020 07:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601390882; cv=none;
        d=google.com; s=arc-20160816;
        b=qJA2yXWE88+B6iifSvC1kourqa5HYPOJvxkZjxSR+w98RrdmWE+Lj/YN5swuV0RXrC
         0XCKcjiQVcgHIskilHUCuWiISZaPlI6FPS41PnEyQVY0dBNzQrdSl8iD5jxCLtw6MtPT
         YuLaBhvXJAXYz4eEEkydSMF+4JyFZWveHhEvfAvp/7SguhcJzLm/7SdrmpAwbi15m8jd
         UJTJAA1kC1BP/FBSJpcwperpflQ6/7RLVysNwuU8FdVASH4hoEht2aCFZ8H5kaVl+QjU
         Y2FUbWZrfb8Tv8qtEOpvqEhcOvrW70eKUCfMiaypFzxZA+FGuAn33YOFFd0cKSaHuSP8
         6CjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=8thcg0tIxW3aY4E98M4rEh06Wicxbv3Himw6vljZh1g=;
        b=Evc6L9Fh+KWumYj3z/kBN2LGYOpTRZDWgwIoytKeBqWmdzWUnXWAev6T83bGwbjQt9
         5CH5PCqoHurp254LvwjWnItPQrV42Ps21j4EJlxkD39+M18dCLFw9JzSl5TG/zxkuAM+
         Mh0dldgR35JHhZa36/mY5sybbhWSfp9lJ3jkew/DJ/BCNqO2C6crLY/lBhOK6IBzU+1M
         cboBDVGVqyu23u0pz4qJBZG3SLPu5exUzAtIT0U03SHmQmPG0cRjVsEr7Gnr5VgOZhWc
         KcVheT6g2WQoookT0pipJfMHoIPcSC0OMFu5PKxv5LFRdWME+LY8mWkZYIl3PGpzIxJo
         /gkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CmEA4hSV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si4173198ybk.465.2020.09.29.07.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 07:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CmEA4hSV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNGvB-0000iI-To
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 10:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNGv4-0000h7-2M
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 10:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNGv1-0002v9-Hg
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 10:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601390869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8thcg0tIxW3aY4E98M4rEh06Wicxbv3Himw6vljZh1g=;
 b=CmEA4hSVdxsfQj78l4JxiVXCLKY8IXJRk20EFij70HCux2iWrJTdEhL81Tv8jf8+y3Dmhx
 FhENAMWFgjLnHc7oY3Z6vo3x4y/ekLH9e/+yN8+s2b4RGnlgP/24qCqJRVdYUA/s0452dl
 EQZPrDkzg1umPnK3igmx7rBAMuHk+cQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-6kDvBJYeMHKVe0bacwPVaQ-1; Tue, 29 Sep 2020 10:47:42 -0400
X-MC-Unique: 6kDvBJYeMHKVe0bacwPVaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FA44800C78;
 Tue, 29 Sep 2020 14:47:41 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.214])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 417F578807;
 Tue, 29 Sep 2020 14:47:35 +0000 (UTC)
Date: Tue, 29 Sep 2020 16:47:33 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 0/5] hw/arm/virt: Introduce kvm-steal-time
Message-ID: <20200929144733.2ukomccx5in5r346@kamzik.brq.redhat.com>
References: <20200916092620.19161-1-drjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200916092620.19161-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 22:47:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7d7gbouWuFfi


Hi Peter, Eric, and other interested parties,

Here's a gentle ping for reviewers.

Thanks,
drew

On Wed, Sep 16, 2020 at 11:26:15AM +0200, Andrew Jones wrote:
> Previous posting:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg727588.html
> 
> v3:
>   - Rebased: 5.2 machine type and kvm32 drop now included
>   - Switched to using new KVM cap that has been merged upstream
>   - Picked up some r-b's and some of Eric's comments from v2
> 
> KVM supports the ability to publish the amount of time that VCPUs
> were runnable, but not running due to other host threads running
> instead, to the guest. The guest scheduler may use that information
> when making decisions and the guest may expose it to its userspace
> (Linux publishes this information in /proc/stat). This feature is
> called "steal time" as it represents the amount of time stolen from
> a guest by scheduling out its VCPUs. To enable this feature KVM
> userspace must provide a memory region that will be used to publish
> the information to the guest. The memory region is typical migratable
> region. The GPA of the region is given to KVM through a VCPU device
> ioctl interface. This feature is only available for 64-bit guests
> per the Arm PVTIME specification (DEN0057A).
> 
> This series provides the QEMU support of this feature. It will
> be enabled by default for 5.2 machine types and later, but may
> be disabled with a new CPU property "kvm-steal-time".
> 
> Thanks,
> drew
> 
> 
> Andrew Jones (5):
>   target/arm/kvm: Make uncalled stubs explicitly unreachable
>   hw/arm/virt: Move post cpu realize check into its own function
>   hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
>   DO NOT MERGE: HACK: Add steal time KVM cap to kvm.h
>   hw/arm/virt: Implement kvm-steal-time
> 
>  docs/system/arm/cpu-features.rst |  11 ++++
>  hw/arm/virt.c                    | 110 ++++++++++++++++++++++---------
>  include/hw/arm/virt.h            |   5 ++
>  linux-headers/linux/kvm.h        |   1 +
>  target/arm/cpu.c                 |   8 +++
>  target/arm/cpu.h                 |   4 ++
>  target/arm/kvm.c                 |  16 +++++
>  target/arm/kvm64.c               |  64 ++++++++++++++++--
>  target/arm/kvm_arm.h             |  94 ++++++++++++++++++++------
>  target/arm/monitor.c             |   2 +-
>  tests/qtest/arm-cpu-features.c   |  25 +++++--
>  11 files changed, 281 insertions(+), 59 deletions(-)
> 
> -- 
> 2.26.2
> 

