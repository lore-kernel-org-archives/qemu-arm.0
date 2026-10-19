Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B00606A31C
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=chkDOZWU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIt26-0001PK-CB; Mon, 19 Oct 2026 15:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt19-0000a1-Hq
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt17-0003Al-Gw
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:31 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48df4f540ebso1369633f8f.3
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438048; x=1793042848; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=gtJIuiD6IgmZZ6Fngidu3aK7yzPsm3ikKpy/MHqPRF0=;
 b=chkDOZWUPNQn1GUr2htRIlEf5R/JvUwMgFeDKdBsiMgfaaw8+TrZrP41XhRJShg+BJ
 //p/JHMVtJ38wkD+iyf10+7aXRtqSllniIswkaVBCGH4plAwudcWvcvDHS0ll+jW6ARW
 /Ke+ewajMzGISxXXq6Mn4mq+70FUnmdgHYm8B6sua6XkPSYfj72l92KwdLPQMcCUqFT9
 S+ysDlxmlrbm2wCFiaOtR236JVSqKkHHKTg+UcZ31vUKOaCp+JInlppEc4FH0l/t4ej+
 T2i8Nak0WYV8b/Tp9dYB34lDKsH5/XrD17UBpPSVDbyaRBfw/UXl5E3rIx9G+EYqndEi
 m92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438048; x=1793042848;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gtJIuiD6IgmZZ6Fngidu3aK7yzPsm3ikKpy/MHqPRF0=;
 b=VxfP0k4wy6UnsKbEouW1s2X1zghA6waDvtMnp2cKb2uq1aCSa3RP8AFgwYxIKvS4Hl
 RJptOq9kGlOnq1gu+XXXT9epRadayjkOMOiOWzHQxzAcJ+iq+b9Zt46nJdO5CPorbRsJ
 aPMTAHg5ZVYX0TzjY8EYcUznh2gxjmqASDoP+MQC1mSuAUw/X1KhdbimMoUaABQg63HS
 YIcbIoYVWm8R3RbZAa0GndLLSD70cEOo8h8U0R9UMikec+iqO4mI8G0p81Oxv/VuF7V9
 80j8Xul05dr8p7Zo7K973QqnoTdUNHEUsH8WWVR1PV4+1dFd54kxw91EQSYer4nKd0OV
 mJAw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy7s3+iipQXqzoKNzkIZAp/wJ095Ihv4zkQx60mzf2u0JJAB7LgMJbiA511aNakTINvp/jtfRuevQ==@nongnu.org
X-Gm-Message-State: AFq9FYK33WCFHRkimCHChCKMBdLyjCJDE9w+9fpgh0405xUTI+krZ/IM
 m4qG7TspQ1BZeLkbPgNbTsZsN8z90Gk+uHSu5j/CuWh/LIvpkZZJlHBKqoOrYtkkO4o=
X-Gm-Gg: AYBFou3ggJ2BzokUY6GVxhx0CQkPKuGQgJ9OAOBrufFdEmoj4D/QhsGxWoZ8SR8+nUo
 G9M4kGlR/sErnUTOIUeHyUrh0mKP8ZR1JUpOqstJ230WkX0ij15VcbnSljjttiHyVjd/f2/0kb9
 ERHNK/pkfmBZcjzvRUlmDzGTqzcPXquLufO5BU1rzuS9DMGPdQ4mfSFl1YXojv/Gp5JC+W1JrtM
 Pe+jSNlZn/cNrmSZPYuNoFhpkUEsFjRSktWHL5b6Vp6cFctBYeydJPiAmK+d+yJ4X/oqe/ORYET
 l5KxlTIAdYm0Mkg7USJpm8zHbxWJ4uvtrfuNRb/eL49H7dF+y8sbYKbEQg+ffHyRuKnhzeJEv0K
 9U5QEhNDJTdQietSfz+AzBvL1vW79aEE2OlRcEO1XrjLKNTEJ6gw+HyomLYjfVuHKvDiPLnuHLH
 uAtbLl9kwKwG3+/uyRkn9GNBScxt6pc0bXmUKsZ9LHC3RfWZ5LhGcV/jnsmwT6220xc7vqeI0=
X-Received: by 2002:a05:600d:82e1:b0:4a1:f377:5c50 with SMTP id
 5b1f17b1804b1-4a1f3775e78mr9151115e9.30.1792438048066; 
 Mon, 19 Oct 2026 12:27:28 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2cc809csm13254295e9.8.2026.10.19.12.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:27:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7B1145FD57;
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
Subject: [PATCH v3 14/19] tests/functional: split aarch64 tuxrun into tcg and
 kvm run
Date: Mon, 19 Oct 2026 20:26:59 +0100
Message-ID: <20261019192704.3220373-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an explicit "kvm" run to the tuxrun tests. Although running on an
aarch64 host would probably have defaulted to "kvm" anyway we want to
exercise specific features later.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260930164649.433573-9-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - pass "host" cpu type for KVM run
---
 tests/functional/aarch64/test_tuxrun.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/functional/aarch64/test_tuxrun.py b/tests/functional/aarch64/test_tuxrun.py
index 7dd50c3de17..0ef1b126fae 100755
--- a/tests/functional/aarch64/test_tuxrun.py
+++ b/tests/functional/aarch64/test_tuxrun.py
@@ -32,6 +32,16 @@ def test_arm64(self):
         self.common_tuxrun(kernel_asset=self.ASSET_ARM64_KERNEL,
                            rootfs_asset=self.ASSET_ARM64_ROOTFS)
 
+    def test_arm64_kvm(self):
+        self.set_machine('virt')
+        self.require_accelerator('kvm')
+        self.cpu='host'
+        self.console='ttyAMA0'
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_ARM64_KERNEL,
+                           rootfs_asset=self.ASSET_ARM64_ROOTFS,
+                           accel="kvm")
+
     ASSET_ARM64BE_KERNEL = Asset(
         'https://storage.tuxboot.com/buildroot/20241119/arm64be/Image',
         'fd6af4f16689d17a2c24fe0053cc212edcdf77abdcaf301800b8d38fa9f6e109')
-- 
2.47.3


