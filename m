Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp389564lfy;
        Thu, 13 Aug 2020 03:34:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHz5vIRohjBbeXDUC0VcJ5cmbY/y6Jm7ugvv5/1vRc1Z0UYApPxnOqlZTyz+U7Xqew3vBJ
X-Received: by 2002:a25:ab11:: with SMTP id u17mr5407946ybi.327.1597314893671;
        Thu, 13 Aug 2020 03:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597314893; cv=none;
        d=google.com; s=arc-20160816;
        b=XPap+i42kf/fIXtN06k3YMW3hyC8UBGj/L+5Lsq1BDb/EBWI7uf8BhsmrHx0yFP2iR
         O5EerR99U7WR8TwEdmUdnO2Bu+EH8NFv09PGw8RtRaCgORS3hrSz9HkcDubjPALDrP1h
         TLryMcrfF2PlQ8RPLsvdF2mbN7h9COAUzGK5ZhsapLq9BG05afDYp4orQHdX4xiyI4Hu
         0bEs8WnkCcEhymbbvIgdXdYXDXeWyuMgDjR95vhXQy6s2zF/D943WhDJUgj+6svCxIgy
         gn7dIB8oDJIeX+AGdsbJeheYhzySjEHqvCnk4CR3CxPLbNOQdt4lNusUPqKq5rYlmiFM
         WVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=0PBGyv0y8ZeQYeDoV3BZbzIyeVo+wf+ixIgW4yQ+IH0=;
        b=MKX7anvEtmCa+LAiwLWcbcl8QiHSwMigsyONayXtWLk8Zofp5Q41ow77SN2xmv4Ckr
         SyspH4QEZSfFMh+DL7YaDJ3KEFxNEDZXM+WndtdC0yZWXAerUYN74b0Y10vp3RHTr8Dl
         qL/u+4oaSB0E9/z+mremu2ZngZvAVWVNnh+mgnSCz5oq4KrPu3n4CKQ0PZrsvKXaIijN
         01c4OkH6nWPfZuqeewqkhHmkZtU8JtdSjO3xNdJQqjOLehQFXXJtHQHnwN14BFNeBc8h
         YFniLiKQCJfRdR4i7Im/IABdIxHk8fyoCyvrqan7QWq5bs7FnNybCa3JPVJO4nrCvCbS
         Omkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23si5289660ybc.464.2020.08.13.03.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 03:34:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6AZR-0003zl-1e
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 06:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXC-00004y-KZ; Thu, 13 Aug 2020 06:32:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4182 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AX8-0006p1-PZ; Thu, 13 Aug 2020 06:32:34 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1F1F7F1691C568442C8D;
 Thu, 13 Aug 2020 18:32:27 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 18:32:16 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC 2/9] target/arm: parse cpu feature related options
Date: Thu, 13 Aug 2020 18:26:50 +0800
Message-ID: <20200813102657.2588720-3-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200813102657.2588720-1-liangpeng10@huawei.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 06:32:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dA9wAnkaYlXr

The implementation of CPUClass::parse_features only supports CPU
features in "feature=value" format.  However, libvirt maybe send us a
CPU feature string in "+feature/-feature" format.  Hence, we need to
override CPUClass::parse_features to support CPU feature string in both
"feature=value" and "+feature/-feature" format.

The logic of AArch64CPUClass::parse_features is similar to that of
X86CPUClass::parse_features.  The diference is that feature name is
transformed to upper before it's added as a property because the name
of CPU features is upper for convenience.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu64.c | 101 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4b52505b6e..981011b3da 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -28,6 +28,7 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 #include "qapi/visitor.h"
+#include "hw/qdev-properties.h"
 
 #ifndef CONFIG_USER_ONLY
 static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -778,6 +779,105 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
     return g_strdup("aarch64");
 }
 
+static void
+cpu_add_feat_as_prop(const char *typename, const char *name, const char *val)
+{
+    GlobalProperty *prop = g_new0(typeof(*prop), 1);
+    prop->driver = typename;
+    prop->property = g_strdup(name);
+    prop->value = g_strdup(val);
+    qdev_prop_register_global(prop);
+}
+
+static gint compare_string(gconstpointer a, gconstpointer b)
+{
+    return g_strcmp0(a, b);
+}
+
+static GList *plus_features, *minus_features;
+
+static char *strtoupr(char *str)
+{
+    char *orign = str;
+
+    for (; *str != '\0'; str++) {
+        *str = toupper(*str);
+    }
+
+    return orign;
+}
+
+static void aarch64_cpu_parse_features(const char *typename, char *features,
+                                     Error **errp)
+{
+    GList *l;
+    char *featurestr; /* Single 'key=value" string being parsed */
+    static bool cpu_globals_initialized;
+
+    if (cpu_globals_initialized) {
+        return;
+    }
+    cpu_globals_initialized = true;
+
+    if (!features) {
+        return;
+    }
+    for (featurestr = strtok(features, ",");
+        featurestr;
+        featurestr = strtok(NULL, ",")) {
+        const char *name;
+        char *tmp;
+        const char *val = NULL;
+        char *eq = NULL;
+
+        /* Compatibility syntax: */
+        if (featurestr[0] == '+') {
+            plus_features = g_list_append(plus_features,
+                                          g_strdup(featurestr + 1));
+            continue;
+        } else if (featurestr[0] == '-') {
+            minus_features = g_list_append(minus_features,
+                                           g_strdup(featurestr + 1));
+            continue;
+        }
+
+        eq = strchr(featurestr, '=');
+        name = featurestr;
+        if (eq) {
+            *eq++ = 0;
+            val = eq;
+        } else {
+            error_setg(errp, "Unsupported property format: %s", name);
+            return;
+        }
+
+        if (g_list_find_custom(plus_features, name, compare_string)) {
+            warn_report("Ambiguous CPU model string. "
+                        "Don't mix both \"+%s\" and \"%s=%s\"",
+                        name, name, val);
+        }
+        if (g_list_find_custom(minus_features, name, compare_string)) {
+            warn_report("Ambiguous CPU model string. "
+                        "Don't mix both \"-%s\" and \"%s=%s\"",
+                        name, name, val);
+        }
+        tmp = g_strdup(name);
+        tmp = strtoupr(tmp);
+        cpu_add_feat_as_prop(typename, tmp, val);
+        g_free(tmp);
+    }
+
+    for (l = plus_features; l; l = l->next) {
+        const char *name = strtoupr(l->data); /* convert to upper string */
+        cpu_add_feat_as_prop(typename, name, "on");
+    }
+
+    for (l = minus_features; l; l = l->next) {
+        const char *name = strtoupr(l->data);
+        cpu_add_feat_as_prop(typename, name, "off");
+    }
+}
+
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
@@ -788,6 +888,7 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 34;
     cc->gdb_core_xml_file = "aarch64-core.xml";
     cc->gdb_arch_name = aarch64_gdb_arch_name;
+    cc->parse_features = aarch64_cpu_parse_features;
 }
 
 static void aarch64_cpu_instance_init(Object *obj)
-- 
2.18.4

