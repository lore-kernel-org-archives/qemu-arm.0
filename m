Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542C3C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 14:39:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgNwz-00079y-7U; Sun, 05 Jul 2026 10:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wgNwy-0006xd-10
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 10:36:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wgNww-0001TL-8U
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 10:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783262161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8AY5qydpCSDNc84ZBXBXAVjwTf6BeQKuqySCp6fMp00=;
 b=XqdXAdXhSTlNmq1+rclI8qd+F6e+NbjJ8c8pPYdQsvq01nHJjx9qRmmufdOLAA12eWc6rU
 8CuxH9qQvFkc8yjPRETpHSZGvHOj/++bC8yEnue8nnzYh283rfk4VSYfm4Bnd4m7rbNS4t
 Mjbxen8t1JAZJ8oW12raNRozNZkPJyM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-UkC8cAfaP2etEQd8f3kydA-1; Sun, 05 Jul 2026 10:36:00 -0400
X-MC-Unique: UkC8cAfaP2etEQd8f3kydA-1
X-Mimecast-MFC-AGG-ID: UkC8cAfaP2etEQd8f3kydA_1783262159
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4773d2405c5so1756960f8f.3
 for <qemu-arm@nongnu.org>; Sun, 05 Jul 2026 07:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783262159; x=1783866959;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8AY5qydpCSDNc84ZBXBXAVjwTf6BeQKuqySCp6fMp00=;
 b=GnFg0mFn0uZ1H3oNnW8b7U2Xa55HRpsGRpySbLe6XCZ9lh57HHZbDgZRzXD70iaSfE
 CW7YpOwFkIlnejFTjRKTfLqXF/3hfFAXHYjgeeQyQ+XgmCtE2vsZujeRIBcmkXgR+FPu
 aYbRoZ+CYtnVslrlm9kqeGZH08L00NGXFtTVFcuAWQzEQIJIfm6SK8CUGav2NGMBO8G5
 ZRl4BOWJ3JHFrioaicOrpGw+DE8NdwoPgyDmew4RJT2msUS7B+ymR9GpjBZY+u0OsK1R
 j8xLFPs/3fs8BkoqrceKjzkB1K5uuNwkv5q2Iyo2uUefXJzCIGlcyVYU3IRrXgW5Qonl
 iHiw==
X-Forwarded-Encrypted: i=1;
 AHgh+RppEdI+sy1pu9N9WjkKEkCGp0NsqAAAO6L8l0BwLdNmDmsgORHCr5zJRm1LlC1CfBOA0iABDe8Q3A==@nongnu.org
X-Gm-Message-State: AOJu0YwzL5SxSNo0qa958chTNbOsJYM2jmPIOu7aoer5kUKol6H+Dcc1
 3gKkIwlaNFOXhpKe4Lnaf4lrJP9ITuciWzGcgAFs610+ucKg9NFidccfUFKnSbFX4nPk18TE8CK
 p61/POxzhQqVGgl3kboV/IvBPacAi8Pb3rSM2AAp+D/Kmp5SBt+dDfQ==
X-Gm-Gg: AfdE7cmnfrxjr/cdnIn3IQqBBaBvewOulGK034fry2Eu/cu8mrbdtT7Rdn2rv1JmRSg
 rclHzz/T93WYsMphnz+LnQPh2gTpaOTdgS0J2u5foRfI5pLscXdBk4YbTkXpI8JKs0wsKD0EGf8
 eMGinrI4TT5VikNPjyetuNGutHd9zf8RGUAxsvRKJYiRsgkhtngqcwJZ1y6UVKf2XkVGg+LvkQ5
 DzJ9uNqfA0T9PiHWHxCb7+J+8UaUfwdO7N+y4N/aEyOi5opC2ZKi1x3hrJ+g5CNROG4UdHnr8C/
 XCcM9WAPXXQiyo1jVJsRcIuMt28afAoVOx4Pf58GlJR9TWqL4i8KAlZy2IUT7rJK8tKlAshPN+b
 1X3HJDbjMNnmLLExNbc7RXFdxY9cp88Dv
X-Received: by 2002:a5d:6e64:0:b0:476:681c:4642 with SMTP id
 ffacd0b85a97d-47aae0da59fmr4707036f8f.44.1783262159197; 
 Sun, 05 Jul 2026 07:35:59 -0700 (PDT)
X-Received: by 2002:a5d:6e64:0:b0:476:681c:4642 with SMTP id
 ffacd0b85a97d-47aae0da59fmr4707006f8f.44.1783262158569; 
 Sun, 05 Jul 2026 07:35:58 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f21328sm16706668f8f.32.2026.07.05.07.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 07:35:58 -0700 (PDT)
Date: Sun, 5 Jul 2026 10:35:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org
Subject: [PULL 31/44] arm: sbsa-gwdt: add 'wdat' option
Message-ID: <51011f7f36b4406718d9698530c4e9d920184755.1783261895.git.mst@redhat.com>
References: <cover.1783261895.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1783261895.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PTjTYRESEtdRgJulASf91xBH1EzWXgzHQTLYCdQViAA_1783262159
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Igor Mammedov <imammedo@redhat.com>

it will be used by arm/virt board, to pick WDAT compatible watchdog impl.
and act as switch over to WDAT ACPI table vesus default GTDT ACPI table.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20260702145856.1539572-6-imammedo@redhat.com>
---
 include/hw/watchdog/sbsa_gwdt.h | 1 +
 hw/watchdog/sbsa_gwdt.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
index 8941dcff9e..5ad7c7a798 100644
--- a/include/hw/watchdog/sbsa_gwdt.h
+++ b/include/hw/watchdog/sbsa_gwdt.h
@@ -73,6 +73,7 @@ typedef struct SBSA_GWDTState {
     uint32_t woru;
     uint32_t wcvl;
     uint32_t wcvu;
+    bool wdat;
 } SBSA_GWDTState;
 
 #endif /* WDT_SBSA_GWDT_H */
diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
index 49fdd723c2..330a74798a 100644
--- a/hw/watchdog/sbsa_gwdt.c
+++ b/hw/watchdog/sbsa_gwdt.c
@@ -265,6 +265,14 @@ static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_irq(sbd, &s->irq);
 
+    /*
+     * WDAT spec: "The clock interval that the WDT uses must be
+     * greater than or equal to 1 millisecond."
+     */
+    if (s->wdat) {
+        s->freq = 1000;
+    }
+
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysinterrupt,
                 dev);
 }
@@ -276,6 +284,7 @@ static const Property wdt_sbsa_gwdt_props[] = {
      */
     DEFINE_PROP_UINT64("clock-frequency", struct SBSA_GWDTState, freq,
                        1000000000),
+    DEFINE_PROP_BOOL("wdat", struct SBSA_GWDTState, wdat, false),
 };
 
 static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)
-- 
MST


