Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp2071049njc;
        Mon, 24 Feb 2025 10:42:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUv8XobMNf5kiWPneSelHGig/aj1OP0QWPtR7u/M0i8ddtLgab/ZDN3spZbuRjYjaSM0qeI8M4qjcC+9w==@linaro.org
X-Google-Smtp-Source: AGHT+IHYjtSlwZiyxlPTpHt31+GyTE48jgIY4pMjB0KD6f6fcwZ1mZ4PIPAzRfeXS7o3tsorNLqC
X-Received: by 2002:a05:622a:51:b0:472:7e8:a77e with SMTP id d75a77b69052e-4722289d659mr178469191cf.8.1740422570156;
        Mon, 24 Feb 2025 10:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740422570; cv=none;
        d=google.com; s=arc-20240605;
        b=RgB2EU3SFZqWbrxgwYoBOOSQEgTK9ID+SMboXbnfxD8LVRgl+2NXof0OMx+Ei0fyOs
         1HDqHaniaWPPdNxoa6pJMSuq8P2leSqNE/DA8xNBMw7SIlb5QBrGb3AgcOQkY9+9F86Y
         0BoVYv7CPFl88/JBygdVx71CAu62PvRY2FbtMJ9B1kGWSeuaROpF9SUA/AtKgGL5W0oH
         kA8afnklaB49GDJPvACe2wkYHTAtYAbX7BcOE7PWjbf/bFp4cD2WAEE+Bovq59OeleF4
         pXZPXCDBzBOaUetz+mWB2bERw4wrKcveKTRUY2uPcLZ8ZCsmwS45L/o25/6sNJ6Gu+o3
         6OJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=eFNfM0c+Ibx/QrlYzcwNJybRS6DgFvk8R8vglhbxGbc=;
        fh=J0EkR6Pe7f1dcLJlIoVGoQ00UZDWGjrwcyg8GS1YRjY=;
        b=MbZCAgUvVnp4ri9LjtzdjPQfLgeO2vGOIbuxgO0go85r6iCq6+68J3CSnwDGCepD0O
         FEqh9MsJZX47V/mwFaHhGmIrku8cq4caorjJCZh+RPfPankyI2yGl7Amk5PyGT7TKMQi
         /AT3ASSzuGMxyN5G+EKca5GgNF0Al3+XV9KRDvCLHHwk4hG9oLQItNHHuRSA27XPkEQg
         OH64e7zmMFfmfA8eYzHVB8G500z2lLPACQQUamfXKhn+w/SA+XUXrz9pa616Ivr8MQRe
         ikV+prnE+CyqaWdqdbI9aOPf75JDk38xBcjeQBO2CDxewquyNrMZ1WCx5axHiq+gkLdW
         BO3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=getutm.app
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47202780691si121064631cf.477.2025.02.24.10.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 10:42:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=getutm.app
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmdPX-0004Ul-3b; Mon, 24 Feb 2025 13:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1tmdOd-000427-RS; Mon, 24 Feb 2025 13:41:43 -0500
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1tmdOa-0006r7-BE; Mon, 24 Feb 2025 13:41:39 -0500
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-220ec47991aso65172155ad.1; 
 Mon, 24 Feb 2025 10:41:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740422492; x=1741027292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eFNfM0c+Ibx/QrlYzcwNJybRS6DgFvk8R8vglhbxGbc=;
 b=Zn0kkg40AdShrv4H1/AOS8IqZeqyiXi/94pxrOvx2vviHrtAYyTlrh8AfrYo3PGwfm
 HNHJHavL3ainm+4G1e4Y+eWWfajybk1V2zQPKelqLc8AMxSEMmZyOm8cBiUxmyq40w76
 +cX7pxUiUpzau8ctpVBbQyjrVne48U/q6EKc1ntQ1qm9unfBFQOvCMiRWonA4pTDkZ8n
 zJht07WB9KNrqzFgXYomxDLeyCiXtkuzxjRpGVbyPnlBWe/wTOnXukVFpSkkDtQ0/uJU
 jhixH1a/PmBSpUoCl0lekruTFDwC7cx1O0zUka8HSpA1+q5mlTXb9BtiZLX75C+tTAy7
 S0Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWZUYziSGSBqZUaWU+YIK8Lqdt5WZGjTRlaq8GHyD4C2OSnZ0/ke1s/IH33/n02bO6IF2YGms9DA==@nongnu.org
X-Gm-Message-State: AOJu0YxrITs+8iRIaz8oSmoVvkm2XUjoH7OSpdjWr3QbPbpwkn7OYq+N
 e0rgF6Oa646UkYtO7V3MOrcXTnEWKAn+Hs1jjxpbw6ZD8wwBgxYpbCIrpenX
X-Gm-Gg: ASbGncs254PBq/L16QYPk9SpAmc5hcx9svC73m4V7jFacbu3jk7CHU1z9CPucO4EGvl
 Z7r8g6Ng0IZIlL0wDWLS2+m5DhRUcEHsf+xGJennk7tCmvRYPe8wOgFWqh4YtJ2CFtGu/+jjS3e
 AOzYK9a70mxJM/e8zyqkEdpltsKiQgnJKTWZyFHgQH3EFgAJOFeijwIdXMLIjPHEMlKTS+/CbQx
 EqNVeQ1ByznRS3UMQObKXReqa2V7R9WOuS5tj2GLSQ/cunxurUn+d2Jz529tLmwvmaYnzOpMaHu
 R2nM5TqwI52oDAiK5vRjZT7La5B+GV5OymwFbDa/mHjacuhmRXqc1R/s
X-Received: by 2002:a05:6a21:150d:b0:1ee:7fa1:9156 with SMTP id
 adf61e73a8af0-1eef3c48fe5mr25000165637.3.1740422492479; 
 Mon, 24 Feb 2025 10:41:32 -0800 (PST)
Received: from localhost.localdomain ([2607:fb90:37a2:e54:b846:cde3:ca66:b2d7])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adb5a52aee0sm19214227a12.47.2025.02.24.10.41.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Feb 2025 10:41:32 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2] hvf: arm: sign extend when SSE=1
Date: Mon, 24 Feb 2025 10:41:23 -0800
Message-ID: <20250224184123.50780-1-j@getutm.app>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.173; envelope-from=osy86dev@gmail.com;
 helo=mail-pl1-f173.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Wo10uWD7oyrw

According to the ARM manual, when SSE=1 the data item must be sign
extended.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 target/arm/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0afd96018e..43cf250eef 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1971,6 +1971,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         bool isv = syndrome & ARM_EL_ISV;
         bool iswrite = (syndrome >> 6) & 1;
         bool s1ptw = (syndrome >> 7) & 1;
+        bool sse = (syndrome >> 21) & 1;
         uint32_t sas = (syndrome >> 22) & 3;
         uint32_t len = 1 << sas;
         uint32_t srt = (syndrome >> 16) & 0x1f;
@@ -1998,6 +1999,9 @@ int hvf_vcpu_exec(CPUState *cpu)
             address_space_read(&address_space_memory,
                                hvf_exit->exception.physical_address,
                                MEMTXATTRS_UNSPECIFIED, &val, len);
+            if (sse && len != sizeof(uint64_t)) {
+                val = sextract64(val, 0, len * 8);
+            }
             hvf_set_reg(cpu, srt, val);
         }
 
-- 
2.41.0

