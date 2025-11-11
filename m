Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6013DCCFA1E
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:20:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs0R-0006k5-15; Tue, 11 Nov 2025 12:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzq-0005Zv-Qi
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:38 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzm-0003uz-8o
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:34 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso813794466b.3
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881448; x=1763486248; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzQZP4Y3OptbZQiANnSpA5RTAqNZbiZmndRZjZG7Xks=;
 b=HRpg7QzVU5VjJb0F6qEKCSPQrbFxNm0Q6H71sT/6AoFRD1UOpcUaHpQ8FDjAp351ev
 Iz4S+VppTAfp8DX6jQUedkp3hpIYr09zL4Kl51LyP8eP2irqBndnBJrM3V0zEWGN1n5n
 l7GYmc3XZB0deNuEjKA2miZo39vQaK/O0FjjBQB5CZ1BSqpzw3lduvHPAMgaew6KViTw
 IszYUVGGJYzw4vkCORe2mVYh/3TreYoyzABdOrK0//5uXiQkb0FjBOBLn7r8HE40JYbP
 leE53HxDH1r1ngpZf1GLfg5/5fRGKNL5C5TIa5N9TsdLx+L7UMRrCT+gxRAhjtK1Q/3C
 /mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881448; x=1763486248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OzQZP4Y3OptbZQiANnSpA5RTAqNZbiZmndRZjZG7Xks=;
 b=CnAi2Q42RrXydSsDDw/F+1BsBs27+m2a/nQ1o7FSSQX2NfjAYfRYNl6m2AL+DjELox
 +t7rF0+JHedCSKYrVccuIBQjKVI57yqCmT5q1/t83+KhoTlqJJG0CtQ/QzTSRD4W+8BP
 K5fgkYPIREScUH1FIr3klG8AQF6x5DwEvx5Ceny99DfMfRsPV0LWLMVRaMgHsgm2woUL
 AfBXUS6jxO8mG8GB0x1YG4gMhiJg01DOkizxU1mScfnnsraZy2IzOVUp0+nztECDRvPJ
 Osi/V0i1YWK+S4STyI1igTfHt+Tj8nCukr3PiruosSEp0ASB5sn6bxavr1fv2aLCfqz9
 owTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCSJuXbbpv5BDqjqcUFHxTg7sKATVc5uadYb+STDX12vnyWj9E64JFoy1n7Ggtfy61nuNzaNkwvw==@nongnu.org
X-Gm-Message-State: AOJu0YyMVEP//IyUw6dOlEdDtP0svNZQ6CCgO0HbIPcvIfS+J5SSPHel
 e1+PCEDwTGtGEJbRtxMJ5ocd57Ro4Jvdsen9iNEejEYdLR6xlH1ddFBZ7GEkpZ5jsxM=
X-Gm-Gg: ASbGncsb/QSBhxMSLcI8lrhvN7ef+6TTKL8aD/HGIQcBKBrhaypXcQrRiiyES6uoNc9
 XjKYeBXUxzSmNutxy/orySOjbFJebfyBkWE0OzEL7MzJK0L+wgwM0RaYHZs4KGWFpFSfCfpRUUO
 qLg8FlvxDwA/IEL+RyyN4M1nistji017f3TgOrOO9tAW+Gwn6rM96eKT42C7xvGTI5ETPkWdmKJ
 qBEDwg4qK98t44uVir0hbPWvsqzAnjK3RC7OYipoj82RdmyYvJT5POgKxxI/TzPq94KevSs7Fuw
 RoqqEz6FlexXV6Y2zwCk0KSx5/yvXbBlZ4eBnTzDcwfK4+vXEAMb47HhRq2XIPnVpbbRus/9Z1G
 vKt3ELDYBORac3y0nvXMhX93amP4tqQss29R74POM1iTdbNJJL8KRI/yk9DAYDYydIjVumUTOku
 gArww+wKT5Su4=
X-Google-Smtp-Source: AGHT+IHxICJl5UFBz8yK2n3dYhQFXsVP6b62miRVnToeVp0HWXNuOWm1+jnsASE4qGQJklN9WDBNEQ==
X-Received: by 2002:a17:907:6d06:b0:b6d:4f1d:8c9e with SMTP id
 a640c23a62f3a-b72e0305025mr1273596066b.24.1762881447746; 
 Tue, 11 Nov 2025 09:17:27 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf31286esm1383522766b.21.2025.11.11.09.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:17:25 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 556F95F905;
 Tue, 11 Nov 2025 17:17:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 01/16] tests/docker: drop --link from COPYs in emsdk docker
Date: Tue, 11 Nov 2025 17:17:08 +0000
Message-ID: <20251111171724.78201-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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

As we need to build images in both docker and podman lets not have any
incompatibilities. I don't think it makes any major difference.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/emsdk-wasm32-cross.docker | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/docker/dockerfiles/emsdk-wasm32-cross.docker b/tests/docker/dockerfiles/emsdk-wasm32-cross.docker
index 6b1642a207c..1f08eb0b855 100644
--- a/tests/docker/dockerfiles/emsdk-wasm32-cross.docker
+++ b/tests/docker/dockerfiles/emsdk-wasm32-cross.docker
@@ -115,8 +115,8 @@ RUN mkdir -p /glib
 RUN curl -Lks https://download.gnome.org/sources/glib/${GLIB_MINOR_VERSION}/glib-$GLIB_VERSION.tar.xz | \
     tar xJC /glib --strip-components=1
 
-COPY --link --from=zlib-dev /builddeps/ /builddeps/
-COPY --link --from=libffi-dev /builddeps/ /builddeps/
+COPY --from=zlib-dev /builddeps/ /builddeps/
+COPY --from=libffi-dev /builddeps/ /builddeps/
 
 WORKDIR /glib
 RUN <<EOF
@@ -141,5 +141,5 @@ RUN sed -i -E "/#define HAVE_PTHREAD_GETNAME_NP 1/d" ./_build/config.h
 RUN meson install -C _build
 
 FROM build-base
-COPY --link --from=glib-dev /builddeps/ /builddeps/
-COPY --link --from=pixman-dev /builddeps/ /builddeps/
+COPY --from=glib-dev /builddeps/ /builddeps/
+COPY --from=pixman-dev /builddeps/ /builddeps/
-- 
2.47.3


