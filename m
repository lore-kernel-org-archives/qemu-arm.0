Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3964450wrt;
        Mon, 10 Dec 2018 11:16:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UWjAUrHwu95RPHwGPfkbIfs8ssAruxgUYedQfWRgkZ0qED46tpVaklxBWQMjeFZhKObSRa
X-Received: by 2002:a0c:f584:: with SMTP id k4mr12874286qvm.22.1544469360450;
        Mon, 10 Dec 2018 11:16:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544469360; cv=none;
        d=google.com; s=arc-20160816;
        b=VbrN4kh5sC5dKUU4m1J6j6Oc9GqtntoxF+aq3FMF49oBrX6biWMxYH7I9llTx4E4XC
         o2PxBgwkGvuMxgUMMqejqKVxSy9C5KZY4JBr61IYt5pGIGx1OwPDMiR1mbr1hbrs/Nqn
         8yGa4P557AlCfkSZYUqWD8Eh1mYvJ6uqdVfxELAK7wTu3os7tPWsmMhCHv2Math/Rwy9
         Jn3Yt0f1+XykXXjORz6Sh20SG5e7RV7IXhjsJI9yN5Rj443MoCB7KYPAdfQtqCo/9cL1
         CXWpbqh264B76eJMAUN2eoZRZLo1XfkUJFMKhfF8Cw/XvynVFDpYONxqTRuWy2b0tlsL
         SMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :to:mime-version:message-id:date:dkim-signature;
        bh=lp/KENKFFCC/rqnoR8Xaly4s8R3sc0KgvNOEMya9J8c=;
        b=tcNyc4qNqoCtgIRM7omCIwKJ5tqRBpuPCZbLWJtJEH2KocPzaBOO9QFRpZF6p/Aqar
         LTk+814y12/JusjYZ0sf2JMYC02BnBnNezZkKWBAEmjWLjbwhLGlSLztBCW7kKZW2lhC
         5Qi4jfKU84GKz1TgCXNmrz+pXaiVXZFq7oH05MoguWMTjzrn4z+j0fG/2fbe9F8X0uqX
         czI6uvKAUOY7udr7krK7eUXkDCm6I/DOv64su1rn3jMHo1yGn2wB7iEHdKB1b0bToMv4
         zgOtJ1pIe3t+tMCLH7Hooo//uUafviftNAk69NfAzUydh+o9RIniJEoEXfRxtOWSPevy
         Of3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=E6fpyJG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 1si7103838qvo.44.2018.12.10.11.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 11:16:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=E6fpyJG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWR27-0001Ra-VT
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 14:16:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37321)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from
	<3uLIOXAcKCD8rxboepshpphmf.dpnrfnv-bsnopohov.psh@flex--qwandor.bounces.google.com>)
	id 1gWQcP-0002cn-Bm
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 13:49:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from
	<3uLIOXAcKCD8rxboepshpphmf.dpnrfnv-bsnopohov.psh@flex--qwandor.bounces.google.com>)
	id 1gWQSF-0002Tj-FZ
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 13:38:57 -0500
Received: from mail-yw1-xc4a.google.com ([2607:f8b0:4864:20::c4a]:33895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from
	<3uLIOXAcKCD8rxboepshpphmf.dpnrfnv-bsnopohov.psh@flex--qwandor.bounces.google.com>)
	id 1gWQSD-0002Rf-P1
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 13:38:54 -0500
Received: by mail-yw1-xc4a.google.com with SMTP id v7so7277903ywv.1
	for <qemu-arm@nongnu.org>; Mon, 10 Dec 2018 10:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=lp/KENKFFCC/rqnoR8Xaly4s8R3sc0KgvNOEMya9J8c=;
	b=E6fpyJG1eje67eJQxisqk3avld5gNDEGTIG9EvYIVL+teo9TYaaHBVip+hVpBUliwn
	VHobyiWwV9UMfZuLzjAnUiZV8Je2RMdzURU/QF1/iovYcfeWi+cO0a9asrkyiNcvpUld
	kYqKb7QTSHoGK9OMsQQdnx+ykL41GqQ3XEZXFqfpBnuO0Cg4SIo39Gh7phPSMbK+N8tc
	SesgykbEPfxcy9hINrBg409sm5AB8wbiWZRjGVxrT8+AK700Hfr4sbzw0e5hxrTdRG4S
	i7LMiD3pZS41S9n0SpXlgLD/YATyM1orVF/I+O1LnBjjfKQJ1/r2hLMy6BsB1LtI/NKy
	S+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=lp/KENKFFCC/rqnoR8Xaly4s8R3sc0KgvNOEMya9J8c=;
	b=lQKoT+E8Q3j0wTixO4fcJN0iw0YCS5QE0iqR7Mk7M9o58CqoXXyhNg7JVD/GI/P80H
	pwjm2D0E1euK/+Bl3nr8buf0BfEPIhuR/tpPx3cHmWAY0e8c3EhZY2Lgn7xVU1huxPm5
	yRupHD3SeQfphpupzUzINBASQUA8sUdxNg5jCFntUS5JOwEUpz5DHVmH1ejmRxNBwy2X
	8+on4LChp3jyvW4e6eqPr9/hmyMxZASV7UOWhN6A4l4mbeSWjSPCOTZxDxNNBLEprcPJ
	HOKGvdz0Z+CQFD8/KlzsvRQwjJj1qQPa8w9rIdf0Mj41lW8YTyG1Q82e4W7XLhKRUDaQ
	vY2g==
X-Gm-Message-State: AA+aEWY0vdtXT3H9MFv76Al+r19XjHBYBtKtPyzhu3ik6SC5ioQP+5Ic
	9QuZBzJ5oe6p9UBEzLSKdGLjYBAPgZWggG+2d2wIq030/gTcZSnXjZajznoKEXkMyD/3/uZzYoe
	qpMsH4kz1wS0VCRQfWMBIXwumJ9yIomrDYsDcrose744Oa1oad2CWscIi539x
X-Received: by 2002:a81:4901:: with SMTP id w1mr8100323ywa.4.1544467128266;
	Mon, 10 Dec 2018 10:38:48 -0800 (PST)
Date: Mon, 10 Dec 2018 18:38:36 +0000
Message-Id: <20181210183836.20074-1-qwandor@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.0.rc2.403.gdbc3b29805-goog
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c4a
X-Mailman-Approved-At: Mon, 10 Dec 2018 14:15:46 -0500
Subject: [Qemu-arm] [PATCH] target/arm: Implement VI/VF bits
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
From: Andrew Walbran via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Walbran <qwandor@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Wedson Almeida Filho <wedsonaf@google.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Andrew Walbran <qwandor@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 70UfgW0OQPBb

From: Wedson Almeida Filho <wedsonaf@google.com>

This lets hypervisors running at EL2 inject virtual interrupts into guest VMs.

Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Andrew Walbran <qwandor@google.com>
---
 target/arm/op_helper.c | 41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 0d6e89e474..abd29b22c1 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -1098,9 +1098,44 @@ void HELPER(exception_return)(CPUARMState *env)
         goto illegal_return;
     }
 
-    if (new_el == 1 && (env->cp15.hcr_el2 & HCR_TGE)
-        && !arm_is_secure_below_el3(env)) {
-        goto illegal_return;
+    if (new_el == 1) {
+        uint64_t hcr = env->cp15.hcr_el2;
+        bool is_secure = arm_is_secure_below_el3(env);
+        bool irq = false, fiq = false;
+        CPUState *cpu = CPU(arm_env_get_cpu(env));
+
+        if ((hcr & HCR_TGE) && !is_secure) {
+            goto illegal_return;
+        }
+
+        /* The VI and VF fields of HCR_EL2 include the following note: In an
+         * implementation that includes EL3, when the value of SCR_EL3.NS
+         * is 0 the PE behaves as if this field is 0 for all purposes other
+         * than a direct read or write access of HCR_EL2.
+         *
+         * So we only check them if not in secure mode. Additionally, both also
+         * have the following note: The virtual IRQ/FIQ is enabled only when
+         * the value of HCR_EL2.{TGE, IMO/FMO} is {0, 1}.
+         */
+        if (!is_secure) {
+            if ((hcr & (HCR_VI | HCR_TGE | HCR_IMO)) == (HCR_VI | HCR_IMO))
+                irq = true;
+
+            if ((hcr & (HCR_VF | HCR_TGE | HCR_FMO)) == (HCR_VF | HCR_FMO))
+                fiq = true;
+        }
+
+        qemu_mutex_lock_iothread();
+        if (irq)
+            cpu_interrupt(cpu, CPU_INTERRUPT_VIRQ);
+        else
+            cpu_reset_interrupt(cpu, CPU_INTERRUPT_VIRQ);
+
+        if (fiq)
+            cpu_interrupt(cpu, CPU_INTERRUPT_VFIQ);
+        else
+            cpu_reset_interrupt(cpu, CPU_INTERRUPT_VFIQ);
+        qemu_mutex_unlock_iothread();
     }
 
     qemu_mutex_lock_iothread();
-- 
2.20.0.rc2.403.gdbc3b29805-goog

