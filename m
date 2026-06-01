Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD86CD6E55
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Jun 2026 14:32:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wU3g4-0007hp-7Q; Mon, 01 Jun 2026 10:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wU3g1-0007ft-Jv
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 10:31:37 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wU3fy-0005vL-R2
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 10:31:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso8666145e9.3
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2026 07:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780324293; x=1780929093; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzwjuCWmq/Dw+0YnOxPvb42vtp1TDlEzsHkpZWlr0uI=;
 b=CpHUyRyV8RTm/zgkOvFpOiFXoyfAdWLGbk5giIh3aTMK6sjT5WzdnMa70CnykHzhcp
 u/UwMfV3cUZd+ImMSbMdG880s4CAtye1mPdqeevDab2WhrrLFlCQGCjd04RlxHPCdRL9
 h9UmDADkLQY7SK7EEjX/Hd5i0tjUfY65L95S0HWBD7TpRMZ3euMo5Hmcm8X4vxZt8ShC
 73crdz2w0K0UyK/4vqh12Yoky5lcsnAv3O+nYzIwhsRZEGwjxBrrTYEDxLmlXlN+ogcx
 ldFABoQvVAV4+cCuXwWxZIqtSL55xkiNDJcdmFY8yCQeOJtywKZDtDBdSXT7xRiPbK6m
 6+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780324293; x=1780929093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qzwjuCWmq/Dw+0YnOxPvb42vtp1TDlEzsHkpZWlr0uI=;
 b=NiBrQ7WdS0TUf3WXYG+HkeO2TMGWs3QxftGHbjMLptxyM0QKvsH7Na7DbgxP7z8fOb
 Dv4yqxkJcU7dKq+xydHviryblp3rzzvGhcNmGJH86Vgvo2fQr1VRk5QFpaKP9D3noERd
 3GBfCSBVYPKP8afrAHn9pWnyIY9R7t2vgiAaBmQTEZvakm27PqDM+b1uIy3WRXUm4MkH
 SWemZXuFJyOBPWs50AXSp1e8fSkXTkpKaj05GD7QtJfS7IY+nv07zBMKjVSb+d9CJiQE
 HmHSEnNSKFp1biqIwCoQevklrrx7I38xIE13Jr3qoCTRkzhfclweRcN0R1UEFuO/KscG
 6mpw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/IsP+j43bgvwJx42ypVCsv1hdnNNgTjv2CRZ/kNudu+9ZqFPeJyVJNQxbwwdxlZlELdi872ZXiug==@nongnu.org
X-Gm-Message-State: AOJu0YzrjxwHFlGSlGWki3f3YswjSWAJ97Gut3SnkBIMBaQjpg9vMXk9
 GaRmtdTIo5rQkEe4o8IXj7TP+pvqH1Nc3//r0EZu3iXAUVyBF8cjIEOXwShksFspSRA=
X-Gm-Gg: Acq92OGebzrBS2CdRODgEx5qxBvjzhqkK2K83gQM+ItMYUWtejEWnH2B/b/YGBRzWzK
 AsdkegIik7w4IkwazGxf4KCnOcLuu9ebvMpZq34BNtmOQGP8j61RJVLzBsgShNGhB4QT5+9hsoh
 cuDa/wFkzmC8sk6ZNcBY53EDA2ZZguBshd4/VqLRzk15d/gEO+N7v3nHuJgz8xYNffF9UBvrFY9
 WVeaWtXOJhRd9x+4Es/djiyMF6ZiPCD3+DUxsSFm9Lo+Bk09qLNFM1eQnUbW8EOHTFLoS8C4Vvx
 D37eAt5HIRM4T4l4IpPO7G6RbFIQlcfg6ZSlKF2u+pzWZGWL/VgdvmSJYenUQTKG0N7oVBK6hgc
 5WZcd7UUkBQ2dofPyZaT/riwcgDWzLcpuxEdisdl90nWCIYF/NKxYVpBl0ucBlGJbEI3rvTqHBB
 yFSStCj8YXRqe5DLZLX0uK9criBIbM2rpnJXHSWwfFc4Bx
X-Received: by 2002:a05:600c:4703:b0:48f:d1b8:9ab1 with SMTP id
 5b1f17b1804b1-490a2915af8mr223740825e9.9.1780324293068; 
 Mon, 01 Jun 2026 07:31:33 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c08f1bdsm121501605e9.1.2026.06.01.07.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 07:31:30 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 21A34602F7;
 Mon, 01 Jun 2026 15:31:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] configure: use debian-all-test-cross for mipsel tcg tests
Date: Mon,  1 Jun 2026 15:31:29 +0100
Message-ID: <20260601143129.144786-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601143129.144786-1-alex.bennee@linaro.org>
References: <20260601143129.144786-1-alex.bennee@linaro.org>
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

Although we have had the mips compilers in all-test-cross for a while
we had been surviving using the mipsel cross compiler image. However
when that was removed we missed updating the container to use.

Fixes: 366bb88e785 (buildsys: Remove MIPS cross containers)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260529181713.612230-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index e138d83bc9f..1ceb4d7ecc4 100755
--- a/configure
+++ b/configure
@@ -1430,7 +1430,7 @@ probe_target_compiler() {
         container_image=debian-all-test-cross
         container_cross_prefix=aarch64-linux-gnu-
         ;;
-      alpha|hppa|m68k|mips|riscv64|sh4|sparc64)
+      alpha|hppa|m68k|mips|mipsel|riscv64|sh4|sparc64)
         container_image=debian-all-test-cross
         ;;
       mips64)
-- 
2.47.3


