Received: by 10.182.158.201 with SMTP id ww9csp2020923obb;
        Thu, 19 Nov 2015 07:23:13 -0800 (PST)
X-Received: by 10.31.41.72 with SMTP id p69mr5168023vkp.126.1447946591580;
        Thu, 19 Nov 2015 07:23:11 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m134si4465030vke.15.2015.11.19.07.23.11
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 19 Nov 2015 07:23:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:42400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzR3H-0004V7-5k
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 10:23:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2S-0003Jj-4P
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2R-0000iC-7p
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:20 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:33792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2R-0000i3-1d
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:19 -0500
Received: by wmvv187 with SMTP id v187so30879316wmv.1
	for <qemu-devel@nongnu.org>; Thu, 19 Nov 2015 07:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I/BTzYHGR12Qh9gW+a//OfNbTkFmg/9U8k6a9BDEigc=;
	b=tDJ60FNvpyBRZybJSDMdQ3EEmyhafSaqWCT0wrV+Su1jZf4abVDWnu6KAPMkVmY3n2
	IIc13pxmmwzx4oW74h1728smwBkxjlnCUso/nSmfWg9rPGDWqMAU0nUwwzN51TVuaj+Q
	MZSetyju9uiTG1gHG/ScoopDPgrKL+Rqo8SpSNE/xcfIZ6IrPn5L+B3naqD6jzftLCO0
	MPEO7d4iwflkLXVYoMFXQqGG9BStE3sDTg7+VM9iqqer6GpZLFQnYsW5qfxyPf4xgLP0
	syRj5trFmVKshWjkU2X+XhucQEiqZUBSoRv712k5QSAVLY/1ch813CjjyARIywlTTVwp
	tncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I/BTzYHGR12Qh9gW+a//OfNbTkFmg/9U8k6a9BDEigc=;
	b=mD1XzfyXZBbCnmiT6ttjToDuOOfAkexeNQhwjk+zwb4h8qnnpcRH1QsZ07nVxUHUpv
	pYMwJ9mzZefjja0cEwPNBpLYPbKBxj52G4lvDB0RPuhb5ADc7N2WS2ajPe0sulAx3sO+
	xfTcADiVcmPmqbrbJZH6qdhz8dSVAx5gMvplUsko5cIxyPaM03OOqDYLC+4aCGLcwD05
	ytONow5MsYIUUp3PtUKrnM2RWwLonzm6yGQZEb7pE4KHmUcdcedNDAv6SpcM3yt6Q7Js
	N4su/B563BTf4wG3x6EU3Cb7inspZ7F4TKnRW4mxfU2UBTMKy2FYYyoMblzlkBDD6GKA
	O3IA==
X-Gm-Message-State: ALoCoQlintxcv8B9XagPyo67G2VrtdLcJJLELX2uLh6hZhQs+C+1L+KCS1OCDGgWjKItAkoAwtqQ
X-Received: by 10.194.178.70 with SMTP id cw6mr8906562wjc.73.1447946538506;
	Thu, 19 Nov 2015 07:22:18 -0800 (PST)
Received: from midway01-04-00.lavalab ([81.128.185.50])
	by smtp.gmail.com with ESMTPSA id
	vr10sm8367221wjc.38.2015.11.19.07.22.17
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 07:22:17 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org
Date: Thu, 19 Nov 2015 15:22:05 +0000
Message-Id: <1447946528-1533-4-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::230
Cc: thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
	patches@linaro.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: [Qemu-devel] [RESEND RFC 3/6] device_tree: introduce
	qemu_fdt_node_path
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5hUA9aycY4Y8

This new helper routine returns the node path of a device
referred to by its name and compat string.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 device_tree.c                | 40 ++++++++++++++++++++++++++++++++++++++++
 include/sysemu/device_tree.h |  3 +++
 2 files changed, 43 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index 58a5329..f184e3c 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -171,6 +171,46 @@ static int findnode_nofail(void *fdt, const char *node_path)
     return offset;
 }
 
+/**
+ * qemu_fdt_node_path
+ *
+ * return the node path of a device, referred to by its node name
+ * and its compat string
+ * fdt: pointer to the dt blob
+ * name: name of the device
+ * compat: compatibility string of the device
+ *
+ * returns the node path
+ */
+int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+                       char **node_path)
+{
+    int offset = 0, len;
+    const char *iter_name;
+    char path[256];
+    int ret;
+
+    *node_path = NULL;
+    while (1) {
+        offset = fdt_node_offset_by_compatible(fdt, offset, compat);
+        if (offset == -FDT_ERR_NOTFOUND) {
+            break;
+        }
+        iter_name = fdt_get_name(fdt, offset, &len);
+        if (!strncmp(iter_name, name, len)) {
+            goto found;
+        }
+    }
+    return offset;
+
+found:
+    ret = fdt_get_path(fdt, offset, path, 256);
+    if (!ret) {
+        *node_path = g_strdup(path);
+    }
+    return ret;
+}
+
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size)
 {
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 307e53d..f9e6e6e 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -18,6 +18,9 @@ void *create_device_tree(int *sizep);
 void *load_device_tree(const char *filename_path, int *sizep);
 void *load_device_tree_from_sysfs(void);
 
+int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+                       char **node_path);
+
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size);
 int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
-- 
1.8.3.2

