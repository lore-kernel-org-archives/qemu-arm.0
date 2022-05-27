Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1258654lfh;
        Fri, 27 May 2022 13:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9BBYubwlDZne8Pr2FaKEQiGbkBhOAVbsmUMsFMt7rwtp45hjBX9XhtIrR0zypuKusshpJ
X-Received: by 2002:a05:622a:1483:b0:2f3:ecbe:89d3 with SMTP id t3-20020a05622a148300b002f3ecbe89d3mr35318808qtx.253.1653681932145;
        Fri, 27 May 2022 13:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681932; cv=none;
        d=google.com; s=arc-20160816;
        b=MdRsrcczVm7Cq9/DcG4wz3cZLh3B3nlBVWxYNdjnTPfn0oGQfrDvYwax9jwEGI4T9i
         OvFdzkP0ERahJf/0l61Xt1/YmPHe5GcMMEZlqb0fOdLZtqKIG4GgI/MCV9Vs3jJahQqU
         KwZ0emEoGCQUHE2ms2NMKFNgvBOWSKdF42uAsRxktIVYBTf7tttptZMJ3D11PEvV+dZD
         70aglfxdOMU2miWB3wd9Sd+pa4SlUv/6xl7AdW9SG6J9NwQiCA448JDcVV6jqdaL16y7
         UuNzrFBvx39q5643kYBZW322PvtPrlstNL9qlgBnZggLZXHqmYoubAZ/1aVmbBCnBXJV
         BeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5vgUVP74YRVFsnCeUfD+lgH38oMFXENYiUeI4E2695s=;
        b=WG6EWzDn9tCG2tv7y53XTtZQzjrVdrJua/tDtKaBHFzvXp9Ko+jfJvISJBSmflq4bC
         dK/Fl2tAhqsQgl3+pcKXMoLxWWc/HC9Udahv1bivsOW2NRA5+LR0DxDrQV8DyfwghbJe
         cvTEpLlD3xngLkvQVZlSKlRFcm0AFU+PomoR5ugy8zci1g9TkJp2trjABWaUYQG/jHCQ
         D56/RMB/QVtX0BVtRmDQHG8pJBzA9wsRP0A8SKly/dsvUw4WjcUkA/iG7Uj1MCD800tN
         /dAgNdBrdR73nOeNcAPsUcCCwBh8dQKM78HSkl+72geonpK6+y1EpcAsHNM4GlVV3/bq
         SdTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ty08mZ/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19-20020ac85b93000000b002f3cb71c798si3240198qta.594.2022.05.27.13.05.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ty08mZ/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugDD-0004ws-Jv
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefn-00021q-Qp
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:55 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefh-0005PE-LO
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:55 -0400
Received: by mail-pg1-x52a.google.com with SMTP id j21so4556012pga.13
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vgUVP74YRVFsnCeUfD+lgH38oMFXENYiUeI4E2695s=;
 b=Ty08mZ/fwb7xKloB/7EyPtQGfyTHXfn3722JkXN5y3VPJEcdcrnDPqb4eJv6GxFKQc
 5Fig2vMfF76ryswwJmtm4zcIG4Cbv9zeBNYjZ+H/YVQmWYXyjZbS6urm/Y/gN6FiXhiu
 ZawABUGq/QrmudwwQBigLj2pW0MOhqwgpRETdzhJXZ07TRp6Q8V8/SqFSYwezV2Vqc3n
 nHrRJGsQR/v8MTSFigZQ4QCHtH/sR6vEVq/5uXV2LWjKhraboLlQTSuxypipoaSae3tq
 Zl5wc625WsR6nM8AWeSdBsv0riyQPmef3Pa8sOjGsY4rf/vns3ipCc0PyMMvB6Rp5hgK
 FQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vgUVP74YRVFsnCeUfD+lgH38oMFXENYiUeI4E2695s=;
 b=ijfq76k70j24LW9whsoIxXzWFjfmoqBzqcG9V/Ruuf1ONzb8X3/q+WL9GEde1dMPr5
 PxlBzU/ULdoDneUlbb+6LrImyxcS7j/XdSFawIT3nDrPHBhqGCUekFlRPbmCjKuKfhF9
 VbZvTjU8rQQ6EUaMUQCsrQMJsJmJb4FBYw/vMTm6Lj0d9x4vN1H2xOwr5AkS4uTT8U2R
 RSNq2tX01RF4doK6U4kagQOSP2HtRZUTPzvcp72+aaW3yTlnKj9N7ZQ/HyDVRT/F8ZRP
 SeaXCc0c979/v5u5IFMnpimIIKjSN9UJ9s9wMqSY0sYCL9K50CWRteGCYeavHYiKFP9o
 4GMw==
X-Gm-Message-State: AOAM530Tf3mBIahYs9d2E7mGadLdc+N+m+BGN33h+TGZxdw9um9Tn52W
 AAenUZ5PYzAH8KxyOIV4VvPXgEBw1zkSww==
X-Received: by 2002:a63:2a8d:0:b0:3f9:d9f9:a5c4 with SMTP id
 q135-20020a632a8d000000b003f9d9f9a5c4mr29068405pgq.614.1653676008338; 
 Fri, 27 May 2022 11:26:48 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 106/114] target/arm: Remove assert in trans_FCMLA_zzxz
Date: Fri, 27 May 2022 11:18:59 -0700
Message-Id: <20220527181907.189259-107-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MQVcDuOkF38B

Since 636ddeb15c0, we do not require rd == ra.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 886cf539a5..436d09b928 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4027,8 +4027,6 @@ static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
         NULL,
     };
 
-    tcg_debug_assert(a->rd == a->ra);
-
     return gen_gvec_fpst_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra,
                               a->index * 4 + a->rot,
                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-- 
2.34.1

