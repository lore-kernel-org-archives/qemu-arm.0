Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp481258ocs;
        Sat, 1 Oct 2022 10:19:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47i3EUSafzLLH/qFVflBk2ONPF0CjAtDz0gS3LKSV94eU2AFOFve7lPnT6pPrnP0POATax
X-Received: by 2002:a05:622a:1007:b0:35d:1ef4:ed10 with SMTP id d7-20020a05622a100700b0035d1ef4ed10mr10945402qte.525.1664644759838;
        Sat, 01 Oct 2022 10:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664644759; cv=none;
        d=google.com; s=arc-20160816;
        b=pS86doGRLCStPPE50p4a3GennlXaTLZW33cr2LN0K+8110rhE7+LnnYCLTHXoJWJSu
         avBYXWqZY4dzwseG2/Su4HnPYdQYBdOjO0Jh1E1JSUMLQ1uxg9oCTEZ0K6zKHC5jb173
         LP4RBZT3onVTsWkRM5LlUSXvhC5LOXWT5Vz03LHoGHNUrdNB8iRF3xbMlaqB7qM9dBzT
         nqyU4vHnzkEuovgmvJsu/vzYR/vlDuESHJQmFYzK8xVA3SXlrotDpSZt/xmnQRs3YmuV
         Ms/tUBTSxZ0CSU8DV43vAqI0nObVFiphnbN8/j/VtTsipiw3aS7p/QmFAGAvgzWvwLYD
         59Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c3faqUVexkW9Ve/ySw7NotLcZ32qWMzAZ3wh+jbFG0Y=;
        b=A4uh7D5xlDsfmc74l7A5hMLuQIDLrTC1wm+LDehjoLGBLQZ/I7W6Xopg8SVhSEHLju
         uD3Lb2DQKp0xL9HeUR035acyL5VuiTeF9DWzuarrOdatW5L7gKompP9xMfhXgoqxM2CC
         6jnlQ6pxmPjmcKAikxvyQeewUoQ83faTUNrBoQMeyLP2RZa68TUK+m5xooLBS6w0OrrX
         ANIdeUo3iV5L4g7NgZRYAJ8Qw2T7hkIRndTLvvipuNGHTbd0VsR840bijP9ytPEKPicW
         AuU/eVV9iXEvHRw323PxoSC0xkuNsDaeCUD4lDIhDbUAk/fe63Wd7Il4XGP036/awpoq
         v77Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S461/8sp";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a05621419cc00b004afb5d22ed1si2783849qvc.191.2022.10.01.10.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 10:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S461/8sp";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeg91-0006zg-F9
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 13:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefLT-0008Ad-7D
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:28:07 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefLQ-00073t-KW
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:28:06 -0400
Received: by mail-qk1-x72b.google.com with SMTP id k12so4539393qkj.8
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=c3faqUVexkW9Ve/ySw7NotLcZ32qWMzAZ3wh+jbFG0Y=;
 b=S461/8spdNdshMllW4X9a3n2XFBsfMMa86ssRTXrrRk/x2VKBlvmFHkA+qgk5hzsVj
 LfPP5Nr4ncNHEdMiLcyDLDjFiCw3fOSSIzG1PLlQEIp6jmvuXbZIJO8YKoPNdnhRlK3e
 XXziGJNfa/vLt1MEf0I7fSfTqDZfIdxd7nPtBHxKTImUfm7GDvHyqkp3pEWEn16JygsN
 yBDHgcVsySynVmTOpypqo6PSU2ol/0o88rmZm3wyh5MwC3XQZgn9jABKUo6QVYv6X8A/
 V9bKNPD6s8KI/c3q1awNgfdvR7gA+s0xxhMklyNmNguX8inZluGG59XM/lQBRbMWjipY
 qVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=c3faqUVexkW9Ve/ySw7NotLcZ32qWMzAZ3wh+jbFG0Y=;
 b=PIpvFcJ3R8p5KUrY9/IaM2ts/ejVqVtNP76MBnYAKT6s6h6pRYytHVceC8Lz9VyLL+
 vqOKAjYOI0GnFHqu9+2QdopoWeTfKsXC+v/GYwl/9KXrK3LYWPn/V2WccYeWMGMi+0Xa
 ob7i2uJrfF2VZ7znw0w8hySnE5UILYAIz0yzGnFWHiW39Dxd3MIX2Y1lcPH0Ra+TIE8Y
 TDkgrTKycu1RVDUgENVI6j/V0MA8mci0KKIfVlRUW3MBFhOVWQs/MnP99YYan9lvzkCC
 6j00jA9m7tEvXntSubITMK08eZj0E7Xkp9L9XeQ2YR6+COleugimT2CGEcYYBkOcCBUk
 h32A==
X-Gm-Message-State: ACrzQf2/nDjtP5wa8SUjrtPehTtdIQoInbvednDhxdxJ1cxrmI/Yx2dl
 NOMGvpIqTysTQOG3x0PHgP5xEA7WyOin9A==
X-Received: by 2002:a05:620a:1727:b0:6ce:9b88:92aa with SMTP id
 az39-20020a05620a172700b006ce9b8892aamr9698822qkb.160.1664641682742; 
 Sat, 01 Oct 2022 09:28:02 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05620a249300b006b5e296452csm6403305qkn.54.2022.10.01.09.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:28:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 40/42] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Sat,  1 Oct 2022 09:23:16 -0700
Message-Id: <20221001162318.153420-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kp95U0hiKbBR

Both GP and DBM are in the upper attribute block.
Extend the computation of attrs to include them,
then simplify the setting of guarded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c68fd73617..45734b0d28 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1079,7 +1079,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     S1TranslateResult s1;
     uint64_t descriptor;
     bool nstable;
@@ -1341,7 +1340,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr &= ~(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1349,7 +1348,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1402,7 +1400,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = guarded;
+        result->f.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-- 
2.34.1

