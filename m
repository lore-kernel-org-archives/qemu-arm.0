Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp894937lfy;
        Wed, 19 Aug 2020 17:13:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy6HDifxf64qcQ2ArptJ3Fsx/IZnwiOH1LNafBNPo3HMy8PYuLJFCz+gPZL7xIq17MlVp6
X-Received: by 2002:a25:680e:: with SMTP id d14mr1300909ybc.15.1597882383668;
        Wed, 19 Aug 2020 17:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597882383; cv=none;
        d=google.com; s=arc-20160816;
        b=qVNcL4YCsoWMkbRsKubhUEcszZrjWCa6h8CQfuTiUYR9IAhPls20tpGXwGd+FcBJZu
         nNk4uWOtPYtDzmKG2f1QEcTmlz9bEQjPh2pY7HfUtUSECtB4b8FB/5KVaEGgVPC+tgAO
         /WF2kZwP9AOI+agX4nnh0pXsh0I/f5dEST7Sz2/Cr1NTSunH1SIxrzpFu+V9IyqUcpA0
         wlkg0Hgb6pwJ9rXQldMjHevNdLZI4JrbNA+8Oxd0pjSYrpcGKyqeh2mhHgDXqium4A8E
         EJKeiEyE6ji09/ns1zkcMTGDsoSKPYuAVDQJ0DnJNv2Vdb2KsuUMUJHUwW6BbcpN6PV5
         VMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k/TnqvUgCno7HKezta0XAkL5zem1rmll2vSOVW/9iIk=;
        b=S8ckl1zlj1sWDuLeOna4PJMgX1Gj1A2V7DQQLLnGJ3cPGQr3LRDv7lCuubQFgNMjJy
         38CFSZoOhWnt/MvZa/BpwkgNfhCbkJD7zvMrMnRWkK+LaQZpezq1+DX7GLGHC160GGP7
         czIsFP0PiSR0/RPJVgCkXY0Bd5JGRWC8P7yhbWe8/6mNI2Nj0g81UXUzJcu5d6O4xAbe
         qWDmmEu5JyxCeg0n2D32/S/5xlYz/Kpj6cS/H4bD2o1l8USiQkzVVou94q9nvyU6tojt
         XhLLvICqGBwrr88ARmX1dYNqyp+myel2z3Db6t4Vt9Bz5NhhcA7pDRgJXGCDxLG184vl
         n/aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g95kTryv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si261171yba.211.2020.08.19.17.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 17:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g95kTryv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8YCV-0004pj-0c
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 20:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YCL-0004nA-IN
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 20:12:53 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34107
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YCI-0002Gz-Qf
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 20:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/TnqvUgCno7HKezta0XAkL5zem1rmll2vSOVW/9iIk=;
 b=g95kTryvUEIM7ykYPmSGOv33sUmBs8PZQLcBMjeYhjb4uFDjeK6T4cZl9F6lWeL5ZCTZUG
 3JvH7O9kq+8AtU/bQ9b0QT7tNNN61VSOebn1EqHRH1XuvbUvHRDQptEIpq03jD/uF3CuB2
 k48DlLweY7d+YNgK8xMm6zjY+EueGKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-7aDX9aDbO1qgjilema1DzQ-1; Wed, 19 Aug 2020 20:12:46 -0400
X-MC-Unique: 7aDX9aDbO1qgjilema1DzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59BA6186A568;
 Thu, 20 Aug 2020 00:12:45 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D61C616D4B;
 Thu, 20 Aug 2020 00:12:44 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/58] pl110: Rename pl110_version enum values
Date: Wed, 19 Aug 2020 20:11:42 -0400
Message-Id: <20200820001236.1284548-5-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 18:27:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cyMR/tn4lvyd

The PL110 enum value name will conflict with the PL110 type cast
checker, when we replace the existing macro with an inline
function.  Add a VERSION_ prefix to all pl110_version enum
values, to avoid conflicts.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* Fixed typo on commit message
* Rename all enum values to VERSION_* (Philippe Mathieu-Daudé)

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/display/pl110.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index c2991a28d2..61fefbffb3 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -42,9 +42,9 @@ enum pl110_bppmode
 /* The Versatile/PB uses a slightly modified PL110 controller.  */
 enum pl110_version
 {
-    PL110,
-    PL110_VERSATILE,
-    PL111
+    VERSION_PL110,
+    VERSION_PL110_VERSATILE,
+    VERSION_PL111
 };
 
 #define TYPE_PL110 "pl110"
@@ -189,7 +189,7 @@ static void pl110_update_display(void *opaque)
     else
         bpp_offset = 24;
 
-    if ((s->version != PL111) && (s->bpp == BPP_16)) {
+    if ((s->version != VERSION_PL111) && (s->bpp == BPP_16)) {
         /* The PL110's native 16 bit mode is 5551; however
          * most boards with a PL110 implement an external
          * mux which allows bits to be reshuffled to give
@@ -372,12 +372,12 @@ static uint64_t pl110_read(void *opaque, hwaddr offset,
     case 5: /* LCDLPBASE */
         return s->lpbase;
     case 6: /* LCDIMSC */
-        if (s->version != PL110) {
+        if (s->version != VERSION_PL110) {
             return s->cr;
         }
         return s->int_mask;
     case 7: /* LCDControl */
-        if (s->version != PL110) {
+        if (s->version != VERSION_PL110) {
             return s->int_mask;
         }
         return s->cr;
@@ -437,7 +437,7 @@ static void pl110_write(void *opaque, hwaddr offset,
         s->lpbase = val;
         break;
     case 6: /* LCDIMSC */
-        if (s->version != PL110) {
+        if (s->version != VERSION_PL110) {
             goto control;
         }
     imsc:
@@ -445,7 +445,7 @@ static void pl110_write(void *opaque, hwaddr offset,
         pl110_update(s);
         break;
     case 7: /* LCDControl */
-        if (s->version != PL110) {
+        if (s->version != VERSION_PL110) {
             goto imsc;
         }
     control:
@@ -513,21 +513,21 @@ static void pl110_init(Object *obj)
 {
     PL110State *s = PL110(obj);
 
-    s->version = PL110;
+    s->version = VERSION_PL110;
 }
 
 static void pl110_versatile_init(Object *obj)
 {
     PL110State *s = PL110(obj);
 
-    s->version = PL110_VERSATILE;
+    s->version = VERSION_PL110_VERSATILE;
 }
 
 static void pl111_init(Object *obj)
 {
     PL110State *s = PL110(obj);
 
-    s->version = PL111;
+    s->version = VERSION_PL111;
 }
 
 static void pl110_class_init(ObjectClass *klass, void *data)
-- 
2.26.2

