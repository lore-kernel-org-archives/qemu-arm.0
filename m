Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4602414lfb;
        Mon, 30 Aug 2021 18:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdKHwp2VrQqPzKHTkZV1G1NNqu2MsnuP4Od4xYIc5dUmjc7eblUtYz31OBw+kN+SVIUWx8
X-Received: by 2002:ac8:5fcf:: with SMTP id k15mr570781qta.137.1630374897931;
        Mon, 30 Aug 2021 18:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630374897; cv=none;
        d=google.com; s=arc-20160816;
        b=jQ2js9BgZvp34SIbZA5Ez1DxJzuq90/NVz8Sk0D8BrDcVb7z00aYVOrWym49fR4UX/
         tMeQWOciV5GQAx1nL6hFDVkRNl00PFRdcrxujyBP7OxzzMXEN9KrddC6r+oGZm241dFa
         Xr1AGXgkubQGwY+dyYgWIfjzCp1L9GLEhIffsm8CS1T7ZNwTUVnjt9SiTo+GgvAkyE4+
         5Viuoxn88EQapPw7Tuy1papP2uOOwGT1VEuvL2hdRYA2mruObg3hqWU8lRuBTRYAZaSv
         VltfxXzFZZBRGVtHnmUwONCn8pNVnljfGy/graA0b9RyFITuuCtiLBI1sbOvrKJ/ucDW
         R3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=tEbeLigzRt5WT49nyA+Ve3FPrwhz2AeeLU4nxDK36n0=;
        b=Loj7CvgewwRmYC7MEXEBpFzCPfBeNaZ/GrufYcJY2LSV0i/s/13DBD/cteogbrfd71
         ch3y3i2X7O3NKIaIkWjNeXwcLreudCsugk1Q/c4Du908jrWd4Z28cDiHvVfLzzUy+Y+1
         S1T+VAYPSsVtRhOddUAgBbRxm0V5g8iesKgPOxAs3/DWmtiMWgYS+dOVYx1llAny7533
         D8atKquzCzp5gLzxg6PMKzgOwNKiWx+EjjQF3PUiUkwYTAyIzzEaL1T/pbQl/FfoRTwn
         O2CtqHkQNzTjklvxnfVRdGMXfCckxFW4yAufVlmLACL19V3iDxlhD4dPhJ2sxrCsnqH1
         RNyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si10180668qkb.247.2021.08.30.18.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Aug 2021 18:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:45606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKszJ-0002C8-8t
	for alex.bennee@linaro.org; Mon, 30 Aug 2021 21:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mKsz7-0002BM-Fs; Mon, 30 Aug 2021 21:54:45 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mKsz4-0003xK-WF; Mon, 30 Aug 2021 21:54:45 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gz9BN0zlbzbkrN;
 Tue, 31 Aug 2021 09:50:36 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 31 Aug 2021 09:54:27 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 31 Aug 2021 09:54:26 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>,
 <qemu-s390x@nongnu.org>
Subject: [PATCH 0/1] hw: Add compat machines for 6.2
Date: Tue, 31 Aug 2021 09:54:25 +0800
Message-ID: <20210831015426.101188-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rPA/vnqjnRhK

This patch adds 6.2 machine types for arm/i440fx/q35/s390x/spapr,
which is originally from [1]. Here resend it separately and hopefully
it can get into upstream first, so that some other patches currently
on the mail list which depend on 6.2 machine compat stuff can be
rebased on this.

[1] https://lore.kernel.org/qemu-devel/20210823122804.7692-7-wangyanan55@huawei.com/

Yanan Wang (1):
  hw: Add compat machines for 6.2

 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 9 files changed, 71 insertions(+), 6 deletions(-)

-- 
2.19.1

