Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp466207ocs;
        Sat, 1 Oct 2022 09:42:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4FyUIE4mgHnnNydWZph+fUUJ/BOLzJ4nbwMbgn6yRUDnZtpDKUZGP/8NHxzg6G1a2b3tO1
X-Received: by 2002:a0c:a98f:0:b0:4af:a29b:343f with SMTP id a15-20020a0ca98f000000b004afa29b343fmr11185117qvb.72.1664642555305;
        Sat, 01 Oct 2022 09:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642555; cv=none;
        d=google.com; s=arc-20160816;
        b=sI8Ac7TvctR9FMmp0lzSSpAbPAIgghWV8pVriCA6mfGGQ02aBI4U5/GcpNT9walcTb
         Xehji3w/q0//tjxDz6VhOEmZOJ5xtfPZhzLZ8T6hF32Xnld9C+bn7xxCRdiDMYoDKyWK
         tTDvnEl2zQVCe6zYJUxeMRLevCBIptYWI66pmOo1aoG/1IJOfSqDokfCM5t3AhoclOSd
         ch8ptHbO7tFYgBimEO8xsH5/yfaRVOflkSHqeJruxO9aYkrx2EngrKGXCQagH9ZWzG43
         tVmqm9fzzFpUeFEvtI0R5VNLmtvVcbwYCNCGiuCsRK4Wx2Djsy0lbMCc4SwjCWteeuqH
         +psw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jXnTwa6UKQ364zxEijW2Djrh5kilE9wYQnYihj42TBk=;
        b=QvGPZnlMID5F5G05+tn+ik628bcjWbPXpMHjeh5KmGCtNn7YHN48lhcQ9LDp+yZjjD
         kRwQnFYHnicKZKe/A5F3N0rBXUtMJY4TF006Ud171awJYJgPLxwrGQEhLCS/MiPJ9Gnj
         eWBIhhQwbq88tOka0nJADgL0vQB8gkByVvIzUIvSkgK4UV+PeliVoftt3zD6BwZj2Zna
         r9RTqVgNAeFZhuzuh0CVVevw5vHLjANrVcMQ30EzCToUBIu7IhDVWKkHg3eCWLAKayf1
         foifr3U2OHFPMoInU/Lkh8xUT/Tc1Q3a1TWG19ppsdLL+lKh1Wy8hHXl3b8N+z0h4hu9
         5rkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R9TBDEyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020ad45ba4000000b004b185735870si224994qvq.178.2022.10.01.09.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R9TBDEyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefZS-0002Ec-SN
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIB-0008RE-JV
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:43 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIA-0006Hd-1h
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:43 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id j8so4634893qvt.13
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jXnTwa6UKQ364zxEijW2Djrh5kilE9wYQnYihj42TBk=;
 b=R9TBDEyIw/OhkqaRe38OjF+Trcs6rUGsG5b2Y2mo+STfUllsnAnG5KOow3CzVktoXh
 0/KKjtKKNmHXYNPFHokSv/x4Mz0/Ljk2uV0RTD3c1SUA5xaNDv80C+zDftoLgsKcvch4
 LmVnw18kr4baldr5rwpNG1gTahWIIHrDfZ7mbsirVaatmBHFyhDnbznxXF33v/9wRApl
 TVv2Bn8NKJ2Po7MANgOXN5uyELC802oqkTzegnAyq/FRqtxLBjZ6A0XTVLQNGro+fS8I
 iyy7KHRsERb5DjEb9EuA+xYHf9Xy77RlbQn6yvMUqNzk3PIAlxROuVbnGEj0N8AoO/nV
 k0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jXnTwa6UKQ364zxEijW2Djrh5kilE9wYQnYihj42TBk=;
 b=zLcMTe4dkuYZXpWyikmPQs9EWPdVX7L+c/7m4eP3CBy94+qnDV8h6LZWuuFqPMdvVa
 2mj27q0YyvtviPaP4ahA8tVBDISqjZ9hjQVEic6pPYYIOXsdkjXdC9X4FD46mJtsq5lU
 33A/QwbpmVyGEXRrT2GGnEpm5960IQcX7cmEFblxQSFcp76T+RyNQwOMoDQemmaoW8vq
 nbpwP+tk4JDMdwOepStLZvaHztUu+qnH64LXZbWlZsCOQgrhhAl3kDEOodidvQCD90Bu
 GuL0v32yQljbrF66UAKlgLF1E8/eIXfkTK7RFHm0SLszpYDsDQ3GGRLimZuSyouV8tXE
 N0oQ==
X-Gm-Message-State: ACrzQf1Qjj6Y84nErJ9h4xgDX78zLU/zbU9vizAvxTKzvvkjzJQGiF+5
 AKtv63yZTDUtXl56uYrMm2PLVGAtRDHS7Q==
X-Received: by 2002:a05:6214:4110:b0:4af:b016:5ff8 with SMTP id
 kc16-20020a056214411000b004afb0165ff8mr10169281qvb.118.1664641481366; 
 Sat, 01 Oct 2022 09:24:41 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 32/42] target/arm: Extract HA and HD in aa64_va_parameters
Date: Sat,  1 Oct 2022 09:23:08 -0700
Message-Id: <20221001162318.153420-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kEXfy4M01+5K

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a50189e2e4..e95b6b1b8f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1014,6 +1014,8 @@ typedef struct ARMVAParameters {
     bool using64k   : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 19a03eb200..70ae3816b9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10280,7 +10280,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, using16k, using64k, tsz_oob, ds;
+    bool epd, hpd, using16k, using64k, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMCPU *cpu = env_archcpu(env);
 
@@ -10298,6 +10298,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         /*
@@ -10322,6 +10324,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10393,6 +10397,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using64k = using64k,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha & hd,
     };
 }
 
-- 
2.34.1

