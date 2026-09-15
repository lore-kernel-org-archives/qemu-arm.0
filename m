Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9522C88E77
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:20:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ZbQ-0007mj-IF; Tue, 15 Sep 2026 16:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZf-0006sX-DK
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:22 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZc-0003JV-Ha
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:14 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f62ccdb1so34968f8f.1
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789503371; x=1790108171; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dM4u0r6eILzCbZESrBWVF/DDnjUwt9qXh1+CvKMqj6s=;
 b=XuqjymPAcHSzvA6yTHZkwnRwL6e5klvbuBcfWhrl41DPjUHkiKVg1KgNMCdf8H3WLT
 fqf0ae1r0GTIgBsub7dh357/EY8cG+0ue1kfoe/ocnItiJWa5f+/ZFbTlsvTEVpl3MQ6
 upATmzkWL9902VjSJDLsDhi7wCuze7ZsUoM8td9ewd0LNM8H0IJ3eKfPUIFZsXmt1g60
 YtkkXbfp0DC/PPQSflgs0ZdDy6dj4aSe5VOlEodwZ4DpHMwsg8m3nj8SpLEGmJCC5RWx
 FnV2ntziBN6J5ho7QQb2fR6F1aZjuVwVP+hRcCePNQ57N4Tf3p6j++PkE5cozVynwOW3
 YmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789503371; x=1790108171;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dM4u0r6eILzCbZESrBWVF/DDnjUwt9qXh1+CvKMqj6s=;
 b=HEq3lf2xwz4PNWY0aaMATorxN6qZKplW+loNlAn5XGSQlCiMBVabbnw2BPAfsUWHzN
 5u+3+WU0vcK4mJgNIv4PYG1qDiwh4LI0pSXh5OLJMJJqq024xEh5mIY0d+Htb8QZ05vL
 yZSNomnpFqLuMWJVjBj/VuWwy3BC6uB+/v07cWtylFw9OxTlGHsY11/tJAm7ojj8xUEF
 E9bYjLUKKx6d0X2vCcamWEDfjzIjryeir5k5ZnIQfV+UlUDYiWh1fhy4Oyjp9LUVybsM
 H6CswMyGueiTkPAAaGwnnmZgxeuSSfYYXc2EQY88egmJVLMY0NIumvH4PWTTRH4hIEv9
 GbIw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxTJDWndVCzn1+ybBvxAWHSp8J9fOxhJJ9RKobQ4zEaFXQENbenjeX2jkAvOei6g5F8daLuIkiv3w==@nongnu.org
X-Gm-Message-State: AFuF++kydwl5iyAY6P0MUBsppV7sGuL6Kd/TpiC9IeFlfGEJ/dnqrzti
 GllUHqzqgedq2ZN7zMgsBpdRC7P2E2fcG+IcLa6rHGPBznWQT8Ov8uUqufrskWqKX+k=
X-Gm-Gg: AYBFou1YFD/3bpD0ndfn1h6uUBLIs60kZFqt54JH8FnWKTiIym8uhdh+Lm2ehdEfMQo
 BwTFSRL+0bi420tP4rbqs1ECeO2x3j58FqKeYXT/s1u3id0wB5iZLUzSfMejYE7HbiMukLGhrKM
 Yox+kt3++MB6FEcD0LKJfcLBHMhGda4gZiHBcrYL3PyRr02KZ2HZCCzaA5HeEG+tXM7/7hHGfx6
 M8KebJJY0IGHGNb6WUjqnU8q7zN5jJtMgcoqVuhFFzf0utAHw4fpJJmTt7S0K1FXO4C827zcK1C
 2UWIBzfmhme8SwumabkHOlB66UqXVt0H4WYrUh+/nHt4Nz3XvR6F1XbveQTigAs/YYo1SvPNmbL
 hoDicJ7OX84IbFJOMBlqsqvtQRZALCz8kq57F9yZ28p1JQ9E0g78Hqy5+4cX9Yn0S7i9UmfUkcW
 RByttBaYIdbnEUBghcz0TQ4BO8VRELFciTwpeZ0BlTE43Q6myQ7MXXeocmIteiwUWlrJnMOMWB
X-Received: by 2002:adf:e589:0:b0:486:f46d:e77f with SMTP id
 ffacd0b85a97d-48705a4fa47mr5817998f8f.15.1789503371019; 
 Tue, 15 Sep 2026 13:16:11 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf342a0sm1392279f8f.24.2026.09.15.13.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 13:16:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2333E61929;
 Tue, 15 Sep 2026 21:16:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Kyle Evans <kevans@freebsd.org>,
 Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v2 14/15] tests/docker: fix brown bag typo for docker-ccache
Date: Tue, 15 Sep 2026 21:15:59 +0100
Message-ID: <20260915201601.1207839-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915201601.1207839-1-alex.bennee@linaro.org>
References: <20260915201601.1207839-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr2-x10.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 85825d74dfb..fa873e09b4f 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -197,7 +197,7 @@ docker-help: docker
 # Where QEMU caches build artefacts
 DOCKER_QEMU_CACHE_DIR := $$HOME/.cache/qemu
 # Use a global constant ccache directory to speed up repetitive builds
-DOCKER_QEMU_CCACHE_DIR := DOCKER_QEMU_CACHE_DIR/docker-ccache
+DOCKER_QEMU_CCACHE_DIR := $$DOCKER_QEMU_CACHE_DIR/docker-ccache
 
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
-- 
2.47.3


