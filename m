Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBFE606A31C
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yFroAWaI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIt1E-0000bo-7Y; Mon, 19 Oct 2026 15:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0z-0000T5-AC
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:22 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0u-00034S-Lh
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:20 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48dfaa3fa12so9832f8f.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438034; x=1793042834; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OZ3vE7Y2KojWrkpJTToTY66WrYs8d06KFVFruRFwnrU=;
 b=yFroAWaIKeDhZnC9PY2SN8SAQswrU3FFHr6rtTDHzfRe/JsM/lkHZ1+/zGYnF71Kdf
 I6bov9clxIuZ7WCyTTQpBIWQiBPldn41U8/zZZIFbLQDkfCf/FKpHmMctNudBBbXHQ2i
 rf5i1PP+iZt/fY7/3d1tIEVwj62A7WPmZ7RUZpahntiGwmTvKFUJ8PgZlwr9v/QO9dkE
 2OnXn4cBQWMUiquCY1oORaI2GTjBJ90dERnOnSDn/EUqVA4dpPNNkaYJna0nCM53kUNK
 bNmNtPR4XNdR4+le20g2oVkVQuz/1/y3Qfn6AN6R2CzpZabxKjfl+rNxDD1cJ80IvUb1
 /pJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438034; x=1793042834;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OZ3vE7Y2KojWrkpJTToTY66WrYs8d06KFVFruRFwnrU=;
 b=mcOZTLvtVNtF7W/3lr7HnDMr/inTsfprbHsHspALR7W/7Bi9da4vH+RgtKLIVcT/Ms
 rwKKA+7KGNDF2AZq93JiYBmgN7aySFWvMpl+fwwIcQUg7K1m6jVupJ7fry+AujaJaQPr
 plW0gV2avie5uywWqlZP/1LLTPYm9IrVuKuupDikU1BtBzC0pHmXPZfPIXV5pIEgQAKr
 s+uqlZRJsXpJZk6IcFOKki2RsL8+Mb0u2OwmhgmzIegz1nMWFs/mKC4JoFl0HTtETp2V
 RIKMbywAtZHKNgV/kAcQE7YpJdrlV19dA/HqT40igYXzvST85ZT61uCaKJYhYnqW3pjK
 RPpQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBySiGVYhlw45PsjKPzV41X0rpJWrpUeF4fh3Kke96WlHRvnZFECw3r6Jlf1aD7ZdCiVQ5ZZKltS6g==@nongnu.org
X-Gm-Message-State: AFq9FYJOy/6r4fJNkwNTMxSidjSEleWYo79NKZm4iPaHws7pQ8N1iS8Z
 HPuAbV0PDwG83OgCwd+cGkTcsFd+DFs3Rsc3tw65N41D+ByTz4pTR20bnxIKn/oGQ5s=
X-Gm-Gg: AYBFou1ocqGkWr2EMwHVdaDopwwtheRyS5sx94lNGKZz6tQBOrZ1n3HoY1DeumkND+/
 CLuymh16D12dCXGCXlVXRsIqmsJf0zMPaaObFlSmFUXsNXFXN+DChn83RzNCZGHGxUpyQs9eZCo
 Baft3mDvmHmiyrBE3l5HeCcLNPtSN0rllf5tMpTl3bVG0HM/EXTL2CFi8Hxs5GjwTunp60JPslU
 tf3T/YLv23QahxcK5tAfwUT0G3MTG9IKPXc8NjQHu3TrxkbZpcOEE2PcmWrjFiYRyzH0RiiY2j+
 NOVEVYOromHrc1KHAZTANE3Qkn1tOoBfUND1dwskzZ8IXeZJyPp+o3JGsBgaDEK1RifybEcMp+B
 eE7IaUnQeuka2mkZ4qJPh2BO6IYxr+WjHaXoUAvTM28qRZV2kQxW4kaWxJmDWJqH3XJtXwMTa2c
 I1irsWYv7YcEM9L0l6I9/v9wCQRbcja49s5gYz1Cj8RiRiIdXR/jO6Z/GL/iDe1LB3d5+aD5ntl
 7Qbr5l9
X-Received: by 2002:a05:6000:2302:b0:48c:585b:8825 with SMTP id
 ffacd0b85a97d-48e1e76eda3mr206383f8f.18.1792438033552; 
 Mon, 19 Oct 2026 12:27:13 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d6dbbb0sm883191f8f.5.2026.10.19.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:27:10 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 685095FA43;
 Mon, 19 Oct 2026 20:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Ani Sinha <anisinha@redhat.com>, Anders Roxell <anders.roxell@linaro.org>,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brad Smith <brad@comstyle.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 04/19] meson: move gdb detection into the top level build
 file
Date: Mon, 19 Oct 2026 20:26:49 +0100
Message-ID: <20261019192704.3220373-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently gdb is only used by TCG based tests but hypervisors want to
use gdbstub too. To be able to test this case we need to always probe
and report the gdb we have.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260930164649.433573-5-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build                  | 15 +++++++--------
 tests/functional/meson.build |  5 ++---
 tests/tcg/meson.build        |  5 -----
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/meson.build b/meson.build
index bbef9d9c293..4f29bc6cc33 100644
--- a/meson.build
+++ b/meson.build
@@ -163,6 +163,12 @@ else
   iasl = find_program(get_option('iasl'), required: true)
 endif
 
+if get_option('gdb') == ''
+  gdb = find_program(['gdb-multiarch', 'gdb'], required: false)
+else
+  gdb = find_program(get_option('gdb'), required: true)
+endif
+
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu', 'riscv64-softmmu', 'loongarch64-softmmu' ]
 unpack_edk2_blobs = false
 foreach target : edk2_targets
@@ -4710,14 +4716,7 @@ summary(summary_info, bool_yn: true, section: 'Directories')
 summary_info = {}
 summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
 summary_info += {'sphinx-build':      sphinx_build}
-
-# FIXME: the [binaries] section of machine files, which can be probed
-# with find_program(), would be great for passing gdb and genisoimage
-# paths from configure to Meson.  However, there seems to be no way to
-# hide a program (for example if gdb is too old).
-if config_host.has_key('GDB')
-  summary_info += {'gdb':             config_host['GDB']}
-endif
+summary_info += {'gdb':               gdb}
 summary_info += {'iasl':              iasl}
 summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 if host_os == 'windows' and have_ga
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index c7362dd00ef..68c601d4036 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -83,9 +83,8 @@ foreach speed : ['quick', 'thorough']
                      separator : ':')
 
     # Define the GDB environment variable if gdb is available.
-    gdb = get_option('gdb')
-    if gdb != ''
-      test_env.set('QEMU_TEST_GDB', gdb)
+    if gdb.found()
+      test_env.set('QEMU_TEST_GDB', gdb.full_path())
     endif
 
     foreach test : target_tests
diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 1cd2d421cea..06f013fbe3d 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -1,11 +1,6 @@
 env = find_program('env')
 
 docker_wrapper = find_program('../docker/docker.py')
-if get_option('gdb') != ''
-  gdb = find_program(get_option('gdb'), required: true)
-else
-  gdb = find_program(['gdb-multiarch', 'gdb'], required: false)
-endif
 prog_check_plugin_output = find_program('./scripts/check_plugin_output.sh')
 prog_gdb_test = find_program('../guest-debug/run-test.py')
 prog_record_replay = find_program('./scripts/record_replay.sh')
-- 
2.47.3


