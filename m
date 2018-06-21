Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1882290wrq;
        Thu, 21 Jun 2018 04:40:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJoiTWNQx7b88SlZ5z+afEoLibhHnDzSccG97K51WCP/vNPKMr7nFLmUQDW+eGCy2h26ctz
X-Received: by 2002:aed:21a9:: with SMTP id l38-v6mr22665804qtc.87.1529581251219;
        Thu, 21 Jun 2018 04:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529581251; cv=none;
        d=google.com; s=arc-20160816;
        b=EcPkchvFGDb0R/OEbPu6Mn+2mei130IrJs/4pkJ2wO5q1kitHbDfJ18zu8EG/mPKie
         Ja7O+9QO5Fmx6GCr4NMnrhDVp/dmuN74LC1UQbK/lsGkeRz+3pyZ+QEx/8Mi7mNyyU5L
         RWO+ntkYjgC5w7zBFN7JEiya6FHkPFgz32ltStIiAX6vllCg0+wDgbsCgkK1d87HetQn
         ZFQcvmGwgA9418hQqdie1Kdf7erAGO9egQbkV1xP6NJeP+XPOIRFkI12VunR9yL1m+nS
         motZ3E1/Bncz06H/dhclPOw5TpGK/SlqrMb89APGob0YsI40RY8syFcUtqE6AIH36h+T
         MlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=9xbGZU664IWw07LPfqy0VDg31c0I7uUxClHcwzVk6Kk=;
        b=0QtFbUvVHTRlsKItAbD5EBU1KhyZb2/Kl2A5FKE4pFeSFypa/3aN834rcdPCFpZao/
         KrDCDK570TP62AbXI54qBU/3/u5ihm/ZV0jpkuL5fLryWZTQzPBDRDUNV3Zs9EC9SFz5
         1FOklVYrog00FR43gv3IZ5eHyipo8Hzlcu5jps2a6SZOvdCUJ1FcviR+3edbTG9RuAUG
         Pp9/eegHDIlU+KmD1UNbUrxbPsX81NbV7EPV6vFkXxJ7S9kTI1Hr4wD2kCVnxiPOA38D
         hy2Ox6M9JG+rbAf9IbzkOUEPub9e67EaJPUZaWtLxPDV/cigO8gpNEmrSgLzFnP1+YuM
         0KgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DyS23ZVl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20-v6si4273219qtp.358.2018.06.21.04.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 04:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DyS23ZVl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVxxK-0008Nm-HO
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 07:40:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fVxx5-0008Lu-4E
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 07:40:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fVxx1-0004If-V0
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 07:40:35 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:46504)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fVxwy-0004HU-O4; Thu, 21 Jun 2018 07:40:28 -0400
Received: by mail-qt0-x235.google.com with SMTP id h5-v6so2456891qtm.13;
	Thu, 21 Jun 2018 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9xbGZU664IWw07LPfqy0VDg31c0I7uUxClHcwzVk6Kk=;
	b=DyS23ZVl1/Axn0ORQ0H8FUJWHjlM0uhs/1aiwf+TpvwT/7peyD+IH9we37mMIOjDIC
	DylH8hlmfJSdzeCasRVMwahIT2gESnJkZBr1uELIsz9th3yLLGwbvPv9oUVs40DisNNC
	HQq0TZ/aGXJV460TrUy6jxSHFsD9ExJxgVq+nuo9Hz2QNxQpK0Su9AoAmDB+NV+nPyXR
	hlGx4ZxgQcO/z3G18iZ8mCmF1wnJf4GU+EvrWhDrgpY2r1RnXee0YZAq0U0MJTcjEmRs
	ZmvN2CdFaSQSqNAxHNL8+vrloGMGHApTBJWmEUv9HPlN8ui3ez0AdcfESTOZWcMH5f/+
	xoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=9xbGZU664IWw07LPfqy0VDg31c0I7uUxClHcwzVk6Kk=;
	b=PjYJ40Gk8WvY0CMyZ7I4XT3Crl1JGyGbyZn8ZL0hiUU/HabX5ZxbZk0PobIGVQbxOR
	xwbCKBwBeTef3f343WlW1rM3sD0sAchCgsE7VpdQ6uK6rswmNoPceBPlyE5zNHnYxYvr
	MFhWlE8tVvYqC7dCcnHkgTRlhfELgdUUBH9EVM5J6g6Z0108aRwDchCdSDdA9cBBHsuR
	RXCQtKCBfxX60SqiLuNOMDmqdyOmrC1oUv/JnYkIe5dPjhSAUciEkdXXHrUPTefgTCZr
	UJA9dfH92zQbzlR44KKsHSJCOIonMUH5E1wffNcAo0EL6hNhMWaroIa9bEoklsJy6hPQ
	rZfg==
X-Gm-Message-State: APt69E14W7awN5HWON57BUSmvrWuLHytJ0OEjXvXPfULVWW2E3lm+H4N
	4522/NN6sj+B+bv+141GQX0=
X-Received: by 2002:aed:359d:: with SMTP id
	c29-v6mr21907185qte.240.1529581228165; 
	Thu, 21 Jun 2018 04:40:28 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o25-v6sm2690685qtp.72.2018.06.21.04.40.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 04:40:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>
Date: Thu, 21 Jun 2018 08:40:14 -0300
Message-Id: <20180621114015.9207-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621114015.9207-1-f4bug@amsat.org>
References: <20180621114015.9207-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: [Qemu-arm] [PATCH v3 2/3] hw/arm/sysbus-fdt: Replace
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uWhoVPwwYXk2

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
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/sysbus-fdt.c | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 277ed872e7..63b74a353e 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -92,7 +92,7 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
         r = qemu_fdt_getprop(host_fdt, node_path,
                              props[i].name,
                              &prop_len,
-                             props[i].optional ? &err : &error_fatal);
+                             &err);
         if (r) {
             qemu_fdt_setprop(guest_fdt, nodename,
                              props[i].name, r, prop_len);
@@ -103,6 +103,10 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
             } else {
                 error_free(err);
             }
+            if (!props[i].optional) {
+                /* mandatory property not found: bail out */
+                exit(1);
+            }
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
2.18.0.rc2

