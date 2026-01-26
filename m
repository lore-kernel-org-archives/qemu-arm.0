Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511F4C88E58
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:21:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGtv-0006HN-8D; Mon, 26 Jan 2026 02:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGgU-0003Rf-P0
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:59 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGgQ-0004mN-FO
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:50 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-81c72659e6bso3920609b3a.0
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411195; x=1770015995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3j7udeVM6rKrCEa74dyypvfDYvQk1Jag50gmIaKtShw=;
 b=i4t8D9eZaC13SZi1wkUTHnPi6ThFigwn9Y+drA2OtYXjS7TYTNnwn7TE9h1MpGH+Q0
 kvkt9I8bB9fdvuYkJiOza8Z9T6AvK/DtlDA1XzvUgr3gnKieaumoImkLvksg8x8sGfZZ
 o6jiPaGQgPBChFPlafnnMgCqhf69F0cU8bvTZkf1fx9DE9urHAwMoLpRn9vqA5RnwHwV
 qePpRrFidvicHOrFU1KePOY9CltAziGev3GuPOEsW08W7awB9tetlYNozXbK7mNPIc8U
 sihkhwvoccKm0+HQdM4cyzi2gUbfl+hHikJnBNiMrEwzXDHIsTSDFluE7nzQDKGOERDO
 I1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411195; x=1770015995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3j7udeVM6rKrCEa74dyypvfDYvQk1Jag50gmIaKtShw=;
 b=sFIXEQ8nuzxgE5CXv1YwDB8LjHp/NzKGSfhKUs4WqeMy2Vm62dWXxetLBjPLwDwZlb
 5qYBy4WCAL1X+hcudCABcSkp3m/DHduixDpozFHqm4aSuwXVjV8VZ+RISE7O9U+NbPic
 anyafbZ5I2nBzSC61JWiHK2RPMItDQF48Y8nkYWE7ofjn5a4SP223zmL9PmhX2s68eZA
 8ohZswT9RPut7Kn8Bb06XGxvl8c5HB7xujqP70VuFpevyDFj6aSJMGjEtUDadWssflRR
 Uj7NlG+4FOsOJ9hfjz2CW3CUm/BxOIwsKD8msxTX2YxPkfi+sszMaHwjlxaMbupnZ4Sm
 zKRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7fLUUkIwwH8sApbuOrRDk40iIpNpsmc33cEQ+Cld/2mNyiHFcRR6QEs9BXNpsJDO6aSY0Co1z1Q==@nongnu.org
X-Gm-Message-State: AOJu0YyzIK3cmRfKWsOm/h1yRNOvivNeZoI276zdw0YQuku9gwmDBo8S
 tm35K5wr+9Md4+ADNUsIkeBV3mRfxQX2sY0o7hqCejuksXS/0xqrhMDT
X-Gm-Gg: AZuq6aJVs39od1K/DxAFqPiyS4YWQ5N3ZAqoKHLx+ez+EqAFpmMckTpjTwgpagNoJEo
 OiZZwFR4riNBSIFksdTfvK1UIMZkqYPz61iWqH20kEFOP6skcR9kj3HdXSPG5EY18nxq8UnCNdt
 6Pa9vu1PeRTYkiFll5x4RfpXPGKmb3+PxZ2JG3ctazS63LcBhsy5rdEn/VTaIOUoCYlRks5E8pL
 BSnNuNfN9dYRr7txmFfk26yBCOcCkioo91R7FLqPhkXuAiFqGcMu8l2l5IwHhPnT9kpHTisnxe5
 CgNe+aee/VsaZ1GA0QFMYNdJPLuU0aQP1Q3W2zcxUl5lutL7qyAz9P15DIq5+LKEw4DHrdzT39T
 tq92/74djShPaEE1sPY1CR/u5+U+zb+wcxq3lk7O1H+3o6bW0qVs7VCF5J+3CnwpJ1MRaR2rXuZ
 qovqZy5mud+MSRJSVM/rnKPlZ2I5ibAfRhqQJmfJ3Vew==
X-Received: by 2002:a05:6a00:1390:b0:81d:e9b1:b6e3 with SMTP id
 d2e1a72fcca58-823411d83b6mr3385121b3a.14.1769411195476; 
 Sun, 25 Jan 2026 23:06:35 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:06:35 -0800 (PST)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 33/33] emsdk-wasm-cross.docker: Bump up emsdk to 4.0.23
Date: Mon, 26 Jan 2026 07:03:46 +0000
Message-ID: <8f1406ba3307a10c58be24a8ff00ab6a5d3b6169.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tests/docker/dockerfiles/emsdk-wasm-cross.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/emsdk-wasm-cross.docker b/tests/docker/dockerfiles/emsdk-wasm-cross.docker
index 8a924816f9..d1c0c4195e 100644
--- a/tests/docker/dockerfiles/emsdk-wasm-cross.docker
+++ b/tests/docker/dockerfiles/emsdk-wasm-cross.docker
@@ -1,6 +1,6 @@
 # syntax = docker/dockerfile:1.5
 
-ARG EMSDK_VERSION_QEMU=4.0.10
+ARG EMSDK_VERSION_QEMU=4.0.23
 ARG ZLIB_VERSION=1.3.1
 ARG GLIB_MINOR_VERSION=2.84
 ARG GLIB_VERSION=${GLIB_MINOR_VERSION}.0
-- 
2.43.0


