Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2509740lfc;
        Sun, 15 Mar 2020 21:33:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvFIG4odqgwHdQ+GmKiLKe+PN3JGR3+jFxo01y9sILfxCmzM7zFqKQjaVScQfGHjZjbUKyH
X-Received: by 2002:aed:39c8:: with SMTP id m66mr3985147qte.4.1584333203564;
        Sun, 15 Mar 2020 21:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584333203; cv=none;
        d=google.com; s=arc-20160816;
        b=IfNAhAOesnsfqL0c1EtoVvx7+WEfke8J7WZ1sqPwoy5AqeKd0sUvnhjOR9zsZAKMtH
         mvjGup0CrutLdyBrDZx78ZiEXoapCFbONigWnoroL0cLClodGDNKCg/IE7CAZa/5PEV6
         aqYOqYFOWOp0+dY0x2LyMb2F38pfLwmhcesWW3rMyVwYZiIW3XFMaBIVKJwHrasPT+Td
         5513frR2tjCGQtaQewh9NdLAkgB2EbtbFyZd1kA5RbTulGGDIS8hjcCOvRpbBNu0LYTY
         Fa7ebtEFmgXVaWZ9zfwsrF7VopxVt0t7yA/23PQ0QYnsKRt6fElJqK9xj7DwsztQG6+P
         zrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=KwBtUf8l573M0A+Fq4NFvQe56rI/MwhASa5vSduimCw=;
        b=og3B7BbsVKUPmQKLrRmfMs8jXr51Zxm8XzEiwrVK6aod0IDhtFkZYlxx9O4kdWcMOU
         iyJ+AM/KD5qPbaR2z2lU/tZOAY9rxJ8MF1ChHIIyh/JVsBrtAlRBXlENj5OmIEQ7XOG+
         ByfrmW32PZhMSBXAeBcy2nHvtrzaxEPQLqdCzuQkUFeIFX4UT3ODecjeMrAb/Ya1bVBC
         WOGqBXsj4LKeZhxkqvWs2EhUbvl7KmDIBfHXvdX/+rz0IEZxdLG+F3cIwNlLmFJ+LMur
         w+RpRAsVEfIrJ/vZXSTfcm2qGKGlaHSgZJeu6VkIY5ARE+wPwAV8b1LrUVTBkJSwISJL
         9FnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si9055344qvl.112.2020.03.15.21.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 21:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDhRK-0004X4-JV
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 00:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jDhQB-0004Wy-Mm
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 00:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jDhQ9-0003gd-I7
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 00:32:11 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3723 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jDhQ8-0001vx-U2; Mon, 16 Mar 2020 00:32:09 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7960E42CF3B8E82A115F;
 Mon, 16 Mar 2020 12:31:55 +0800 (CST)
Received: from linux-kDCJWP.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Mar 2020 12:31:46 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] migration/throttle: Add cpu-throttle-tailslow migration
 parameter
Date: Mon, 16 Mar 2020 12:29:35 +0800
Message-ID: <20200316042935.28306-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ksv+QTAwvnH

At the tail stage of throttling, the Guest is very sensitive to
CPU percentage while the @cpu-throttle-increment is excessive
usually at tail stage.

If this parameter is true, we will compute the ideal CPU percentage
used by the Guest, which may exactly makes dirty rate to be dirty
rate threshold. Then we will choose a smaller throttle increment
between the one specified by @cpu-throttle-increment and the one
generated by ideal CPU percentage.

Therefore, it is compatible to traditional throttling, meanwhile
the throttle increment won't be excessive at tail stage. This may
make migration time longer, and is disabled by default.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
---
 migration/migration.c | 13 ++++++++++++
 migration/ram.c       | 25 +++++++++++++++++-----
 monitor/hmp-cmds.c    |  8 ++++++++
 qapi/migration.json   | 48 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index c1d88ace7f..cc157cbf90 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -785,6 +785,8 @@ MigrationParameters *qmp_query_migrate_parameters(Err=
or **errp)
     params->cpu_throttle_initial =3D s->parameters.cpu_throttle_initial;
     params->has_cpu_throttle_increment =3D true;
     params->cpu_throttle_increment =3D s->parameters.cpu_throttle_increm=
ent;
+    params->has_cpu_throttle_tailslow =3D true;
+    params->cpu_throttle_tailslow =3D s->parameters.cpu_throttle_tailslo=
w;
     params->has_tls_creds =3D true;
     params->tls_creds =3D g_strdup(s->parameters.tls_creds);
     params->has_tls_hostname =3D true;
@@ -1323,6 +1325,10 @@ static void migrate_params_test_apply(MigrateSetPa=
rameters *params,
         dest->cpu_throttle_increment =3D params->cpu_throttle_increment;
     }
=20
+    if (params->has_cpu_throttle_tailslow) {
+        dest->cpu_throttle_tailslow =3D params->cpu_throttle_tailslow;
+    }
+
     if (params->has_tls_creds) {
         assert(params->tls_creds->type =3D=3D QTYPE_QSTRING);
         dest->tls_creds =3D g_strdup(params->tls_creds->u.s);
@@ -1411,6 +1417,10 @@ static void migrate_params_apply(MigrateSetParamet=
ers *params, Error **errp)
         s->parameters.cpu_throttle_increment =3D params->cpu_throttle_in=
crement;
     }
=20
+    if (params->has_cpu_throttle_tailslow) {
+        s->parameters.cpu_throttle_tailslow =3D params->cpu_throttle_tai=
lslow;
+    }
+
     if (params->has_tls_creds) {
         g_free(s->parameters.tls_creds);
         assert(params->tls_creds->type =3D=3D QTYPE_QSTRING);
@@ -3588,6 +3598,8 @@ static Property migration_properties[] =3D {
     DEFINE_PROP_UINT8("x-cpu-throttle-increment", MigrationState,
                       parameters.cpu_throttle_increment,
                       DEFAULT_MIGRATE_CPU_THROTTLE_INCREMENT),
+    DEFINE_PROP_BOOL("x-cpu-throttle-tailslow", MigrationState,
+                      parameters.cpu_throttle_tailslow, false),
     DEFINE_PROP_SIZE("x-max-bandwidth", MigrationState,
                       parameters.max_bandwidth, MAX_THROTTLE),
     DEFINE_PROP_UINT64("x-downtime-limit", MigrationState,
@@ -3694,6 +3706,7 @@ static void migration_instance_init(Object *obj)
     params->has_throttle_trigger_threshold =3D true;
     params->has_cpu_throttle_initial =3D true;
     params->has_cpu_throttle_increment =3D true;
+    params->has_cpu_throttle_tailslow =3D true;
     params->has_max_bandwidth =3D true;
     params->has_downtime_limit =3D true;
     params->has_x_checkpoint_delay =3D true;
diff --git a/migration/ram.c b/migration/ram.c
index c12cfdbe26..4b74461306 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -616,20 +616,34 @@ static size_t save_page_header(RAMState *rs, QEMUFi=
le *f,  RAMBlock *block,
  * able to complete migration. Some workloads dirty memory way too
  * fast and will not effectively converge, even with auto-converge.
  */
-static void mig_throttle_guest_down(void)
+static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
+                                    uint64_t bytes_dirty_threshold)
 {
     MigrationState *s =3D migrate_get_current();
     uint64_t pct_initial =3D s->parameters.cpu_throttle_initial;
-    uint64_t pct_icrement =3D s->parameters.cpu_throttle_increment;
+    uint64_t pct_increment =3D s->parameters.cpu_throttle_increment;
+    bool pct_tailslow =3D s->parameters.cpu_throttle_tailslow;
     int pct_max =3D s->parameters.max_cpu_throttle;
=20
+    uint64_t throttle_now =3D cpu_throttle_get_percentage();
+    uint64_t cpu_now, cpu_ideal, throttle_inc;
+
     /* We have not started throttling yet. Let's start it. */
     if (!cpu_throttle_active()) {
         cpu_throttle_set(pct_initial);
     } else {
         /* Throttling already on, just increase the rate */
-        cpu_throttle_set(MIN(cpu_throttle_get_percentage() + pct_icremen=
t,
-                         pct_max));
+        if (!pct_tailslow) {
+            throttle_inc =3D pct_increment;
+        } else {
+            /* Compute the ideal CPU percentage used by Guest, which
+             * may makes dirty rate to be dirty rate threshold. */
+            cpu_now =3D 100 - throttle_now;
+            cpu_ideal =3D cpu_now * (bytes_dirty_threshold * 1.0 /
+                        bytes_dirty_period);
+            throttle_inc =3D MIN(cpu_now - cpu_ideal, pct_increment);
+        }
+        cpu_throttle_set(MIN(throttle_now + throttle_inc, pct_max));
     }
 }
=20
@@ -919,7 +933,8 @@ static void migration_trigger_throttle(RAMState *rs)
             (++rs->dirty_rate_high_cnt >=3D 2)) {
             trace_migration_throttle();
             rs->dirty_rate_high_cnt =3D 0;
-            mig_throttle_guest_down();
+            mig_throttle_guest_down(bytes_dirty_period,
+                                    bytes_dirty_threshold);
         }
     }
 }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 58724031ea..29878632c8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -419,6 +419,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const=
 QDict *qdict)
         monitor_printf(mon, "%s: %u\n",
             MigrationParameter_str(MIGRATION_PARAMETER_CPU_THROTTLE_INCR=
EMENT),
             params->cpu_throttle_increment);
+        assert(params->has_cpu_throttle_tailslow);
+        monitor_printf(mon, "%s: %s\n",
+            MigrationParameter_str(MIGRATION_PARAMETER_CPU_THROTTLE_TAIL=
SLOW),
+            params->cpu_throttle_tailslow ? "on" : "off");
         assert(params->has_max_cpu_throttle);
         monitor_printf(mon, "%s: %u\n",
             MigrationParameter_str(MIGRATION_PARAMETER_MAX_CPU_THROTTLE)=
,
@@ -1269,6 +1273,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const=
 QDict *qdict)
         p->has_cpu_throttle_increment =3D true;
         visit_type_int(v, param, &p->cpu_throttle_increment, &err);
         break;
+    case MIGRATION_PARAMETER_CPU_THROTTLE_TAILSLOW:
+        p->has_cpu_throttle_tailslow =3D true;
+        visit_type_bool(v, param, &p->cpu_throttle_tailslow, &err);
+        break;
     case MIGRATION_PARAMETER_MAX_CPU_THROTTLE:
         p->has_max_cpu_throttle =3D true;
         visit_type_int(v, param, &p->max_cpu_throttle, &err);
diff --git a/qapi/migration.json b/qapi/migration.json
index 0d1c0712ca..4bf82b74d1 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -552,6 +552,21 @@
 #                          auto-converge detects that migration is not m=
aking
 #                          progress. The default value is 10. (Since 2.7=
)
 #
+# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
+#                         At the tail stage of throttling, the Guest is =
very
+#                         sensitive to CPU percentage while the @cpu-thr=
ottle
+#                         -increment is excessive usually at tail stage.
+#                         If this parameter is true, we will compute the=
 ideal
+#                         CPU percentage used by the Guest, which may ex=
actly
+#                         makes dirty rate to be dirty rate threshold. T=
hen we
+#                         will choose a smaller throttle increment betwe=
en the
+#                         one specified by @cpu-throttle-increment and t=
he one
+#                         generated by ideal CPU percentage.
+#                         Therefore, it is compatible to traditional thr=
ottling,
+#                         meanwhile the throttle increment won't be exce=
ssive
+#                         at tail stage.
+#                         The default value is false. (Since 5.0)
+#
 # @tls-creds: ID of the 'tls-creds' object that provides credentials for
 #             establishing a TLS connection over the migration data chan=
nel.
 #             On the outgoing side of the migration, the credentials mus=
t
@@ -631,6 +646,7 @@
            'compress-level', 'compress-threads', 'decompress-threads',
            'compress-wait-thread', 'throttle-trigger-threshold',
            'cpu-throttle-initial', 'cpu-throttle-increment',
+           'cpu-throttle-tailslow',
            'tls-creds', 'tls-hostname', 'tls-authz', 'max-bandwidth',
            'downtime-limit', 'x-checkpoint-delay', 'block-incremental',
            'multifd-channels',
@@ -676,6 +692,21 @@
 #                          auto-converge detects that migration is not m=
aking
 #                          progress. The default value is 10. (Since 2.7=
)
 #
+# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
+#                         At the tail stage of throttling, the Guest is =
very
+#                         sensitive to CPU percentage while the @cpu-thr=
ottle
+#                         -increment is excessive usually at tail stage.
+#                         If this parameter is true, we will compute the=
 ideal
+#                         CPU percentage used by the Guest, which may ex=
actly
+#                         makes dirty rate to be dirty rate threshold. T=
hen we
+#                         will choose a smaller throttle increment betwe=
en the
+#                         one specified by @cpu-throttle-increment and t=
he one
+#                         generated by ideal CPU percentage.
+#                         Therefore, it is compatible to traditional thr=
ottling,
+#                         meanwhile the throttle increment won't be exce=
ssive
+#                         at tail stage.
+#                         The default value is false. (Since 5.0)
+#
 # @tls-creds: ID of the 'tls-creds' object that provides credentials
 #             for establishing a TLS connection over the migration data
 #             channel. On the outgoing side of the migration, the creden=
tials
@@ -763,6 +794,7 @@
             '*throttle-trigger-threshold': 'int',
             '*cpu-throttle-initial': 'int',
             '*cpu-throttle-increment': 'int',
+            '*cpu-throttle-tailslow': 'bool',
             '*tls-creds': 'StrOrNull',
             '*tls-hostname': 'StrOrNull',
             '*tls-authz': 'StrOrNull',
@@ -834,6 +866,21 @@
 #                          auto-converge detects that migration is not m=
aking
 #                          progress. (Since 2.7)
 #
+# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
+#                         At the tail stage of throttling, the Guest is =
very
+#                         sensitive to CPU percentage while the @cpu-thr=
ottle
+#                         -increment is excessive usually at tail stage.
+#                         If this parameter is true, we will compute the=
 ideal
+#                         CPU percentage used by the Guest, which may ex=
actly
+#                         makes dirty rate to be dirty rate threshold. T=
hen we
+#                         will choose a smaller throttle increment betwe=
en the
+#                         one specified by @cpu-throttle-increment and t=
he one
+#                         generated by ideal CPU percentage.
+#                         Therefore, it is compatible to traditional thr=
ottling,
+#                         meanwhile the throttle increment won't be exce=
ssive
+#                         at tail stage.
+#                         The default value is false. (Since 5.0)
+#
 # @tls-creds: ID of the 'tls-creds' object that provides credentials
 #             for establishing a TLS connection over the migration data
 #             channel. On the outgoing side of the migration, the creden=
tials
@@ -921,6 +968,7 @@
             '*throttle-trigger-threshold': 'uint8',
             '*cpu-throttle-initial': 'uint8',
             '*cpu-throttle-increment': 'uint8',
+            '*cpu-throttle-tailslow': 'bool',
             '*tls-creds': 'str',
             '*tls-hostname': 'str',
             '*tls-authz': 'str',
--=20
2.19.1

