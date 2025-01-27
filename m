Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2319237njk;
        Mon, 27 Jan 2025 01:44:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcBwlohE1rKdzStCEQZnyxDk9U6K+k23Ij5qG3tdkwC5hNo2evtPFnc9FQk9efnutD8/DYiimH0F7wzQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHoT8jFkeHHy0GmN3LlB6gBq6oeR7id3+iX3gwmRtpAUPi0qyJtCzUmsmrj8tZ7cciv+iXI
X-Received: by 2002:a05:6214:d63:b0:6dd:be26:50ba with SMTP id 6a1803df08f44-6e1b21d4775mr628778236d6.21.1737971064193;
        Mon, 27 Jan 2025 01:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737971064; cv=none;
        d=google.com; s=arc-20240605;
        b=KiHr3mNQlHJRzNVk4O/my34yLZxnzzfflUKO4iGf04bgTdbXkt6t8Pi6nnbdqLtvQ0
         ipCjulwegNb+vwFZCue4mPorTGcX7i+mBZFepPJgybY30/6oujXO3BhiRGROIiVxHt5A
         EMnqldGIVJzn6Fa2rlVGUh/gYHQIEKOeGoG2S+wk0Lp2DK9CY4B4nPmxqGvnfje2VS2S
         8/PLfOweD0SBGBdB0bLWlLUSHtg8YuMbxdj1SJ42mf6nb7dDvEv8yQ2qyKtWi+l/jTM8
         YiZaufBJdAwqvYdYOnu/MXcfyLPxXCRaidrUSSTglPntFHh1N/Uu+BGyD0scZHsqYHVP
         tB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nMfgIvusmI8wa3cfNqfQPEho99/5GV19sIwzwHLQVDE=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=KhGAapDsgQm7Q8go9gyDGfkff+1TMZxkEZ7RZXcZgZkHE8KMByng3s9D21q/3AhNE6
         ZNw3Vm9lE7gka0dGYp9E4KjoAHxNVfRkAhsF3ApVcf6MaotrYVtbx8y6Vxq7miJGlmWa
         46O0zZsaO2YArqIZkigKq0xt3Y6aGboibs0QH8kjcnACCRsEz82rPcMFKd2ZgVvFVjUk
         pFYk7ukhPKWI5rfW1LBlCtMPF811eX8A7x+e+Bi0OSl8Dp7n9TOvR6PkLNRSBRVPSDyW
         sWIPnDtVAX55WmlQDZ4xUHe2d4MKQ074ZJ16/wj1imAIdJ9Fc+bUp8H5bzNATrnV19Dx
         XTeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i8fSK1HX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6cf11b2dsi74132321cf.451.2025.01.27.01.44.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 01:44:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i8fSK1HX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcLeq-0006h0-3a; Mon, 27 Jan 2025 04:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLeM-0006RK-VN
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:43:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLeL-0005Sx-7C
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737970999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMfgIvusmI8wa3cfNqfQPEho99/5GV19sIwzwHLQVDE=;
 b=i8fSK1HXbqaX5fymWxrXqvbDZN0YYkAhNYdpr1PWxbjQthiFBJhC2L4D1we78p4oKgG0mv
 GhAuNbEMbQVMBfl0v0Pfn/g3AAb4T2A3fS1Eo7JsCdkHWj0Et7ccXealR3ruJ8ywlxIOpU
 Oc8MUZABTs1Z+OKziXTctj7uv1VDJ9E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-150-eP9-IMxOOB-PFHjxgLzHQw-1; Mon,
 27 Jan 2025 04:43:17 -0500
X-MC-Unique: eP9-IMxOOB-PFHjxgLzHQw-1
X-Mimecast-MFC-AGG-ID: eP9-IMxOOB-PFHjxgLzHQw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8DB8A18009A8; Mon, 27 Jan 2025 09:43:16 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C5BA81800365; Mon, 27 Jan 2025 09:43:14 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 10/12] aspeed/wdt: Fix coding style
Date: Mon, 27 Jan 2025 10:42:37 +0100
Message-ID: <20250127094239.636526-11-clg@redhat.com>
In-Reply-To: <20250127094239.636526-1-clg@redhat.com>
References: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: auPoHGhEZfMG

From: Jamin Lin <jamin_lin@aspeedtech.com>

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250124030249.1706996-2-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/watchdog/wdt_aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 81f5c5189a3f..22e94e7b9c99 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -278,7 +278,8 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expired, dev);
 
-    /* FIXME: This setting should be derived from the SCU hw strapping
+    /*
+     * FIXME: This setting should be derived from the SCU hw strapping
      * register SCU70
      */
     s->pclk_freq = PCLK_HZ;
-- 
2.48.1

