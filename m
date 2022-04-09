Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp171442lfq;
        Fri, 8 Apr 2022 17:08:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf6ZspCbyi7BTc+/FZJME2Q8HILFIK5c4yDTOboQNFwudxve0fOqkCHwhNhCNv+gdhprcc
X-Received: by 2002:a05:6214:4115:b0:440:f7e7:7677 with SMTP id kc21-20020a056214411500b00440f7e77677mr17990405qvb.1.1649462903908;
        Fri, 08 Apr 2022 17:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649462903; cv=none;
        d=google.com; s=arc-20160816;
        b=ccrHEsWip4yLndAeGUY4P7N6ReyePIlu2Yi+rU6jYrBHM/1pTlIEVaTvaN2JlNrwp/
         7YaK7DdurqRL51gza14/WIUbf80QNwC0koIuRFWCCHoNYrOVGPhtiwvusAYDcOpL/fqz
         2XNX3oqMVo0lCho/nthDGAq3qIICefFnsdmF6gGlLoOJRkoBksIdugF5mrdDF/10hZnN
         Zmf/q/6G4En8lUBpcHNHQaPULaQRQ0JhCEv8+6KIwOAr0FWLoGHZ4abqnDH+rjP93P9T
         cP15lmGphH7Fvo6QAN87QSzb2XaSDDvP+dn+GVua85QnCJV5B+wnig8rZ+/SObv0NUNN
         uWPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=77IUNxzBr4CUo6OGOs42IJabOTHQjqxfs99nkKvtt9E=;
        b=ommwxbzIeunayrvykDuVLxOmOJkki1QUyG4VSQLUm1pIomLqxiZx5nLfRNLM7GA1CH
         CyDT+kSWe2yDor3O5/LtzAghyJ17+GRbn3lSM8cCeYkAeptzLEAfsLYwSEI7nvFXKPzM
         NjkOfWIQtyHweSmwb6azUfPijzU9FlCH3ogX6qztwcWgwu+ItSt+APs1MHF6g8Yc5zjI
         46FQN9Vo4YvtiZOLbcr0dwrpY2gnr2W4gUCLft8HY2x9v6n5XbiK9PB5UCvPv1DjG/2J
         OWWzqsu2CYY72CeJpN7Ar10NiKXbTh04PAaxGwhVWBLJT97d6Nokc5Ledo57wN/HRNz1
         r3Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SAsLnfpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke15-20020a056214300f00b00440e46a7ceasi1213272qvb.392.2022.04.08.17.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SAsLnfpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyeN-0008R8-E7
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyds-0008K5-W9
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:53 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydr-0003Rm-3n
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:52 -0400
Received: by mail-pl1-x62c.google.com with SMTP id k13so4039304plk.12
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=77IUNxzBr4CUo6OGOs42IJabOTHQjqxfs99nkKvtt9E=;
 b=SAsLnfpQTcLLx8E9ydD4RUjY6NH9oXP3sYX/r+DjhuMJS2HD1GcvacxRb9a+v5mdHs
 +PXYPDeSmYXCzxyTbx4FTgvdkovbTY0lwbLAjM3gjo41sBfaN0M98ib2yqlpf80HgHTV
 Kpg3RTs/ka42wzCJssrFISPIyW55mBSkYH7lErhLaAP1HxMaJs+7Mid2FoBIQckIqpSc
 hvJJQo2qxP3sEVLOKCfFE+z8wLgEBZrunHWRcBwV16qVluP4QYE96Jii8PnLt/Rl3PQD
 WUTFcrsMvBa9o1jf/1VK7TYvdgj/DeyIaFW8yLPirLjyuL12LvRdsuI67XmziQGIrUYl
 kq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=77IUNxzBr4CUo6OGOs42IJabOTHQjqxfs99nkKvtt9E=;
 b=BxdoIAYLMxp4yOsZ3ze3QDPfUyIngabTvo/uvO3CR5ThnVjbO7hctvJpbv1BU+lNtB
 J1N9HJ4NvObUOHV2I0ZM2/+XcLcjgPeGG6yBPhQlm6lTrBOThm02NIiCZQIWKH8DeMNV
 GLO2dNXSyCu/hIHktKxGYp9vctB6SpIaABtSbzHKY492kbBWQMqGXepN8XBYZdaBq59t
 2cxcC1fVgPXNfKJ1de4/iDKjZbCoUZTUS7c4P6efcl6xo4sD6QitoLC6jgmsGeXdt5Xg
 jzxLPiQSv/gICNkgkTcV9rJkSvUDJNKwLYMYSzwr1HTvCG5mdHGJxwpEDxikcSkk886n
 Oxwg==
X-Gm-Message-State: AOAM5315u6rCHTgW+6FCJ+w1P146tn+2f5/2AINqgjmd4nL91dH93e10
 eRpQI1B2Hc3zDC4LpAjNQ8/Z8g==
X-Received: by 2002:a17:90a:5983:b0:1c9:ee11:76df with SMTP id
 l3-20020a17090a598300b001c9ee1176dfmr24727413pji.95.1649462869664; 
 Fri, 08 Apr 2022 17:07:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/16] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Fri,  8 Apr 2022 17:07:33 -0700
Message-Id: <20220409000742.293691-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zk+FBujJir5c

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d4ca7a227..6521f350f9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1795,11 +1795,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         unset_feature(env, ARM_FEATURE_EL3);
 
-        /* Disable the security extension feature bits in the processor feature
-         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
+        /*
+         * Disable the security extension feature bits in the processor
+         * feature registers as well.
          */
-        cpu->isar.id_pfr1 &= ~0xf0;
-        cpu->isar.id_aa64pfr0 &= ~0xf000;
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL3, 0);
     }
 
     if (!cpu->has_el2) {
@@ -1830,12 +1832,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
-        /* Disable the hypervisor feature bits in the processor feature
-         * registers if we don't have EL2. These are id_pfr1[15:12] and
-         * id_aa64pfr0_el1[11:8].
+        /*
+         * Disable the hypervisor feature bits in the processor feature
+         * registers if we don't have EL2.
          */
-        cpu->isar.id_aa64pfr0 &= ~0xf00;
-        cpu->isar.id_pfr1 &= ~0xf000;
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL2, 0);
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1,
+                                       ID_PFR1, VIRTUALIZATION, 0);
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.25.1

