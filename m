Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2705523lfk;
        Fri, 4 Feb 2022 08:57:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAwz7mv0gz1/WgiU4yn8oBnLZSBbcdJlTU4OvpBq//pAkPYlHYsD/hVqsXHbMFnqbu1q0s
X-Received: by 2002:a25:5c7:: with SMTP id 190mr9265ybf.554.1643993820669;
        Fri, 04 Feb 2022 08:57:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643993820; cv=none;
        d=google.com; s=arc-20160816;
        b=W3jgXTOz33iLKsTt6nL3J8HveCMnibTEtVDVNHT35PTfrMZDQoVgMj63OxuqbvzyYG
         sB1yrQSYnsqYAhatwvdcUKma69oKsX4hVb6PumrMiDFsklaPh+s8Cd7MHuRvaRMvtDl6
         MIa5moHncEm7+ut7wjp8OYjvy0J8l+NPx/DiicvYwD1MhNkXf4K8WlwwqXgcY2GlpvTg
         KAMG3p+XctoKRkXgKHOQnpgHwyjhdFmuw2bovfY0Wezb6Oxp80thbH+LItsqGyoxdFvy
         N8+8UvsHzhUBAjG64MUtbNwCS5DmWzwpVNrut2FyrEdQ0B5BlujU5lhnbwywMW5MZDXT
         A44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GEq+WVisRup7DDWYvHMkPo67hjMY0sbprx528SyyNTQ=;
        b=eNVoPw+tuj3ctFCezcdcGkHf1XElSyC6pTsr7HcBk3wN2XCApCwwhZtcU78bbfPpYU
         Euu6/1eREMFe39SFap9xfHDevHM7ozTh22y1ppxVk9KnMEBxAH6Hfl5Vm1hqXaEGMDum
         8ff5HYRQ1Zk5rt26VwTRZEDB1woeUmhSc8XFB5k/5KcBpvOw/evHtbqJdhMltR1eyPGx
         TDw4UEMaRDA+OdiiFjUVYpRDbt17uK2NdVvalyOxKMJ4PFQlyJlhUleLplvwSgGxCMBZ
         qcJyjjIEqAXYp7qsdNELnZPVsIdCLl3WDCUdoG0/ch2DmZ9OYu2yCSVwBhbisy5IMYA3
         qzqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PQW6Y+Kh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t187si1598126ywt.527.2022.02.04.08.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Feb 2022 08:57:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PQW6Y+Kh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nG1tL-0003hH-PQ
	for alex.bennee@linaro.org; Fri, 04 Feb 2022 11:56:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1sH-0002xt-Ka
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 11:55:53 -0500
Received: from [2a00:1450:4864:20::32e] (port=44994
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rt-0003D8-H3
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 11:55:40 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so4138447wms.3
 for <qemu-arm@nongnu.org>; Fri, 04 Feb 2022 08:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GEq+WVisRup7DDWYvHMkPo67hjMY0sbprx528SyyNTQ=;
 b=PQW6Y+Khj/Qrk/sc1YwfoCROKa8j6BW6/7xmrhbN8wqRmSbSkVsTSnrD5ufGRVtcfa
 ZfVORtiCLtcxI1/yTmDSQ/ZKSOZoyPkXHnI/9+TqSj2vSqMyzNGpeIWa9K5huorHG0PZ
 rt8ET0hlnowomjeeY545wWe4f/1QtW0axvsSio2RdayhkzLMEYxp+CQjv/zbQqq2Xcpo
 kixIi1HEQyEiRp3bVI3INtT7pnmBICcReryzz+X0FmVO86appphrGR2lqvRHD5iY9KCg
 BELIJg/GUM0Kyz1V1xOFkWLvs2yVcK9lerlDcx1EOWi/tQ66iREdivNdbDQgUHMQbq7Z
 VNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GEq+WVisRup7DDWYvHMkPo67hjMY0sbprx528SyyNTQ=;
 b=ry0CCdVn0QR/pTv4jmtXX02JAD6+4DrySnGRJRDE1eHoqY5kaa2nrebPeeAxlupABt
 +DLjGglBaErGek+o0sIfEQsTQvAGymg9WgjWTb4WQtS7EZ6RIewkkXLsbzdnfiLIPC7M
 +Iv6mYfSSGMiXlZMChUI1iIHuNQm33G3EKS+Dbk69irMCI4ccIwq0DKoHjTkhCCM7NdX
 6OtOonK5ls/xya96Z69mjnQ7KwuITH153HBQ2Kjq+XJDv43k/pxlnuqafxNDnb943Aix
 mfkmVv44taJI4kFUiPwTh2VDhrlyOLTeBaTRShdj2xYv3aks2TA3jtgkahTdmdrL92a1
 najw==
X-Gm-Message-State: AOAM532XTIq5ndWivX6VQlc7dZLT7674SgNhANUq9L9Qvygj79K0XYNU
 f93pep7Hw2CQzm+kXYP0M37e6BsBT3pebA==
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr2997821wms.101.1643993712352; 
 Fri, 04 Feb 2022 08:55:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/arm: Fix '-cpu max' for HVF
Date: Fri,  4 Feb 2022 16:55:05 +0000
Message-Id: <20220204165506.2846058-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0vdSfVT/Y1a4

Currently when using hvf we mishandle '-cpu max': we fall through to
the TCG version of its initfn, which then sets a lot of feature bits
that the real host CPU doesn't have. The hvf accelerator code then
exposes these bogus ID register values to the guest because it
doesn't check that the host really has the features.

Make '-cpu host' be like '-cpu max' for hvf, as we do with kvm.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index bc25a2567bf..fd611c97116 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -29,6 +29,7 @@
 #include "hw/loader.h"
 #endif
 #include "sysemu/kvm.h"
+#include "sysemu/hvf.h"
 #include "kvm_arm.h"
 #include "hvf_arm.h"
 #include "qapi/visitor.h"
@@ -710,8 +711,8 @@ static void aarch64_max_initfn(Object *obj)
     uint64_t t;
     uint32_t u;
 
-    if (kvm_enabled()) {
-        /* With KVM, '-cpu max' is identical to '-cpu host' */
+    if (kvm_enabled() || hvf_enabled()) {
+        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
         aarch64_host_initfn(obj);
         return;
     }
-- 
2.25.1

