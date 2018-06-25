Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4031058wrq;
        Mon, 25 Jun 2018 09:58:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf+Il2wUUp4KOZn2+dMfFqQvjCFDl9KZu0eyeky1VY8puC4m9uG0HI9xXTCTqcW707dCfXh
X-Received: by 2002:ac8:509:: with SMTP id u9-v6mr11445225qtg.97.1529945936260;
        Mon, 25 Jun 2018 09:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529945936; cv=none;
        d=google.com; s=arc-20160816;
        b=gYtjTwwk1tAZjKMQHE+qCi0sBdpNVTA0m3r9VRp94PD44+veh9CPvczxcfOaoTN7pt
         zztBo9g6u6hTC5z+pfL2yPEXTYEt2k42J4VXOvpgqi3TIRcGnDEmndOSSY1EzJeiH9Iv
         nXQZvvsyx5zwCZKi3AMo+ZuILJwXq0UsJQC5lRidU5XLcQOQ2P6qLPMKBu0Z2h/kI7d5
         fgG/37QmH40cDgCrjLh8tk1Vnf7foQUKDdsojC9yXXtF/40x1vFwcU0ap5+kTgwkZKZh
         HI1NGsvzR5ssNHKoROec961dIYBOcRejEdR7okrT2gDo5L8zpNzVM81ZfoYOKR4ixCQH
         leTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=QeiPeokwUFZUcy7BROEsIlLnHLSoIbcdBHGtjnvFluU=;
        b=AFuSM8eZZ+bwON6vIcvNqnlL7rkcCqVcxRgzbogJUOzaIBKT84m9C5EsFWkCyma2iu
         7ay4C58FYtLZtqblCvU5l0m4qvsG1/ElEPaQQUWbFU54kFyso7jNkUu6nhOh5Dfok8i2
         Tk1zTfnKMCyHAKjT1i8lH9OKWVueG2kXxv1Rjrp0sNzE9n4TPjJlxK1RlNDxXHo3MAp0
         Q08bvqf7wzYdlHaoUmDSkxVwVarFEq8BwYfS0LdVRm7qqGCD53NSdG8HXV2NvkeIbxKT
         6miTptQulm6p2Tt/Lz6pfPXH7T6cDlf91a1U29jiipNGUQapzU2yU+ETXrsVQfWsdojR
         DCDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vJ0uuW1w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3-v6si469003qve.248.2018.06.25.09.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 09:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vJ0uuW1w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXUpL-0000Ib-DW
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 12:58:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXUoX-000067-U0
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 12:58:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXUoW-00070r-S8
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 12:58:06 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:39736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXUoW-000704-Le; Mon, 25 Jun 2018 12:58:04 -0400
Received: by mail-qt0-x241.google.com with SMTP id c23-v6so3650516qtn.6;
	Mon, 25 Jun 2018 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QeiPeokwUFZUcy7BROEsIlLnHLSoIbcdBHGtjnvFluU=;
	b=vJ0uuW1wddgq6lL90MWiaPmHG0Y5h4KEdc2RVncEazhSt0ydWNLrYBZdN6KSojKAeJ
	XlcGpeuL+XbeeD9X4PHAvcTDmtnQkPe2/Af+OwEI5nhTvUHHgrJicL51t57dG1eFtdGM
	6HFGvHDcLtJVexfSA8yqb2tKWTSN1IliXrPWh6PqDEszeS931pUzhlxGowYr0mjrbKfu
	uHAnH9kz0+9GHep+Gmue+nGoyoCtMMnxR4b7BjyzFfDWtu2aOlA9yOb7uSriXVkI9ZCC
	h0AGQNVJ72/B4v+qZ6GpCIjKmvKoTi6GAXXJ3vPII6brk16JwnHbLvQTz9JIeBGLgeOP
	Ercg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QeiPeokwUFZUcy7BROEsIlLnHLSoIbcdBHGtjnvFluU=;
	b=Qeq2nTDUqVbEB0YZidePxsAVUyEIxmO9VoxaajonmWLzDxKTIu5/imh7+xcsJruUfZ
	HAtyr484y7HPT2sm1vaXR/emTEnJhjbP5Bo+DHjwbSA0BcHtIVErd7D1kSvBtF7cqvUh
	loXaH41GqzxnovKGbgsm6mFgTow7tuwiVkgkJqt+AzOHK7FJP8CrI8SUhXA/7qfJu9nn
	ZNsK8VpT3vy+mou8DEdkhpqdfPWh9nAo3uA82zoRVtmYtLnCerZ+R/r7KgrvIZZVrKTg
	mnj9sLU/gjahx3C6pHEs/BJ9YA6iP4Reby76Q4DFknlPz5hyeYtItJIJB+Pw1v1HKmGX
	SDQw==
X-Gm-Message-State: APt69E0MywynOAWu+le+5y8jtI+h9/I5QdHsVxy7XC+Xtbm9InpGaWTl
	cOwNG1aprQoYR/qrFZ7ccuY=
X-Received: by 2002:a0c:ada5:: with SMTP id
	w34-v6mr11906299qvc.58.1529945883724; 
	Mon, 25 Jun 2018 09:58:03 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	k129-v6sm9856727qkd.13.2018.06.25.09.58.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 09:58:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Auger Eric <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 13:57:48 -0300
Message-Id: <20180625165749.3910-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625165749.3910-1-f4bug@amsat.org>
References: <20180625165749.3910-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v4 2/3] hw/arm/sysbus-fdt: Replace
 error_setg(&error_fatal) by error_report() + exit()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:ARM" <qemu-arm@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DcUKbAj6q+hM

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
Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3:  display error if property required and returned -FDT_ERR_NOTFOUND

 hw/arm/sysbus-fdt.c | 53 +++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 277ed872e7..0d4c75702c 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -92,16 +92,20 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
         r = qemu_fdt_getprop(host_fdt, node_path,
                              props[i].name,
                              &prop_len,
-                             props[i].optional ? &err : &error_fatal);
+                             &err);
         if (r) {
             qemu_fdt_setprop(guest_fdt, nodename,
                              props[i].name, r, prop_len);
         } else {
-            if (prop_len != -FDT_ERR_NOTFOUND) {
-                /* optional property not returned although property exists */
-                error_report_err(err);
-            } else {
+            if (props[i].optional && prop_len == -FDT_ERR_NOTFOUND) {
+                /* optional property does not exist */
                 error_free(err);
+            } else {
+                error_report_err(err);
+            }
+            if (!props[i].optional) {
+                /* mandatory property not found: bail out */
+                exit(1);
             }
         }
     }
@@ -138,9 +142,9 @@ static void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
 
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
@@ -149,16 +153,16 @@ static void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
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
@@ -301,34 +305,37 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
 
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
2.18.0

