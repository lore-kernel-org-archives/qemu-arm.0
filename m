Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6175401wrt;
        Mon, 21 Jan 2019 07:22:50 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7uTZbjXmqKPnSoGtki+7IqE/8IVq97cYj9sRTFtFRVK0vCtCrqTAUJIfhPq3cE1h2Ui4dw
X-Received: by 2002:adf:9382:: with SMTP id 2mr28044901wrp.269.1548084169982;
        Mon, 21 Jan 2019 07:22:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548084169; cv=none;
        d=google.com; s=arc-20160816;
        b=DdAJHfWbQTKJrkDeSSFRB8ObfnP6PHv+cTAvhtkoEHCfFlSb+7TAjR84SrJUbQolND
         MUIODLqHqaQ9nm8Zbf/2myj5t/QqzwXbad3RLvCpnBtXRy1jRC2BKvAfb+Mb8xzYjgCl
         ory18widwkrsfM/6kcg+tNLNKXGTLmFPJBSRm4G54XFDqnN65PpoYb2NwKdDK0y4CWzb
         ydi0Y7kKwjsvYyqWKqJU4u5GyLG+2dEsF1D6g67tb5cyg3GUcjO5Fa6lILa4hYjImwKg
         ipqTHBo+NygHsm8xMZRfYTAPNiQVxcv2mtnR4zTUidCjvOVn9xvR6i8WvdRpA5F/GJRp
         zD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=I8BvMLz1v72BoXMnzdr5sWeD9HZE5rwvOIP96mH0G5U=;
        b=mWXmIMq67u5Adgncs1mqEzNiT4pnmXV5FhjTjSc1p3iu+ndTI02KDjk5CHra88PISS
         moAufE5xogeOSts05Vl97nfR9ZTJwVgkZ2p2F1rJxisWAwObDvBuc5TrXLzAek3aPDTY
         vJxS8TL797DjekdWzELpGabySxhxdv6ZDe9nQOyCPnZerNiwrKLpPkrjUiXv9Z0yMEzZ
         7dNAvChgmnPaSUfHcVFe+8DnNL3PQlKnXgKBf5R9MDrK17l7xiVVjyLFO0cZzcuxh8HJ
         POf2HyiNdpr4Yw+zhJkoR9CG5RUR7QnrrvPUEJsL9vTv1Ig6bujQPvw+FqS2TatIwI5+
         vXlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iiDhCMoK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si32890480wmf.170.2019.01.21.07.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 07:22:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iiDhCMoK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glbPV-0007yw-1Y
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 10:22:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glbPH-0007xa-3O
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 10:22:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glbPF-0003u5-Lu
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 10:22:35 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45741)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glbPD-0003qT-PX
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 10:22:31 -0500
Received: by mail-wr1-x444.google.com with SMTP id t6so23763157wrr.12
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 07:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=I8BvMLz1v72BoXMnzdr5sWeD9HZE5rwvOIP96mH0G5U=;
	b=iiDhCMoKeNNidNOWXJnccUItIuefMBxA3schLrFoSITltbKmSkVfodngubH9MmdAuy
	hBkmi9LkwzJFIXxpOnaMn8TAlX5w9iUDnFYu6Kb+nRM56bO1pSK5baCoj1hq3BlyUORB
	ZVI3hGzp9iPDCev1ow/AaIWjWLO96FGBaS8+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I8BvMLz1v72BoXMnzdr5sWeD9HZE5rwvOIP96mH0G5U=;
	b=bw3QRbmIl/d0R+o52I7JW3BwhKYPnAEPBrbmpQjIslnWxFI6CIXtIyHIvcnTV+VAe9
	PwaElzIfcPycELGcv/epj1XpcoPGmvgx+CY9unYmW5UbUH6ugLaP0pb5v2TOqFKidADk
	SHXDdr2wDe3GL4MWeGxsfRs4SErI0cXAGKkC5GME5msImdNNOiy5lYBPQw+/T1rSiIJd
	38eQT6Db2eEYq+vzmWa0epFvD5whpXr5VkDZKnjttm5wsV/v5edT18psvSQEJFSypWlX
	HDH4b3Li4yR7tJSVEcfI5YsJ/TtyB/DxMVM/sENtgU762vE8a/NSKGBkj3AOMlIbKWOR
	v6Ww==
X-Gm-Message-State: AJcUukemn7XFbVzY5TvsBlClBLUU0uHSQVT+VcnomT+2zW0+ogHFaRTr
	XSp3CaBTyOn/BSvEf4myB4MQHUT/jztwcA==
X-Received: by 2002:adf:ef0d:: with SMTP id e13mr28224636wro.29.1548084142969; 
	Mon, 21 Jan 2019 07:22:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	o16sm128900134wrn.11.2019.01.21.07.22.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 07:22:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 15:22:15 +0000
Message-Id: <20190121152218.9592-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121152218.9592-1-peter.maydell@linaro.org>
References: <20190121152218.9592-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH v3 1/4] hw/arm/xlx-zynqmp: Realize cluster after
 putting RPUs in it
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4ZPtWF4TuhI

Currently the cluster implementation doesn't have any constraints
on the ordering of realizing the TYPE_CPU_CLUSTER and populating it
with child objects. We want to impose a constraint that realize
must happen only after all the child objects are added, so move
the realize of rpu_cluster. (The apu_cluster is already
realized after child population.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/arm/xlnx-zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index c67ac2e64ac..370b0e44a38 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -183,8 +183,6 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
                             &error_abort, NULL);
     qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
 
-    qdev_init_nofail(DEVICE(&s->rpu_cluster));
-
     for (i = 0; i < num_rpus; i++) {
         char *name;
 
@@ -212,6 +210,8 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
             return;
         }
     }
+
+    qdev_init_nofail(DEVICE(&s->rpu_cluster));
 }
 
 static void xlnx_zynqmp_init(Object *obj)
-- 
2.20.1

