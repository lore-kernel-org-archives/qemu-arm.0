Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp243907lfm;
        Wed, 24 Jun 2020 01:44:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycLa5NxvZSSdxMumHWieBnNIJBGy3TGm54rGCVLuQru+IIAUzv2DYXLZqZzsWVG4CrglKl
X-Received: by 2002:a25:23d6:: with SMTP id j205mr43281419ybj.60.1592988243124;
        Wed, 24 Jun 2020 01:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592988243; cv=none;
        d=google.com; s=arc-20160816;
        b=Ae57JnX5nStW1b+Jm6FKCeB/+BSOTmT3J8cocNOZDtazqAuB9Nhm5ik/lxjMaR92Dr
         18sO3njMesqym2zVV2vMlUgT73h7IwhMjKn0CTlkNLY/5qtGwsXZF2rmIkkXqG2udX5a
         XmEcRbAlowSGp2y1uYUv/t1JUv13uvi3Zd4VQ9kQYOmM6KsZ07kHFjE3DLEDCNdWWYKI
         jYe5ARThQMyHqJZqjEStow9AIClAlTEzXxbfi6krL8F/PhkAZ7LkSDKymTjjBdkEHhIE
         l1P8EStykUPTVnGxZzlhCkd7etB6Mv7PQRjYI1rU7a9rIWjZycLPdxpt4CeB2p1GjrLf
         O/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HbX+F0YOBtVPOL7TP27P03pO8+dHGl4EEswJatoom00=;
        b=FfRSSJyAQaZDQEBXcXQxmYS/DhgKdraZbFpZ0fTzDwaTyftdHkPkq9bUJhBUZLRd/5
         3OLmZXz/l6j5r6LK/j016ZUvlC5jRXJVv8ciTRNj/KO6zkcBHCWWZp+ZGKCOph696bD4
         Ky7pNykX/hkeoHpGhQ+EkT6oYqSpT21dj6KuX0eE+Ish2cK5azwmf0Xm68C2KcY7isT+
         NsJ1OIw90AF4TxMypnz4AfKmZ/dIi/yfgGbYHG7bSJFrnMi0JZfAkWGEDtyHzhVr10wF
         zBxZVXo2JBORxyPQ6TIQykqKQxY4UMo8hsC/Fxe2dmK1gGCt6DO+pSn+Jy+AWYFv+FED
         6rHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=URXRlJSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8si18604099ybl.288.2020.06.24.01.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 01:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=URXRlJSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo10k-0003zm-Ew
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 04:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0uo-0000sC-Ci
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 04:37:54 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57521
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0uh-00026f-Qy
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 04:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592987867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbX+F0YOBtVPOL7TP27P03pO8+dHGl4EEswJatoom00=;
 b=URXRlJSYhXtsq1X9pCQCBxXz6ntYzGyTh4uAuV6CBgCFPemAVXUTLiPx/oyhjL+RvPcwQ/
 zd+PGXKh+yL2okn/dDOQOid8n4zMG0ZGx7wZ2baLVCLdAmU97D1kzo0pZgUtAkrl0ZAbpj
 HN3UdW/mSqKgyrO+ih83kqdgxEsvxYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-WCzweA31NpaatC4QxAJ8JA-1; Wed, 24 Jun 2020 04:37:45 -0400
X-MC-Unique: WCzweA31NpaatC4QxAJ8JA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30B0F805EE1;
 Wed, 24 Jun 2020 08:37:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 018825D9C5;
 Wed, 24 Jun 2020 08:37:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D1C801138486; Wed, 24 Jun 2020 10:37:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/25] hw/arm/armsse: Fix armsse_realize() error API
 violation
Date: Wed, 24 Jun 2020 10:37:36 +0200
Message-Id: <20200624083737.3086768-25-armbru@redhat.com>
In-Reply-To: <20200624083737.3086768-1-armbru@redhat.com>
References: <20200624083737.3086768-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RhBvM+L4wI1W

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

armsse_realize() is wrong that way: it passes &err to
object_property_set_int() multiple times without checking it, and then
to sysbus_realize().  Harmless, because the former can't actually fail
here.

Fix by passing &error_abort instead.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/armsse.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index c73cc6badf..e2cf43ee0b 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -991,13 +991,13 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysinfo), 0, 0x40020000);
     /* System control registers */
     object_property_set_int(OBJECT(&s->sysctl), info->sys_version,
-                            "SYS_VERSION", &err);
+                            "SYS_VERSION", &error_abort);
     object_property_set_int(OBJECT(&s->sysctl), info->cpuwait_rst,
-                            "CPUWAIT_RST", &err);
+                            "CPUWAIT_RST", &error_abort);
     object_property_set_int(OBJECT(&s->sysctl), s->init_svtor,
-                            "INITSVTOR0_RST", &err);
+                            "INITSVTOR0_RST", &error_abort);
     object_property_set_int(OBJECT(&s->sysctl), s->init_svtor,
-                            "INITSVTOR1_RST", &err);
+                            "INITSVTOR1_RST", &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->sysctl), &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.26.2

