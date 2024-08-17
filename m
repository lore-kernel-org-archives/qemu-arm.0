Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1490386njf;
        Sat, 17 Aug 2024 03:26:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4yPJovjBR46P+8t24nvjX70j/Aev7dDoYsCN1N/yRZtx2GvIf0xRI156oG8NUcJsQolXYp4zO4IUIUiyEpPlKPJSw7tEo
X-Google-Smtp-Source: AGHT+IGd1z3wXioiN9DjbNQdOTT/+UlKmDIoS6tLPTn7M0ikLxYmnlcboQj1Kw8AklZMpS73y3PY
X-Received: by 2002:a05:622a:5c05:b0:44d:6627:4b4d with SMTP id d75a77b69052e-453741e1bb4mr58665191cf.11.1723890403169;
        Sat, 17 Aug 2024 03:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723890403; cv=none;
        d=google.com; s=arc-20160816;
        b=kz3XhXgUAGtTr+VPBgLA7d26dAX9hSFQ0wxwV361ULVXbuSNpSMYVeTNd1qi8J2UC5
         3zN7+XCFURCcdm+kPubuQ0k50v30pyjfn8QanSC1hC0etcjbudVNfdI4IOytOOGTNwrp
         q1sT4BWisqp24eb/FKXQ7FwbHRU0o8SVKFobqK4PxX3CU6Vx4bg9zvo8JBRfb8QOG0Ds
         IwCzyWc3oYKNeR2T2tMqa5ZGz3CyfHwyqfZM9Wv/IJftGORUAGq5eR98poQOiBuvkDlH
         WYGiWz5KmVDjgMAMHsPZty307TF6gksGG8vmny+m2Gh9Cvbhd/BAuo6OTf8w43VbJkpe
         aw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=FVNYijpYFtbfaDyQGxsk5OhIQ8sQjh7sQW2Q7Qw6WEo=;
        fh=pITIqJh0Z5XaT4QxI/zJAgHBZTuNeZPw20HbjxZRX7I=;
        b=iNi0N4gxQrAzGrfw3hhNAFJrH+JJmV0pT2mDwd9PEwXrbsdORXHU95sYx5KtKSidYO
         t9dp3VwzrrK2ZwpXzLtBfAa8JYQ7Ja9cz3GW4o0Uv0atAlIdGl6grNHHjJoXxIVHYvp9
         ftIEelpHEyw4Ts2UQt6gqqYaJGr/00aLA6f70ujujdxgpjsr0scqg56NMSkv5cWoxRhL
         ytSnAWDEcw+DJmXd4lvLTPCJ4l4ZgCjoXfwcAHl7TWTPLvD9guz/DP/M8E6EAw7E9NA8
         tfnNB4gGCrr6kwOmZNfXk+lpWMzwwX0p5eB+lJAd5IHunKhldbnalX9ceUuo27Idg5GK
         eiOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="hv/rr9NG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4536a0724b3si61443801cf.369.2024.08.17.03.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2024 03:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="hv/rr9NG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sfGdg-0006Fo-3N; Sat, 17 Aug 2024 06:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3x3rAZgUKCPovcxkriqqing.eqosgow-ctopqpipw.qti@flex--tavip.bounces.google.com>)
 id 1sfGde-0006Ca-KJ
 for qemu-arm@nongnu.org; Sat, 17 Aug 2024 06:26:26 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3x3rAZgUKCPovcxkriqqing.eqosgow-ctopqpipw.qti@flex--tavip.bounces.google.com>)
 id 1sfGdV-0003Aq-8M
 for qemu-arm@nongnu.org; Sat, 17 Aug 2024 06:26:19 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-778702b9f8fso1500033a12.1
 for <qemu-arm@nongnu.org>; Sat, 17 Aug 2024 03:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723890376; x=1724495176; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=FVNYijpYFtbfaDyQGxsk5OhIQ8sQjh7sQW2Q7Qw6WEo=;
 b=hv/rr9NG22hZ9TKVr+p+9Z6/xUgJDZly4LDb2bnP50GxZJNx255I7m0VCOQ7gelU7i
 vMfmfSZoXqp+jEVygKwynlDNRqZdU0TnMR6LRDOkfkSjVBpcVsCpDNWy+iCHYXnZJasw
 im4B6W4QedwtDuT6NhXWYxNOAldY2jvVULGEGdQdscSnBLeG0Oi48g1cljCWnVfrqNOv
 W3yEpUujb8dxMMros/A9gD5ms7eAmqLrvlG7qecYxR0cZ5TwzoxFq4OWMNfHQY4Po90k
 NhEwt87wNmhkJZYobk1MLzq7BjZW1OW/1dCaQ9VQkKsB7e7SmHIVtwT2EJFUPi+O5xZN
 5S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723890376; x=1724495176;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FVNYijpYFtbfaDyQGxsk5OhIQ8sQjh7sQW2Q7Qw6WEo=;
 b=YrD0WNVAjrw1Kq6aTMNSid1I1vVwSl6TsmL/zVD3H2gPBBK55jxVgy4YwkbtWxKaVh
 rgRcF7gwFCcuMH+UaCtoWAgc3uztSOAvqQ77lcGvfaw9x1dOab0AD9q/R9kvKFSix6KM
 aAvbVtHddZ3AY6W9B4NSkY/O5Bkpiy9yv6I3axtX4UQHUOZZot5FIne41DbjjPD6kpAU
 r9UgHVq3jXxCvU5dpu7ZTJEL5Xopd/+raW314NoVjuGidbbi2hDeUvxOm6ljT7EUJKGZ
 qx6B7gIgWDdh9wnyuWq86x4lL8Jc5MKE5caW2P1htUV3dIiXiJkEEqsfsSt/mw28jPNX
 EbHg==
X-Gm-Message-State: AOJu0YyvaJ8wTg4wY43cGs4iTZuD1FToe7LmcrfwqStgund3HsbH/wV6
 8ZZ3NHI0n38qnvEasSd0ZIpgh+kWYwLwnCicpYdblPKRdOPuHgoLiyAZYuoj9HSRjAyXay+Rkw=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6a02:590:b0:718:84ed:abe7
 with SMTP id
 41be03b00d2f7-7ca488fb5e5mr7695a12.4.1723890375445; Sat, 17 Aug 2024 03:26:15
 -0700 (PDT)
Date: Sat, 17 Aug 2024 03:25:47 -0700
In-Reply-To: <20240817102606.3996242-1-tavip@google.com>
Mime-Version: 1.0
References: <20240817102606.3996242-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240817102606.3996242-5-tavip@google.com>
Subject: [RFC PATCH v2 04/23] Add mcux-soc-svd subproject
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 thuth@redhat.com, peter.maydell@linaro.org, marcandre.lureau@redhat.com, 
 alistair@alistair23.me, berrange@redhat.com, philmd@linaro.org, 
 jsnow@redhat.com, crosa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3x3rAZgUKCPovcxkriqqing.eqosgow-ctopqpipw.qti@flex--tavip.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: Cf8uSqkP2lzU

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
index 4c1583eb40..25f827078a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -366,3 +366,6 @@ option('qemu_ga_version', type: 'string', value: '',
 
 option('hexagon_idef_parser', type : 'boolean', value : true,
        description: 'use idef-parser to automatically generate TCG code for the Hexagon frontend')
+
+option('mcux-soc-svd', type : 'boolean', value : false,
+       description: 'enable targets to generate C headers from mcux-soc-svd')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 6ce5a8b72a..2c1e501806 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -40,6 +40,8 @@ meson_options_help() {
   printf "%s\n" '  --enable-lto             Use link time optimization'
   printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to use [system] (choices:'
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
+  printf "%s\n" '  --enable-mcux-soc-svd    enable targets to generate C headers from mcux-'
+  printf "%s\n" '                           soc-svd'
   printf "%s\n" '  --enable-module-upgrades try to load modules from alternate paths for'
   printf "%s\n" '                           upgrades'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
@@ -390,6 +392,8 @@ _meson_option_parse() {
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
2.46.0.184.g6999bdac58-goog

