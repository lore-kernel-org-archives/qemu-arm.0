Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3845307njb;
        Tue, 10 Dec 2024 22:33:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAmKttGR7/tOGGGIiHHyIOFhuwKqrsm+Hakz/073Wmm/RaG1iTG52C9EQt6tjaLs8T8Sp610/qu2FXsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGGdzg17eu7HQnhl18gIuWChjsSQLU+NBelEV6jSKQuLQTkTl+0dg+e4l/azsK6Zoo31M13
X-Received: by 2002:a05:622a:1186:b0:466:a20c:a67a with SMTP id d75a77b69052e-46789376f95mr25738001cf.38.1733898785995;
        Tue, 10 Dec 2024 22:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733898785; cv=none;
        d=google.com; s=arc-20240605;
        b=DQkrd7EdIVPEq/Es2JkGo1CdwGflVYK3SAR15Bt4CjlEDyJZ2RzKClvpU37VKRWo5A
         TL+xeE0HLFMr5980SGn89UTZ0dw+62RFxvsZUIRRLguYyXJHIkm7hFCs05o7xFzPseLd
         e/wWgUhVzop5cW0svf/r9i92vnJXOwHi1JK8XVl1v8mK8xbUB3N/SRC+rOXWztPJGdTn
         gtHMP8Tguijj7qIFfMGcz23f8g5q4kxa87NFMR/Kr/5m4pbRXeeqCb1+LGr9EOQhdyOf
         RX7YzFjJFPgcxLFdmr0WCOdrAp1w5taPWwvhynTEpLkD4zBvW0EgSubt0PnF52H0nllE
         0d1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vfhwq9kS1jpGYe1Yv9g+Pi+C2jI0WdU7qzoqs9fe0qw=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=GGKBpsWETkmOwt78ZVIPuyTtxEPT0FFcsTytCCA1f7NTfy3oO9UZHzWaSZL9BzgrfP
         SNJ6bsWniT/DlSXt0pYYHlAMc/V+HqSf6bBetYEo+iFCHR2M/Qay0LcV5R27WnzN9SC/
         4jB1F+EH4d15oq0LQFhcDL8w9ia7pCEB+nS+dasz8ksk30WHzTvkC8oXABU3zFcBYI0i
         feFKze1jUA4xlNKCld/dXD7XhghBjjIEuUjDaU56T47PnQPUu1XU7MMXdtZ03qrFKsHY
         PvinOt9GFJjZd1OImUDwr/DrHc62CquzOQ6QraLewV2k4H6TXDQdRB5ry9iBHKvZdygA
         8RAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aDMUa7fm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467879bbd94si16386731cf.332.2024.12.10.22.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:33:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aDMUa7fm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLGH7-0006ar-OI; Wed, 11 Dec 2024 01:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGD-0004ld-Pm
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 01:31:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGB-0008VX-Jd
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 01:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733898702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfhwq9kS1jpGYe1Yv9g+Pi+C2jI0WdU7qzoqs9fe0qw=;
 b=aDMUa7fm6uvNhCBXHQv1CX+F7Q7caUlsbuJdWw0l6Cvgf8ClO2QMUgnROKpTWImxclYgZH
 S+IQS9Kea2X8Lcf23aQjO6buRF4MeionDenKoHOQWZ1snjHY2IJKN21hTBRyShbEe5uszf
 k+ASe8UfhA9276JR0ON2zR25OWDDCP0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-UQhTs52jMMe9bi7VEf4kLQ-1; Wed,
 11 Dec 2024 01:31:39 -0500
X-MC-Unique: UQhTs52jMMe9bi7VEf4kLQ-1
X-Mimecast-MFC-AGG-ID: UQhTs52jMMe9bi7VEf4kLQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A54981955E70; Wed, 11 Dec 2024 06:31:38 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.144])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 440BC1956054; Wed, 11 Dec 2024 06:31:37 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 15/24] test/qtest/aspeed_smc-test: Move testcases to
 test_palmetto_bmc function
Date: Wed, 11 Dec 2024 07:30:49 +0100
Message-ID: <20241211063058.1222038-16-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
References: <20241211063058.1222038-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XY1q69f5VuDg

From: Jamin Lin <jamin_lin@aspeedtech.com>

So far, the test cases are used for testing SMC model with AST2400 BMC.
However, AST2400 is end off live and ASPEED is no longer support this SOC.
To test SMC model for AST2500, AST2600 and AST1030, move the test cases
from main to test_palmetto_bmc function.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20241127091543.1243114-2-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 4673371d9539..ec1fa6ec15ac 100644
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
2.47.1

