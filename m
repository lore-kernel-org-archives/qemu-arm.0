Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2682199njc;
        Thu, 12 Jun 2025 17:09:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWkzofC2dGeiDJbt9U+l0pmu+V08Oi/QHvGh92jt9TnTMu9DwR7Q1SysH3yL2s2qekvNC77E5k4yiaYg==@linaro.org
X-Google-Smtp-Source: AGHT+IFBAkuhIFZbVa1cXAVR1+9t3URYFimNH4wbG+MYw/zzswwnjg9QBVP64BegEKp9X651InGR
X-Received: by 2002:a05:622a:480d:b0:494:a30b:e27c with SMTP id d75a77b69052e-4a72ff18014mr19864151cf.39.1749773391048;
        Thu, 12 Jun 2025 17:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749773391; cv=none;
        d=google.com; s=arc-20240605;
        b=HHHji9Lg64gx2kpdeQFIP/oRReeAs2B2aHc3iKFCW29iGf7TQhoaKSXflE2bW9oAXO
         t24RO/v47PxMuCMXCwsPeRgEM6hEC2CrRSKU3JOrAbzwtlwcjP5xk3ANNWBHudV3zhbW
         KEEiIHQ7NAZSbZMHgPyGqas4+637C+4m1bU4ezFWhgjrH3nbhR5Di86EcAK/tpCop4Fo
         lF5rojEoEMsZBsC4MN9d2dFuY8vsnCw6wD+B5IKkHDvuFXiEiXoUtM1nASyhGi5SzIVj
         NVRq9+W4LqNUrVKcFcUxPyVcXu2jLb3kAaGpB1JScGaBrB0L4nHsStMBSeYTY0Ipou2r
         HkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=pN6ktvXR5IcGeRx1cB4+P3xO5YRnqgnQGID5P3shDMc=;
        fh=jmB336zVDilutUuU09TXLNZ6TFwRas8MQn/v9+Y+T0w=;
        b=gpsfDfFU83iqUTi5wQFprlzDyb6WZtH4W43vCuRSUtrd6qYfsnnMCobUV4gL8GeX0P
         JSjhrA7+z0+uuFl9Hqf2D17W5on2swL2Z9uZsDva2iOCE+1/wMe0NyHSRsgNyo0UlzVw
         4z/EtK4NcMnFr3274cQnP8hZYxbPfovKKsC28KlxE+TF7gVkfyek6qyH7ta2IDBaougp
         s8fErDKSeyhAgBV6StALEAiOK+kf7kGNT3QbaRwyf1OvM+837uO2ojX5SQExJxX4iLbY
         sqg//qxW4kUQe9VkkZY73c1yDPqbc/9S8kw1cRQNtKiJK8ibYkCdNMvx2Ce7kSiC42Xj
         TtDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Wf5dAC8H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a531d25si17272231cf.591.2025.06.12.17.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 17:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Wf5dAC8H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPrxJ-00016l-92; Thu, 12 Jun 2025 20:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3E2tLaAcKCmAIMKJMBGEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--komlodi.bounces.google.com>)
 id 1uPrud-0005tU-7e
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:55 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3E2tLaAcKCmAIMKJMBGEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--komlodi.bounces.google.com>)
 id 1uPruZ-0000bl-Cs
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:50 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-b26e73d375aso1444230a12.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jun 2025 17:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749773075; x=1750377875; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=pN6ktvXR5IcGeRx1cB4+P3xO5YRnqgnQGID5P3shDMc=;
 b=Wf5dAC8H5WjOjLP93XhN+dXmA8WPzwWgZWssReTjF0rbutcJ+pW3xClVeCHEYZy4R9
 HtNK3rWxO9gDC/kxKoi6dQOvoznGC35JVkDxz9IVkqA4/yKgRujStIQPoVNbLUK6VieL
 oo5KAkhjnv8MwdzkSemrD4JtJ1A6qjXRxbx4Ep4y/97VVYDvevUCTKIa0xqyXNps7Bpr
 9jaRSz919knoPh7SHKAf66SqU0ue9c4LVxoNo52lSsMJ6vo02GaF6xN1IrF7prZk8sWz
 f/9TT94zF6JQXaM4fpPY2pW12Kwru9xvz7bwSNcfPvY65U9NvLr14745oivOeqSoYHqJ
 cDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749773075; x=1750377875;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pN6ktvXR5IcGeRx1cB4+P3xO5YRnqgnQGID5P3shDMc=;
 b=ZZ2c7HqAKtb78lV40ZHyo30yCBgKlB+bi92ZWg1Qi+7Y3QBCZUN7tYzpxQuYgvKwjB
 tLtC2j3Fs96Y9JSq7c4QOMOT4/dfbjODumoHrDDtVhFow9347uYsPRh127qlTw6Ldk4s
 VXjv/QsXv4qgHUE5YNr+NiULMPB9Pw/RRGUb8upKgD2pXtfX2oCIQz4Wrfp3oUS4wTjS
 FJQagDHMHg+fNWBm57Z84eTC7nwF1C709AiiA40D7TjPqp5wvzktw2ectJH8ph0rpO0T
 +5XCUIBQW8ORjCjYpcraWxdD6Y8Zivgz4wb8lYX38PVHPMebr2k9WMVwEnwPfkoIT3hN
 waRQ==
X-Gm-Message-State: AOJu0YzL4U6mx/RQMA/f/U3QeWXpkE2gHpQXASmNi1mbXjP4XJw6ZR6L
 I8zzHe0UJ6RGtXO3EzedU5OtKtF9zgcfR/qpYmri8ZRBcj9976KVz76W0Ma8bOL4vRqDBh8mvh9
 2knLukNj/yM+yqlBMA6rGO950CbA6wkfKw1KYQJE/9ea7p2K5VQl7QyJioAdpKovckoNKZRJuni
 lnA0xn9KEFvZgEj8o4ab79fVjqTsKM4lGMVBvUzleo
X-Received: from pgac23.prod.google.com ([2002:a05:6a02:2957:b0:b2e:b47d:8dc])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:244b:b0:21f:4f34:6b1
 with SMTP id adf61e73a8af0-21facb2719dmr1204032637.14.1749773075301; Thu, 12
 Jun 2025 17:04:35 -0700 (PDT)
Date: Fri, 13 Jun 2025 00:04:08 +0000
In-Reply-To: <20250613000411.1516521-1-komlodi@google.com>
Mime-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613000411.1516521-17-komlodi@google.com>
Subject: [PATCH 16/19] hw/i3c/aspeed: Add I3C bus get function
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3E2tLaAcKCmAIMKJMBGEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--komlodi.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: mtYXZ2ozB9rK

To retrieve the I3C bus object normally, the order is Aspeed I3C -> DW
I3C[n] -> bus object, so make a nice wrapper for people to use.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/i3c/aspeed_i3c.c         | 9 +++++++++
 include/hw/i3c/aspeed_i3c.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index 1ad25e5a00..af1ff5bc12 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -153,6 +153,15 @@ static const MemoryRegionOps aspeed_i3c_ops = {
     }
 };
 
+I3CBus *aspeed_i3c_get_bus(AspeedI3CState *s, uint8_t bus_num)
+{
+    if (bus_num < ARRAY_SIZE(s->devices)) {
+        return s->devices[bus_num].bus;
+    }
+    /* Developer error, fail fast. */
+    g_assert_not_reached();
+}
+
 static void aspeed_i3c_reset(DeviceState *dev)
 {
     AspeedI3CState *s = ASPEED_I3C(dev);
diff --git a/include/hw/i3c/aspeed_i3c.h b/include/hw/i3c/aspeed_i3c.h
index 9833292ec0..b3e4d1055c 100644
--- a/include/hw/i3c/aspeed_i3c.h
+++ b/include/hw/i3c/aspeed_i3c.h
@@ -34,3 +34,5 @@ typedef struct AspeedI3CState {
     uint8_t id;
 } AspeedI3CState;
 #endif /* ASPEED_I3C_H */
+
+I3CBus *aspeed_i3c_get_bus(AspeedI3CState *s, uint8_t bus_num);
-- 
2.50.0.rc1.591.g9c95f17f64-goog

