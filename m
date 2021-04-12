Received: by 2002:a05:6214:9cd:0:0:0:0 with SMTP id dp13csp2097012qvb;
        Mon, 12 Apr 2021 06:44:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZTJWFMlG3vRL+6qBsy+RFOTorE/zxKI7zF7ChfLS8531objEbmgyakXQoQISuMri4dlLs
X-Received: by 2002:a05:6e02:160a:: with SMTP id t10mr13077142ilu.261.1618235084622;
        Mon, 12 Apr 2021 06:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618235084; cv=none;
        d=google.com; s=arc-20160816;
        b=FHL+qjKSc75kaKX+5/giSzvWJTfzqpMoNSOjuZfYvoHHouD/BeU6vqSPFyH7ucWUVk
         qQMmIGdPUAQETEsYmrb7ScgchPD7aK70m4ppXKiQsHJ3cfreYzFirkR5WCDQHIgOH9TW
         6Hl8sXzk/9TMDgVlk95ijf8D3INuBiQMBrZ1QnxYBcVyyJOJZsQWq3Hme/592M3JNl1K
         /rOParrQucrFDrZive3ge7PGyCfx45bP9bSQTnodvIgzs+EtEDIV3F4npXE4ppuw4VB9
         63U0w+fHAWhUAdVqUuxt6KGGawDbcUrJK5NdCjytD1XhzNvFhiyvinztRZ6BghmdDeLA
         +/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=J5x2+PDQQAl8Qw/oP7RNvJGs/sHvZewjNi5ZG9bocOk=;
        b=FdjcrRWh689zhtSkYhDAPNUeiXNdu1i1Eb6y+QrisOMrOI4GVpEXzZFUW29hOOfHDQ
         5+iEGJb1HQOygOhpGL0vGVkxxy0D89AgLd3oFvd5wouL1NW8TQSXrEDF6uQ+rwo9Qvpv
         SC9fv70QBQJpV3Ss/b1XuX5O7BODyLQDJziQUDr1jmw8hhPtOphRwU85q64ld2XPNJXe
         NaIRyvtRLs6FM616mQmQoQqAVxrsgchjvkszwteyxklrme/4g5sLliQ4b13BeQGQ2x9n
         fuz3mxEhifDePswgvgx07nt/d32Bxd4nBiqi7WmHvoTT552X1pmWCwWGbFPNm1vQeMqg
         nCqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R4jSIXGw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si6855769ilg.23.2021.04.12.06.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 06:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R4jSIXGw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVwrs-0005vj-1G
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 09:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqb-0004Lo-V4
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:43:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqY-0003Nb-50
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:43:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e7so4038319wrs.11
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J5x2+PDQQAl8Qw/oP7RNvJGs/sHvZewjNi5ZG9bocOk=;
 b=R4jSIXGwwt9JoyvsAdQbw/IVQWlLw/IgSOHn05WwnFMESby8qKBlQl0rPQBhv8+1l3
 XFCmiOCAvFu3EAQGPoZBaLRj32sf4t3EjSR0ImIBc0tskicApHZQUN7vgaFsHEZHLhxN
 QeVm8Ou8FoJSc7ehPOBdrmnKehz4zNbmM9jarDHzYD5FkPNA/te86922i0UqCuR5Shwu
 PDYOps76dU2wqwIz+q87+RxMrslvsHykUhvDOU4fu98ZCvxHSqVEWXhza8VTomHQZ4i6
 xGivgScYwniePng+atdVw9prVihU6F6uzrKLsaTY0T7wvkib9NPYWCudzqdg13eWcTPs
 Wgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J5x2+PDQQAl8Qw/oP7RNvJGs/sHvZewjNi5ZG9bocOk=;
 b=LS5ZLFrG+FFgDpjR/BVLxWEJ10UEAYl/AeBd45mOurtGikJCaXBjIW7WuzbEaGgtXw
 Jqd2CysaGLsLwpP1Uu9hTRIa1r7uT3zS+73s9/Jnaaip2TbTp/VAA19u26fd5rRqjsFW
 2uTVfDDu1QgVm/WuRxBJHy9cmTt9deOZYxnns/x/yuGpdLji27KKKmbOmTJEDAPW5/dI
 9Dz9s8JZG4heAxlrPhdVhK8jNSbHsR3iVx1W/QHB3+4B4Oova1pQwi8CiKB5EKLxL6Vt
 zPCtoWR2j3aLbn2YMHjq0qveAeiE6JqXNL4tkOCh7J77euTFo3zCN4BB0uYSFbibAlCS
 y28w==
X-Gm-Message-State: AOAM530bz1KY14yov8Z0Bxw6t/IOOfNsAHG0GuSBCpHsUe/0PDyY0L7T
 aLqtL4YzC62sntchnTdMowzLBQ==
X-Received: by 2002:a5d:6881:: with SMTP id h1mr23749826wru.121.1618235000790; 
 Mon, 12 Apr 2021 06:43:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm19574680wrt.54.2021.04.12.06.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:43:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/misc/mps2-scc: Add "QEMU interface" comment
Date: Mon, 12 Apr 2021 14:43:15 +0100
Message-Id: <20210412134317.12501-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412134317.12501-1-peter.maydell@linaro.org>
References: <20210412134317.12501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U5G0Xlu7pXJ3

The MPS2 SCC device doesn't have any documentation of its properties;
add a "QEMU interface" format comment describing them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/mps2-scc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index 49d070616aa..ea261ea30d6 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -9,6 +9,18 @@
  *  (at your option) any later version.
  */
 
+/*
+ * This is a model of the Serial Communication Controller (SCC)
+ * block found in most MPS FPGA images.
+ *
+ * QEMU interface:
+ *  + sysbus MMIO region 0: the register bank
+ *  + QOM property "scc-cfg4": value of the read-only CFG4 register
+ *  + QOM property "scc-aid": value of the read-only SCC_AID register
+ *  + QOM property "scc-id": value of the read-only SCC_ID register
+ *  + QOM property array "oscclk": reset values of the OSCCLK registers
+ *    (which are accessed via the SYS_CFG channel provided by this device)
+ */
 #ifndef MPS2_SCC_H
 #define MPS2_SCC_H
 
-- 
2.20.1

