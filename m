Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp439189ejj;
        Thu, 23 Nov 2023 06:39:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEahZvZpc3PH8SFxtMQ1r1dCdRYRMROujCLBbNRrTCp59qxItfMp6PHAmpYHicvl09NQT6
X-Received: by 2002:ac8:5fca:0:b0:41c:baf5:b500 with SMTP id k10-20020ac85fca000000b0041cbaf5b500mr7573459qta.47.1700750379405;
        Thu, 23 Nov 2023 06:39:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700750379; cv=none;
        d=google.com; s=arc-20160816;
        b=zc3hznb7wZJvVh5C3+kJTbipmjOT1n8P6l6RlAgYotMFRw760r0wsdv2RswRRVY1li
         Y7KA7NKibVzP0nA/Xy8nRneqz5mUGZwMtisLcbw8O9oJshFwO8XJjjszqUItVEy24jxl
         OBDrpQhBbr5CnHv8NL5JLbRUzs2UeFw7T84n/OmOHIVuBFZ3XA6XV/JCYTrL3sDIRhZH
         IGr3dClUcug2tsrkCip0gQgbnfFahAwOELhaPdGwqDj6Metcv8osbU6eZ56eJpn+Ppam
         sFKZfnW0XKNX2vrHJ28/oQXOFmEW1OcmI274Z5uFbaegY9MdDeC9HoLuQQhPawv02mBS
         f7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Vpz6WqSYEj1xbsU7bl0EFtxY0Jdo72CGKjloYLxmr9U=;
        fh=xd8Hqo+FyqINTpmMuSlnP3D7Rh8IYP9KQ4AY72o61pU=;
        b=ACsmzV+J0zHZF4C07A2Ec3B7KGMCu3HBkBSdBz7+CMv9/M7uWfZwSIprObMUt9teZ2
         KSTY7zYIdiZhG8mTYlC0NvVDBG/23L9AhS0N8OwR8TFaBCqmShD6+yRLn/QjuxnDjG2B
         b3ig1Ed26ol4jOcXwh6QaQAgLhNJf4zSwg0eFQBPjRY5FG5XeKxXzM9QegKM3F5O1hSR
         6px+z6NO+rnnV5zDEzTAjdKZablSBGMRT1yvgS7JnSIThL3UILfIWgNX88gEvJdaA5tK
         Z5JiHkmGQ4HsT+iqtXPDbsdv3XHPf4iad4Xg/ZmKGsRKzvbWM3zfUrjz2RdYd7YFdKhb
         QLIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aBUIrDKL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020ac8598d000000b004237c7e78e7si1258409qte.272.2023.11.23.06.39.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 06:39:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aBUIrDKL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6Aqu-0001tP-5u; Thu, 23 Nov 2023 09:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6Aqc-0001nU-6K
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 09:38:37 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6Aqa-0002QN-Aa
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 09:38:29 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so1211813e87.0
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 06:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700750306; x=1701355106; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vpz6WqSYEj1xbsU7bl0EFtxY0Jdo72CGKjloYLxmr9U=;
 b=aBUIrDKLC3IQK0EYP/p1YT1iG3z/EEKUTBBt8iiZOH8ERfkIFUf3MdNf5EziD5GwOz
 gEH61vlNqPSg2Ksvp8OOQPRbeByn7YGPbcBkt2Zr6xmhpLd8vaP04fNtPw6IVShh4fmR
 bnOhm2Ls4SEDdszKOGnELGzAIc/cQc2BNkUbiLXX+4gIg1ROa1ppErWsh2PtKGhIZcQb
 ngQc9RluMGVOSbSBXkUyUM+ONNOV3m8ENdAwUVEr5MZs8GoPOQTTM697QQdX82KtcbYR
 8HfVyXtmFhei84Pl5/a93N24v7JRKn7t5p5AhSLvYiU+7BX/0VVHkWvnIKM4Y0nykFcQ
 IwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700750306; x=1701355106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vpz6WqSYEj1xbsU7bl0EFtxY0Jdo72CGKjloYLxmr9U=;
 b=dnJgG/3ofv3hlNJ8xFDU1VGmjsWnW3NCeJPlRZLnDmDskLgQtJqZorGZq3g/q+lSkx
 5acA8pc5xL76ikmXx+xFS8iNPjniixdGMNGt7v/z7lXjiRg1JlOM0E4WruTc4BAeCu0v
 bhaFCbUy/wVPOyFF1JflbX8UUAs0gaeDAIYVdiuj2/180A1ulZMIBV2goTIspQEIwDYU
 jC5h5L9KbzbYyTz/w/DOBQVZwgsfFJCdzoM3OToVe10iD013upUACU9V0aX9PQkjtMUx
 4yM1rF4f2cktLKkttublp7TI7dLnBn+lXjraSPTnFYSQ/tgXngAI06Hn+1IgJTzsdbzJ
 mmrw==
X-Gm-Message-State: AOJu0YxP4T6t0tJ4lSYYN//mziXJvQi5rIJ2PqaZfH4kLHH3fmnBRskS
 gtYWRns41CRMSQ2hTfIRxEhHww==
X-Received: by 2002:ac2:4348:0:b0:509:4c7b:c734 with SMTP id
 o8-20020ac24348000000b005094c7bc734mr3655236lfl.20.1700750306459; 
 Thu, 23 Nov 2023 06:38:26 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056000100700b00332d32efff5sm1791257wrx.74.2023.11.23.06.38.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Nov 2023 06:38:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Hao Wu <wuhaotsh@google.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH-for-9.0 v2 1/8] hw/ppc/spapr_cpu_core: Access QDev properties
 with proper API
Date: Thu, 23 Nov 2023 15:38:05 +0100
Message-ID: <20231123143813.42632-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123143813.42632-1-philmd@linaro.org>
References: <20231123143813.42632-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 2MnEdQnGN/Q2

CPUState::start_powered_off field is part of the internal
implementation of a QDev CPU. It is exposed as the QDev
"start-powered-off" property. External components should
use the qdev properties API to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr_cpu_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 91fae56573..24f759ba26 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -306,7 +306,7 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
      * All CPUs start halted. CPU0 is unhalted from the machine level reset code
      * and the rest are explicitly started up by the guest using an RTAS call.
      */
-    cs->start_powered_off = true;
+    qdev_prop_set_bit(DEVICE(obj), "start-powered-off", true);
     cs->cpu_index = cc->core_id + i;
     if (!spapr_set_vcpu_id(cpu, cs->cpu_index, errp)) {
         return NULL;
-- 
2.41.0

