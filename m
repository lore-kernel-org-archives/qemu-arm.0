Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp369101ejc;
        Sat, 9 Mar 2024 11:27:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU86BPK0k8zbSfMXDqaocWz4ytoXQt+PtmgRvwQhlXQFaa7LczR4wxwZFWQFf5qHkfxnPq3Q1h6DKk68j+jagsKufwjtFmo
X-Google-Smtp-Source: AGHT+IGggoJR7wxx4gAM+dNL2WQNdL3PljrgHHNreAW/kdelwSJ1v3bKZbflNP/fTF9cxbAl94QC
X-Received: by 2002:a05:620a:4506:b0:788:596c:e67f with SMTP id t6-20020a05620a450600b00788596ce67fmr5337068qkp.20.1710012438555;
        Sat, 09 Mar 2024 11:27:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012438; cv=none;
        d=google.com; s=arc-20160816;
        b=OLbN4/efW1QjW7NVWJyj9kkXStCgEyktYPbSTOrdpcWxeRgDPHqt8mC9afXmfvI5PS
         ojnKRcfoN/F9YPeXmZJmnSvhWGV8gBWTKzQJrknvpaXGFR9sJFVGtrPAM1uUiqANfa7T
         QWGGFtRal8iKI0b2mFOEGSRW/mBrob3SDNYoO5gLV8ph/4bRuoc5u2zu9iRaM/NxHDbP
         jtETc8MPu8qFominnrqGRr4FgMLdNYwAJVf/U6q0nC6Lu64Egi7AaMbzWYTvh0Hg5P8j
         w2zICDgcwIonJRZJKSVKz7P2m21eYuPsnGT9wdmqazbcF8qvZPrumEwFiNIkh/Xwly2C
         xUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y5wggQ6ZmpYal9W3iEFAyHN5UYyn6LPkIJHsTwN5wMc=;
        fh=H5We735HM7ixm4oy9fY2JEKyejOR7OsciZcDaqKVioM=;
        b=yvk82SQWGyu2Gs3jXXcKtStcSagbIGjbvwn7fDD5O9upaooSKW7Cg+RB7f4VepqkUt
         KzVbjwrAwSajZQ3ixmnvLufoOR8WBZpFXH2kZAj5zWsIHgn5F3yeYbrME55QZoVBjhn7
         jMtLayC7IY19rKSgfnyY+gWdtS7xANME1oiUSHnBqe+/wayHkUahNXbdXkXD9GLWRuKv
         B7DU63B+S+JWWP9SuUOUqcGxmPlkepb40ftBXuNoZlX6+WX+4kbc/OsTnOHPj5Uh8Ncm
         Kx0hce1xMvWobHENaAISciSq4cnffwwb/ZL06StktVSkAc/l9BIX9ZZJfyEUB2kshyVg
         objQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gzHWvyZY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20-20020a05620a0c9400b0078825f3c45fsi2121121qki.137.2024.03.09.11.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gzHWvyZY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rj2LP-0008BN-GF; Sat, 09 Mar 2024 14:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2K0-0007DV-Nc
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:25:36 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Jw-0003K8-Iw
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:25:27 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a452877ddcaso369179666b.3
 for <qemu-devel@nongnu.org>; Sat, 09 Mar 2024 11:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012321; x=1710617121; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y5wggQ6ZmpYal9W3iEFAyHN5UYyn6LPkIJHsTwN5wMc=;
 b=gzHWvyZYMBxYglvhK6bLYIG+VIsGll18hNTto7mG+tkI1rOST7EtfjvtibDSNo1DXj
 xexX6ajenpfc7kbdX/iKHoyiXNkxGFGsinkP5FgVGzIQQl5xSIrxtcTW5JaTttXmHy8K
 8xMC9oBD9OX5mlcSgmkI1dB6ezQDKVmlCNiQzmRsxlbu8tmkAMOSS6hUcOOgpw/s02ur
 ITES9owP4sELrsUNFdSHdzAoTbDbPNxA6aBc2Xnh0OxIFmbqIHrzKJPBkDjblkXsKY42
 RdiDMEJC/XbnqZ9MreurytdMZKusSQ/JySPlVamwUdkya1CvsGkwcuU/t0su6fsLdtJl
 Q4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012321; x=1710617121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y5wggQ6ZmpYal9W3iEFAyHN5UYyn6LPkIJHsTwN5wMc=;
 b=PheqnlMWosxOdf+ieELs0iBZGhwpzBvSv6fl20/WPE5srwt8YQuLsipgkpfypHQ1SB
 FTDEcSD/pcpZaQ+F9n57hxn2aUGlNY12t28pWfACZnxMkhyIld3rqerYiZ3tChZvq+M9
 2YDVTy4sXnjSTWtrrk/39+yQYQSQPF3Ca0WXzFhGeFTXwwqHWRfmbn7HzMWwKC76V6fM
 m3RUytWLp85tXYyGWd2MS/WyzWBtOEkHa7lROp7rcVI79+AGQTZg9HxVO42/26dbOCK1
 rLf+EXi9oLAcufcjGLTObwmHoejWqEMytSMqkDTFr4OM2QB2HDze1rK3ZRjxVMmGdgbk
 mEoQ==
X-Gm-Message-State: AOJu0Yz80LXXyyn2bqKzgjLt2/DpX+Tbcj9WTbVLT/Ni2ydRFGnxsYav
 /h91dRf7JzBmvPAXgmQ1mUl36pOefixiBFFJZ+2Jg355ixSdiFkYoOLoL6cjUx1aBSogfPuWStN
 0
X-Received: by 2002:a17:906:f6d8:b0:a45:f89b:a916 with SMTP id
 jo24-20020a170906f6d800b00a45f89ba916mr1406551ejb.73.1710012321544; 
 Sat, 09 Mar 2024 11:25:21 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 qt28-20020a170906ecfc00b00a45bb14b1a5sm1171650ejb.89.2024.03.09.11.25.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:25:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 devel@lists.libvirt.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 31/43] hw/core/machine-smp: Deprecate unsupported "parameter=1"
 SMP configurations
Date: Sat,  9 Mar 2024 20:21:58 +0100
Message-ID: <20240309192213.23420-32-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IazdQeygyaTb

From: Zhao Liu <zhao1.liu@intel.com>

Currently, it was allowed for users to specify the unsupported
topology parameter as "1". For example, x86 PC machine doesn't
support drawer/book/cluster topology levels, but user could specify
"-smp drawers=1,books=1,clusters=1".

This is meaningless and confusing, so that the support for this kind of
configurations is marked deprecated since 9.0. And report warning
message for such case like:

qemu-system-x86_64: warning: Deprecated CPU topology (considered invalid):
                    Unsupported clusters parameter mustn't be specified as 1
qemu-system-x86_64: warning: Deprecated CPU topology (considered invalid):
                    Unsupported books parameter mustn't be specified as 1
qemu-system-x86_64: warning: Deprecated CPU topology (considered invalid):
                    Unsupported drawers parameter mustn't be specified as 1

Users have to ensure that all the topology members described with -smp
are supported by the target machine.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240308160148.3130837-3-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 14 +++++++++
 hw/core/machine-smp.c     | 65 +++++++++++++++++++++++++++++----------
 2 files changed, 62 insertions(+), 17 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 6e2f557682..dfd681cd02 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -57,6 +57,20 @@ The ``-p`` option pretends to control the host page size.  However,
 it is not possible to change the host page size, and using the
 option only causes failures.
 
+``-smp`` (Unsupported "parameter=1" SMP configurations) (since 9.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Specified CPU topology parameters must be supported by the machine.
+
+In the SMP configuration, users should provide the CPU topology parameters that
+are supported by the target machine.
+
+However, historically it was allowed for users to specify the unsupported
+topology parameter as "1", which is meaningless. So support for this kind of
+configurations (e.g. -smp drawers=1,books=1,clusters=1 for x86 PC machine) is
+marked deprecated since 9.0, users have to ensure that all the topology members
+described with -smp are supported by the target machine.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 96533886b1..50a5a40dbc 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -112,30 +112,61 @@ void machine_parse_smp_config(MachineState *ms,
 
     /*
      * If not supported by the machine, a topology parameter must be
-     * omitted or specified equal to 1.
+     * omitted.
      */
-    if (!mc->smp_props.dies_supported && dies > 1) {
-        error_setg(errp, "dies not supported by this machine's CPU topology");
-        return;
+    if (!mc->smp_props.clusters_supported && config->has_clusters) {
+        if (config->clusters > 1) {
+            error_setg(errp, "clusters not supported by this "
+                       "machine's CPU topology");
+            return;
+        } else {
+            /* Here clusters only equals 1 since we've checked zero case. */
+            warn_report("Deprecated CPU topology (considered invalid): "
+                        "Unsupported clusters parameter mustn't be "
+                        "specified as 1");
+        }
     }
-    if (!mc->smp_props.clusters_supported && clusters > 1) {
-        error_setg(errp, "clusters not supported by this machine's CPU topology");
-        return;
-    }
-
-    dies = dies > 0 ? dies : 1;
     clusters = clusters > 0 ? clusters : 1;
 
-    if (!mc->smp_props.books_supported && books > 1) {
-        error_setg(errp, "books not supported by this machine's CPU topology");
-        return;
+    if (!mc->smp_props.dies_supported && config->has_dies) {
+        if (config->dies > 1) {
+            error_setg(errp, "dies not supported by this "
+                       "machine's CPU topology");
+            return;
+        } else {
+            /* Here dies only equals 1 since we've checked zero case. */
+            warn_report("Deprecated CPU topology (considered invalid): "
+                        "Unsupported dies parameter mustn't be "
+                        "specified as 1");
+        }
+    }
+    dies = dies > 0 ? dies : 1;
+
+    if (!mc->smp_props.books_supported && config->has_books) {
+        if (config->books > 1) {
+            error_setg(errp, "books not supported by this "
+                       "machine's CPU topology");
+            return;
+        } else {
+            /* Here books only equals 1 since we've checked zero case. */
+            warn_report("Deprecated CPU topology (considered invalid): "
+                        "Unsupported books parameter mustn't be "
+                        "specified as 1");
+        }
     }
     books = books > 0 ? books : 1;
 
-    if (!mc->smp_props.drawers_supported && drawers > 1) {
-        error_setg(errp,
-                   "drawers not supported by this machine's CPU topology");
-        return;
+    if (!mc->smp_props.drawers_supported && config->has_drawers) {
+        if (config->drawers > 1) {
+            error_setg(errp, "drawers not supported by this "
+                       "machine's CPU topology");
+            return;
+        } else {
+            /* Here drawers only equals 1 since we've checked zero case. */
+            warn_report("Deprecated CPU topology (considered invalid): "
+                        "Unsupported drawers parameter mustn't be "
+                        "specified as 1");
+        }
     }
     drawers = drawers > 0 ? drawers : 1;
 
-- 
2.41.0

