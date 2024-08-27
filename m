Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp19306nji;
        Mon, 26 Aug 2024 23:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXitovRe7nOAsm6zobEUDvDhVQZMelX0Y9BISW45U7WtkWGJn4oFyA4fC9fMuAS2KrAoEEI5GPtaOezRw==@linaro.org
X-Google-Smtp-Source: AGHT+IFIYPjKMA95xW83hKX4Bfc++uJq9Za+ICBHT6AdTEO8mg6g/Bt3jjyK/6KI8ncKup4xrZo+
X-Received: by 2002:a05:6102:548a:b0:492:a6fb:23cd with SMTP id ada2fe7eead31-498f451fb2cmr16825302137.6.1724741179566;
        Mon, 26 Aug 2024 23:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724741179; cv=none;
        d=google.com; s=arc-20160816;
        b=U1X/V0MzT8fPBZkvzlNcuLsp3xImXGgdRq3xFG0mOTnPs0ZhRFyOppR7cD7l2Z8U7t
         R8dfIy0rgGL1ZcycBglkcYalXk5aloi8GpYF6516q+EuY34ms2Ly5wxlgDB7lh+H1rtl
         ILTVTTuSNAp7sJuxVfF2kYoF61/OGm7n64p7MrTwCcQ+KCitqRauL5tLpt24OT+8tmJt
         JK9jj3UPILMD2KBdqLKIvjQve/jDBJlvwT4BBJE3CmuyxNACDgiLhI5kVHfKgRHM644f
         iTIyf84kh4fTGLShBtFiWgcQBMKKJqixiiaxXjGJYhkEGTJiC2KstpA113IaoYkgB7c6
         HEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=sYJIi6ezq2vZAFcWE+Oi1a3J9njQ1zztAPYOoRhq3lI=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=iAROGzAXpig3qapgFJfx2LobVHY++IThev6GUjXSgTgPD3SxcYnKVx+HGrexNTP4Of
         20AGmTGpadF+pD8O6gxHtD8LqVnimsVJd7AK4vYdrsGf7aQCGBLuBuHxKjpVGO/+fXl+
         i13j3WVM13aRePklaSVfoFIIYWxLZ/xmTkrUbjyBd7rdnx2CEpApVwXUITyVTp03JI6T
         qoRenDZ0YSWsoIC9ovThNFXCWJ4s5MQgB7YQNlO4bKnUeQyvCtSHnDosnCHyeKbguvb1
         h4oc2cmNbejTW0YYeNRLMb/m1iPl2CttiLIsL7nqNgLNyUORroayYeRLSrWXQGHx4eQ9
         iYaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="bkotbk3/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f34fd1bsi1264327185a.208.2024.08.26.23.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 23:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="bkotbk3/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sipxh-00036I-Um; Tue, 27 Aug 2024 02:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3EXbNZgUKCnAhOjWdUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--tavip.bounces.google.com>)
 id 1sipxa-0002oO-H9
 for qemu-devel@nongnu.org; Tue, 27 Aug 2024 02:45:46 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3EXbNZgUKCnAhOjWdUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--tavip.bounces.google.com>)
 id 1sipxW-00064j-08
 for qemu-devel@nongnu.org; Tue, 27 Aug 2024 02:45:46 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-7cd7614d826so4620900a12.1
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2024 23:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724741139; x=1725345939; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=sYJIi6ezq2vZAFcWE+Oi1a3J9njQ1zztAPYOoRhq3lI=;
 b=bkotbk3/LuQLXFcYVehb+Dtr7AMNBz69upG8O2rHxPL+BNtY3fcubCDdMycQy0F+iJ
 JPyt94emqNc6Xvvx54f3GR73+7iDeNgXBb3kAS3KS4B+qZhXi2ScxG0i8a9tRKOG3sAB
 GUSygTyFlqsv50BTkfC1eKDVUrVkVPlBti/xXVTxrtEzNlsjYq+iRkXnnCY8T8jWv3so
 1uotnYFv3K2Uf4em7i6HZ3PM796XPYkrPs4F3IFbjG5lcU26bZuhOBAzs3paUntWSg40
 ivdNB+f+Skun2veeNGI30Uwy4GpHf1iMZX0lIi9G9RDX9klYefqQZQqZI1BCZ09SnI1o
 VlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724741139; x=1725345939;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sYJIi6ezq2vZAFcWE+Oi1a3J9njQ1zztAPYOoRhq3lI=;
 b=kykYQMqUxF+YAeNHuTyzV3rlsN615wwa0lRx+SGimMGNpWq1vHxrYmH4Q+4VAN5Yfw
 pMfM/gzB3KLzn9Ymwuc7YW7mZGri0WSC9Ev+H45PmbRI9TxUNoQblFNObhnclqFASLdE
 L4cAnuKe3nGdzH+huYXU0jgYUwROQzzh/R1vCnFCWYqdXOBEf/FI4rFrVKuv3Oj+UyGF
 FROOGXZGO9tlzrBE/l/HgprV2/frJvPz0fxb6h/2hKV1SBGvgUg1DP6myas5fWeLpB4O
 z58U6ajQsvKd5Wxsm7Qbsz4/0uyVLCt/oRBo1w1tgbqI1bqvEN7njnbLiefCEPdTMGC7
 PNBA==
X-Gm-Message-State: AOJu0YzEAmi/I1gOuXEqr/+EyjNtptERjl/ZlPjetIEUOrsQV9oKyrR+
 MUuzaAxGoLa1/A6JxFDK68w7lRdOp/Nz+eQjSyUvXkTzrU1Ef5Dfb8jBbmqA/nQtcVnr48+Eh3t
 f6g8OjOhRb6ffnL+7jNfirEKr7uDkKqecKvfGLv0HJc9PiIXcMd1G08kq6QPkcjgKRHCaJdrRHo
 yuHJWscE0E0MuJhfKkzkX0Yexz2Q==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:90b:1e11:b0:2d1:b718:fc5f
 with SMTP id
 98e67ed59e1d1-2d8249ded2emr34520a91.1.1724741137769; Mon, 26 Aug 2024
 23:45:37 -0700 (PDT)
Date: Mon, 26 Aug 2024 23:45:08 -0700
In-Reply-To: <20240827064529.1246786-1-tavip@google.com>
Mime-Version: 1.0
References: <20240827064529.1246786-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240827064529.1246786-5-tavip@google.com>
Subject: [RFC PATCH v3 04/24] Add mcux-soc-svd subproject
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3EXbNZgUKCnAhOjWdUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--tavip.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: UvNt6OaFpTg2

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
2.46.0.295.g3b9ea8a38a-goog

