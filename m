Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2451616njb;
        Sun, 2 Mar 2025 23:37:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKbxWhmlIjNtFI9dbl9H7CD3STRpDsnRl5atjIt/f4VCpOVFZ9s+WoHnsbmASoQLhNkFyBiBoA3TF9YA==@linaro.org
X-Google-Smtp-Source: AGHT+IFXjmJKNiFX8Z5tvdkT586Et1pKvvyKLRMvWAEEJWm8D8X8NV89iS6SzRpJIqRsoXApP5Zg
X-Received: by 2002:ac8:5e0b:0:b0:472:7ce:2340 with SMTP id d75a77b69052e-474bc06a03emr172567241cf.14.1740987450122;
        Sun, 02 Mar 2025 23:37:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740987450; cv=none;
        d=google.com; s=arc-20240605;
        b=kfwE1R6KIyLrJ0vwIIBLyFIzhTRQNUFmbkKddHCV+i8JXXu/Gfodo4b8Gi2n78YiKa
         sHghPQRIXEsRmj0KXchSdOB9u85G2KZIUqVogcED3tvNgtggRgDk8EylFPZw9aW58hYX
         UKnJIZwZ6PJrR+9j6PyDZAr6Wc01BU/mT0/BzF+lkOmNzK5IQxc2G7cx7eUKOR/2fZlx
         c0vRrMdypVjSjf63+fQ5abK031MlXm/6r5+UroTUjOV0s4l4iIJABA+ZQ0RRqrc9gv96
         7esxC6U6oFEvX3kze1sOBygDAI92dq1nMZl9FdT32uvvA4M0VCzrZj6vKEumK4O9sago
         9IeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=mOkOdHpJLwcYxQVB1W4Zrn2UGntgTTBn05yPLwE+IGA=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=kaAt/D201R1N8EGZYW8M42lHFj0lwh8GS5pOcNNbXsufF+H/ooIvk/X4fljp6h5V5+
         fCKoGzgL1SIKiMxNDgRv6ofT/HFGKn8IeaOOPchWq+Y6iYLeh21Oi/G3HJk0LpL/k6Hc
         qkUz9P1jgbLfSDf4HhbqwLJyygEwJR3L3pAD3o32f47w6ZWTHChbXLRVMZYpg7MFeqyS
         A74O+vT8qD83pxROXmwFtXU5bFQfcifzouKer/R78vRiAjne/kaYwxll5smcOLef4D5e
         OmrlABl4pfe3+vF2fOlkej0Mr37YE2WO3fls7VpfNXMk72aYQ8QOMJweWbcBGTvN9tpi
         T4uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474ea6c9c03si14746291cf.636.2025.03.02.23.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Mar 2025 23:37:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp0Lm-0000rN-6u; Mon, 03 Mar 2025 02:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LZ-0000o5-37; Mon, 03 Mar 2025 02:36:20 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LU-0001xL-79; Mon, 03 Mar 2025 02:36:14 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 15:35:48 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 15:35:48 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 5/6] hw/arm/aspeed_ast27x0.c Separate HW Strap Registers
 for SCU and SCUIO
Date: Mon, 3 Mar 2025 15:35:45 +0800
Message-ID: <20250303073547.1145080-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303073547.1145080-1-jamin_lin@aspeedtech.com>
References: <20250303073547.1145080-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dj03SInbUXDX

There is one hw-strap1 register in the SCU (CPU DIE) and another hw-strap1
register in the SCUIO (IO DIE). The values of these two registers should not be
the same. To reuse the current design of hw-strap, hw-strap1 is assigned to the
SCU and sets the value in the SCU hw-strap1 register, while hw-strap2 is
assigned to the SCUIO and sets the value in the SCUIO hw-strap1 register.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index a48f47b74e..8c225d4f90 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -331,16 +331,23 @@ static void aspeed_soc_ast2700_init(Object *obj)
     object_initialize_child(obj, "scu", &s->scu, TYPE_ASPEED_2700_SCU);
     qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
                          sc->silicon_rev);
+    /*
+     * There is one hw-strap1 register in the SCU (CPU DIE) and another
+     * hw-strap1 register in the SCUIO (IO DIE). To reuse the current design
+     * of hw-strap, hw-strap1 is assigned to the SCU and sets the value in the
+     * SCU hw-strap1 register, while hw-strap2 is assigned to the SCUIO and
+     * sets the value in the SCUIO hw-strap1 register.
+     */
     object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
                               "hw-strap1");
-    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
-                              "hw-strap2");
     object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
                               "hw-prot-key");
 
     object_initialize_child(obj, "scuio", &s->scuio, TYPE_ASPEED_2700_SCUIO);
     qdev_prop_set_uint32(DEVICE(&s->scuio), "silicon-rev",
                          sc->silicon_rev);
+    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scuio),
+                                  "hw-strap1");
 
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
     object_initialize_child(obj, "fmc", &s->fmc, typename);
-- 
2.34.1

