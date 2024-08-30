Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp205160njf;
        Fri, 30 Aug 2024 03:53:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTUuKZv8lPVQhef1FiCkQnLo9xwv+qHg0aRS1GWSRTXz8jWGcV73brdyTcXBaMa/2wTJM33aeRBDHEig==@linaro.org
X-Google-Smtp-Source: AGHT+IFQwrObymMQbRfG5wpuM8HB93TiVCESzLtvqo+UQ824UA+hJYhGLU3Umd6WXZge/fAQ0xdg
X-Received: by 2002:a05:620a:3f85:b0:7a6:5d48:131f with SMTP id af79cd13be357-7a8042734f1mr566980785a.70.1725015232593;
        Fri, 30 Aug 2024 03:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725015232; cv=none;
        d=google.com; s=arc-20160816;
        b=CQcJAU6wy7e+VidVE/SDfJV6dnG9J2/MpwTIWQflWMDoHmLBxRo0aNgc7pjKVpW1O8
         J8H0B3bCZWCnu2ZirDcK7KyR4GibjAzIRrjXQgwElYT1R+9w/Wj7e1TOSi+DbllaNnM5
         LCGXfhHnsAdtEEdNrnQSu6rFwK3C3bvE7zNvOCJ6AL6c4lZ8H1bi0QWObt08BTM6nDxx
         KXvv7fSQJ1DAcvZjEpLHdRmNNUqkHvxusOuMlhCArezxFUZsBnlLqTKJMkT/MLNB6dg/
         eoRWY7iUOx5Dl8PfBpAg0lU2zT/eZRRYTvssVKfn3mIHi3jDAzUnHWILr+Qo4Nl/AHiT
         tkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=yE3GfHpTIFts6lIcXY9psHvb4DY1srgKIYkk+Mv7RWo=;
        fh=wAMUNjOnh9On8XvCTmS1kxnyR3bEipPoLC6SSdBX0Jc=;
        b=GFhV4rV9dkQIRcO698ZvOtGKPAt5jVFsbH/mVQ4aGgwni1FkHiMLjOHgyi9DQdCfvp
         tVpZQ7QBPZnyI6V2lp33DlUg/fA//y/GYQW+JN/KIEk39QioiNRC6rGcVKwgT92AX9dS
         wRQmb2BwT3VFoCt9lnMCUM2k2JSzrlfn9UwaZLUAz3LTJz+Hi8G6fLug6XKVX5BivHX5
         6NWtGK5woM70oOaofd07FncXn5QzLvPVJZJShcAGe+HrXsauBXjNyxSYfeTLnKVIQ6TQ
         K/uVaH6e2il0ZtayzAtfuUXA/sL2vwgJEPHsGsPodKWfN4grm//MKmHOzjL1zFmbmmJ9
         JwPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806c460d6si355019485a.176.2024.08.30.03.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 03:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjzGA-0001Pk-7B; Fri, 30 Aug 2024 06:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1sjzG6-0001B2-Gt; Fri, 30 Aug 2024 06:53:38 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1sjzG3-00044L-RP; Fri, 30 Aug 2024 06:53:38 -0400
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WwFP55YGvz2Cp7W;
 Fri, 30 Aug 2024 18:53:13 +0800 (CST)
Received: from kwepemd100011.china.huawei.com (unknown [7.221.188.204])
 by mail.maildlp.com (Postfix) with ESMTPS id A93F6180041;
 Fri, 30 Aug 2024 18:53:27 +0800 (CST)
Received: from M910t.huawei.com (10.110.54.157) by
 kwepemd100011.china.huawei.com (7.221.188.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 30 Aug 2024 18:53:26 +0800
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Changbin Du
 <changbin.du@huawei.com>
Subject: [PATCH v2] hw/arm/boot: Report error msg if loading elf/dtb failed
Date: Fri, 30 Aug 2024 18:53:04 +0800
Message-ID: <20240830105304.2547406-1-changbin.du@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd100011.china.huawei.com (7.221.188.204)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=changbin.du@huawei.com; helo=szxga04-in.huawei.com
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
X-TUID: DVqqoYFT5mVM

Print errors before exit. Do not exit silently.

Signed-off-by: Changbin Du <changbin.du@huawei.com>

---
v2: remove msg for arm_load_dtb.
---
 hw/arm/boot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d480a7da02cf..e15bf097a559 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -839,6 +839,7 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
                       1, data_swab, as);
     if (ret <= 0) {
         /* The header loaded but the image didn't */
+        error_report("could not load elf '%s'", info->kernel_filename);
         exit(1);
     }
 
-- 
2.34.1

