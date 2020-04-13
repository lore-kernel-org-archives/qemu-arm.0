Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3568002lfm;
        Mon, 13 Apr 2020 02:18:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypLRO12w2WtfSCgYOtXkdzkNpBZO9sE+KfYJLrg/VSTDxjCznXW4/6iWEqjRvr8OhtCSA/eH
X-Received: by 2002:a0c:fb12:: with SMTP id c18mr15729643qvp.171.1586769526335;
        Mon, 13 Apr 2020 02:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586769526; cv=none;
        d=google.com; s=arc-20160816;
        b=PjfGEHclXm4CmL9J3RXXQxXeUs+rw1zfR3K2Zipk/lYlsWL/hGw7AlTEu0++8Ho2gy
         FilV/E6j2oxV2aqqkxX4TP8s0sLSRuAzy53wF5Jyk5cO0YJHJwQ5vFyRnBAYsDWt0T+/
         9fXWE/yYn+7U6QV9QGqKvTKeQZ/H5RA/lcq5KmfyF/5c3084DGXgGi674XRl+2jlX+mZ
         DgQkWPn8ayOudAqK13iEEkTvFeJ8xYUHTjfE+R8k8B3/RWo5GoBkWmjRLwa+lKEpYlMj
         r2K+YoiGnLrSiM1azU0DCIHMMsPb34oxYiQGjcHM6mT3sSjMe2Zf7xcqSWptSamd5zus
         EnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=2YXOPT19zTahkq3m5/UNxhQxP57PLcwNXGm65NjzAtQ=;
        b=K9breF91N2aRvs9IfsRBus7seQ5tGub5rTW89R/z/nnAPyUFs9nAxh5FnkltMBSLev
         dHoRHNAwoycm8jpBZej8ZfHHckJ/+3iNFRHEzxy/N4CWWe0/tPLjrnogGbWuVJxybFta
         zko7r6EoBMlHeowVjZtQajmApELDQJ2Xi8wBo0qfwzmcitXN5z5t0Q5/KARLVOBcwRDT
         FIApJ0mzqqOU+x/iPEICufDtAnS4H/w7fuyKm073BhQD1ctHCrQxJVpRixxUMLa4hb9l
         JotcuUhEj7pxrY41qMLexlzzOn6jiG66JOSnDLRrmEEzjJJpz+upnddzc0DQYxxmKmW5
         jBIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bu8si115305qvb.53.2020.04.13.02.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 02:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNvEr-0001TP-PJ
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 05:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47307)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jNvEi-0001SR-JH
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 05:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jNvEh-00062C-GV
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 05:18:36 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37968 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jNvEh-0005zL-62; Mon, 13 Apr 2020 05:18:35 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 24379E4DEB964DCF0316;
 Mon, 13 Apr 2020 17:18:27 +0800 (CST)
Received: from linux-kDCJWP.huawei.com (10.175.104.212) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 13 Apr 2020 17:18:16 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/3] Some trivial fixes
Date: Mon, 13 Apr 2020 17:15:49 +0800
Message-ID: <20200413091552.62748-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q6u0IzO5e3dR

Hi all,

This patch-set contains trivial bugfix and typo fix.

Thanks,
Keqian

Keqian Zhu (3):
  bugfix: Use gicr_typer in arm_gicv3_icc_reset
  intc/gicv3_kvm: use kvm_gicc_access to get ICC_CTLR_EL1
  Typo: Correct the name of CPU hotplug memory region

 hw/acpi/cpu.c           | 2 +-
 hw/intc/arm_gicv3_kvm.c | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

--=20
2.19.1

