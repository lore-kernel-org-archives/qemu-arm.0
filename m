Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp2104651lfb;
        Sat, 23 Jan 2021 18:56:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNRmiCMOK1HPdPDy2KVS+NXYD3JHAn4Tp5pz3Rwpq8TTdraT46hgSXHDtFNOnoJ7ZDwMFS
X-Received: by 2002:a25:bf83:: with SMTP id l3mr1879167ybk.401.1611457005657;
        Sat, 23 Jan 2021 18:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611457005; cv=none;
        d=google.com; s=arc-20160816;
        b=vBDfYmx/QH1cVqgRvpAKFGrtC/VR8buuWskhMuZ1UJtOVhsc6+Pj2K/vCZut1SAjez
         e9bF9Ur+dsJRhnhMTx0bDJ6KO0/kMa8yICP29Vldj914dy2rt582lvI52kxTUFRnBkm6
         7Rg0Rx2NeH3TcCOhWAtrFYx0pWDvoF1dskki2Jsis35u/zhQDgqenVFxOQrBfX7TN6Tg
         DSk/2ICnnAd9lGlge27uzXy7Z+jK+pFAhZdhS1aESkcVREkRrpBxkoB3WELy0NTJHHtS
         xpnxcA98bC2a5JGxR9ZMwJVHSgdYpOpFtj5txEvUHi0K9jTc/NiOLYV/FVcIF+XxcAxY
         VopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hvTez/HngdMR8Bp4hJmsxx6LvZR0P6LerCwHXuYSqjg=;
        b=XbyBewWzFzMlHsEfAJk0C5eIh+fnIcBnE8GKAD4ek1ve/cElD+Nou3AtPaL+TD9gGE
         PMmSqHorh4satklUfa0H0n/WPg0t9TKTl/ItF+WEiyI6gckU/IojB9YdG1betiUn5h2u
         fEx0biRdCIYkvnVXra7kLgSnJSz5PCvhn+U49n0p6UuTbJDoxb/BjEtUZE6aiMVvOzxr
         pmOFgc1aZDeLL83r3VQ/qRdJVkLP4jQ0h2Rl9fcROvqJBFLJtrZxwODbjw/olUqkg70b
         IK6WHnOamz0q8cgSrDFSSghvu6n8KAer7WAMbbhiQ/R/Th4RHy6Y6aH3hREhsCZH0sgT
         80fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="Rny/TWwV";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s64si14411841ybf.424.2021.01.23.18.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 18:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="Rny/TWwV";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3Va1-0000lt-1G
	for alex.bennee@linaro.org; Sat, 23 Jan 2021 21:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWc-0006kg-SL
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 21:53:14 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWa-0003Ai-NT
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 21:53:14 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q7so8799731wre.13
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 18:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hvTez/HngdMR8Bp4hJmsxx6LvZR0P6LerCwHXuYSqjg=;
 b=Rny/TWwVpFgoB+k7tCEU3sQr68GNvPhfpYKgn//MyeKMNTXcWtgyw394aFpYY14fo8
 1RSjZor71rt6ZqXIAjbOSw7AjU52cGHZgnU3ewihfAEAqzsJOfz/UIXYbguwtdVTGOyu
 M+rYSylN8/A0VFGxIEM4hb2gFCUSJVwfGU2bl0JrZVR77i5V/7blYXPeFUiXsoONt1N/
 KmbeWpL1QNkT2hVLV+1E1vZpjNMC3aruaaSlempNFmWcDGH1XOD3Kns4tiLofXeHrW9g
 K1g9qVI/Ln4gX7Dih+7OJLGDSgx2FJTHvQyvNCKQeszau80yaM2XK2zj4SeYRv+b9ZWN
 6gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hvTez/HngdMR8Bp4hJmsxx6LvZR0P6LerCwHXuYSqjg=;
 b=KyHjwP5xCqSpRVIo9tMZ9DVusZkE1Tmzy2iNk6X6I/rQAgP0S7Pr5uoh5lIcESVuEq
 Qo3jDJJZ8wx7QtUmcn9x6rLwFKFG44qQkU6NpcSkjhDmdsXUZO3k5h6jLoFVRf+2dYGZ
 BdyZDFYs9g1b1v3VrdaJdmqseTzDjLPt5vP7aHdWzuc0dJU7x1ZW73LThraV8cz4FGAN
 4Msvkke7khYP/Ywwb34gPMtK4vjEk6034TqmC7X6CllH1xU2PAJoPa/r0Sq187dEFDoj
 9WUfBDZzRnGteAK5DyEWEIuYAIKA1QicmgpW0jchKocXaEnSSmdBwLDPFJ6x9P02+XHp
 +6jQ==
X-Gm-Message-State: AOAM5335bEnsazAjGUTu+7b9zALqIxmfrAg7TUmwXUl9+2ys1OjJ5rYc
 hr/yBSOvlNz09frSQV2PWovDPMyqJ4V+rx1P
X-Received: by 2002:adf:dd83:: with SMTP id x3mr8134808wrl.421.1611456791456; 
 Sat, 23 Jan 2021 18:53:11 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id u17sm16189542wmj.35.2021.01.23.18.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:53:11 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH 4/4] hw/intc: make gicv3_idreg() distinguish between
 gicv3/gicv4
Date: Sun, 24 Jan 2021 02:53:06 +0000
Message-Id: <20210124025306.3949-5-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210124025306.3949-1-leif@nuviainc.com>
References: <20210124025306.3949-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1vzQWltRb0JD

Make gicv3_idreg() able to return either gicv3 or gicv4 data.
Add a parameter to specify gic version.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 hw/intc/arm_gicv3_dist.c   |  2 +-
 hw/intc/arm_gicv3_redist.c |  2 +-
 hw/intc/gicv3_internal.h   | 12 ++++++++++--
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 833deb0a74..d32a1d5f48 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -544,7 +544,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
     }
     case GICD_IDREGS ... GICD_IDREGS + 0x2f:
         /* ID registers */
-        *data = gicv3_idreg(offset - GICD_IDREGS);
+        *data = gicv3_idreg(offset - GICD_IDREGS, s->revision);
         return MEMTX_OK;
     case GICD_SGIR:
         /* WO registers, return unknown value */
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 544f4d82ff..faa68c9a71 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -239,7 +239,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
         *data = cs->gicr_nsacr;
         return MEMTX_OK;
     case GICR_IDREGS ... GICR_IDREGS + 0x2f:
-        *data = gicv3_idreg(offset - GICR_IDREGS);
+        *data = gicv3_idreg(offset - GICR_IDREGS, cs->gic->revision);
         return MEMTX_OK;
     default:
         return MEMTX_ERROR;
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 05303a55c8..ded2df66eb 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -321,7 +321,7 @@ static inline uint32_t gicv3_iidr(void)
     return 0x43b;
 }
 
-static inline uint32_t gicv3_idreg(int regoffset)
+static inline uint32_t gicv3_idreg(int regoffset, int revision)
 {
     /* Return the value of the CoreSight ID register at the specified
      * offset from the first ID register (as found in the distributor
@@ -331,7 +331,15 @@ static inline uint32_t gicv3_idreg(int regoffset)
     static const uint8_t gicd_ids[] = {
         0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x3B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
     };
-    return gicd_ids[regoffset / 4];
+    static const uint8_t gicdv4_ids[] = {
+        0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x4B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
+    };
+
+    if (revision == 3) {
+        return gicd_ids[regoffset / 4];
+    } else {
+        return gicdv4_ids[regoffset / 4];
+    }
 }
 
 /**
-- 
2.20.1

