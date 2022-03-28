Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6345677lfb;
        Mon, 28 Mar 2022 01:52:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHmG01vkn/3l/zDgkQVRy9bs81vGlrO9x+5u2OxM1G2rzy0i2s/bzXT65GyMF9QZYtOU/7
X-Received: by 2002:a05:622a:82:b0:2e1:d61d:81ec with SMTP id o2-20020a05622a008200b002e1d61d81ecmr20667932qtw.674.1648457564266;
        Mon, 28 Mar 2022 01:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648457564; cv=none;
        d=google.com; s=arc-20160816;
        b=Mp1zFPDQ4+PxJQEQL2WhEplwzHkI+/WKF3iWlzB+OKe6REgo84u6hVD7M8XWZFj0Zb
         owBDIHgXYh4yWgWvf9DTSseut+F0u7S4CZ8CFnQa48L6p18yTuuSHDlxFUtJJSsQsbtD
         McYkO01RNWSUTGaf98EUftPPT5JZzVJnu49zCZTZZ1uAI8MHVqjRt+iQnXQmKwicIvc0
         76cGe0qUoWq9XiRx7W3zsdiH1v1ytDtHWQikHl/dIBZuRdWiaZJDKZKK5FPfpf9XUD1H
         um7VDxqvyE2FrVkseD7IHfwqYjM25MDs/m8WoYmelt4tzhd9HO0YswiDB7e/AwMmxj7E
         RWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1fflEkLMpr3AXJml4ulRbay2nqIKo/k/j2/JZiR85ow=;
        b=fdd0sZNBdyHOxdQzRtwJTdEs5/TgB09qHc5eRzT0GfsSdNK3+qb8diEcHflJ+ynspd
         EWDvxQ7te1BZ+LzVl7trnigWHZYHvrivHT0Lw6gKoUfJzCcOev9U4Qx3SIAz2GlqFTxo
         W+RBygAH6kNPI0rdu7XFTdkUXQBywFNzHMtelUHmxMlKKnySKqDbRNLwNS8gha31yhDn
         +7/w0i0cnlc/19Fk/uacTOkTmeKJMuWAvEbCHexMm3UnWl4KsfdEIW0o/C38yI0xMulw
         dJpM1GYlZaedHmA+ixH2XaBN9B+veOFyz2vmeHr/gelEI9w5rpVSmzKOmZVyWMhUaSFu
         2fTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VUUusJie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a0cc442000000b00440e46a7d73si5351706qvi.529.2022.03.28.01.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 01:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VUUusJie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYl7D-0003VZ-PF
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 04:52:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nYl3C-0005qe-Fp
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 04:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nYl3A-0003DR-MO
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 04:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648457312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fflEkLMpr3AXJml4ulRbay2nqIKo/k/j2/JZiR85ow=;
 b=VUUusJief6qRgWCLRL4ljx/pYmZefsflWoZ1r0c/ArghJoq+X2kMM/0z1vsmGbMPR7cePy
 bLa5a0KNlEC2BOz9l9MjMT6uyCCbl3AdQ6uovilljzEY02a6jkj2pOp7/ZviAXGHlctDGG
 MdnAWU6bwqR+gWnBOpKPyiOBFNrbdwg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-_EAyKSw0MPiukuP9n3pq4Q-1; Mon, 28 Mar 2022 04:48:29 -0400
X-MC-Unique: _EAyKSw0MPiukuP9n3pq4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E5BD802819;
 Mon, 28 Mar 2022 08:48:28 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85FFA200BC58;
 Mon, 28 Mar 2022 08:48:06 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] intc/exynos4210_gic: fix format-overflow warning
Date: Mon, 28 Mar 2022 12:47:16 +0400
Message-Id: <20220328084717.367993-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220328084717.367993-1-marcandre.lureau@redhat.com>
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dUHhvf/Znaxl

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/intc/exynos4210_gic.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index bc73d1f11524..5b6f4330a5f3 100644
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
+        g_autofree char *cpu_alias_name = g_strdup_printf("exynos4210-gic-alias_cpu%x", i);
+        g_autofree char *dist_alias_name = g_strdup_printf("exynos4210-gic-alias_dist%x", i);
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
2.35.1.273.ge6ebfd0e8cbb

