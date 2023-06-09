Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp289776ejb;
        Fri, 9 Jun 2023 03:49:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4o3qdmc57/Tg4QN2Rc5vZmT/TFIxJZs92v+dxTYQa9mwY+baYnRU6HTupUXrKYQtEtH05q
X-Received: by 2002:a05:622a:c7:b0:3f3:8f39:3473 with SMTP id p7-20020a05622a00c700b003f38f393473mr1249253qtw.26.1686307771025;
        Fri, 09 Jun 2023 03:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307771; cv=none;
        d=google.com; s=arc-20160816;
        b=Jqquia4PPRDTFzfIF/5pVwUJ9NMSBdmN0qLEEX4+/llNpIECZgT309oadpCyp7NsEp
         x/gix7m+qBBpc/wprJHVRjB4TH1s7hJyYJATPu0Xb0uC6dCq+KqaUEU40D5YUmhrv5a1
         VqrRlhnFNJzOarKdyJKcOHuQPfgNIRWHXIa7sviVps3SNb85JLhoqHdu0ggpM1aRY29j
         SyljohkMFH0yPm/5VX6I0iDdFkRD3h8LEeD576knwcHdEIAZCTyMCFkxYAPQx4gsbBAR
         G1bP9qBxJc01aKKFGj4cA/rz3mUIg7RCoX4GjrizupJZWtcXR5RD15tQXA+ZpNXI7qZe
         Q//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HO4ElovXhPPVqY3d9dQ5jLZihQteSgO+eNPRlElmN8w=;
        b=PsulnVUV25QuKxX+HiP10eEUOx7WaAJx9zm8d7c4z4bFI3kQgQSBbWsA725QaStV/7
         Tg/rTgfcuJTLFRZm5Rwqi9SumizaOPHXNroJctIPoQSmCot/sb0dy/ovTd8CT2WfdhVA
         1CFnmH+R/is9tRkPVWZf1opRzavnIq/eJVs1gh41r2uG2T4ohQSugGK6A67RQNDYUO8I
         Aw/cFhdZ74UgzPW0QW6L3THg+z9eP5I8VMevjuN4DAXyX1qS0Tt+M1hNzBa/geN1/IGz
         kSHidLDKxdSmpgCxjdu+GWTFPhkU6VAEuTma8Gv9MJUcl/uoVRGAjFCoNdtNQ+3g0cdm
         3GPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jle23IzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020a05622a001200b003f86aecb4bcsi1896789qtw.581.2023.06.09.03.49.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 03:49:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jle23IzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Zg5-0005sh-74; Fri, 09 Jun 2023 06:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zg3-0005hn-Kk
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:49:07 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zg1-0001bU-NQ
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:49:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f6e68cc738so12041465e9.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 03:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686307744; x=1688899744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HO4ElovXhPPVqY3d9dQ5jLZihQteSgO+eNPRlElmN8w=;
 b=Jle23IzQ28tPPzxtw2cQdi42GOaXWglmO/Zdd6mx8lpnwmly55BsPm573Kf1f33JBL
 i0pT5UzsKV3rCc+2CzwYi0aixtrdOnXRVNkPyIYVCsxSKchJ6e3sKzcouMAE0sCfTB88
 KDFlIF+eE0rcTIW+sZvDB89LDzLVQg9x0Zqqu9ucpUxhktFZkwgjiDL5amEJdb9SxDFJ
 QyKOLYaFq29kNXSjWcgFfXaEkfhIAaIqTHjS3yScf6TEUkMSYleX7KXWcHjzf7dZiGxm
 OUkktRcxyMjg9xTvZixHg4kwU335gfrY4Ce6TsE/GfcWaAGa0L5KW+OlWRhx6bJl6LEE
 2pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686307744; x=1688899744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HO4ElovXhPPVqY3d9dQ5jLZihQteSgO+eNPRlElmN8w=;
 b=hli6d3Ri/x1Ll3u+5u/++1HDDZTKZf0sCILMZbSs7DS7op3J6WK+QRSJd4HO/JDZIN
 3FFy0+HW/P9lfAo62kbollUTM1SLQclnzrS7ZB+yPzWANvUpS8iMQdIU2YeBWMteyVye
 fP06kSVBJHJjSPeu7XlpyfU9qAEHq74uoGWjOe0PPkIckOSwEbcRQf+gTsbEpnf94ajU
 pXL1PaodJHRdU2Enq5Xywl1mth6nhlRtBSbuYL0YgdfJiTBu4Ms9IdjyHMTw+rCGDUk3
 165LwEn9+mW/u09SfMj/ktDmHSQ8gWmt0Hpjofx2MnDIAx8vRdQPVDSv+MmsVmaaEqrE
 j2TQ==
X-Gm-Message-State: AC+VfDw516sINqie+3Q7ew4TwkzQDAlLYxxgK9+dXvWYJtwNPQ97mH41
 n3fNcX1WvdybXIizNm0rDXMFVg==
X-Received: by 2002:a7b:c4d0:0:b0:3f7:376a:ee60 with SMTP id
 g16-20020a7bc4d0000000b003f7376aee60mr653047wmk.6.1686307744381; 
 Fri, 09 Jun 2023 03:49:04 -0700 (PDT)
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a1c6a1a000000b003f7ea771b5dsm2352825wmc.1.2023.06.09.03.49.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Jun 2023 03:49:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/22] target/arm/tcg: Reduce 'helper-sve.h.inc' inclusion
Date: Fri,  9 Jun 2023 12:47:11 +0200
Message-Id: <20230609104717.95555-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230609104717.95555-1-philmd@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NpDEeru5hzV+

Instead of including helper-sve.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h            | 1 -
 target/arm/tcg/sve_helper.c    | 5 +++++
 target/arm/tcg/translate-sme.c | 5 +++++
 target/arm/tcg/translate-sve.c | 5 +++++
 target/arm/tcg/vec_helper.c    | 5 +++++
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0cbffa4097..8983489cf0 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -558,7 +558,6 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h.inc"
-#include "tcg/helper-sve.h.inc"
 #include "tcg/helper-sme.h.inc"
 #endif
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 121859f66f..01dd13c955 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -34,6 +34,11 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
  *
  * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 9419aaca4a..571bc10471 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -26,6 +26,11 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 /*
  * Include the generated decoder.
  */
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index ff050626e6..45a36760fd 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -22,6 +22,11 @@
 #include "translate-a64.h"
 #include "fpu/softfloat.h"
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
 
 typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t,
                          TCGv_i64, uint32_t, uint32_t);
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 9b00085095..972f538c63 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -35,6 +35,11 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 /*
  * Data for expanding active predicate bits to bytes, for byte elements.
  *
-- 
2.38.1

