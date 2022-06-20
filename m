Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp597050lft;
        Mon, 20 Jun 2022 10:53:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vpdmiFCy8A3v6EbbOsWH40q2ejU1zyIBpbuW7Ximj0PNSJSI8csoxu8CAiPEVzkXPNt0Vf
X-Received: by 2002:ac8:7e8b:0:b0:306:688a:f511 with SMTP id w11-20020ac87e8b000000b00306688af511mr20876844qtj.363.1655747636076;
        Mon, 20 Jun 2022 10:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655747636; cv=none;
        d=google.com; s=arc-20160816;
        b=OkMDxvP3YKcOAUqkrBor5CKj2YvzrorOz+GD5nsUb+b7LZepUKL7xlAzDjYZhvPPdz
         nLsK2Sg0eHPQdY1pF85QL8RTiULLzKun7A9AF8b4koPIThhEavu03eVEoQgn30uvv4GK
         22p2TyvQbpVhYiblSN+IpfBMPWLfutbncIs6ikCSB3rtLQXOiUvGnChkooH+ZT2t2Mg4
         AVjo5A+gtdo5NH0qnSxUE0XsZJpj2iKuBSSwsi7mA5quMUs3X0vJmpZKa3B6qCtxjF2v
         N/AaasMHjU8tucKWl+sOYaeDvecgomq+H0Hxs35a5suzI+PcJSaOZkmIPBbuGhZDpkv4
         aAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bZQ/+9oH8WDS9FGV3y9tSTDQVCQZ26UllDhjGlm8djg=;
        b=e8/2AzvLADnRFv2qaQTfSTkhLEYO+zx5ta5+P6DlWeMhH3ktH6FyWqAsLqM3xwx/bS
         i2/uGkycDEYcCCyNlnZqU4ZU6wc0wXxmEYFt+Ar7z7My7s3hVn5HVwC3WzEfI2qyCdvE
         LzlVJFPtX8cFj/xYbKcDN1HbBF67nTfiVTk1IGkl7DcK136K9U2MxT75NdZiPcM4avei
         73U7e3VdbAwbamdpSFr3hG9CukRk3Ur/nKPR12hdalzq1hQSGtGjncoUJNbtvsyLEBnr
         0ELxXeK5n9c8/VTFqdIvxRXjwwshIOfjJe1zHVCpSBdBJ8TFskxplN1OM7ffbuB1733k
         cl4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pUchknfO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a05620a254c00b006ab91fd043bsi6377087qko.190.2022.06.20.10.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 10:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pUchknfO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Lb1-0006wY-I7
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 13:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZv-0005h0-PR
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:47 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZt-0001O0-UM
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:47 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a15so3667644pfv.13
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZQ/+9oH8WDS9FGV3y9tSTDQVCQZ26UllDhjGlm8djg=;
 b=pUchknfOpwJ/0g5CCmOSVvKIsUzP8B/CnSDyLfgjxFK1W8mNMMK6eFY/IcB48g33jK
 SAccq0K76KO8PS9d3nkvbnTpCq+bWAzWz/Tbsa1AjhYgMQmWGSOZVFFMpWPBdckkzhWt
 l5Ud3XAsb/xPhITnYmHiw/uxdFu7BPCFbjwc1vJyXVMBGmBq/sTsojON5KxC64wU99r1
 JxtqlbvVJe+yggCfEkRUVE8LtpWD5RyYzLbl6oLHPGtHNOBhr3sLb4ybXR/VC4ciNm8D
 Yx/vOF1sFgzSMqE3e9F8JcluopLqmSAmrMLXj98iZlPo0CM+eSB7HTpP0hwLOqj8hdGN
 +Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZQ/+9oH8WDS9FGV3y9tSTDQVCQZ26UllDhjGlm8djg=;
 b=I//jJ54/z/lP03VdbiXV1JQemuJmiUGxB0EfwaKyKa9ghRSCEAtotU4GiHUSZGXnOu
 tjP46QO77AxxbovKBk4xFO5sHSR1goeSimLZ7MThaZHmNHA1HR3Y9qqYgEHhwiZAjQED
 IDjdEPGdcaItOiOH1jfrnfr6KQTgzzYhVQfGNuFIZNMuy53nhGf7Vpi3dANc3XavDJlp
 4IhawtPGpj7ou2Mm3Q3zW40ayjdKFFVGwDjldL+txvOVn5xy7NCvkq8VAiZp2o5HsZ2r
 X3bIlurDm0Xmjw8pkRlH0NzMiTLgOb7JdjAGBBm35V2EJIIXLx6GmlbMr5ov9YXpT9Ns
 6pWw==
X-Gm-Message-State: AJIora9MejSSk7ElGI/uP5pFLrXHukAgnADsDhzx853BNYBaknMLElgJ
 dh8Ufd+BmO5BTLEPde3ew4Ly4CWO6fRdng==
X-Received: by 2002:a05:6a00:23ca:b0:525:28b4:9e3b with SMTP id
 g10-20020a056a0023ca00b0052528b49e3bmr3563538pfc.43.1655747564483; 
 Mon, 20 Jun 2022 10:52:44 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 09/51] target/arm: Add the SME ZA storage to CPUARMState
Date: Mon, 20 Jun 2022 10:51:53 -0700
Message-Id: <20220620175235.60881-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2R5Lr03bAF2I

Place this late in the resettable section of the structure,
to keep the most common element offsets from being > 64k.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  8 ++++++++
 target/arm/machine.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 05d369e690..c3c7ec697d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -694,6 +694,14 @@ typedef struct CPUArchState {
     } keys;
 
     uint64_t scxtnum_el[4];
+
+    /*
+     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
+     * as we do with vfp.zregs[].  Because this is so large, keep this toward
+     * the end of the reset area, to keep the offsets into the rest of the
+     * structure smaller.
+     */
+    ARMVectorReg zarray[ARM_MAX_VQ * 16];
 #endif
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 285e387d2c..54c5c62433 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -167,6 +167,39 @@ static const VMStateDescription vmstate_sve = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static const VMStateDescription vmstate_vreg = {
+    .name = "vreg",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(d, ARMVectorReg, ARM_MAX_VQ * 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool za_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    /*
+     * When ZA storage is disabled, its contents are discarded.
+     * It will be zeroed when ZA storage is re-enabled.
+     */
+    return FIELD_EX64(cpu->env.svcr, SVCR, ZA);
+}
+
+static const VMStateDescription vmstate_za = {
+    .name = "cpu/sme",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = za_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(env.zarray, ARMCPU, ARM_MAX_VQ * 16, 0,
+                             vmstate_vreg, ARMVectorReg),
+        VMSTATE_END_OF_LIST()
+    }
+};
 #endif /* AARCH64 */
 
 static bool serror_needed(void *opaque)
@@ -884,6 +917,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_m_security,
 #ifdef TARGET_AARCH64
         &vmstate_sve,
+        &vmstate_za,
 #endif
         &vmstate_serror,
         &vmstate_irq_line_state,
-- 
2.34.1

