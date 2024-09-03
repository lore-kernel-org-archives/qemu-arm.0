Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1442881njf;
        Tue, 3 Sep 2024 06:45:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuwZY1X+6r+EV9PT5Uw9P7DRZCla6DiM7u8sPDHgUi1HnjkQiStIW9z+FKKx6rgDrkJQpEzCxuOBuPIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGF8e8RytAtivlfQZsxhp10QzHWWHpw8C2DRz3j40LeKjcfUOrsI6rbhlaYg5oEXhgw0IXa
X-Received: by 2002:a05:6102:cd4:b0:498:de1b:a8fb with SMTP id ada2fe7eead31-49bad26f9d8mr2139801137.10.1725371148089;
        Tue, 03 Sep 2024 06:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725371148; cv=none;
        d=google.com; s=arc-20160816;
        b=kT5IpWiG2B1SdP346wCIhbHfcW+H1JblLBP+PlZwG0/smJ4Xh/FYg2jBUFTTJvFbuV
         r/zAQF2XhG5soiApEYPxCBS6LtYFCTt1GAjqUBDmNe8JsY53AKwu8b1G9IBotVPBPNpo
         eOUGZ18fYhedv95HjqJCuXdLfcp3FykzvHjG+SDROIiSd4vwExbRVQk0um0B52ReJ3Ko
         GWhmOlwsh/JsN9KTGQWYuaTu6V6OvqSe3ZvXIBxjCb1s+feg+9OTElCgWKMcYER9DQ0p
         FnZ5Y3biywtQShyoygqszbRLNvwotorrzgLms+enfM+VLGef7kBILsCDBFgCkKcwoP+5
         m+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=70npNyQGsscjqUJK0DhG/hYJnnopW1Cv/YSYC+TsObs=;
        fh=+KBEUq+Irvk/MffqnW5A0IaKDOZf6/VkajA8SdJfVAg=;
        b=Ubou1v2FLaM8RUtE6hTmceiHg3MJY1TxqLmtjFuswYYWbAWCxIQxd9If1IsjD212VX
         GFpuzX+0UULqVO1pKNFrnY2fFDcAcTJL80RuiiF1rP4FTw18mB7soWUFL6vTDmjUDT4U
         G7mevZv7VIm7cIGr6dVzKLOSJr1E9wkzbzzHM6BABOvhvUyCcMXNdPbrHBaP4eXJkxDn
         XFghdbLNXuLGQ8tHVfdArI0Ae+SGnizuLGooO7920qy2+HYZbE9qfTPB2fJqWE1xZfu1
         RUezodpceQGXKOyYj5/XKrD4+ZDZx9I03TWWD3wavGL+C0LWRDyxByW5y6XNyyBoG4wM
         /ehg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49a5f419afasi2451014137.1.2024.09.03.06.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 06:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slTnp-0002yl-IZ; Tue, 03 Sep 2024 09:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1slTni-0002xh-Nc
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 09:42:30 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1slTn2-0005Ur-4S
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 09:42:20 -0400
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WymsH5K8mzgYmH;
 Tue,  3 Sep 2024 21:37:55 +0800 (CST)
Received: from kwepemd100011.china.huawei.com (unknown [7.221.188.204])
 by mail.maildlp.com (Postfix) with ESMTPS id 829031800FE;
 Tue,  3 Sep 2024 21:40:02 +0800 (CST)
Received: from M910t.huawei.com (10.110.54.157) by
 kwepemd100011.china.huawei.com (7.221.188.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 3 Sep 2024 21:40:01 +0800
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Changbin Du
 <changbin.du@huawei.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v3] hw/arm/boot: Report error msg if loading elf/dtb failed
Date: Tue, 3 Sep 2024 21:39:40 +0800
Message-ID: <20240903133940.3447430-1-changbin.du@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd100011.china.huawei.com (7.221.188.204)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=changbin.du@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: Scm+vP/jRQvK

Print errors before exit. Do not exit silently.

Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Changbin Du <changbin.du@huawei.com>

---
v3: use load_elf_strerror() to format errno.
v2: remove msg for arm_load_dtb.
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d480a7da02cf..6c895e05cbc0 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -839,6 +839,8 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
                       1, data_swab, as);
     if (ret <= 0) {
         /* The header loaded but the image didn't */
+        error_report("Couldn't load elf '%s': %s",
+                     info->kernel_filename, load_elf_strerror(ret));
         exit(1);
     }
 
-- 
2.34.1

