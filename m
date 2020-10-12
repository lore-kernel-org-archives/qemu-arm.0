Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1155151lfa;
        Mon, 12 Oct 2020 08:44:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQshK3Fm8+MtHAf+6NHioutPASxIk40hQcJQJ2/7e+e/OJIzPqxP+iM0ye/Ejo5nfLjqv4
X-Received: by 2002:a25:a083:: with SMTP id y3mr33448000ybh.296.1602517484609;
        Mon, 12 Oct 2020 08:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517484; cv=none;
        d=google.com; s=arc-20160816;
        b=KvJ1FOhWHABN8PjrnMhlwBa/NTDNWLthV3sroEi+Kk4No0VD8ejVqIIlj4Nd408o4m
         gvcFRuP/cNgK36OkqnD0I6uWAkMBCuoljsy+Dv3wxAeftQ+WEBZVv+c4YCjEvwQzUOu6
         R4yw2/0+HS/ZPB+g94Cnl4P6Ib7lZStdnldqyeakFF2lVTVCUuf5c+0IvAeZwOuTDlan
         qc9iqbcf8TSIGDxyH2r4cQcNLmBLk61qcPECB/cdn5Vv+bi2+G15wEavJlGTH01hvQIi
         LO2Ct7QccUz3d8uR8apdhAMlftPnCNRZotuI1eU4OhAH8NPO+4pUTjqs8icjHqP3QHCh
         SrZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dd6UT/sJQhVQoU/A5etTLisFLDqNewMQfmLXJ1m4wic=;
        b=r1XDy9KwvH+Bj0I/a3xZY9OSiBlmOVXOxIS8gPjJ3ENGkbbh8FjyIBFXDD1aALbm/a
         aoxcMMpa3qWbhmQCeg8jFNG7Z5CeRqb6ybD/DTc0ZRzdi5UjkMIzQ3SJW379U8eTFDaY
         B11L/8MMFEEN27rLaqmQ6h5xTBWegKRPmfVAvu7touRBw9Bye7FC6yHBufYJ6y8VgG/F
         6Q34CBNqrDJ2yLCvwei9GqHsAtP4mLbYhKovugzcElSOda8/2Ns5EU6rNQQ6FbeYiCu9
         lo3MAdga4N3hSmmNxLO1SbGH8njP7cawwlEKSeCPoztUxvu0ynY1+/ROr9jonP3PXWDy
         Z/MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sLaCeaFW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z97si1875542ybh.71.2020.10.12.08.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sLaCeaFW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS00B-0003QF-TM
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqJ-0006xV-HS
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:31 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqG-0007Ip-3f
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:31 -0400
Received: by mail-wr1-x443.google.com with SMTP id t9so19674889wrq.11
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dd6UT/sJQhVQoU/A5etTLisFLDqNewMQfmLXJ1m4wic=;
 b=sLaCeaFWyaNYwaqhma5Era5sXLXUoCCL/+CMXMHuUmtF0pAE+DyRYbkqh00Wv8oRXy
 5MkzjC4Fx6cO9XRznNrsrPYatsv3cA7/Cg+Odi51txC4cetgB55QhHPXdlizyXGOo5cm
 i1XSXYZ1jnHtSpFId8l2sFEsrvLJ0WRw0Xk6hb8HF1i5ImPJT7eAfmed5x9HTcmmr/h8
 SjAMDmdAZ/8+7e0f3hJFeJeciScIU2/8F8HTRC5NuNSkK3mx/yqWoaBYwH7fuRMPDnfi
 LMACTMMM9xk2uztH9FZ6UQF1kuvelw+z0WVHQdidu4UkNFI/oYAP153qCTD780AF+AWk
 vL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dd6UT/sJQhVQoU/A5etTLisFLDqNewMQfmLXJ1m4wic=;
 b=Gsy598EjeFN3crw6v+boc1j/rQszDb8KeK8VyMKICAvovQuifkOXjQwJxjDeHDHuvy
 zpJBcd4Q5G3w9j+fjyHVqpoQ9dnrCcSPBNBeqY0YUJqBp3txs2ry2G9ch04xhtJa2Rou
 SsWn26c7ZTarGeyd3j2AuK1RZYpd0bTVM3EWJQiKM8JSwlF0TB9pa+4+5pWRsz5/Qjfq
 Ldcc2YqbnNES1wYUmqTgZl9GGBlAttB7+IHdRI4wPEcjBwtWu8XlueUWt4PX18qvdoKA
 2CbIFpQOIs+6Cgu3KSIfLmyMB4sEJUM3lDfVBDoRp2vjTqmijmqEV9c9jNxNluLnu1yG
 6iiA==
X-Gm-Message-State: AOAM530blizFgKBDq77Q9JSjAzynXl40fLP+8OQhqd5/0ivSFPcvHXM5
 8ChtAruCiIfw5aO7GydZhvQSwRnRz5yqmXVU
X-Received: by 2002:adf:fac3:: with SMTP id a3mr4233875wrs.240.1602516866625; 
 Mon, 12 Oct 2020 08:34:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/display/bcm2835_fb.c: Initialize all fields of struct
Date: Mon, 12 Oct 2020 16:33:37 +0100
Message-Id: <20201012153408.9747-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DocqC6ELnmPc

In bcm2835_fb_mbox_push(), Coverity complains (CID 1429989) that we
pass a pointer to a local struct to another function without
initializing all its fields.  This is a real bug:
bcm2835_fb_reconfigure() copies the whole of our new BCM2385FBConfig
struct into s->config, so any fields we don't initialize will corrupt
the state of the device.

Copy the two fields which we don't want to update (pixo and alpha)
from the existing config so we don't accidentally change them.

Fixes: cfb7ba983857e40e88
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not sure why this wasn't a visible bug -- alpha isn't used,
but if pixo changes from zero to non-zero we flip from
RGB to BGR...
---
 hw/display/bcm2835_fb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index c6263808a27..7c0e5eef2d5 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -282,6 +282,10 @@ static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
     newconf.base = s->vcram_base | (value & 0xc0000000);
     newconf.base += BCM2835_FB_OFFSET;
 
+    /* Copy fields which we don't want to change from the existing config */
+    newconf.pixo = s->config.pixo;
+    newconf.alpha = s->config.alpha;
+
     bcm2835_fb_validate_config(&newconf);
 
     pitch = bcm2835_fb_get_pitch(&newconf);
-- 
2.20.1

