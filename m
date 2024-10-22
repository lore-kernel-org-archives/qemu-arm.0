Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2942754njb;
        Tue, 22 Oct 2024 02:42:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXV9t6zDUGscGmZF+MrMV6wc5Qk3LsisMWFQWeretYZBDbPkWCE3A8cizeYgsKbcYSaLkegytetD5MuFw==@linaro.org
X-Google-Smtp-Source: AGHT+IGKwcsNuRTRdgJR46SUse+cqj1DR2JDyNNGqT2J9u1/YiuimjLDPui2zq2VSA0SPiEZ7yzA
X-Received: by 2002:a05:6902:1a48:b0:e29:11f4:81cc with SMTP id 3f1490d57ef6-e2e271ca26fmr1446368276.33.1729590134442;
        Tue, 22 Oct 2024 02:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729590134; cv=none;
        d=google.com; s=arc-20240605;
        b=freM2GW84GHDjFjcWplPdPXYYHO4enoadSYyjv4jFfLFP4Btq5h0HSzjOGRFCiSK7P
         BpHwscpRHSDSiTTiDlDzZU581vkYSNzMzQ4b7OXktVhr8MDjh1wZVZvZVaJ3ufmR9G5Z
         7Wl7IcE7kcPBNlnM/NbX6Gff0+tVjwkpiSWlxbGr+z4kIC/9hhE4LMQWjmUQwk6+uO0S
         +R2J0SARLxgSzdcDJ6oGGU99AuZ7mWshF97sRBxoNKSVRrijrQPqjqX8PGcZKuGn4s8X
         eI+tOhmRaipIi6KzTUrZAgR0KpZgb2KSmVJ8K+kEDcpgABuVcC+PqBpHYYeHx9yfnIUy
         S8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=hmiHyedNBjqXGrc3BSmzUGaF8i7Bp7GqG6n0TuLl+H0=;
        fh=tJ6TeM8XDKi6I9LERy0ves/+1WFn5YJhFzDAan5mwNk=;
        b=T3j1t4TQXirkUBjNXYNo06QdKKQPD/rvZAJrdF9zZr04/OB8rPBVvGoj6p03B03gYa
         4MtXRYa1HgD98cpPkh5sQ5OrPRP3m82pSNecKKXgl8Lf2/wVsKqM8hpyk/mUhg0bQnIm
         /JCxXi4GZJl51iSOkBMYZfftesohuIk0R/rFfKjLrhMr0iIgDUCRzo2NGPLG+EpZHIvt
         LaZR0ie0ThJKj6eYmf6f7F+hU9sGNDDnvovbDhf3eZ7a9QA0UbFEAD4Sy7y+JVXlKPsj
         NTzuXUZCIvtuOMhk1ouMyZKkY4nvD1XN3wRs7xnyIw1ws1o4SApcdvX9GE2PwnvRpVoO
         kYRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3b34c0dsi62569771cf.40.2024.10.22.02.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 02:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t3BOm-0002wz-Vb; Tue, 22 Oct 2024 05:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOl-0002va-4K; Tue, 22 Oct 2024 05:41:55 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOj-00015E-S3; Tue, 22 Oct 2024 05:41:54 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Oct
 2024 17:41:14 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Oct 2024 17:41:14 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 09/18] test/qtest/aspeed_smc-test: Move testcases to
 test_palmetto_bmc function
Date: Tue, 22 Oct 2024 17:41:01 +0800
Message-ID: <20241022094110.1574011-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Id5aGi1f4VVd

So far, the test cases are used for testing SMC model with AST2400 BMC.
However, AST2400 is end off live and ASPEED is no longer support this SOC.
To test SMC model for AST2500, AST2600 and AST1030, move the test cases
from main to test_palmetto_bmc function.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 4673371d95..ec1fa6ec15 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -610,14 +610,12 @@ static void test_write_block_protect_bottom_bit(void)
     flash_reset();
 }
 
-int main(int argc, char **argv)
+static int test_palmetto_bmc(void)
 {
     g_autofree char *tmp_path = NULL;
     int ret;
     int fd;
 
-    g_test_init(&argc, &argv, NULL);
-
     fd = g_file_open_tmp("qtest.m25p80.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, FLASH_SIZE);
@@ -644,8 +642,18 @@ int main(int argc, char **argv)
 
     flash_reset();
     ret = g_test_run();
-
     qtest_quit(global_qtest);
     unlink(tmp_path);
+
+    return ret;
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    ret = test_palmetto_bmc();
+
     return ret;
 }
-- 
2.34.1

