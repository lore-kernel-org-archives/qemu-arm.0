Received: by 10.182.158.201 with SMTP id ww9csp2021929obb;
        Thu, 19 Nov 2015 07:24:47 -0800 (PST)
X-Received: by 10.129.29.5 with SMTP id d5mr7066783ywd.278.1447946687679;
        Thu, 19 Nov 2015 07:24:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w10si6174165ywd.58.2015.11.19.07.24.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Nov 2015 07:24:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:42422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzR4p-0007cy-6k
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 10:24:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2T-0003Kf-8P
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2S-0000j7-Ev
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:21 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:35096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2S-0000iw-8h
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:20 -0500
Received: by wmdw130 with SMTP id w130so244789536wmd.0
	for <qemu-devel@nongnu.org>; Thu, 19 Nov 2015 07:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+a67LYZcOkfQOn9nOrqRstA5dW1nBhu4IQU1Pq53ELw=;
	b=lEJIU0UcPszcZ+nSHIK6KvhBYfGzUWEv+cwxeEKA2vtwbwZWWABGEA5ryZZPH9PTaQ
	zN2VETXvDXN9EiWdT9FgAiiUJGuxkmCpCd2dBk+0O/ce7rnABGSKHOOazCYPS7bl3JbY
	vWdD1hEBUBZJaJbvw7nk4BwSluHn12LqrW+85EI7oCnMN+YkHS8ygEiyyswRi7RIUCdR
	2hzNOAU2GIFIoVDLqdVuTOKwlfkaHD57ubgQjcZUlogaj44eFvvzqPs7VxpZtuT2jDeb
	sVmbCV5gppSz8TFV8fVLrdFhy4nDE/0vcAlA5h7BUMh37LsaoaNZpr4ViXKc8HI6bQnW
	8D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+a67LYZcOkfQOn9nOrqRstA5dW1nBhu4IQU1Pq53ELw=;
	b=ROaGKmX/I1JE6J6HhVS6XZz2AwYlLG2r1ZvEj0IROvXQyms+cVjhZqskU5hUSbieD+
	3x3Tb1Z81lHFLUio/5QqZ0gQu/M/pzZuX2+nfqZ1zXhCymsodpMAvMSFwj+yoIUTtciS
	XbJZRrgEZY/Y1M9yekQmftZ+V5DTF+8ax/wIafrrVNWnMbMbh12wAAKMHXgqgEO9QKNF
	AAE3F4r6DhdtCSw8DY7KzU9s3Zcvxgk1drYZbjpFwD8Lc/bQ8yPiDWat+nsunlBBv3Dm
	G1rX43f5rgxVGBDgjL3ZpRRS3lejxQux0Y0iFN3ChF8pMbQW2dvxvhviZ7DSD10D2nch
	5hgg==
X-Gm-Message-State: ALoCoQlo9ZR5NKygYoK4sR2Iy/CrlvAqGnU7Jrigbaw7SoX9kic6eJuK+nhtTPUAmJJ33YLOggrl
X-Received: by 10.28.184.134 with SMTP id i128mr11909509wmf.12.1447946539743; 
	Thu, 19 Nov 2015 07:22:19 -0800 (PST)
Received: from midway01-04-00.lavalab ([81.128.185.50])
	by smtp.gmail.com with ESMTPSA id
	vr10sm8367221wjc.38.2015.11.19.07.22.18
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 07:22:18 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org
Date: Thu, 19 Nov 2015 15:22:06 +0000
Message-Id: <1447946528-1533-5-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::235
Cc: thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
	patches@linaro.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: [Qemu-devel] [RESEND RFC 4/6] device_tree: introduce
	qemu_fdt_getprop_optional
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
X-TUID: rtAqVRgOE7kT

Current qemu_fdt_getprop exits if the property is not found. It is
sometimes needed to read an optional property, in which case we do
not wish to exit but simply returns a null value.

This is what this new qemu_fdt_getprop_optional function does.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 device_tree.c                | 17 +++++++++++++++++
 include/sysemu/device_tree.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index f184e3c..a318683 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -280,6 +280,23 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
     return r;
 }
 
+const void *qemu_fdt_getprop_optional(void *fdt, const char *node_path,
+                             const char *property, bool optional, int *lenp)
+{
+    int len;
+    const void *r;
+    if (!lenp) {
+        lenp = &len;
+    }
+    r = fdt_getprop(fdt, findnode_nofail(fdt, node_path), property, lenp);
+    if (!r && !optional) {
+        error_report("%s: Couldn't get %s/%s: %s", __func__,
+                     node_path, property, fdt_strerror(*lenp));
+        exit(1);
+    }
+    return r;
+}
+
 uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
                                const char *property)
 {
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index f9e6e6e..10cbe8e 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -34,6 +34,8 @@ int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
                              const char *target_node_path);
 const void *qemu_fdt_getprop(void *fdt, const char *node_path,
                              const char *property, int *lenp);
+const void *qemu_fdt_getprop_optional(void *fdt, const char *node_path,
+                             const char *property, bool optional, int *lenp);
 uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
                                const char *property);
 uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
-- 
1.8.3.2

