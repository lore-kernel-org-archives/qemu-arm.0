Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6439908wrt;
        Wed, 3 Oct 2018 08:16:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62cz4FekON1LNYKb7EI9q/FWXKLJ7qnFWlOMsYUqI2Mn8HyFXJZYoZqtDwrOkWuKfsY/YoH
X-Received: by 2002:ac8:699a:: with SMTP id o26-v6mr1666539qtq.244.1538579768287;
        Wed, 03 Oct 2018 08:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579768; cv=none;
        d=google.com; s=arc-20160816;
        b=0FZAxYJoBlSq68SuNKLnOyZM2nDXEYWWP1/PlVc/Fpb7B+atfW75/rUkmuVmeLGNMM
         rKYV9D520yN9BWKDNO15VgDu3kpvixNTnZkrXqKck6o22seRt9pQ641tx6NcRiVyv0Uy
         VKdQbTS+KI5I7r4m+zfuYoO/co5VwE42xky5JMFEiXAUqYyiRTjrDYRfCTuvAN+youJ9
         Eh0+sZ7aZAbzzrai+cIqK3BaRZ92X7O7mdX+bNlNzOZSxxK3zCJrJaRH22Vtfb7NQ3Gm
         2ZJrQd4vb26WJ6nLYqipbmrYrLNN/OibVhdBU3VUIanKAJf5e4/nGVS8vGv8Ti8BJjWr
         jSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=9Ay3M6y+W3ArY+Q25A5a/bdjSssGSlE2NegpVjfAXco=;
        b=lwSSSAx/WngqS9KQkQLWLPhXWcuQb+sIqV2/3gQhSCe3Pbj++mgqhGq4/GlPvFMDF4
         DSVXuYF3aHvuFdAWrGAfGoHLMkoEnCqYEAoZ4eRF1Nqdq3uRigqWVVQD8WvRmSsjTsfQ
         bldt6DBFPntgtBAL/9/Xc3ifL0JTpvNOhgg6K+6IWXvYAfDKcEbG/Uqure1Lg4JRr8UE
         lluyelC5hYTZRguus8nrB0bEJp/qU6Ojm52vNbOc5VJBkgIRcy+OlqnRJX0LcQhdi147
         38DtUiJe6Lhz52rBvQ/pb5Pac4S3TWukHlIPO5xqLJvKHF12FnwFGOIm3tQowjsHDVtQ
         tq9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZhV3lT0D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n3-v6si1010255qvi.279.2018.10.03.08.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:16:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZhV3lT0D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7ish-0003id-I9
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:16:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7iqC-0002A4-29
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 11:13:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7iq9-0006UC-4V
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 11:13:32 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46148)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7iq8-0006TT-U2; Wed, 03 Oct 2018 11:13:29 -0400
Received: by mail-pg1-x544.google.com with SMTP id a5-v6so1693023pgv.13;
	Wed, 03 Oct 2018 08:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Ay3M6y+W3ArY+Q25A5a/bdjSssGSlE2NegpVjfAXco=;
	b=ZhV3lT0DoIRREMxrlgiqx+ThzbpVhLiiP5xO5V5lPhgYIADZ2hrOu9dsCUWf2yEIqY
	/nEIcomqj3Ft1X2k5S3OGXb7VPSPIFGuAy4oW2JiHhHzxVspK93xDOCe5J9TApEYd20i
	vv67Jvpytvz7MDKT5Ai3aKI8oEgeFg98XdCkwn4yoKFQBuX9rZOk6TaPYFz21SRXTCX8
	/znzlFDfobqpmBkQpBtKC04duyXwG7H4kPxkjYKsYQAhAzKjWhk6+GiibKfSJ/9tbIpm
	QVJNyZCkdjUMowgMd3i6nXf2NARJ91i+5MoBQ2WMSdGHuGTg2NuTNNZKiD8WkmEaVnkj
	8hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9Ay3M6y+W3ArY+Q25A5a/bdjSssGSlE2NegpVjfAXco=;
	b=W9XTocd39ctlnrsNwThAuZ/lXEzRggQSdqTCuJp8MtWwB2ciiKfzaD2eHtkdqRQBQr
	eZVahGFNeceqD5Z1VcIq+DR1mBKGLk0eYo4OOW0oczVR3k0oZblxO2x9bjME5ctw2pzN
	V+3FpAjWVcmm4SdVtkB8jZ6kIZUdFKN+vpfU6BWIQerUKmXrM7DRkYx+gSWL7JiwH89m
	/Y0Y32E4YRMER+XnCIhfuGVeTP3BgQAN9MM5YQ10L0gbB3BUwDlq9kgEJ75gsgOuEg0E
	i6NiNiqVw7P1vEGSBSTYZKS2/plvVQotc5gI1tJo6DyDPooV1e1GcMC5YylIHDTdvItw
	h9oQ==
X-Gm-Message-State: ABuFfogLjhyZlrVNYsFrqo7YW0rLtIxz3dQxcvaZ8xRh95VGdpBU8l2q
	Lrn2To1dtEB+s/RpkB5RWYZetm+gZLA=
X-Received: by 2002:a63:7f0e:: with SMTP id
	a14-v6mr1788747pgd.296.1538579606798; 
	Wed, 03 Oct 2018 08:13:26 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	t26-v6sm3140106pfa.158.2018.10.03.08.13.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:13:25 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:43 +0700
Message-Id: <1538579266-8389-10-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v1 09/12] target-arm: powerctl: Enable HVC when
 starting CPUs to EL2
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
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8F4zgJ4Z6YZG

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

When QEMU provides the equivalent of the EL3 firmware, we
need to enable HVCs in scr_el3 when turning on CPUs that
target EL2.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/arm-powerctl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index ce55eeb..54f2974 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -63,6 +63,7 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
     struct CpuOnInfo *info = (struct CpuOnInfo *) data.host_ptr;
 
     /* Initialize the cpu we are turning on */
+    qemu_log("CPU%d reset\n", target_cpu_state->cpu_index);
     cpu_reset(target_cpu_state);
     target_cpu_state->halted = 0;
 
@@ -103,6 +104,16 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
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
2.7.4

