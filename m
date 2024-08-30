Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp157091njf;
        Fri, 30 Aug 2024 00:25:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhxKHxd6qaZClIp5nCJqFbbc+qTmISwrH+2vjOf/Y/H1iEXMraqAbW0X4+I31MYiB2ktKYHShtD5maCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFtpGnBu+FuhaC3YQxUsbOsQmqtt/YOkKR2+eoEnFJga9a2IWwW5RJWMuJsSM+D5DpLEc05
X-Received: by 2002:a05:620a:1993:b0:7a4:d56a:a928 with SMTP id af79cd13be357-7a804c30b2fmr925911485a.21.1725002704265;
        Fri, 30 Aug 2024 00:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725002704; cv=none;
        d=google.com; s=arc-20160816;
        b=xHyqCUNx6mIywyu5fFs8P0km98act6gYXWCufIv7QhpAOUWOSQRSzJnMXq4a9oEiyG
         oU2zwrGT/sZGs2mlJhwCTd58yVXNgWJTmxiBOEuVIzC4RGXwpNDODLbNNR9Ph/Y7S7pn
         j2nwrqbdkGBwUTIqtC0u6axfoQiH27uD92fQSn0zr8mIZV4v2CrnkWpL8eQC6rgtS9AI
         zZaihV8mtLQ7oh6PCvpketSrgDri+GRJeVRYrEuZvQomK75O1VS1L093UP8XLSGDv37D
         JRYiGVgCbDZ/JZvwObbHxnvWX6kzSJ9aW8c93sVp5yoE/lZHAvgUWX9zQ5NwOv/CB2Hj
         Lf9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=onYQQVORS3zhp5/kezrCeD/wux13cs04C5Jb/rUEqIg=;
        fh=wAMUNjOnh9On8XvCTmS1kxnyR3bEipPoLC6SSdBX0Jc=;
        b=rgJXdKJKd3s2/hyFiQwB0tnCvToirk5m3b5F30nHg3o6wOqugbOJfgmIoIx2ruxH8X
         1fuPPQpMX78OSC6dCl/eGMtIdOdGJgy+VNWAUuMuopE4yfHjb6hhyfcoi1DWeimLvuB6
         BdNjica8s/0fAsgJw32AO8rNrjm/Teq3ra4/IUipuA2FRMGy6JHLqnBAdF5putTz4SuF
         DNY8YQNu9CkJkv+cFrSrNt73hUtF041HAMelpXcqLtaZ3pYgbXz9CYJHWN9aW1iMf5HO
         sQwnTJc4RlWuvq8MOWXbxNdYjibSLwH/ju+xjdHRSWjVLbxlCtCkCAjOoRGnHrqICPMY
         5ohA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806c485e3si332851285a.217.2024.08.30.00.25.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 00:25:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjw05-0007tm-I9; Fri, 30 Aug 2024 03:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1sjw04-0007sp-8x; Fri, 30 Aug 2024 03:24:52 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1sjw00-0000ut-Db; Fri, 30 Aug 2024 03:24:52 -0400
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Ww8lK2fgZz18MxS;
 Fri, 30 Aug 2024 15:23:41 +0800 (CST)
Received: from kwepemd100011.china.huawei.com (unknown [7.221.188.204])
 by mail.maildlp.com (Postfix) with ESMTPS id 001D6180105;
 Fri, 30 Aug 2024 15:24:32 +0800 (CST)
Received: from M910t.huawei.com (10.110.54.157) by
 kwepemd100011.china.huawei.com (7.221.188.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 30 Aug 2024 15:24:31 +0800
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Changbin Du
 <changbin.du@huawei.com>
Subject: [PATCH] hw/arm/boot: Report error msg if loading elf/dtb failed
Date: Fri, 30 Aug 2024 15:24:09 +0800
Message-ID: <20240830072409.2399084-1-changbin.du@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd100011.china.huawei.com (7.221.188.204)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=changbin.du@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Changbin Du <changbin.du@huawei.com>
From:  Changbin Du via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v5Z37N+9rsA3

Print errors before exit. Do not exit silently.

Signed-off-by: Changbin Du <changbin.du@huawei.com>
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d480a7da02cf..17c01f299831 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -839,6 +839,7 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
                       1, data_swab, as);
     if (ret <= 0) {
         /* The header loaded but the image didn't */
+        error_report("could not load elf '%s'", info->kernel_filename);
         exit(1);
     }
 
@@ -1322,6 +1323,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
      */
     if (!info->skip_dtb_autoload && have_dtb(info)) {
         if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as, ms) < 0) {
+            error_report("could not load dtb '%s'", info->dtb_filename);
             exit(1);
         }
     }
-- 
2.34.1

