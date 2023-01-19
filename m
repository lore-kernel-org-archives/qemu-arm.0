Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp265070ejc;
        Thu, 19 Jan 2023 03:49:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv4CW4EoMW6WlKbXJbKyxn8fdNcTfQrdWAqMyHIEAWlnxhUoSIsWp8ZsKq3wTyltglrNlun
X-Received: by 2002:a05:6214:5686:b0:534:e798:8e8 with SMTP id lm6-20020a056214568600b00534e79808e8mr19068689qvb.2.1674128987612;
        Thu, 19 Jan 2023 03:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674128987; cv=none;
        d=google.com; s=arc-20160816;
        b=O25uavX4yv12WhTqngl5VxTzuSCydQlpR7WeW3ncf1gFJt3Nj+CEnK13t6JxVP4qCZ
         98G2rHHHp8IffCd1qQWG2DS2LdI6lt39IKfo527UYaWDDLAyj94jrfyb6IAGQ86AU1+4
         AVXF6fzTygmcJegYgRlb4+JUwZQX19+r94TsjaqaEJJHv/fiU/hjkVHFjHIvTUc51xgi
         +itc3H9ZZGUkvQRRkWuarh13agmN4eyT8d9wuPzjNwNiDhBREWqNH5VE3KZYWhjShrYQ
         OEcxQhmSrG14gAKHietrL9oiqGPOMzE+GyCTsVnwoQ1B/2O8fIE5zPR83yCKLi7pJXNE
         CxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gXKBhQL1oyDDx1ruE2azlrsK+OKUgC5n4NqJsx1Hc+Q=;
        b=iMgtBsfnuUbs4tndLwb2lWL3n9oU9wZfdbv1oH3yOffBcxW3NVUI37jmyfQxR68oo4
         A2pWHqOTuIctrI14gxo7+KHogsl9HY9sL6cS0b00b+y5Lgg5/Hv9ZKFHX2MhlnGa9VHY
         i4D0v/Ro7hRBNf2P0es+uoFZDbYnhe9uY+CFUP2ft/a/bJFnTCSMpjsm/NNCVXvXMGft
         rRUmlCgqh+eRq7ZKNa8eJbgqBnPS37FlHcvzi10eb50oM+0vXU0z60rN4AdiUHg1G+Rr
         ipNFkYBI6YWLF4fA4RincJsoqBT/C7XjXviuz+GzrLogaB76xw4uDJX2TxxelKjvejl5
         l0Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jHJPDYae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg9-20020a056214252900b004c6b5207209si17637670qvb.227.2023.01.19.03.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 03:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jHJPDYae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pITQG-0001IB-Hc; Thu, 19 Jan 2023 06:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pITQF-0001Hu-8K
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:49:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pITQD-0007gi-8h
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674128972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gXKBhQL1oyDDx1ruE2azlrsK+OKUgC5n4NqJsx1Hc+Q=;
 b=jHJPDYaemEFP2hZMHL6u5BZtoIj/L8xSEZ6A21QICsDgH+cCEIkaHQaK7e3XhAONUJPffi
 pudwaukintVN/JAEICA3Inn50WfZgS5t7OGKs0BWCfTsVDfJbL9UISx+NGJ6zgI5n3DhpI
 pwehkvMrh0J/c4eXwAhwl7Y1i3mtfNI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-Z9PSsxjHPxiPnTZg6qlQcA-1; Thu, 19 Jan 2023 06:49:31 -0500
X-MC-Unique: Z9PSsxjHPxiPnTZg6qlQcA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so1084134wma.6
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 03:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXKBhQL1oyDDx1ruE2azlrsK+OKUgC5n4NqJsx1Hc+Q=;
 b=kXGQXeiXIZXsGx+tfIvm0A1qES9WQAP5TP2N3Ww4sc10Vxj5kv6gFFVuIv0RO9hd+r
 cwlHKEo9obfdFTV/1owgDdPoyb9E9/WzCNpHaF460h46bfnsypjmI+qAV8sZkJZwT53Q
 d9BCqY3iAhXzKjkWvittEVrege6uaS/+ceHPhjDJm7jz1zSFzwNIyqN7HIc20wKPDLcu
 XmLE31310SIMx0rZT9Zpd4bAQQGdLN1FNdKUDpNsDnW4hXtjjTU5fPYYDMjngGXR49og
 /a8auNCgOnyaUUlR9kJDniE76LYkC9eH8g5ftGNYuvRd6ThoedvshvfgQxi+E/c1SvQX
 ZiPQ==
X-Gm-Message-State: AFqh2kqoJFJZZQ0nO+U5vS6m5DUsppn/49rRrCYbYB5YKVPuxNckpwZl
 bsTPAlo9MdjVfRVL1rVcZrElXjjnzp2hKfVEunyh8Xf4dtimwo0BLIZpAtpYOw85x3L+AQX7YLs
 96JwilHXuXElT
X-Received: by 2002:a05:600c:995:b0:3da:f4f5:ad0e with SMTP id
 w21-20020a05600c099500b003daf4f5ad0emr9882100wmp.9.1674128970427; 
 Thu, 19 Jan 2023 03:49:30 -0800 (PST)
X-Received: by 2002:a05:600c:995:b0:3da:f4f5:ad0e with SMTP id
 w21-20020a05600c099500b003daf4f5ad0emr9882077wmp.9.1674128970208; 
 Thu, 19 Jan 2023 03:49:30 -0800 (PST)
Received: from redhat.com ([2.52.28.74]) by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c35c100b003db06493ee7sm4939784wmq.47.2023.01.19.03.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 03:49:29 -0800 (PST)
Date: Thu, 19 Jan 2023 06:49:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 dgilbert@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 00/19] Clean up includes
Message-ID: <20230119064833-mutt-send-email-mst@kernel.org>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: zHq94M/T+t/m

On Thu, Jan 19, 2023 at 07:59:40AM +0100, Markus Armbruster wrote:
> Back in 2016, we discussed[1] rules for headers, and these were
> generally liked:
> 
> 1. Have a carefully curated header that's included everywhere first.  We
>    got that already thanks to Peter: osdep.h.
> 
> 2. Headers should normally include everything they need beyond osdep.h.
>    If exceptions are needed for some reason, they must be documented in
>    the header.  If all that's needed from a header is typedefs, put
>    those into qemu/typedefs.h instead of including the header.
> 
> 3. Cyclic inclusion is forbidden.
> 
> This series fixes violations of rule 2.  I may have split patches too
> aggressively.  Let me know if you want some squashed together.

series
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge.

> v4:
> * PATCH 01-03: New
> * PATCH 04-15: Previous version redone with scripts/clean-includes,
>   	       result split up for review
> * PATCH 16-19: New
> 
> v3:
> * Rebased, old PATCH 1+2+4 are in master as commit
>   881e019770..f07ceffdf5
> * PATCH 1: Fix bsd-user
> 
> v2:
> * Rebased
> * PATCH 3: v1 posted separately
> * PATCH 4: New
> 
> [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
> 
> Markus Armbruster (19):
>   scripts/clean-includes: Fully skip / ignore files
>   scripts/clean-includes: Don't claim duplicate headers found when not
>   scripts/clean-includes: Skip symbolic links
>   bsd-user: Clean up includes
>   crypto: Clean up includes
>   hw/cxl: Clean up includes
>   hw/input: Clean up includes
>   hw/tricore: Clean up includes
>   qga: Clean up includes
>   migration: Clean up includes
>   net: Clean up includes
>   target/hexagon: Clean up includes
>   riscv: Clean up includes
>   block: Clean up includes
>   accel: Clean up includes
>   Fix non-first inclusions of qemu/osdep.h
>   Don't include headers already included by qemu/osdep.h
>   9p: Drop superfluous include of linux/limits.h
>   Drop duplicate #include
> 
>  backends/tpm/tpm_ioctl.h          |  2 --
>  bsd-user/bsd-proc.h               |  4 ----
>  bsd-user/qemu.h                   |  1 -
>  crypto/block-luks-priv.h          |  1 -
>  fsdev/p9array.h                   |  2 --
>  include/block/graph-lock.h        |  1 -
>  include/block/write-threshold.h   |  2 --
>  include/hw/arm/fsl-imx6ul.h       |  1 -
>  include/hw/arm/fsl-imx7.h         |  1 -
>  include/hw/cxl/cxl_component.h    |  2 --
>  include/hw/cxl/cxl_host.h         |  1 -
>  include/hw/cxl/cxl_pci.h          |  1 -
>  include/hw/input/pl050.h          |  1 -
>  include/hw/misc/aspeed_lpc.h      |  2 --
>  include/hw/pci/pcie_doe.h         |  1 -
>  include/hw/tricore/triboard.h     |  1 -
>  include/qemu/async-teardown.h     |  2 --
>  include/qemu/dbus.h               |  1 -
>  include/qemu/host-utils.h         |  1 -
>  include/qemu/userfaultfd.h        |  1 -
>  include/sysemu/accel-blocker.h    |  1 -
>  include/sysemu/event-loop-base.h  |  1 -
>  net/vmnet_int.h                   |  1 -
>  qga/cutils.h                      |  2 --
>  target/hexagon/hex_arch_types.h   |  1 -
>  target/hexagon/mmvec/macros.h     |  1 -
>  target/riscv/pmu.h                |  1 -
>  accel/tcg/cpu-exec.c              |  1 -
>  audio/sndioaudio.c                |  2 +-
>  backends/hostmem-epc.c            |  2 +-
>  backends/tpm/tpm_emulator.c       |  1 -
>  block/export/vduse-blk.c          |  2 +-
>  block/qapi.c                      |  1 -
>  bsd-user/arm/signal.c             |  1 +
>  bsd-user/arm/target_arch_cpu.c    |  2 ++
>  bsd-user/freebsd/os-sys.c         |  1 +
>  bsd-user/i386/signal.c            |  1 +
>  bsd-user/i386/target_arch_cpu.c   |  3 +--
>  bsd-user/main.c                   |  4 +---
>  bsd-user/strace.c                 |  1 -
>  bsd-user/x86_64/signal.c          |  1 +
>  bsd-user/x86_64/target_arch_cpu.c |  3 +--
>  hw/9pfs/9p.c                      |  5 -----
>  hw/acpi/piix4.c                   |  1 -
>  hw/alpha/dp264.c                  |  1 -
>  hw/arm/virt.c                     |  1 -
>  hw/arm/xlnx-versal.c              |  1 -
>  hw/block/pflash_cfi01.c           |  1 -
>  hw/core/machine.c                 |  1 -
>  hw/display/virtio-gpu-udmabuf.c   |  1 -
>  hw/hppa/machine.c                 |  1 -
>  hw/hyperv/syndbg.c                |  2 +-
>  hw/i2c/pmbus_device.c             |  1 -
>  hw/i386/acpi-build.c              |  1 -
>  hw/input/tsc210x.c                |  1 -
>  hw/loongarch/acpi-build.c         |  1 -
>  hw/misc/macio/cuda.c              |  1 -
>  hw/misc/macio/pmu.c               |  1 -
>  hw/net/xilinx_axienet.c           |  1 -
>  hw/ppc/ppc405_uc.c                |  2 --
>  hw/ppc/ppc440_bamboo.c            |  1 -
>  hw/ppc/spapr_drc.c                |  1 -
>  hw/rdma/vmw/pvrdma_dev_ring.c     |  1 -
>  hw/remote/machine.c               |  1 -
>  hw/remote/proxy-memory-listener.c |  1 -
>  hw/remote/remote-obj.c            |  1 -
>  hw/rtc/mc146818rtc.c              |  1 -
>  hw/s390x/virtio-ccw-serial.c      |  1 -
>  hw/sensor/adm1272.c               |  1 -
>  hw/usb/dev-storage-bot.c          |  1 -
>  hw/usb/dev-storage-classic.c      |  1 -
>  migration/postcopy-ram.c          |  2 --
>  qga/commands-posix.c              |  1 -
>  qga/cutils.c                      |  3 ++-
>  softmmu/dirtylimit.c              |  1 -
>  softmmu/runstate.c                |  1 -
>  softmmu/vl.c                      |  3 ---
>  target/loongarch/translate.c      |  1 -
>  target/mips/tcg/translate.c       |  1 -
>  target/nios2/translate.c          |  2 --
>  tcg/tci.c                         |  1 -
>  tests/unit/test-cutils.c          |  1 -
>  tests/unit/test-seccomp.c         |  1 -
>  ui/gtk.c                          |  1 -
>  ui/udmabuf.c                      |  1 -
>  util/async-teardown.c             | 12 ++++--------
>  util/main-loop.c                  |  1 -
>  util/oslib-posix.c                |  6 ------
>  scripts/clean-includes            | 15 ++++++++++-----
>  89 files changed, 29 insertions(+), 123 deletions(-)
> 
> -- 
> 2.39.0

