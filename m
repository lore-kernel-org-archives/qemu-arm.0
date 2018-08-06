Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3009197wru;
        Mon, 6 Aug 2018 05:35:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf7Tr+gMXG9g/ctKiHDdF2frOqp+X/XFMQCQNDfPwwZ9J1w/P5+3nJtTAzWzx5NsvOCKYav
X-Received: by 2002:a37:4c0e:: with SMTP id z14-v6mr12790611qka.233.1533558924403;
        Mon, 06 Aug 2018 05:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533558924; cv=none;
        d=google.com; s=arc-20160816;
        b=TUqqJl1TNpWyYUyLLsl/RaXf0dYr3i7lRd+MyFmzcs93Ie+paaRpO91vvJ87FdecuW
         pNT/G4i0vIKpST/qjlY46eybmStVFnwEatl9FIH0+gV47fqtxdp8UnUJdntshvc0ivlT
         f3El8kBizRpaQaDfXKxSHyWwQXA21BwIdVNi4c988JdGDiXEPMolh9sIHVYtxBHbqp3Y
         fsK3nAegU7GqoEUSl6PNlWhByx/FF0i2kjs35r8lPHoGRL8gu3nSHUDblwLJQH5D6luO
         bFNjiHgkJj2TQZUGyCPuz5GYqtVf+Modw0rTh+KaBA9aOQ3tAZMFqDv5ystvKfSfvJhw
         6edQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=IqpVq8VBOq13JI/4Xsop/gKJzlXmOGkla4RqQMGduSc=;
        b=h8HH+OaymBmahFRjmXIlWG1rsFY0vxO0sCcvlXveSBF3fFwHDXR9hZwn/4QEiVatQr
         g2zM+GlDyJ8tq6brSKKgxN3XhZq2/tcpIJBdvH1z3MmsBH5Hrn+1wkdTg1+AWZVImOXz
         7z3KuRtzxDAcJ9vvtmS2okztCgQ8i4WTcwO+xAlwdJhUiiHpwgm16LhXhs5aIrC38J4S
         UBVOl0sizUhxEuo6uv88+Kp6SSC94Mqp4M3uBmMh0K1Rj/E7LV0j/st7mjzVF47nuL2r
         KYe8NBdeP4lCFn7hHfaFATQt4OD9UySXZKUSRsl/+a897lzH4Oj40G1/LduD3Pamx/Nk
         zbfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f20-v6si1650276qtp.48.2018.08.06.05.35.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 05:35:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmejL-000377-QA
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 08:35:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmej3-00034L-45
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmej2-0006gM-80
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:05 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fmej2-0006ZZ-0z; Mon, 06 Aug 2018 08:35:04 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fmeio-0000wi-PU; Mon, 06 Aug 2018 13:34:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  6 Aug 2018 13:34:41 +0100
Message-Id: <20180806123445.1459-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180806123445.1459-1-peter.maydell@linaro.org>
References: <20180806123445.1459-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 v2 1/5] hw/intc/arm_gicv3_common: Give
 no-migration-shift-bug subsection a needed function
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Shannon Zhao <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y9P2uXSLER1Y

Currently the migration code incorrectly treats a subsection with
no .needed function pointer as if it was the subsection list
terminator -- it is ignored and so is everything after it.
Work around this by giving vmstate_gicv3_gicd_no_migration_shift_bug
a 'needed' function that always returns true.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
This should go into 3.0 to avoid awkward migration compat problems:
the no-migration-shift-bug subsection is new in 3.0.
---
 hw/intc/arm_gicv3_common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index ff326b374ad..e58bc8b8105 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -203,10 +203,16 @@ static int gicv3_gicd_no_migration_shift_bug_post_load(void *opaque,
     return 0;
 }
 
+static bool needed_always(void *opaque)
+{
+    return true;
+}
+
 const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
     .name = "arm_gicv3/gicd_no_migration_shift_bug",
     .version_id = 1,
     .minimum_version_id = 1,
+    .needed = needed_always,
     .pre_load = gicv3_gicd_no_migration_shift_bug_pre_load,
     .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
     .fields = (VMStateField[]) {
-- 
2.17.1

