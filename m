Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4976701lfg;
        Thu, 27 Feb 2020 14:02:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpxP9AP7m1p2cjqtzvgXBgwIKHQhuloU8AdsSNbKRUYQMwIPyjs7FwMk2hpnaK0MbakmKs
X-Received: by 2002:ac8:4e4a:: with SMTP id e10mr1478622qtw.385.1582840955275;
        Thu, 27 Feb 2020 14:02:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582840955; cv=none;
        d=google.com; s=arc-20160816;
        b=VHlRLcq1wPWzCDejdKpdFFgwvfjPyPVy66n+yMhiTW/JER4fKsRpSWlF7oWHgsU3mU
         XwOvTG0xuvHEFYIJmdsCvTmUDKoPTYzJXjiYH3k+5kLIes8NQBuLNTK0FKOJfGYGTLo7
         l5NZqzeH20erAmwSD0QpvAVZDrPvuDrjBy8mIFTWNkwFDyUmYaGh/LTEiJ9R/qSTU2+A
         lL931MTCrexXMpSryP0/cBG46GCaRPUkht+Q7Di5AHgblHfi0DicuA4ASg5GSXU69Dq5
         o9dnB+yFbLuPlwrLRLO7vDKpaiftG8xYVWK81nRoC2ic1PfAFIoQTeIcEefqmsldvu9D
         z3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=w9GsmGdCeDlovWnkHL5RzV48eH16cTZY3b9rQUOLBwU=;
        b=Q0IZL1PMM6aXiujTevdFza/PG9VbmLaheeOC0ez342ss2Okr2Xaxks5kCMqM6Ky+K/
         3cUNOYVqBSdUpGxo0EOrSp+HONRML840699Ik2KyEJHagWcusE/aknvKBpP5I8rxIoel
         ++9h1JggipuW/rPwih3ekJHtVxpOKNNpSmVYUaqApjb8o+phmvejW1KdWW5HXBIHJ80J
         8dUPPbsQaQCkqUOTMNCjT3CGJ4ox6mxlsJOvZmGifTGTDrWODyR2caL5aTJcbHTAryy7
         qou6CcIwTmvuCKbVN4txXjHHEbDQxTvV6EXAST6cHhiWN2/GU+KaUO8VxNJbTE1b0N8L
         0bAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SRxNIcER;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24si342468qki.241.2020.02.27.14.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 14:02:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SRxNIcER;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7REn-0001CC-VC
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 17:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7REI-00018x-Qn
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 17:02:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7REG-0003ko-BZ
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 17:02:02 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1j7REF-0003k6-6T; Thu, 27 Feb 2020 17:01:59 -0500
Received: by mail-wm1-x342.google.com with SMTP id m10so7951003wmc.0;
 Thu, 27 Feb 2020 14:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w9GsmGdCeDlovWnkHL5RzV48eH16cTZY3b9rQUOLBwU=;
 b=SRxNIcERCgH0LrWsW75smZfdKOtL2lX4ZYJvUBFMq3CNSr7xgFGS6nqUbtW2O4hYm/
 GncxLJVBpL1pkTQqU8Ms6BDHydE8t70w8rrXNv1KtRFDQCohKpTMKSjzCUYAu0SfI+aH
 xk/S51ufxF4CRMEUoJbPBdP69eXGP3oTEbPcrZsONtJHn6ClbTp5OUoR9/2h4kMwOts2
 xEQAKmUfdydcOc1qEAPI0WPwSOnZEJaPu60E/gn3f5/YSBYKM4fmB0qnonn9nn3b+Im4
 eN8enXMq/aPB8uhPknZPvPsVZ6ASYRbNL+L/mCztm/FKJmFrbvPw08D+uIwc4w+NNFwc
 nIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w9GsmGdCeDlovWnkHL5RzV48eH16cTZY3b9rQUOLBwU=;
 b=mFTOPQCLexVe7IuRwzCC/Q00XlfyCH2NV1vSQVDL7gDJXaNEGdNJqD5US6RYvi/nYS
 Ls0Lk3TNuAFqRB4gbDoFkYf4NrMb0gnYdU04JPskb7aMHoF4Au8BAyB57TpV+Tt9bKNb
 M3RoecPaRtaIGYn1zu0uLoOELlzaR6pXjwCXsV7es0Aj1DjJafgbdVY9PeVJl4snOth9
 tRtyjgUlvj9hZD36JErmiONi4zDH5zuKYU6X9KXBu63kVkcmPFaVGlcL5mOsHoz7Ev/w
 lRUitjPfQzlpPKUWnKg3GWqIgUJUyhqqfipbSvl1aZJ0Fl9FDFpLjBvZ9GqSM/S7b97/
 Sj5g==
X-Gm-Message-State: APjAAAXGUBGzpkm26xIJ8YQu9xHctiKxOILqfvrn3LPzkAYObj9X8sB0
 GtY9/xz8seTTh5ustZroPrLvcrFA
X-Received: by 2002:a05:600c:2107:: with SMTP id
 u7mr884038wml.54.1582840917494; 
 Thu, 27 Feb 2020 14:01:57 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id z14sm6447040wrg.76.2020.02.27.14.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 14:01:56 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/4] hw/arm/cubieboard: restrict allowed CPU type to ARM
 Cortex-A8
Date: Thu, 27 Feb 2020 23:01:47 +0100
Message-Id: <20200227220149.6845-3-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227220149.6845-1-nieklinnenbank@gmail.com>
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: b.galvani@gmail.com, peter.maydell@linaro.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wqMbhqT/uFVB

The Cubieboard has an ARM Cortex-A8. Prevent changing the CPU
to a different type which could break user programs.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 hw/arm/cubieboard.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 0195925c73..010375f0a8 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -30,9 +30,17 @@ static struct arm_boot_info cubieboard_binfo = {
 
 static void cubieboard_init(MachineState *machine)
 {
-    AwA10State *a10 = AW_A10(object_new(TYPE_AW_A10));
+    AwA10State *a10;
     Error *err = NULL;
 
+    /* Only allow Cortex-A8 for this board */
+    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a8")) != 0) {
+        error_report("This board can only be used with cortex-a8 CPU");
+        exit(1);
+    }
+
+    a10 = AW_A10(object_new(TYPE_AW_A10));
+
     object_property_set_int(OBJECT(&a10->emac), 1, "phy-addr", &err);
     if (err != NULL) {
         error_reportf_err(err, "Couldn't set phy address: ");
-- 
2.17.1

