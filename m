Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1502144lfy;
        Thu, 6 Aug 2020 03:50:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4CR5n8mpnagVrYeY1QNt/PosAyG1vdsoqPvDqSOsH8zLxYgySQtx+LaRIKt663098dsHy
X-Received: by 2002:a25:e045:: with SMTP id x66mr10484061ybg.502.1596711013925;
        Thu, 06 Aug 2020 03:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596711013; cv=none;
        d=google.com; s=arc-20160816;
        b=PqeB+zI+LwjR+OyVW701TYafOhHpHHC7YdUfiMue3c9ChK9OJBiAQoR/Jv9q/Wwund
         tGC/Xa0b1owdAkYXzK+b7QEMAh1vaLb7ZMFffh5St7HM4bWQJcwTzjEVFvJjug+91ASa
         d7d7REP7uRJXGTOUeaTu7iW5xiURJCF42mvmJ49c8exEXdW2jip+Nq0IG3CclxxOrfSK
         C8QGmQr6TXK+i5blICijRCh1p09I54ae0aQfHW3u+jBDp4t+QVzB2yWseXzwHGdSullv
         pLIzBSsqI42eB5Q7f4LfH2tkSFB0o3IU5QJwOuiQkOjgoY3V2jhAgMVn72Pzh3ZRtWKv
         eQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oVvqKqlUGUYnxjk1oIPFfZzk4tyrvTEr7tv+ZDt5Avo=;
        b=Nij3bop+dmsiIjJwrvr5ak1mSHRRAD2n8eYYb44DG6QYjexWR3ucb16+e//HGnd8mv
         Ooxd5DIaAUjUEyBqyaNZbIIj1ysTApAY9n5iB34KIvaXFGOURJznHgHWD5FVITLCXJd4
         U49Ir62jD4dbnkVwoOW1A3krAvjvKOHnevmQAbnxsRCKQKVfnt+WGxknoykq8WilFWBt
         +7MSNn/cBbTRCxvjmArZYpYAAHtheuaBHg+ZO9tpDpw4EtZfRO6O+s2wO6nIWNGRMb+h
         cWtvAOND4tSOZCB55oNcJ90ucidKKiiOU1RAMGbIhV/xcw+WChYA2di7tv41EGY2Vfrs
         u2GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bcpn54wM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e201si4763048yba.42.2020.08.06.03.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 03:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bcpn54wM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3dTR-0004dZ-9K
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 06:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3dOa-0005an-CZ
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 06:45:12 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3dOV-0007JI-6C
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 06:45:11 -0400
Received: by mail-wm1-x342.google.com with SMTP id k8so9219497wma.2
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2020 03:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oVvqKqlUGUYnxjk1oIPFfZzk4tyrvTEr7tv+ZDt5Avo=;
 b=bcpn54wMF6GymuKOsDDLoxwwiEsFleU/5z/m5wJq+ndG+040IDN1YSAwPjlcBZAlM1
 UN1d0f12Img+8uKgcN+VvlgSG+e04JyPU2KoiZsxPGuJHppTFAIyFIOEMC4qHeXJqgXc
 XxHf8YyxMpQBrXzm+7WqWu9la0vFrCmIdl0G5hZJXwnz5iS/lKQ8ZgROtOV4EAwbc4VI
 mtSA/+fnD9YfkTUFzKwGcxu1jJ4eH9Ur+rDZBYX3B6yzutnEaINQmYgpE2FTf90iAYM+
 sdbMC4yA9bD3m5Lu5t4eAhGrhxDBVgKyTjjAiWI3lC+/mwMsRVY/zXyAwDyiOAbAtHcZ
 SS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oVvqKqlUGUYnxjk1oIPFfZzk4tyrvTEr7tv+ZDt5Avo=;
 b=p//klK/twLkqeK0B+ioZdTJPgC5qgXr6MynGGlh8qU/FeZPEiZ6rI2+ZvDLlMQMAKe
 h0nBCfplMFsFPSWSvQDTT7ddAMdSfrY/cCSFsc/NNCho6SDcApTHvEHfDjQv2FlhXUzY
 TzwnUgm/Xu6fbzZXfumtfCdQcwTCQVv5txlz9DaS8uKPhXvB1ydKYgb38nz+4wMfV4Ui
 f16gxkqy9QpZ1G3IRzqpK+a3q7LgcZwu0CDHtr4i/7qciudG8KDchJmgDpMoV8aG1At2
 9OmKcAF/IRYQZmtvvkAgGPxzkOA2NjtOlgvkfg8HiKhb0AyEmQuMgebxgXji8hGF9PL6
 4DVw==
X-Gm-Message-State: AOAM5326Zd2IvZ8ZP5TOif3cQkqGmHedxRPTt8vKDmHvZxXmWtoYUVO3
 hdSRHMFU6jMtMiwFgvUTAFdqXiPaT7ZrAg==
X-Received: by 2002:a1c:c90d:: with SMTP id f13mr7586788wmb.25.1596710701609; 
 Thu, 06 Aug 2020 03:45:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a10sm6042189wrx.15.2020.08.06.03.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:45:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Use correct FPST for VCMLA, VCADD on fp16
Date: Thu,  6 Aug 2020 11:44:53 +0100
Message-Id: <20200806104453.30393-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200806104453.30393-1-peter.maydell@linaro.org>
References: <20200806104453.30393-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: xf8zj6HIPD9d

When we implemented the VCMLA and VCADD insns we put in the
code to handle fp16, but left it using the standard fp status
flags. Correct them to use FPST_STD_F16 for fp16 operations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 5158dd14ad2..96e27e28009 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -181,7 +181,7 @@ static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
     }
 
     opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(FPST_STD);
+    fpst = fpstatus_ptr(a->size == 0 ? FPST_STD_F16 : FPST_STD);
     fn_gvec_ptr = a->size ? gen_helper_gvec_fcmlas : gen_helper_gvec_fcmlah;
     tcg_gen_gvec_3_ptr(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
@@ -218,7 +218,7 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
     }
 
     opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(FPST_STD);
+    fpst = fpstatus_ptr(a->size == 0 ? FPST_STD_F16 : FPST_STD);
     fn_gvec_ptr = a->size ? gen_helper_gvec_fcadds : gen_helper_gvec_fcaddh;
     tcg_gen_gvec_3_ptr(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
@@ -322,7 +322,7 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
     fn_gvec_ptr = (a->size ? gen_helper_gvec_fcmlas_idx
                    : gen_helper_gvec_fcmlah_idx);
     opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(FPST_STD);
+    fpst = fpstatus_ptr(a->size == 0 ? FPST_STD_F16 : FPST_STD);
     tcg_gen_gvec_3_ptr(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->vm),
-- 
2.20.1

