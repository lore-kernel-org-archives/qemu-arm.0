Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2288602njb;
        Mon, 7 Oct 2024 18:20:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTkb69nJBCDbiaCF4AhOGsZofwNyOfOnVNHbSjP2Pzxyy4rLaaxt4HUOUmuhOoyYE3q9hOrTPqwlM0cw==@linaro.org
X-Google-Smtp-Source: AGHT+IFII9qv72Hd+iCS5i40JrQASL1IxQ1yKidL2/pv1Lcq+x0PYCkE+/WKzcf+GmwjLRMbIg9K
X-Received: by 2002:a05:620a:462b:b0:7a9:bcd1:5279 with SMTP id af79cd13be357-7ae6f444fe6mr2344298085a.18.1728350420045;
        Mon, 07 Oct 2024 18:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350420; cv=none;
        d=google.com; s=arc-20240605;
        b=DndP6eCagFsxDJwMMKH9Uebx6Wu2UnHhlZLHy6AaIKWzeOcQgiYyzQBcgrDFgo9AJf
         YfWzCcEvOMmW+ot6z0DtZsfKD88s06CpJgYcd1gOp1415PQdW6sS2yB0eJY7iloRsgtq
         wz0bfsFl4A2tfGbl/hTPnEwwws8YzpqevoyC4tRaLTJkl5xhME5Tx8tFnFUKD23WuHlP
         RfdfY0YiWvNpYdL2L0Uz+2noLMKZZ9aF/9DAimH+nX2g8M9dxiAQ0oPFJ2tjwfEoFn1Z
         fHj5yOLkk6z9xbbtP4MiSpA168jzf/filXy8O8U5/l2NgGkTR60i0qgyWuyC4nv9Zj4r
         Ejpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=SRJtDmmyu0p+iYadPI5KNYfcB0hfVULXlSFU/u3kO34=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=FC5gHmVt1Dn9fk+aF9SdNhM44dTI28WZyLHhdYXOH2i+dxIxJDpp6uW5eS9WL5S+X4
         fYNPQPd8ur7FAnzM58wtWTbP+ICPE/dEs4SyPfaiuPJupLadUEPPxqBXg9KhQoNImacg
         BF/FY/QH8Jjat8fDpv6lMrAq8PpZQ67QU1AfPAa14VI+qZKElkGYbRqRB+lrD4mV3qWB
         ytZ+K6dy9w9T7u8yKZu4Y2fBDn46MLsxuOlDvOXQ5DzIIRsKDAEMTq5nitxmkQW2LiXn
         q6ZwtVFR8abmbrhbrXH7Z8k221NBrPfrdHTts5E8/SlfD2pNE1BT+Y2dOjzSYdbJ9TUd
         9ppQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QB1Wmc+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da75df956si79260991cf.308.2024.10.07.18.20.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QB1Wmc+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxyt9-0000xh-7m; Mon, 07 Oct 2024 21:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hYgEZwUKCOYbIdQXOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--tavip.bounces.google.com>)
 id 1sxysT-0007hn-Fv
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:06 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hYgEZwUKCOYbIdQXOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--tavip.bounces.google.com>)
 id 1sxysR-00007Z-Bl
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:05 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-6e30cf0cf1bso16065957b3.0
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 18:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350341; x=1728955141; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SRJtDmmyu0p+iYadPI5KNYfcB0hfVULXlSFU/u3kO34=;
 b=QB1Wmc+uxm4GciIa68XIdQEZga91s+QCkalN+t2ZsDq6kZPP/3APN6A9O35CBayjUO
 zodkORkCzApKvGhjUoTHEWi2Z9iLze4ed4d6dJ7r1xcRUgjoPgXfOnENCDGoJI/0rupg
 QgHU1/N4H0L2BVYwSbZ6amS6bBozwQpVvHxE0YhE7BSMqH95yVRl88GmzC5C0peExo25
 9LnHwK0IMKMFVHksjYs/n37V3HyKmTmXJb/KLSXwkt7fsmetA1w5109D5WJdRtcWmxkV
 NNjIQmWaR03yITJ9pccw1P+LiiS5Qx3iUWP+Mt9pv+5M7MdXK1SUA3AJIUWLcyPt5QCI
 SH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350341; x=1728955141;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SRJtDmmyu0p+iYadPI5KNYfcB0hfVULXlSFU/u3kO34=;
 b=w0Z8XNpOGfEodFDq/tZi1YBBxYUag+6NdDjl1GdfPHC9hD/5UJ23eN5G6d3o/DP4HV
 5oTbg2aZbxVIein5/DVC56I3ha7+7neKdr/7W/m2joT4//19ezhtG+Nbmme/t0hVrGjI
 rDisjmUvz5cTRzJBiUzmu+bnJ2avuapj3X7RBtc78C6u2TJHwzAw+zMR/TtFBeB5oUd6
 Jrd8Lyf3r9JDj5bLTuUdgsgcXqONToWZsMoX90AYPPk8uSUj77hH8SkrBoT0GCbwaZcO
 Dd2DFIzB+L0c37DQq8wbPxTrNf4gVniM+HqH0tqKuei6NYZsoy09JLRHJY3hd16SziLl
 2UEA==
X-Gm-Message-State: AOJu0YwCcZiwChGbbexabQPD+Ut1RlC2ZJLWZ1yNqztWJwJeOLku0AQE
 NYp/jxGWl8PDFDTauLJN9NnJPhem85v2fTduKfCbZc+JCVWtDYp2eSarfAc0YNNmzjJeHyurEA=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6902:d49:b0:e05:6532:166 with
 SMTP id
 3f1490d57ef6-e28936c0dabmr30058276.1.1728350341057; Mon, 07 Oct 2024 18:19:01
 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:30 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-5-tavip@google.com>
Subject: [PATCH v2 04/25] Add mcux-soc-svd subproject
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3hYgEZwUKCOYbIdQXOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--tavip.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
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
X-TUID: HJUTNh/PfJrP

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
index 5ee1d95c9c..87a412194c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -373,3 +373,6 @@ option('hexagon_idef_parser', type : 'boolean', value : true,
 
 option('x86_version', type : 'combo', choices : ['0', '1', '2', '3', '4'], value: '1',
        description: 'tweak required x86_64 architecture version beyond compiler default')
+
+option('mcux-soc-svd', type : 'boolean', value : false,
+       description: 'enable targets to generate C headers from mcux-soc-svd')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 3bee1c56df..0918eb1ab2 100644
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
@@ -393,6 +395,8 @@ _meson_option_parse() {
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
2.47.0.rc0.187.ge670bccf7e-goog

