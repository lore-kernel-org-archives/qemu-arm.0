Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB91606A31D
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fo+1H96n
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIt3A-00035m-MU; Mon, 19 Oct 2026 15:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt1E-0000cU-Ol
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt1C-0003Bw-9C
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:36 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a1e266fca2so10794055e9.3
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438052; x=1793042852; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0EjCsLzxCc6Z1J6Avt4waW7BwoDGH1cC4bpSsprV0z0=;
 b=fo+1H96ny8BH1wp4r6Zd29oWL3ulE8oleagZD6mikn++fG2AKPBfgb5cKizTqicrma
 d3aGZuSkFk4Lr2igFMKxB1bH81uby5WuF4PRTvwQIC6pFhFM/YItRPLBU1bFF/VmK6sL
 8NTokppdhaZ+qNQv3hmGB1ccciOQ3ZZZY92MEBgFE2O+n5Bwzo4lbxs1VGdy4zpvketL
 qXm9Llwdl7CGNR7Gm3PPsrJz1nW9gqA/jiWETkJIa5twbnkBWu7RmHNMMTcs5/nirxRl
 Lj6LLaKapT3eWb+0Lea8+Zpgz+SAFw+jTsqct+VXTBLJjE1i7a7vGoV2eV114bJxQ3Rl
 PiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438052; x=1793042852;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0EjCsLzxCc6Z1J6Avt4waW7BwoDGH1cC4bpSsprV0z0=;
 b=bUV2kOIK6iosIIX8IVxY22Dd8GkPHZ3GnSsfKLsu+Sm7DP2f0j71F+9pHw1cWcQruv
 lYf947Td3w0hxQIrNK3yZQAKubFs9AiKKGh2TLH1CFdZoj45WWuNtR873AprpZPeReUo
 kwO12clLRkukjMmTyBL3/EF3wTAE12xKqIXWeB0B5bSlhu5zHSMQ1uK4g+Y4pqMD/DdD
 tHvkUPoCLtW6nxLL+QCG5BtPIZataYxYeX2pYO3+DZw7+fVchiDs0x1v4uMSHUhFccH0
 m1RtvjBuWMMnB4J9vGwBB1SA87YMTf7gw0wEI/yTgjKnWMq5yClTotf50NTR3moAMmIE
 exTQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByBnV+A5qtwxN51x8wxP89o5B1Qb044ehhzkHd5vVtT75IDA9pkZmPsaYP5IWBIMuXBxtvOKJvWLg==@nongnu.org
X-Gm-Message-State: AFq9FYKJRqWSh8puTpxsvP8XTdONKmfVmQ7FBjpgX3syaIooPlzKkytr
 X+yhCSnLSif3t4vgCd0zW1ZoNzzmrUjG9YKO18VlNvxV/WhAp1+2Dqk8CjDhVfo66Jg=
X-Gm-Gg: AYBFou3Yf0inFgGQOh+i4DtRGBK76F82fAeOZZcKVwHT87YKSXfvTZwAMa4l4y2EVf8
 PdzAh+tZ05WPL8t6j3FDji0AnCxnq3f3Iq/mjwDImEeKGcceusqI6NOj/lOCwCZQmWLxHyCQ+Ar
 vHGNa0Y27BXvBsldFCiHSb+aOS/pM8s6IRgZpcSnFgj5/hldJWfE+fgC7z+ulgggkb51NYMi1wb
 Zkl1J2UT7Ksil+D37i5Sfsf2seFcMiOu/pKEcWjhgWYbSbt2Ow+v5aLV33csbYpq0vh99U70Vmi
 nHdHGBsEk/n81phNEP8khv9XVRcSupS7H9U7Ymk8UTMOAHHbbJfkI8oMK83VZ12DfT6GpMqy0DC
 x4fgUIyUU9cRd/dWU47uF5PGRwFtBVjXIHvIBE26pDoY2fv6DEdS5Qac6JGOyV+TL1j5gQ4558V
 /qXY6YYEXPntkoxDSsFS2AIgjUHPcFNRDmXDZsqOGaRbabp6K+nIbDTRNrqLEiutRZJAt6JQ==
X-Received: by 2002:a05:600c:1906:b0:4a1:e6c8:ff74 with SMTP id
 5b1f17b1804b1-4a1e6c8ffd4mr94637325e9.29.1792438051703; 
 Mon, 19 Oct 2026 12:27:31 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f37f7fc3sm4616095e9.2.2026.10.19.12.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:27:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6299D5FD54;
 Mon, 19 Oct 2026 20:27:06 +0100 (BST)
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
Subject: [PATCH v3 13/19] tests/functional: add tuxrun kvm gdb test for x86_64
Date: Mon, 19 Oct 2026 20:26:58 +0100
Message-ID: <20261019192704.3220373-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With all the bits in place we can now exercise the KVM gdb interfaces.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260930164649.433573-14-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/x86_64/test_tuxrun.py | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/functional/x86_64/test_tuxrun.py b/tests/functional/x86_64/test_tuxrun.py
index 026b373accb..1a1138d16ae 100755
--- a/tests/functional/x86_64/test_tuxrun.py
+++ b/tests/functional/x86_64/test_tuxrun.py
@@ -11,7 +11,7 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-from qemu_test import Asset
+from qemu_test import Asset, skipIfMissingEnv
 from qemu_test.tuxruntest import TuxRunBaselineTest
 
 class TuxRunX86Test(TuxRunBaselineTest):
@@ -19,6 +19,9 @@ class TuxRunX86Test(TuxRunBaselineTest):
     ASSET_X86_64_KERNEL = Asset(
         'https://storage.tuxboot.com/kernels/6.18.54/x86_64/bzImage',
         '24a3ade610c2cc426ff821050de8a35930b0371357d94cc2c334abac6658552b')
+    ASSET_X86_64_VMLINUX = Asset(
+        'https://storage.tuxboot.com/kernels/6.18.54/x86_64/vmlinux.xz',
+        '77bf44cca48c9c1b9c142e16a2311d58b8ae3462b61bce44bcaf9243b5f26628')
     ASSET_X86_64_ROOTFS = Asset(
         'https://storage.tuxboot.com/buildroot/20260924/x86_64/rootfs.ext4.zst',
         '8e310455b0244414ccff29c507f7ccfd4032e3587cc405e49ab0322738e3e27c')
@@ -47,5 +50,20 @@ def test_x86_64_kvm(self):
                            drive="driver=ide-hd,bus=ide.0,unit=0",
                            accel="kvm")
 
+    @skipIfMissingEnv("QEMU_TEST_GDB")
+    def test_x86_64_kvm_gdb(self):
+        self.require_accelerator("kvm")
+
+        self.set_machine('q35')
+        self.cpu="Nehalem"
+        self.root='sda'
+        self.wait_for_shutdown=False
+        self.common_tuxrun_gdb(kernel_asset=self.ASSET_X86_64_KERNEL,
+                               vmlinux_asset=self.ASSET_X86_64_VMLINUX,
+                               rootfs_asset=self.ASSET_X86_64_ROOTFS,
+                               drive="driver=ide-hd,bus=ide.0,unit=0",
+                               accel="kvm")
+
+
 if __name__ == '__main__':
     TuxRunBaselineTest.main()
-- 
2.47.3


