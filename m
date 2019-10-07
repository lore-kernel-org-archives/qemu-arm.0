Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4055083wrm;
        Mon, 7 Oct 2019 10:07:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDRxYsIw3Ufi1T8fDfQ79YKjCyiIl/UYFG6TA1pvZmj3qD091g3+jwpSsBzDi4XXYOJFdy
X-Received: by 2002:aa7:d4c5:: with SMTP id t5mr29610664edr.154.1570468021581;
        Mon, 07 Oct 2019 10:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570468021; cv=none;
        d=google.com; s=arc-20160816;
        b=skEklvyDlfLsa8plD7081tVCSqQpfLEs7HAlvGfiLwUYpntAqY0mPWLOUJWw1dsoD/
         yI7LdND84xmckavEYnpBC1pk/M2exZgHXysn8mh6P3CHfUwRwsGPAxHf4cS7nL61xoty
         qh4ZYBhCp6rbG7Gp5V551Bt28l9P9xLDUltGmSG458p+kffBi4TKyMvbbC0XQl6BJSCx
         Rl1fAy6UEM0ep+wNTkJNdsqUQ/k4EctNKN1b0OJoocE582E8mFi5rVxVv++3r0NpnqGy
         NVBFyUPfGAqhZI+emb2Ab6lwhVXszycfdlNNRxrpBjj58sH1Av+BkMocd2rw/C0ZQ2C4
         lgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=f9lC9hFwAWs4VfcECOWBChN0Ee2FFnDZMKJGTwBku3s=;
        b=Z071qP5Inpj47oCiYJZOVAW6QCfw9D0XvTtbzgdow0XmTSlmRKxzyTYtd01o4rPDOx
         i6TzS01fH7pv3CvmRq+gfQy60jjoOkQshkqnUzN9LzL96ojlf7R6GsdDJIfrQwGK0mBR
         ZbeFVdvpINXC1L4smnN3EB69ZESdC4SQjpbBt5a97Xfd2pDAIc0vVJA43f9630jOoXnk
         lPyPcsizYOVzvMGLvpr3D7X9PUPEKftgS1MMHjJYDoTbUg78iLC/Ap532ad+Zhh+WYJq
         n8riqSdA/a6aoFfGFIeooy8XL6lPW9HVWneF83ZjSsUCbTmZDJYUx/xgDbdGWRlFqdrI
         xwrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si7487794ejq.45.2019.10.07.10.07.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 10:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHWTL-0006bj-Ur
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 13:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iHWSv-0006G5-Kv
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:06:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iHWSt-0004p3-Sm
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:06:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33068)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iHWSt-0004od-JP; Mon, 07 Oct 2019 13:06:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4D49387701;
 Mon,  7 Oct 2019 17:06:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 070445D9CD;
 Mon,  7 Oct 2019 17:06:28 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [RFC PATCH 2/5] timer: arm: Introduce functions to get the host cntfrq
Date: Mon,  7 Oct 2019 19:06:19 +0200
Message-Id: <20191007170622.1814-3-drjones@redhat.com>
In-Reply-To: <20191007170622.1814-1-drjones@redhat.com>
References: <20191007170622.1814-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 07 Oct 2019 17:06:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /6Elk7Zg3qjj

When acceleration like KVM is in use it's necessary to use the host's
counter frequency when converting ticks to or from time units.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 include/qemu/timer.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 85bc6eb00b21..8941ddea8242 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -1006,6 +1006,22 @@ static inline int64_t cpu_get_host_ticks(void)
 }
 #endif
=20
+#if defined(__aarch64__)
+static inline uint32_t cpu_get_host_tick_frequency(void)
+{
+    uint64_t frq;
+    asm volatile("mrs %0, cntfrq_el0" : "=3Dr" (frq));
+    return frq;
+}
+#elif defined(__arm__)
+static inline uint32_t cpu_get_host_tick_frequency(void)
+{
+    uint32_t frq;
+    asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=3Dr" (frq));
+    return frq;
+}
+#endif
+
 #ifdef CONFIG_PROFILER
 static inline int64_t profile_getclock(void)
 {
--=20
2.20.1

