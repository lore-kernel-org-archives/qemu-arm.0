Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2196190wrq;
        Thu, 7 Jun 2018 07:51:04 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKpmFqL7SGeaYC566PjaRgyARueAI4eZE2Ca0UxmxIvraCJu44uc41+ZASiXtl3FFFw/VNX
X-Received: by 2002:a0c:ba85:: with SMTP id x5-v6mr1925799qvf.112.1528383064532;
        Thu, 07 Jun 2018 07:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528383064; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2R0Zjx2MS55jEyf8mfJ8TiJLNcZ7KbaaPl/sRq9LcXadX1ogFiBn6SOCoEKzRQPuP
         UhMadYJXixqO1nsghDTaBLzSMBNt6Gtr+xwNWZ2c+5AZk++ICkhApz0vUV/AQGN6/UeU
         OvIh1owFQPAzD66VSV3SBZp6brwbDc1XJ6PbMrtIMjAwDjprjmMVkabPtAGRpC3i9O7h
         jh532q10CCHwEniZrjmHL/OcI7NnmiDKKSNoktlaB7UnqgmpdAOt+u93XfnRKWKBLuID
         Po3J8OJRdL2095mN572JPin0LUHvVh1dTqris7wwaA6eWm/B9OE+kEFxhxGLa/c4xG6V
         dE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=PFkg0TLgk1gyzNNfGViUVUX9xSwzd9Tgvb8msjV0AXs=;
        b=ZOdmoqYExg+cexcW81enRvNYHr1urpYYdxFUcwh34Hf8nlw736E+4IiLuYnvL5x+T3
         Ob3SXh80mNeWi9eQQgoUlH/C9lvW8CoQUizJRQc9WSEdtOBbBG5yYB7pr6WXUqpd54Qz
         7V7TCUiFAVlVP2zlei3qdMqZbQFbaCpc9sqcPsGchREnIghhI5ssyWVctEeBJ9ztRv9i
         iuZyGBYOV8Etsr56JuhDmohiTpIV1Sgj7pWiCUJv8f62TyPJ50SkfHRJCGdwsAtpTQfs
         jm4aoYCw6hRZW6eiZU+W1dfGMEUA/6TALUOdra6hdflbvApp0jIXLN8mFCzUWewLM+Sy
         IXMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CYfX8mVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f56-v6si529478qtk.355.2018.06.07.07.51.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 07:51:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CYfX8mVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQwFj-0003aC-UO
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 10:51:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwC6-0000zH-Or
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 10:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwC5-0008HN-MU
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 10:47:18 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwC2-0008Fs-Ku; Thu, 07 Jun 2018 10:47:14 -0400
Received: by mail-qt0-x242.google.com with SMTP id o9-v6so10088654qtp.3;
	Thu, 07 Jun 2018 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PFkg0TLgk1gyzNNfGViUVUX9xSwzd9Tgvb8msjV0AXs=;
	b=CYfX8mVEfIbLDRf46HfQz807HRJa7XwY3mMcm6mv2GMnRLKZxyesJQ0i+gwA+mKKu3
	DAU5+rbQ3CHQpKWAmH6nxTZN53tGGzH6y1QN3OO73hV9hlz3okIdlmerKrLXJeGSBFAO
	/orefDy3DA8z/yXxPZNycIb05sDa24q8fA6P1wtlJJX/gzrTecrCRLBcr/NMjCHNuKsk
	i7aUXu3iXHnu3WOANTHPL1if9Gpu2NKY4w78XlOmM3dtjJyiDpTVgs8Cq2nwiCuVy5h2
	vBhv6YPPRkp6EnSDUDu6KU+74f6cjP24f4MG/fU4sB2a1jq0ajP2qIMkUb2IeRS0j/Vo
	DJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=PFkg0TLgk1gyzNNfGViUVUX9xSwzd9Tgvb8msjV0AXs=;
	b=e3vYYRb41FpKUX5x9QH8x0/ciEFsPEyBgozth+BQRzW0C5yQdc/mGoQ72cw8MSNVcL
	kEUy3Rtt9EfhdD2o7x4CdVh6cdbog/yz8wXLRaVIbliAGW8rrUz8gMs32J5Cn1a9xWrE
	oak9JbxBn77oMg4HYTeqcYtV1vNJtgp7eWx6t0yuITvUZweVHYUE09iwbUzO+jnfnJjy
	PoNo6W6w6Fa2FRe+D07YQ6DjvPhgm8sg8qIqxNxmf+CA/EiEqAnvzhfLfizgFF8LZRV1
	FFGBIwnkvB2xLvktyvbVYGIA5o395CMezJdwRA60BlN7pbyEzb+GCvz5XLGnLorlh6qj
	oRzQ==
X-Gm-Message-State: APt69E0rPDyEK+xNE65lWYu0YofCg4MVhHhr34vT4c45hD0Eytoic2hC
	RkZ/V/t2z80LeVS8mk0vE70=
X-Received: by 2002:ac8:2a07:: with SMTP id
	k7-v6mr1376404qtk.300.1528382834120; 
	Thu, 07 Jun 2018 07:47:14 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s128-v6sm11607363qkh.2.2018.06.07.07.47.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 07:47:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>
Date: Thu,  7 Jun 2018 11:46:44 -0300
Message-Id: <20180607144645.10187-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180607144645.10187-1-f4bug@amsat.org>
References: <20180607144645.10187-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v2 3/4] hw/arm/sysbus-fdt: Replace
 error_setg(&error_fatal) by error_report() + exit()
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +zLlFkZkQXDM

Use error_report() + exit() instead of error_setg(&error_fatal),
as suggested by the "qapi/error.h" documentation:

   Please don't error_setg(&error_fatal, ...), use error_report() and
   exit(), because that's more obvious.

This fixes CID 1352173:
    "Passing null pointer dt_name to qemu_fdt_node_path, which dereferences it."

And this also fixes:

    hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable 'node_path') results in a null pointer dereference
        if (node_path[1]) {
            ^~~~~~~~~~~~

Fixes: Coverity CID 1352173 (Dereference after null check)
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/sysbus-fdt.c | 42 +++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index e4c492ea44..8e2784fa11 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -91,7 +91,7 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
         r = qemu_fdt_getprop(host_fdt, node_path,
                              props[i].name,
                              &prop_len,
-                             props[i].optional ? &err : &error_fatal);
+                             &err);
         if (r) {
             qemu_fdt_setprop(guest_fdt, nodename,
                              props[i].name, r, prop_len);
@@ -102,6 +102,7 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
             } else {
                 error_free(err);
             }
+            assert(props[i].optional); /* mandatory property not found */
         }
     }
 }
@@ -137,9 +138,9 @@ static void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
 
     node_offset = fdt_node_offset_by_phandle(host_fdt, host_phandle);
     if (node_offset <= 0) {
-        error_setg(&error_fatal,
-                   "not able to locate clock handle %d in host device tree",
-                   host_phandle);
+        error_report("not able to locate clock handle %d in host device tree",
+                     host_phandle);
+        exit(1);
     }
     node_path = g_malloc(path_len);
     while ((ret = fdt_get_path(host_fdt, node_offset, node_path, path_len))
@@ -148,16 +149,16 @@ static void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
         node_path = g_realloc(node_path, path_len);
     }
     if (ret < 0) {
-        error_setg(&error_fatal,
-                   "not able to retrieve node path for clock handle %d",
-                   host_phandle);
+        error_report("not able to retrieve node path for clock handle %d",
+                     host_phandle);
+        exit(1);
     }
 
     r = qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_len,
                          &error_fatal);
     if (strcmp(r, "fixed-clock")) {
-        error_setg(&error_fatal,
-                   "clock handle %d is not a fixed clock", host_phandle);
+        error_report("clock handle %d is not a fixed clock", host_phandle);
+        exit(1);
     }
 
     nodename = strrchr(node_path, '/');
@@ -300,34 +301,37 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
 
     dt_name = sysfs_to_dt_name(vbasedev->name);
     if (!dt_name) {
-        error_setg(&error_fatal, "%s incorrect sysfs device name %s",
-                    __func__, vbasedev->name);
+        error_report("%s incorrect sysfs device name %s",
+                     __func__, vbasedev->name);
+        exit(1);
     }
     node_path = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
                                    &error_fatal);
     if (!node_path || !node_path[0]) {
-        error_setg(&error_fatal, "%s unable to retrieve node path for %s/%s",
-                   __func__, dt_name, vdev->compat);
+        error_report("%s unable to retrieve node path for %s/%s",
+                     __func__, dt_name, vdev->compat);
+        exit(1);
     }
 
     if (node_path[1]) {
-        error_setg(&error_fatal, "%s more than one node matching %s/%s!",
-                   __func__, dt_name, vdev->compat);
+        error_report("%s more than one node matching %s/%s!",
+                     __func__, dt_name, vdev->compat);
+        exit(1);
     }
 
     g_free(dt_name);
 
     if (vbasedev->num_regions != 5) {
-        error_setg(&error_fatal, "%s Does the host dt node combine XGBE/PHY?",
-                   __func__);
+        error_report("%s Does the host dt node combine XGBE/PHY?", __func__);
+        exit(1);
     }
 
     /* generate nodes for DMA_CLK and PTP_CLK */
     r = qemu_fdt_getprop(host_fdt, node_path[0], "clocks",
                          &prop_len, &error_fatal);
     if (prop_len != 8) {
-        error_setg(&error_fatal, "%s clocks property should contain 2 handles",
-                   __func__);
+        error_report("%s clocks property should contain 2 handles", __func__);
+        exit(1);
     }
     host_clock_phandles = (uint32_t *)r;
     guest_clock_phandles[0] = qemu_fdt_alloc_phandle(guest_fdt);
-- 
2.17.1

