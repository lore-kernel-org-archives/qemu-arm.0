Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1417017lfi;
        Wed, 1 Apr 2020 19:45:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypJlGkPjBjYnjT8eMig5Bci0DIH6sha2abC5cjo4Ff9/xotQyeno+ibjwJW8vtY7Ved54h6t
X-Received: by 2002:ac8:1b6d:: with SMTP id p42mr804382qtk.345.1585795550280;
        Wed, 01 Apr 2020 19:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585795550; cv=none;
        d=google.com; s=arc-20160816;
        b=AJEw9WRHfxmuAh2vhPp9NQIhFmJXl6/wfJu6Am8NJyRJ8GX7iX6y/33f9d7+pS18BR
         0MPds7qh6R4jU6Tp5oRulPCduHWbhz2D3cEvGaxQ4VFEEEje9U2YDvw9jFvZIrdfTfKI
         yBBYqWxi5L0F0hcgifSOJ0zoqSMbU5/xL4X+FFhFHMfm5Pgo0TWNuVIjPmzZhRwBfY1j
         CHlBjw1vA6tlT0NFqG7SbLPHSuJOM7/XUVI8YsR9/+DVUwICc+OoGomJji8BeGf4AgPh
         WzwflDFVPLRKrnv7UgMdPdc/BTmIcmrFCgIGajGLeR+yZYZkisKuYRVCZoi/pRtJUd4O
         CZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=jocdY6yZrH5FtLkLFmx58cZbsx47BDy1p18i2dJ1alg=;
        b=MmiOYzusQ9+E9YUyzVnniU26It1BzazmWg/VtqUyEVqf9tggQeFO2EAQ0DeEUcuj40
         /vdmk3eYpZEtER1vGOdNPH/Al8njL3o80/Mj+3k/ASKlBsRke7hAPrF30GWac0yqRE4x
         AWkWApeT3nIFHK/Oa0R6OjSyUikryFiNX9xPMyPWmS7VHlN0wqKFxxczfil1MJjpekye
         aqmj0T58M+uku+tZMrudUpaUDyPyUHr1cPxChbxduLKYc0bdmT3gjkbFscc7ImM1ul6f
         P0LfNE0oRFyE3WHJdJ8jAboapS1CeWviTo0z4gN/4YbleOXcSoBdELB+CQToVeHCJye9
         yO3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y23si2601230qth.36.2020.04.01.19.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Apr 2020 19:45:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJprZ-00027y-NL
	for alex.bennee@linaro.org; Wed, 01 Apr 2020 22:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1jJprE-00027C-Rz
 for qemu-arm@nongnu.org; Wed, 01 Apr 2020 22:45:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1jJprC-00056G-9W
 for qemu-arm@nongnu.org; Wed, 01 Apr 2020 22:45:27 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:38422 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1jJprB-0004lE-Tw; Wed, 01 Apr 2020 22:45:26 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0854D657555145C53158;
 Thu,  2 Apr 2020 10:45:20 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 2 Apr 2020
 10:45:00 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2] util/async: Add memory barrier to aio_ctx_prepare
Date: Thu, 2 Apr 2020 10:44:31 +0800
Message-ID: <20200402024431.1629-1-fangying1@huawei.com>
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
X-TUID: Ye4VUDaK0KQP

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
Reported-by: Euler Robot <euler.robot@huawei.com>

---
	v2: add comments before the barrier

---
 util/async.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/async.c b/util/async.c
index b94518b..89a4f3e 100644
--- a/util/async.c
+++ b/util/async.c
@@ -250,7 +250,8 @@ aio_ctx_prepare(GSource *source, gint    *timeout)
     AioContext *ctx =3D (AioContext *) source;
=20
     atomic_or(&ctx->notify_me, 1);
-
+    /* Make sure notify_me is set before aio_compute_timeout */
+    smp_mb();
     /* We assume there is no timeout already supplied */
     *timeout =3D qemu_timeout_ns_to_ms(aio_compute_timeout(ctx));
=20
--=20
1.8.3.1


