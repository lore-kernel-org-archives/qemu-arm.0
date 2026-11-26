Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AA6606A323
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IweyB/vh
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWaaG-0007hf-Kb; Thu, 26 Nov 2026 09:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa8-0007bH-Mk
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 09:36:16 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa3-0001fF-UZ
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 09:36:16 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4a358881793so3733992f8f.0
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 06:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795703770; x=1796308570; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=s5FIW1S8JienHPB43I581nzquH/YZHCRU8EYQF6o6UU=;
 b=IweyB/vhZ6Nti90YczIlOGwj6fs9tM375maT42/LSC4ZcIFo2oxGF/CYqknGQZLAPG
 J6jHJdU3a/51sm5mN/9QrJ7N+5HOnofQNjfJi5HNbWmFnFBeqEbRbdpI/tQAkk8kqVNO
 etmVSvml+hM+MnQUyPFXwyh3fvgMrk8436FJZdG4Ad02+iWJy6NjLmLF7DJ871Ozwkaw
 4pUZtn7RFrRZTUYlQk5v0icjvXf7/XAXfThNHLstSSJg4tkkATgf3ZLyjrpieaK/7dlc
 TdpRF/ffC4lFp+BW6Tb6z6UyxoWJ6pr3Twz9Gv/MMu0dC0nzkj2zETltokLeSqHD7jTG
 4nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795703770; x=1796308570;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=s5FIW1S8JienHPB43I581nzquH/YZHCRU8EYQF6o6UU=;
 b=hHxeP4mJz8V58fZUTl8Fibscu+hoyZ/05wvChBeqo+mwHX8vtk/fC7pdZg2QK3JlWj
 aD7f2LdFzfSqjquy3KqC9Qp4AETSFm0HawG+qCZJkHk88lin2BwgI8kgamQFn7Q/dFtR
 jJsCn5D44yu002ZjcNoCWIm4F9vPnrrg6VISzhXDMx0f43GlP6EGNKU53b35I8O3U9pR
 7LgYiuF9yf3OkRpgcMgzX/O2Ya7odQ6lne/X7UUW34lLDwmmBHmodlH4/JfM7yDVDsFu
 w+FoCOn0bOPS81WwqNVSkLuj2p4riYy31hGHlJA1Hf2S1stP8lfcMcgyumWT3IEUw1xM
 kK0g==
X-Forwarded-Encrypted: i=1;
 AL+hErHIJ/fkD7Sl+RlEuAngdZ1bLTk6l/Z25COpe28THpzONS+PtsbmJRMmB5E4kEE+JYJSxTSH3+sxtw==@nongnu.org
X-Gm-Message-State: APuU4Z/f9M/IbYLnf3dU1MC5J14P2IqlAKqyLs8UJUgXCT/osmQ+LAS0
 FXl0ZS4bvK7CyUHUOl6nW7hjh44cN5b+EC6BGeGN6Uq/iY70pX/wGzXVtFNF8TXV0pc=
X-Gm-Gg: AZFdTZcjYUph6UsOIF2S8nB7IUyPDeX3h7Wel0F+LVcmJVzPYyNzoHIHr8+XTKSHBk0
 5tvs8G89oBgTL53qCHenzt8upYUlEfNa1YyMH72WTWeEl+IzTd1RQ0NvHrMdC2zLJuYq+oB4zpO
 H7ZtxUd8XH/7IuR9SdhMOzbsbMpJdJvR9mA6t1SLPB0mluZdZo0nofUfIutgkLR1iQQFnd0SWFq
 kfTuA15Lf6OtX20MNihTKsrsauAuDfQx6nxE2KjbXNCSSZjGCF5tXFOVuMq7E7E/eKIt3Nw9Fby
 GWmNKqTzSuTGhuJD+mnuZpUTHK9WQHLoDzR/f/5GNLiZKaeVc3qd2BUFxJcWbEu9668heekK9k0
 8KNpmqkho+qOIfVVHNAbbBeBY7Tm0TjDg8k1cFGfalWzurQsmbsEGEBKG2d7u7ul+O4UWg63gwb
 13cfl8sCn+oSE2hVmfc5YeAki05k0GFDc+d6RpPK9ZU3SAtYgEcIV+RjgiQv5LUpzvQPidpgQNq
 5TgntL81GYcbuZmESE1pL3gzTui/SYTgv+A0vEZbSPG6OlhGsxQZ1xJUtwmW0JCBjYagthqk1um
 3j6N+oMw8tDJx3e4B6LJYiy5cjRY
X-Received: by 2002:a05:6000:40ca:b0:4a3:976e:27a2 with SMTP id
 ffacd0b85a97d-4abb5146238mr41469209f8f.34.1795703770266; 
 Thu, 26 Nov 2026 06:36:10 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b110c50sm40545969f8f.37.2026.11.26.06.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 06:36:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BC4495FA1A;
 Thu, 26 Nov 2026 14:36:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Zhao Liu <zhao1.liu@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-riscv@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Chao Liu <chao.liu@processmission.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH 3/8] MAINTAINERS: use consistent capitalisation for Alistair
Date: Thu, 26 Nov 2026 14:36:02 +0000
Message-ID: <20261126143607.2374676-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126143607.2374676-1-alex.bennee@linaro.org>
References: <20261126143607.2374676-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

The last emails with capitalisation where in 2019, make it consistent.
We can also tweak .mailmap so this sticks in history as well.

Cc: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-ID: <20261120200511.822573-22-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 10 +++++-----
 .mailmap    |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 048ea6a5034..cf701b11cf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -878,7 +878,7 @@ F: tests/functional/arm/test_canona1100.py
 F: docs/system/arm/digic.rst
 
 Goldfish RTC
-M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Alistair Francis <alistair.francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Maintained
 F: hw/rtc/goldfish_rtc.c
@@ -1807,7 +1807,7 @@ F: tests/functional/ppc64/test_fadump.py
 RISC-V Machines
 ---------------
 OpenTitan
-M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Alistair Francis <alistair.francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: hw/riscv/opentitan.c
@@ -1845,7 +1845,7 @@ F: include/hw/riscv/shakti_c.h
 F: include/hw/char/shakti_uart.h
 
 SiFive Machines
-M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Alistair Francis <alistair.francis@wdc.com>
 M: Palmer Dabbelt <palmer@dabbelt.com>
 L: qemu-riscv@nongnu.org
 S: Supported
@@ -4242,7 +4242,7 @@ F: hw/i386/amd_iommu*
 F: tests/qtest/amd-iommu-test.c
 
 OpenSBI Firmware
-M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Alistair Francis <alistair.francis@wdc.com>
 R: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
 L: qemu-riscv@nongnu.org
 S: Supported
@@ -4343,7 +4343,7 @@ F: tcg/ppc64/
 
 RISC-V TCG target
 M: Palmer Dabbelt <palmer@dabbelt.com>
-M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Alistair Francis <alistair.francis@wdc.com>
 R: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
 L: qemu-riscv@nongnu.org
 S: Maintained
diff --git a/.mailmap b/.mailmap
index bd8bf07feb7..c44990fd3d6 100644
--- a/.mailmap
+++ b/.mailmap
@@ -80,6 +80,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
 Alex Williamson <alex@shazbot.org> <alex.williamson@redhat.com>
 Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
+Alistair Francis <alistair.francis@wdc.com> <Alistair.Francis@wdc.com>
 Andrew Jones <andrew.jones@oss.qualcomm.com> <ajones@ventanamicro.com>
 Andrew Jones <andrew.jones@oss.qualcomm.com> <drjones@redhat.com>
 Ani Sinha <anisinha@redhat.com> <ani@anisinha.ca>
-- 
2.47.3


