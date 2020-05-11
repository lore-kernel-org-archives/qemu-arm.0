Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp188918lfb;
        Mon, 11 May 2020 06:11:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypK7WRh3uwA1ADJtcnEoKM2bJX5wAHO3kcAObqJikOSdP8o3Iqfu1e6NK5WhAcUb5yeqkUHI
X-Received: by 2002:a05:620a:1379:: with SMTP id d25mr15647905qkl.173.1589202703002;
        Mon, 11 May 2020 06:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589202702; cv=none;
        d=google.com; s=arc-20160816;
        b=hmu9A3cR1KXRj1ajIiCcY0JWUv6dRwdJF5J2hrUqKm6VPU5fPm54YMSXHTbftTMrTC
         2Wbya02V7aH94yM9hhUefmQmeFUeSefKW9MnUH2q/44/h7kJmKyYaSSzn9xd0r7WzI2J
         hEBgSZPAjqMuqN6yhxV0qwecwRr9lesooH8MMTjcKsRIop7k7yh1alL6E3yhf4WVad8W
         pJ5MLEdx3tJ3ahLPkhnQiEZtIe3SdPfuqbiqVUfVooSmbYINMyqHTJBYXLT/x6KcP5ar
         BWM08aLQax4owYy/Xy6HaQcIo5zo5JxpaMbQwz59aozugrdf2pJufHx6bUrVMKdIM5SO
         BX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=qV+WPsyPxR6+lt2ti2yn0mOEjpo225y5D7KTke+SxoI=;
        b=x+N0NXKe586/ZbYxlIiakwWSAo7vmksfkWN3UkE7Bg8M3467uPf6yWhEA5z3wt65H1
         lxe2WJH9nhJKwrTdRdd8PfIKUe5JIVbzjUsqozIkSJUoeyCBcR9cxXnKp3N+mX4Dr/9g
         2BTloH/kYhXoSiX1enn+OefTUoiz4nmTXF8IOHuhnjGiESstYA/wavSvj1r9HGgDQh6I
         PMh0d6/ihmfDKoli69RHBBtm/Fyh0YWaLV42rvQcnFx0K8Yz5933+u8COulBngSrgABm
         ZfFPc4WHO+IVQYDE+WsNUmfQ5pAPSdH0j8DDq+HOHeiqBQGYpLs2BziRnLEiyTADty0M
         gwtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EbL09V9B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p22si2715764qke.40.2020.05.11.06.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 06:11:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EbL09V9B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY8De-0005fW-FB
	for alex.bennee@linaro.org; Mon, 11 May 2020 09:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amanieu@gmail.com>)
 id 1jY8DU-0005eS-LV; Mon, 11 May 2020 09:11:32 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amanieu@gmail.com>)
 id 1jY8DT-00017X-Uz; Mon, 11 May 2020 09:11:32 -0400
Received: by mail-wm1-x342.google.com with SMTP id d207so3904014wmd.0;
 Mon, 11 May 2020 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qV+WPsyPxR6+lt2ti2yn0mOEjpo225y5D7KTke+SxoI=;
 b=EbL09V9B/eLfPenF2TnjUhuEkhV+qymLv3U7PpNKuamXivLL5QDmRIdlUKgYRrI5fQ
 SkzE+PSWvkeEdhA5bsVkuAzQigpQE3hjbGBjZV0S9VanIW0FKscmM5EDnfyy5AjfGe1T
 U20hKxdbWYgrNY6/nKvxU9jiL75kKVI2yPgbqIrnMNs8etHFLpysxjw4czh25V1TU4St
 rNhi9VgmC07CJaclTm6BEp5JYdrnQbS3WzL9IH0I1qLCz4BemGAd3cM5cB9ikxfkvy6Z
 QL1WvxYGNqOpdwMS2Q3azQ5CNqcWXCxG4HOmQnXU4eMTU9w2oAyKdkiOMShE3udJkTvn
 lqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qV+WPsyPxR6+lt2ti2yn0mOEjpo225y5D7KTke+SxoI=;
 b=sHbpTUWlZz0+aj71B42V1JV+AnjpAyofTo6MjOHzsfFXEmhIva+Tx/RKh151Su+WwH
 k6Aa3Rv5xYF6e35+bK4Yyv2G6xkckSMX/oNP6KLHRpWSk7wfzKkwZPn0ckHZzZ7UEs6d
 0gekZ4m5n/tLC1p+7CicHiQmEEVnLf7QzvnaaqQFiiFDFMnSUgSui5ajc0JnMygtRVQ1
 S3vl1IVWmNK/5J35D3R/aYa1pFz3vQz2exvxVFfG62X01jJIxGaHsDyxrChb4dgtJCEK
 GRez7oBBVyW3bSzHfgSH82Uwm6WNO7o+I/7qiGEkLjgpLTi7y4b8/C6KslVKw8gH1syi
 bjrQ==
X-Gm-Message-State: AGi0PubiRChtmLihQ+UmM24pfO1XjqXWtv1XuE6R+A3lhK0hu+ui+89s
 WbFxXKJgqX9ivRkISvdFaH6V5TCnt4g=
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr23960192wmc.53.1589202688548; 
 Mon, 11 May 2020 06:11:28 -0700 (PDT)
Received: from amanieu-laptop.home ([2a00:23c6:f081:f801:76b2:7504:9791:6959])
 by smtp.gmail.com with ESMTPSA id
 a7sm25831081wmj.12.2020.05.11.06.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 06:11:27 -0700 (PDT)
From: Amanieu d'Antras <amanieu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user/arm: Reset CPSR_E when entering a signal handler
Date: Mon, 11 May 2020 14:11:17 +0100
Message-Id: <20200511131117.2486486-1-amanieu@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=amanieu@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-arm@nongnu.org, Amanieu d'Antras <amanieu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NATektASgMtA

This fixes signal handlers running with the wrong endianness if the
interrupted code used SETEND to dynamically switch endianness.

Signed-off-by: Amanieu d'Antras <amanieu@gmail.com>
---
 linux-user/arm/signal.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index d96fc27ce1..a475a103e9 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -244,6 +244,11 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     } else {
         cpsr &= ~CPSR_T;
     }
+    if (env->cp15.sctlr_el[1] & SCTLR_E0E) {
+        cpsr |= CPSR_E;
+    } else {
+        cpsr &= ~CPSR_E;
+    }
 
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         if (is_fdpic) {
@@ -287,7 +292,8 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     env->regs[13] = frame_addr;
     env->regs[14] = retcode;
     env->regs[15] = handler & (thumb ? ~1 : ~3);
-    cpsr_write(env, cpsr, CPSR_IT | CPSR_T, CPSRWriteByInstr);
+    cpsr_write(env, cpsr, CPSR_IT | CPSR_T | CPSR_E, CPSRWriteByInstr);
+    arm_rebuild_hflags(env);
 
     return 0;
 }
-- 
2.26.2

