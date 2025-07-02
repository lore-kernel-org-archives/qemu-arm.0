Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3709592qtb;
        Wed, 2 Jul 2025 05:44:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTEBBdnujSBoUagbWOx3kjGf/bWEfkITTFxRxOKC5Iwi9ARvebetD8F571amsNmoOp5fWZEE2+O+ZhEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF3A9dITUUbtByR0kAwd/mYqN0Wat10siEbI2wYb/3u7Wk9T+YqVwKLqgkcW1++KXmpegrS
X-Received: by 2002:ac8:5cd1:0:b0:4a4:4166:6076 with SMTP id d75a77b69052e-4a9768b7b36mr57107321cf.5.1751460286235;
        Wed, 02 Jul 2025 05:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460286; cv=none;
        d=google.com; s=arc-20240605;
        b=hVuUDQFw0/6NLkcrmqabt/8VbDDQWUqdfTVmRBQXcg7E5kzPgF7C9ceQ0vVXOcGNGx
         yVB3rZTOdeGgaD0cNdXiOvFO0B8Q1evJRL5+5GzcoHBUMvwJH++uhIzv2XhVnFcoEmwy
         QgZCijqgurtMZozz0u+4/pOn4gQxeI7XyoBzKC+mwtNiwmIOpMuW+d649XZlJQWuS1RL
         sBjHXTWDg36jCGTjJawVkCC8k50mfba9J0NH23CJ63TEfBBA0hQ5B5PNWZ3b4RAvlo0G
         CGmSeq9CcR/Ah9Fj7BdGCvJUPSTesJX2Li9KeyO0NVxsGOSs1gRykoPV6oyKiE4MR0nd
         tpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mhQUB7hyHDeuRRxTVEXkMU9ZRf7I73lwX5zX+yyMAK0=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=G/EQ+LSCfyeBiGZuKv3jSjQoqt4/TnKFW3c+REGDXoyKkAH5FZ+nklgJv8xXZOSNOP
         3+MgWFRKJWYCpFTg05euE7Mr/JFTbAqnKKsWY9BGE0RbhOXjFSH9z3D3h9Ei30vNs5rT
         n45j5mq5+cS27A/v/B4TGTJvHM+Vs098PTv4yoY6CfWnwpFqff92MuBPRyKc0WnGMffa
         89ftxZUX5pVY3mc+EIpYPESw/WgRdKuO9opZxI3G30O3cPhNewcRlW56+gd4td5mkwSh
         OQqwTa40w0vndskBs2YGXR+NMby+Zkmakh8tMCpUnX2iqAo5SpCerPiSzX4pEH7b3gul
         c3Qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOiKUZTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e7e75si126813951cf.276.2025.07.02.05.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:44:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOiKUZTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwfa-0007Rt-Jc; Wed, 02 Jul 2025 08:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfZ-0007Qy-1r
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:34:33 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfO-0000vl-Dh
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:34:32 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2ef8dfb3742so1093374fac.3
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459659; x=1752064459; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mhQUB7hyHDeuRRxTVEXkMU9ZRf7I73lwX5zX+yyMAK0=;
 b=VOiKUZTutNNEzuW8XCeLzO3gMyUreWQO/1yFleQv4QmRHQXeV8xrMFhRVCXNNFLm1N
 TxktaHvGCHgeINJZv4hNdxJx2JZVm8qxPM5PZM7HMjiZDqyvC2NHIf4LYEZDe9q4w7pP
 i2LzqVzLIvHi1WKeQh6pqAjiiD4a0IjsrBex0/7WXvxRKAO9j15qdgDh4xsp5ZU43MNv
 XqFuYJZZUJdLJZpnzfk1XsIKPnMOBiCPO2dCSHKChgX0o9DbzKidQrWSTIFh2WwdSFyI
 yYTlosYKwLH5VeHoeO8iTVLMJUSr5E9t3USFapTAn8UofJOMz6Vq/4jiYaIYIS1qoBvH
 DYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459659; x=1752064459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mhQUB7hyHDeuRRxTVEXkMU9ZRf7I73lwX5zX+yyMAK0=;
 b=IkPMi7mEwap63w6BajzQ0mbq6q7AtzCHwXgCYNgZi1PgVAmDXWJ4KZBuVzkp9TOZnP
 ftN/5xvVR6YicOSTSvEEnST590sBiYNo5jO199rlRNiQc0bF/aJy5g9VfCI1J5Bo2r+f
 N9vEpmYo66t4SiP8hIMoAwt5lFa6rboZZt0tZqMrq0JLrZ6GNZMbnBTf9SbbcfDUZnFW
 2+FZE4N9nykU8l3akiJCxs7rPYBuN3cV2Grfwt0M9q0DJpo6jxv9hiagw+lUyoUGQyKK
 qmL4YtMUIydhGOzl37Vt6OCSnmEga2IQNRwRRPGD3UOLttmOYJmRAtMxaGldi9IFyq/V
 4uKg==
X-Gm-Message-State: AOJu0Yzez6+w8b3khNIdNklaJkxmzgtCZEb0VKDlDNQG8XfeKy82JU0O
 shXCu1T/B6jqxsMcTNOh1IwqxywwK68wTv4Zw5enozay4YzQVI2OG5atd5NqsgJha1M=
X-Gm-Gg: ASbGncvJB7IwG+AhADFbz85dBfeo1707ZfQdOvMfOvggXs//tHEQ2ALVFyKAL96BSPO
 yxgMRgYgo1qmE9rFxrkqlC54XFtbCIpEcchl2CowjBM23s1mfCPNLqhWNq5sEmtChq8y0GkRXRX
 2lDh7990+l8ZMbgThs0gENiykyusdh64EIJhj5yNsKpsVgxU2mWsTTONdXJL2efF4iWjlYHr3m/
 lSA9qXo2+wMYdUCiYHaE+K13insAYlF2ST2Ao6E+Sr2+FijTgZXICI+FgXAY6r1kAWNtJ0pP1vf
 efpjv3BdgPV6Z3OC2wDx1buHEPChk/gB/AFYBYrAq3Vuk9Nl+8RkwY/6v7zQXfEuAp5nog==
X-Received: by 2002:a05:6871:89:b0:2e9:1fae:4aef with SMTP id
 586e51a60fabf-2f5a8a4eadcmr1921677fac.13.1751459659480; 
 Wed, 02 Jul 2025 05:34:19 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 05/97] target/arm: Add ZT0
Date: Wed,  2 Jul 2025 06:32:38 -0600
Message-ID: <20250702123410.761208-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4P9ntiERuTH3

This is a 512-bit array introduced with SME2.
Save it only when ZA is in use.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  3 +++
 target/arm/machine.c | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a6a54a605a..f3c83702f4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -715,6 +715,9 @@ typedef struct CPUArchState {
     uint64_t scxtnum_el[4];
 
     struct {
+        /* SME2 ZT0 -- 512 bit array, with data ordered like ARMVectorReg. */
+        uint64_t zt0[512 / 64] QEMU_ALIGNED(16);
+
         /*
          * SME ZA storage -- 256 x 256 byte array, with bytes in host
          * word order, as we do with vfp.zregs[].  This corresponds to
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6e73368ef9..6986915bee 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -321,6 +321,25 @@ static const VMStateDescription vmstate_za = {
     }
 };
 
+static bool zt0_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    return za_needed(cpu) && cpu_isar_feature(aa64_sme2, cpu);
+}
+
+static const VMStateDescription vmstate_zt0 = {
+    .name = "cpu/zt0",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = zt0_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(env.za_state.zt0, ARMCPU,
+                             ARRAY_SIZE(((CPUARMState *)0)->za_state.zt0)),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool serror_needed(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -1096,6 +1115,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_m_security,
         &vmstate_sve,
         &vmstate_za,
+        &vmstate_zt0,
         &vmstate_serror,
         &vmstate_irq_line_state,
         &vmstate_wfxt_timer,
-- 
2.43.0

