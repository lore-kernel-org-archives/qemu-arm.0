Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C521B606A31B
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 18:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dEJKVan/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKJeT-0006mA-JI; Fri, 23 Oct 2026 14:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xKJeL-0006fR-Sz
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 14:05:53 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xKJeK-0004YT-8v
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 14:05:53 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so973271f8f.1
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 11:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792778750; x=1793383550; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WaqUj6WEGN6dVwMOoOZBYZN/P8vE1I0eY8vio88JriE=;
 b=dEJKVan/OoRC3xkMaPVBBPxKq70bI9dNzHOHLp59d2VU8gZQE8yGK3W5Nk/R2MzSUR
 NhLcacJkg0ofgJSg4cvu1HSg4hLWnrvkdPQpbfso52h8uueBXF+BypyyqYskTlKw2MQB
 BwVv2TAifanpHtLliu3fovnMxUpxwYvcuwTMpiTlW3nr4IKVLfcgfFsIaCsdOdiwWwFe
 0tRLjuDNl4B/DOGHOVOgseW9IUTbtTwQPbwehUl+1EvRFEEfycc1E41/yrjyL/ASQDDk
 094flsbYcdm4MiNk7CirO4BIIp5ivFH8mCuqxHqtNQ+6w56IbqYp5pDZPUO1rVs8cdZd
 owMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792778750; x=1793383550;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WaqUj6WEGN6dVwMOoOZBYZN/P8vE1I0eY8vio88JriE=;
 b=HSLOw1UyAYY76eq+tNDZ1drwBp6CXKHxonTJ0m6GO2e0RpQtGceRzmsJqU7ZpJS1fy
 ZwmpxtwNOROu8TDLucrFcY+FbKovdPfeg3swjbzHb5xEoRoOw6bPZXhZ1ricJ9XnYxXS
 aQrPWqqMPqQ6vrKVgme3CJBMBY0GE1HYCXmGqRItbx3bivG9kto+3LXdR5GyOVrOqO0+
 vSESYjHy6nujVsWBMIzZkaQqZ5xVixUiSF2mz58EehTio0PgcWXmyrQCZfNAX3Ij3hbZ
 JuLr/r13Vd720aws2h7kMWb2zP0z63bHkr/9K/aljbcLLWpKur1Y3eTp+wsE39uvQ9Iw
 AgTg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwNYy3mgZtCELV7YZIuDk32CVQdWs5zl6HWkLQW/WAYa8wAFAh27jqIQ4EdH51d8PSvklFutGPzlg==@nongnu.org
X-Gm-Message-State: AFq9FYLnTRlnI/fBFxiSW0iiADFT5NyyZV91/kh4MyXnDyDH6WiGUdxt
 rcujz0UMaW5s+B4IL5BCOOlN+Yjkxu0dZz60932wQTGQf2eMtYXGvb4wxoYQsC5tEcM=
X-Gm-Gg: AYBFou3I+BicZUNZkVNLAw0xx6KDAYcG+asOTz1I3edZV7jF5Jac1UgMvnOwCg2urWX
 1KB6lBBa+AxgNK/wb/e9fR6hEBV9/nCIVLCBM0LiQthxg1UvPvX+q7akXJAAcqiDYYFD2/Uwt+h
 Z0CY5pbnnMKMfcInwAu6ZYdphUEZxjtGvAQz++ajkMi8zNSWe6X35Y8nKUXcs31Zm1zJgibDPpY
 YMxP/uSiy3sPgnv6dE8UZ7TgmGuM2tQ4UKAhuR78Tt37CxCO3zYSSdYKmJIqt/MXsvmEvlxORv9
 ZHCg0eyEMDs+eV6os8Wn6eQos+odO0dDtclrz1lOcFDHW/OdPIorhpPSLmthbuHTgRB24jiGhHD
 AGGz3omQQ21Lv6wK68GLwxal/iJ0eWMDva4a1LY+vPUG9x7RzvrXmPvXDGddWvgrm81BDYEHfdV
 uGExWAQYI8/E5+NbQ2aqLlE8ig/xL2Grz/j0j3bQLnQUapQOH6LkP36J7/4zgZNrloUOjbiUe+9
 ntlzLV9hOzMmK8cfAoTCOrJAb3Judu7kRX0zeLdngcI+yQaOtDltZ0=
X-Received: by 2002:a05:6000:26ca:b0:48a:f454:3d4 with SMTP id
 ffacd0b85a97d-48e385c07f9mr5076201f8f.53.1792778750540; 
 Fri, 23 Oct 2026 11:05:50 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3d42f4bbsm1347760f8f.58.2026.10.23.11.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:05:47 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E93C661186;
 Fri, 23 Oct 2026 19:05:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL 14/19] tests/functional: split aarch64 tuxrun into tcg and kvm
 run
Date: Fri, 23 Oct 2026 19:05:32 +0100
Message-ID: <20261023180539.1574134-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023180539.1574134-1-alex.bennee@linaro.org>
References: <20261023180539.1574134-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

Add an explicit "kvm" run to the tuxrun tests. Although running on an
aarch64 host would probably have defaulted to "kvm" anyway we want to
exercise specific features later.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20261019192704.3220373-15-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

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


