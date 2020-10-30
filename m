Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1610485lfa;
        Fri, 30 Oct 2020 07:56:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc3DHkciThzQPR5an4BFmKNCcnGNtHgAO2o81pZZ9XkRRSP7DCSG2S2Cp8pNU9YyTGU9jj
X-Received: by 2002:a37:7e43:: with SMTP id z64mr2035975qkc.184.1604069772172;
        Fri, 30 Oct 2020 07:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604069772; cv=none;
        d=google.com; s=arc-20160816;
        b=FLJznSvB/z8GuX2gUN43J9ixF+O2eJnLebbJeLaNJNTjaRLWYMGSi1tpshMpUGh/ER
         Ef33Voz3/Sze7ltwFFuGFZt+veY/BzYzlVOWCVrEaFuNRX7XNa4N7Y7/woPXEdTAU9l3
         t2/ygTthHjulYWKYv4BNUTwLBuBUC5dklEi4cbkzNvAQj009P9dbNnc51uuJgQkf6o/R
         A8jwDIEZaJ1q1r3hjQolxis7zJBW4kh22JYF6yIWbTYcYRLiWM8ALmG4oMld3iJnLl1t
         lnhN6+Eczdol+gxwdt3zj3mW10JmORGToGt4Wpeno4aMP3RdmbEbeaSbZzjcMC1DcVo8
         1Xlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=e0jB6jiJn8QGLsdv/mqDddEswZ7xIZ5m5iNf0wcCKNM=;
        b=ji3mb/BmefYICFJireomiNaDqMEhUoQ1xWDvKrd1QvZT9lWUW1ZTTZin9yzUYQi19j
         cLmVEcAwZISVrst0U4D41Dyzs4akUs/kuP0MOlOwsfbxIokM8SKGXJAvnVgQz7EsV+u/
         3iCQkEVqVBfyal4FrbmngehrDpT6+iHmX0Z1tJjZUGOreqq/k6yBR5yMEh5dXn7rgU/W
         /vhZa92MDWU9ActkObJldxFR3lgZLURGRBOhbk0/dBP/rRm62xhutg2OH60yUX20558Z
         BlVtI5/C4x4OLtSlhBxkA0pXdYlZhJjU59g5zjbgQTxescj4pdCXHVxa2BRWm9Dr31QX
         v8Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cTsmn6ma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k21si3630403qtj.51.2020.10.30.07.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:56:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cTsmn6ma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYVp4-0006aT-Cy
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 10:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kYVfg-0002Hq-BE
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 10:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kYVfd-0003Ta-Hr
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 10:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604069184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e0jB6jiJn8QGLsdv/mqDddEswZ7xIZ5m5iNf0wcCKNM=;
 b=cTsmn6maQsT9aaGvowaKiFj7boWfUJKtPxi76uvuSeEHBBP4jF3EejzPUNQfKnn5/gBHOJ
 pQ59hwcyEh0Tsd7MPbGEVE76MHihbOWffSPQxuxkwFnFKQp261uT1ZjJl9/gHzJiS5Ytle
 yjsvl/9SCthqkSkyMQeCQ1rR9VavEx8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-A-Xxy0ZZNomb6n9eIT0T0Q-1; Fri, 30 Oct 2020 10:46:22 -0400
X-MC-Unique: A-Xxy0ZZNomb6n9eIT0T0Q-1
Received: by mail-wm1-f71.google.com with SMTP id y21so431180wmi.7
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2020 07:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e0jB6jiJn8QGLsdv/mqDddEswZ7xIZ5m5iNf0wcCKNM=;
 b=DRxb9n0H2hhTf9HgvmYY93obUDDNhNOzEhk7SGpoBwv7HNLlCUEDw3Julcv0nmXwT5
 1bK5zY25Mn7oAQ2rw5X7ApZ0xDNP0Q9PzkMLypYHGt9GNOkM3tKU4QBR3VV31YqLPw90
 GkzSzcVwLsARAwIwrLHTEoaLk7bqnuVZBtx2UqxwU17gCX4JsuURaEsiSfcxU+2qX2iL
 Wjb3uH2yHki/5UJ47jGrf1aNvKUdgogqefa649biM9+JghDPjuCYVIbHUX00sTCuxwRF
 6oNQb3qviqJKOH9h+MpDk7KdY6lk6P3gD9RoMN8NzsTMCWANhNhpUyKIWEQrxvCxxH8O
 ix5Q==
X-Gm-Message-State: AOAM532v5IbHl92M8Rqbi+3W8kgGTRhizwuMuytfvXuxEpOEtlMLLMP+
 4qTVz3ZxcyRrdzHhekGOAvJnBrh1bj/RlgayvxFwG7ScXTSGuFOZ74O8Z34T+3nN9WEcLHlOu23
 cgTJOoT9Yh7Tw
X-Received: by 2002:a1c:4944:: with SMTP id w65mr3015457wma.50.1604069179859; 
 Fri, 30 Oct 2020 07:46:19 -0700 (PDT)
X-Received: by 2002:a1c:4944:: with SMTP id w65mr3015429wma.50.1604069179625; 
 Fri, 30 Oct 2020 07:46:19 -0700 (PDT)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id y20sm1132435wma.15.2020.10.30.07.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:46:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2] hw/arm/smmuv3: Fix potential integer overflow (CID
 1432363)
Date: Fri, 30 Oct 2020 15:46:17 +0100
Message-Id: <20201030144617.1535064-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 01:22:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: twJ54/ORU4Em

Use the BIT_ULL() macro to ensure we use 64-bit arithmetic.
This fixes the following Coverity issue (OVERFLOW_BEFORE_WIDEN):

  CID 1432363 (#1 of 1): Unintentional integer overflow:

  overflow_before_widen:
    Potentially overflowing expression 1 << scale with type int
    (32 bits, signed) is evaluated using 32-bit arithmetic, and
    then used in a context that expects an expression of type
    hwaddr (64 bits, unsigned).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/smmuv3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 2017ba7a5a7..22607c37841 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
@@ -864,7 +865,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
         scale = CMD_SCALE(cmd);
         num = CMD_NUM(cmd);
         ttl = CMD_TTL(cmd);
-        num_pages = (num + 1) * (1 << (scale));
+        num_pages = (num + 1) * BIT_ULL(scale);
     }
 
     if (type == SMMU_CMD_TLBI_NH_VA) {
-- 
2.26.2

