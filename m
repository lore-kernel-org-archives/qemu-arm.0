Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51788C44500
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 23:02:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgsJG-0001Qy-B7; Mon, 06 Jul 2026 19:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3rDNMagYKCJ0QFQRPODLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--titusr.bounces.google.com>)
 id 1wgsJE-0001PS-TW
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 19:01:04 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3rDNMagYKCJ0QFQRPODLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--titusr.bounces.google.com>)
 id 1wgsJC-00073K-CP
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 19:01:04 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-c860544c077so9783657a12.3
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 16:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783378861; x=1783983661; darn=nongnu.org;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=J+qpsqU8VhBrKTgqKD73tYWfvmDVFPfz1aysCbRxf74=;
 b=IRDA5c2saCCeTkgQ3qS8lb8oZmmy1LAwCV9YaZF8tqZB5wF/IgfKaVmGwwv/DlJOpW
 Y2O9siG0iJtAs0VYLux2/cDHMH2GXwwqZ8RMxCyQ2MStfIPRzZ+KLP2RlGzkDFtwC0XT
 XP9u9sGm0F2g2pcpAg29BqJOuD3n8bacgSC9efPBYxbpz7Qqd8sq3Oj4rWooE7mtCtTx
 G8QMQr23eND2CvNs6T8FtgRJtkATMKbi4A86JzmVRutUGs+goLB8yP3m/tVC/gCS3SpX
 LyAOAW52NAXcgXViHo4VwQcReofJRt80DEjMYGb/La8ZOVUp1qZNJJZu2j9pVbVtndpP
 ra8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783378861; x=1783983661;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J+qpsqU8VhBrKTgqKD73tYWfvmDVFPfz1aysCbRxf74=;
 b=HiT874mu+FbaBwKj5+N6uPpZbDpQ+Q7EeRgfYEppZU/UNVgmKYSJamKvxYIqxWsg+4
 YG0igtF+nr6oXorqWLHm4DW+D4B5WCDnaVXXZCxS9GUiAHG4KLRdIBc3ISxg5kRIGr7K
 utBczA0YwQRcs8NYVh1GrGSwZ1FWGKTG1/OHxkCa6nK7Bzze2mA6DQQ7TQdwMAryyqpy
 dX6+8JVxH6ENtpFiXrNt1i9soh9hbo2cqKLHF5XbZNJLls3AKIo/WL+mkcV3u6cFYg8i
 z1AN+URSmIN8+I2X295xwzUIkzpAxgH8LK/sOAxh35BhRn+nCjP77ToT1a1YSHol1Qrb
 SI3w==
X-Gm-Message-State: AOJu0YxfN519Jvv4VefseOALqYzEwXz2Kude0S66qmGCytSBZgORQX9Y
 Y9jzSgCWjgBwiK5eeH+UdfCwxWRYWdC71QebZvg5K0AcgEdI1pvIiLAef2gLY1sDT55NZuc8q3+
 7uRyV9Q==
X-Received: from dlbqy20.prod.google.com
 ([2002:a05:7022:ef14:b0:139:ad69:296f])
 (user=titusr job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:684:b0:3b5:6b5a:4f29
 with SMTP id adf61e73a8af0-3c08ee38980mr2865681637.30.1783378860644; Mon, 06
 Jul 2026 16:01:00 -0700 (PDT)
Date: Mon,  6 Jul 2026 23:00:50 +0000
In-Reply-To: <20260706230056.1888992-1-titusr@google.com>
Mime-Version: 1.0
References: <20260706230056.1888992-1-titusr@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706230056.1888992-2-titusr@google.com>
Subject: [PATCH 1/5] osdep: add DIV_ROUND_CLOSEST
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3rDNMagYKCJ0QFQRPODLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--titusr.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This is taken from linux/include/uapi/linux/const.h to match the driver
behaviour when reading sensor values.

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 include/qemu/osdep.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 1ec5b42230..a6a40ab8df 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -522,6 +522,20 @@ void QEMU_ERROR("code path is reachable")
 #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
 #endif
 
+#ifndef DIV_ROUND_CLOSEST
+#define DIV_ROUND_CLOSEST(n, d) \
+({ \
+    typeof(n) __n = n; \
+    typeof(d) __d = d; \
+    (((typeof(n))-1) > 0 || \
+     ((typeof(d))-1) > 0 || \
+     (((__n) > 0) == ((__d) > 0))) ? \
+        (((__n) + ((__d) / 2)) / (__d)) : \
+        (((__n) - ((__d) / 2)) / (__d)); \
+})
+#endif
+
+
 /*
  * &(x)[0] is always a pointer - if it's same type as x then the argument is a
  * pointer, not an array.
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


