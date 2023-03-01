Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7183419ejc;
        Wed, 1 Mar 2023 08:57:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+hzvEh4GkXvG2+RPsQf4Fb5bkx9Eq1AteM1QrUaEW+TcZtCghzD0HzEBtpT5Z94wXzapeS
X-Received: by 2002:a05:6214:250a:b0:56b:fb58:c350 with SMTP id gf10-20020a056214250a00b0056bfb58c350mr15133402qvb.26.1677689836023;
        Wed, 01 Mar 2023 08:57:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677689836; cv=none;
        d=google.com; s=arc-20160816;
        b=x5fCOomjzgX7YyN9x48K3PbFWAP/YTQypZ+2IGIg9RjvvuT+E3g6djjX58fsgS0739
         Q4ZYprQQxZ3Pi40n1njTjuC+qnf+HU/wkA4hz4ZKgO2nrxOQTIS6oarddKjra8ClQZcR
         kfoYZ+2L48CNTxjBPb1GTbDOXVtb0BZxkCvweRuGEbR0qEeakYswXWw/W0XghOKu+iLw
         qLeI0MHlwI9VhTKi7WD6NzkhJUYbJTVwl9euLS2tCEkDZpdAceVpwM7I7hxnkUGh8rDB
         m+GNVtbQiiI4rUMXZPPHmLGnYiKnp8fHblNPUYl5AZy5N2t9jscaYtrkBCk4IY4u6oHd
         vcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=xJGG12o+OdvOFTdFTMI1e4WsxTinazTPA4ozkbXFTt0=;
        b=CKDDYFutlA3uCCwZzLIxxeG7e3nHIFomV5trUXz5vQdQ/X07XFHkqxbRoeYJhI3rTz
         3E447Rr4wY4FpQKa+k3Fav/RdXyGq+m3VNx4Q+I9ijwPjbEQcFVE1EhGyEQ0gpDgBNmy
         IND1seTgvnuRIbSK2n34THupvs5iUqWFflCECzByc2zcl91IguNiRLRkEn+lKD+nb4yg
         O4sN//vjw6MvrMMajykrDQuRUJe93tMc3DS/fV0Id6Lz6hXDVF/0xnPxmga1sAXpZSGr
         u20aB+EtruTzZapUGIwm62xhT/7fv5EfzDVWFV9vM31YCYVNLYlfyW71W3RNa5lLEbaX
         zJAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a05620a430400b00742d6543ffdsi3921857qko.634.2023.03.01.08.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 08:57:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXPkz-0000eN-Vq; Wed, 01 Mar 2023 11:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPky-0000db-J1; Wed, 01 Mar 2023 11:56:44 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPku-0007bu-QL; Wed, 01 Mar 2023 11:56:42 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PRgPG1hXYz4x8x;
 Thu,  2 Mar 2023 03:56:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PRgPB4yjMz4x5Y;
 Thu,  2 Mar 2023 03:56:30 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Dongli Zhang <dongli.zhang@oracle.com>,
 Joe Jin <joe.jin@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 01/11] readline: fix hmp completion issue
Date: Wed,  1 Mar 2023 17:56:09 +0100
Message-Id: <20230301165619.2171090-2-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301165619.2171090-1-clg@kaod.org>
References: <20230301165619.2171090-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=znpK=6Z=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ExDGiP+8lsYI

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

