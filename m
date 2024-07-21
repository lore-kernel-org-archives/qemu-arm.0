Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1307264njc;
        Sun, 21 Jul 2024 01:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUljgL+TM3yiAon/cL6+VpfjkCKUiMfKITGAwJVyMtovrV6mMR+PJnEgwbE5HDOBNLGgreMasn6K2nigoY5Ud0rdDcVJ9/K
X-Google-Smtp-Source: AGHT+IEB1xc82+HHTyIVUylFG62br8iAc3BPa162HkTJsNPl4nJ6z4N/RlwhuNrIXszM8ubZi9xf
X-Received: by 2002:ac8:5703:0:b0:444:fe2a:da5 with SMTP id d75a77b69052e-44fa53818b2mr46315861cf.59.1721549695300;
        Sun, 21 Jul 2024 01:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549695; cv=none;
        d=google.com; s=arc-20160816;
        b=PMc8/jksHck7PNSJ4BBdjMPlkGNAIOPCA1gL0CjYZ0ufW7Avf+YZom4bFHOb45ctj5
         PL4JS8JV8R0wLHySOD3hMj4ZR4Hq25Wj1blg+6v31eU7R5ixxfa8AVJNEzboKHF6cXdN
         is5aDHjMX9AVPOXrBMADwQjX21a9Ew23lDzHzKZfUfYGeW2q1+akAG5Wgo/nSCn9Sxmf
         DKqeQMHsk1WtzZgOwDnHWplCd0E2w7TUrnT7k+YzgOPqX+DxJgehS2903xEjBMDTQ6BR
         I7j3haViBvW6dP7sZjsNjA0O1p65h0bOFya34F+VL+Z7DIu7CpRwyIBGrLuqwvGaCcDh
         ljnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZY1yFMZpxDed399Qr48TOhVB82T6ImNnvzW360N3de4=;
        fh=vGQXpJ5E1KqRT7z3XgxV+a4vkBV8GgQh3HWVaysubJI=;
        b=QiiL0BByECIf1CugvUvSmp0nzg47rVAQEPYy+HlsxCapARvj4GPoxF0AQ0Y8UFZLVu
         /6wapjLRvzelyBZafe0Oa0ZG1Pn4hH/GSRGWrHGNp/TEUrRms2aEbdmsHup/vayQPjyw
         yGpB/KEmBuskcIDBmqJDxoitipKh8GiuEUmUQepNnneYDq/2wfrUyXmYSYcf0eNC7PQB
         3JV7Y7Z+3GSCVypdCryy6C1BVo5OBxSFF95Adk4ftpQj4N53aMo1u6jge4Xwdrb/8pKO
         6qTzTvx4F9KBJMooLYSI7dBzPBX6GWV3w2sHVFuEuQttYqVbeHxFcPGggSVrf4+oXHOG
         3GdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Amc6tD2V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccf835asi50205041cf.140.2024.07.21.01.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Amc6tD2V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRi4-0000mI-OJ; Sun, 21 Jul 2024 04:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRhx-0000hx-K0
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRhv-0001Mn-Ft
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZY1yFMZpxDed399Qr48TOhVB82T6ImNnvzW360N3de4=;
 b=Amc6tD2VImDDhGzX/DGnthrciOvCbuf9gmIbA3EwM+e0sb40OyVDs6yeUDNgth3wsqTOzO
 wSr1aDO1M849u69vJtKpFNkJJUNTFwo5uQbKHs1mIJi4EZzcZUXAZKexfrIt80uPApxRMO
 E0DNRiYMjfQ+fwXi3Kq+ZOrAAdqK5EU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-41-2SVm6Eu9MaKlmZLti_He8w-1; Sun,
 21 Jul 2024 04:14:09 -0400
X-MC-Unique: 2SVm6Eu9MaKlmZLti_He8w-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CF1A51956080; Sun, 21 Jul 2024 08:14:07 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 40B761955D47; Sun, 21 Jul 2024 08:14:05 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/15] aspeed/smc: Fix possible integer overflow
Date: Sun, 21 Jul 2024 10:13:47 +0200
Message-ID: <20240721081401.425588-2-clg@redhat.com>
In-Reply-To: <20240721081401.425588-1-clg@redhat.com>
References: <20240721081401.425588-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: tW9yl1uCe6fM

Coverity reports a possible integer overflow because routine
aspeeed_smc_hclk_divisor() has a codepath returning 0, which could
lead to an integer overflow when computing variable 'hclk_shift' in
the caller aspeed_smc_dma_calibration().

The value passed to aspeed_smc_hclk_divisor() is always between 0 and
15 and, in this case, there is always a matching hclk divisor. Remove
the return 0 and use g_assert_not_reached() instead.

Fixes: Coverity CID 1547822
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/aspeed_smc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 49205ab76d38..f39fb85a35e9 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -789,8 +789,7 @@ static uint8_t aspeed_smc_hclk_divisor(uint8_t hclk_mask)
         }
     }
 
-    aspeed_smc_error("invalid HCLK mask %x", hclk_mask);
-    return 0;
+    g_assert_not_reached();
 }
 
 /*
-- 
2.45.2

