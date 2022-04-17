Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1277554lfk;
        Sun, 17 Apr 2022 11:20:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg7G6doImAhx2NloCGUW60Qk1hNZmFMZq9bzC+njl93JzugwyCCN+ctcbIirkNEgi11Nj4
X-Received: by 2002:a05:620a:b92:b0:67e:b7a2:dabd with SMTP id k18-20020a05620a0b9200b0067eb7a2dabdmr4824127qkh.106.1650219651995;
        Sun, 17 Apr 2022 11:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650219651; cv=none;
        d=google.com; s=arc-20160816;
        b=ZFUQ2jWJS62JlmKV5bASMORqmWqhBvnWqEKCVWw1riHISfhFquIEepVcMA0a46OOaW
         3EV8kJ8BUtIBwdJsqdkfMvlk5XmFpPcFav0xDNqZFBBXEr46RTat7+kMEZeaUP9yq9NB
         KxIFII2BNMI4STEXIKI3GmgbOOlGELvSRiT87Jy42Kq+efv0BR2PShs9YZcSt3n7KWVk
         iOT4x3b2kWJ+gR/7KR8iu7RFW8HIPqe6KArfJA0ysL3vhaVmlTjFQA+pCDHoV2b6UQ6j
         DKkuncOuuMSHVurKl+z7EWXVpNgB3VRbiU4XSg13faTyALr/Lm8V5oLnCm9H0PndE9G2
         5oMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BnQW0DvgaZN0T2yAGdSifoOIby01eTPtmMKzkfkFCKA=;
        b=m7H3CDEWvIcRGFnqB9/+1Pf849FXtmq1wz1JWRzV5Jims3b36ISm6XuPP6YNhAgork
         bGKBhhAfOvL8Fk8kaXcb7NcQjTyzavEEW+HX2na7jsAm03AI4o+QrSl/93EDaD2WsPJT
         jUzTOPv/OYefsZf/GIzJzECNE2cnmKLkeCB/1QRtc4wB7a9gxOyvBS8qU3R6KVD5BKDF
         zjSzMy9DN0ZpuDcrBXY9iQ1pm+TUJbrdKzGEtJuwJf924532tBbfVH5EbmNwRntoTDJz
         foiXr3sQrEOzEsAsZvVOlZqdxjzLeZD8yoHRom1hTQhooVapuFLMxRIwEOAoWu9tJnhT
         kW/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hcuQu8vo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020ac84e92000000b002ed3c7b5259si2865705qtp.579.2022.04.17.11.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:20:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hcuQu8vo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9Vz-0007mn-GO
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xK-0001K2-4A
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:02 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xF-0003Os-Tx
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:01 -0400
Received: by mail-pg1-x534.google.com with SMTP id t184so1964669pgd.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BnQW0DvgaZN0T2yAGdSifoOIby01eTPtmMKzkfkFCKA=;
 b=hcuQu8voPCRuXAiORVOPesCbSkdH/eGScTBpwFhlgYfLw1Lshzg9bCPpCOTA61qUHX
 7cVDId3AoNvzBn8j6vhwREthUp1eLRzyCzlMPSjYcGrEj9pcGdMnH4PUYy1UbfCf1BQD
 MfVImbJXqfJJ00RYdAHblQ6MYqFkrdeXxaP/DAG56tvS9M+qwoOjy+u6AzR0N/5j6ktS
 00EYgcfy7Zrulu42RD3roya+q7WTZjQAZV2p1a/bicsLEWHa+E4vKDO4hdb5a8qubwdW
 GFx1uenOzx9LGE3LU6/sKkcSoCdR5S6z/T1pMqgfBF9zg1+bOKefO1zgRBkFcbeYTCLG
 umIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BnQW0DvgaZN0T2yAGdSifoOIby01eTPtmMKzkfkFCKA=;
 b=0opnDS3Z8NbtgF0D+1z6+UL7BLgW1IOu+LPxCzAippqqF4cRd4TVufK8vH3eCl2YMb
 pxpLLuArSiBjJOC+EnH4vVMqI23EDpLgot+aGxcdMoLc9BFq5ZYXDRYYCJzeAWCPpFUz
 yC4ZYqUF+phDs2GHburfsgbB78o79bBqvbYnfIYkn2mi+SbVDhLvbuF7TmPtD8QHM3Ju
 4QDU6cHhrORlev6/MS7+ghIVAswzNB4WNy3eIVF6k53Ms5nivZZnoBV2CGXAvEVWx0NE
 sJabdYrZe7bqCXSqagOgBSgZZ7hD1akj5kh1MkuVp1rqQwjeXmn2Yc7YJeWMFBxsfWE3
 iKZw==
X-Gm-Message-State: AOAM533V+vKz/3VM1rXbzq6h63BOMc0+j/hUeh0xMNQN2Dz6qKqNvk5/
 cDQHCEy93x6MdoqrBhyIwKm1vb6DJ2Fudw==
X-Received: by 2002:a65:6216:0:b0:39d:5e6c:7578 with SMTP id
 d22-20020a656216000000b0039d5e6c7578mr6921313pgv.114.1650217496699; 
 Sun, 17 Apr 2022 10:44:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/60] target/arm: Name CPSecureState type
Date: Sun, 17 Apr 2022 10:43:57 -0700
Message-Id: <20220417174426.711829-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xfvRW+D//ZMT

Give this enum a name and use in ARMCPRegInfo and add_cpreg_to_hashtable.
Add the enumerator ARM_CP_SECSTATE_BOTH to clarify how 0
is handled in define_one_arm_cp_reg_with_opaque.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 7 ++++---
 target/arm/helper.c | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index fe338730ab..3528c0ebb1 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -133,10 +133,11 @@ typedef enum {
  * registered entry will only have one to identify whether the entry is secure
  * or non-secure.
  */
-enum {
+typedef enum {
+    ARM_CP_SECSTATE_BOTH = 0,       /* define one cpreg for each secstate */
     ARM_CP_SECSTATE_S =   (1 << 0), /* bit[0]: Secure state register */
     ARM_CP_SECSTATE_NS =  (1 << 1), /* bit[1]: Non-secure state register */
-};
+} CPSecureState;
 
 /*
  * Access rights:
@@ -268,7 +269,7 @@ struct ARMCPRegInfo {
     /* Access rights: PL*_[RW] */
     CPAccessRights access;
     /* Security state: ARM_CP_SECSTATE_* bits/values */
-    int secure;
+    CPSecureState secure;
     /*
      * The opaque pointer passed to define_arm_cp_regs_with_opaque() when
      * this register was defined: can be used to hand data through to the
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8b89039667..7c569a569a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8503,7 +8503,8 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 }
 
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
-                                   void *opaque, CPState state, int secstate,
+                                   void *opaque, CPState state,
+                                   CPSecureState secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
-- 
2.25.1

