Received: by 10.182.158.201 with SMTP id ww9csp659389obb;
        Thu, 7 Jan 2016 07:50:37 -0800 (PST)
X-Received: by 10.194.82.36 with SMTP id f4mr11304326wjy.87.1452181832616;
        Thu, 07 Jan 2016 07:50:32 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id n5si19525253wma.116.2016.01.07.07.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2016 07:50:32 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id f206so102500230wmf.0
        for <alex.bennee@linaro.org>; Thu, 07 Jan 2016 07:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=shZPHsvOQormtinDO9b78KhUZdxB/4UyawV7i+/Evoc=;
        b=JrPs8DmxjO+/nWJnHScyXAMFgRb9AyHOS06WXXPJH4gplpnzl+5USoPYKxr17egqyJ
         qtv3JWxeXr55+GghsFuRuv71lTi7kj8hsk54VhdIVj+a3LaGwNkSC2WR1JZW3kjOQTXj
         B0gHDOk18B6EZwPBTxpdZFIpLraEMYSTvszIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=shZPHsvOQormtinDO9b78KhUZdxB/4UyawV7i+/Evoc=;
        b=Yl62G9KvEhd11CPujcvSESPFcD7Wi+qyjQg9QHwLMSd/EZ2S4mSfUtiwISyeNXRveM
         B3rMfaPa2JtaA5Yqen+9KvELOAxjo9EuoFbI1AjMuzsP7GiF911YFgR8pflSRapxEf71
         TQAddR6NPxRoCSxDbxh2nQ+hS3zPJE9kNr73BaVJLqLSPo1r/TrPLIXpSr2wXt/QlhxX
         pkVCR90NF43TSCUiE+urHjljuaH6RxFwRBNgPeZtP2IjUnUppqjfn6kGMrw7+b0hyR6F
         cEDfcvREmC2+LITrrsqOYjWLvRg27KCAdbAJDXqvUQmeRNZA86Dko/ZfUI7Ks8VrcD77
         LQhQ==
X-Gm-Message-State: ALoCoQnBNISlBsuZb9C712ACkhL//oMy+o3CguRJuRAtsflhCnJoH8Rjkvfzh43+/qJIH944SHIMo6VPD6N3b5MyMqaKqoXtSA==
X-Received: by 10.194.93.102 with SMTP id ct6mr102733058wjb.157.1452181832338;
        Thu, 07 Jan 2016 07:50:32 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id e198sm14267576wmd.0.2016.01.07.07.50.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 07:50:30 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	david@gibson.dropbear.id.au,
	alex.williamson@redhat.com
Cc: alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	christoffer.dall@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: [PATCH v3 4/8] device_tree: qemu_fdt_getprop converted to use the error API
Date: Thu,  7 Jan 2016 15:50:11 +0000
Message-Id: <1452181815-1948-5-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
References: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
X-TUID: rPC1UwFcyJSK

Current qemu_fdt_getprop exits if the property is not found. It is
sometimes needed to read an optional property, in which case we do
not wish to exit but simply returns a null value.

This patch converts qemu_fdt_getprop to accept an Error **, and existing
users are converted to pass &error_fatal. This preserves the existing
behaviour. Then to use the API with your optional semantic a null
parameter can be conveyed.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

v1 -> v2:
- add a doc comment in the header file

RFC -> v1:
- get rid of qemu_fdt_getprop_optional and implement Peter's suggestion
  that consists in using the error API

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 device_tree.c                | 11 ++++++-----
 include/sysemu/device_tree.h | 15 ++++++++++++++-
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index 8441e01..6ecc9da 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -321,18 +321,18 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
 }
 
 const void *qemu_fdt_getprop(void *fdt, const char *node_path,
-                             const char *property, int *lenp)
+                             const char *property, int *lenp, Error **errp)
 {
     int len;
     const void *r;
+
     if (!lenp) {
         lenp = &len;
     }
     r = fdt_getprop(fdt, findnode_nofail(fdt, node_path), property, lenp);
     if (!r) {
-        error_report("%s: Couldn't get %s/%s: %s", __func__,
-                     node_path, property, fdt_strerror(*lenp));
-        exit(1);
+        error_setg(errp, "%s: Couldn't get %s/%s: %s", __func__,
+                  node_path, property, fdt_strerror(*lenp));
     }
     return r;
 }
@@ -341,7 +341,8 @@ uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
                                const char *property)
 {
     int len;
-    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len);
+    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len,
+                                         &error_fatal);
     if (len != 4) {
         error_report("%s: %s/%s not 4 bytes long (not a cell?)",
                      __func__, node_path, property);
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 269cb1c..4d7cbb9 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -45,8 +45,21 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
 int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
                              const char *property,
                              const char *target_node_path);
+/**
+ * qemu_fdt_getprop: retrieve the value of a given property
+ * @fdt: pointer to the device tree blob
+ * @node_path: node path
+ * @property: name of the property to find
+ * @lenp: fdt error if any or length of the property on success
+ * @errp: handle to an error object
+ *
+ * returns a pointer to the property on success and NULL on failure
+ * in case errp is set to &error_fatal, the function auto-asserts
+ * on error (legacy behavior)
+ */
 const void *qemu_fdt_getprop(void *fdt, const char *node_path,
-                             const char *property, int *lenp);
+                             const char *property, int *lenp,
+                             Error **errp);
 uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
                                const char *property);
 uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
-- 
1.9.1
