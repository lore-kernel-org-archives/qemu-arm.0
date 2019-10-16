Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7233973wrm;
        Wed, 16 Oct 2019 07:34:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoe7q8CmY2IpYEiP6l1S+RSmOSFhEekQDLo6LTzSkr46YKT7bViUtvUbAIv2x3OMCRvJiG
X-Received: by 2002:a05:6214:32f:: with SMTP id j15mr42617618qvu.29.1571236485792;
        Wed, 16 Oct 2019 07:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571236485; cv=none;
        d=google.com; s=arc-20160816;
        b=jyHGNdA7xN3pPjgO7mZUFrCJSsMnRDTD/FTrDj6fMS9Ulo7TAKzsaOKO61yRi13YG6
         502qS4VUnkV61DFTw0nflu60Ht+rTCuEUGspxFs3UPysKn49wcrF3RvbTm5+c7Qdf16p
         50Uiu0eLMSk9zVnLdeZrWtnplAUL1LoqxVtcXChvlXHgFh8jKHmSSP/3n4UeQFgK/ZNW
         MiXieaj8XWKPa24DQW74Hruyy4rJEPAY+ss2HKoEj8QrVic46r2ynRgN2RZQxSK9DKJb
         bGS9ghj7+8rjV/5RQZ+TM/ZRxLAXfhqZIWsAQ2W5ppmHCzvYlcBOLn+CsftwNmsdHjPk
         gQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=v/hsNSN5jDApl8dVpT6B91c1F4vI8PyCF0luRxCSefY=;
        b=lgC9SKqNSHe7iyLt6lA1s/fja72U4rKrUTjxnJqPI1i/SMr99Krn/VpYPDqb7YneQY
         7Y4ZnakVJC3/+3myWlm1xvCGhEJrdursflWTzP6ojYFvx5cpZWP0HuE9BeZhoLG0v3i+
         /MXIku7/ssKmgurgLtQ+J7Mur1j6esHrDVJKrSLY6AIqeDNtaecsfg0S+guHy3nzEnPj
         3EsbHAKYUgpuG79ZuqIaajc6T4AUM+39n8gP44Ny/qlcjiFAUUpgUJBxIrgWymwncE1k
         LpWeFHf8QGgiI0mQlaVwNNF+B/LqGmPHMBwtmK2Rq3CjV3YOja8vdFueN0Lk4FPpoRYD
         CzXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v138si24305674qkb.355.2019.10.16.07.34.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 07:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKkNw-000550-EV
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 10:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iKkNX-000540-AS
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 10:34:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iKkNW-0000hj-Bp
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 10:34:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49760)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iKkNW-0000hQ-6W; Wed, 16 Oct 2019 10:34:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 64BF1883BA;
 Wed, 16 Oct 2019 14:34:17 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6DEC19C68;
 Wed, 16 Oct 2019 14:34:15 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 2/5] timer: arm: Introduce functions to get the host cntfrq
Date: Wed, 16 Oct 2019 16:34:07 +0200
Message-Id: <20191016143410.5023-3-drjones@redhat.com>
In-Reply-To: <20191016143410.5023-1-drjones@redhat.com>
References: <20191016143410.5023-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 16 Oct 2019 14:34:17 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yA59IDUqTiG+

When acceleration like KVM is in use it's necessary to use the host's
counter frequency when converting ticks to or from time units.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
2.21.0

