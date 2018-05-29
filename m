Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3529730wre;
        Tue, 29 May 2018 05:49:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLvKS532FCDKhFW0+GTy6ZGa+U3iZRD//PQuVRCF7uSkz0cV9iy1gUmCIkAbf35qE5mK2ZY
X-Received: by 2002:a37:1807:: with SMTP id j7-v6mr15506432qkh.333.1527598197614;
        Tue, 29 May 2018 05:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527598197; cv=none;
        d=google.com; s=arc-20160816;
        b=P7ms1V/P/urd0e1VAzTCGQaJdaGmMql8WFG94Wb/riiCWNDTNxrWrhAwZgBNJufUij
         tKLAYTWoWN61lRKyZKb8q3oqwRyDEfM58/ZHlCup3GvKuiYCfaGTbwadZzIr/CBqRdLi
         loB4zlJkGBpyDDf/eLKpZVJmA4PpqgT5Q0/5WbHvr0ca1q+jdpNhDhT5KQpO6D8gmfO7
         pcfy/nvhw1s0uZ7D6JOcz5nVafOXX9O5fNAFjvoiz3YFfsAJTopCsDzEdhArageBTQRL
         RkgJe8PFwxGK1+62+MJXimxJWLZxWWzYLENKZCwleDDqPzCvEzj9IJv1hGerC2EC96Pq
         zv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TIghMYqpDfUxIsSw1bPBVN5u0F5IFAW3zWLhXkfv4pQ=;
        b=OHBjdNQuQcp3sWWDhEhyFx45Konp+aEVBa6lp7WYiCBmgDAet78nIYRK9Av9fu4Eer
         9d/xUMGkZSzA6R7WZmwOpScP8UBDsddzWZnZjSh3fGHI7ZRYwR/0LqeoUOnn4P5GF+Tm
         scCWzJ8bsjcQ030kcW+2QMzL+qeeylR3qcwXT4E5PUlrpPS/8c+fmikaaH6rZrdVsRGi
         ck8amr3xMHOr/3OUgVOHaYsGSIdhPfboE4i1UFXgA37jN0q6ZCr0rZXlGNYb/WGgnXlU
         bTONm0BzCZ+HmySLhxMTN6oowr1dusSWW6ls9l5Y6U76eOvhZNdTyqM5jznK9jM6n/3L
         pJaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oJLw+694;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o21-v6si5338058qtm.123.2018.05.29.05.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 05:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oJLw+694;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNe4b-0006SW-2P
	for alex.bennee@linaro.org; Tue, 29 May 2018 08:49:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fNe1z-0005GT-1D
	for qemu-devel@nongnu.org; Tue, 29 May 2018 08:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fNe1y-0007Q9-6D
	for qemu-devel@nongnu.org; Tue, 29 May 2018 08:47:15 -0400
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:35792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1fNe1x-0007PW-Vw; Tue, 29 May 2018 08:47:14 -0400
Received: by mail-wr0-x22f.google.com with SMTP id i14-v6so25280794wre.2;
	Tue, 29 May 2018 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TIghMYqpDfUxIsSw1bPBVN5u0F5IFAW3zWLhXkfv4pQ=;
	b=oJLw+694oTncvtEeKpbL7YBhzamrJJgn6grJN1PW486dk0PVu//shLd1hjYnVKwXws
	yF07QzV1hojmetI2YMSuf7j0e4iorvywxQf8+5tljPQRRjrA8CKwLEJYNvPS7DrVpDbP
	Nf05UacucE1HCR5zf5e7LsCgDqp7HfXxE3NYLxIrgzMTzulNehIwaAAEH6soTZwtVz4D
	NChdtoVBxHzzc9nkWQbQ7cmYNt/03FfUW44sikow91IImMuQZZN7GtLgAm3H2P8eqryT
	/97Rc+utY3PRoLdM67lZwwHqmlSfVzER5/mA10kwPsElYxajCHjvDkF9BHha7u9VCbcV
	jyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TIghMYqpDfUxIsSw1bPBVN5u0F5IFAW3zWLhXkfv4pQ=;
	b=qoKlDJdlHoGziCZahXtDHwUjtTsSjGsGoLBpC+0MMkUoUFJMAz5gaoQoLlUGTylurz
	Cswt87kysPJB7tWnkpUpKnEUiv/ynC+8zLS1T2Vs05dtM4CNvtn5OmwqI1jxyFvsTiht
	KTosaFFJK8Ot68x+pIYwazyNneDwwjiirBAqkIBDiF+CjOuKHC+wm1lKKQLRQikYcxoO
	k/8Qhal/RE4BBEDYZ2RM+J9UgUaRvOKQRrt6DqsPwDhYunXCSxBs+2O5+MHV8F3fT46x
	lRICCFBc4T7RHg6oMjqCOoAmSDI2G33p5l7ILQ2iE555uSxktgYdTqlcCLkfIMxlLsoM
	VXXA==
X-Gm-Message-State: ALKqPwfLNL0QmARSSAQS6R4i2oqiu401STml4FV6Dm7s+fPeGbhNfBVX
	bxLVzt8t1+RhcWPUuYlNHKsSIg==
X-Received: by 2002:a19:2885:: with SMTP id
	o127-v6mr9299436lfo.28.1527598032591; 
	Tue, 29 May 2018 05:47:12 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	w17-v6sm2644895lfe.73.2018.05.29.05.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 May 2018 05:47:11 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 29 May 2018 14:47:07 +0200
Message-Id: <20180529124707.3025-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180529124707.3025-1-edgar.iglesias@gmail.com>
References: <20180529124707.3025-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: [Qemu-devel] [PATCH v2 2/2] xlnx-zynqmp: Swap Cortex-R5 for
 Cortex-R5F
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, f4bug@amsat.org,
	frederic.konrad@adacore.com, qemu-arm@nongnu.org, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iNuKlvY1ViKH

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The ZynqMP has Cortex-R5Fs with the optional FPU enabled.

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zcu102.c | 2 +-
 hw/arm/xlnx-zynqmp.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index b126cf148b..51906a743f 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -266,7 +266,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5s based on " \
+    mc->desc = "Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5Fs based on " \
                "the value of smp";
     mc->init = xlnx_zcu102_init;
     mc->block_default_type = IF_IDE;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 2045b9d71e..29df35fb75 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -134,7 +134,7 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
         char *name;
 
         object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
-                          "cortex-r5-" TYPE_ARM_CPU);
+                          "cortex-r5f-" TYPE_ARM_CPU);
         object_property_add_child(OBJECT(s), "rpu-cpu[*]",
                                   OBJECT(&s->rpu_cpu[i]), &error_abort);
 
-- 
2.14.1

