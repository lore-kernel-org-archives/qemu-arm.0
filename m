Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1381931lfm;
        Thu, 2 Jul 2020 04:22:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWtFc1J9dhdKoVt7E1yrbHYVjKH9hGMbBpC/FFCEcr1HhF0Gmoss/9g03nWcsu1bvdy7Rw
X-Received: by 2002:a25:aaf1:: with SMTP id t104mr51263508ybi.163.1593688957593;
        Thu, 02 Jul 2020 04:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593688957; cv=none;
        d=google.com; s=arc-20160816;
        b=eHRTHFYsoJMFEsKWQNYO6ZY3rP5U5JCyFN2qcacS2PJDCAXCO6yWOVvZM82UbEzIc2
         iNlq8ltb/qkwTWv8Jy8Dwv1pJhKAzUzaXm75Bs+KjGfyHRUtovh5b/wscJHqlLVSlMc+
         YPqjztc1o983CEXSwFh7D7vof2Vj8WUCEcjV5zFyiSbcL7p5UK40+1Lm4NlZco1MRg4e
         eh8r6f9jmsJBfwkuG6D5eYYpBdWB6xob5kCMczk1yjfmBK1PTaFY33DVct9DaHyCQtDs
         vPuYx/YUmfeBA3GMwP6z4leuK/eEDq/7VA5i8tPI6dn/luGBiOhnqt0UhtPPiKo8UDLm
         gdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uas3PeA/1eIG0i3Ut0IsXO+OgvTsxFM2A6B+Jkzvi8E=;
        b=bqZEQx4ccOpitPzs0AHRvXbmISrFQUyQNSAauaHev13I9SLhnwcAYK7Dl80EgW5jD3
         27NfO+kw/yAlGO1J0UL0kSufO6z1GSY/jVocCaumRsEk+9tN3PDlmY310Vq+2Ar6xBWy
         IMwL7N13/k73jP3O5dwsxr83uUhGGG1IjMIBhFAfKq0yPlaVSp6gDDACjRxIUBDF/lzb
         aVCrbHOEYUO41luk8fFQldFTcUTldhzM32hyo7Ry0oot3nNu9TNON6Pj1nCdmgYqUCmY
         s5g/2sGwEVfAWx8BQ57Nm5CLCPgdm5trPa9pCwHAl3uzXBTAnxnpoRFon/f3QYdDiEna
         zXpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T1IZmBI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s68si8793281ybf.334.2020.07.02.04.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 04:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T1IZmBI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqxIa-0003KI-Uy
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 07:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx6I-0006x1-Lb
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 07:09:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27901
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx67-00010x-RC
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 07:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uas3PeA/1eIG0i3Ut0IsXO+OgvTsxFM2A6B+Jkzvi8E=;
 b=T1IZmBI9pY3oTRAHD42YKguAw9E4sjhXcgHsV/gtV6ZUacm8aJTcjBeKkCVN/UfjJTmgJV
 OaJcmhPLoEmkwGCch4gQpq0XA3w1O0y7kRbqZzwasvk0nQgBnXOUKe6tME36BMZuMU7qfw
 lmTvtdbyrNDSRj/jPwLLEN7vjb8kzVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-WKGrGU64Mk6lofSGMqiw8g-1; Thu, 02 Jul 2020 07:09:40 -0400
X-MC-Unique: WKGrGU64Mk6lofSGMqiw8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 520D8107ACCA;
 Thu,  2 Jul 2020 11:09:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2412410027AC;
 Thu,  2 Jul 2020 11:09:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 45DFC1138486; Thu,  2 Jul 2020 13:09:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/28] hw/arm/armsse: Fix armsse_realize() error API violation
Date: Thu,  2 Jul 2020 13:09:29 +0200
Message-Id: <20200702110931.2953148-27-armbru@redhat.com>
In-Reply-To: <20200702110931.2953148-1-armbru@redhat.com>
References: <20200702110931.2953148-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CFlndPFlPz8A

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
Message-Id: <20200630090351.1247703-25-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/armsse.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index a851652b39..2fbd970b4f 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -990,13 +990,13 @@ static void armsse_realize(DeviceState *dev, Error **errp)
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

