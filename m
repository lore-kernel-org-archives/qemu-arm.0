Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E58FCA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:54:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY9L-0000VQ-79; Tue, 13 Oct 2026 04:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4W-0001Xc-HP
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4U-0008Gv-Nc
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:20 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so1560474f8f.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880877; x=1792485677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=HEpQd9AvFwO8uwPIw2G7NA2tUj48bKXTa16by3JaLzo=;
 b=OZzFoWfB++8a0nxka3zZ9dQRAwSf9lQzAxWrE6hAf4/FNwZ83XGiYDgXWZbko+ZzV5
 pt5AssVFDS1EgKnEEk3RsUoVQwDITKO1befaCNLQg5V9jBWSs+8AhU9axJN/uVxrdsmu
 vTTL7ePYPZNFhtETm1mhJD9OdYLOkVGYlq+VxsZzfgg0gUtosHembnQ+4JS9DiFGrLrI
 CzKfSVBp8id8FOpYk7hI42C4xGuf4fsPcLi7V5BXOz/Pbjz3l5XKWNEp/6DH8tezWVbM
 m1lOsOSryK9BQe2mY4o8vB7sSeQWJ7arUBCHYJNNEat3hsLmDwupkiv2HX8wVKBfYMB4
 4LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880877; x=1792485677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=HEpQd9AvFwO8uwPIw2G7NA2tUj48bKXTa16by3JaLzo=;
 b=kBQtV24WD+YiW5ZrK+4ojUvby6rWYNiQifV2h/Vcj9Bc1Iv5HLCYDye5N7GJJZvnHD
 CPNlLhnv/bnz5xCtCILItZzaKs0mPMXtqkPbgwXwT0sOjhG75/a0KFaw/5Z9tBzR6T5N
 YwI4b3Bi/r3mRDgHW6CPVsiz2Py9Gg4DjGmPraZmudwJuGpDkoivhpByobAcn7FqXHqY
 983tlWXecyZvmqQzSPUqxsRmMjcmwNargprhl2wPl3eJSSCadHaY3xYyEGrsJvOS56Gv
 C3fPbHqBeG8hrWiy1KwiQEEY1Jm3ACK9eea8YxJnJ8fx+gdjU/4WgF1rQDrgnpQYX0kF
 zUfQ==
X-Gm-Message-State: AFq9FYKIWXf7+bW06gp+IFHSrNHS1g91x9p8SQpn0v4WWLUgh5W+3dLK
 whFRm4zO1qMy9uJhXekdyZRaillz1mV4DG6XUPu5Fab7HGT190MeTULi6WPhxecOF4E9Xbl4zFd
 mM5UA8Ps=
X-Gm-Gg: AYBFou0CaqIGYmMRs1zNMukyh0yc6E85PLTzqG7GCTTYGYgFaygUTBfeTLO/Fc0VGac
 EfyeG58/5lOtz4HOHpHQes8YPQjC3ziMtHeGX5QWdkJ28c9nVWKiK9/v5M+nlmElxNV3kkg/q+a
 G2x+blzDol/Gvw0W4025q64fDMTwv7ZLK8XIfLGCjXZ7J+PGFxL10XygCHjy+/FAMUGF15KgUpI
 FGhlcUYPwO1pDfr6eWYFw+mtjHnzaZfA1F/3GZJJoukDiBR9TJA7LCfNWcxRRC+ypvZNsSEAFQX
 6Gjj61KnPaq3KmdXZGdmRFy+DZGDJN2l3ltUUb0hX9k81wUMb7zlANf5aXdPUtdMY3ILoszYmE7
 JVK4mkSoLxWmDsPtDWCNW8jA9TxszZciozSm0VZZxSHqAQO/MeQfmrFGeVsgqmLkOWeCNE86Xc9
 k6dIvUSUOOxEkOxq0Vst2HDGbvDvoH/QrtE9zTNCInLQBaBP7j3/Qn3njGo4crbnDHtjoF2zV11
 proBNuwouQE2b6MN+ScQhabiyC7JpcWWarKHzCo5FSr08JfcC0fzp0tqjuBKhORGG5H0yt+IhbY
 hJPd/iQ60oDm2w==
X-Received: by 2002:a05:600c:4ecb:b0:49f:f099:6fb1 with SMTP id
 5b1f17b1804b1-4a18e4adcd0mr233780555e9.15.1791880876648; 
 Tue, 13 Oct 2026 01:41:16 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 79/86] hw/intc/arm_gicv5: Add virtual support to
 gicv5_get_hppi()
Date: Tue, 13 Oct 2026 09:39:26 +0100
Message-ID: <20261013083933.1024405-80-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

If a CPU asks for the virtual HPPI for its resident VPE, return it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 199547abaed..ab0cd1d80e5 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -348,11 +348,13 @@ GICv5PendingIrq gicv5_get_hppi(GICv5Common *cs, GICv5Domain domain,
     assert(cpuidx < cs->num_cpus);
 
     if (virtual) {
-        /*
-         * Until we implement virtualization there is never
-         * an available virtual HPPI candidate.
-         */
-         return GICV5_PENDING_IRQ_NONE;
+        VPE *vpe = s->res_vpe[cpuidx];
+
+        if (!vpe || vpe->vmte->domain != domain) {
+            return GICV5_PENDING_IRQ_NONE;
+        }
+
+        return vpe->vhppi;
     }
     return s->hppi[domain][cpuidx];
 }
-- 
2.43.0


