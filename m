Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96FDCD342F
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 10:38:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKD9R-0001Nx-Ta; Tue, 05 May 2026 06:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wKD9E-0001La-4y
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:37:08 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wKD98-0007xY-Tc
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:37:02 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso60711155e9.3
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 03:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777977415; x=1778582215; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BP0T5olRmt8l3+HmgwMWOd0mUAJJRQ2aQs3fFSKAUAI=;
 b=BgxOPX+XL9GmTDB299fXWqvGeztMlGq6K2hw8MWU94UaGPFL+6ZqH1xa7GfntLB8i7
 nyuVQhhigpL9YLRMlwbVutJsX1VNCYJX42K+x0vjRuZoTHpwI/4IphzI4Lcm8/SJcAqs
 RfOD3LCAh53um0dKSvXiBznJsIDP8RLbPl4Y4ZG8HNGvK9pxTosLAOqzzLmyTMp/trv3
 Fti3sktZ2BPVOQiqXNyc5xKtr76CAl1tgaLvR/74xu96cM43fpUV5xOP9+OadZvRNKWC
 93+lNKMEHc0c+8ijEeDvClJMiwrYS5qGsGj2QGyzogpFhnYFo8PDl9fFmhTCY4QRUAG3
 uBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777977415; x=1778582215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BP0T5olRmt8l3+HmgwMWOd0mUAJJRQ2aQs3fFSKAUAI=;
 b=No25qNK0RTmHt9mAsIALEiJ3PW54s4nw9rhSUqjYPwiOdcnD7HVcVWW3Z5y2n875aU
 KQswxZTccbYTam0EeOHoAckNnv1CQxuOKVG8eXxKLPCNmZliZsSaRIZD1ySuik8usB+j
 txmkYYGE2OMRPIgI06cmnwLONk8Ce1eHyehuu4KmkjjWySShg9pq7OozuEPSWE9SHy7W
 jSEpoW381EUsEVS71pxzWKIVKDmDyeHygQ8li8ZSWCzk7vruCbZ6gn7gtfSfPQmmD6GO
 iljtrbHXNdw6Ql+1a5pIn+9RsFO7tzd/OmkEiEqtEzIYwg4GX9toIZENP3jSwnUZPlLV
 w21A==
X-Forwarded-Encrypted: i=1;
 AFNElJ++p/9czsnWAk0Uq1ZtrzGzbj8btW2zRfu/+w5ih4IKk93ZZOKTzyK/irR/AGwe/OoUt/lHf8mAvw==@nongnu.org
X-Gm-Message-State: AOJu0YwnfLbvqmdfNHjtvTVmWvernAJtTGqb7LhBcl00Gesyaw55YEAx
 Uf6UWQAeISEHJUwNxzoFEC72oc5dkrwmV5zapLPsVhzWGVfowp7fTBsqTpWjQ+Ru0YY=
X-Gm-Gg: AeBDiest4tQkyKCg9EnvCGkI6TsptZyZFgYYygXJpP0S/sKsZ4FfVLr+mOWYjm6zbpW
 7zI2qOqqFb1Y1GoPSH3I9e6c+392/5HpAnNpkLHAblo/w98whQQhKla1eWgZRFoUAwTHLPYwKa6
 +punEnLJeSPx8N/pT1JKBLGW1YR4RsNFwzEQRak6+GaDJh4H1fqZhfGGYZhrX/Tdnc9Hh+ot3S9
 19wS/g14DsuyN+sqOgVuBO8Bqcm0MRGWXO0lfh/QqcfdWcvhP2ADNLbA/wY6UBXZP5uw7U7923d
 BXdN4nj5sepIKD/Dv/0KLmEpmouwyKAfOC5eYWNyR0SNPFknXgIPvj0CN5WOj2EehIiqRARxtXC
 VpXsVnOLStNy3EbIKzJIV/RTtj1XP3i0wcveD+BIvxQv0p/F5Wo6nVlD7iP956L4WIiztR3atpC
 nPhQxeWYroz7s/LGFSRfhCa2P3Qy97Bgl9pyzXzJfaEwCL
X-Received: by 2002:a05:600c:a10c:b0:48a:56de:d62a with SMTP id
 5b1f17b1804b1-48a9863a03dmr168544465e9.11.1777977415282; 
 Tue, 05 May 2026 03:36:55 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb72a17sm356606415e9.6.2026.05.05.03.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 03:36:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2176E5FA6F;
 Tue, 05 May 2026 11:36:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <th.huth+qemu@posteo.eu>, Thomas Huth <thuth@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brad Smith <brad@comstyle.com>, Fabiano Rosas <farosas@suse.de>,
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] gitlab: add MacOS 26 job on gitlab runner (!broken)
Date: Tue,  5 May 2026 11:36:49 +0100
Message-ID: <20260505103649.68361-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505103649.68361-1-alex.bennee@linaro.org>
References: <20260505103649.68361-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

gitlab supports 3 MacOS images with 15 and 26 being the current
supported ones. To get ahead of the curve lets enable 26 as well.

It re-uses the same brew list but also attempts to work around python
configure failure by setting DYLD_LIBRARY_PATH:
/opt/homebrew/opt/expat/lib/

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
This is currently broken, I'm still seeing:

$ if test -n "$PYPI_PKGS" ; then PYLIB=$($PYTHON -c 'import sysconfig; print(sysconfig.get_path("stdlib"))'); rm -f $PYLIB/EXTERNALLY-MANAGED; $PIP3 install --break-system-packages $PYPI_PKGS ; fi
Traceback (most recent call last):
  File "/opt/homebrew/bin/pip3", line 6, in <module>
    sys.exit(main())
             ~~~~^^
  File "/opt/homebrew/lib/python3.14/site-packages/pip/_internal/cli/main.py", line 83, in main
    command = create_command(cmd_name, isolated=("--isolated" in cmd_args))
  File "/opt/homebrew/lib/python3.14/site-packages/pip/_internal/commands/__init__.py", line 121, in create_command
    module = importlib.import_module(module_path)
  File "/opt/homebrew/Cellar/python@3.14/3.14.4_1/Frameworks/Python.framework/Versions/3.14/lib/python3.14/importlib/__init__.py", line 88, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "<frozen importlib._bootstrap>", line 1406, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1371, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1342, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 938, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 759, in exec_module
  File "<frozen importlib._bootstrap>", line 491, in _call_with_frames_removed
  File "/opt/homebrew/lib/python3.14/site-packages/pip/_internal/commands/install.py", line 27, in <module>
    import pip._internal.self_outdated_check  # noqa: F401
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/opt/homebrew/lib/python3.14/site-packages/pip/_internal/self_outdated_check.py", line 19, in <module>
    from pip._internal.index.package_finder import PackageFinder
  File "/opt/homebrew/lib/python3.14/site-packages/pip/_internal/index/package_finder.py", line 42, in <module>
    from pip._internal.req import InstallRequirement
  File "/opt/homebrew/lib/python3.14/site-packages/pip/_internal/req/__init__.py", line 12, in <module>
    from .req_install import InstallRequirement
  File "/opt/homebrew/lib/python3.14/site-packages/pip/_internal/req/req_install.py", line 37, in <module>
    from pip._internal.operations.install.wheel import install_wheel
  File "/opt/homebrew/lib/python3.14/site-packages/pip/_internal/operations/install/wheel.py", line 33, in <module>
    from pip._vendor.distlib.scripts import ScriptMaker
  File "/opt/homebrew/lib/python3.14/site-packages/pip/_vendor/distlib/scripts.py", line 16, in <module>
    from .compat import sysconfig, detect_encoding, ZipFile
  File "/opt/homebrew/lib/python3.14/site-packages/pip/_vendor/distlib/compat.py", line 81, in <module>
    import xmlrpc.client as xmlrpclib
  File "/opt/homebrew/Cellar/python@3.14/3.14.4_1/Frameworks/Python.framework/Versions/3.14/lib/python3.14/xmlrpc/client.py", line 138, in <module>
    from xml.parsers import expat
  File "/opt/homebrew/Cellar/python@3.14/3.14.4_1/Frameworks/Python.framework/Versions/3.14/lib/python3.14/xml/parsers/expat.py", line 4, in <module>
    from pyexpat import *
ImportError: dlopen(/opt/homebrew/Cellar/python@3.14/3.14.4_1/Frameworks/Python.framework/Versions/3.14/lib/python3.14/lib-dynload/pyexpat.cpython-314-darwin.so, 0x0002): Symbol not found: _XML_SetAllocTrackerActivationThreshold
  Referenced from: <44AFDBDF-C9C3-35EF-A723-C0C54E2C9C3F> /opt/homebrew/Cellar/python@3.14/3.14.4_1/Frameworks/Python.framework/Versions/3.14/lib/python3.14/lib-dynload/pyexpat.cpython-314-darwin.so
  Expected in:     <4D62FA9D-D86A-3DD0-98F2-C6D0718849E8> /usr/lib/libexpat.1.dylib
---
 .gitlab-ci.d/macos.yml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
index edb500e937b..aae42ca88f9 100644
--- a/.gitlab-ci.d/macos.yml
+++ b/.gitlab-ci.d/macos.yml
@@ -47,3 +47,19 @@ aarch64-macos-15-build:
         --cross-prefix-x86_64=x86_64-elf-
         --disable-plugins
     TEST_TARGETS: check-unit check-tcg
+
+aarch64-macos-26-build:
+  extends: .macos_job_template
+  image: macos-26-xcode-26
+  variables:
+    NAME: macos-26
+    DYLD_LIBRARY_PATH: /opt/homebrew/opt/expat/lib/
+    PATH_EXTRA: /opt/homebrew/ccache/libexec:/opt/homebrew/gettext/bin
+    PKG_CONFIG_PATH: /opt/homebrew/curl/lib/pkgconfig:/opt/homebrew/ncurses/lib/pkgconfig:/opt/homebrew/readline/lib/pkgconfig
+    CONFIGURE_ARGS:
+        --target-list=aarch64-softmmu,i386-softmmu,x86_64-softmmu
+        --cross-prefix-aarch64=aarch64-elf-
+        --cross-prefix-i386=i686-elf-
+        --cross-prefix-x86_64=x86_64-elf-
+        --disable-plugins
+    TEST_TARGETS: check-unit check-tcg
-- 
2.47.3


