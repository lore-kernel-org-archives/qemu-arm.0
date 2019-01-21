Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6372503wrt;
        Mon, 21 Jan 2019 10:47:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN76NHvrC1uF4vVhfUYsgqquiL+0y7JYK34u21N6ds0BTkl9wQ/63AeRME6gPPvjUaGsbGtn
X-Received: by 2002:a1c:c90b:: with SMTP id f11mr527424wmb.33.1548096427141;
        Mon, 21 Jan 2019 10:47:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548096427; cv=none;
        d=google.com; s=arc-20160816;
        b=n/7aNgQGW16/IS/QPWHcu5innRjdO2mZTg76p0gObU5eMIxkO3olE1cN+zz0dQmm9b
         R2ITX4NL4PU6el5nOkaviH4WuesUOg+8fhFRJWyfXfBqO4EQEwJNUAAYFT02AvkuYJ61
         RlHFIa+vrjfHB4VBor1fbqr46U29viHxCUMW780cLtPK1oAikom4eb2k5KPxP6dnfFE7
         cUtsF04YGPNq6N/N6Qxlk4/juOvmIYLXa6v/d1wV6Yei8qPxytDz9YBw6gVZCp93UfwN
         TM2i843trExywtKcvzqawGmeBk8kR3qR4Qx+2822ZBnhXXPpAZRz5tQhZ4+24CrQOke4
         iTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=WiI/ai6LBZIUIZQd++BmhxhHpLIGKWoxtvMp7jrWOAw=;
        b=ST9Q/Y2m39efpw5D9hji2970raTulZ5r/Iib/IF1QOjVLfpIE1eYPu2bJvdQ+GVu1U
         CXRHad8AdNZSiv+JTyL0w4qpLBtZ2H8WeOIZMSbOiU/ARM6SEeSicfuDgINPjs9Dzvu3
         6wBQDyVK64N/VcsJnI7BM2OwVxy+4SrI+/f8Lk4Yjqa1UF5NKeeCSsF5lLHtAKz9g55u
         Q7zaP2M5wfEoyqOiC+QJ+QrR3QUrfrzu7KxFyfxW6BFAAhDOa+oeaZIPAmQaVYKtcgih
         l/Y+0bOvgR3gm/YmHXAy+DlAWD+uuZzoP2kYufsh+No5cUWwBXmWiJQuVxqBXb6MrWxO
         GJJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kBeVTm0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h62si32643387wmf.53.2019.01.21.10.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 10:47:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kBeVTm0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glebC-0005bP-4N
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 13:47:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleXZ-0002Rf-KX
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:43:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleXX-0006dR-Az
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:43:21 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37187)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gleXX-0006ce-5S
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:43:19 -0500
Received: by mail-wr1-x443.google.com with SMTP id s12so24605547wrt.4
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WiI/ai6LBZIUIZQd++BmhxhHpLIGKWoxtvMp7jrWOAw=;
	b=kBeVTm0flg/zNKFVys1m3Gk5FbfoKckXCdrOOP/NP+9reDUXyUdOwQeKO3XCaQzxxd
	zfZ06TM0XDXYXw8FYRAIphZS96T44gIncgHpX2qE3kzEpZKfunmbgDDdSqo01oxv76c7
	B1v7bpfVrMwPuyp7EVleQUtJZGnSfMNfZRKW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WiI/ai6LBZIUIZQd++BmhxhHpLIGKWoxtvMp7jrWOAw=;
	b=sqBvErKX2VDBOg44DNK5mPctwf3HGZiKbe9npyCUbnQau8VH3BSXL958gr+I3gk4I+
	q34j7vWJgAd2fmlNiyDbTdi07i305gvmFU20VeWjoTRcP7ggSTxdZfldr9mHRnqpHp+5
	QUBIQ6qe5aQQxwkaDyDEvp0scfLr1b3CYJEm7ElqQbFQ8hbAAqPUhj3l+kHt7COkNhQq
	On+EgG8hfFMr0tHlr+5uN+gCw17R32jJwO4bpGkWZb0fUnZYne+C+dqa4qrH/s5wh/K1
	sbbzC9Ikpr4zNvhk8hkZB7e7wNBG0FN0dx5kXuf4yySLVusk749JzMrjcm4wQXtI3uCi
	Zhjw==
X-Gm-Message-State: AJcUukdSQsdAX6wRxxS/AMNqCiW7yUkW4f4296Q2PK6E3tdhgYE8LGUC
	oPzCkIFzuSKRFABLy4Wa4wBaeoym3fcrEg==
X-Received: by 2002:adf:eb45:: with SMTP id u5mr28174324wrn.102.1548096197585; 
	Mon, 21 Jan 2019 10:43:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	200sm52038603wmw.31.2019.01.21.10.43.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:43:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:43:14 +0000
Message-Id: <20190121184314.14311-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH] xlnx-zynqmp: Don't create rpu-cluster if there
 are no RPUs
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 68++H4li4uWi

If we aren't going to create any RPUs, then don't create the
rpu-cluster unit. This allows us to add an assertion to the
cluster object that it contains at least one CPU, which helps
to avoid bugs in creating clusters and putting CPUs in them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a preparatory patch that is necessary for the series
"[PATCH v3 0/4] tcg: support heterogenous CPU clusters"
(20190121152218.9592-1-peter.maydell@linaro.org)
in order to avoid the xlnx-zcu102 board asserting if started with
fewer than 5 CPUs.

 hw/arm/xlnx-zynqmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 370b0e44a38..16cba433cb7 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -178,6 +178,11 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
     int i;
     int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
 
+    if (num_rpus == 0) {
+        /* Don't create rpu-cluster object if there's nothing to put in it */
+        return;
+    }
+
     object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
                             sizeof(s->rpu_cluster), TYPE_CPU_CLUSTER,
                             &error_abort, NULL);
-- 
2.20.1

