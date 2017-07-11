Received: by 10.25.44.15 with SMTP id s15csp5022273lfs;
        Tue, 11 Jul 2017 08:55:51 -0700 (PDT)
X-Received: by 10.55.170.205 with SMTP id t196mr764713qke.106.1499788551572;
        Tue, 11 Jul 2017 08:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499788551; cv=none;
        d=google.com; s=arc-20160816;
        b=GpSFkf227bcrH3NylxofH+5nxPGwFXGTXiyRcWwBJn6U2ZJYQZxCHyM38WNgf2LYLu
         m3NOZbJWmJg5x3j/xlFWotVYh1rTYq9ItMnqdtSBO86zEffPIyDRRp59YqOvq5mKSH2u
         waaVCpHu4mhKo9E8sGmAyVI4YV3SbaMFDh13lY6Qie6jjTYwmvhN0w8dlegEYqneYSGX
         81HwG7HKmp9AhE5DHOpUA/0JDsm6OBbhVV2ti2YF8V+F7iWRGylE7F+LhO6T87dyUT3R
         3NHQpZMEeorssc6g02vC7nzKH3IFUL82dVgao8pjHx8kjfO4gYryQPSEVwVr2ReRURXN
         gBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Wzjs9F0/YaZLh4H4GEKkRGZ0idRaOsqsK1dy3dN7xjc=;
        b=kUy2RNA9pT3y5dHz4tZEiaovASnriI1sub67p/Ls7sgv6Aqw6nWncas1LuAP0R1Xn0
         M1VoeeE+EWzEVVQsjy0qhFXPMeXA6Lq9UnGvFYmfu+S2wOXOGUzR1e/LnOVAgXKtfVaA
         oQq3NHniWcxzhYkO6Y/+o6Mv2+KZdy0i+SvFxBNouQF8WTq7Azx0b/1wd6JvznkoVt8M
         4AUccmJyFuOVVeqtD3idfyOKcMkLn74+f/dqGoYSAD95Qj+PymCeDqfvWk6dGYLvnI3g
         KCEG3eApNahplX4Sdw7G066DLiLLwlBUVv/qdE44H/K9VIJdYt6sSxL2SdCNOSu2kd3a
         0Gmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id p19si251145qke.195.2017.07.11.08.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 08:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUxVs-0003Ix-Q4
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 11:55:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUxVn-0003I1-U7
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:55:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUxVm-0007Ak-Jc
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:55:43 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:48438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dUxVm-00077Y-1v; Tue, 11 Jul 2017 11:55:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dUxTd-0003KA-VG; Tue, 11 Jul 2017 16:53:29 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jul 2017 16:53:27 +0100
Message-Id: <1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 81.2.115.148
Subject: [Qemu-arm] [PATCH 2/3] qdev: support properties which don't set a
 default value
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bELbvSIeIeG1

In some situations it's useful to have a qdev property which doesn't
automatically set its default value when qdev_property_add_static is
called (for instance when the default value is not constant).

Support this by adding a flag to the Property struct indicating
whether to set the default value.  This replaces the existing test
for whether the PorpertyInfo set_default_value function pointer is
NULL, and we set the .set_default field to true for all those cases
of struct Property which use a PropertyInfo with a non-NULL
set_default_value, so behaviour remains the same as before.

We define two new macros DEFINE_PROP_SIGNED_NODEFAULT and
DEFINE_PROP_UNSIGNED_NODEFAULT, to cover the most plausible use cases
of wanting to set an integer property with no default value.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Since the previous patch fixed the only case that was
using a default value but not explicitly setting .defval.[ui],
this patch is a bit easier to review: .set_default = true
is added in exactly the places that initialize .defval.[ui].
---
 include/hw/qdev-core.h       |  1 +
 include/hw/qdev-properties.h | 20 ++++++++++++++++++++
 hw/core/qdev.c               |  2 +-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 9d7c1c0..d110163 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -226,6 +226,7 @@ struct Property {
     PropertyInfo *info;
     ptrdiff_t    offset;
     uint8_t      bitnr;
+    bool         set_default;
     union {
         int64_t i;
         uint64_t u;
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 36d040c..66816a5 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -43,15 +43,24 @@ extern PropertyInfo qdev_prop_arraylen;
         .info      = &(_prop),                                          \
         .offset    = offsetof(_state, _field)                           \
             + type_check(_type,typeof_field(_state, _field)),           \
+        .set_default = true,                                            \
         .defval.i  = (_type)_defval,                                    \
         }
 
+#define DEFINE_PROP_SIGNED_NODEFAULT(_name, _state, _field, _prop, _type) { \
+        .name      = (_name),                                           \
+        .info      = &(_prop),                                          \
+        .offset    = offsetof(_state, _field)                           \
+            + type_check(_type, typeof_field(_state, _field)),          \
+        }
+
 #define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval) {  \
         .name      = (_name),                                    \
         .info      = &(qdev_prop_bit),                           \
         .bitnr    = (_bit),                                      \
         .offset    = offsetof(_state, _field)                    \
             + type_check(uint32_t,typeof_field(_state, _field)), \
+        .set_default = true,                                     \
         .defval.u  = (bool)_defval,                              \
         }
 
@@ -60,15 +69,24 @@ extern PropertyInfo qdev_prop_arraylen;
         .info      = &(_prop),                                          \
         .offset    = offsetof(_state, _field)                           \
             + type_check(_type, typeof_field(_state, _field)),          \
+        .set_default = true,                                            \
         .defval.u  = (_type)_defval,                                    \
         }
 
+#define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _type) { \
+        .name      = (_name),                                           \
+        .info      = &(_prop),                                          \
+        .offset    = offsetof(_state, _field)                           \
+            + type_check(_type, typeof_field(_state, _field)),          \
+        }
+
 #define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval) {       \
         .name      = (_name),                                           \
         .info      = &(qdev_prop_bit64),                                \
         .bitnr    = (_bit),                                             \
         .offset    = offsetof(_state, _field)                           \
             + type_check(uint64_t, typeof_field(_state, _field)),       \
+        .set_default = true,                                            \
         .defval.u  = (bool)_defval,                                     \
         }
 
@@ -77,6 +95,7 @@ extern PropertyInfo qdev_prop_arraylen;
         .info      = &(qdev_prop_bool),                          \
         .offset    = offsetof(_state, _field)                    \
             + type_check(bool, typeof_field(_state, _field)),    \
+        .set_default = true,                                     \
         .defval.u    = (bool)_defval,                            \
         }
 
@@ -110,6 +129,7 @@ extern PropertyInfo qdev_prop_arraylen;
                           _arrayfield, _arrayprop, _arraytype) {        \
         .name = (PROP_ARRAY_LEN_PREFIX _name),                          \
         .info = &(qdev_prop_arraylen),                                  \
+        .set_default = true,                                            \
         .defval.u = 0,                                                  \
         .offset = offsetof(_state, _field)                              \
             + type_check(uint32_t, typeof_field(_state, _field)),       \
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 849952a..96965a7 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -793,7 +793,7 @@ void qdev_property_add_static(DeviceState *dev, Property *prop,
                                     prop->info->description,
                                     &error_abort);
 
-    if (prop->info->set_default_value) {
+    if (prop->set_default) {
         prop->info->set_default_value(obj, prop);
     }
 }
-- 
2.7.4

