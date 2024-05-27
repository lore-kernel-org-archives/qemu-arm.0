Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3026473ejb;
        Mon, 27 May 2024 01:06:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWdp8/mfqf8NCwtU+6t8IuC+O5Q3PFZ4SJZpO7FgfC3Ubi/BnSALJu8qGBJVCfrQg+DUhGaBUFVGxz8XkGVwCVXxIODaOl
X-Google-Smtp-Source: AGHT+IFektBo2wUQ+kAqQu36hg05mQNmWj6rqMlrnZEdgJU7AgCkRrK9KOxflXgxL2ss3reFzrW3
X-Received: by 2002:a05:6214:2b0b:b0:6ad:7070:4e1c with SMTP id 6a1803df08f44-6ad707059e8mr77511716d6.19.1716797176910;
        Mon, 27 May 2024 01:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716797176; cv=none;
        d=google.com; s=arc-20160816;
        b=iBZcuxIUZeFg3AXNowN5nUUSg5910gUw65w+3LnDtN/Pd5u0U3P8eUr3c7seusUwIb
         +v4aBueTGshIpSfkg9m59EdmsWiFu/2+iT2Neqnt+p7QZpzIb2CLmImyM27qun0PqCVa
         3YrALPzcn8zOWpK/D9zEOG6lm55JxstAa1ZGiffy8zPuq+q1JhunAWMcF+l3CsqZzfcj
         jmSATLnEjSMwFy4TPWLTQ6KTfvvMtvqEP1qZRVEYMLPNLw5hFbdxGNWFDyWeUbgFsCYL
         1jHOA/yUAEZI67U1gutWtqiegbxH3gUBTyZmEVD4duIGCBcchI2NmhklWLLC+IYoXMRW
         QGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=dh4FO6FS/XO2T0sxf0umpAesdmz/B0CDTGXlzISgHxI=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=Z5mmGo5YJMBWpI/+vQf0An63H6jI14KvRcKBe5txRE7nzq1bESvuHPNjkOPaowtDdn
         UTrGDZlJMERjNTxjyylkTDE2wjwrV53FBMF32lDm6iWbf5hbnsESHCqhBk3y2NqJzs8C
         gDZzPHq4ifyqdzcsAxzohKRxHVvAaJmNdr3+QcGKgl98toIiNmCBpPeRSGPexvOXTnE6
         gdf08sN0RiInp2/6CIjL6ze5RFDZoDSYgN9DAtWKdjL8vHrUvCkU8I0DW25SQYF9FJCD
         EthvGecN8HVxUY/L2jHycG2T3T5O74hf5eg/vp5EGrGjsQ0YadPejcTVPONyGWdE7a/k
         ThjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac16286b93si74794276d6.425.2024.05.27.01.06.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 01:06:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBVMe-0005ce-9W; Mon, 27 May 2024 04:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sBVJu-0000KL-0e; Mon, 27 May 2024 04:03:09 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sBVJr-0005H2-TN; Mon, 27 May 2024 04:03:01 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 27 May
 2024 16:02:34 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 27 May
 2024 16:02:35 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 27 May 2024 16:02:33 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v4 04/16] aspeed/sdmc: fix coding style
Date: Mon, 27 May 2024 16:02:18 +0800
Message-ID: <20240527080231.1576609-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Wmbx8tZ+vz/P

Fix coding style issues from checkpatch.pl

Test command:
scripts/checkpatch.pl --no-tree -f hw/misc/aspeed_sdmc.c

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 74279bbe8e..873d67c592 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -296,7 +296,8 @@ static void aspeed_2400_sdmc_write(AspeedSDMCState *s, uint32_t reg,
                                    uint32_t data)
 {
     if (reg == R_PROT) {
-        s->regs[reg] = (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
+        s->regs[reg] =
+            (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
         return;
     }
 
@@ -354,7 +355,8 @@ static void aspeed_2500_sdmc_write(AspeedSDMCState *s, uint32_t reg,
                                    uint32_t data)
 {
     if (reg == R_PROT) {
-        s->regs[reg] = (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
+        s->regs[reg] =
+            (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
         return;
     }
 
@@ -434,8 +436,9 @@ static void aspeed_2600_sdmc_write(AspeedSDMCState *s, uint32_t reg,
     }
 
     if (s->regs[R_PROT] == PROT_HARDLOCKED) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked until system reset!\n",
-                __func__);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SDMC is locked until system reset!\n",
+                      __func__);
         return;
     }
 
-- 
2.25.1

