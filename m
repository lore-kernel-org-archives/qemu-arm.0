Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2680813njc;
        Thu, 12 Jun 2025 17:06:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwAZ3a23XXZ0ax4wR297x57zM38A5iQ+uuKDR8cwRT2fcx8zd2nkaNIDDrbWwaolfTkMLnS7jr3lL89g==@linaro.org
X-Google-Smtp-Source: AGHT+IEUiHDe1xxeYHEDc4916gP+Doei1DpdzO/fYLcMfUZulG9ypvWZosO9qoylKz4A39oLAv4I
X-Received: by 2002:a05:622a:4d91:b0:4a7:1460:33e9 with SMTP id d75a77b69052e-4a72ff9e72fmr19753111cf.51.1749773203832;
        Thu, 12 Jun 2025 17:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749773202; cv=none;
        d=google.com; s=arc-20240605;
        b=aTagB9XMgKj+hfruAe0GHVmomcIwJ1NaikSgWw4bG/ZINaLiIM3DdPtKC9FFQ4qQJt
         Px5wI90DuEewmfVvMt8gTgGNYY97WGYJoxkUeIo6S2jJMK26Sb5rt+MzXhypfRPRwfFP
         nVDLLjoVl1m5a+LcJqP/JVR5ovzDf+c2CLQeMvvslt776GxMKGhnTyUkcGmIK1x7F/6F
         ELnX4M2y6fR6gTlX6OMtZJuPhN1zwJyTxAhomsaFQGK01emoe4a/jm9Qf6hnRadlb8SF
         AvvOe0FRAe4R+n4g3MhE7WLgU8gM33zPTS/iOfdlHMGyIuyCmHHMkwMbzfZQIhR+L13u
         qhbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=NO1C/XYn0cNc0jJwYcW3jpPIHQxOkwpZejg8rpn/AhI=;
        fh=xIVEnQMJimMlb3hE14apkwvnQxS1AIpA3847Tu3gwoQ=;
        b=SR/Sb6MGcbEYXptWslOKf7UsyazUGXmXnccGP/sIiLkMtbPldsGo0ECYNratBN6VzS
         tjUWg7aFi+ZlwSx4j9fcHfSc8ypi8Qv6eBz/MnszUJzwDya5cXZ0zM8grpEyh6u4EdsB
         jSTGS3Vkh+stgAVCx7mxSlHPj3hCPh2jxTOqfD8oNXKxy0qvSDEMk2p8Qv4ri0Lbduic
         okSTKU2uyZlN4CXAm51O0iJD8akwTHE4sP1TLW6ruJxiN0A8vAF9yetvFFaa9OrAIVBM
         oZwghImHUPy8AjgG9WgyJdWsMnVbhPrdwAxpTnjHb61JPhQhba3UWbJiTGE9Bd/Obq2M
         Bpcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QeUuvCsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4f3ff8si19174421cf.470.2025.06.12.17.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 17:06:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QeUuvCsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPrvk-0006nt-KD; Thu, 12 Jun 2025 20:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3BmtLaAcKCFM59769y319916z.x97Bz7F-vC789818F.9C1@flex--komlodi.bounces.google.com>)
 id 1uPruD-0005pG-UP
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 20:04:26 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3BmtLaAcKCFM59769y319916z.x97Bz7F-vC789818F.9C1@flex--komlodi.bounces.google.com>)
 id 1uPruC-0000YY-I2
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 20:04:25 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-23507382e64so13721555ad.2
 for <qemu-arm@nongnu.org>; Thu, 12 Jun 2025 17:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749773062; x=1750377862; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NO1C/XYn0cNc0jJwYcW3jpPIHQxOkwpZejg8rpn/AhI=;
 b=QeUuvCsdXl92znA3t7UbNu+WKqdMnW3G7IFNz9wAPzSnWTLh2d+eJxSu8s5niz0gsO
 K/X/UbhohwmjpFOBryPHzff4Td2+gWhWX5TtonmzBMB2Q9G1EDEnyKlrqZSEYd2TWu/j
 iMRn0eoQ0FAHCzZoKejcXqeNeutFqNC76RefV0T46bMlPqW9eGFLaFJqGP4CC2/g5tT/
 FxZD1ZrnZL26N1Mv8HDndDdKufM6EYwtL6616Pli1JR2tKv2/Fywl+/v3YrUuAbgwO6A
 ajpwSKS3qBOfiLd7VvnSQBFL71Rb8klnWxY2FCZgUMxlGShX2Vmcn5LuGk7MUSC9Wt9R
 pfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749773062; x=1750377862;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NO1C/XYn0cNc0jJwYcW3jpPIHQxOkwpZejg8rpn/AhI=;
 b=od2h5aig/hRWdM4qog3Uh9J6dnAkgkD5eEAXFcebOwIBHuZlscfHaYGe1RObQzZPvk
 DtnhohHcmoFVLMSrxeKjdHLnjiwkB2mF+gOb7LD4tMzLZVYMmOu6sjghBnR3jcF7TdeU
 ChQhPGw4fc5tMfo5CgIcHsNYW+8dB/0JbOPZcn6uv6x1bUicIQe/Exh70J/n3ByrEyeb
 EufPg+BvcjjA0CzWcH90nKlLPlx0pze+nN6UOTQ6jiYc0gOxjuO98bleWWvUsVqMvvIP
 vSDiM1KfkC+k3brzU8CEGwft5WKlSIzJksSVbQxrS2nxYhNd5P6VofjV/VA+rZWuRCfT
 L9Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNA+xwCaHqR4Plo/DdFV5uBmZvM4ob6k9bduVpJr09uMrq/NUtKRY1v6g6+TA4E/RF4Xg7ywp1KQ==@nongnu.org
X-Gm-Message-State: AOJu0YyRvwBMrth5hm0X9nNjpdkYTNoQNU4K9Pm1BUnGu5Vd+8uQ2xJ5
 cKDwZIapQkiYwda9T/aP0xAlSCU+fBq6wYnsFryIXDpujtvXRF3zoPXdlt32N5FVq1LvCldpiCu
 b6WQumskMhA==
X-Received: from pgac10.prod.google.com ([2002:a05:6a02:294a:b0:b2c:3a2e:ac7])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4b2b:b0:235:f45f:ed41
 with SMTP id d9443c01a7336-2365d89f25fmr13389855ad.19.1749773062018; Thu, 12
 Jun 2025 17:04:22 -0700 (PDT)
Date: Fri, 13 Jun 2025 00:03:59 +0000
In-Reply-To: <20250613000411.1516521-1-komlodi@google.com>
Mime-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613000411.1516521-8-komlodi@google.com>
Subject: [PATCH 07/19] hw/i3c/aspeed_i3c: Add register RO field masks
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3BmtLaAcKCFM59769y319916z.x97Bz7F-vC789818F.9C1@flex--komlodi.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: udprlWMnBif/

Adds read-only register masks for the Aspeed I3C controller registers.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/aspeed_i3c.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index 7a16dfec53..1ad25e5a00 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -74,6 +74,21 @@ REG32(I3C6_REG1, 0x64)
     FIELD(I3C6_REG1, SA_EN,         15, 1)
     FIELD(I3C6_REG1, INST_ID,       16, 4)
 
+static const uint32_t ast2600_i3c_controller_ro[ASPEED_I3C_NR_REGS] = {
+    [R_I3C1_REG0]                   = 0xfc000000,
+    [R_I3C1_REG1]                   = 0xfff00000,
+    [R_I3C2_REG0]                   = 0xfc000000,
+    [R_I3C2_REG1]                   = 0xfff00000,
+    [R_I3C3_REG0]                   = 0xfc000000,
+    [R_I3C3_REG1]                   = 0xfff00000,
+    [R_I3C4_REG0]                   = 0xfc000000,
+    [R_I3C4_REG1]                   = 0xfff00000,
+    [R_I3C5_REG0]                   = 0xfc000000,
+    [R_I3C5_REG1]                   = 0xfff00000,
+    [R_I3C6_REG0]                   = 0xfc000000,
+    [R_I3C6_REG1]                   = 0xfff00000,
+};
+
 static uint64_t aspeed_i3c_read(void *opaque, hwaddr addr, unsigned int size)
 {
     AspeedI3CState *s = ASPEED_I3C(opaque);
@@ -97,6 +112,7 @@ static void aspeed_i3c_write(void *opaque,
 
     addr >>= 2;
 
+    data &= ~ast2600_i3c_controller_ro[addr];
     /* I3C controller register */
     switch (addr) {
     case R_I3C1_REG1:
-- 
2.50.0.rc1.591.g9c95f17f64-goog

