Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2002424njc;
        Mon, 4 Nov 2024 02:17:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJh29Uw5JK67rVHhVtPemgCm8mXjnWyeVMyfYz/oMVFOp7y8pRNzc1/gjgBhHgJMVdPnx3JZp0oMLW+g==@linaro.org
X-Google-Smtp-Source: AGHT+IFLH/f6QSS/BApnMyPp/1qI+g1jgnQz9VTlWKA71xV6Dfq0i525WRuigjepRXBNXrfAJI0C
X-Received: by 2002:a05:622a:528c:b0:462:b7c9:10e with SMTP id d75a77b69052e-462b7c901c0mr180578021cf.13.1730715425780;
        Mon, 04 Nov 2024 02:17:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715425; cv=none;
        d=google.com; s=arc-20240605;
        b=fpG5Uyrz6aRhAeivA60tRTPX1k87Klw3SzuH7p57tZy9aQOEKwhdDw2CCpmDrdt4p7
         mxjGHkr4yvLFVgSHHXmLQHbdg+XWsoRxTyRBC9+ioCmIf6ZFKUdpuWU4Z6jaiYYAYgOu
         29exEbmspaYHBQAJojFpZdf6hdj9YbjgjLAXPc325srLbJCY0/iIE3M5bZ2q13YzhJtc
         jhiGZe6dhX9+aaAcpxwFhJu7jj0+yOzVxAaye9gkXxUvkPl9UyziuZRb6o9jJC8SIVjz
         IkckHE5XYjGzufyXQhrDctntPD/1+kdkcVIfgCBH1f04saxmUcR6s5pPvmMvRslq9ME3
         oO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xzjU1g3JiGJotP6otX8pU85ptag0kOQoUbS3ylFujAw=;
        fh=bjj+s01dIyZ412iIXnYIb7+z+U9huZ0SIYlcaKBgZRY=;
        b=f5Dk3XQzuhk4PxbbCxfChQYs5h1DVx0QxRP3fcdRD9fCKl1eeAhfA2mATeMMJC8fE0
         26Ph6SMt7eAdKkwBShIUZXIDyH0nRatIRkbuEKBbEEb6JNtnToJw3LGuPD3vS2UJky8F
         oImnSTo1mm1k5RK9eW8b9GyEFBXj7eFeCJ+hvRIwNT365V+6cUs0rpfEoW4otoYdix41
         sBjxW7anL2fxh3FnXgUylFRsEs6Ft+2OgDRQVZfYvybJpJSjVcxk+X3Eu5PLv/vXHshB
         lZ9DULRlDSnl0CfdSedKtknCwGSKM8465Q0VoKDiZJ/6nnj2OPvT84AEsCCj/Ama5kLC
         lI3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dFeS3xqa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad24fa79si102440021cf.649.2024.11.04.02.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:17:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dFeS3xqa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7u7K-0000ic-Sd; Mon, 04 Nov 2024 05:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7B-0000gp-OY
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 05:15:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7A-0006X2-Az
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 05:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730715315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzjU1g3JiGJotP6otX8pU85ptag0kOQoUbS3ylFujAw=;
 b=dFeS3xqa8hqF9VNSaQkunP4HV1UJjViQSr8TrqW89YKFw0x28+xxdOxcCti4XwWgVibVgl
 4CR2uJ+mc96Vd6mEsw1uxxF98TDUe1ilpaWIlyWhlyjXmTKFitPf536fwM6sILwLAPLTnM
 MCrSFTMd1Ajqgz0/CGUfOFJ9MgJHQy4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-261-89-aVbhNOiedmt5namBC3Q-1; Mon,
 04 Nov 2024 05:15:12 -0500
X-MC-Unique: 89-aVbhNOiedmt5namBC3Q-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4D00A1944DE5; Mon,  4 Nov 2024 10:15:11 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.67])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EF71C1955F40; Mon,  4 Nov 2024 10:15:08 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jan Luebbe <jlu@pengutronix.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 02/10] hw/sd/sdcard: Fix calculation of size when using eMMC
 boot partitions
Date: Mon,  4 Nov 2024 11:14:53 +0100
Message-ID: <20241104101501.2487001-3-clg@redhat.com>
In-Reply-To: <20241104101501.2487001-1-clg@redhat.com>
References: <20241104101501.2487001-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: oT0Qj9XPxZkQ

From: Jan Luebbe <jlu@pengutronix.de>

The sd_bootpart_offset() function calculates the *runtime* offset which
changes as the guest switches between accessing the main user data area
and the boot partitions by writing to the EXT_CSD_PART_CONFIG_ACC_MASK
bits, so it shouldn't be used to calculate the main user data area size.

Instead, subtract the boot_part_size directly (twice, as there are two
identical boot partitions defined by the eMMC spec).

Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Fixes: c8cb19876d3e ("hw/sd/sdcard: Support boot area in emmc image")
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/sd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b2e2d58e013e..f9bd03f3fd9e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -834,7 +834,9 @@ static void sd_reset(DeviceState *dev)
         sect = 0;
     }
     size = sect << HWBLOCK_SHIFT;
-    size -= sd_bootpart_offset(sd);
+    if (sd_is_emmc(sd)) {
+        size -= sd->boot_part_size * 2;
+    }
 
     sect = sd_addr_to_wpnum(size) + 1;
 
-- 
2.47.0

