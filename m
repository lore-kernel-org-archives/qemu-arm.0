Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5429533wrq;
        Tue, 26 Jun 2018 13:22:04 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeZ1ljjDfZPg6+UIwQlVW0YDmhezvvLeTPAwo0eh3Wtss92pVUvGEYdb3WAAcC2bfUhkhEk
X-Received: by 2002:a37:1224:: with SMTP id c36-v6mr2812992qkh.26.1530044524861;
        Tue, 26 Jun 2018 13:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530044524; cv=none;
        d=google.com; s=arc-20160816;
        b=s30R87gAexsel4Mux/WToNnCZL/1WRwlZu9LAugMhtcP+jrje7N+eOUPGaziMDMm6Y
         Nyytd0ApSIBSkHxc4xCtfcTZL/AonCsXfFWhFcK9nGK1+6oNpKPbgZqTLTDRlygcV4w7
         ya3+eiqtb+xIjt0cTvS3jQciMkIozU8/bdRzGr63LUXzatlkG0T6kj72RufmPlMKJh3b
         f7gPtHne3U3vPwsgqeOv4pNW9OtZ0A+Vu/3E0yfjykRuDRn+DweZzGwN70FZgWbiBWpO
         gJBPjbonNjNqpVkbGUsMsnsD94icqY+Tc+ojqTe1Kwtg9kBbssrR5JgkwvEy7AC85n1+
         zlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=BXEsL27VIa3zQgsA3ITFKpzp5m2mZtQW1RRpiFJ+W+s=;
        b=FLpS8tETRGMHgWJ8UtSHaTVl+YMxpnlAO+YrwJVJB70zi3Tft7tYUnm53FUIJS06Rh
         aDyt7ze4frybluE7K2V+Enmj+hUNns6RvgLKsAm69TK+KjtVRRSyTKFGcBM0SlnQHuuW
         yrsgGON5Aj1+jB2REE8zbpMo91s4Wb2y/qyMUsoMWygDDXbAAf8ysNc7+duoUJeCKAwW
         bzgdBCnKvoQWBPj6J9qQwsmVbxB1QMorbttjkxU/B7lvjmNr1epKtoGGbKZsiNAKb4tV
         PbBZUqamFV7VejB+qJSmFoliD1l6P3H4TWf9/pqw6ZxtujQkm4g7KRKIsQom/nngYdd0
         JRww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34-v6si1623532qty.96.2018.06.26.13.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 13:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXuTU-0007wq-3h
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 16:22:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fXuT9-0007w5-CN
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 16:21:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fXuT6-0006zO-GC
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 16:21:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39586 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fXuT6-0006zI-As; Tue, 26 Jun 2018 16:21:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0A9D738E6;
	Tue, 26 Jun 2018 20:21:39 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9E011117643;
	Tue, 26 Jun 2018 20:21:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	agraf@suse.de
Date: Tue, 26 Jun 2018 22:21:30 +0200
Message-Id: <1530044492-24921-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530044492-24921-1-git-send-email-eric.auger@redhat.com>
References: <1530044492-24921-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 26 Jun 2018 20:21:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 26 Jun 2018 20:21:39 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 1/3] device_tree: Add qemu_fdt_node_unit_path
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KC2JOkJJn+/V

This helper allows to retrieve the paths of nodes whose name
match node-name or node-name@unit-address patterns.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 device_tree.c                | 55 ++++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/device_tree.h | 16 +++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index 52c3358..b5873f3 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -229,6 +229,61 @@ static int findnode_nofail(void *fdt, const char *node_path)
     return offset;
 }
 
+char **qemu_fdt_node_unit_path(void *fdt, const char *name, Error **errp)
+{
+    char *prefix =  g_strdup_printf("%s@", name);
+    unsigned int path_len = 16, n = 0;
+    GSList *path_list = NULL, *iter;
+    const char *iter_name;
+    int offset, len, ret;
+    char **path_array;
+
+    offset = fdt_next_node(fdt, -1, NULL);
+
+    while (offset >= 0) {
+        iter_name = fdt_get_name(fdt, offset, &len);
+        if (!iter_name) {
+            offset = len;
+            break;
+        }
+        if (!strcmp(iter_name, name) || g_str_has_prefix(iter_name, prefix)) {
+            char *path;
+
+            path = g_malloc(path_len);
+            while ((ret = fdt_get_path(fdt, offset, path, path_len))
+                  == -FDT_ERR_NOSPACE) {
+                path_len += 16;
+                path = g_realloc(path, path_len);
+            }
+            path_list = g_slist_prepend(path_list, path);
+            n++;
+        }
+        offset = fdt_next_node(fdt, offset, NULL);
+    }
+    g_free(prefix);
+
+    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
+        error_setg(errp, "%s: abort parsing dt for %s node units: %s",
+                   __func__, name, fdt_strerror(offset));
+        for (iter = path_list; iter; iter = iter->next) {
+            g_free(iter->data);
+        }
+        g_slist_free(path_list);
+        return NULL;
+    }
+
+    path_array = g_new(char *, n + 1);
+    path_array[n--] = NULL;
+
+    for (iter = path_list; iter; iter = iter->next) {
+        path_array[n--] = iter->data;
+    }
+
+    g_slist_free(path_list);
+
+    return path_array;
+}
+
 char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
                           Error **errp)
 {
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index e22e5be..c16fd69 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -43,6 +43,22 @@ void *load_device_tree_from_sysfs(void);
 char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
                           Error **errp);
 
+/**
+ * qemu_fdt_node_unit_path: return the paths of nodes matching a given
+ * node-name, ie. node-name and node-name@unit-address
+ * @fdt: pointer to the dt blob
+ * @name: node name
+ * @errp: handle to an error object
+ *
+ * returns a newly allocated NULL-terminated array of node paths.
+ * Use g_strfreev() to free it. If one or more nodes were found, the
+ * array contains the path of each node and the last element equals to
+ * NULL. If there is no error but no matching node was found, the
+ * returned array contains a single element equal to NULL. If an error
+ * was encountered when parsing the blob, the function returns NULL
+ */
+char **qemu_fdt_node_unit_path(void *fdt, const char *name, Error **errp);
+
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size);
 int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
-- 
2.5.5

