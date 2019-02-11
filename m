Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1946373wrq;
        Sun, 10 Feb 2019 17:15:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ4CZIaOV0kf7pfMXrljQ+QaXbZUXQGe94c5x58f4GzqOB6X75EWYXP2B+GAvNwf95/0xYg
X-Received: by 2002:adf:deca:: with SMTP id i10mr10915737wrn.312.1549847758425;
        Sun, 10 Feb 2019 17:15:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847758; cv=none;
        d=google.com; s=arc-20160816;
        b=h+FxlbXSPnzMp9aU0fmrNAvo6+aMdU4hK0DXU4WzujGn6J4CUjkkVxZrTh80ABq5Yz
         sXBA3+Jeb1To1lBBEBtV3LAyY2RGQ09H027X8r9eJbbRT7F181eWR8WRpYkkv9EmbQO6
         6WchUEMFusPIzZ0VKBpfayQa9JvN6U5YZGGN3aCcBdMa/u4OIGrZ37EAgkMvGhkJChZb
         DtmmG1Bl/YxJg3XJjzpFsPPMUWHH8E5bDLJ9ud/bHESmvQd7sD3RtcLxf/YzJl3flH6D
         TRUYamEYXJKFtsqWw5/nrFGtf6GeiqUx4FOpqnraIwuhFR4A4SKU6xWHvxog/haC+ljG
         DorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=sSJPTVVkjcWARcwigg6wJDNen7ofl5R1qSbWzhReSSs=;
        b=zZCjoAjo2dX9pOAaqQKqJmGXikySPDAA42fiaJXsex/th01DgMnpdewwE/SCHMxl0i
         EoSIvjBayHgZLydZWB+NlAKZe92/BYJyMasM9y97ccd80qIue44DGM2/ODHPYt0v0eOn
         MEYce1IW4depNfR+fqWn/9UxLFvjpE0lYKcojJMbh4AOg8HrzafU87zd4we9SLro1nDw
         7HKZbUzqz5eeogcdQ2TeU+zZo66dUef85ukaDeiqo0XUkK2B1wjruUQlMEKu1RA9NgSK
         f9bkQjas8+ZFhADDgAHGLspaQTpfrv0qoKo10HnO4T6K9Gd/8V8qpkQnCKYMi6PvHFxj
         3d+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FQDvJD7X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11si10168207wra.351.2019.02.10.17.15.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:15:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FQDvJD7X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0CT-0002qt-9P
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:15:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05l-0005iu-9Q
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05i-0008Nk-Ed
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:01 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33991)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05i-00083e-2s
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: by mail-pf1-x444.google.com with SMTP id j18so4472061pfe.1
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sSJPTVVkjcWARcwigg6wJDNen7ofl5R1qSbWzhReSSs=;
	b=FQDvJD7X8KF0GRw0sY2830x6AnmWusQUNVX7SS0DYdHC6tlba90hIx11mLgAFhMvpv
	F0RZkJ9Luj1x1E9dCqsbINcm4jN1roGKKzOfVdWCeWptIZ1KZUrbMk4K9xVpSgOjnj48
	jCJYtRM8oc9G9ojvPlVmmblaRTY9vRk0FtzDQwAhCaiNPxmOX8nochL+738utLGi4nc3
	JccCPdYA5dlBfF4Lqfl/IdOm0zM9dvDQfPhl3dWO6E3xCoR0FRLHgtI4/fjy07/Z+uwq
	Saz36uXt6PSXPhWtE7RDkwNSWNuvNLLfIBnFi1rjau/SGersaoyaKEah4osMrULkkxoz
	NcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sSJPTVVkjcWARcwigg6wJDNen7ofl5R1qSbWzhReSSs=;
	b=abhoPvIHmbhDkSRy0WDiZLlL4ZvwyFJPgtadg+IRsbXXzBIQUSu7Asmsa0x8g++4P3
	KcibxVgRydGFo1lho/p8O4nq3y0ExB2hqZ73yMiCOoyc1Pi/xrWK8wNHWm+akoctrpJB
	iZ2Grpwmig3wbxTeLkYBy/QTwuXWF1mJf1JENxCvCWBAxiog1WbQKayJgOTc6Q80MxAq
	pKnCvzzZunapDR1D4LBlnQxU2b/DWf09fFUoQdlR047XawwfEoA1CFkEfoQpK6lTdbf1
	PKkCj5epIHQo1bzcdF4WzbrGxO2b6YzbGFnS5/r1Pu+MEeJ97o1ba1yZrB/Ax6vFi+CI
	Njrw==
X-Gm-Message-State: AHQUAubJ3m+LkklXOgf0LVHFBGMsB3vQA52JkZC5q/nGDHneTOOCRvGs
	XHsA6hRB9SiU8YF7t+AwJMszavN5EHg=
X-Received: by 2002:a62:5182:: with SMTP id
	f124mr24442444pfb.238.1549847318456; 
	Sun, 10 Feb 2019 17:08:38 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:08 -0800
Message-Id: <20190211010829.29869-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v2 05/26] target/arm: Extract TCMA with
 ARMVAParameters
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a50O/ecrYqfr

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 1 +
 target/arm/helper.c    | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6c018e773c..2922324f63 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -959,6 +959,7 @@ typedef struct ARMVAParameters {
     bool tbid       : 1;
     bool epd        : 1;
     bool hpd        : 1;
+    bool tcma       : 1;
     bool using16k   : 1;
     bool using64k   : 1;
 } ARMVAParameters;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e73bdbf041..cbe3500f78 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10447,7 +10447,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     uint32_t el = regime_el(env, mmu_idx);
-    bool tbi, tbid, epd, hpd, using16k, using64k;
+    bool tbi, tbid, epd, hpd, tcma, using16k, using64k;
     int select, tsz;
 
     /*
@@ -10462,11 +10462,12 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         using16k = extract32(tcr, 15, 1);
         if (mmu_idx == ARMMMUIdx_S2NS) {
             /* VTCR_EL2 */
-            tbi = tbid = hpd = false;
+            tbi = tbid = hpd = tcma = false;
         } else {
             tbi = extract32(tcr, 20, 1);
             hpd = extract32(tcr, 24, 1);
             tbid = extract32(tcr, 29, 1);
+            tcma = extract32(tcr, 30, 1);
         }
         epd = false;
     } else if (!select) {
@@ -10477,6 +10478,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         tbi = extract64(tcr, 37, 1);
         hpd = extract64(tcr, 41, 1);
         tbid = extract64(tcr, 51, 1);
+        tcma = extract64(tcr, 57, 1);
     } else {
         int tg = extract32(tcr, 30, 2);
         using16k = tg == 1;
@@ -10486,6 +10488,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         tbi = extract64(tcr, 38, 1);
         hpd = extract64(tcr, 42, 1);
         tbid = extract64(tcr, 52, 1);
+        tcma = extract64(tcr, 58, 1);
     }
     tsz = MIN(tsz, 39);  /* TODO: ARMv8.4-TTST */
     tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
@@ -10497,6 +10500,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         .tbid = tbid,
         .epd = epd,
         .hpd = hpd,
+        .tcma = tcma,
         .using16k = using16k,
         .using64k = using64k,
     };
-- 
2.17.2

