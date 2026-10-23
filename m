Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC17606A31F
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 18:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S9oywTP+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKJeT-0006mR-SD; Fri, 23 Oct 2026 14:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xKJeN-0006g1-6p
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 14:05:55 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xKJeL-0004Yq-5p
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 14:05:54 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso8861255e9.1
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 11:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792778751; x=1793383551; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TR3LK62ye5AWbtowHSFgrt6xShwiFtqor1jJrpv+10k=;
 b=S9oywTP+/BLwE6zMGHtImkxahTvCN8F5E7xPwKF2juJqTiB/Vbncmb/0ebW6Yk0uV3
 3MGAfLfkS4EDpmZUQax8bQJO8OdIYfVn0KJQCGjuI1Tm8UUjVBNVhWW4RWNSJXMLLmVV
 kG6oKz4gaWWZwTXkXFDNbiQZe9S/LxT+wl4/8zIypLRBUEno3bItV+fabNmwrr9wjucW
 hpcIXUtmDtuEbRxt+C1uc4OBMH4cW03Kbx2zGPjkZX8Q2Ogim7tHyWHQmp2G+2av6UBE
 sUphojxn8Q0oP4oUrZUpX4bF29lnSlMYbUJ2hVGItP4OxTU9nvrrFq4EiEEjsjwoEZF6
 iZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792778752; x=1793383552;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TR3LK62ye5AWbtowHSFgrt6xShwiFtqor1jJrpv+10k=;
 b=tRuQxCNml0qcILxpC5OJUHpoT5MS8UCNVWGqvzC86gK4i5NSECV8iIEmrf96xOBMal
 rR/Df6O7gb+EiOjrk9PhGNKZAkU8els6p/spydF/ge96WSsit8MPUVwjALz61ifwErQW
 SbjlnetzU2a1JvmMIunHIjq26f8aHgR/XPKNu0ma3/ALw7fXnWFHDeb+tH7SiQNly7eM
 8hZtnP2UXRE7ATTklx/9qo+1gyr0RVkbSlpEdZvln0cYpu7I6YhjCLBP8RFIUxpw+4Ap
 wzpdiiiD6D64bFXxtFNKGbcTZjYaIxsa9D00pN8tBOiYHLHwe9wzg9Fo6Ihn6jtY4rAb
 84Wg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxDUqOpdssX8JRl2ZutyNzY5tmWlaEzoX8VQ3I19QI6P0HeH8V9W1y8Y5+Duo8wupAbqGlpONDeZg==@nongnu.org
X-Gm-Message-State: AFq9FYLapdcjhEpRziNokF6LaVvT0Eb6dHU5wTjgNf7fEC4IUGCz6sYq
 UD9zX1Zir8redJ5yaqRRtPGPUZ4nUUqzVk0ydTOZI9Hv+259vj6JuifX3GPbU7e9a0IO8jpvM3d
 2zu1hrMA=
X-Gm-Gg: AYBFou3VpcferR+mBpYWp5FyctIQxEowxrJDNtNevoAUzdJlqI+eJQTZd17+ak1S0Or
 mgD8YamL5k5UWUYW/MwiGHVWD5O19Q7DaQ2o8Y06wmN+6TDttHpUpvZDaz0XlABEox7ondMSE6r
 ywJBbVfWhR9D3VkoEBvDAuSmJlnB9OEHwIIdUAyyr1Kpg1z7t7rU4pQGv0FBLXEW1PGtKa8gDPR
 hR3LyyjbBRtKucgl/LffN/FWqk3tFfRy5gxBHzVB9SQ1luuzfQ1X82C84EU/KReQbNTL1+zbr5z
 df+LV4E+tqip9SG5QwEHqtebjduCTOow0TCpBC5RXQ87ZI2FcT9d85QLGzI2fhRtYYJBVrAlOfO
 NhSQ8we7W0XHMjZnRPTufplLfZXvDf1+OQZvJEgUziYh9ilqlLIsQAxJTI7u3unv0rFNWQxlifU
 r6GazFWxd/uQIJBv/C/fDGqn6LlLleG7kv/J3sXjD18Mia7T5jruc8LcTqUEygJpE+h6YgzBSjL
 N/7RVkUsPJkWu+CNOhYY9yAgkMIQVqrCQkZUvurngzf3Jkno04VFOs=
X-Received: by 2002:a7b:cbc9:0:b0:4a1:efba:511 with SMTP id
 5b1f17b1804b1-4a211f0493bmr33427555e9.35.1792778751505; 
 Fri, 23 Oct 2026 11:05:51 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3d3f9f28sm1219106f8f.21.2026.10.23.11.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:05:47 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 105A0611AF;
 Fri, 23 Oct 2026 19:05:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL 15/19] tests/functional: update arm64 tuxrun images
Date: Fri, 23 Oct 2026 19:05:33 +0100
Message-ID: <20261023180539.1574134-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023180539.1574134-1-alex.bennee@linaro.org>
References: <20261023180539.1574134-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

We now fetch the kernel from a different location to the buildroot
image itself. This is because we will want to access additional kernel
metadata in future tests.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20261019192704.3220373-16-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/functional/aarch64/test_tuxrun.py b/tests/functional/aarch64/test_tuxrun.py
index 0ef1b126fae..6de02e1d8b2 100755
--- a/tests/functional/aarch64/test_tuxrun.py
+++ b/tests/functional/aarch64/test_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunAarch64Test(TuxRunBaselineTest):
 
     ASSET_ARM64_KERNEL = Asset(
-        'https://storage.tuxboot.com/buildroot/20241119/arm64/Image',
-        'b74743c5e89e1cea0f73368d24ae0ae85c5204ff84be3b5e9610417417d2f235')
+        'https://storage.tuxboot.com/kernels/6.18.54/arm64/Image.gz',
+        '39f4633bbcb444267d4d829bd28d8868a287c4c160cda64b0fd23fb090571c4e')
     ASSET_ARM64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/buildroot/20241119/arm64/rootfs.ext4.zst',
-        'a1acaaae2068df4648d04ff75f532aaa8c5edcd6b936122b6f0db4848a07b465')
+        'https://storage.tuxboot.com/buildroot/20260924/arm64/rootfs.ext4.zst',
+        '4ab8cec9d1e17dbb1abdf2ae1939ad4f9d0dc2466230f6a119a7c1845cdef0b1')
 
     def test_arm64(self):
         self.set_machine('virt')
-- 
2.47.3


