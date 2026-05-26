Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE24CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 11:05:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRpZB-0002lk-8V; Tue, 26 May 2026 07:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYr-0002bz-KY
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:03:02 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYm-00069l-1Z
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:03:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-44dd5cb0f81so7498400f8f.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 04:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779793374; x=1780398174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bg+tgRoSaMVPlPZYLq68vWgTbA0wBm36ShtmfRzn+V4=;
 b=Np8/hd7JJBxo2aVXL4UM3uyuBmeDj1gbSdTMVdPaamgkH1XqV2mwK0goBnpxzKOlbb
 Sie2oum3PjxLAAesCm2Zhdo95ABNcXlVMtEg75cwkEj2A7zdJ8CEyBe+yxKJjYSqf3wI
 U00FhXFskcS6pDn1fKF12z0MnXAP9benrZhme9vThVdpNCQmkgaS96OrL1GYYbuKadzi
 ZRdAFXa0gJSmLY02At0Aor4N2g5ZIvJRg0wPyjS+TzKyMjc6QH/cH+cPaI042R1hFjAI
 0moifBfkfwBujwvSDEmAPxnd1zfTAr0HAvENs5NeEZ65bXeKJQcqJAgkHmh6NM8Z/qKF
 FRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779793374; x=1780398174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bg+tgRoSaMVPlPZYLq68vWgTbA0wBm36ShtmfRzn+V4=;
 b=OYnS+5JV9h9ZIkPj/Jl5bq4QZP4ONZl4loN3N48SHnKM7F5gaicyq178sETHpPK2+u
 4l+oddnBBvxgUEzGXxp6yWoJIVy018aRGUKSdrX5Na+fsbpHpgAEFuOC0/3dRdWT1o5V
 jtkJJtCkEuwvKHmWkejhKRMVtpjA1WrpeydUWkXrMq/Vx4YlF7oZ348q/0vKMckgzB19
 2Hmxivyc2LTjnkAccPzKFt05Lg95h8VOR22LulwiG7zK94cALTcu0HL7SLXiVTzuvPFy
 BAJU3OfgZqY6NzwI3k3c9peY091s5E+Rb7PTUXDFZcI9NG9gIdBiMfAT2sTJFx+hhhev
 KHfg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/wMTijb+4hBIkgABsad6TdLJx2h11tsoy0099pcwo9MkB/uATfpianfPvylp6hyEgZHVcfgZGytg==@nongnu.org
X-Gm-Message-State: AOJu0YxX5u3Un+82JcNdr+w/nACy2FLCjB0FXGYnQrb9IT+EyLE9g946
 7nsZZyVignWvImqsVfA1+r1c5mPAcmH91AC6ikIYJ7gevRLstEJwJ6oanFvTjaqAmvo=
X-Gm-Gg: Acq92OHterco2/cRrNyewmQAQGmC76oG5OMni4c3IPeArTN2BIIsiMBqjZ26xXEoCkb
 5kHI4PAd1+2PSC++XKHgtooqondkNA6VKLtbeidsl/pyP2POhbWjP0Lnn1w86tPTU+oFgxvi+5Z
 +mPCq76jcGMsdit8kCje0x4dbaQb2cTKxUI9YyX+PmfJzqbA4qKGSt/KJz5wbSlhZu0V6G5HgDZ
 u431wsdq2yhplDSYw75CNm/XXx8OByl4/QzlF4n4z7636/brEl6Bjn00uLnag9A5Z6UBsdhArHL
 SE/li/gRkQulQHy+3ZJp2A6z5NAe3MDKSepUHI/1oShfxwRG+Pt0UI/yqisJRxolheYlUGV3KXs
 0vKUW49TAnAQn4Jntvt776siQWQn79kseXxfqEXOp9Wpng5g1a0Y+Fnh5Erl27oC2JxD2R8s/+w
 SPy0jPzXNqWjwLx4aSbwRcOqA=
X-Received: by 2002:a05:600c:a402:b0:48f:e230:29f5 with SMTP id
 5b1f17b1804b1-490426b0c92mr214245655e9.16.1779793374516; 
 Tue, 26 May 2026 04:02:54 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561f2dfsm300944335e9.12.2026.05.26.04.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 04:02:51 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8F343604A4;
 Tue, 26 May 2026 12:02:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Subject: [PATCH v3 11/14] MAINTAINERS: Cover debian-loongarch-cross.docker
 with LoongArch section
Date: Tue, 26 May 2026 12:02:39 +0100
Message-ID: <20260526110243.470002-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526110243.470002-1-alex.bennee@linaro.org>
References: <20260526110243.470002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260518102222.80735-3-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 506f8d62467..31500ea2660 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -280,6 +280,7 @@ LoongArch TCG CPUs
 M: Song Gao <gaosong@loongson.cn>
 S: Maintained
 F: target/loongarch/
+F: tests/docker/dockerfiles/debian-loongarch-cross.docker
 F: tests/tcg/loongarch64/
 F: tests/functional/loongarch64/meson.build
 F: tests/functional/loongarch64/test_virt.py
-- 
2.47.3


