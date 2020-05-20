Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp581131lfb;
        Wed, 20 May 2020 06:29:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9eVWA3nAYyVIWT3cFc/QR000VlkvCuCvG+8sn6y4VDlGKpSv4bjCLqb0HZ8a5E3yGWoVn
X-Received: by 2002:aed:2496:: with SMTP id t22mr5271948qtc.2.1589981389406;
        Wed, 20 May 2020 06:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981389; cv=none;
        d=google.com; s=arc-20160816;
        b=OA0dyaEJttPcBfuxNB+xf3Ables6E0s/zFMGXJcELXajPQMqJebwZVhpwi4K6xbnkG
         o0bS7rFk9U8m4XIa+z4+frPH9hG7bna7YfrOgzL3cWT9R3QHId+6MQMDMVrx0R1uJSVU
         5oM1rvYWsqzQZ3TgIeWDZvH2F3GDRUYALo6Ur2WrjANT/zn1+R13tYH5yG15aq06cplP
         pD4hQkIpuROSkyKl/0e5IxrLMxRZ6dOYABwxmqzF6sTIIXmKEaS9XG4uVSuzRRTe31g8
         lXKfRwEFz0Vj7Y50eKc9Mv0IBN0f1HBlBjb9ddPkPohaS1s7sUfgwEqQIVsj493zFS9g
         s4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=6OIxpUflKpjw9oFHZKmMc0sFoAZYdcP0pMC2r+iLubc=;
        b=ppFwh1MBywprxF5Kp0kt2RnKEyPCWZaxW2VB05XEg1ddVdLRBE2pJ4pbq85YTz4PNY
         TGA/SlyGv5xlG9XjZhf6MIt326lH0aLGF2L/i19ksktNa2i/g2+KLq2+Lez6v8KiCv7U
         7aet/e0TIAgkRWdXdiqkh3c7fPm6PUicai4+CrX4k60ZNtCaKVFFgZGDUAxvRT3TMIwi
         dN3TqE2NnQOJu4D6//iHWtW7oRmb6Oty4NrQ5S5JMRDrsIvV86JbA3d9dHeQYutGtArt
         eg8xD3rAElRLs9Y/2mLlN60ZyTN4XQEBKSZwO+2l00oBXz2DaEoed7KVrs4AMA68NQz8
         SwsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gmBRUY44;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p60si1549047qtd.99.2020.05.20.06.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gmBRUY44;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOn6-00046n-QR
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeH-0002M6-Gj
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:20:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46348
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeD-0000Jx-R8
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=6OIxpUflKpjw9oFHZKmMc0sFoAZYdcP0pMC2r+iLubc=;
 b=gmBRUY44K1svrWmqDBViY87OzI28H0rV1130ierxU9wXHbh5MrbmwS2NLRl6i6xzvaQWcz
 HxiBjCoLEnxk6kzyO0Z9xmPgB9Ma/SOQVPkIUfrdmvwZMmpbh8no+2xMp1DAnIeZY/3KL3
 5J5CrUpZdXBjPQpC7V/ekxbf0+9TNTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-9KxStO4rPR61EXfnfpNnJA-1; Wed, 20 May 2020 09:20:34 -0400
X-MC-Unique: 9KxStO4rPR61EXfnfpNnJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85527464;
 Wed, 20 May 2020 13:20:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 125D019C58;
 Wed, 20 May 2020 13:20:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7A1469D73; Wed, 20 May 2020 15:20:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/22] [RfC] acpi: add per machine type acpi default
Date: Wed, 20 May 2020 15:20:02 +0200
Message-Id: <20200520132003.9492-22-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 01:34:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oc0eSIJAwRMU

Allow setting acpi default value for each machine type.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/x86.h |  1 +
 hw/i386/x86.c         | 21 ++++++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index b52285481687..d2fffa8252ff 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -37,6 +37,7 @@ typedef struct {
     bool save_tsc_khz;
     /* Enables contiguous-apic-ID mode */
     bool compat_apic_id_mode;
+    bool acpi_default;
 } X86MachineClass;
 
 typedef struct {
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ac7a0a958781..3a56a157c5f0 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -940,10 +940,22 @@ static void x86_machine_set_smm(Object *obj, Visitor *v, const char *name,
 
 bool x86_machine_is_acpi_enabled(X86MachineState *x86ms)
 {
-    if (x86ms->acpi == ON_OFF_AUTO_OFF) {
-        return false;
+    X86MachineClass *x86mc = X86_MACHINE_GET_CLASS(x86ms);
+    bool enabled;
+
+    switch (x86ms->acpi) {
+    case ON_OFF_AUTO_ON:
+        enabled = true;
+        break;
+    case ON_OFF_AUTO_OFF:
+        enabled = false;
+        break;
+    case ON_OFF_AUTO_AUTO:
+    default:
+        enabled = x86mc->acpi_default;
+        break;
     }
-    return true;
+    return enabled;
 }
 
 static void x86_machine_get_acpi(Object *obj, Visitor *v, const char *name,
@@ -991,6 +1003,9 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     x86mc->save_tsc_khz = true;
     nc->nmi_monitor_handler = x86_nmi;
 
+    /* acpi is on by default */
+    x86mc->acpi_default = true;
+
     object_class_property_add(oc, X86_MACHINE_MAX_RAM_BELOW_4G, "size",
         x86_machine_get_max_ram_below_4g, x86_machine_set_max_ram_below_4g,
         NULL, NULL);
-- 
2.18.4

