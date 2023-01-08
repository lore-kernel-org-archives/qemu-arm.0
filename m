Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1330010ejc;
        Sat, 7 Jan 2023 18:53:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvgDJxvB2deCfdGlj0uvEIfG+kqXFN+cS6A4zfR8dCiCb2yU/jTlUCCeh3VUXajdU3r4qTy
X-Received: by 2002:a05:622a:5814:b0:3a5:af69:408a with SMTP id fg20-20020a05622a581400b003a5af69408amr104921259qtb.67.1673146402187;
        Sat, 07 Jan 2023 18:53:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673146402; cv=none;
        d=google.com; s=arc-20160816;
        b=EYxrALhyCYrez/nwM10cWoq/PpiXSwnNpX4zQUOb3y1XUrSOPL85yJ+S9DW68fas9H
         NbJro7sp6l+KMmAc2IREk1APcAuNsFlIPLrzCv1MIlD9yxVqPh51du7UsVm5m6alOhGv
         uUQlc23szPnPvgM5gbn5Xnov4A/X9uojiFKjEQVeFxrnH0sbax9ggbRzacXmq/lKDQYa
         HWSH8DkSQiwx+nfY0gGO4kc/1UtgSUVqgrbDKApO8724CzVCaoPWbSOuLBf+DxxAi7z9
         6eH9ken/ihwfdpWpth9vk41thDiwnTAdBtyCVtUEkmijyxFoBJSqpW8pbKQkwue0KscL
         bl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KwGYqVGD9ayC3AoH0H/svPpb9D46lwJjNWaf8TUEnLU=;
        b=gFgMav6fJMXAOIC9vvo0ASwj7Xcx6jK+OG7LY8jjUIEzC6ZnsUUYvaQ2EM8jNnurQ6
         gtcwMqvq9gUgPLIZdXp16Kr9LNvhj6OvaTFZodQtzRI2ALlxIMmUHZBD73INhsLObyj9
         6T43WfDGY0RuY3TIJWoTRMLlBWtYvEaCi70V1nc+zmoF4eyc2oTGQUL0XJYuRxmXecJr
         IQOacj9OIAjrUSbN18+QAf9bxfufB7onZrAbzoJW4Dqe9vUZde8a6O1kIoNywnn5vQ/2
         T93Jwb8sw+nNyKC33fKSgjDjL43nvtZ66nHzaT83BR0Zdi2U8sBoNqJIVLr2N4zRbmn3
         d/Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wo92Lmrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a05620a414500b006ed88c5e84asi2998122qko.228.2023.01.07.18.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:53:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wo92Lmrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pELZI-0004rc-ET; Sat, 07 Jan 2023 21:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZH-0004qb-0R
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:37:51 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYw-0004Xy-4M
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:37:49 -0500
Received: by mail-pj1-x1029.google.com with SMTP id bj3so2175120pjb.0
 for <qemu-arm@nongnu.org>; Sat, 07 Jan 2023 18:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KwGYqVGD9ayC3AoH0H/svPpb9D46lwJjNWaf8TUEnLU=;
 b=wo92Lmrg8YD5vmSAR4Njag3d7RjIflVg0qFT/FuisA8HWhC99wUN6pl72nAHTHIXC1
 m9qx2+ZH893MqiWmY+ZKAOMKIMOybMJ+CNP82Wn/2U7Ihku+KQJz9oddghm+k6QqLbY+
 /T+hysSGmq6i9kOGePI8M25ZlcAb3W0eub1ZvUInIqI3bK8DMIOukN2Y2RUEWTjchQPr
 YPp/mdD+aqWKlC8zPhN1Xn7PbIGuuyXS3Q8tzsHSWvU836rbpVaBHHKMEpfeySPrJps2
 kY/3EqK4L5ZHCyGHndh7yLAvasBEFFEYxYjbAs4XolIH+si8uitooS3Bh0G+wzyi4RCp
 6tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KwGYqVGD9ayC3AoH0H/svPpb9D46lwJjNWaf8TUEnLU=;
 b=m04ZORD16gUYX95N2DwIhVV7hvo2ra6MswXTuY77r+AI5h7NXLtKjIcPPAzVcwr+2c
 rWRPWtduHDcQUw4kEuYqBWMSxVIxCAMi6pSp78+OjyQn+09pw9bK2tN7RHfGwkyrXTjd
 DuvT1GUC8xSjLO+LVKprJp5jgEKt1FO2PBR/Y75p+drti0Iw/iGlhN/2loDbQw4hKoDv
 5ls+6IgzpszmUMboJfyMepr4vT0XbN3shkvcOHMg2GzA19yoklN79kGR5aauN3KYzpU6
 qiZDR/YwX32VymfB/ruMZUXGUPgGDVH9ilF8Q57xLEgLhwPE4jSGeswJcHrvaWuimJ7x
 EIOw==
X-Gm-Message-State: AFqh2kqu3bezFhVAaepTu7WDd9kVSjVB/gQJpGIbgM5gobi9JqRcXq2e
 2maKM/9GxQ6UqPmqvCTDgXhb4Q==
X-Received: by 2002:a17:902:7c08:b0:193:13fc:8840 with SMTP id
 x8-20020a1709027c0800b0019313fc8840mr6381304pll.21.1673145448869; 
 Sat, 07 Jan 2023 18:37:28 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 07/36] tcg: Add TCG_CALL_RET_BY_VEC
Date: Sat,  7 Jan 2023 18:36:50 -0800
Message-Id: <20230108023719.2466341-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +F9tlaLfR4Qa

This will be used by _WIN64 to return i128.  Not yet used,
because allocation is not yet enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  1 +
 tcg/tcg.c          | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2ec1ea01df..33f1d8b411 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -37,6 +37,7 @@
 typedef enum {
     TCG_CALL_RET_NORMAL,         /* by registers */
     TCG_CALL_RET_BY_REF,         /* for i128, by reference */
+    TCG_CALL_RET_BY_VEC,         /* for i128, by vector register */
 } TCGCallReturnKind;
 
 typedef enum {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 092cdaf422..c032606b21 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -731,6 +731,10 @@ static void init_call_layout(TCGHelperInfo *info)
             /* Query the last register now to trigger any assert early. */
             tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
             break;
+        case TCG_CALL_RET_BY_VEC:
+            /* Query the single register now to trigger any assert early. */
+            tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0);
+            break;
         case TCG_CALL_RET_BY_REF:
             /*
              * Allocate the first argument to the output.
@@ -4576,6 +4580,21 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         }
         break;
 
+    case TCG_CALL_RET_BY_VEC:
+        {
+            TCGTemp *ts = arg_temp(op->args[0]);
+
+            tcg_debug_assert(ts->base_type == TCG_TYPE_I128);
+            tcg_debug_assert(ts->temp_subindex == 0);
+            if (!ts->mem_allocated) {
+                temp_allocate_frame(s, ts);
+            }
+            tcg_out_st(s, TCG_TYPE_V128,
+                       tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0),
+                       ts->mem_base->reg, ts->mem_offset);
+        }
+        /* fall through to mark all parts in memory */
+
     case TCG_CALL_RET_BY_REF:
         /* The callee has performed a write through the reference. */
         for (i = 0; i < nb_oargs; i++) {
-- 
2.34.1

