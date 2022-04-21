Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp373590lfk;
        Thu, 21 Apr 2022 06:57:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEhNrDGK66reWOHqGXdwE7jwHQGpw1ABwiiccnkLveCxhNf2oqWzOCq8MJpssx+ZDlg0/e
X-Received: by 2002:a25:264d:0:b0:645:5c56:e475 with SMTP id m74-20020a25264d000000b006455c56e475mr6004420ybm.220.1650549443697;
        Thu, 21 Apr 2022 06:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650549443; cv=none;
        d=google.com; s=arc-20160816;
        b=QfmNiH3UVkr2FvXYKhMs05PcBaUvqelEtAFtzBiVDHQ56pSJwEbF9Ns2BSJeVApqaL
         uKHQ1nQ0CXTjLCyJjMLUU5njlNsfK6OYHtODsr8iTJdKoJFgMudUv/2xDBPhnKz4t+1h
         D7qqzdSxWorE2Hl52t8lbKxcL8sP4r7/wrFWjRHPMVMVv3ICBlDiIjDDzE9iZ1AKgACT
         xW1qqmS5Ctd3p3kElggksg5mXUWo1yV+HKJrqxIdXPHTqgOMqBSi7uebXX2aiL+gChhW
         bSO/PhYjl5MONCofDHqOE89Paob+Hm5Weby/ULyVETzRgT9UKl+u7igw1xw0WpjbT3xO
         7gjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tG6e3wxrRfYTP/3XF750OQ7rTUwvynv/Ev+Pj/rZzLA=;
        b=OkzX57dPy+U/Ic+8ibsylFRc6K74ucl9XURd7mCXCeh34EmSoleG41HWT20ayRc9uH
         hFisi6UP7FSrL5OW10IfKWgd8i9tZYjvsN2nk7APcPYTZJV63cQ0Uebyal66EJeSD1cD
         7vNfvawS2HnJnzCtlzvSRyNKiULJiauUOsV48N9Tw4PPWh5EVLqLUeUMYKqkljThxpxd
         RVf7t0zJ/6R2zd1twjUqnUbO4Wy9qRwDM0nD0SeC9v4L11Z1LmZqkwSzZtISULUk4Go2
         GhK0hYKR7HNXjaxAhHyduFAkij/as1mGu+DatbQsSFMJ16Uk7lo878DGAKMaCGiiP85s
         cv1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cVEBhoVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 144-20020a810496000000b002eb6e626071si2342076ywe.130.2022.04.21.06.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 06:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cVEBhoVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhXJD-000863-3Y
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 09:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCn-0003HU-MX
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 09:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCm-00067s-3D
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 09:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tG6e3wxrRfYTP/3XF750OQ7rTUwvynv/Ev+Pj/rZzLA=;
 b=cVEBhoVLS/FHTaBcD6VcuQ7NP3T4qFh1t+1oXyHmwuX8jiiSN4UsgVZ5hPgUDZDNXbzUg1
 vrirN/R7beJ1r5JGSPQGV4z/4hcXfXf5f7HEHYfF9+U8MUxPE84GJnr0y0RSwXrAQqLnnt
 CLDb6md1ufLnAsMKTt1VpHH/bMmM9qU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-GvQBTdeZMniUSolwQgP6PA-1; Thu, 21 Apr 2022 09:50:38 -0400
X-MC-Unique: GvQBTdeZMniUSolwQgP6PA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B716E80159B;
 Thu, 21 Apr 2022 13:50:37 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D034D145B99C;
 Thu, 21 Apr 2022 13:50:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] intc/exynos4210_gic: replace snprintf() with
 g_strdup_printf()
Date: Thu, 21 Apr 2022 17:49:20 +0400
Message-Id: <20220421134940.2887768-11-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>, richard.henderson@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y0k15CMQcQnG

From: Marc-André Lureau <marcandre.lureau@redhat.com>

While at it, replace '%x' with '%u' as suggested by Philippe Mathieu-Daudé.

Also fixes a GCC 12.0.1 -Wformat-overflow false-positive.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-16-marcandre.lureau@redhat.com>
---
 hw/intc/exynos4210_gic.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index bc73d1f11524..f8dd719caa1e 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -289,10 +289,6 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
     Object *obj = OBJECT(dev);
     Exynos4210GicState *s = EXYNOS4210_GIC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-    const char cpu_prefix[] = "exynos4210-gic-alias_cpu";
-    const char dist_prefix[] = "exynos4210-gic-alias_dist";
-    char cpu_alias_name[sizeof(cpu_prefix) + 3];
-    char dist_alias_name[sizeof(cpu_prefix) + 3];
     SysBusDevice *gicbusdev;
     uint32_t n = s->num_cpu;
     uint32_t i;
@@ -322,8 +318,10 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
      */
     assert(n <= EXYNOS4210_NCPUS);
     for (i = 0; i < n; i++) {
+        g_autofree char *cpu_alias_name = g_strdup_printf("exynos4210-gic-alias_cpu%u", i);
+        g_autofree char *dist_alias_name = g_strdup_printf("exynos4210-gic-alias_dist%u", i);
+
         /* Map CPU interface per SMP Core */
-        sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
         memory_region_init_alias(&s->cpu_alias[i], obj,
                                  cpu_alias_name,
                                  sysbus_mmio_get_region(gicbusdev, 1),
@@ -333,7 +331,6 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
                 EXYNOS4210_EXT_GIC_CPU_GET_OFFSET(i), &s->cpu_alias[i]);
 
         /* Map Distributor per SMP Core */
-        sprintf(dist_alias_name, "%s%x", dist_prefix, i);
         memory_region_init_alias(&s->dist_alias[i], obj,
                                  dist_alias_name,
                                  sysbus_mmio_get_region(gicbusdev, 0),
-- 
2.36.0

