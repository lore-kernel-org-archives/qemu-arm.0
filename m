Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1812524wrt;
        Wed, 10 Oct 2018 19:22:11 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62kyAVMHnkRvvsfbwZxcLec4bDmRifx/6gk/ctPPaNv8K8MGYPBz4LhIx4vezHZ5AkP2jU6
X-Received: by 2002:ae9:e20b:: with SMTP id c11-v6mr27752612qkc.220.1539224531638;
        Wed, 10 Oct 2018 19:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539224531; cv=none;
        d=google.com; s=arc-20160816;
        b=z0Ar3ZACffVv91q0XAF/k4Ja/A03Cj5cL5bpYf2S3lOkIaRwP9S5PQfiMfhEJ+lImj
         l/thljdkAqdgzgw0naQodEMdO+Nz+9HAm+wjBXoFXt8E2ul7MgZsbsexlJduEucLLwZs
         Tl3cYD9anMEwkNHyMk7UPIiSnjStThljbqdtdQYcGFAWbB0G9dQNwy7UqENAn9P5KrRh
         2k6yPWQPr8/vLbZClVMSL6vnH13Puz/nomBz9T8ihfMluav5eiRzg+o5uj2rWmpir3DY
         0T0CNYYaiHEI8d+gECf2PteT8Muex63ERi1mF91QdmqYTVKicLfjZ7/8y5FMIwMRbHzT
         KMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ti7TL4IxauhAqRj8KMgQEq8jrpTeutSx9z7GwMv0z/Q=;
        b=0RWOhD+FnRykyrzQwHkvbERVi/YwTz+38tjtur9L9zViqqstC+p0wXBbDq7sdAmdk5
         xKIhXcraiKd+oRils9Q++/34BDwngKi57rHBVAGIN5g/TH3I9nrYqlz5u7FbP9QIInHI
         R+j8I8QFk3EJjcC+xiGuvGPdILuPRVfpAzgL7dq2L29wcgBBkeYnJ+zzdeuiIFHl4UJ+
         apumH7psRtsjFkvpZ4MH4kWaOr8oCS6iAKJPXBQe28qBIOsId5Jtk8SP1JDSMEg4k9Sf
         XR0sJ0rCRW1ExrnIXcA2KatTS4AKO5bDDw62o1GJQ2ufF0ZIigfv7XcF9ZBMgP81XQsb
         CaYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VJN0Oom5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e2-v6si2358667qtf.249.2018.10.10.19.22.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 19:22:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VJN0Oom5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAQc7-0003Rz-2w
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 22:22:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZg-00028l-4m
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 22:19:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZc-0004JQ-38
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 22:19:40 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:40793)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gAQZb-0004Ic-Qp; Wed, 10 Oct 2018 22:19:35 -0400
Received: by mail-lf1-x129.google.com with SMTP id t22-v6so5482955lfb.7;
	Wed, 10 Oct 2018 19:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ti7TL4IxauhAqRj8KMgQEq8jrpTeutSx9z7GwMv0z/Q=;
	b=VJN0Oom5qY6iaUChyNpwddqiP3/Z7cImMP9y0rHvMCcmCHblHgl0qSWQm+RLCRpKGi
	QmMjV3JKdPRXBA3rLBjuwv9MmcBqgEMHAGMVuWBAEt1DgVbs00j8q0zBCUTWcTegPQz1
	vmJ8pGL15m/zSR5bM8T2kGbJL2SgELw8lPMQ0aSNwRHC3iYDVohAuPLEWk556g7JN5Hp
	AJP7jDj6Pp1KJz+i/q68o3D7CuUGEudR7zuigoUs897KTJ/nWBmc/ikb1bLT8wiDrsTR
	bl0x4zBwgza0ObuOtsObIHRoPOEk36U7hDaqDa2EjsoqvAL38zee9QvOrgy50tMAHwpc
	77xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ti7TL4IxauhAqRj8KMgQEq8jrpTeutSx9z7GwMv0z/Q=;
	b=nZfwwaHYh0Rthk64ERP50iYP7Nw0VPmFfLKgta8Kj+9EOW/JAa/U/UTtbFKH/h2/A/
	IgmSaUEow17H9l/HPVerz7KRlACmjCPOo009fHQcDD/pTXVRFPvoHRQnCk7OOPLCkxwR
	8vUMFV2R/RnZAlJHWOf5q/OJ2GDmwtYeLCtPiCSdzSntqPRM2xWTXc1cuqZHGdPpJCDe
	zmGa037aKh1ydS4A/bKOR6kuDYreBos1DgaKJwOiQ0aOSoZrOM+y1+FLxBJeE7UUMTRj
	k6xVsS2Bq95vJZRb7FHIFREWjzCHTmcfjGqi/Ql7tnjgu5q7g7s/des6XHcujPNrZQva
	sTFg==
X-Gm-Message-State: ABuFfogzZ/eM6Kmb+r9tY1tX8YOjKFjFh2BEUBlYt556QG2LTq7LEslV
	ipzoCsKUUrfKTbwZ+p87ka7aH/p0XqI=
X-Received: by 2002:a19:d988:: with SMTP id
	s8-v6mr19636016lfi.122.1539224374338; 
	Wed, 10 Oct 2018 19:19:34 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	f128-v6sm5335198lff.40.2018.10.10.19.19.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 19:19:33 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 11 Oct 2018 04:19:20 +0200
Message-Id: <20181011021931.4249-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::129
Subject: [Qemu-devel] [PATCH v2 01/12] net: cadence_gem: Disable TSU feature
 bit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ETTuEk3pmOlR

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Disable the Timestamping Unit feature bit since QEMU does not
yet support it. This allows guest SW to correctly probe for
its existance.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 0fa4b0dc44..e560b7a142 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1228,7 +1228,7 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_MODID] = s->revision;
     s->regs[GEM_DESCONF] = 0x02500111;
     s->regs[GEM_DESCONF2] = 0x2ab13fff;
-    s->regs[GEM_DESCONF5] = 0x002f2145;
+    s->regs[GEM_DESCONF5] = 0x002f2045;
     s->regs[GEM_DESCONF6] = 0x00000200;
 
     /* Set MAC address */
-- 
2.17.1

