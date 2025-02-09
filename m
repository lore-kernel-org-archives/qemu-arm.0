Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1181278njb;
        Sat, 8 Feb 2025 18:54:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjein6Sd8DLNw4MxQ84B1pLTC9ibkCpL/+7OZkCQH06vwhW1fak/GAC784cT7iC+1pCZ9rIgPvAioc6w==@linaro.org
X-Google-Smtp-Source: AGHT+IFNIAQz95R8G2xQ0NlxSxoS6QeuxNM97bi2r0QsdDMFKb1jJHeHJ5KlHaUZbxPczqy5n92Z
X-Received: by 2002:a05:620a:398d:b0:7c0:5807:de with SMTP id af79cd13be357-7c058070269mr237054085a.43.1739069669982;
        Sat, 08 Feb 2025 18:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739069669; cv=none;
        d=google.com; s=arc-20240605;
        b=WOkkSdGaWbM+YnpgUiz+fFfmGqsZvtYsPyYR9mC1unhVmp7QiLMKm+vpT2SontgK16
         Ex13Ul05azWPIqKg1+drpW1ADyxRTt3kOdNL7P4Kmtut4tTTUfgaJpvCCgcm1ZRRbwHA
         dJv984nOTAziSedFpVc4H4nBhV1Qjw1KJ1ewSpAtL1c7Rhm3Hs02AdeybjIsbL0I0Rc1
         1jJuSuaEURI0PMBJyb+mbCp+Ec58i6wxV+mo8QinBwUPrIDE50fPE12fpmIIiXJT6NxD
         fnX8bNqyyDc6eeUyBn8mwoAql69JLVNE5WGwBWa/Npp1EpJYYfcTwuY9NZ3VxBOmQbq8
         YEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=OECC3Kx/J6h+c9zd/MNgk5sxZHcHGBgSRgIZ+2LsnqU=;
        fh=9hml7JvoxWPUeOnBJBgSZINiFEykJ2mus5gU2rxbbyI=;
        b=DW0ON4Tou0OpQvO0YZ/KiE7XeT4qsWqlGfRHzcyngqufFuKgJ/jyNJDgAlOeU+Jrsp
         cGFZERS0O6VZvarc5NtKKLMXZtkVgd63TSwQs+Cvpu7A3XSOvnyO8+EftJz3eXOODJ6L
         LY+TkE3cjOIop3iXC1TBpXnDUMn6yz1ht8Y2yQoqfdvbzo0qKOXTxsxXvQQEvuxtUBeh
         ejKEfM/YS120X0s+S3T7Vu+d6ROrmS00MMF7Q7cdfvleVCyDTDG6UJJ3Lo/zeFbyHSIV
         SWRFJ8TmG6zYnPuab47DMwsQBgfHpdHZDlLNk1u68FA3Y3PoKUqcUddmSzqg56h7CAum
         UP4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=getutm.app
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153be4c42si63341741cf.613.2025.02.08.18.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2025 18:54:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=getutm.app
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgxSS-0000GM-6W; Sat, 08 Feb 2025 21:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1tgxSR-0000Fe-1d; Sat, 08 Feb 2025 21:54:07 -0500
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1tgxSO-0001Eo-FD; Sat, 08 Feb 2025 21:54:05 -0500
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2f9ba87f5d4so4667307a91.3; 
 Sat, 08 Feb 2025 18:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739069641; x=1739674441;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OECC3Kx/J6h+c9zd/MNgk5sxZHcHGBgSRgIZ+2LsnqU=;
 b=qMBwLlRoO/2FJLxUbt60G9WV6GegjCcEBSRTsCckLmTD9oqP3zHTAJq1CQquNdlDBE
 /CXTlstwhPWgxvdMnkIkIpr+w+gsIBCXJUN/zgPR5/7ReT9hg2Vp1sVfWFBKzENkgHH1
 f3hA6qGZ1gb594Lm+mU+1iEv/kQMjlgsAzXABNrl5JSjuNwibIRjcvTBaLTjfA3UAjqD
 CoJnfxBDWnqmbQerjq/VtX5l4d+V+hHTJt/43ofIMYXRIJxosPOw3Z9cnuI71wkjIobF
 Mcg+tnL8a21c/6IVStn0jftCei0HBlow2evQogdYXOwP8c2aARL+y8lZbo2wbHb4ZY0k
 2hOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWPmPQp0o59amrqeNeg7ERe4N4ujhKZsx1x8WNpHB2+44z4mAIjMVCzSUqTpG0+PhRQvfAQ3FzsQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx+W8T/4ZarcZ5oSNqpUjZSWHhZ3gPzzP157I8aGOAKURTZ/bix
 bAhxErjjxQwmVKmcOGlqkqEj6gRRE9ZWiDxxIHx1/DwztmRdE+VB07ESc0i1
X-Gm-Gg: ASbGncs3Wxo6J4QS+kIFS/JR9ZztcygAIXKWx9xrcIIlhw2tjyukyeKZhWN9PDNQYpc
 gbsCIz6TpspXaoAcUpqNFaF7SXOM13LDTLVUlBxl3Tr/kQbDEMPtdA+ZIw1WPdKVzUL/ZKdzv7V
 mkR7+ATSNrWrE0Y8RBZr1P6oi91QPvxodXSqq2DYY1wjSLEm+eGdofoMyS9ZylZQyAmCb/8aE3T
 55B561SdrGdOahyZybXWYTtaDk0AAnhxgm5Ub41T3K/OhMIoy/X/N66WZ4urueKW7Q+WPxwV91S
 o5gcvToA1zSbWkbGg8YRz032HAvFypRty3TUWXhovHvu4+4=
X-Received: by 2002:a17:90a:f94f:b0:2ee:96a5:721c with SMTP id
 98e67ed59e1d1-2fa2417c12fmr12141832a91.21.1739069641393; 
 Sat, 08 Feb 2025 18:54:01 -0800 (PST)
Received: from localhost.localdomain
 ([2607:fb90:9e97:4903:dc10:4530:8a3f:fdb6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f5786a07bsm33070645ad.115.2025.02.08.18.54.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Feb 2025 18:54:00 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH] hvf: arm: sign extend when SSE=1
Date: Sat,  8 Feb 2025 18:53:58 -0800
Message-ID: <20250209025358.43533-1-j@getutm.app>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.51; envelope-from=osy86dev@gmail.com;
 helo=mail-pj1-f51.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.07, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: w8twENvXzyJQ

According to the ARM manual, when SSE=1 the data item must be sign
extended.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 target/arm/hvf/hvf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0afd96018e..28886970c9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1876,6 +1876,11 @@ static void hvf_sync_vtimer(CPUState *cpu)
     }
 }
 
+static inline uint64_t sign_extend(uint64_t value, uint32_t bits)
+{
+    return (uint64_t)((int64_t)(value << (64 - bits)) >> (64 - bits));
+}
+
 int hvf_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -1971,6 +1976,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         bool isv = syndrome & ARM_EL_ISV;
         bool iswrite = (syndrome >> 6) & 1;
         bool s1ptw = (syndrome >> 7) & 1;
+        bool sse = (syndrome >> 21) & 1;
         uint32_t sas = (syndrome >> 22) & 3;
         uint32_t len = 1 << sas;
         uint32_t srt = (syndrome >> 16) & 0x1f;
@@ -1998,6 +2004,9 @@ int hvf_vcpu_exec(CPUState *cpu)
             address_space_read(&address_space_memory,
                                hvf_exit->exception.physical_address,
                                MEMTXATTRS_UNSPECIFIED, &val, len);
+            if (sse && len != sizeof(uint64_t)) {
+                val = sign_extend(val, len * 8);
+            }
             hvf_set_reg(cpu, srt, val);
         }
 
-- 
2.41.0

