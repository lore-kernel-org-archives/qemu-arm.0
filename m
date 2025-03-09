Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606561njc;
        Sun, 9 Mar 2025 06:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrx444i0niA2X8Q1Z+pQLdXax6FEW9JTkdEPI4o6tBsaWoOl+jPbpcQe1dPzJdKMwc7HSxw3jA3tQ0nA==@linaro.org
X-Google-Smtp-Source: AGHT+IHB+B26DbbuwnmebQqoCctGxYNCEMYtfxmF2UDYctInv/QlkBy6H5z8zDkCcBIpkkVv5Xsv
X-Received: by 2002:a05:622a:206:b0:474:fe6a:46ba with SMTP id d75a77b69052e-476109c2893mr131588331cf.27.1741528403306;
        Sun, 09 Mar 2025 06:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528403; cv=none;
        d=google.com; s=arc-20240605;
        b=J0bO2LL8nFTsGS8fC6Yyel0fujFLucOvXhY9Hm5UcONDIHpFR0ffT+y8KLyaPXnu8d
         7EjaftWyfFHlNr1n/dQlp7b++y3W29ItEOBe/KeKE2I5fSyyD1xWsLqilzdMmDKmmX8Q
         6/CmjB4cdwX9cB/RsiyFWr60xGfd5OhEQsJ3Js8oMiyMGedTGP9CdxMfIiX2SzqJymBa
         yWzYThywi7PFTRcU9hmzAEe9ZorvJWloAwsEPOk1kGjOQ/+UinzXuFZF6NnH127P+ILj
         sa6XRvCpUhjE7z2wlTnH423QjFHqpX06BmkETdwC/IVsgoDA34DCBCzmLS+y2yoRv9x0
         o6zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ftknb9FJMNHkx3koiZkzj8w2opVTkDQe6gI/VYF/NCk=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=fytpLsRw5Pq3ojkDLWEuPuKxu3eR1yisT/qWrqT8YcHfvSXAv8wEe+v3bbvWSv3R1+
         RPIGdWWseDXWNwWm6dNqwtD0HbUy5nPz5zSjTgPhow49S1AyvS04s1eUz9gVgutCXj54
         jxQvktslnz+8PjZyyS/umdr1v6ga9fC+cSoY6kCBPNwiyeM+SMDNs+7zxWEbgmv6Te8N
         ut+PjvWyno/Rig+fBDpnCvzNf5WxZkd8PO9/pxN85AUWicicVwSqyKG3UFeZyuB5de7l
         +LZcue84O979pu86TUrmkHDgv6FwXJkyWXaqD3VoBaEZJR+jjtCmNV6NzkcepXG/oPDx
         6kXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SFokB4ow;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47666cc38dfsi31748061cf.144.2025.03.09.06.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SFokB4ow;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trH5F-0000Vt-TF; Sun, 09 Mar 2025 09:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH50-0008SL-1S
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4x-0002ss-JS
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftknb9FJMNHkx3koiZkzj8w2opVTkDQe6gI/VYF/NCk=;
 b=SFokB4owF4Wcng11FqzTLqYrhEWRr8gdfNpupbbBfySeXillaqEvExo3a8Bl8ZKlOOEd4R
 wEToVmLUcrceZe4gujtvUhZ5km5BIcgRm8P+w9BpAB7ARb+tcqyuaarnnh0r27zSD6OmV/
 HcjcWQVqKGV+6/3QMpRio1KEF7lN6Xc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-345-SH6rXYLINpO32awgYDBvWg-1; Sun,
 09 Mar 2025 09:52:26 -0400
X-MC-Unique: SH6rXYLINpO32awgYDBvWg-1
X-Mimecast-MFC-AGG-ID: SH6rXYLINpO32awgYDBvWg_1741528346
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 00492180AF52; Sun,  9 Mar 2025 13:52:26 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 421AA1956094; Sun,  9 Mar 2025 13:52:24 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 20/46] hw/intc/aspeed: Introduce dynamic allocation for regs
 array
Date: Sun,  9 Mar 2025 14:51:04 +0100
Message-ID: <20250309135130.545764-21-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: DuqQvF40BMcU

From: Jamin Lin <jamin_lin@aspeedtech.com>

Currently, the size of the "regs" array is 0x2000, which is too large. To save
code size and avoid mapping large unused gaps, will update it to only map the
useful set of registers. This update will support multiple sub-regions with
different sizes.

To address the redundant size issue, replace the static "regs" array with a
dynamically allocated "regs" memory.

Introduce a new "aspeed_intc_unrealize" function to free the allocated "regs"
memory.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-4-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/intc/aspeed_intc.h |  2 +-
 hw/intc/aspeed_intc.c         | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 03324f05ab58..47ea0520b5d8 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -27,7 +27,7 @@ struct AspeedINTCState {
     MemoryRegion iomem;
     MemoryRegion iomem_container;
 
-    uint32_t regs[ASPEED_INTC_NR_REGS];
+    uint32_t *regs;
     OrIRQState orgates[ASPEED_INTC_NR_INTS];
     qemu_irq output_pins[ASPEED_INTC_NR_INTS];
 
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 465f41e4fd35..558901570f82 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -289,7 +289,7 @@ static void aspeed_intc_reset(DeviceState *dev)
 {
     AspeedINTCState *s = ASPEED_INTC(dev);
 
-    memset(s->regs, 0, sizeof(s->regs));
+    memset(s->regs, 0, ASPEED_INTC_NR_REGS << 2);
     memset(s->enable, 0, sizeof(s->enable));
     memset(s->mask, 0, sizeof(s->mask));
     memset(s->pending, 0, sizeof(s->pending));
@@ -307,6 +307,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(sbd, &s->iomem_container);
 
+    s->regs = g_new(uint32_t, ASPEED_INTC_NR_REGS);
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
                           TYPE_ASPEED_INTC ".regs", ASPEED_INTC_NR_REGS << 2);
 
@@ -322,12 +323,21 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static void aspeed_intc_unrealize(DeviceState *dev)
+{
+    AspeedINTCState *s = ASPEED_INTC(dev);
+
+    g_free(s->regs);
+    s->regs = NULL;
+}
+
 static void aspeed_intc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->desc = "ASPEED INTC Controller";
     dc->realize = aspeed_intc_realize;
+    dc->unrealize = aspeed_intc_unrealize;
     device_class_set_legacy_reset(dc, aspeed_intc_reset);
     dc->vmsd = NULL;
 }
-- 
2.48.1

