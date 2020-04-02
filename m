Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1333978lfi;
        Wed, 1 Apr 2020 18:18:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ5E6ZyNNHTt4tQm6hPMB+b6hBo6NubCb3VCVqnXqgTk58/FhQkEfWTJLKxuXpZaNALCZMX
X-Received: by 2002:a37:a213:: with SMTP id l19mr1095057qke.377.1585790334378;
        Wed, 01 Apr 2020 18:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585790334; cv=none;
        d=google.com; s=arc-20160816;
        b=DnEmkuc8A5BxeIliholqc6VRuSRFlm1cOUxI1Q2MdQt1L0hHvSgaMcopyzG+NKZejt
         7t+XofJbVEWT4oKqLi6TAyTV+UwpjHmOrUiAzCN60F1ggVW67Tv1e4gWyjUIjIgoZ/29
         iCuEN8M9KIY2wZurZAZU8c05RtoNPIQIzlZJVKZ2VIJKaX7VDt3w9tU45Own0L2e1W3U
         Gk3d6LS3K54OdA3kalGfxWNaHY4vR5yE+2HD5xyvPm577f8JomgWhFYSaUdc/8mNJPxj
         GFdjpcoEhK/NsU/CJqMR6w9Gdfi64oa87Hpk0R6nZ1zNbdqQhB8byXHuVsg64Q370lBp
         7JVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=Cqnnsk/pSJ+51AGB6pJiZPPzGms/mDCfZqtdablC9xU=;
        b=X5UOuDigKQe9wGweRBTGrrKfpMqiCaSR7acn1qYVFQcGo6UoFZSmK5MlkrkTuwqfPK
         DAYVLADk09krckaAs4PoeO/XE58WmImurmutXshMoVX0HmDblxZCwGU3PdqFbuOcxeeg
         9x6Ek9giNZEWxuAdQHzkJaMjkG6kk2Rx7QgQOpzL4CYQdfNTyZ4YW9kGQDPhcbh2m9Li
         Qkj0uFDz3W5ttcDWI094tOoq5lIZnVXwvzXSx8mksfexqlF1HR8fC0wcXu+y6N7En4iP
         99p1lnLaWDRhJrPFfKSH1fVs6XirqQqaOT+IWrnlVLzFmMQLVKgm4QN8eHS21sU0ewVF
         ldWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19si2551381qta.398.2020.04.01.18.18.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Apr 2020 18:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJoVR-0006VX-R4
	for alex.bennee@linaro.org; Wed, 01 Apr 2020 21:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1jJoVH-0006VG-KQ
 for qemu-arm@nongnu.org; Wed, 01 Apr 2020 21:18:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1jJoVF-0000z7-Rj
 for qemu-arm@nongnu.org; Wed, 01 Apr 2020 21:18:43 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:33656 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1jJoVC-0000gZ-5q; Wed, 01 Apr 2020 21:18:39 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5D28B181EA1385B4931E;
 Thu,  2 Apr 2020 09:18:29 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 2 Apr 2020
 09:18:18 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH] util/async: Add memory barrier to aio_ctx_prepare
Date: Thu, 2 Apr 2020 09:18:03 +0800
Message-ID: <20200402011803.1270-1-fangying1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.53]
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
Cc: fam@euphon.net, zhang.zhanghailiang@huawei.com, qemu-stable@nongnu.org,
 stefanha@redhat.com, pbonzini@redhat.com, wu.wubin@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fcmRT0S1Brd6

Qemu main thread is found to hang up in the mainloop when doing
image format convert on aarch64 platform and it is highly
reproduceable by executing test using:

qemu-img convert -f qcow2 -O qcow2 origin.qcow2 converted.qcow2

This mysterious hang can be explained by a race condition between
the main thread and an io worker thread. There can be a chance that
the last worker thread has called aio_bh_schedule_oneshot and it is
checking against notify_me to deliver a notfiy event. At the same
time, the main thread is calling aio_ctx_prepare however it first
calls qemu_timeout_ns_to_ms, thus the worker thread did not see
notify_me as true and did not send a notify event. The time line
can be shown in the following way:

 Main Thread
 ------------------------------------------------
 aio_ctx_prepare
    atomic_or(&ctx->notify_me, 1);
    /* out of order execution goes here */
    *timeout =3D qemu_timeout_ns_to_ms(aio_compute_timeout(ctx));

 Worker Thread
 -----------------------------------------------
 aio_bh_schedule_oneshot -> aio_bh_enqueue
    aio_notify
	smp_mb();
	if (ctx->notify_me) {   /* worker thread checks notify_me here */
	    event_notifier_set(&ctx->notifier);
	    atomic_mb_set(&ctx->notified, true);
	}

Normal VM runtime is not affected by this hang since there is always some
timer timeout or subsequent io worker come and notify the main thead.
To fix this problem, a memory barrier is added to aio_ctx_prepare and
it is proved to have the hang fixed in our test.

This hang is not observed on the x86 platform however it can be easily
reproduced on the aarch64 platform, thus it is architecture related.
Not sure if this is revelant to Commit eabc977973103527bbb8fed69c91cfaa66=
91f8ab

Signed-off-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 util/async.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/async.c b/util/async.c
index b94518b948..a51fffc20d 100644
--- a/util/async.c
+++ b/util/async.c
@@ -251,6 +251,7 @@ aio_ctx_prepare(GSource *source, gint    *timeout)
=20
     atomic_or(&ctx->notify_me, 1);
=20
+    smp_mb();
     /* We assume there is no timeout already supplied */
     *timeout =3D qemu_timeout_ns_to_ms(aio_compute_timeout(ctx));
=20
--=20
2.19.1


