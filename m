Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2002148njc;
        Mon, 4 Nov 2024 02:16:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlTPu5rB6RULgq7TUFvMclCio+F8NK9EHHpxfYpeItXPmbZGj5zMl9KFkz4vqiWHYadgdo23qQHVGTHA==@linaro.org
X-Google-Smtp-Source: AGHT+IExr221L36gV+jM66AYRMx491sdsxiex0rOV2RVwnoKepSfvlfAe3auC8l44VyzbP1bZu+A
X-Received: by 2002:a05:622a:216:b0:460:8d97:c457 with SMTP id d75a77b69052e-4613bffaa4dmr477547921cf.22.1730715384604;
        Mon, 04 Nov 2024 02:16:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715384; cv=none;
        d=google.com; s=arc-20240605;
        b=FVl9UxoM2o3UCf7sXdNL+z+1yO+Y9O5XslpWO9Ez61i2RBU8wHpk4+LpZ7pO16WC5Y
         6X0oQd9NTmeaVf81kiYSGtByIcHQwAczOiLNDniiLRQZeyHlyTA5jAEbnL8fONZR/q6m
         DZTsYogseTamTJw7Bo8fe96clvci4JdvwlYGPHaeue5Go0fZDGegQuj9AF3lr3tSylwp
         LE8fjZlCU++AHpi0dvdknY8FYKWjHB/T9u1IRByBi8MDKIcvgxbAwypOEZzs8yKC6Xps
         H50uz8KIZ+KwQJ5xk9WdIUqZV/zZyArJiaj1kg8lUyvvDBS4Cvod1WVhEOUHriLUOG+t
         dm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KwxKjafKDnKBkadg0NOHGWyqqTRQcVmPU7A81oAJBiI=;
        fh=Cj5IIcumWniexwVpm6Ax6AZMfEjZbjchs4GddglD/yk=;
        b=bqLC94ZFYRhSFNiS+II8pP3qUFFlgQ7IZerk4oRtUgedyrAUu9KKWlPvIhLVMF+vF0
         f6H8yHtoiH3qFpwELQEXDvxTWcSQUT6j+XyMTrTAeQYhAW384hKls+WphzQEoWjSXTX5
         nYFAl7xjIMNOcBqvCFo0u35+KThKiCGLPzy37rlg9Fa2Y6KgybnkD0iwMeR2mgtyfmjd
         9PuEnZy+QZt2MfSwbUiOL2llp9tBN4f5cAhgpmvGmfH/+Inw9Y8EjtPKawOcLFXfOEGD
         9ACZA/dgTwAYOD5eg99s6znaD89KeqxnvbfywHGOnMIrxs5CdGNtPbf9ofgXbMKDh2xE
         a4Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cOvHolq3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad24925esi115428591cf.605.2024.11.04.02.16.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:16:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cOvHolq3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7u7N-0000jc-7w; Mon, 04 Nov 2024 05:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7F-0000i3-C4
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 05:15:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7D-0006Xx-Ub
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 05:15:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730715318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwxKjafKDnKBkadg0NOHGWyqqTRQcVmPU7A81oAJBiI=;
 b=cOvHolq38GU2ICFdSBPfqnHvUUKSOyOTXmc1CV45DXpEQSAzuL0j7rVdnI5wNjw7PdPvQp
 wpwxBCAC4fi4X1PrY2ZXMVIenaFvoKOwK6TndhMuwUBqRGOjQ5OqvWtATx7o4gCSNone9M
 ItJrQSAeFoq1R8Wgy2Tjl3wNzpDr8V0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-5M6F8JWJO6ud02TEs7EC2Q-1; Mon,
 04 Nov 2024 05:15:16 -0500
X-MC-Unique: 5M6F8JWJO6ud02TEs7EC2Q-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ED5F41944D3C; Mon,  4 Nov 2024 10:15:14 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.67])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8F59F1956052; Mon,  4 Nov 2024 10:15:13 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PULL 04/10] hw/arm/aspeed_ast27x0: Avoid hardcoded '256' in IRQ
 calculation
Date: Mon,  4 Nov 2024 11:14:55 +0100
Message-ID: <20241104101501.2487001-5-clg@redhat.com>
In-Reply-To: <20241104101501.2487001-1-clg@redhat.com>
References: <20241104101501.2487001-1-clg@redhat.com>
MIME-Version: 1.0
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
X-TUID: Z6rXzZr5NHAk

From: Peter Maydell <peter.maydell@linaro.org>

When calculating the index into the GIC's GPIO array for per-CPU
interrupts, we have to start with the number of SPIs.  The code
currently hard-codes this to 'NUM_IRQS = 256'.  However the number of
SPIs is set separately and implicitly by the value of
AST2700_MAX_IRQ, which is the number of SPIs plus 32 (since it is
what we set the GIC num-irq property to).

Define AST2700_MAX_IRQ as the total number of SPIs; this brings
AST2700 into line with AST2600, which defines AST2600_MAX_IRQ as the
number of SPIs not including the 32 internal interrupts.  We can then
use AST2700_MAX_IRQ instead of the hardcoded 256.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/aspeed_ast27x0.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 5638a7a5781b..7b2464409521 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -66,7 +66,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_GPIO]      =  0x14C0B000,
 };
 
-#define AST2700_MAX_IRQ 288
+#define AST2700_MAX_IRQ 256
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
 static const int aspeed_soc_ast2700_irqmap[] = {
@@ -403,7 +403,7 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
     gicdev = DEVICE(&a->gic);
     qdev_prop_set_uint32(gicdev, "revision", 3);
     qdev_prop_set_uint32(gicdev, "num-cpu", sc->num_cpus);
-    qdev_prop_set_uint32(gicdev, "num-irq", AST2700_MAX_IRQ);
+    qdev_prop_set_uint32(gicdev, "num-irq", AST2700_MAX_IRQ + GIC_INTERNAL);
 
     redist_region_count = qlist_new();
     qlist_append_int(redist_region_count, sc->num_cpus);
@@ -417,8 +417,7 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
 
     for (i = 0; i < sc->num_cpus; i++) {
         DeviceState *cpudev = DEVICE(&a->cpu[i]);
-        int NUM_IRQS = 256;
-        int intidbase = NUM_IRQS + i * GIC_INTERNAL;
+        int intidbase = AST2700_MAX_IRQ + i * GIC_INTERNAL;
 
         const int timer_irq[] = {
             [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
-- 
2.47.0

