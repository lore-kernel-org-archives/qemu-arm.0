Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52829CD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 17:27:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX0Ct-0007Y1-7S; Tue, 09 Jun 2026 13:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Cj-0007Rc-UV
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Cf-0001rb-Fp
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781025928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NdlNtbeLa0/ps13OdYmmm+9iFxk0+Y/xOAdI1YEzAQ=;
 b=H3JUKszobwj7/FVnaONaOUm4wCSsIYXikWNPnhICe4eEYkV+kZ9K63VS/G3QZt+iknnjMC
 E5lk07Vy8kfFo8M0Z5JnTvsIulHbGqHdqT/oUB+Rq/1kMsg4RvxMrHkJncDALUgA41Qshk
 ltV9yv2zt0+8ze+FpE7aMNaQJzlhFK4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-maDou8W1OwyqDifEcQTwjg-1; Tue, 09 Jun 2026 13:25:26 -0400
X-MC-Unique: maDou8W1OwyqDifEcQTwjg-1
X-Mimecast-MFC-AGG-ID: maDou8W1OwyqDifEcQTwjg_1781025925
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5177bddf6e0so14282161cf.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 10:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781025925; x=1781630725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3NdlNtbeLa0/ps13OdYmmm+9iFxk0+Y/xOAdI1YEzAQ=;
 b=n9VeNmIA8utz7fuuUYs820EWBX1h6dNKVXRUoKUiwh92gsphptjdmgULUZYzDrepV6
 sRZibHccnKFcH2/PixlwWD/8EScqFrNhOU5KR+bcYjmM4UYSk4GmbNG0lWbm3WXGvR7H
 5omxZmfrAvuLsgnTCIwFJrD7nRJwm3zvVnAVP+kAw8mzMYbFk/nmtrtEwQuHgXiDLqkD
 MIfHL359d/aZrO3rJd2OHaMvfvHd3dYCaUhHU3HDIMeEXW4RrBZjgrk2ApbEWoe1knzS
 Cf9xwVWyPSj22np63uTv5U+WopQ1LUe6EzBho15POV1xW7qaP73rwwL6mOHzkvKQ5kXd
 BdBw==
X-Gm-Message-State: AOJu0Ywr2xxWq0OEIPed4XfeXsv51VDYXF4KWhF2jB7DuQpGqOBqTEbx
 Z7SX/cHiN8lNLD0POZR7wBDIL9mD2ISp5nD+nuONjDD3omCEys/hKmTbQK18M3ChdY41pNWDRtI
 jsMGqciX9FUnG9j7ZOkSjwugdKNizvOZzPhR5oDyK4lZDm9GJVSK+KB1d1OyuFQ==
X-Gm-Gg: Acq92OGP8l53UzPJxDTO6Enofw8hrdmGAhsr4b5jRJS7C5IP/QvcuFKveqcTlU+1OTp
 LcVxsLB2lx15cNnBoGSvrKMKCkkDfqepsMyCFgvmM6+jyW1GHsQ28nsK8Ief7jvcPFOTMLyStq5
 IlEF9VwgueUjHXPnjmu7N7Wuk981lhV8/n5yFGjnpFm4AkRg6hDLN3DvPPX1s+KabC3UiV8o9gr
 WcZBuEb2Z9joSjtYrSyWEJTABCTqfDI5x86otXDmQME6bpODf+tptu+vGKhMqDkJfQcibH9zpZT
 zCcZhazwB0g6Bw/cGvuVYU/l6h8wjWDy5NAQzQ1XzbM9+t62LK+Ex8Nakw4ow5Avues3fedyBNi
 OmbFxw2YYdiFjTP7d5SA2k8M=
X-Received: by 2002:a05:622a:5518:b0:50b:3429:a10b with SMTP id
 d75a77b69052e-517986d4a6emr218254611cf.12.1781025925407; 
 Tue, 09 Jun 2026 10:25:25 -0700 (PDT)
X-Received: by 2002:a05:622a:5518:b0:50b:3429:a10b with SMTP id
 d75a77b69052e-517986d4a6emr218254171cf.12.1781025924798; 
 Tue, 09 Jun 2026 10:25:24 -0700 (PDT)
Received: from x1.com ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775da2c56sm187524711cf.21.2026.06.09.10.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:25:24 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 04/10] hw/arm: Use nodefault version of qdev props when not
 needed
Date: Tue,  9 Jun 2026 13:25:08 -0400
Message-ID: <20260609172514.2037645-5-peterx@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609172514.2037645-1-peterx@redhat.com>
References: <20260609172514.2037645-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2OFjMiZ6mqhLX4QCXsMeGMQEW0TLMOpqEL06jahuzWk_1781025925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We're going to introduce defvars for object properties just like qdev-props
defvars.  It work slightly differently in that props can be added in
instance_init() with default values, then the default values can only apply
after instance_init() completes.

It means any explicit set of property values within instance_init() when
used together with object property's default value (or qdev-prop, which
builts the default value framework on top) will stop working.

This patch touches two of such use cases where the device may add qdev
properties with a default value first, then quickly set another value
within instance_init().

These are the only two outliers I found across the QEMU tree that do it
this way.  Switch them to use qdev-prop's NODEFAULT APIs, and always
initialize the values manually.

Example 1:

bcm283x_base_init() adds qdev prop bcm2836_enabled_cores_property with a
default value 0, then it immediately set another value inside the same
instance_init() hook.

Example 2:

aarch64_add_pauth_properties() adds qdev prop arm_cpu_pauth_property, but
then it will immediately update the same field (cpu->prop_pauth)
conditionally when hwaccel_enabled()==true.

Without the change, some arm test may fail (boot-serial-test) after
introducing object property's default value framework, because devices'
values will be overwritten by the properties' later.

OTOH, this patch itself should introduce no functional change.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Philippe Mathieu-Daudé <philmd@mailo.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/arm/bcm2836.c   | 3 ++-
 target/arm/cpu64.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index f4ecea908b..9e4d30c99c 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -19,7 +19,8 @@
 #include "target/arm/gtimer.h"
 
 static const Property bcm2836_enabled_cores_property =
-    DEFINE_PROP_UINT32("enabled-cpus", BCM283XBaseState, enabled_cpus, 0);
+    DEFINE_PROP_UINT32_NODEFAULT(
+        "enabled-cpus", BCM283XBaseState, enabled_cpus);
 
 static void bcm283x_base_init(Object *obj)
 {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2816735577..a3a014a994 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -635,7 +635,7 @@ void aarch64_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 }
 
 static const Property arm_cpu_pauth_property =
-    DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
+    DEFINE_PROP_BOOL_NODEFAULT("pauth", ARMCPU, prop_pauth);
 static const Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 static const Property arm_cpu_pauth_qarma3_property =
@@ -660,6 +660,7 @@ void aarch64_add_pauth_properties(Object *obj)
          */
         cpu->prop_pauth = cpu_isar_feature(aa64_pauth, cpu);
     } else {
+        cpu->prop_pauth = true;
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma3_property);
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma5_property);
-- 
2.53.0


