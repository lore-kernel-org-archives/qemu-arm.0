Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp497679ejb;
        Wed, 5 Apr 2023 09:30:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350b92jJM+V3WAa8jO+iztpc88RDCyFOCa0/5Usn72SmU8HwG9I6an12jRgv36QRqKjj216Ve
X-Received: by 2002:a17:906:c00d:b0:921:54da:831c with SMTP id e13-20020a170906c00d00b0092154da831cmr2891582ejz.31.1680712209753;
        Wed, 05 Apr 2023 09:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680712209; cv=none;
        d=google.com; s=arc-20160816;
        b=mF8Q8eCY+wjVOn+sT+0QdNrCgE/L7VCXhMXdfEcjQ2pFgRjIt/9IjYSEKi6b7z+j1J
         ohza7Cg1VA+KRE6yqBl62/XulRNPejjjslbiylzux2fro+vhsHuimfm9c+Aa+hVBv1t6
         GqeHyf9PzvMWq/2tc7VXAaPXNklagYGBq38aE4x1mpKqa7HCOUsn1fpDoO9cRpBVtFmz
         Gdmn8bCHZk3ulu7WaGa1h1UjjUbiXAma9EofKZ1lkQdcDoVDsnWub2v2kE4VWOO1HYoO
         nhWHTRRfFboU/lWZ6/8vQnUBxKXcnn2xgUO8IKr3IwI5UnR6Fvrlu2SQw1WxrGfUQIJ9
         Dc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EAb8lMkcf5cD6uOQdEQO0L3nW4YeL6kpZLcRrER5U3w=;
        b=gTlTUpp1i2V4fbBnuduhcQB08JJgup67KKadhsb48pij/z7f1Hu2cziMmT6PHMlFHO
         lbB0DaW31xtZgbVegud6xl+xxr4x44TwonZiHsd1zOjydnUBtTjWjoPxnEKdhNQKHItm
         b0lkPJEh01OZsLu/aYLCLp5s5sMGNoeZ1xPASVZWIetnqqj2PCM+IFPW77F38fEco03X
         YHj5+vKT0uieCWbrPTOmQbJTefpf1Oc9fLeMMw3BxlTHN1UCGjbRi8UGKcYtz8fWmxor
         IDJP3y2VVxZVFS57Gn1MShI7k/PfCUxeKSCip5xdqQgzAk1JCw/hRVcCdX/7p536RMEV
         h79Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cXHcu/vV";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id e22-20020a50ec96000000b004fe968996c7si901499edr.216.2023.04.05.09.30.09;
        Wed, 05 Apr 2023 09:30:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cXHcu/vV";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbjDEQaI (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Wed, 5 Apr 2023 12:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjDEQaH (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 5 Apr 2023 12:30:07 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F61549F9
        for <kvm@vger.kernel.org>; Wed,  5 Apr 2023 09:30:05 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id v6-20020a05600c470600b003f034269c96so12101310wmo.4
        for <kvm@vger.kernel.org>; Wed, 05 Apr 2023 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680712204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAb8lMkcf5cD6uOQdEQO0L3nW4YeL6kpZLcRrER5U3w=;
        b=cXHcu/vV/o2KhWfu64eO06RJBePy4noUl6QjtHS9g19CAowrS7j3dQbHwZ7uYVjW4z
         eA+9JtquAaAlBlgjHV8SyT/YkwQsckVdmZe3Ch7fetzlB2U6XOaAO9BwrwQ9DcHdcV15
         ZjHcRO5sFwuMb8Q3oKWRLt6YRqZFznOS4g5vKtj+guHFoxej+s3rEYriVNA5nWGej0Cy
         FdWe62RfiavpTAf2UCHkN0Gohce5nqeb8QlBDJC5AKkXa+EoaIEV7ARgJeIiPZuJ3Rsn
         sH9JQFZWiXwRXsu8w0fPnsnJj2HJeCx56z/SloAMMZtjAiX/fjopmtlhWCQ/rhxgwNd7
         OXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680712204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAb8lMkcf5cD6uOQdEQO0L3nW4YeL6kpZLcRrER5U3w=;
        b=nEDCpE9L/bWYuRnriEOusTkJUkcYZkuG82dZ6PL/D4St2QlsCccpjVBKdum5jSmqFZ
         BIuaHv7luvAOp3bxmQN/+de9wWl6W9VFWx1PKw9oji1s2OjN1Ic+9QM/zjCpYT8cBVlh
         HGjQhBuE8uyIRfZMwfwlDON8o19a6ZDLvKrlsKWEtu2WNNQ4MAfguJyDEdp4GycKQswI
         /QaLhpaf8XUdvGKmJorbEmy7ZV/RwTNoWTGhreCHkzJuQQP1+twQdQtNacT24LPGTyQu
         KJpYsYnHkJt3ESO98BrIIGeBg9ySlGVYIA4Lpdv+HucLrKke3o944PNNU1NZDobKRPp0
         Of1Q==
X-Gm-Message-State: AAQBX9dGw5S4Jww9P4x+n+NjcEzSlxRs4PWJa0YSJgDf2iXSBmWRsmrf
        UtB8FkGsVLDmqkSpaBrWV8SARQ==
X-Received: by 2002:a05:600c:19c9:b0:3e1:e149:b67b with SMTP id u9-20020a05600c19c900b003e1e149b67bmr2277811wmq.18.1680712203916;
        Wed, 05 Apr 2023 09:30:03 -0700 (PDT)
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm2708891wms.1.2023.04.05.09.30.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:30:03 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To:     qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc:     qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-s390x@nongnu.org,
        qemu-ppc@nongnu.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 0/2] accel/kvm: Extract 'sysemu/kvm_irq.h' from 'sysemu/kvm.h'
Date:   Wed,  5 Apr 2023 18:29:59 +0200
Message-Id: <20230405163001.98573-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: WaQ0Q756Yb0a

Posted individually because it is modifying a lot of files.

RFC: this might not be the best API cut, but "sysemu/kvm.h"
     is a mixed bag hard to sort...

Based-on: <20230405160454.97436-1-philmd@linaro.org>

Philippe Mathieu-Daudé (2):
  accel/kvm: Extract 'sysemu/kvm_irq.h' from 'sysemu/kvm.h'
  accel/kvm: Declare kvm_arch_irqchip_create() in 'sysemu/kvm_int.h'

 include/sysemu/kvm.h           |  88 -----------------------------
 include/sysemu/kvm_int.h       |  13 +++++
 include/sysemu/kvm_irq.h       | 100 +++++++++++++++++++++++++++++++++
 target/i386/kvm/kvm_i386.h     |   1 +
 accel/kvm/kvm-all.c            |   2 +
 accel/stubs/kvm-stub.c         |   1 +
 hw/arm/virt.c                  |   1 +
 hw/cpu/a15mpcore.c             |   1 +
 hw/hyperv/hyperv.c             |   1 +
 hw/i386/intel_iommu.c          |   1 +
 hw/i386/kvm/apic.c             |   1 +
 hw/i386/kvm/i8259.c            |   1 +
 hw/i386/kvm/ioapic.c           |   1 +
 hw/i386/kvmvapic.c             |   1 +
 hw/i386/pc.c                   |   1 +
 hw/i386/x86-iommu.c            |   1 +
 hw/intc/arm_gic.c              |   1 +
 hw/intc/arm_gic_common.c       |   1 +
 hw/intc/arm_gic_kvm.c          |   1 +
 hw/intc/arm_gicv3_common.c     |   1 +
 hw/intc/arm_gicv3_its_common.c |   1 +
 hw/intc/arm_gicv3_kvm.c        |   1 +
 hw/intc/ioapic.c               |   1 +
 hw/intc/openpic_kvm.c          |   1 +
 hw/intc/s390_flic_kvm.c        |   1 +
 hw/intc/spapr_xive_kvm.c       |   1 +
 hw/intc/xics.c                 |   1 +
 hw/intc/xics_kvm.c             |   1 +
 hw/misc/ivshmem.c              |   1 +
 hw/ppc/e500.c                  |   1 +
 hw/ppc/spapr_irq.c             |   1 +
 hw/remote/proxy.c              |   1 +
 hw/s390x/virtio-ccw.c          |   1 +
 hw/vfio/pci.c                  |   1 +
 hw/vfio/platform.c             |   1 +
 hw/virtio/virtio-pci.c         |   1 +
 target/arm/kvm.c               |   1 +
 target/i386/kvm/kvm.c          |   2 +
 target/i386/kvm/xen-emu.c      |   2 +
 target/i386/sev.c              |   1 +
 target/s390x/kvm/kvm.c         |   2 +
 41 files changed, 155 insertions(+), 88 deletions(-)
 create mode 100644 include/sysemu/kvm_irq.h

-- 
2.38.1
