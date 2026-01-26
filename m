Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3054CC88E5B
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:23:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGu2-0006W1-Us; Mon, 26 Jan 2026 02:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGgL-0003PD-RW
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:53 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGgD-0004hw-LZ
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:36 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-81f39438187so2092893b3a.2
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411182; x=1770015982; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2m1YYGNyq/Rz1FBTgbyAMMQAXZAUd22fOojccDF0Y8=;
 b=XYgj41gN2ZOhPFh/8Qs2BKn7z1Uwjg686Nf+pdM65cbtzKfG7Yoth2DfFUiR6WJOpF
 9NPeUau+ggna95ae1E4aQY/hAxLMUMNFiLbPjJfNIz62JdG5NJSGczrgHDWKNegHd8w7
 RiFJ1QM6SsFJA7tR5MHXlOXrcCN0G5yNntPaDDds8li/w/Qz+l2fR4GdRypeYCsIClVv
 ZRSxMkRFK1cnyAGRiFEQHRkxorRyx7vGrgh5LYK05xJJqtPx4mMHHTMM4hjCEFhSvOqL
 5NixUfBbGY6l0UUfTdaOMc29aN9P4VtBjpMQ5jgZzkhpqWIcl8AuWIF9ykme5vL6dm6N
 OG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411182; x=1770015982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A2m1YYGNyq/Rz1FBTgbyAMMQAXZAUd22fOojccDF0Y8=;
 b=hfHk7PNb+SsCvl9EQQ+u7hf0c1Rr6rA0ynk8NuHqcV7fA5Gnln1GHhz1saULy7wLyC
 lRWx/+sBAkiX/hObXf+iK37f4EDaFSXTMZXcYiqlG+zaUlB7eXa6PsEo12tqude+cVSi
 11NEFytjxevqKtVkOT+pjbhfPsn3QbLj8IZp9W1waBAAmhMGqOrt8dqHW7T0BNvMCIPr
 xAJKb2+WRVlXjCnhv5vrLGlv07Uz8cPUMSIWpLLBI1ukOxOktWLedO4CttAI3vHwx0gX
 C8p/Ppp0FwoAu8OlwiqQwMsLWMEOY+qR19t/wSvp8ttXihgw8vXQooH1wgft09a13W7s
 KYig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpxxltmoEDA7ZcuB1Deg5RCnSrjyEeM22aGz1G2PQPAjDKzn78UTXF8vge7B7kxr04LU6LO8fT0w==@nongnu.org
X-Gm-Message-State: AOJu0YzgHgPeJ0KxW9pHEPTyePuK9xvrMk8hD8JJe/KMPpoIR3PjAs6F
 TmdmwF6iYlLVLzicBKJp5LHnRgucgJBRUrSMhiNYKltVCh7kUlbiQtdY
X-Gm-Gg: AZuq6aJzLkjL+DyCVFOHUR5LJ9QshsOvFcP8Rk1rED2K13SMH5Lh4Nw+ElLhJ41j/LJ
 OhH5iLvgpMYE0LwWwxJLp2OnDm+m+G+NNsxSEixR0sIWGmyKIOHg7azDY1vRbCuyQS3txY4U8I6
 hNcays9c2dzJAP8L9jEQE3FiCcKRGBwgrZk1YS1keYAcMDWkvIk9vvjI8qBtjAfJZdKGdsdRtCi
 +wkhXX8KjRvgtz371stjxn9/0n1Wviv6Z2Usss6Ry+i2LZqF2DEYHEbZAsB4wKh48grCiLMXkMa
 bCdjDvfj/XPMaSZTsEYLI6Tq9Zm9VWpdiWAn4fWjoBIFStf6yQC+x+ffERy4POEVN+ZDkWAgp/p
 DeeuGrzG276s9p3T+K2uuIJ+wZTzigzkBMBtkKqMNrZH81dIVCGHGFFN803zQHF3bbQGASwrRoN
 H7AtfM6263EonktPphMh2kpYpGS0MZnIR/c/+4FzmcGg==
X-Received: by 2002:a05:6a00:4b07:b0:822:30e:d15f with SMTP id
 d2e1a72fcca58-823411d7ee9mr3616085b3a.6.1769411182178; 
 Sun, 25 Jan 2026 23:06:22 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:06:21 -0800 (PST)
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
Subject: [PATCH v4 30/33] meson.build: Propagate optimization flag for linking
 on Emscripten
Date: Mon, 26 Jan 2026 07:03:43 +0000
Message-ID: <f14e57f2c7fc03dd0f89fd058775aa6a2f0c025e.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x42c.google.com
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

Emscripten uses the optimization flag at the link time to enable
optimizations via Binaryen [1]. While meson.build currently recognizes the
-Doptimization option, it does not propagate it to the linking. This commit
updates meson.build to propagate the optimization flag to the linking when
targeting WebAssembly.

[1] https://emscripten.org/docs/optimizing/Optimizing-Code.html#how-emscripten-optimizes

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index 82d9c94f4a..0bdc350f16 100644
--- a/meson.build
+++ b/meson.build
@@ -841,6 +841,12 @@ elif host_os == 'openbsd'
     # Disable OpenBSD W^X if available
     emulator_link_args = cc.get_supported_link_arguments('-Wl,-z,wxneeded')
   endif
+elif host_os == 'emscripten'
+  # Emscripten uses the optimization flag also during the link time.
+  # https://emscripten.org/docs/optimizing/Optimizing-Code.html#how-emscripten-optimizes
+  if get_option('optimization') != 'plain'
+    emulator_link_args += ['-O' + get_option('optimization')]
+  endif
 endif
 
 ###############################################
-- 
2.43.0


