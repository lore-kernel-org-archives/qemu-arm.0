Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp363072ejt;
        Wed, 14 Jun 2023 15:54:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4fGXb/2qzSypNa+R5w1+G82Op73u2zJOiahqlhjs2OPF/xUKCYpgztstCR6D8hgSjE564z
X-Received: by 2002:a05:620a:9446:b0:75e:c23f:5097 with SMTP id sm6-20020a05620a944600b0075ec23f5097mr16076581qkn.4.1686783279450;
        Wed, 14 Jun 2023 15:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686783279; cv=none;
        d=google.com; s=arc-20160816;
        b=rwf/F8dvKJNN8v29UAKJziKkjjkCEFiAXTj3O6mo348/QqBH1ckrgXKz2mn5UMm7Ya
         oKKswGhYM8wG/MTis23oycMmQ8UDB6kXsdCFaPwAB+qUSy/mu4Y9ZiN8l0gS4WFFfwq+
         pvMuILlI9dBWy0G3rRoKUOIYUIRX4tDT9P/iz6QsXvvlbKMGI3evd27b+HRiD4/lxU32
         Fl6c8R0d/WAKGMALOelwJjyUcxUWOKnY/fP+TIgb2nFpA7/XWmnVkMHvx9BF5DoxBFQB
         1EW40Ss04elbaJP8VtRa5hWnTlf+BdU7XDsB4khrWsi/bFoiHYeYDQLyNzy5Vy9l3vTN
         dc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zKkF0UqGso6xrNyDondoNFmpobwsBP9EsTGid/0zLew=;
        b=vsz87TLP60C+31ELi66H8mgQXNFeuBxBVkbpwKt+TraE1Z3w+NTFaXZoVdwhmZBBAW
         PCF76Ph1c8lQZR21dpVCIrPyA6fWySjAVvxiqxi2Vwq8g1t9AIq02J9595TBbBi5rIjO
         3PQhWFw/RaBi2o9Jdt5Tl1ZE9jKNpBCK/G9q7ip4WBaJdLhUHs7E7PsPxjkPVodwTSa1
         z4Oz1ynQr78Woi5LTOmMImJI8xE8NcPMEnPZZl1IijQlPAP4dx/tIcBeRQVDzJedLv/W
         2zOnK/Ka/4lrKoa4HPDwMqmvumSTV36NGWCWdM1g5nh4kgBmt5ZwMek+XtgTmlXzKwSf
         WDSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=ApIO8DXw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020ae9ea05000000b0074e11d2a027si8702829qkg.746.2023.06.14.15.54.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 15:54:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=ApIO8DXw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9ZNf-00075r-BU; Wed, 14 Jun 2023 18:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=52269c73c=graf@amazon.de>)
 id 1q9ZNd-00075T-IM; Wed, 14 Jun 2023 18:54:21 -0400
Received: from smtp-fw-2101.amazon.com ([72.21.196.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=52269c73c=graf@amazon.de>)
 id 1q9ZNb-0008MT-Qx; Wed, 14 Jun 2023 18:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1686783260; x=1718319260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zKkF0UqGso6xrNyDondoNFmpobwsBP9EsTGid/0zLew=;
 b=ApIO8DXwDUcF4oPfOCv5nQ6v3pbqSUEwruIJoSSXqdfMDTLVMXtZFvHc
 NrH3rW05J/wmS0EHPtK13+xEVmaD4rUMn+zsd1KCs687AplKWcxSHAX3D
 45c8kZXDeoOKXAze0QVNEYTDao1Ci4QOOqUWIcoLS8xba54iAPJEwgWg5 A=;
X-IronPort-AV: E=Sophos;i="6.00,243,1681171200"; d="scan'208";a="334147696"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-b404fda3.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-2101.iad2.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 22:54:15 +0000
Received: from EX19MTAUWC001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1d-m6i4x-b404fda3.us-east-1.amazon.com (Postfix)
 with ESMTPS id B1958807DA; Wed, 14 Jun 2023 22:54:11 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 22:54:11 +0000
Received: from dev-dsk-graf-1a-5ce218e4.eu-west-1.amazon.com (10.253.83.51) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 22:54:09 +0000
From: Alexander Graf <graf@amazon.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>, Cameron Esfahani
 <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>
Subject: [PATCH 04/12] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Wed, 14 Jun 2023 22:54:07 +0000
Message-ID: <20230614225407.96216-1-graf@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614224038.86148-1-graf>
References: <20230614224038.86148-1-graf>
MIME-Version: 1.0
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D044UWB003.ant.amazon.com (10.13.139.168) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=72.21.196.25;
 envelope-from=prvs=52269c73c=graf@amazon.de; helo=smtp-fw-2101.amazon.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: yPQfeeQI30d5

MacOS unconditionally disables interrupts of the physical timer on boot
and then continues to use the virtual one. We don't really want to support
a full physical timer emulation, so let's just ignore those writes.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 target/arm/hvf/hvf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8f72624586..0dff63fb5f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -179,6 +179,7 @@ void hvf_arm_init_debug(void)
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
+#define SYSREG_CNTP_CTL_EL0   SYSREG(3, 3, 14, 2, 1)
 #define SYSREG_PMCR_EL0       SYSREG(3, 3, 9, 12, 0)
 #define SYSREG_PMUSERENR_EL0  SYSREG(3, 3, 9, 14, 0)
 #define SYSREG_PMCNTENSET_EL0 SYSREG(3, 3, 9, 12, 1)
@@ -1551,6 +1552,12 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSLAR_EL1:
         env->cp15.oslsr_el1 = val & 1;
         break;
+    case SYSREG_CNTP_CTL_EL0:
+        /*
+         * Guests should not rely on the physical counter, but macOS emits
+         * disable writes to it. Let it do so, but ignore the requests.
+         */
+        break;
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         break;
-- 
2.39.2 (Apple Git-143)




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



