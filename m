Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1814402wrt;
        Wed, 10 Oct 2018 19:23:26 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60iYfQCBVk7esVb1owayAwfKkf+Oox/Iz7+0Bp0+ZoSKFMtVkgnm3tr9H7uYpqLdxa8Cpm/
X-Received: by 2002:a0c:d927:: with SMTP id p36mr15537652qvj.181.1539224606521;
        Wed, 10 Oct 2018 19:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539224606; cv=none;
        d=google.com; s=arc-20160816;
        b=PbG9wjY9i0SE2WlU7ftzKJ9Dn3FO7HcYl4lTBotKzKH0Ob28VybrA1s3fDfjXr/MRZ
         FD6400JSsIB6TSnTmaTn7LJ7t/LuhUZsND8QMtDfIoPpCJLM5sSsYMbL2Z9r6k+Dz8mu
         QoCByOoiVMD0hu70+BK5UxEH1D5Mv4bdx8h/KLoV46xSbRO4IDACoPBizZLtIkCt76zR
         nEWVKPDU+ZWmiWauZwyd52qn8STaPc/0I8f0Vhdy1uSR1jXL3qI4WcqzTbfYHO6vo5FZ
         8P+hAqEhjiicCbvTX8aiNCBgk9wLYv6NMK1nUi29I35jrksuEJXaaNiCFFBVaDgfCq0t
         fCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=n4iHFXGonYr7tDAd30fweyW8DUKwSqMMRaT5TOdocK4=;
        b=0BS6Yuv+N8Gw1PCIdyG2B9IzvR5BfA/bHe9H/Y0ngRn/8MNLA0qJ/kohAYvo08f4A5
         CuFnolZzwn3FZflwMWByvY9ho41y0At9IvEbdfJrMn4x8dS+KdgipEh38v4Cgy1vg5C+
         Te0KkWLOR8dfrxQ8OK82QttyF2JUp8azOc2b/o7wejTqaKO+Xxf0s1+CI/3JfpwLEy9z
         /pPOSuu97Diwyu52x9hQBQ5x8iqk2awb0tdQxAX5HF6S/TofAc0Lzm/oeR8M/GP2ocWb
         F9DhQGatnsfh6TpTFvO+NzSxJOKIeZO9XHbxv/Y8/lVJfKBnM8PB/cj5eOcSbsiaQiy7
         dsCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jujuEiLp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i22si767591qvg.194.2018.10.10.19.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 19:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jujuEiLp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAQdJ-0004xj-VB
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 22:23:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZt-0002I1-QE
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 22:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZt-0004TB-04
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 22:19:53 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:46867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gAQZp-0004QD-4T; Wed, 10 Oct 2018 22:19:49 -0400
Received: by mail-lj1-x241.google.com with SMTP id x3-v6so6705921lji.13;
	Wed, 10 Oct 2018 19:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n4iHFXGonYr7tDAd30fweyW8DUKwSqMMRaT5TOdocK4=;
	b=jujuEiLpteV/Y08ZEmcBkAvqFQrW/TkmNmi9/PjME1kjB1LyQIIZOOBn/8yhYMkmPi
	aZbn46sM1xQtDAix4nobrUC+em2jBBJJYfx/gYa0VrSfb/5uehiuSs+apXkP4LX+2tkI
	80AIlr6lWuh0/mFN/Gc/qB8G9IsRoIgUIb49i6LhppHpQMmmuu9SLP8xbuoynrI/B1MS
	mc+I9Xqt7JqTdVjrs4LwSqC5h8gNgCol4Bg6aD4mhH3xziE12BrvSDCpx+jLbD5tPwOy
	o+qxk5lMlR/lvx9xOdvW2IyOIdx5ZLDScpuzKAVCGZSnin+WFQOovHtUhwUzhoSYhX/9
	zvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n4iHFXGonYr7tDAd30fweyW8DUKwSqMMRaT5TOdocK4=;
	b=ZrG2gkGHoCeGpBCq8AfMcr1Nbr8pN1ec+bfqO4Ru7ka1Eg9kDJljpAbT39BRy20Du2
	lP6TkIlXdwjXg8riANHnbDHNY0nL2ENNv/bORmHnNv1p+fxjehuxnWqCJhaKWdPBiAHW
	gGqddw1RGS3sK4gYSopetHU6Yv1jNsHVgDff82Eo2nJpAM71V2sTePQOo9yx7vIfEnxS
	Bw+0P0E5LiyTV10ekbiY1ZX92bu1NEEAzFrl+qcD4GeQPGTy5tyBwElQHWKm/IBSEt2I
	Hk/AAaF/z+MMOuJvD6n1S1fz1nY0y//3wUQ/TPxq2kmqZruKv4xSMrIWqp76NnvzR3T0
	XH4A==
X-Gm-Message-State: ABuFfoge4QnJheFHDeKiH1XXzSa0xXN0muPB+95aEVONHuhzwa7d1osk
	cQU9uQ6R1f+gK2/GoDe4iO7dgbE5Xb8=
X-Received: by 2002:a2e:591d:: with SMTP id
	n29-v6mr21784774ljb.70.1539224387657; 
	Wed, 10 Oct 2018 19:19:47 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	k18-v6sm3528997ljk.58.2018.10.10.19.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 19:19:46 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 11 Oct 2018 04:19:28 +0200
Message-Id: <20181011021931.4249-10-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: [Qemu-arm] [PATCH v2 09/12] target-arm: powerctl: Enable HVC when
 starting CPUs to EL2
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r0dbe5N8qYdK

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

When QEMU provides the equivalent of the EL3 firmware, we
need to enable HVCs in scr_el3 when turning on CPUs that
target EL2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/arm-powerctl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index ce55eeb682..2b856930fb 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -103,6 +103,16 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
     } else {
         /* Processor is not in secure mode */
         target_cpu->env.cp15.scr_el3 |= SCR_NS;
+
+        /*
+         * If QEMU is providing the equivalent of EL3 firmware, then we need
+         * to make sure a CPU targeting EL2 comes out of reset with a
+         * functional HVC insn.
+         */
+        if (arm_feature(&target_cpu->env, ARM_FEATURE_EL3)
+            && info->target_el == 2) {
+            target_cpu->env.cp15.scr_el3 |= SCR_HCE;
+        }
     }
 
     /* We check if the started CPU is now at the correct level */
-- 
2.17.1

