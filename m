Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5223358lfh;
        Thu, 2 Jun 2022 15:49:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQQKqVlvqrYIbnP+dxlhAL6vavPxObG6hycZMGuDLuDtlpQoKJ638dmoyO4FbPTeWU/9Ks
X-Received: by 2002:a05:6214:2626:b0:464:32c7:f418 with SMTP id gv6-20020a056214262600b0046432c7f418mr13173447qvb.85.1654210144902;
        Thu, 02 Jun 2022 15:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654210144; cv=none;
        d=google.com; s=arc-20160816;
        b=MsWHQfiWMgfvFjeN0JRLxq5xuUHJc3H+I8il2Af8yvnkht/mwqdlDuhunAozpJIZL1
         deqOYkBBoeG+kx0tQK6eyi6g9FMqLuZQi4RlPV7pUIRrUn7mAcg9Puinw2PyR67X4pZQ
         Go+ZHSbKd+tLe8cHbDvr+2XehlcXPQn1jXH0UB1NOcZnuJbuLSGj8CAoIEwJ3/iaX141
         3rFHvgV8QDkW9U+8RamofpdpEkhmijOLCygggWm6OdlfN3woi/y24Wgs6QPGK8XueDWs
         xwn3IQqC0nmcAGhLsq/z97/7Q32i9T1giTTSPof+b/ZMbSpdzkpr1bfwq/jn54t5OC1V
         uypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aHd4rex5KLokg6+1+Y3fFNXszj9You6Kl613kNttCcU=;
        b=E2ul2fOZBIOUPBpN4JF5E/3S18avVCFVcpsrxb8FMbHskEH0IKMzGYdOnJPBEBmWt6
         SaQQh7LiHQ61Mg7Gtlj+ilxdVmXYqSKj3mN9ALfDIX/Pj8PfyduOCqT6xOJjBA6e8Uph
         RMSMgi/g49iC0Y2IK2vapvqr9ExX9jtinQ1AQTxW2w0NcpEjY2CFc98dnWbjOSgSuj5C
         2GvO6XK1KVdNYmKBxTQ/KUike8EXJAp/5fo2dfs68fycCQOsWHqMo+VDJrYPaTOzDIqS
         zrwlxT9WNU85Avom79p/HJYvOLkTOUNcOjjaqWenCoi0QJGn9AqJaZi55bm5lMLOBjBU
         4kzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jFrq7X3n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n77-20020a374050000000b006a34c06d62fsi2535103qka.182.2022.06.02.15.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jFrq7X3n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtcm-0004JK-C6
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0001ij-5T
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskM-0000rz-DO
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:53 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5882540pjq.2
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aHd4rex5KLokg6+1+Y3fFNXszj9You6Kl613kNttCcU=;
 b=jFrq7X3n2vOjm1EoiPKRlOOc5WkVJw6gGEw0kWR/bZ5oYbkfVb2Fhr26iBhmYMG7rw
 FbLbzu+lw4gXzax1v740DlIF4uhnBMyCb5qdKQAsW6OyViogpkwI5oIdDytGAxjEiQlF
 wPBxVBHOyqNsLAdxYE9H5R0qiBvqreCRL6SsGexL7pJp+pGKMb1f3PbPqZjSYL2lHjqP
 E9VB4J0qtGOxNFPVOOKd47CajEPQDuMmXef8rpu563KRJck+Fyw3JhQu9263eOCf32Bp
 9T3ppDmwjyndHiRY1XxfGz4SUfeeZ8XwuhkEf8rAuN/XEGBZFFODYbvTtnoLwryqVPQF
 675g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHd4rex5KLokg6+1+Y3fFNXszj9You6Kl613kNttCcU=;
 b=JLhBJD7p9XKXSNlrQXeimBuceJieWIRRjOHqZOuQm3W86X8r3X1Xp8axSI91xOP4jO
 SYix9yr91saZtzyXJf4DP+ucvtW5xhZpC/d2eFn7QZJMMDrw4Y+dd9aQ7k5ufvcIp7tS
 yCJNdBFlySUMzFxCZFire21y0yxCt9JtUkDIy617g4mGbXMFoLeo9dktsFe4l/QPcjS7
 dqYfGvZy0GmFwZMsIYS0lPH8p/S8laLN+3a58D0GyQthxw3VjLN+0THuxKbFq3a+bq5L
 RJJUgCzSk+j8jnxbafUyyfxieBqt/v1PmjAbPOnhjiHKM3c9msLR+hgJn50x509ePAWJ
 y5yA==
X-Gm-Message-State: AOAM531cD8/uH8WgCf7fHnVud7SwhGBKWSuBbfvhRCm8E5xrZv36AAVk
 hP6jjOx3wCqWlvEeYi6qws4h7Q==
X-Received: by 2002:a17:90a:a384:b0:1dc:a407:b5ac with SMTP id
 x4-20020a17090aa38400b001dca407b5acmr7499555pjp.11.1654206769627; 
 Thu, 02 Jun 2022 14:52:49 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 63/71] linux-user/aarch64: Do not allow duplicate or short sve
 records
Date: Thu,  2 Jun 2022 14:48:45 -0700
Message-Id: <20220602214853.496211-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: b4sDwSDzkuYM

In parse_user_sigframe, the kernel rejects duplicate sve records,
or records that are smaller than the header.  We were silently
allowing these cases to pass, dropping the record.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index e9ff280d2a..590f2258b2 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -318,10 +318,13 @@ static int target_restore_sigframe(CPUARMState *env,
             break;
 
         case TARGET_SVE_MAGIC:
+            if (sve || size < sizeof(struct target_sve_context)) {
+                goto err;
+            }
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
                 vq = sve_vq_cached(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (!sve && size == sve_size) {
+                if (size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
                     break;
                 }
-- 
2.34.1

