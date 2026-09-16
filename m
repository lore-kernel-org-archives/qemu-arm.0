Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0661DC982C3
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 15:31:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6rag-00028l-7G; Wed, 16 Sep 2026 11:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6raZ-00024a-GP
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:24 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6raX-0001M1-Io
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:23 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so6595705e9.1
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 08:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789572620; x=1790177420; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=A8yhkYrv3xvM3F7NcGJheQJxr1oV0vuUzhu9GRaxQgc=;
 b=ReTa8Tr/qV1ittfF6yETluw3MsjHVfSDXWiQ0LSqSybbnekggs6OYboWG/cbJBt7/T
 bhA90DKuT03GaDZ9tzeFaXObdKqaV0pfp3x6k6mpsQ9C8FiicX1y/Ahyu1Dny2NiNNlW
 /fFJmvwZKfFRd6sqQhnXAbsxr0lAA3jYr9OWq92FaJCOfSp+Iqv0k+aL7L8uvIppS7sz
 aA/3d/oWBnPwqLr+qO/ejH3Xhb2UPzbOn0l0zIX34+Lvy+fcy9VTpokrLN5rMNhByf4+
 iW2uc8w7bQ7hvv5Z3pesN4wkZZ1katcdLqOssZ1yguCcLNXmRGZqc1NngDUk3/HFpJPG
 vDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789572620; x=1790177420;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=A8yhkYrv3xvM3F7NcGJheQJxr1oV0vuUzhu9GRaxQgc=;
 b=b0Oc72sCG2lDYYLW861V/Yx1MYnsOEB9uCz54Pndd/jK4MeSfnRLN1zJBv8+o/Svks
 IgFfjkYA4QjZK6BmksaRatCP6VAXpDYGWj2gFQU3+GtN3FWK4k3672DMhwF7DLlh/bL4
 2vnPn05OUcW+fZtOrqS39qNEURZbcKdIy53+4mDMmSx4gvZxxiSd6XVOo/nBgqB6ZxPW
 RTkvnA8tIhwVepnRPshU+XlXBk23aEHRLlbN1MSeWtoNoD3ApU8Wnztxem0mdJxe/ogk
 lKMUwhz/yQ7CR950MOQZ9o+iESfYpTcnYRZ5BRvT6LYAHlVvgzk/DT0zl2Dcsswp97In
 Tzzg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxZ05gun6cH6GxOTLiPutqgJe1zAFy3morWgZNFoku7akuA2c1pLBplhNR7AcAMD0dx81ywg1Ugag==@nongnu.org
X-Gm-Message-State: AFuF++kx3CsSRX6xBeHwcUDs9I3J4wUdorabgZaoYWWFQCzZ+LsD/ZfM
 URImISLcTg0lYh8vGpUa/Y6MFCCEidewxGtpzxXsmkc30ap2UlZma95q/HXPgXcklOA=
X-Gm-Gg: AYBFou3/j47zSAImnmEpwfiWEP6jj7XOxU9VcomJgVmLNvgzaX7QdL2IjwObzzXtWWi
 qsA54rL0XAinDk/gw+eg7ncywV27gvdtE5tOez6FsxnuGe35hU07qjeAKaeQNP2Ydd1HLpxriNA
 KHDStLuMwRwL+1NHXn+pEissHhXcg1lwTVWhfk7gw+mqJXtYSIGLtz9wg/crm4VPrhZz+gTRrS6
 cRvGdYa4z78peBzgmeafYXWaHOf0g5z7SmK0oLLGEWyBBG0ToyQyd44mb8Uf5d9dnHKbP8Yd/Vs
 zejTfgBYqSqEy48+JUYgrPNBNVbUeoGdp21QXMFAAlautZII1cWl/J1os+h7dq3W2nlGy4fnRfE
 WsjUf88cqjYo4gVDQVS8m1wWkB+FxenT9ttO8AhOobczBo8+n6xOy8FNUkb/GX4PCc/ZQfkGPYA
 471urDRKWSQYRIAJzlVNSnOy5W0NLKFeSlRwtwBSsGj7CgLQFhc7r+HWK8ryzI7HqJJN0pcnw=
X-Received: by 2002:a05:600c:4f49:b0:49c:ed94:cdd8 with SMTP id
 5b1f17b1804b1-49fbca1a8ddmr15963845e9.6.1789572619617; 
 Wed, 16 Sep 2026 08:30:19 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd1b147asm135475e9.10.2026.09.16.08.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 08:30:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 82668618D5;
 Wed, 16 Sep 2026 16:30:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Kyle Evans <kevans@freebsd.org>,
 Eric Farman <farman@linux.ibm.com>, Brad Smith <brad@comstyle.com>,
 Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jared Rossi <jrossi@linux.ibm.com>
Subject: [PATCH v4 03/19] Revert "tests/tcg/meson.build: implement ./configure
 containers options"
Date: Wed, 16 Sep 2026 16:29:56 +0100
Message-ID: <20260916153013.2134555-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916153013.2134555-1-alex.bennee@linaro.org>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We want to keep the container configuration inside configure for the
firmware builds.

This partially reverts commit 522b299ca4316d8cad57f9496ffcba87dcc20719
while keeping the plumbing to disable containers within meson.

Tested-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
[AJB: untangle changes since]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Jared Rossi <jrossi@linux.ibm.com>

---
v4
  - tweak revert to keep disable reported
  - update commit msg
---
 configure             | 14 ++++++++++----
 meson_options.txt     |  3 +++
 tests/tcg/meson.build |  3 +++
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index bedde58b8cf..6084a7a065e 100755
--- a/configure
+++ b/configure
@@ -260,7 +260,7 @@ ninja=""
 python=
 download="enabled"
 skip_meson=no
-use_containers=""
+use_containers="yes"
 rust="disabled"
 rust_target_triple=""
 
@@ -727,11 +727,14 @@ for opt do
   ;;
   --disable-plugins) plugins="no"
   ;;
-  --enable-containers) # enabled by default
+  --enable-containers) use_containers="yes"
+                       meson_option_add -Dcontainers=true
   ;;
-  --disable-containers) meson_option_add -Dcontainers=false
+  --disable-containers) use_containers="no"
+                        meson_option_add -Dcontainers=false
   ;;
-  --container-command=*) meson_option_add -Dcontainer_command="$optarg"
+  --container-command=*) container_command="$optarg"
+                         meson_option_add -Dcontainer_command="$optarg"
   ;;
   --rust-target-triple=*) rust_target_triple="$optarg"
   ;;
@@ -1718,6 +1721,9 @@ echo all: >> $config_host_mak
 
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "TARGET_DIRS=$target_list" >> $config_host_mak
+if test "$container_command" != ""; then
+    echo "CONTAINER_COMMAND=$container_command" >> $config_host_mak
+fi
 echo "SUBDIRS=$subdirs" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
 echo "MKVENV_ENSUREGROUP=$mkvenv ensuregroup $mkvenv_online_flag" >> $config_host_mak
diff --git a/meson_options.txt b/meson_options.txt
index 66d3689d14c..daf301ed48a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -389,6 +389,9 @@ option('rust', type: 'feature', value: 'disabled',
        description: 'Rust support')
 option('strict_rust_lints', type: 'boolean', value: false,
        description: 'Enable stricter set of Rust warnings')
+option('container_registry', type: 'string',
+       value: 'registry.gitlab.com/qemu-project/qemu',
+       description: 'container registry to cache from')
 option('containers', type: 'boolean', value: true,
        description: 'use containers to cross compile tcg tests')
 option('container_command', type: 'string',
diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index ce208e686ff..890da7b81e9 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -101,6 +101,9 @@ if get_option('containers')
   endif
 endif
 tcg_tests_summary += {'container command': container_command}
+if get_option('container_registry') != ''
+  tcg_tests_summary += {'container registry': get_option('container_registry')}
+endif
 
 # plugins come first, as we need to build the list
 test_plugins = {}
-- 
2.47.3


