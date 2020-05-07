Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2060852lfb;
        Thu, 7 May 2020 08:18:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypLMwvrltEBSPCEEKORYJqCqF1sgMhmrQ16C177I0dvXMqVn9EIM5/GQgd6GxZtmdYR31yZd
X-Received: by 2002:a05:620a:12dc:: with SMTP id e28mr15535433qkl.38.1588864732562;
        Thu, 07 May 2020 08:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588864732; cv=none;
        d=google.com; s=arc-20160816;
        b=QgiT/4mHrGhYyr+ixRATEOQWok6OqgVxQzRU9rCOpo4WuTuiWj8sEaP5eluGFYH7HQ
         Ub1PUQta3UTu3l375lSoqSWIqtjRurK2nxWH7H1BmszdhLQWKisDA6XQ8fmvVTuoEkhR
         0eZkN/gL5mQfbsnbwV3RUn7+40ihFBc3eJMxRRB1xJ61SnBS0Xdc81pYAKYqgOkV9T9s
         h1X2uyTxz1nAsfVOTnNeuwUMjJzAT/0iIAKqf5YhbCwvaWa3ohj9YwUvMvE8tC6dvVux
         jyFqrXu5UQbw9Fh+acORV2mq7FEtlRIbd8UgO8S2YkepH4gALZ46AV8jqeSbILThRnPH
         I2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wJXx4XuJhkbJc2HXg+9RF+qHl2xqcHAuj4vHJSwCoWY=;
        b=rlOZbQiXWBedaZlkYxaXZfAWakuU7x9YaoAR8ebp1sxEJmD/0x9h33CQIIyaMEh8Vm
         H2f/QAuE0fvoopRJbDdF1TigGQekOtfwPF4j4aaQihYTD5glYF74JG1ZQZ0OwNIX6VNo
         Z5DiSg+MIYBwTIeW3pBBH7iiDjeXkSik20VN3w08G/zLNU1gKvNnX2EaqWL51fxV39/V
         JeDR46eBTs3K2vS/0Wvy/938ypX2VVKOYABbiQNZSyTVCWm9qNxxBsZxJ/Al5sGMlp4P
         o+wNb8uKdcshYRN9oVwK0I512WRgjxu/Q9ccjncbQCV3PcQuiwQQ4k5AckV9UTh0t7kh
         hMvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zhBviDxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id s131si2917294qke.265.2020.05.07.08.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 08:18:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zhBviDxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWiIV-0007Kz-Ss
	for alex.bennee@linaro.org; Thu, 07 May 2020 11:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiIB-0006tV-HT
 for qemu-arm@nongnu.org; Thu, 07 May 2020 11:18:31 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiI9-0002af-HE
 for qemu-arm@nongnu.org; Thu, 07 May 2020 11:18:31 -0400
Received: by mail-wm1-x342.google.com with SMTP id m12so2073102wmc.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 08:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wJXx4XuJhkbJc2HXg+9RF+qHl2xqcHAuj4vHJSwCoWY=;
 b=zhBviDxgU36vT90TpDmXQXr93jve2X5K2f/hLycM63XskyH5pympxGLL94aM5jFfTP
 3JkcdkzYcfsInQinAlUiyCU9Ya3lLck1h89J2XSG5+gIjgBy+vPryMaamiwJBRUjLqQf
 Y5qU+5oaG+Fvd0e2QnVHjgg0NLmzciIrhC1Eonzy78I4SnjD3iYMQooqlBidDjum23Ht
 nYUUmZ0NBYIIgrJJoghQDTDFUnna0y+ZNR0SRFEl1hUC6Vd/Er36JEuoSGqnyx4EEx2b
 vFAFSO+v0THnPnqnoVJ7vxVTjMKal2W1IKfJ7FSA7ZVjac1f2n/d9d9libLQjKxNK1BK
 W1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wJXx4XuJhkbJc2HXg+9RF+qHl2xqcHAuj4vHJSwCoWY=;
 b=C1Zjup1YNLKL0KgcruNwbtmlpEP5CrPDsqFbcaxi3zSgkyioQe0ySXrgZHrK8BqQS9
 QibrQyDkDG0YmLABJACfob5vEFQ1w8d8nk/pYn6PCXtaCrkbqPIXhr88HU7DkLJPUXic
 3qck7+i2xPTX9rN3E6/b/MkF8ictdXkxvQHjA6GjiQhwPeTvjKkgf0S9sgrGWu+ZsVQZ
 HA4IbbzHdBq0A3m/cF76xpteeuwbfssC50QOv6c1lGtBOuTF9fq1Z671k+5qkcRhjpwW
 84jNf6Sywct9cOPVN4DZA2nFQGyTA8qBpUx94qdUejuX/icPqL9xCbKbptncoIueliq7
 n8dA==
X-Gm-Message-State: AGi0PuaMBTPh9ukYvvHgwJb1XdxqV+4c5rzfWKVZuwgSuXEe+H+L4iAx
 3JLY4y1C9G7MTsBxV5AZgjj7AjNtYJIBNg==
X-Received: by 2002:a1c:5683:: with SMTP id k125mr10548133wmb.17.1588864707481; 
 Thu, 07 May 2020 08:18:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q74sm961246wme.14.2020.05.07.08.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:18:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] docs/system: Document the various MPS2 models
Date: Thu,  7 May 2020 16:18:18 +0100
Message-Id: <20200507151819.28444-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507151819.28444-1-peter.maydell@linaro.org>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZZeJxQ7zfVaO

Add basic documentation of the MPS2 board models.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/mps2.rst   | 29 +++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 MAINTAINERS                |  1 +
 3 files changed, 31 insertions(+)
 create mode 100644 docs/system/arm/mps2.rst

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
new file mode 100644
index 00000000000..3a98cb59b0d
--- /dev/null
+++ b/docs/system/arm/mps2.rst
@@ -0,0 +1,29 @@
+Arm MPS2 boards (``mps2-an385``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``)
+================================================================================
+
+These board models all use Arm M-profile CPUs.
+
+The Arm MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
+FPGA but is otherwise the same as the 2). Since the CPU itself
+and most of the devices are in the FPGA, the details of the board
+as seen by the guest depend significantly on the FPGA image.
+
+QEMU models the following FPGA images:
+
+``mps2-an385``
+  Cortex-M3 as documented in ARM Application Note AN385
+``mps2-an511``
+  Cortex-M3 'DesignStart' as documented in AN511
+``mps2-an505``
+  Cortex-M33 as documented in ARM Application Note AN505
+``mps2-an521``
+  Dual Cortex-M33 as documented in Application Note AN521
+
+Differences between QEMU and real hardware:
+
+- AN385 remapping of low 16K of memory to either ZBT SSRAM1 or to
+  block RAM is unimplemented (QEMU always maps this to ZBT SSRAM1, as
+  if zbt_boot_ctrl is always zero)
+- QEMU provides a LAN9118 ethernet rather than LAN9220; the only guest
+  visible difference is that the LAN9118 doesn't support checksum
+  offloading
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 4779293d731..15bcf9f81f0 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -71,6 +71,7 @@ undocumented; you can get a complete list by running
    :maxdepth: 1
 
    arm/integratorcp
+   arm/mps2
    arm/realview
    arm/versatile
    arm/vexpress
diff --git a/MAINTAINERS b/MAINTAINERS
index 74cff1c3818..ea7bdd359e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -699,6 +699,7 @@ F: hw/misc/armsse-cpuid.c
 F: include/hw/misc/armsse-cpuid.h
 F: hw/misc/armsse-mhu.c
 F: include/hw/misc/armsse-mhu.h
+F: docs/system/arm/mps2.rst
 
 Musca
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1

