Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3171398lfk;
        Wed, 20 Apr 2022 07:19:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoZiHgaa1sPBCmiCjaeQTgop1qsPjsLlN6LY/Aa12zEx3pSfP5xx7jVj88ja4IUx7GGZem
X-Received: by 2002:aca:1707:0:b0:322:9a4c:f1ad with SMTP id j7-20020aca1707000000b003229a4cf1admr1763310oii.155.1650464391887;
        Wed, 20 Apr 2022 07:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650464391; cv=none;
        d=google.com; s=arc-20160816;
        b=Rczp1CV85iO+p2uaSK0TBuhOPGU6bAYIiGyHFdPFavaHSmFUdB+I82lV7YrQ71VLtA
         MnprcJBQBUPtRfzdqATMpC+t0W5OsCMuhTmkkNxCmGpSWQhurwQycsk5uYBLp6oM9ZDb
         isTbTXmzYAOtaOXUZw2Dthy0WMdQywjsabDXtSLNT9S8YuEapijgsBcG5KCvb01IoDCH
         TBsIFLpJQmF7yxaT8tPRm5jAOUQzBz0K8e3+/gV85gvdV+WZdyn6O/QGH0k7G+zxMGKl
         kjuNbY/kAu2LA9WwyqBl9eEusb0JfTHN/15G8PjGdfPaFjx5blHz9Cb3VfZ49xGLpsIE
         7Wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UZ2eznqa9Zx7NtKofWe9dQKBANAIBxvW9HSLIqG+Mg0=;
        b=yDK3+AuMBIFd8hkqMHD4HMO/Zho77I0wqvfxPOer71XaJaHsSU3MhwFqJUt+wtVjos
         CkzrBc+8MrbISR4xChmDM5Alx9O9Hzkv0GzkOAl1Upe77rMrxQ5PTdL6GmmP6i1infkU
         Lg3YB4tHTwsyvOgN1K7dFAwHsuzaD/16lSaa+/YGm7nXBaZkcTy8SY4qsm8TSexvbp+O
         9aOCZEF66PNC7ltVeeJmyahZ54R9ZVvQoVVe+KYLz14dYyIY3Ok4mxWj7wHrBYfm8Zgz
         0CuEq455eY9+eUpisvIUORnDD0rrmQtOkDYUgBOfRRqGdDwIuUX/xuV3kLHegSACt0FR
         qLlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dBnQtofZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn17-20020a056808231100b002ef0c3475b8si950830oib.56.2022.04.20.07.19.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 07:19:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dBnQtofZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhBBN-0001SU-SL
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 10:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMz-0006hL-F1
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMw-0004ZP-E2
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZ2eznqa9Zx7NtKofWe9dQKBANAIBxvW9HSLIqG+Mg0=;
 b=dBnQtofZj01jLdHKgk7n2wxiLF9dYp80a/el2efd9x5IZw8CCmvfRwlDvviERGJEp9O+nG
 UYCh7FpzOGPSf3Of0TOGRfktgsSXbDtbiNUCoT2EBrHSiKvoM7quaCJV36QoHPAz9tiWYD
 0HdLp/ihSiFPRetNRkNCpO73+dEqzZs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-jVZX2nBsOO6kwk4FX_vjNg-1; Wed, 20 Apr 2022 09:27:38 -0400
X-MC-Unique: jVZX2nBsOO6kwk4FX_vjNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C5903C025B4;
 Wed, 20 Apr 2022 13:27:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 627CDC3598B;
 Wed, 20 Apr 2022 13:27:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 15/41] intc/exynos4210_gic: replace snprintf() with
 g_strdup_printf()
Date: Wed, 20 Apr 2022 17:25:58 +0400
Message-Id: <20220420132624.2439741-16-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jvQySdNENw8g

From: Marc-André Lureau <marcandre.lureau@redhat.com>

While at it, replace '%x' with '%u' as suggested by Philippe Mathieu-Daudé.

Also fixes a GCC 12.0.1 -Wformat-overflow false-positive.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
2.35.1.693.g805e0a68082a

