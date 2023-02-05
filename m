Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3074501ejb;
        Sun, 5 Feb 2023 01:46:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+I6PYENCbQMJ3VXhzlvUvIN88PBAXAQgMJfYlc/WfcntJcL1nRDsjfLGMaZdU0W3YMjxtD
X-Received: by 2002:a0c:ab84:0:b0:537:708d:3fef with SMTP id j4-20020a0cab84000000b00537708d3fefmr22750437qvb.38.1675590393029;
        Sun, 05 Feb 2023 01:46:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675590393; cv=none;
        d=google.com; s=arc-20160816;
        b=PGGMjelZuXMJgxW1aZYiMpZUxZ7AZ/8xLO7/VmaT4Y5sbypAwt7CBXQVbE+2lUJtoT
         CnTi1/eOiLXpLUXHOxDMGPHGTdt4pbepnTcfHkCSP4GrpgR2w60JtMrQc8qSSVfd5pKk
         kUFvD4phQRYVowBCavztET1nVSDlYaxFs1nzdOoKIpRHLMy9h4ABXZhY6BYkkbbMwTKm
         A/34xr3dQXd+MkfOM+fwNk0yQ2UeXuJXb8gJhv/KpTKj6Ys6L4BlTv46Z8TpPtc4KNBh
         zgUsm7VEbgTEgOtNUU9tiDAphSPF9gu9gXEo19QiVGAcVV8EfrGgXea7qcarA1D68wJ+
         IT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=kRoJgll/EyuZGD8r8LLdIHU2kvhC0CMvLDar5BN6+Ig=;
        b=WODY+50CDXFlrZlJRPptm9mTfeLCTWLF78Hr7bV2u+8q8V0lOwczyT7hxRVN8SOHQa
         TEYMiaLt6t5cnNGEIVT0hT5jcpAaOxMpnlUcSJbx3656weeu/63Av3iXsyVFn4N75N7e
         CSrbnKWH1bARuUa3+rRbPBBOuEKIVtK9YOnV9OD7IlCPTM0hsaHqyQtbJXYZ9as+OHty
         0XWza+ENg3HriJt7oCqMWVA3Q1Piq/scglJrIg531uin7pWagCVmDCUSDSEIyBIkoejr
         z1MU9g7w/fLxmuM6iJ/oBId/ryxkcgEDW63OCaF+6ZhxwQLSCUqZpOwhVuZPAm6yFxvi
         EG5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PtCvWF6Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a05620a28c600b006fcacb194efsi5868004qkp.53.2023.02.05.01.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Feb 2023 01:46:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PtCvWF6Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pObbD-00068P-V3; Sun, 05 Feb 2023 04:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30XrfYwgKCGoaUWabINIOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--smostafa.bounces.google.com>)
 id 1pObb0-00053D-HN
 for qemu-arm@nongnu.org; Sun, 05 Feb 2023 04:46:03 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30XrfYwgKCGoaUWabINIOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--smostafa.bounces.google.com>)
 id 1pObas-00017O-QC
 for qemu-arm@nongnu.org; Sun, 05 Feb 2023 04:45:56 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so5003150wms.8
 for <qemu-arm@nongnu.org>; Sun, 05 Feb 2023 01:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kRoJgll/EyuZGD8r8LLdIHU2kvhC0CMvLDar5BN6+Ig=;
 b=PtCvWF6QBFPtI4XBqrLDoU3F6/12zdCXMY+qZqxTZcqk8N/1OH9g3dp/qYLYNI93LA
 fcN/Sr2jY+9YWYmT/a2GThcp3dObOQfbS4XbQVoZuXc63l5pwN0FCbWYq/GI8A/4xUIa
 tj0XGiCnDTs1vTJ7gt1EecyiDHJ2OKcvuFzsSPvlGYsjAFYyse7+qBSoraDNnDhpB+82
 d4D05KL6/sLLPEQ6AiVBVxRSYQuWRIJNMROm0wLixgUDIT8EDi+8n8a390fHE11O/5Xj
 0BhYTA2VoPEju/BnfavlGz6eviTkOQiuOKGgiImG8OZp0xOL0yNv4UkC6HB4c4SuN5yl
 KNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRoJgll/EyuZGD8r8LLdIHU2kvhC0CMvLDar5BN6+Ig=;
 b=OT3x4LEXnVpHpbj+J9WbMEWHfCMzMu/lQLxQfYSL31tYVahIZ66q+WD5prhvATgv6X
 9bElgHpN4l8Uc9ziTMWY03+gbwTmANao0c8KCKXsQor3gAjt65nQZZJusE3HoGIUCY/u
 YWk4PZcozFxEIhyBLX0GxzAd41CzN7Nx0GT5AYC2/kDjpWe6wRfl5Umz4reps3O8ONdh
 WJwOGH7FhPqdHVW7T2OY4xYIalEhtxqwSYnKwLFY14LU2KMancIrNrCyBwEoOt9wg/xO
 Va6IpVHV3yohPEd2HBehrDgKEHoop/M4lxpHHOKR5mMQQDDlgagoGO9850d7sPDl1eUF
 i14A==
X-Gm-Message-State: AO0yUKXUWQPcuFQw9c5n0CTE+F+uq8l5Y7rAZBl0IaJhVQGTs3Ajd0IK
 i0ui4KqtgDnXdM2bx81qEztdYD+P2ZEyrw==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a7b:c84a:0:b0:3db:2f03:2571 with SMTP id
 c10-20020a7bc84a000000b003db2f032571mr599647wml.183.1675590353543; Sun, 05
 Feb 2023 01:45:53 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:10 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-16-smostafa@google.com>
Subject: [RFC PATCH 15/16] hw/arm/smmuv3: Add fault configuration for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=30XrfYwgKCGoaUWabINIOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 2nXcr5L7Z6YH

As stall is not supported, if S2S is set the translation would abort.
For S2R, we reuse the same code used for stage-1 with flag
record_faults. However when nested translation is supported we would
need to separate stage-1 and stage-2 faults.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h | 2 ++
 hw/arm/smmuv3.c          | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 3ccb9d118e..ccdae81db8 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -528,6 +528,8 @@ typedef struct CD {
 #define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
 #define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
 #define STE_S2S(x)         extract32((x)->word[5], 26, 1)
+#define STE_S2R(x)         extract32((x)->word[5], 27, 1)
+
 #define STE_CTXPTR(x)                                           \
     ({                                                          \
         unsigned long addr;                                     \
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e0976ac236..5f792d96ab 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -446,6 +446,11 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
         }
 
         cfg->s2cfg.affd = STE_S2AFFD(ste);
+        cfg->record_faults = STE_S2R(ste);
+        if (STE_S2S(ste)) {
+            qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
+            goto bad_ste;
+        }
 
         /* This is still here as stage 2 has not been fully enabled yet. */
         qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
-- 
2.39.1.519.gcb327c4b5f-goog

