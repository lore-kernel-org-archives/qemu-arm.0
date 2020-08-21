Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp440514lfy;
        Fri, 21 Aug 2020 09:30:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlqX1T2RSmTBX97ttK8EcgYmEsS8vws800uIWsxTanKVC4Ox0ESaOZeZoyPZn0xi9MsIRp
X-Received: by 2002:a25:3ce:: with SMTP id 197mr4745428ybd.493.1598027449060;
        Fri, 21 Aug 2020 09:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598027449; cv=none;
        d=google.com; s=arc-20160816;
        b=GeJagYuE1iPyQrxzb04FqPyPZ4qhc7yANceIKFsp/CYV9CqUT/+Wu7pha5bq+aMBbm
         VZjVnLeHtUumnZ1ghA1Ie6phHYi9Z7O3vA+NSaeGbuNCxcoY0S3tqzhn2RKa7ahjJ643
         YGiwNk+0KH6rgsTfW/28ELcNmqhBOlKcZ9/ok5VS17oOpCdEZ8D4PPTwVfI2Gbe3wMvN
         +ENtBlmENDXTsLKj6sQhuv5QiyGkN7x6XZ7NtAFmSPc5YHJd3j4tPQcCAwZmXg54+gab
         b0GWB29d5k7Lz990bNwD/WUPmgDhPyC7vfx0v8nj2v58HK+w7uDdg+P0B0mtYc8d3/1l
         0+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=HWqwkfbMIQKiQpdnbw24fCwXZALtGYStinOFhF15nP8=;
        b=itOBY2mSJkg/G71fcTTGKjURNK27N2QYT1TL7NN8r9jT2tm7B7RBBXv8xiua1cQByI
         mlBMatQ1cXU+GRxX04HotZXbb6OesxejijO/BDaqCFqD5mR5+5Q4qWAFDq9aG3a9JPuc
         DGdq0ZHFlaGDntSXvArK09XfnZ6HGtUt2DtWwDUXKuQRVOnLqb35DRBgJYwrnd9ij9Zn
         n+aTNxAvvS/SrUu0TQGQaku7kRPFhNQWoaA55JuGT5v7J6aEbIhYjtFFW0m0Fe0ZqvF/
         w3pBUt929S91N8PthDdwF8F87T48A6dXqnlnBTcXA32DbrNGAir/J9yhvofWA5le5HR3
         m0jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XFdOZ22V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o133si2430609yba.292.2020.08.21.09.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 09:30:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XFdOZ22V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k99wG-0007u7-4D
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 12:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1k99vw-0007tV-Qn
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 12:30:29 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:41251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1k99vt-0006mR-6B
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 12:30:28 -0400
Received: by mail-ed1-x542.google.com with SMTP id w17so1929121edt.8
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2020 09:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HWqwkfbMIQKiQpdnbw24fCwXZALtGYStinOFhF15nP8=;
 b=XFdOZ22VxsBhg14LK341LWAWJFSzlpQ8+eIX3hdz5+t+Ex3H4pdMkor7u673g960dr
 KSx1BzhsRhapEEpxR8qcRbfKQUbCt6eg+Gzp2hZjxwTnj6aJklYtS5KTYHItVuA0dqO9
 PnqsAdQ5twwiv9UhpwsajdcDLCYXpyYtr5juPaoxjbVblEOGxgk2qqKDZ/fd6yhqBQGy
 fo15iBSD+627jp3oMTXvESGkIv2pR7pQUmQwqUR7paJpOLLe6TAHvbkPNY0Qu3ucfPzh
 HIgXmHP8V76g2GIJjQrTXwBucXGPUeL7E5wKDp/ptZwJFdopuqU0QWfDQ+qE0npTZ54c
 rb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HWqwkfbMIQKiQpdnbw24fCwXZALtGYStinOFhF15nP8=;
 b=WJcW6mdNqe/bbJqJzmR/nTbRU77jjK1lyjsjaxuePZMtWWUcc1+3a5fOJBHGldJWr+
 gUsVFrHN5m4uKfhNh5unEKd7ZRdGwN4H+9D2xWNWJ//uJBQW9KOFdzvu1+gcl7Pw1/bS
 unHvBY0d0347zZvzG49cgBPFXSNaVVCZeYKMS0+1iqIFPuABU56DxeFKEENrxNgnsG11
 BVSeGJqFRTh13Ssu9/fuV/03ANqv9sF6NjePoMZNm/pWr32qHHGA9ZdWpG4f44RBmWBi
 UGubBJzm60GH9XLDjmOSZmivECdg5/+c5KynN9sFkiSc6Y+nHd3EGJxwaR1jESfdJET9
 GEKg==
X-Gm-Message-State: AOAM533TlUz41xJYdrKp3riSrCedHIYqbtSZKWsNcHbDjC2z3AXRnrEh
 L2TsJXjTQqzfz/wA8vSAlh8TLpDIx6BIl0mv
X-Received: by 2002:aa7:c70b:: with SMTP id i11mr3566222edq.272.1598027422929; 
 Fri, 21 Aug 2020 09:30:22 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id dk28sm1398030edb.90.2020.08.21.09.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 09:30:22 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] virtio-iommu: Built-in topology and x86 support
Date: Fri, 21 Aug 2020 18:28:34 +0200
Message-Id: <20200821162839.3182051-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 eric.auger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kEDBahRcR3rl

Add a topology description to the virtio-iommu config space, allowing to
create a virtio-iommu device on platforms without device-tree. Our
long-term plan is to add an ACPI table that describes this topology, but
it will take a while to ratify. This built-in topology is needed anyway
for platforms that don't use either DT or ACPI (e.g. microvm) and can be
used as a temporary boot method for ACPI platforms as well.

Patch 1 looks unrelated, but is required to boot with a firmware on x86.
As previously discussed on this list:
https://lore.kernel.org/qemu-devel/aa5fa9e6-6efd-e1a3-96c6-d02ba8eab4c8@redhat.com/

This work depends on the proposed spec change for virtio-iommu (v2):
https://lists.oasis-open.org/archives/virtio-dev/202008/msg00067.html

And the Linux implementation (v3):
https://lore.kernel.org/linux-iommu/20200821131540.2801801-1-jean-philippe@linaro.org/

Eric Auger (1):
  hw/i386/pc: Add support for virtio-iommu-pci

Jean-Philippe Brucker (4):
  virtio-iommu: Default to bypass during boot
  linux headers: Import virtio-iommu header from Linux
  virtio-iommu: Declare topology in config space
  hw/arm/virt: Remove device-tree restriction on virtio-iommu

 include/hw/virtio/virtio-iommu.h              |  4 ++
 include/standard-headers/linux/virtio_iommu.h | 44 +++++++++++++
 hw/arm/virt.c                                 | 10 +--
 hw/i386/pc.c                                  |  9 ++-
 hw/virtio/virtio-iommu-pci.c                  |  2 -
 hw/virtio/virtio-iommu.c                      | 62 ++++++++++++++++---
 hw/virtio/trace-events                        |  4 +-
 7 files changed, 115 insertions(+), 20 deletions(-)

-- 
2.28.0

