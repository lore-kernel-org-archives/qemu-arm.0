Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp10841ejc;
        Thu, 2 Mar 2023 09:42:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/I0Nu201PWTMPeJNcFwEI/PO/sQWLtq28YkkHLTdVNCxNs+QtX/zKS0iuAbiOOfsbPQvBP
X-Received: by 2002:a05:6214:528f:b0:56a:d94d:6deb with SMTP id kj15-20020a056214528f00b0056ad94d6debmr18527984qvb.25.1677778959567;
        Thu, 02 Mar 2023 09:42:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677778959; cv=none;
        d=google.com; s=arc-20160816;
        b=cJghNKxkoG0LJYebqY2iinvn6AP8hwmll61bwui1mpWaoCITWApCLyxVQWFR9iyGYW
         asWJKyBHQMH2JRbV2Y+JFfmwcCnqnHTOyfpM9F0Cj2Rcf8/KkYU4nTeDtO6KEJPxQeDn
         Hzo24PN2G/p27fZsiJ1r5irG97f3gIY+PYtY2BVlhm4G4oLwoj7bk6Qq2rTOQuPFXtRs
         mwwEIVw9YfbLwpYAsQhQbgAFKfCQDr3Ssht+NwtfxbAfRxuZorAGErDi8xNjaUSmUArv
         n9tgQXbqvmz1Q0/G+zhQMW8kyOeNppWc874uvLL33oM3fdtIbgmxEkggq3pGRWzEcIJV
         pX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=xJGG12o+OdvOFTdFTMI1e4WsxTinazTPA4ozkbXFTt0=;
        b=UKWrRZjfS+7WZ7TQpgdJ4qbIr7xRh1lBDoHLbrhTslBFRDi8JyWpexxxYgLqa5LocA
         8Igu5iXDab+WFpMk6U2mJyK3nhtvOBfTrR06K6zxVuNY2fEfNJq+8SlspRzWnsNWm/ei
         ZF/ANEmGaO/ufKRZo4ulQmLarxAjT4eSAsfenw396BzMp0WbMQv5vea7oBv7b23WNCrE
         TFojcxE1cCdoiLivui882qll/rSo57rpn6zlg2wZoHzJO5P/gwNze0VJbtKvnfIdOBmd
         Ddndt++ZS9M4mgqT4g6OPHkCzkbNMZ8vX8Fw42263slaZLHceYjrrcag9jE1xy0b4WJX
         5Nxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a0ce086000000b00571a3b7791bsi14221800qvk.162.2023.03.02.09.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 09:42:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXmws-0004rf-Q5; Thu, 02 Mar 2023 12:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwf-0004WG-LN; Thu, 02 Mar 2023 12:42:22 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwd-0002ji-Sr; Thu, 02 Mar 2023 12:42:21 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PSJMX1jXRz4x86;
 Fri,  3 Mar 2023 04:42:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSJMT1Cn9z4x5X;
 Fri,  3 Mar 2023 04:42:12 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dongli Zhang <dongli.zhang@oracle.com>, Joe Jin <joe.jin@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/11] readline: fix hmp completion issue
Date: Thu,  2 Mar 2023 18:41:56 +0100
Message-Id: <20230302174206.2434673-2-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302174206.2434673-1-clg@kaod.org>
References: <20230302174206.2434673-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Cwst=62=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: fb4IhBlaZ/zL

From: Dongli Zhang <dongli.zhang@oracle.com>

The auto completion does not work in some cases.

Case 1.

1. (qemu) info reg
2. Press 'Tab'.
3. It does not auto complete.

Case 2.

1. (qemu) block_resize flo
2. Press 'Tab'.
3. It does not auto complete 'floppy0'.

Since the readline_add_completion_of() may add any completion when
strlen(pfx) is zero, we remove the check with (name[0] == '\0') because
strlen() always returns zero in that case.

Fixes: 52f50b1e9f8f ("readline: Extract readline_add_completion_of() from monitor")
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 monitor/hmp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index 2aa85d3982..fee410362f 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1189,9 +1189,7 @@ static void cmd_completion(MonitorHMP *mon, const char *name, const char *list)
         }
         memcpy(cmd, pstart, len);
         cmd[len] = '\0';
-        if (name[0] == '\0') {
-            readline_add_completion_of(mon->rs, name, cmd);
-        }
+        readline_add_completion_of(mon->rs, name, cmd);
         if (*p == '\0') {
             break;
         }
@@ -1335,9 +1333,7 @@ static void monitor_find_completion_by_table(MonitorHMP *mon,
             /* block device name completion */
             readline_set_completion_index(mon->rs, strlen(str));
             while ((blk = blk_next(blk)) != NULL) {
-                if (str[0] == '\0') {
-                    readline_add_completion_of(mon->rs, str, blk_name(blk));
-                }
+                readline_add_completion_of(mon->rs, str, blk_name(blk));
             }
             break;
         case 's':
-- 
2.39.2

