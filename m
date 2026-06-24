Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8E1CDB481
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 13:51:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcNo9-0001x6-MD; Wed, 24 Jun 2026 09:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnS-0001d0-JY
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnR-000160-5D
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:42 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-46066e640easo711170f8f.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782308259; x=1782913059; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KKSPSnAl7FDN6Zt0DqKlBArO4lCMgimmNAk89edFtyE=;
 b=Q5VWBu5CuR8JHUu4GqcoUsZj1zRU0EYPHEidA1qqU970o5mr5q2EQaDd0TdR7mrW7C
 5kCp3+q4bmSy+iwPintqKEQRkJsz7G9a86dWNE8FiJ9UZ9cIT5/Jr8N+eJmwUMgX6M+I
 7O6or87iNI/TuTzdbnW7hcgFBAnW39jOquWSc53GmVj8figv8BBk8lYjNDrwMmlZkrBF
 iqIFt7XGbLj5fSgD0HwyscDD58keLPSpbHo5UyFBsGmeJvvBSqm93hEBx4afIu7dhsn+
 mSaXivi2n5kevKO2EFzEEL8TVSd6Rcb7l8wCUnvQXv8ZLFo5dEYyTwrydYFhyi0ptVM3
 jmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782308259; x=1782913059;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KKSPSnAl7FDN6Zt0DqKlBArO4lCMgimmNAk89edFtyE=;
 b=oJSpi7mLT+s6HLqolKAM3s80CqyvVDtJctSKuNYBTufn4WWP0K0nGc/DYjF7dcfXUl
 jI3KKvZLa7ruDpiMatIW3Q7Z14haXSQYY1ro8QO9d66AVTyzJVR30TigrHSzq70TfcD5
 iykwmqbRV74fRIeaukG1K5YQcQM7Sy6F0yxWiPQteM4Z0PWKulmnilv12h20CCs4iaML
 4LDsbHoR0SuhwhIGwYWPu+sZeMse51eZv1qSmok7n1CTZ2T0P4+NWHhWDXKWdQmVOo4r
 6/7/x9iuAVxi2lDgQ+lta6kMR0P8gKeUi8t/3H4sDmEWmPmLU3Ous8/ZXXEvt33W80Ps
 QBfw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rql4vDxFNpxOhJLPcyjgZkh3jKxNUGcYqhnG4h1Yl/aYKQtpRCE1RFUoPZX+pjRoWszK8vQ/yLPYg==@nongnu.org
X-Gm-Message-State: AOJu0Yz9r45L93IDakwxnYmA6zsPKLSCKbvETlRxV1DBaEW28/Fj9vSO
 lucs2WeNN3IZoUyLi8rCljS9yRB4p7cS1fzqNXNAam/76BQqt6nwAh2lc72D7t8Crlo=
X-Gm-Gg: AfdE7cnyFA1FoNe5GRXZL7Oy/Fi+7d4BP1dkDryO9Co9fsGWdATpEDolGZNEyNYTk70
 3Z8FSmv65Pju6Ui/0eQZa888EEV2D0yIqvRG0Y/aX8EWFLi2wvy9oa9ye54umR55dZ6SMChhDSE
 3D/X3H5+ES1+O17D94S5H0koxHh6MU4RdDoO5r6xOt8ip/tqoEjh7sqq1NQ7FpJU9ILm2HulCK9
 URQp0NPHOJtgqwmpXH0AB3ptX5LN7wcnUCeQs/zwrkBRyiOZ+rrrEgUGfKA1SXIQg6zR05KDyia
 jV5I7c4ovy9p5iay0cujzyT45r5MNyt5UP7GrvU9K8vRthYwitVD3jBbJvMx9Tt8tAmwYLWSiB/
 gm5EjljBOFJwBxhiLt6YMT6nEeY+0J10DZ54hBMfzlvhfoK0USuoH6qXae6ATWyprSgl/YMUczs
 7WpSDleY5qv9WzkrU=
X-Received: by 2002:a05:6000:400e:b0:468:6ce0:ef1a with SMTP id
 ffacd0b85a97d-46c0a3936e3mr6136409f8f.11.1782308259573; 
 Wed, 24 Jun 2026 06:37:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:2e21:1ee8:260f:9a76])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840efdsm6646334f8f.5.2026.06.24.06.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 06:37:38 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Wed, 24 Jun 2026 14:37:27 +0100
Subject: [PATCH v2 3/6] target/arm/tcg/cpu64.c: Add FEAT_FPRCVT to cpu_max
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-jmac-fprcvt-v2-3-dc6cf8e512b6@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
In-Reply-To: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/tcg/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index f7a920a202..f259e82dd3 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1269,6 +1269,7 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     t = GET_IDREG(isar, ID_AA64ISAR3);
     t = FIELD_DP64(t, ID_AA64ISAR3, FAMINMAX, 1); /* FEAT_FAMINMAX */
+    t = FIELD_DP64(t, ID_AA64ISAR3, FPRCVT, 1);   /* FEAT_FPRCVT */
     SET_IDREG(isar, ID_AA64ISAR3, t);
 
     t = GET_IDREG(isar, ID_AA64PFR0);

-- 
2.43.0


