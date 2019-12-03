Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1437942lfc;
        Tue, 3 Dec 2019 04:31:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzRmG5fzo57nNIM/SRBxr1sRtW601BBniKz1HGG3lQlG5iI02IgudFzL8mKrGIA0Z6hHrpq
X-Received: by 2002:a17:906:c299:: with SMTP id r25mr5665964ejz.272.1575376265778;
        Tue, 03 Dec 2019 04:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575376265; cv=none;
        d=google.com; s=arc-20160816;
        b=IkowyV4Bc8niuqCqUcabTkJsuvQ4KjXEDx73q0PnYi515Mnp4g5jtLUTwK+0NMnxO9
         JbnR3mPSDQ9nMKE1X38VI2zpYZSYh9bHVmZl0HfoV+RlCzgSxUMLCTRhhmz51cLEjo81
         37m1Ctm7SAtJeFRIcUzOiJ/kpw/alsYpP+UCOivZqOkI0Q58JWTbdO76hdA+LsVApdvd
         85QqH02281EZQ5ZuozULzHM2YDXd8sUW59m7VRrNkvBjT6P4dWTP9LlB3uX+eNOpMS0A
         AGw9Kgf7CroTOXPQJR1W88OcrtO6i+zpFf0zz2ou+PzOTjh0xCM1RdSwb7wfqEwa0cmc
         Yc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=6XQzGqO/TWrg2uDobh8lwce0mgP514MvotcGT+rw2Vc=;
        b=XDfADbPmoI8UsvR1MR/qW2fpPkLEUs01cL+UUrZDma09dJmrFk1KrvavUvXQ6oH8jj
         cfFecKlU1RbjVp1Pfj5g3UbTLfFNi/escN5mJhiKpP7W+66hnWfQRIvLCci2pGj9A8PZ
         bo0icgzZ+jXzYsCEZ0tZZcG75DYOmZk4R+BH/+KNNnxljU6ikKJb/cKNOdzolQMgknXE
         OZ5GIk9IgWTgBwMrkLySxEITca387W65dJfGdanYFB0nKOBMeflVsmWQQQ+Np/Iewv4l
         HDgYVT70kziz/OHH791hiE37CoPlMAB7LTQhLzFVjNp8E3Ks4I5XC/cCDAGy2eKunewI
         JrIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si1945857ejn.180.2019.12.03.04.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 04:31:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic7KU-00083D-1w
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 07:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JG-00082r-KG
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JE-0003Yf-80
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:41 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:40888 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1ic7JC-0003Q6-Fn; Tue, 03 Dec 2019 07:29:39 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 493BF2DA8E0A56A3B62F;
 Tue,  3 Dec 2019 20:29:31 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Dec 2019 20:29:21 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
To: <peter.maydell@linaro.org>, <thuth@redhat.com>, <lvivier@redhat.com>
Subject: [PATCH 0/5] tests: Enable fw_cfg tests on AArch64
Date: Tue, 3 Dec 2019 20:27:48 +0800
Message-ID: <20191203122753.19792-1-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kraxel@redhat.com, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yc6hhG65Q8KV

There are quite a few tests disabled on AArch64 such as fw_cfg-tests.
This patch series fix some problems in test code and adapt it to
virt machine.

Xiang Zheng (5):
  tests: fw_cfg: Rename pc_fw_cfg_* to fw_cfg_*
  tests: fw_cfg: Support read/write of fw_cfg registers on aarch64
  tests: fw_cfg: Use virt as default machine in fw_cfg-test.c
  hw/arm/virt: Add FW_CFG_RAM_SIZE and FW_CFG_MAX_CPUS into fw_cfg
  tests: Enable fw_cfg test on aarch64

 hw/arm/virt.c            |   3 ++
 tests/Makefile.include   |   1 +
 tests/fw_cfg-test.c      | 113 ++++++++++++++++++++++++++-------------
 tests/hd-geo-test.c      |   6 +--
 tests/libqos/fw_cfg.c    |  17 +++++-
 tests/libqos/fw_cfg.h    |  20 +++++--
 tests/libqos/malloc-pc.c |   4 +-
 7 files changed, 115 insertions(+), 49 deletions(-)

-- 
2.19.1


