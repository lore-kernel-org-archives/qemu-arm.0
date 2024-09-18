Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp979346njg;
        Wed, 18 Sep 2024 12:27:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzOpBRnLt6zNMgOCEJo/U6EisYPsjyaxa+/u3DqKM9xy5CLekuczFtm4l3t6xf+1EqSXPF2rLpK1DZAg==@linaro.org
X-Google-Smtp-Source: AGHT+IE/rrxcyT5GtAdRUXTYMrKCoeld9KgZAT0DHlGm/2QAh7FdZBOzeKi/c3yh7o6q/TWMbqef
X-Received: by 2002:a05:6102:1620:b0:492:a11f:a87a with SMTP id ada2fe7eead31-49d415a416emr25658553137.25.1726687623708;
        Wed, 18 Sep 2024 12:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687623; cv=none;
        d=google.com; s=arc-20240605;
        b=kUDqq1FozRqZCyk6QYqfOWBidrZ7jOQO49QGCLapRYrBRjydt62obm6OcP0soBeEA4
         sOE433wfdq20GJn607lJN7NCuVBWdGSwH673Zm6ZUpteMU0HbdbgMJua2HAfbxyFrpZn
         1S5Nrc62T541uXeuS2Ox37QySJoVjKm1h0eHQi331STm0AJR9NJtOJhPKL7nvNsXRTgO
         hIkyJ0FPqN3kqm6ZlCnY6ynpgoUSt869adMdg2ZLcivBtOizKeI4fuPx8txXlaBOYFGp
         EPLrI7TKQHc9gMUndMlux+mFAFkX1qDTBIfaH9aVcDT6eEdnw8+7rHxp8b/TAo/7Cc10
         rSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=qKA21Q/Mut9jISnah7mMJgm1CeAx6m6ER6bFWDsO26E=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=IOrIq/dkwUPmzkqr6QuTZJNefnRY1wBXLJAk9uiN9FLCRZkzTep8ZXYOuFfg3AjvvM
         HOtcrJ2Ai6nczLLPVB7S0hknjz3WS0yYbbLEla039axKRT8XOWKEPqlrWhjSHSS1Nenz
         DQ+po7EfQz6s2Q/7JNQgWfmgGgRX/tES1JLXgJgZHw6S3wMo7NX/bmWj6Jd/u4E980R7
         3Jij080+HIEsyALN/Agnsg/WTbYKdARiCcxJ6ROMJupznx279hSWwNzaOPQm4QZb7v7K
         XUde2NTtqrDFsXjzZLPKRoF2wFunUkWl5SunYgHjrukjco/L7vmEM9AQoQShCysD+L1Q
         EdRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=L40fSxKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e563e9esi1095386d6.297.2024.09.18.12.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=L40fSxKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0Gk-0004ac-9A; Wed, 18 Sep 2024 15:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3lyjrZgUKCNIHyJ6D4CC492.0CAE2AI-yFABCB4BI.CF4@flex--tavip.bounces.google.com>)
 id 1sr0GZ-0004UY-Cg
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:08 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3lyjrZgUKCNIHyJ6D4CC492.0CAE2AI-yFABCB4BI.CF4@flex--tavip.bounces.google.com>)
 id 1sr0GX-0007Iw-Go
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:07 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e1159fb161fso162796276.1
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687383; x=1727292183; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qKA21Q/Mut9jISnah7mMJgm1CeAx6m6ER6bFWDsO26E=;
 b=L40fSxKqLFSVLN0Jm5v81BwQTxb2uCGX4Nn8/mnmdqDfXxCB9WoW5xLlYWNW4pc48C
 kI9ddmB2fHQgePlFXxncEVjgXuvHLmAu6OCFsWwsRPL9bKJnFIpXv8lVgHGlerBmUWcl
 VjMvmgAjCgU/Jq1mkMqcwuzIUdi5kKxRudjqmO0c2iDMQnMncNHNJ9y85N5fsYPaW3QW
 XJocmf7BquQ/K09cvyqerSvmtYu2Qnk5B9xxP4jCjcP4I9DKKp2K/W+nMvVLb8abHxfl
 HXDcdVxl151UKSVxPDNFqAYcF2PkE2NrC71nHRw2LbzDQbXpmQgvWQZ5DE3AEKRive/p
 GFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687383; x=1727292183;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qKA21Q/Mut9jISnah7mMJgm1CeAx6m6ER6bFWDsO26E=;
 b=YapcN212QMft2A78LEMlEXUHYOGR7lQTeT/PuNsKwtLpak48d7KDR6Nydad2wdTbQa
 MfCkr4Z7qRj96vEPdnCuRhHCdflSIHzFROY0zwWWbYh/BGj14HlOM/MM7UONHbaoYOv7
 kkrV9ir6a9UsYIVYI83fxPQpHZ3lv6vLPUJlkS6IUTJwIra+oKIHKittDkMRxF6egtub
 i3rG4c9hXgesQpJ/H1llL5D0UyX4xXYVUPBtScPIARPjxGaDBp5NepU4pkBwu8GKd7QF
 xjSh6Y512Ka68mUaOwNwka/vC2xIVz2R3BbxZzKXJIS4A0tc+F/g1dj9mWB7XOL6dgAz
 7Snw==
X-Gm-Message-State: AOJu0YzAWteesLcPkIOVE7GcOoINyCB6+UOujbdezt5Ysw2ucQr5+r5o
 qgltzUJlqHhwkJOmPxpiq4fxzmvpHt8vd94djoXvs7w/z3RodQHrfv9iP6ipag7SA3MufS8sYA=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a5b:704:0:b0:e0e:4350:d7de with
 SMTP id
 3f1490d57ef6-e1d9dc3da43mr29038276.9.1726687383260; Wed, 18 Sep 2024 12:23:03
 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:32 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-5-tavip@google.com>
Subject: [PATCH 04/25] Add mcux-soc-svd subproject
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3lyjrZgUKCNIHyJ6D4CC492.0CAE2AI-yFABCB4BI.CF4@flex--tavip.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pBxZu1CfXzNE

Add mcux-soc-svd subproject that contains SVD files that are going to
be used to generate C header with register layout definitions and
other helpers to create device models.

Guard the subproject by a configuration option since it is rarely
going to be used - whenever new headers will be generated. It is
unlikely that already generated headers will be updated, with the
exception of minor hardware revisions.

Also export the rt595 SVD file which is going to be used by subsequent
patches.

TBD: switch to a qemu gitlab fork before merge

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/svd/meson.build                            | 4 ++++
 meson_options.txt                                 | 3 +++
 scripts/meson-buildoptions.sh                     | 4 ++++
 subprojects/.gitignore                            | 1 +
 subprojects/mcux-soc-svd.wrap                     | 5 +++++
 subprojects/packagefiles/mcux-soc-svd/meson.build | 5 +++++
 6 files changed, 22 insertions(+)
 create mode 100644 hw/arm/svd/meson.build
 create mode 100644 subprojects/mcux-soc-svd.wrap
 create mode 100644 subprojects/packagefiles/mcux-soc-svd/meson.build

diff --git a/hw/arm/svd/meson.build b/hw/arm/svd/meson.build
new file mode 100644
index 0000000000..7d83d2ccbc
--- /dev/null
+++ b/hw/arm/svd/meson.build
@@ -0,0 +1,4 @@
+if get_option('mcux-soc-svd')
+  mcux_soc_svd = subproject('mcux-soc-svd')
+  rt595 = mcux_soc_svd.get_variable('rt595')
+endif
diff --git a/meson_options.txt b/meson_options.txt
index 783b56bcb9..fb64db2d2a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -375,3 +375,6 @@ option('hexagon_idef_parser', type : 'boolean', value : true,
 
 option('x86_version', type : 'combo', choices : ['0', '1', '2', '3', '4'], value: '1',
        description: 'tweak required x86_64 architecture version beyond compiler default')
+
+option('mcux-soc-svd', type : 'boolean', value : false,
+       description: 'enable targets to generate C headers from mcux-soc-svd')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 107a8f69ce..0864952d80 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -41,6 +41,8 @@ meson_options_help() {
   printf "%s\n" '  --enable-lto             Use link time optimization'
   printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to use [system] (choices:'
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
+  printf "%s\n" '  --enable-mcux-soc-svd    enable targets to generate C headers from mcux-'
+  printf "%s\n" '                           soc-svd'
   printf "%s\n" '  --enable-module-upgrades try to load modules from alternate paths for'
   printf "%s\n" '                           upgrades'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
@@ -395,6 +397,8 @@ _meson_option_parse() {
     --enable-malloc-trim) printf "%s" -Dmalloc_trim=enabled ;;
     --disable-malloc-trim) printf "%s" -Dmalloc_trim=disabled ;;
     --mandir=*) quote_sh "-Dmandir=$2" ;;
+    --enable-mcux-soc-svd) printf "%s" -Dmcux-soc-svd=true ;;
+    --disable-mcux-soc-svd) printf "%s" -Dmcux-soc-svd=false ;;
     --enable-membarrier) printf "%s" -Dmembarrier=enabled ;;
     --disable-membarrier) printf "%s" -Dmembarrier=disabled ;;
     --enable-module-upgrades) printf "%s" -Dmodule_upgrades=true ;;
diff --git a/subprojects/.gitignore b/subprojects/.gitignore
index adca0266be..bca8693ef4 100644
--- a/subprojects/.gitignore
+++ b/subprojects/.gitignore
@@ -6,3 +6,4 @@
 /keycodemapdb
 /libvfio-user
 /slirp
+/mcux-soc-svd
diff --git a/subprojects/mcux-soc-svd.wrap b/subprojects/mcux-soc-svd.wrap
new file mode 100644
index 0000000000..80d18e8561
--- /dev/null
+++ b/subprojects/mcux-soc-svd.wrap
@@ -0,0 +1,5 @@
+[wrap-git]
+url = https://github.com/nxp-mcuxpresso/mcux-soc-svd/
+revision = 7f6f9ef7420144fe14cd9bc4d8e0e3523232da04
+patch_directory = mcux-soc-svd
+depth = 1
diff --git a/subprojects/packagefiles/mcux-soc-svd/meson.build b/subprojects/packagefiles/mcux-soc-svd/meson.build
new file mode 100644
index 0000000000..37c537d040
--- /dev/null
+++ b/subprojects/packagefiles/mcux-soc-svd/meson.build
@@ -0,0 +1,5 @@
+project('mcux-soc-svd')
+
+fs = import('fs')
+
+rt595 = fs.copyfile('MIMXRT595S/MIMXRT595S_cm33.xml')
-- 
2.46.0.662.g92d0881bb0-goog

