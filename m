Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F74F606A321
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xFHVEfbx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMnJy-0006Yv-Li; Fri, 30 Oct 2026 10:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMnJr-0006Ez-8f
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:10:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMnJp-0002EF-At
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:10:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so7848605e9.2
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 07:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793369456; x=1793974256; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WvmJcfzcBZbcUM/VumQm7BRuMbxxTTlsqPpIRvc+9u4=;
 b=xFHVEfbxpnDjdP6Az4J4FgL38niL7U3YRIYgjwup1QZ6WyGkARVGPo6oqgQISvx5KB
 B5N1CUlIQjj1TF9NEosyNFDt4HMp2/NiB5K0qJChh2QAjAhgPS0e4Q3lsepOAJ4fQFhl
 +zata6j7QTZKMWt8yw+JtVYEfTiWhIZp/ZFd6dypYb6pJHn1HaAe0oei1nNHvN5+lKlx
 +KtJ1iDSFrBo/forcUxC9MPJBQacSn9dqzrU5L6yvUNwbo6o5RWx12i33J/Ki/07+TqO
 AKUzZaCYmouDUTb3ccvhIjB106oAwsAnUgILoX7wu0SnQtCfIVXKjGC4lr5XnoVghwTF
 5Swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793369456; x=1793974256;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WvmJcfzcBZbcUM/VumQm7BRuMbxxTTlsqPpIRvc+9u4=;
 b=nOnMhpY/Or9/80sXhQffZlMSo1P3cXQR5d3d6Nn6Z0XzmQ2frDNhejwOAO3NWOSTmV
 98fFyhuNVMTcwFt1qVaIepeJq049zgoN7tz+kmaOzDi3DtJXis2xUg1QapQr0sQSAQRO
 vTOp0FQbnUVa//dPORrXqNdPN3Tlutz+Kf9vagla5BxTV6niCOVmWS717/niUlTr8ses
 sb+cRMyg7CM6UcNVyHtoLpAIa2EcAHRPnJnhlnu20R3QqnuRwDOj9qbxtoApgiZ9sDd6
 OksdRTxcjs8gbO/WA6T7cr7h372rFwZ0AI/Yk4EF7lTHOcLqQz6asfDT+kSHfNcWMJ2R
 5c1w==
X-Forwarded-Encrypted: i=1;
 AKwUvBz0mNs8oMnUJEZhSWfjQy2ZwR6hPMeI2ZH6HMfCf0oB8e016fETjFtI0pZkTwV7FtWvKn1D0a5UQg==@nongnu.org
X-Gm-Message-State: AFq9FYIe0TnwcOF4+88+atHUGtSx40FODgYUrNSnm7d1GlAq5sQPWWgI
 x6GbXgAvuhZtSP5IrgUuozGgRetpLJKBOSEITL3DwGNCm5gzlOUGXUKax6XAVEaYbgo=
X-Gm-Gg: AYBFou0x3pGzwZU3/dKzv0UXLHvyXfc0D+rG3YwL05wBCAD7lEMILruX+idO9A8Om/f
 96Sq9DB9vClSJXj0AOQM+4O3ARFTCRFg1aK45RHaSM2zmOUpjAl9V5MfMmow0s+karoxEDihCpu
 nAp1b70VjFodWOUqE9RpZUEBvLSOUv47aL6qfLvKaCsNWCAgEhxEkiZFnmjKk2EcSpD/YZxjVpx
 PsPe55oNYonJt9bhdxfy0c16ZiBMR9T5WxyhmT8bfgS1NFYHbclpLaX5EiI1fdbL+ga3JiKnta6
 yGMFjxq6ioQV2RE8j3t/0lTKAdlCG8OnbeGj5D86q73+Exg+f7VBup5jZ/JNLpDndNt7iMbptxe
 IBKGVeV9PsFbn4HtWbyhOYRaldeykewlT6DoKNVORTlxYEV4WYP7A3U0VDDHyLh///CrcFV2WoN
 qrx6etCD4xryAVKXbI8GBkyqCQARypKFHNglp5sFSehlZPheCAnOE7SypM4h3ofaOJ64V7xu4fy
 +Zp7jxGWSzwm4/h4QBflNKbZg6ADUED77xO617T23U5TiJKDb0D0GPzRkljpNdE9BV59QwauOAc
 Ztosx4T1VZEMdCibsCABlyIkK4Xw
X-Received: by 2002:a05:600d:82ea:b0:4a1:cfa7:e968 with SMTP id
 5b1f17b1804b1-4ac17ff9be8mr58270255e9.21.1793369455744; 
 Fri, 30 Oct 2026 07:10:55 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf5b27e46sm99393125e9.3.2026.10.30.07.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 07:10:47 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8E3C35F9D3;
 Fri, 30 Oct 2026 14:10:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 4/4] target/arm: fix bcm2835 migration issue
Date: Fri, 30 Oct 2026 14:10:46 +0000
Message-ID: <20261030141046.2710206-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030141046.2710206-1-alex.bennee@linaro.org>
References: <20261030141046.2710206-1-alex.bennee@linaro.org>
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
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We don't take care to force re-validation of the config on migration
leading to a crash when the defaults don't match the migration stream.
The other frame-buffers seem to do a similar thing in post-loads to
address this.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4668
Fixes: 5e9c2a8dac19 ("bcm2835_fb: add framebuffer device for Raspberry Pi")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20261029161310.2065290-9-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/display/bcm2835_fb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index bd58f625fcd..c5731521b57 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -352,10 +352,21 @@ static const MemoryRegionOps bcm2835_fb_ops = {
     .valid.max_access_size = 4,
 };
 
+static int bcm2835_fb_post_load(void *opaque, int version_id)
+{
+    BCM2835FBState *s = opaque;
+
+    bcm2835_fb_validate_config(&s->config);
+    s->invalidate = true;
+    qemu_console_resize(s->con, s->config.xres, s->config.yres);
+    return 0;
+}
+
 static const VMStateDescription vmstate_bcm2835_fb = {
     .name = TYPE_BCM2835_FB,
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = bcm2835_fb_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_BOOL(lock, BCM2835FBState),
         VMSTATE_BOOL(invalidate, BCM2835FBState),
-- 
2.47.3


