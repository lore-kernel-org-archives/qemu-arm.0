Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp396579ejs;
        Fri, 31 May 2024 02:37:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBOiegn3eJRWthb/7RV00J9vU7ZgbosRCiwtdtUBfyKnVVP4IjIZne0ss52ckATRBt7sWi1oPajoWz96ePYh4d5/4ztuNq
X-Google-Smtp-Source: AGHT+IFOPwqOnEVn7L0hkY5y9koWuDovVIUmxcaJne+YmEm4SSTF2j5kqGvyKpqR6HcBudFrkaY9
X-Received: by 2002:a05:620a:841b:b0:792:be53:8b46 with SMTP id af79cd13be357-794f5c87ad7mr128986585a.30.1717148277548;
        Fri, 31 May 2024 02:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717148277; cv=none;
        d=google.com; s=arc-20160816;
        b=nNCzNZGOMH95gnvNRRUQNVhWqT1mPwd0N+bNs1B1nxVqQfnyGnANFvYCcsC1A6liLR
         5u//z90DIHTJXmfncl8J4mtLNLEx70etZHbwOjKKfJ2SPrW05fPh73ho59OXo9C4L+2q
         85mDq/D3RadAx+YbYem//sdN7UDcLUs8kvA2RmbGPqrlp62T8EU7u5HJr2sCNpGeWwGg
         5Es+AH+Uij56rdbE62IvXBh3trGv8OM1ApfhAjsu24nWSVuIXhhOYoohSMBUvkjiEbEL
         cDZLXY88sJOXqSa0oq8m//4wXvdqFrim2tqK1rTteSa5Z6uf1O4URkKcQCf5cyWi222r
         fFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=BRfbYd+7S3faR2bkMnPV5KMDp3Co44cDsT4v12ZowyQ=;
        fh=nKl8/G0rxCW7ugooXfO2GeaKcEIa1k4pK3AumDOEz4g=;
        b=0qU61u6hmdLrv75TjX3d8mTF+G8/FNZjzvmylf/vbidZ8fhhOmo24Uiu16m/B60Ktq
         0Nu75hCQuu7v2b9yUUK5OATt1mC4X4k40uy/WjDQysna3d0woX1leKm7VR+GcHhH8HDn
         nOTQSO73ihzIMHK7YhC/FLyRiqJ1DHNJyO9PVC+YIioMVSgcd6x8yOtl4ABP2vKJ+/KE
         0ZOIm+tBlh1HJGFltnraX4yAqD7RbHjLhfoP1ixFfhB+FVqVOIAQmWmLOjyBEje4M/wu
         K8H8TgvsbzelBdbwpZRdc6lHnXY2xeriynqDyLCZuzVn8tOWuHzsykRb+HhS3m6g0zmc
         Kfpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f32a5323si150883885a.589.2024.05.31.02.37.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 02:37:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCyhk-0000qQ-4H; Fri, 31 May 2024 05:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sCyhj-0000q3-JQ; Fri, 31 May 2024 05:37:43 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sCyhh-0001pb-Ph; Fri, 31 May 2024 05:37:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 887402601D2;
 Fri, 31 May 2024 11:37:38 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id DuctskPxmdKX; Fri, 31 May 2024 11:37:36 +0200 (CEST)
Received: from applejack.lan (83.11.37.15.ipv4.supernova.orange.pl
 [83.11.37.15])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 00F522619EA;
 Fri, 31 May 2024 11:37:35 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] hw/arm/sbsa-ref: switch to 1GHz timer frequency
Date: Fri, 31 May 2024 11:37:29 +0200
Message-ID: <20240531093729.220758-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531093729.220758-1-marcin.juszkiewicz@linaro.org>
References: <20240531093729.220758-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pBpuBVVV6EDc

Updated firmware for QEMU CI is already in merge queue so we can move
platform to be future proof.

All supported cpus work fine with 1GHz timer frequency when firmware is
fresh enough.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 57c337fd92..7bd6898edf 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -62,16 +62,12 @@
 
 /*
  * Generic timer frequency in Hz (which drives both the CPU generic timers
- * and the SBSA watchdog-timer). Older versions of the TF-A firmware
- * typically used with sbsa-ref (including the binaries in our Avocado test
- * Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_impdef
- * assume it is this value.
+ * and the SBSA watchdog-timer). Older (<2.11) versions of the TF-A firmware
+ * assumed 62.5MHz here.
  *
- * TODO: this value is not architecturally correct for an Armv8.6 or
- * better CPU, so we should move to 1GHz once the TF-A fix above has
- * made it into a release and into our Avocado test.
+ * Starting with Armv8.6 CPU 1GHz timer frequency is mandated.
  */
-#define SBSA_GTIMER_HZ 62500000
+#define SBSA_GTIMER_HZ 1000000000
 
 enum {
     SBSA_FLASH,
-- 
2.45.1

