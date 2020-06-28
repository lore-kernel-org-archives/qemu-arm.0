Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1940690lfm;
        Sat, 27 Jun 2020 23:50:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBnIrOxFUjgNch23gmNVdT6sHneyCoEJrA6TLmWlTrG12QCq37S0UlbtjZrXca/l1CSbru
X-Received: by 2002:a25:c089:: with SMTP id c131mr17534151ybf.504.1593327011009;
        Sat, 27 Jun 2020 23:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593327011; cv=none;
        d=google.com; s=arc-20160816;
        b=r2XHdkEAdiE21/41I2S9bZKIQEEyOX/UUd73Z6zFSoECMSYLzkb9o2/9r/Ovps9/Cx
         l3uEUWCIkE0b/kSvdGrgHq4DnOAKYqbceiWbHiQTvmQdtmfjowohzFmOwozOfU8Ckd+L
         j9vrfh9btDF1GwjjEbJtjn12eSlcRdhHo0pHJkGiMSYBIc0UR6XJ8LJqMJi92AfzEotE
         KrrY4mj+GGn81Nbj3qmBXurSDspyUlAxW/Ec2qRZDKO/zu+hVoDzqu/O8CV9/azHPtD+
         Lq+GruFBJpOGeeZyxUaJ9xIRHUS4dJ+u/zLxfCpKXEUuJjUvZrTk7t+qIi5LEJNc+Pz+
         Ho7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=/HlRsjVf7T2AQ13Zj1+IwCHgaASqBjKPrEIy/qJXwRg=;
        b=o+JCCJBfVluJoL2vU11FYNEy0J04E8hEFbY3nRgiz+J3Acl4F7j0k3aMkXNo0/dvd8
         tzVq1KDwvZ3AeroFhhlOqKuHlcK+TjEiRHfsqJ9+0ks4wyHBwFbZvbVrVampsyD6XYYC
         sTeKZy7xHHHMhB3POKf42Y9cC0XMYE81M3VggBk/qU1vkKCPqHKL5WHImf2w5H/1aN80
         mGxwDaB/94ZsTOfhvWu5VTmXmVY0jejLIULsIRFHzUBSSKxO2jZgIHqg0PsxzQQTxZ4U
         ux7+wwDDBbZoz2goQrSPhgjZGcwzw0mrB/2ijCQzVCwUrk0KS56D4UMMLkYAxnkcsNie
         U5EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si34050373ybe.188.2020.06.27.23.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jun 2020 23:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpR8k-0006wX-Dz
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 02:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jpR8a-0006w4-PB; Sun, 28 Jun 2020 02:50:00 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3715 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jpR8Y-0000oX-KP; Sun, 28 Jun 2020 02:50:00 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 235214851E26FC420DB6;
 Sun, 28 Jun 2020 14:49:43 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.22) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Sun, 28 Jun 2020 14:49:33 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH] migration: Assign current_migration as NULL after migration
Date: Sun, 28 Jun 2020 14:49:23 +0800
Message-ID: <20200628064923.13192-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.22]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/28 02:49:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zsTc21bSLFUV

In migration_shutdown, global var current_migration is freed but not
assigned to NULL, which may cause heap-use-after-free problem if the
following code logic is abnormal.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 migration/migration.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/migration.c b/migration/migration.c
index 481a590f72..effffd7332 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -189,6 +189,7 @@ void migration_shutdown(void)
      */
     migrate_fd_cancel(current_migration);
     object_unref(OBJECT(current_migration));
+    current_migration = NULL;
 }
 
 /* For outgoing */
-- 
2.19.1

