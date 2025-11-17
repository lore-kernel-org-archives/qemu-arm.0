Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A299CEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 11:57:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKxpU-0008FM-6b; Mon, 17 Nov 2025 06:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpS-0008Dj-MJ
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:30 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpP-0005fH-DP
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:30 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so28596015e9.1
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 03:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763380526; x=1763985326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebS60vP8c7FA3rtg2g+8L47VUNtFcdTIGq19ZpIrWkM=;
 b=cDu5DenEKMbbZPenjT8MJ3z8M1GBs7qUNbA7fnlsMGxIebZhG0ona3HKIv1vqB/BZ2
 7qM4rGQ63SQLV9MNLrR7kK/MA+1oiRQJZ1RYUjlirT3PctRv9MwkzqVOz+CEb6qCguvM
 NMIIfwHdke8ZT91MK938f82birku2bgOb6uTCUggb9EXnyUO/hhjJHw3+jHyeW40nyHY
 UPtS/Z2W9kqAaF8KeguFwBhvr1ap0yF31F4jx/qP5KDL8j9YXa+Db4hyCQ7Gyqc+r+IG
 yolSi9nFxAgPWvihqa3Youj2Zzpj8baVsDBHcnrOLJ5MS20t4BKZI8zK4yglUjIfguoe
 IkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763380526; x=1763985326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ebS60vP8c7FA3rtg2g+8L47VUNtFcdTIGq19ZpIrWkM=;
 b=ARlsYeOQfZbGVx4yWydhplKUHuLRak1wcqGjdyvtGy0H6S/ufnCd572tyihjU0tgWa
 oSI0h+IzWvWrn1Wt4ZU02Qo0Y14BWNShg7eBVt/dxXu9DPEVUZJXhPuWfUsXrTEIIwE7
 J1/6WGHfdfpBRrdAZcKEfmWJcca4J6UfTLLQlW+Ulzj+wUQSovrwQFfQl4M9N+OHJqJl
 wSD4SHpL7cnFhOda1714jTzaqcn+v5/HwSFRKOMaVELrDb8mY5IwLJ/Af85HgpYvhEpw
 ZcAUR4Pr/ZiPgqQiUFSyQGOKtA8Db1ApZRyLkZYI0IopuVJgfD9Otxwv+TJ77mmj2718
 4iYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq7E2Y/x06j74BXUihdIlT4W1X75ha58trm0RDhr68YMZfnfAy8NHilVgg41W/x0j4sMn0VX9XlA==@nongnu.org
X-Gm-Message-State: AOJu0YySBrO5Um+7ZQ3+wFh1w1lLog8WScgPPGNg5JBdQ88amxD06xAp
 gCRMdeiOTUAgGilCCFfgrh+5DQ6hgqSxT+OykpCwAwEuQbeQeHIpp+Lacp4mI4cfDH0=
X-Gm-Gg: ASbGncsFDg0AzAeUwVVL19Ngfq7pN0DWaQ6cNxieD1nnyogb7mU+5TV4xDBuYL5Zast
 brpbmZ3P0qtBga0Vn28A/lXRs2c1a5WvOo2mhDxiQffBvoL/NBjO01J0kFngZg5d/u/ch4qfQ3U
 VUYz854n56WRtFWNh6xe4jTMKR88p2+UtNKCOmiHYRyk3Wp+k37m4p2M9JulmARCBICIvESKOeQ
 QnTQj3k2u4yf8facIENANXaGBgD7xBe4tp5gZxjuNfEkufv8kl7xLCU+EcLqN/ctAdcpo58GAZ5
 Ao96lDZTyv8csKGcoN5MJXPS5wFwU/qIL7ciUBVGT/zGa/RiRchkGbsouBa2m7e+ZiBV0WTbgVO
 PNWZuqfELONuj60mWqyWlI6/625lm9nAq8Qpr9eq+sAKtHceOVW+DAseJvZ37mMPItgLL7eT2sK
 VNzXOd8oh4BOQ=
X-Google-Smtp-Source: AGHT+IFAgHuL1yT+RxTXi+vnQiLacSHRb0csUPvTt+3Z/BW4MxTe13V6pgQjUMYMxSA7iHakbdCfMQ==
X-Received: by 2002:a05:600c:5598:b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-477a71cd913mr8927715e9.11.1763380525482; 
 Mon, 17 Nov 2025 03:55:25 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47799768409sm134893385e9.3.2025.11.17.03.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 03:55:24 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 271765F886;
 Mon, 17 Nov 2025 11:55:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-s390x@nongnu.org
Subject: [PATCH v3 01/18] tests/docker: drop --link from COPYs in emsdk docker
Date: Mon, 17 Nov 2025 11:55:06 +0000
Message-ID: <20251117115523.3993105-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117115523.3993105-1-alex.bennee@linaro.org>
References: <20251117115523.3993105-1-alex.bennee@linaro.org>
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

As we need to build images in both docker and podman lets not have any
incompatibilities. I don't think it makes any major difference.

Reviewed-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Message-ID: <20251113102525.1255370-2-alex.bennee@linaro.org>
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


