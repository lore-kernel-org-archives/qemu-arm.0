Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp562345njc;
        Mon, 24 Jun 2024 18:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnSlix95kyH9H55+mH8b3+eCd1iRZobdh3DHvpab1ap9dbZFS7hFzB8i2Qv4EFS37LOReMPEswc3Y/MY24KfxFLqOOYHi2
X-Google-Smtp-Source: AGHT+IE6vErDdw7OdnWM21xeWOydNxFXHgS2eQa156PlLig2DCvD4uPpjDUzL2a8JKm/xhxqFLiB
X-Received: by 2002:a05:622a:1a1a:b0:43a:f0a3:815 with SMTP id d75a77b69052e-444d9387645mr68077881cf.42.1719280262008;
        Mon, 24 Jun 2024 18:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719280261; cv=none;
        d=google.com; s=arc-20160816;
        b=cKEes318crRZ6778eEu9jeIL3zf6dbrRLTY/jXBl0S0Ugs8NJlEyhpMI/f4CoG94Aw
         mc7t5lxbrASU0hYonHwYnNxt78uHz2Hr4Xw0us0rGo0oLHb6dcIwwJ2vuEmcng/M7qpV
         +EP3/5FXu5qkyWzsYJFuVQ6BObgmzTBWPg91Pp1/+SkSg0Juzj8eVIOaZDmgvSmEvBv8
         qhuj0SCR73hPryxryKoG7aW03U584BNwlz4+PNTshQFOQXFSufIbQtLIKaOJaCuaRssJ
         RnpZI9rrQJF6EjpRXLBn17Blf0Mh7TET8V2yfEzxTIB6jFac8PMTvbQoH2jPZUTKxvRV
         UukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=hI5hBSEOOTYzf5gyalo5NSsR6MI0k+qqnl287HS6wlg=;
        fh=HrGJUFnZHz7hWxi+LYnD6UY3P1PFtgkIHq6jddVMKYw=;
        b=nE3vKEp8VXniKKDwzFQMPE9LHBJi/XRn2E7HVuZeHLbCGvE7Rf+VOW2gOjCf/1mHXV
         qAPjt70hhF9au5Z46eqMVQyufqFKU8wYI4UhzgBdLiDCQ0KAytfHoLjhuOfBST//TN4m
         +ZcLRsxrCSej/BSGvpowoM/EJlJhdex944G7aC05KmtrvEqcRjSCsyZbeEBsyJAUrRIt
         a3INnchOo7652oeWHeew2prUgd2CnWHoxt2/C7DJDxbehZ3s8Vhk42qB2eMUimI3nmik
         M/suhKbBvXCXah58qo5lZruxak7OkbThjmfRPPLp99QDpKFhf7LlSVxMVLjSuH2ljkil
         Pj5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2b71cdasi96059591cf.199.2024.06.24.18.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 18:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLvKW-0001pi-Mi; Mon, 24 Jun 2024 21:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sLvKU-0001nr-Vo; Mon, 24 Jun 2024 21:50:42 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sLvKT-000106-JL; Mon, 24 Jun 2024 21:50:42 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 25 Jun
 2024 09:50:28 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Jun 2024 09:50:28 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 1/2] aspeed/soc: Fix possible divide by zero
Date: Tue, 25 Jun 2024 09:50:27 +0800
Message-ID: <20240625015028.1382059-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625015028.1382059-1-jamin_lin@aspeedtech.com>
References: <20240625015028.1382059-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: oV0LsVmoI8Xe

Coverity reports a possible DIVIDE_BY_ZERO issue regarding the
"ram_size" object property. This can not happen because RAM has
predefined valid sizes per SoC. Nevertheless, add a test to
close the issue.

Fixes: Coverity CID 1547113
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
[ clg: Rewrote commit log ]
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index b6876b4862..d14a46df6f 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
     ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
                                         &error_abort);
 
+    if (!ram_size) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: ram_size is zero",  __func__);
+        return;
+    }
+
     /*
      * Emulate ddr capacity hardware behavior.
      * If writes the data to the address which is beyond the ram size,
-- 
2.25.1

