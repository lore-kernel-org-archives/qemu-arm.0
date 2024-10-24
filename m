Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp125531njx;
        Wed, 23 Oct 2024 23:36:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVs2p89IU4eQZL/6VhCU4n8IJqc3LdwkCFIeZ10IhSzjNoGqacU28ymF/AQDThF/ab7lsH482yq6o53Eg==@linaro.org
X-Google-Smtp-Source: AGHT+IHRQxFK9XtHgnTSymlca6NXMaiIs5pbtptXX/K5UVRSI6KUaPUSfWQvpvAJArYlWKUCvq6z
X-Received: by 2002:a05:620a:1791:b0:7b1:517b:ac1e with SMTP id af79cd13be357-7b17e5bc60fmr657662485a.59.1729751771526;
        Wed, 23 Oct 2024 23:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729751771; cv=none;
        d=google.com; s=arc-20240605;
        b=a3BfmfRvVNkKvBmiyMI8lcrCvCUG1IwBqfVe7KNeFPkQ15M9HGLB9E8i3sb0xobY0i
         byHJvRBG3IkQalQR5DJDrt7hdeTp/f147bifPDwV75QGR/hJtpxqGupem6ffQphDUWW9
         WcckFbouhATBCYuPWoVvwavKylceLp9Cv/CH/1LUaGLycBY008OU6fjKoKbU3/80Mx/K
         /Ri4gS1w01Up9WGGOT81j5k5X9fW336MhzMwtTJVv4z9tT9PtqlZ4rlZK3w/rUkt6FN3
         6x5Jt4jJy76IccbMe3WPLfDYToRpiEavklgbsUC2HPVA/mBXOSOrEZfswGVNL+RSgzr3
         4XHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=in1fEYqv6YPWd3G/6wnJi4lRfQFwyEsnfr6TOmiHWxk=;
        fh=3ckr5lrDF2pwmhVsvExtISKBTABGBd3oRVaeNcIDnTc=;
        b=TeF9wso7Nyzwz567YurL9TAZe3ZAMynGoudEQFNq+0PFNHeYagywRlVsGtHGRbcKcv
         Aw6tSsqlxKSuLUGI3Scb4s++II8exLGlYvoDX0SXqNHf827ulmTSzNnQ50WZzwZiqEAn
         JvERRevIxvv7YQr9zt7Ji37Q9RezAg84WS4SdfUAC9G5oLiLSmql4lhHjGD5U7deDDPM
         VAvhgKR5EKwujpTstiOHJQZt+hEAzR6YjNAUQXLUjdVxkb4RqlS1faSR55dxALOW8ZKb
         R5Ni+snZsJL4lFHbvDixK/9D9MlksVvX36Pg9QajNS6ytqAPRl9XW0H4iRdLvufNK3Sl
         YziA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hco+ACRJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a8905dsi1072677485a.444.2024.10.23.23.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2024 23:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hco+ACRJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3rS0-0002Qn-Qx; Thu, 24 Oct 2024 02:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRy-0002QG-QZ
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 02:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRw-0003Ul-8m
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 02:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729751759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=in1fEYqv6YPWd3G/6wnJi4lRfQFwyEsnfr6TOmiHWxk=;
 b=Hco+ACRJwaV8KGuDFk/73LaqFFwXQdILExrnHBscsRnDQT1NyEjLw/u7yfZFcyxrm+3F+T
 hsxxEo4TFkyPzOiKGmE1TR/rv+2avzVY2EwWEhy2125x9UYsJoDES09F2BvjyyJ0/W4xSn
 0H/eG4w+y8fFshTJwQmxuhqh8beSNMY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-WC57GxbKMVqVkO9O4cik4A-1; Thu,
 24 Oct 2024 02:35:56 -0400
X-MC-Unique: WC57GxbKMVqVkO9O4cik4A-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 24D911955F42; Thu, 24 Oct 2024 06:35:55 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 868B81956056; Thu, 24 Oct 2024 06:35:53 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 17/17] test/qtest/aspeed_smc-test: Fix coding style
Date: Thu, 24 Oct 2024 08:35:07 +0200
Message-ID: <20241024063507.1585765-18-clg@redhat.com>
In-Reply-To: <20241024063507.1585765-1-clg@redhat.com>
References: <20241024063507.1585765-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.263,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.697,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: poiFLoPlRbGZ

From: Jamin Lin <jamin_lin@aspeedtech.com>

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index c713a3700b6d..4673371d9539 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -353,7 +353,8 @@ static void test_read_page_mem(void)
     uint32_t page[FLASH_PAGE_SIZE / 4];
     int i;
 
-    /* Enable 4BYTE mode for controller. This is should be strapped by
+    /*
+     * Enable 4BYTE mode for controller. This is should be strapped by
      * HW for CE0 anyhow.
      */
     spi_ce_ctrl(1 << CRTL_EXTENDED0);
@@ -394,7 +395,8 @@ static void test_write_page_mem(void)
     uint32_t page[FLASH_PAGE_SIZE / 4];
     int i;
 
-    /* Enable 4BYTE mode for controller. This is should be strapped by
+    /*
+     * Enable 4BYTE mode for controller. This is should be strapped by
      * HW for CE0 anyhow.
      */
     spi_ce_ctrl(1 << CRTL_EXTENDED0);
-- 
2.47.0

