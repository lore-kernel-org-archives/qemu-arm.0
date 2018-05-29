Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3835855wre;
        Tue, 29 May 2018 10:51:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKzurKJOioWO+tYkztrqBvCtI3Kw3MdHDL9v5AeJfJMHDi51LKliJvcgFm+JiSPsZxewSnN
X-Received: by 2002:ac8:3426:: with SMTP id u35-v6mr17366610qtb.288.1527616304632;
        Tue, 29 May 2018 10:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527616304; cv=none;
        d=google.com; s=arc-20160816;
        b=pdPW1oRPQgUbFFWVKS0avJxEPE8bo5W1w0qbPOcf2tdQWXuDQVL/i/M/Feji/wi2FY
         G0qHK+Umt/fwnO3RwJIW4+W8Jq4o1cNysXBtyswMqbIKwaRvcWwWeZItLrXAomW0akII
         ajTLGBveqTxWBbfT4Sxf8olHNXcz68ANoMYzOT6UBiXbHVl+wKdUdqTOgjkOndi22bB1
         G1Ex/T/H8yx/zLsBXi2nqMtTWGiB0G7dX3o2GRPwELk3JI2Fq3PKVF+gxsZetI+c7Ozf
         sUTbmyF7k1UP6Wqc8G3KW7+727onepU8o3sND+UpgGLkaRakhb+iszJ9VBk9EKVirZIV
         dccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=SjlAvDx0RUdVe69Yfg51ieJ0bfkH+XskY1wYVXORZd0=;
        b=iLP3aMHPdmmhtn5Q1nviX6dtaAgwmxoDYS+eApSX+WFEK0djDmwQPW6/z0mA1JD77H
         irE51lgAmrw5YPKkdnkmZb0uexX9UG3DBCv8rpnPOw8FLPc0LcR4SznqjgKESNEJkg51
         I++ckcZ9KQFtO47DLrmAmSvL55WJi0ciHRTJZnyAC/Ud1ikW7XOcAy/KmR5xT12r+jdP
         hY0SvZpubG3tYeohlJX4cPNphlyBsgxLZktb2EcGGxWD8SdqatT37jodXwjneP4mxtRu
         Q/gT8CfmVJ3dnzK/nlqllHRFOIFsJ5FCYs6tWbnHk3HYsAyYlGbPQSzHyR2s5N8t0igO
         Q2ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rZyx9OJm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7-v6si260658qkf.265.2018.05.29.10.51.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 10:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rZyx9OJm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNime-0006xn-2g
	for alex.bennee@linaro.org; Tue, 29 May 2018 13:51:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNijk-0004SM-Vb
	for qemu-arm@nongnu.org; Tue, 29 May 2018 13:48:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNijj-0005Ee-Mo
	for qemu-arm@nongnu.org; Tue, 29 May 2018 13:48:45 -0400
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:35365)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNijf-0005BS-U5; Tue, 29 May 2018 13:48:40 -0400
Received: by mail-qt0-x234.google.com with SMTP id j1-v6so19747899qtp.2;
	Tue, 29 May 2018 10:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SjlAvDx0RUdVe69Yfg51ieJ0bfkH+XskY1wYVXORZd0=;
	b=rZyx9OJm0uFQOfAjeNBt9sHOFkJzOyLSqUBSKpq2PDxPdi4/jIuGaQzSM+DKZmf0K4
	RaKQ471PDbtV01iGegJQvNJIgQgk4dqCaN3Z7WoTJK/2JT1ZpAd1/BobTOdyvwvJ9TPg
	7BTXamyIUU+itd40qT7l2VWHWqJ3QElrm0ivG/tsXUowjlVB+qmSB+wSyyCVGjBXrOGT
	H5dsr7P4m8InC0w9XvW6yW7XRJmWBzajn7SsNqVSpj9cGdrQZrlaXmqn06QeFbEIv/z3
	Jz33ya/x088ySWZLbRBIlDUWLtl84sik9t53OrBrA3DqPtgB4P+jM33lhD5K3H/EDvay
	T6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=SjlAvDx0RUdVe69Yfg51ieJ0bfkH+XskY1wYVXORZd0=;
	b=tsw1Zv9Xx9QxYvhbVj47s79DKuOeAsCxenxA8Z0ZYPmrlqI+9JT9CbC6mZb59fPa33
	Cda44AoHJI3MBZ+AiO+CnavD1NQUmmb8LW440SGTFWcQ2OyIKhoAOHTSRSS0Ra/VBvFW
	qusdJxaRjYGw5hV/a498opF3sYhlvjXpSwV19WukCeVrIzPkzWL4JgukG1/hLRVILOA/
	nmrtVT5pVPnowUgbuT5GqzG0WZZG3UPqzShPUs9JEg5uBEltYez3qVc9a5PBeLvn4SSH
	ai7ktkOHXIOuHidAOXS6SkzgDhsY6kTUJhRzOZS7wDvQNuFH6lGHiG01yzL/p/sunzh3
	wMXA==
X-Gm-Message-State: ALKqPweSLB49Hjow+MVKkhneULKV4XxB92Vkt/Y/kCymnWx3rCVlABX4
	PihCa/YktbC62iUQwim7wTj5i1P0Xyw=
X-Received: by 2002:ac8:7217:: with SMTP id
	a23-v6mr16590947qtp.243.1527616119319; 
	Tue, 29 May 2018 10:48:39 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	q8-v6sm25564308qtb.13.2018.05.29.10.48.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 10:48:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>
Date: Tue, 29 May 2018 14:48:20 -0300
Message-Id: <20180529174821.19964-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180529174821.19964-1-f4bug@amsat.org>
References: <20180529174821.19964-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: [Qemu-arm] [PATCH 3/4] hw/arm/sysbus-fdt: Replace
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
X-TUID: tCTQagly+0as

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
 hw/arm/sysbus-fdt.c | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index e4c492ea44..3af87fc184 100644
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
@@ -102,6 +102,10 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
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
@@ -137,9 +141,9 @@ static void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
 
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
@@ -148,16 +152,16 @@ static void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
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
@@ -300,34 +304,37 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
 
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
2.17.0

