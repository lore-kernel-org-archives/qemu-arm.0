Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3074436ejb;
        Sun, 5 Feb 2023 01:46:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8pFcz9FVPvzrL0kwCrLAf4X39Z3k0K5WqqvVSzW5FR/Fc+S6JopF1d7EmLZ/8u6wNUJqDs
X-Received: by 2002:a05:6214:2509:b0:56b:ed70:361d with SMTP id gf9-20020a056214250900b0056bed70361dmr5748393qvb.14.1675590387626;
        Sun, 05 Feb 2023 01:46:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675590387; cv=none;
        d=google.com; s=arc-20160816;
        b=uhjSoYDf20eBKt+MHEMpDSLYHZAXtDAnLl1IwOGTOsZiO7LCh+zxhSY7kDCL46Z0UW
         Ke1X9STsVs0KsH+KGt22/I/sRF6bXlacoYC2YdKhgB5qgbU9G6NZ3jTRAFMAhnZrsilI
         nFCLIygk0hdRLDYeM0PKshHBfJOHc4LfSthGtAvpXc+I0sEOL9VXN9OsOzjPU5Kvupxz
         T+z35+OeI4kZdfostLGE4aYUX9O9N+SD0xbpLWd9tAvn6d00lLdt4R0FrqLLh0LhLDJx
         RPxKfkm4zkfn4rAtiZKGHqJ0UXBIG1OFof4wKHS/3FsPcLMQTuXYFt7w7sU9kZtGnlYA
         wgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=6DE0/Utxelv22le0usG9jthLMRWON7SKkmZ8fA6Ht84=;
        b=M93jMM6G7FkSS6n7KsUGD6Unm45AdZCwEL92n7Xpyh+ZiKAs4Bx08P60t8vY5nt+6Z
         8Eve/0EZUOvTqkFmv//0kmQRPzWjU+VIuAWQm028bfpyfVUNldrzYBDpYK/sX+zoO53W
         x+DGcB/rWEGNl9m64u0Xmvym9DzP8XDZF/OG+JSJmX46GezLfLPg/aoBBaXDmatE/pJm
         0kSTreSWu1nzN5ooPgQekF6o2aVE4eHryUO8Gd9AQJmdHaMXO64e01IaEuVjaL4QdAYK
         9osLOzNi7y6X3geJTL1yIVP7uHk2tXK55HM0CFbIT0Msg4n8mZaQ9Re+96iFvZmJ9xhn
         O6bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=A7DbTiKm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2-20020a0cf582000000b00569b5d8716bsi4297094qvm.182.2023.02.05.01.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Feb 2023 01:46:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=A7DbTiKm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObbF-0006Lj-EO; Sun, 05 Feb 2023 04:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <303rfYwgKCmwcWYcdKPKQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--smostafa.bounces.google.com>)
 id 1pObb2-0005EL-IQ
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:46:04 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <303rfYwgKCmwcWYcdKPKQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--smostafa.bounces.google.com>)
 id 1pObb1-0001ap-0K
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:46:04 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-4bdeb1bbeafso92719857b3.4
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6DE0/Utxelv22le0usG9jthLMRWON7SKkmZ8fA6Ht84=;
 b=A7DbTiKmLazlCY1Fx5UeKRs80eTPs6zppJKhi/8fqaLQ7DcCSTHj2YqWg77xwM3dOw
 /+pCLYAiE31otWLCtbb7W3hkXWC5B5SOb9tP3YRj20KJ++WJNr5VuXjLpzG7gzbA1MDn
 Yv9uXIiRy4ZvB3RUDS0lkGFQ8WMpsjSWykkesQhJ/4PZ0TQzcTpd9ca8e2elBgTKcL5R
 UQXB+ieJokbOwOt37LEh/Z1FyWbq3tANvYLr6eaUp6w55GlK8hT4q+9nte9JZZE3djLt
 TTn3hnbLgBYXbzNFT7nYaNNMsHL2eQD4QcpTdjcqJLPYNg9h6Gg0LHuWgvF5zAi8jkso
 sDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6DE0/Utxelv22le0usG9jthLMRWON7SKkmZ8fA6Ht84=;
 b=mGaIz0IHcmjU16Gfv0i/Oda2LioDg0Pvs2brL6v97X3vs+OT5p5X4T+t34pF38Nqcz
 ywXTBMO8k/zfYLKW6xfPERoA/9nEY0ISJgjJLV4nSUYKwxNovlYtMaWktK/1zlOolAoE
 2BYGBaux8sxC0CTMqTlBaY/LyaErtt3Eh92gAB7Qd3ijFL1ocTHIk9U9w6PLxuKb851z
 HAqZO/dedFchWxLSNtzzW5HiydlAAAQnHdAdVt6fKtaHYO/kTQzvsrgFAre9KBhQUX8S
 F2CCV0DVFYGLQ3NyPqDGVs7rrPymf7LuUS+On0mDkm4mCH1vts5/kSJOYU4BjjM9OQSF
 xp9w==
X-Gm-Message-State: AO0yUKVRoKzTVU0+jAvTm/SKwp6ogTkxJ5dd3ExsKH+idb5DAGfh3xfk
 eX0nX9M8e2y+kVFEo2X8ogeHx3IZ3zGhtfy+HAfIshTF8D2mshDJVUR7Y814EFe9DGmg/w93yai
 K0fzRSuBBP+/kxVDs8RsCtibjWmWMJp1v+StJL6Xh8cIEWtbfeRMv1odqZdPlyZzuug==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:690c:10:b0:506:c617:9e38 with SMTP id
 bc16-20020a05690c001000b00506c6179e38mr1928075ywb.54.1675590355995; Sun, 05
 Feb 2023 01:45:55 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:11 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-17-smostafa@google.com>
Subject: [RFC PATCH 16/16] hw/arm/smmuv3: Enable stage-2 support
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=303rfYwgKCmwcWYcdKPKQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--smostafa.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: FiXLkecPRtVb

As everything is in place, we can use the new system property to
advertise which stage is supported and remove bad_ste from STE
stage2 config.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 5f792d96ab..4b66760104 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -256,7 +256,14 @@ static void smmuv3_init_regs(SMMUv3State *s)
      * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
      *       multi-level stream table
      */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
+    if (STAGE1_SUPPORTED(s->features)) {
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
+    }
+
+    if (STAGE2_SUPPORTED(s->features)) {
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
+    }
+
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, COHACC, 1); /* IO coherent */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
@@ -451,10 +458,6 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
             qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
             goto bad_ste;
         }
-
-        /* This is still here as stage 2 has not been fully enabled yet. */
-        qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
-        goto bad_ste;
     }
 
     if (STE_S1CDMAX(ste) != 0) {
-- 
2.39.1.519.gcb327c4b5f-goog

