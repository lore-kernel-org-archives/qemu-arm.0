Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4340945lfm;
        Tue, 23 Jun 2020 12:37:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+LT4K/WBN+zp2zqVLAklAq/dm8pWvergeIeJ6V39SDAiwJlwf0DfX/y/5/22qhdbxOcCy
X-Received: by 2002:a5b:10:: with SMTP id a16mr39534086ybp.262.1592941040024;
        Tue, 23 Jun 2020 12:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941040; cv=none;
        d=google.com; s=arc-20160816;
        b=o+VkrVkeXjOJpj4nemeg0ubn7T91fhwidAoBH2sinLtH5O/XQQCFFOoVtXAsaPE0jE
         mmLOd1nfw5MyTW/2vOERA1EcpfGPCMm1b0pWOyo7xvkELorzd4UvSvcR3/9OEiNTEoqv
         GSdZxtTWWoW61w9tOTmo3VmHD94yd8832l2lXWl4U/eG+qVkauEU6/jC5vaM86WHQWcC
         ON4FyySoyLJPpx0c0U1ppASxOCtSbrgL9fZtv5XdotGJB4YxuM4vHCAgcIRznTpjPmUO
         Rj4YfTGeUOO+4oZ5tIVhc5M+7A2vymVyzY1mdZH3dSnWyn9ZKqbCyRgVJljXQV2o+iTH
         R1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UZWgT5KzsbdnnIQS6h1nh35owoxC0Bf2W5wbwlUKiR4=;
        b=kKNeiVT+wX4wNTxdNcizovBEd6iR2Ms9r50ejc5SwbGPrgNPOb9pL+He8JubxxJTpW
         JHQYKZdWtVWCBSxuOoRebN5k1ZooFsMrhzGyz/e6TI9OiVLOxgdGnsUCD73GIWkWOM6g
         2U1wkptaE7tkl3sds8kNM1xWhmnkNDr9eRIoUmhYmwHlf6g2Dv2vt3XS4ZU1W/yxPl+C
         aKHOi/qGO2SU0B4z68tEzo0tptQXGcJLkl3sixhuL0TSdS7zdhklNEr6BOTM/jgBSlch
         4FNk/u4Et9+43LxlGqHlDXtgmXrJmrKywNeSlnae4FRHtOmRLnV+x1LQ0xiNV671K8no
         KZuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tDZdvVUq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si17777117ybl.316.2020.06.23.12.37.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:37:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tDZdvVUq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnojP-0003DF-A3
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojC-0003A8-SE
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:06 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojA-0005V1-W1
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:06 -0400
Received: by mail-pl1-x644.google.com with SMTP id s14so5453872plq.6
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZWgT5KzsbdnnIQS6h1nh35owoxC0Bf2W5wbwlUKiR4=;
 b=tDZdvVUqKdRWzIX/vgYGSkxInlTaRMTI6223OI3OBbexvJEifp4aaqIifoGCCIXCDi
 jypGBlYrZSuAS4SdACIJSavo5WAcnJY4ipq2OLIynQvl3IDFh5XrvzWLjlwY+0giyC/n
 WaVexWmIEOQOhiZwiOC/szSCsgWpDd/iVYQB0TMvb2bvdU2abF1tShdkNrr8wKaqYDuw
 5EBStcfyUzfE1+4F5Ds/s7LUswiw54fTYCibDScmfCjZ09hB5qUA4YrKoBwWeC5KIKcP
 0yG77MofzU7VN5yCDfqdlri/v1qDNZfOompf+E2bchVfpxOgXKK1aq4ef200UszTSV0i
 udIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZWgT5KzsbdnnIQS6h1nh35owoxC0Bf2W5wbwlUKiR4=;
 b=LOKWpCAEpTycMQFFBiOqHB584env5ueo+v2Trb2arMY29nPXjDN7GXWl92IGlqV5cz
 6HuupXI2YNI4zw9hpmw1S5XxD37yS6m0LZJfz/axLYiQe6c3zbG6Af6gg4PHsamtJC0L
 e12j2/7XvcgSE8SeLqsegI39jZr5yWVnLANPNLfQ4yaX7rbpOJvbh7SJDOxEQuVNz1hG
 1ukvlCqG9Tr68V0J7D6Bv80Cm4K9+WmlAhOE9RpPN+dTwYSF4PUx8uhSt/WMwqDbV/m1
 4FLrhV6weJO/JPwZRq063Pgu8c0wJ7qPVJE4w1iKfBwUmxv7WGcaitGe9XxgC00D841Y
 t8wQ==
X-Gm-Message-State: AOAM533vsG49xCz7XZuUj69Zq3aBS8bCUS5qncykf88o3N4cjBwSNAWO
 ry7fDE4iQ+nmmRYS2vC0a62msQ==
X-Received: by 2002:a17:90a:2683:: with SMTP id
 m3mr24946133pje.196.1592941023691; 
 Tue, 23 Jun 2020 12:37:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/45] target/arm: Improve masking of SCR RES0 bits
Date: Tue, 23 Jun 2020 12:36:15 -0700
Message-Id: <20200623193658.623279-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wIPMdXvryY70

Protect reads of aa64 id registers with ARM_CP_STATE_AA64.
Use this as a simpler test than arm_el_is_aa64, since EL3
cannot change mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 972a766730..a29f0a28d8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2011,9 +2011,16 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     uint32_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
 
-    if (arm_el_is_aa64(env, 3)) {
+    if (ri->state == ARM_CP_STATE_AA64) {
         value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
         valid_mask &= ~SCR_NET;
+
+        if (cpu_isar_feature(aa64_lor, cpu)) {
+            valid_mask |= SCR_TLOR;
+        }
+        if (cpu_isar_feature(aa64_pauth, cpu)) {
+            valid_mask |= SCR_API | SCR_APK;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
     }
@@ -2032,12 +2039,6 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             valid_mask &= ~SCR_SMD;
         }
     }
-    if (cpu_isar_feature(aa64_lor, cpu)) {
-        valid_mask |= SCR_TLOR;
-    }
-    if (cpu_isar_feature(aa64_pauth, cpu)) {
-        valid_mask |= SCR_API | SCR_APK;
-    }
 
     /* Clear all-context RES0 bits.  */
     value &= valid_mask;
-- 
2.25.1

