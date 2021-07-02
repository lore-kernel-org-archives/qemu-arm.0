Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1792177lfi;
        Fri, 2 Jul 2021 16:37:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5sAeGmeVQ6Gx51cR2YytfrluSSWk3utvuaSyuWt64Cw5DEs7BQ0oEyQ8Bgtw8+pSWoBsl
X-Received: by 2002:a92:da52:: with SMTP id p18mr1577327ilq.7.1625269042995;
        Fri, 02 Jul 2021 16:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625269042; cv=none;
        d=google.com; s=arc-20160816;
        b=e8RALDF81aCe7rVI5kgNtlLHbPv8Ov6zYlSLxVHYITQ2O+dUYPiG2cPF8D/tYAFqar
         KsEFuX0rZ8l994fxaTMQmOsXC7A89FuzOlvq4ZtDEBfC4xyP6b+BQTa05F6D1fqOfc6o
         te2IjfBn01LDCgegJh4ae/tS4Wmxab8EuH1TBIb+VolCttBHkcb4iCWkfQti05TkWGRh
         7La4rBV/pqKWKi+n9LGmP/LlTrcF1D+0/h3QC3t+eT3Uv0rfSP8FmegaRshctAQVqR5V
         C9DeadXdx/NTFeqYEQD9cz9izcOfoCrV4qxb4wG3RsgAaRTcYXiQo20WNLQ1BzZxEyia
         7pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=F/pAjrYCIdI1q9ubV+dr+puSbLBigZEoEUIGAS7nSVs=;
        b=T82tfPPiQ6fQkaZPEavpYhJHMYTa/gD25hU4BDptJdX/QaixRmB9etQDgMbejBYXSW
         oQlQ5IyxQoO/B417zp3DhoxrqrScdIpn4pwQfhSKuTAfV5y128ge5iyiErc3neNaL4Xv
         skACNgKnWxZjtQ4XGO4XFMBE6xKRFuesiT0AxSdp3f0a8k+PtozkpUSDjOzxu9jhxiwP
         7joiFru6CGeYIGXLVo4j07WwfHMY9cBJNdJq1O3RPuil4xgte/Gxk3aHdOLE9S/fWs9/
         ht5XbMfcmatdvZEyz/XwiNeyqCASCiv8+1i968rP2RdSr24uQpi/bKxoPnuesI6xXs63
         jAKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=ewKbrSrP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si4269424ilr.154.2021.07.02.16.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 16:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=ewKbrSrP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzSio-0002jD-9g
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 19:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3IaPfYAgKCPIlcWUleifaiiafY.WigkYgo-Ulghihaho.ila@flex--ricarkol.bounces.google.com>)
 id 1lzSif-0002iw-Uu
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 19:37:14 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:50922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3IaPfYAgKCPIlcWUleifaiiafY.WigkYgo-Ulghihaho.ila@flex--ricarkol.bounces.google.com>)
 id 1lzSie-0002bw-9V
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 19:37:13 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 a2-20020a05620a0662b02903ad3598ec02so7814383qkh.17
 for <qemu-arm@nongnu.org>; Fri, 02 Jul 2021 16:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=F/pAjrYCIdI1q9ubV+dr+puSbLBigZEoEUIGAS7nSVs=;
 b=ewKbrSrPwkwrIrtAVWUMoGgt/h6T0FJMzRjB3VQbfJtYlKKs2HKGbfNzKlKzIG9Zz2
 dD8PpW0aYb3T3piW+BKwncCww653lHjnDC3IWCC5mQZQoM/XD7TLnOnPgbsmF/HmGUfq
 2ydYHL0bfQH5foyKaoM+NIaV4HcM97zTPgFZ0wLVw0oyijX1hkUAF7ZG8LJcT14TeGRW
 5Y5sABh45Ky5gokL3Iuka4mCNg/JRE6zdzplyxFYi7MUDE40YSOyMA/YSzUm6TYyrXyc
 1yAlCMJ8p7lO50Sgs5xdGVUlzCyzxpQhawjofK40Y+g84WuIaS5122M1b1jKStkue2oU
 O18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=F/pAjrYCIdI1q9ubV+dr+puSbLBigZEoEUIGAS7nSVs=;
 b=VrqOE/AMTWlxXzyuqCXMNjf+Jh9otgUdM5PmoVfHcaVAt8E8U3ksh+sd9q1NqP3oej
 /d4Ut0Yh6DJWKcoD5RQG5zj/wvgFR3uXilQwL15+j/NYZg4g5wRcPlzZv0rAOM2lpkJn
 4Ps2Mbs7XeIIWGLv/MMPMvM2Zlyt1M2V9G8dZU/IFFmdj+i8VzhhzcL7zMbPb8PJ10iT
 //6FciWVsorqxRV/NfX2jqgnAd3ZvF7WRYvVLygp5rOysXTh8G1lsVd73LT3aIbYGzzw
 5zOzmfDYtgce5drZ+POP5qmHFCL78xTEonlZpGUu07fdmErmByklgwZZfw3PGzPJ6D+P
 PaeA==
X-Gm-Message-State: AOAM531Vtpd/o2aT3p+zxgTzmpqo77Hepqn0Ik3vKtiF4TwGmLp5ypLU
 YI7hFhST1GLo8iJasX6cXq6de0esQxb0hg==
X-Received: from ricarkol2.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:62fe])
 (user=ricarkol job=sendgmr) by 2002:a05:6214:c8c:: with SMTP id
 r12mr2191790qvr.16.1625269025943; Fri, 02 Jul 2021 16:37:05 -0700 (PDT)
Date: Fri,  2 Jul 2021 16:37:01 -0700
Message-Id: <20210702233701.3369-1-ricarkol@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH] hw/intc/arm_gicv3_cpuif: Fix virtual irq number check in
 icv_[dir|eoir]_write
From: Ricardo Koller <ricarkol@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Ricardo Koller <ricarkol@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3IaPfYAgKCPIlcWUleifaiiafY.WigkYgo-Ulghihaho.ila@flex--ricarkol.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -96
X-Spam_score: -9.7
X-Spam_bar: ---------
X-Spam_report: (-9.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.118,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s3OIj50rSRfi

icv_eoir_write() and icv_dir_write() ignore invalid virtual IRQ numbers
(like LPIs).  The issue is that these functions check against the number
of implemented IRQs (QEMU's default is num_irq=288) which can be lower
than the maximum virtual IRQ number (1020 - 1).  The consequence is that
if a hypervisor creates an LR for an IRQ between 288 and 1020, then the
guest is unable to deactivate the resulting IRQ. Note that other
functions that deal with large IRQ numbers, like icv_iar_read, check
against 1020 and not against num_irq.

Fix the checks by using GICV3_MAXIRQ (1020) instead of the number of
implemented IRQs.

Signed-off-by: Ricardo Koller <ricarkol@google.com>
---
 hw/intc/arm_gicv3_cpuif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 3e0641aff9..a032d505f5 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1227,7 +1227,7 @@ static void icv_dir_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     trace_gicv3_icv_dir_write(gicv3_redist_affid(cs), value);
 
-    if (irq >= cs->gic->num_irq) {
+    if (irq >= GICV3_MAXIRQ) {
         /* Also catches special interrupt numbers and LPIs */
         return;
     }
@@ -1262,7 +1262,7 @@ static void icv_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_icv_eoir_write(ri->crm == 8 ? 0 : 1,
                                gicv3_redist_affid(cs), value);
 
-    if (irq >= cs->gic->num_irq) {
+    if (irq >= GICV3_MAXIRQ) {
         /* Also catches special interrupt numbers and LPIs */
         return;
     }
-- 
2.32.0.93.g670b81a890-goog

