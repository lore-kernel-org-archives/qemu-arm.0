Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1035035qvl;
        Fri, 28 Jan 2022 11:19:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/+4684DcZu4tEzEV9TPI6lr7ord9+tjqfT2P4uXHWiBGTZSt87rUyeOfOEXsXev3VtIk0
X-Received: by 2002:a25:2d1d:: with SMTP id t29mr15480923ybt.619.1643397597118;
        Fri, 28 Jan 2022 11:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643397597; cv=none;
        d=google.com; s=arc-20160816;
        b=sLbhwvMab53LviEBlwv4g0hmEdAxW8SMdmk67XjZh4iaJ2jIpXXaFEdl4Q5RRmIZwo
         qtkBOV71RINX6a3LfwEwO2MUHPojHx9mAfD3JRIvqZ6qBznEkQgLeEQgW8k8LdRDyz+5
         EiEzkWhwiMTi2QhggwZiO92NGA8Dvsh89aJoPmZiiFp4uOtisDDf7tYR99zg7SnZce/s
         y8m6J4ncsLlro0JADOTJw9NnZi+w4jVh3Qk0RS8t7BL+U6lAe1zvpWbBsBNaID0oMr18
         /fbZf936OQthhlYJk8W6HO6gg+zkUwVRi98s4/kb5WOCA+e8NezMyUp9jgK5AyFRL/ix
         YAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WqBDQpUHEZjJ9CbMmxkFKgKY9VLv0LHeqJmfi5UhxQ4=;
        b=rLHA7dWM61579H1Ws4nVrYQCk/5rlraNIKaSmRNpV0pHYC9+YWPQ4xAaoM35aqNxLp
         BTxgVGjgLeMBrdPS1QYUXHSu6lPVj0/T2ygYm/p763acAy386WcsHBcGwIBeVwj3NTdA
         fhJRk5Wjb3++CduKTLuCpDwNj7WQ9afrRpEhetZSKDExWNdUx8H6hLxe02pEBXvmyv02
         glEPIUU7g27KRX7SCG96/3UTXKEbtKMO+ehe0yX1kTi1uph87bPNn1/N4Clkbz3aPZr4
         E+rrih6/dAVznKztB9GcmmK0gLJhdXFZdQcF22/wGHEnRTUZ10c30JUwxTm4Fdf7ac2z
         A+QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Nr/o5Mse";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si26820036ybq.330.2022.01.28.11.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:19:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Nr/o5Mse";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWmq-0000eT-M1
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:19:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWCw-0001yY-TL
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:42:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWCp-0002Wa-6g
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqBDQpUHEZjJ9CbMmxkFKgKY9VLv0LHeqJmfi5UhxQ4=;
 b=Nr/o5Mse+y2QdGzHlpSSA0Ah0Lm4zjyo1s93gAL+fxZAUQwWTJfbLtkRaH0HwqsecXsHod
 jDGD/Zp7uruyQj2jPxQMwpcNaDgeSjpFiyPxaDZZ1SDVIq3YA7mpGXvPfAotQyQaRYnnQf
 4cx37maCoAaGPW8tNjsYI5nf2RZW09E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199--RlGShxDM6ukzRTc6JEvkQ-1; Fri, 28 Jan 2022 13:42:31 -0500
X-MC-Unique: -RlGShxDM6ukzRTc6JEvkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C92FC101F7A1;
 Fri, 28 Jan 2022 18:42:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F11617745B;
 Fri, 28 Jan 2022 18:42:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/36] migration: Enable UFFD_FEATURE_THREAD_ID even without
 blocktime feat
Date: Fri, 28 Jan 2022 19:30:30 +0100
Message-Id: <20220128183033.31998-34-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aSNmTLdNlBoM

From: Peter Xu <peterx@redhat.com>

This patch allows us to read the tid even without blocktime feature enabled.
It's useful when tracing postcopy fault thread on faulted pages to show thread
id too with the address.

Remove the comments - they're merely not helpful at all.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/postcopy-ram.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index d18b5d05b2..2176ed68a5 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -283,15 +283,13 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
     }
 
 #ifdef UFFD_FEATURE_THREAD_ID
-    if (migrate_postcopy_blocktime() && mis &&
-        UFFD_FEATURE_THREAD_ID & supported_features) {
-        /* kernel supports that feature */
-        /* don't create blocktime_context if it exists */
-        if (!mis->blocktime_ctx) {
-            mis->blocktime_ctx = blocktime_context_new();
-        }
-
+    if (UFFD_FEATURE_THREAD_ID & supported_features) {
         asked_features |= UFFD_FEATURE_THREAD_ID;
+        if (migrate_postcopy_blocktime()) {
+            if (!mis->blocktime_ctx) {
+                mis->blocktime_ctx = blocktime_context_new();
+            }
+        }
     }
 #endif
 
-- 
2.34.1

