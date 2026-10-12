Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03D3CA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 17:08:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGJSK-0005eA-26; Mon, 12 Oct 2026 13:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRb-0005HV-7j
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:17 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRV-000793-Ek
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:09 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso15374645e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791824638; x=1792429438; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=CiTT7hmsFgBNHFF5MEXRqamjB+JugaFDKLZU8ZIdj9U=;
 b=dViOCJ7dkk4v8/JGuDxesNoF1KbtNFlfUdNaGaCxI85cM4jaIqCJTahc2deJLPhsdA
 qWC3xuFmTTCW+93/2lRfRysHEyZM2ZFowjOQe1+oqO02vlZ2a3mHuVFp5/kiAXARarE+
 potwgrbXsA5fa+PW12Adha3Gs5tMzNF6x9rz8QXf67PNsZ7p4L2EE8zBdGuY0/nQa9zn
 VFxeG1Rbu7TgFotGmGp8sj6qtUGn65Qoel9dJ8SgT+gRi30thEZh5CrKD47xlimm6BiK
 5cAn9kN2rl0nR0h1tDePlPyJh1jL0KW4SNvFr971qrf2Lctp4IvikpfO/ufMCjtRrGNi
 K5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791824638; x=1792429438;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CiTT7hmsFgBNHFF5MEXRqamjB+JugaFDKLZU8ZIdj9U=;
 b=U69wXFt1iOe6nSZhlfKW1JoZ+mE9nuVrQHV20zdGC8BiW3uMS1/ggzPeWfJrxprOV9
 So0dY3KN0jisEvWpSpHv+H7VjFOQYT5LwjOt+gEfnnWp7X1jJSGg94hcPTlIyF0eTP1y
 Kbrxn+EW0hbfUCO2JugLo8t76GrncGBHXChCx2HB2cqCehBi4JcmQFNqN+CMYPz4mdUF
 4OIa2+Tca6NehY5Xwq/a0u1YeXv5VcntGAD+X1hXwUX92tDN1IiNfOUy+w/RgC4rz+Se
 tAGzGR2tahW2JMx5i4bCh/yM6ZGNUGiccxkf5JcyG7Jn0HKqLsrKyAmEcV9VKKLCzy/b
 ZHcQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy4+gJFvDcgsJEbiqOxjw41YJM5GRrJqZJTsUWOpIafVUvHnum23TiEdmh2zkBp3S+YHXfaU6NfJg==@nongnu.org
X-Gm-Message-State: AFq9FYLnYuJG9i+WGQ4E7Y6U9jdaBIGFX60A2kqmWWbK+cKZ0NX1/b4y
 p7UEMk3tHBaQulgPNWJn+C1No6HMSHHNyIOoRVrCpVrWTRJvNPnOZPrjZpeYQKHO5B//oRQCqCg
 6DluSl64=
X-Gm-Gg: AYBFou16OfFDtNgpfeXeaGdP7Mw+b4+dLO6PcimzGbtpqaHLxqhgoHz2GiCpEOZ2AoZ
 /Evzi1PDhqaHpDxX9Tn1Pkg7/3sv7hMhIAvRXntJgLiOSfDx7wek4PcyZ2z8Nym1x6FzqJHFlc4
 5smzd9KRIeyv7/LqefciJSsWD/4XEqGGLof41pv05nRXohjJfyR3/QChWSbXL+Xyaajt2cunH1j
 zzwfhIHanf7p5pnYmg0F0fAVG+utBRg0Us9WCGLfMOu9OS6a9zEla5khvATF7MqoMxZiOPc0jkv
 cye2n/6UbxsRUvzmSe5EPIL57fp/znthNxAJYllBpfzkDRNeOPIclweWfbQd/jFd1Q102IhsI9/
 iV1I9fPVEjVKslqV9ve0dbnnIToWtoYQzVTf0ZktyGfKXFlIDQDVSOXfjnwiL6j48F77yDnHXNO
 8fanApxcfWTNVn8iYcawmGpLhC/Xj5SdSLmXKwSWP/7hdLGgbr2/reMCfqoz+6sGfiyPEyhQ==
X-Received: by 2002:a05:600c:548f:b0:4a1:a39b:e71e with SMTP id
 5b1f17b1804b1-4a1a39becefmr41130545e9.5.1791824638287; 
 Mon, 12 Oct 2026 10:03:58 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf1358asm305657555e9.4.2026.10.12.10.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:03:57 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9CCBC6211D;
 Mon, 12 Oct 2026 18:03:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, Ani Sinha <anisinha@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 16/16] tests/functional: add tuxrun kvm gdb test for s390x
Date: Mon, 12 Oct 2026 18:03:30 +0100
Message-ID: <20261012170330.1144446-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012170330.1144446-1-alex.bennee@linaro.org>
References: <20261012170330.1144446-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

As with x86_64 we now have the bits to add a KVM gdb test. One minor
wrinkle is the s390x only supports WP_WRITE watch points so we skip
the other watch point tests lest we get confusing messages about
failing to insert HW breakpoints.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/gdb-scripts/kernel_gdb_test.py | 10 ++++++----
 tests/functional/s390x/test_tuxrun.py           | 14 ++++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/tests/functional/gdb-scripts/kernel_gdb_test.py b/tests/functional/gdb-scripts/kernel_gdb_test.py
index 2d62fe01f10..56f0514c943 100644
--- a/tests/functional/gdb-scripts/kernel_gdb_test.py
+++ b/tests/functional/gdb-scripts/kernel_gdb_test.py
@@ -107,11 +107,13 @@ def do_one_watch(sym, wtype, text):
 def check_watches(sym_name):
     "Watch a symbol for any access."
 
-    # Should hit for any read
-    do_one_watch(sym_name, gdb.WP_ACCESS, "awatch")
+    # s390 only supports write watchpoints
+    if "s390" not in gdb.selected_frame().architecture().name():
+        # Should hit for any read
+        do_one_watch(sym_name, gdb.WP_ACCESS, "awatch")
 
-    # Again should hit for reads
-    do_one_watch(sym_name, gdb.WP_READ, "rwatch")
+        # Again should hit for reads
+        do_one_watch(sym_name, gdb.WP_READ, "rwatch")
 
     # Finally when it is written
     do_one_watch(sym_name, gdb.WP_WRITE, "watch")
diff --git a/tests/functional/s390x/test_tuxrun.py b/tests/functional/s390x/test_tuxrun.py
index 8e0261e2b7f..528af3c08ff 100755
--- a/tests/functional/s390x/test_tuxrun.py
+++ b/tests/functional/s390x/test_tuxrun.py
@@ -19,6 +19,9 @@ class TuxRunS390xTest(TuxRunBaselineTest):
     ASSET_S390X_KERNEL = Asset(
         'https://storage.tuxboot.com/kernels/6.18.54/s390/bzImage',
         '5efeb31754b211440e1595ab11355bb006fe78a2c0604ed0a8c55c4598b71aec')
+    ASSET_S390X_VMLINUX = Asset(
+        'https://storage.tuxboot.com/kernels/6.18.54/s390/vmlinux.xz',
+        '5bbd4d34e0950f88053a9bfd16078896df4b1ee1696fc2ad62488e681a6bdd8e')
     ASSET_S390X_ROOTFS = Asset(
         'https://storage.tuxboot.com/buildroot/20260924/s390/rootfs.ext4.zst',
         '5ba18c4d18831c50a0c743990f7bdee1d3b520629d423c55b668d8fbbac9c6f5')
@@ -42,5 +45,16 @@ def test_s390_kvm(self):
                            haltmsg="Requesting system halt",
                            accel="kvm")
 
+    def test_s390_kvm_gdb(self):
+        self.set_machine('s390-ccw-virtio')
+        self.require_accelerator('kvm')
+        self.wait_for_shutdown=False
+        self.common_tuxrun_gdb(kernel_asset=self.ASSET_S390X_KERNEL,
+                               vmlinux_asset=self.ASSET_S390X_VMLINUX,
+                               rootfs_asset=self.ASSET_S390X_ROOTFS,
+                               drive="virtio-blk-ccw",
+                               haltmsg="Requesting system halt",
+                               accel="kvm")
+
 if __name__ == '__main__':
     TuxRunBaselineTest.main()
-- 
2.47.3


