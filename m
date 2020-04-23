Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1590663lfm;
        Thu, 23 Apr 2020 00:34:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypJd49jGqGS86OrWcY0zW4J3eUlWlPOhlkpvapIdVSl1sQYxWSWhlw5NHJqdPcoLSA/KOHuj
X-Received: by 2002:ac8:7301:: with SMTP id x1mr2700191qto.53.1587627280765;
        Thu, 23 Apr 2020 00:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587627280; cv=none;
        d=google.com; s=arc-20160816;
        b=x5YfLJ2jA/xu8ovQ+JFfL8oonBwMh5001T2ZSfz1FmyIZ9qm3Zhi28lFJqx/u6O/NK
         rfk8hXWRS5KlBaPYu7GQamneufcMgp3B1laaOTa9/w40PshrYe9mX1Ep0M3ClatkpdOU
         OgXFzDTqUDiQyJK0HoRdR9VI9mRdIf2Y5HeKw3YOO/JKlTJ9Tp5MGT1GqCe/69Ym9nnJ
         5aZJqyAlAvzEyBLZioBzRudAcAafn7R74K4oKLaQtJOJvfDB8kdDgT0/9FlfVL4wqoGS
         jtJWotnP71fcbiMUC4bGAmjF+CTrwPiiviTY5I3DZq+1qnXN3jG1TR1aN9xhDOWdRewy
         nVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aaBo3MCsTgkEJPnSWwDmRxTt35ljRTn5VOHhxb4safQ=;
        b=XGc2TJYT2Da5eLXgTzxQyY9qbXZ0Ce1Yd6kXu7TFsWKX7RZsQzRYy+2q3Ffg3+u3qZ
         KOud3nDt6Wd2aReN6c3oPwaPxv6jA+58dglG2Sb5XM9/Y62rg0/X4BPrxyz/d3H9p7C9
         WjZ2F1GPZKQ/otYl88XbA076rYa3GwcAY0kE+wlrFe+4gvTb7MuoJMnqGNeSzcXEpiOY
         lIlfYATctI2iEl0ehy4fpL1druTmmmST1Ij+txqWMTEf0JUaaZCQaTOjxBQbfegvs2vS
         FfqzULmspyZZnpsaArbifiePpOEAmd5R1XSQzrmO3Anlg+a761cpeHr2pirG9YoItIrg
         7x7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YRr5sTNc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si832781qtu.233.2020.04.23.00.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 00:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YRr5sTNc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRWNb-0005FJ-U7
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 03:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNS-00059P-0t
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNR-000767-B1
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45334
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRWNQ-00074m-SV
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587627268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aaBo3MCsTgkEJPnSWwDmRxTt35ljRTn5VOHhxb4safQ=;
 b=YRr5sTNcemaAVl5+hpP4CJMCDADJTydAeb7Tk84GVswziPMYy5Jlb5bGAiMTTVwxPNBPD2
 YCN8IZanC7s8IBLMRfLAks/upHG6/vDfdunOoagAqQLlgRmLdSWEIjYfcer9AVYg3QGgGG
 mlb0gokf4TSol/735PbDB252ttze33Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-fPUBoDCGPrabc4fCbEvM7g-1; Thu, 23 Apr 2020 03:34:26 -0400
X-MC-Unique: fPUBoDCGPrabc4fCbEvM7g-1
Received: by mail-wr1-f70.google.com with SMTP id o8so1974973wrm.11
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 00:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HRr+Ptr5gqXJ2YHP+feMmdWvwBjwrFcYgrx6heAyn8E=;
 b=lCq+b58Emqpa5cJ6XOsizHtiYDjqHBgJmmWtqzp26VKLbHNNdLe+H4X27FrxdmDbit
 EEnzWYFt1HuOzSdwxSSlM8R8zEYTTQbzCATzefFvaVE23HCbfGQL15gy1fwU7HkcU0VX
 0mvHf9cFlFeNVVPDhtq4KqJvnXu7r1udlFhL+PM5PWZRsL2pW3sxb8+H+9lb9jmMx61G
 Fkr2NjJXt0tGMLTAUIpk0DeErK9jklYKVDMXm1H4rath4YLxnpV+52yaVsIRIfrU9He6
 8znmlYr+eWioq+Z90zNO4iqK+6UWwq7vidnvhxCQ9KlHM0L05jKHyQvHWPMS2el1uR2o
 Olsg==
X-Gm-Message-State: AGi0PuYLObM9E7tBZWBXUXN4GnQxoh5QSg0cMTy4sNGr6qaMOk1J8u6c
 P29mW6HmNbSXJl7pogh2qbAlTM+h4LCy1TmmeEMy+LA/Bpviin/4qUZ01w1/Mcn2C5h7kjcMv3p
 QlrjiA5ptqxPk
X-Received: by 2002:adf:97d0:: with SMTP id t16mr3135740wrb.138.1587627264983; 
 Thu, 23 Apr 2020 00:34:24 -0700 (PDT)
X-Received: by 2002:adf:97d0:: with SMTP id t16mr3135726wrb.138.1587627264792; 
 Thu, 23 Apr 2020 00:34:24 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f8sm2442784wrm.14.2020.04.23.00.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 00:34:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] target/arm/cpu: Update coding style to make
 checkpatch.pl happy
Date: Thu, 23 Apr 2020 09:33:57 +0200
Message-Id: <20200423073358.27155-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200423073358.27155-1-philmd@redhat.com>
References: <20200423073358.27155-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 01:42:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WJ5at5mT3T9t

We will move this code in the next commit. Clean it up
first to avoid checkpatch.pl errors.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 30e961f775..a1e38b38ba 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -582,7 +582,8 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, in=
t interrupt_request)
     CPUARMState *env =3D &cpu->env;
     bool ret =3D false;
=20
-    /* ARMv7-M interrupt masking works differently than -A or -R.
+    /*
+     * ARMv7-M interrupt masking works differently than -A or -R.
      * There is no FIQ/IRQ distinction. Instead of I and F bits
      * masking FIQ and IRQ interrupts, an exception is taken only
      * if it is higher priority than the current execution priority
@@ -1912,7 +1913,8 @@ static void arm1026_initfn(Object *obj)
 static void arm1136_r2_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
-    /* What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
+    /*
+     * What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
      * older core than plain "arm1136". In particular this does not
      * have the v6K features.
      * These ID register values are correct for 1136 but may be wrong
@@ -2698,7 +2700,8 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "arm926",      .initfn =3D arm926_initfn },
     { .name =3D "arm946",      .initfn =3D arm946_initfn },
     { .name =3D "arm1026",     .initfn =3D arm1026_initfn },
-    /* What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
+    /*
+     * What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
      * older core than plain "arm1136". In particular this does not
      * have the v6K features.
      */
--=20
2.21.1

