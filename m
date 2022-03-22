Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1425791lfb;
        Tue, 22 Mar 2022 03:28:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPOVPPSuHPBerSDq/H+boEZsJr9jU9DLBd2It1+XztPpJ4i9UNBmZfJL8RMJFTn6EpkVXO
X-Received: by 2002:a05:620a:29c3:b0:67b:31ff:bfb2 with SMTP id s3-20020a05620a29c300b0067b31ffbfb2mr14733727qkp.463.1647944925927;
        Tue, 22 Mar 2022 03:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647944925; cv=none;
        d=google.com; s=arc-20160816;
        b=wh3gtPj2VshrZhcofa4fZDbRiXjRHbNiwsN8s0m6fEruiw9MzXZ0oq3VzgyZykFAc1
         NWAlwSOxzwpJXh49zRP8ys3eoDl8VQOWpQ+KpPPyXol3XhfYezn6+VOe924rLqyoehdI
         HUiSFjmEictrl9q1ijcDaWDhzof97zczwwdanr/17v37Ni8jXEzvgH9JFGW+40MCCFod
         eGXTWDHyxHnYbz901rCOD1YgfnKdFLg5Y2YOrFMbT34T/x6B+aRvtK1rLbZaB+eJtcl0
         Hb2XBOYCDOUyFQWUaR61oUCdj57vACB5CEYiEfoa3wgEnAZqYQ3/6l1WhqDq9oRo15D8
         13Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=v9l0ogl/bdFBzuoTKFwUcvtdsfzwCyUk8BQBE8geXWs=;
        b=o5nuQmDBr2MsN2O5GvZaPZREJn5LcQIFDcHdEgourySZeLzl7fXZq7nwlxChzvv6/j
         R3GGIsUEyrYnUS6CmhiFlzUPrvfcHAnhK9K3bGmmRzVlgQhlUNENeFiuriXv8gBQ4zvw
         HfD6u/Glv+60iBALOgibSgVTtfQMgxvJ/IVtkeDts4/XwxJK6QbEvNg6mZCCoWqtFLEZ
         4+bwyRFD32p4/Kr8vb2JQ5X7z1VN8bzSWhP9iYVgObatHFVLhNTVP52anXcfcDUjuWfU
         xPXCGzipZYPA1ShUTTgQYSyueiYmT1CkhYUMrxizt7fiazLqoBZAtfMbp8ddsjHhSyp6
         FGaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjyFz2h7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020ac84f47000000b002e1fbf3c02asi2534906qtw.539.2022.03.22.03.28.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Mar 2022 03:28:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjyFz2h7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWbkr-0001ZA-FC
	for alex.bennee@linaro.org; Tue, 22 Mar 2022 06:28:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWbkd-0001Xu-Li
 for qemu-arm@nongnu.org; Tue, 22 Mar 2022 06:28:31 -0400
Received: from [2a00:1450:4864:20::32b] (port=33847
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWbka-00007R-Sn
 for qemu-arm@nongnu.org; Tue, 22 Mar 2022 06:28:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 o30-20020a05600c511e00b0038c9cfb79cbso1139118wms.1
 for <qemu-arm@nongnu.org>; Tue, 22 Mar 2022 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v9l0ogl/bdFBzuoTKFwUcvtdsfzwCyUk8BQBE8geXWs=;
 b=hjyFz2h7jiPdbth700PnMRTeYS20QfHtvFExuT/isCst65FDjQcfkL7uGR7ODPsun2
 Jg9XaP9WMtHcRdQ49dYaZuQK5ejBGf5LzNZ5vT8m5RV3T/AOZ1EcyF8t8yFLegFkk4hB
 RsfVEPF67St7Dw7Whzt2cVj701uvH787VD/cLJ6KdT1y6YsaWZl2of1Jbv9UJ6q3/B6S
 4cAwsDquKYAXpqe+x5uNQBMApwUNCPF91jihhdZwNANP8a17ROqT54uf6mIMP98o70wo
 ro7l1xPZcNQ8qUSQarOj/vhf+eiGt/8wJ+xQu5vqycMSjYwSdcW2krgg8wbzXxoAVXJR
 LG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v9l0ogl/bdFBzuoTKFwUcvtdsfzwCyUk8BQBE8geXWs=;
 b=iyoSTsmOpFVoA5R/54jkeVtzveNoht83XkoHelWJeQK2tUSdHOYuDuQG1yLjXL+cJo
 ieq1nEaL3W306xzY8svTOcnB2ZWLrKL7GKhQAliMS86DdSA3UryjQk81zpMkUB2Z57F8
 FZRxH2kD05FzB++QARVSL0iFDHh1pFD0qVB0hPHaP6bPrSsDJ2Iz2gGqyeMFfT18nPKm
 Gz/EmPM04vnIs6KprMd/279J5FHiCn6etXa7/vXtiVLwpm0Qv4PpnLquwpexRzLOAJZQ
 RvBFEtHicdycz9Zwjna7yDKesb9AypGVhJ3KCKxHBCsjCHc4HHl7wZvE3nb4idQAJfO3
 sSvQ==
X-Gm-Message-State: AOAM530Hn+gSLNupSeDkMlpneN/bI3kRfPvVopkpVmqEfnGnObSDuL57
 oqjqVjSXFsefzJL1tYxQFm8mFanrp4xQTg==
X-Received: by 2002:a7b:c382:0:b0:388:2e76:49ed with SMTP id
 s2-20020a7bc382000000b003882e7649edmr3096846wmj.195.1647944906985; 
 Tue, 22 Mar 2022 03:28:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a5d6612000000b00203fbd39059sm9275872wru.42.2022.03.22.03.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 03:28:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0] hw/intc/arm_gicv3_its: Add missing newlines to
 process_mapc() logging
Date: Tue, 22 Mar 2022 10:28:24 +0000
Message-Id: <20220322102824.3474956-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ua3TDoMqZT7X

In commit 84d43d2e82da we rearranged the logging of errors in
process_mapc(), and inadvertently dropped the trailing newlines
from the log messages. Restore them.

Fixes: 84d43d2e82da ("hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b96b874afdf..d9c741f5fdd 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -524,12 +524,12 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
     trace_gicv3_its_cmd_mapc(icid, cte.rdbase, cte.valid);
 
     if (icid >= s->ct.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
+        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d\n", icid);
         return CMD_CONTINUE;
     }
     if (cte.valid && cte.rdbase >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "ITS MAPC: invalid RDBASE %u ", cte.rdbase);
+                      "ITS MAPC: invalid RDBASE %u\n", cte.rdbase);
         return CMD_CONTINUE;
     }
 
-- 
2.25.1

