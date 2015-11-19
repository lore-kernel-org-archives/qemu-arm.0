Received: by 10.182.158.201 with SMTP id ww9csp2020891obb;
        Thu, 19 Nov 2015 07:23:09 -0800 (PST)
X-Received: by 10.31.56.200 with SMTP id f191mr5546354vka.38.1447946589964;
        Thu, 19 Nov 2015 07:23:09 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id p140si4462206vkd.170.2015.11.19.07.23.09
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 19 Nov 2015 07:23:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:42399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzR3F-0004RH-FZ
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 10:23:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2R-0003J4-Fr
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2P-0000hh-TN
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:19 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:38565)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2P-0000hY-N9
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:17 -0500
Received: by wmec201 with SMTP id c201so122527910wme.1
	for <qemu-devel@nongnu.org>; Thu, 19 Nov 2015 07:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hpTeZ1nLwus4mFC+VMfCT0FchFktG0QuPXzWyhLBgRQ=;
	b=Fhm08TrTTiOXfRWzklmySlx/qp1v4Y2M94/AXlKUM+g1/KGOHVbdRzmxCDKZALWBXn
	NHLi7uUY4NmsgTBGSy0uUSpM4j6GxZcaN8CFzCNc0AxmvcvWBdW4g1z597vmPoLFV9Vr
	0cHHuFgNR5Xg+fbfveGOYXjCCB/ylH/BBb8hBQK9OhRclHciSVwyA3RqWGyqOWz7dkMf
	FT3K6LGwJ+BPzZWhiVgyw+PTWzAn5VZurPDnikmh/22jMVrM4oASSS55/xHUydsPZxZp
	MJgDCrDw906CKn2K3idle02IEq+yEiMzNGclXWcmjV1vKVEbuJlFjmUQsgTsB+luyzCu
	5u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hpTeZ1nLwus4mFC+VMfCT0FchFktG0QuPXzWyhLBgRQ=;
	b=Jxl5/gbgHOwAUwfaw8fA1WjF3Rxysl/ZIsSFpaZxtYbAunCQCwVzkZsJv5M5v5e1pZ
	x5RHrDqwcI8CwNmNRFtgIpNcpvXG4fy2STZZCymajdiiJ5ftohHU7xKWOrqjRm7xOqG4
	z4YnedKllh7Nmi/8hsJR9tH/cgKEVAaNXNv34Yp4ZD8q6TZy4/7vRJ6m/g9Xjm4Zx1BW
	jZTZXqTjyqZaOywUwWq5e8SmGyqPk2N0+dSb6rBfQOMPTrrxcTp2FAkEHhOLRROTbWqK
	X9YwLq50raWgNdx0SRMjqQ9dTHh37CcjM6O0xqds1wDpfDEmxM8kBfWchnoFUdwvO6TS
	lHvA==
X-Gm-Message-State: ALoCoQk3MBJvXnP1XWoQUamsZEplIeQ0kSngX09ACgmO4XY2AKc4WluYABluUauIceNYvieep+u/
X-Received: by 10.28.23.83 with SMTP id 80mr1044061wmx.78.1447946537121;
	Thu, 19 Nov 2015 07:22:17 -0800 (PST)
Received: from midway01-04-00.lavalab ([81.128.185.50])
	by smtp.gmail.com with ESMTPSA id
	vr10sm8367221wjc.38.2015.11.19.07.22.16
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 07:22:16 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org
Date: Thu, 19 Nov 2015 15:22:04 +0000
Message-Id: <1447946528-1533-3-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::232
Cc: thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
	patches@linaro.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: [Qemu-devel] [RESEND RFC 2/6] device_tree: introduce
	load_device_tree_from_sysfs
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
X-TUID: L5bZ65ZSn9jH

This function returns the host device tree blob from sysfs
(/sys/firmware/devicetree/base).

This has a runtime dependency on the dtc binary. This functionality
is useful for platform device passthrough where the host device tree
needs to be parsed to feed information into the guest device tree.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 device_tree.c                | 40 ++++++++++++++++++++++++++++++++++++++++
 include/sysemu/device_tree.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index a9f5f8e..58a5329 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -117,6 +117,46 @@ fail:
     return NULL;
 }
 
+/**
+ * load_device_tree_from_sysfs
+ *
+ * extract the dt blob from host sysfs
+ * this has a runtime dependency on the dtc binary
+ */
+void *load_device_tree_from_sysfs(void)
+{
+    char cmd[] = "dtc -I fs -O dtb /sys/firmware/devicetree/base";
+    FILE *pipe;
+    void *fdt;
+    int ret, actual_dt_size;
+
+    pipe = popen(cmd, "r");
+    if (!pipe) {
+        error_report("%s: Error when executing dtc", __func__);
+        return NULL;
+    }
+    fdt = g_malloc0(FDT_MAX_SIZE);
+    actual_dt_size = fread(fdt, 1, FDT_MAX_SIZE, pipe);
+    pclose(pipe);
+
+    if (actual_dt_size == 0) {
+        error_report("%s: could not copy host device tree in memory: %m",
+                     __func__);
+        goto fail;
+    }
+    ret = fdt_check_header(fdt);
+    if (ret) {
+        error_report("%s: Host dt file loaded into memory is invalid: %s",
+                     __func__, fdt_strerror(ret));
+        goto fail;
+    }
+    return fdt;
+
+fail:
+    g_free(fdt);
+    return NULL;
+}
+
 static int findnode_nofail(void *fdt, const char *node_path)
 {
     int offset;
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 359e143..307e53d 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -16,6 +16,7 @@
 
 void *create_device_tree(int *sizep);
 void *load_device_tree(const char *filename_path, int *sizep);
+void *load_device_tree_from_sysfs(void);
 
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size);
-- 
1.8.3.2

