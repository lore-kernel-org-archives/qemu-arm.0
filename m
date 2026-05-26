Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1037CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 11:03:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRpYv-0002dv-99; Tue, 26 May 2026 07:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYm-0002ZX-75
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:57 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYj-0005wN-3M
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49040362e4aso48395935e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779793366; x=1780398166; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kqd9ZlXCFNXK9C93MrSlSJwEoJ6kViFCON13KK+NKbI=;
 b=pmFIcxvLe4TJsFiDhVYirmSYQXYXv71h7xHyKyLbkk9qmFtkcR3TNJFUbSaveYfpky
 MhtAqeKPwPoIOQ7OiOR/kVRALDeC1GCboQ/wHf/arjnKphRgAs0IxwFY6TqH3hC/1q1D
 q+uf69TU71FOuS1ZahxWacUOQOi+/faj4ScAc13bm15Y5Jz42ROxA6AYd1eyiRU34Suk
 asOTjX75H68oZQ55pc7ThykfJaleEkC8wC/GyjN72u42N/hpn4I8uhsnZ/FcwKD7agX3
 d9vX/vPtu+Db2DUmG3NesPUxqQ4euNP+8DChW6+53t85owqTCPk3dhPlcDO4V0y/lBUM
 bzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779793366; x=1780398166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kqd9ZlXCFNXK9C93MrSlSJwEoJ6kViFCON13KK+NKbI=;
 b=SxHJXtvkTz/SZPKwp2+Fa8awQoFRHjfC3Elt5zYB54g7ZbIYHqvbbIEMQBKnvkrpfF
 e0Kqwove4V6jbudkPLkZL7CylXSOdPRG/wWMpfDEYAP24Q4giNK0BYxuPkTaoSLqMUMz
 /pBZfx5j2Vzp0GUk7MkZP35fVEGhgJQv3l/Fzpg3YrXBqa7P+x3OY7u0RMCOwz6RMAom
 LeKXQvZ1D5si+8m9MEC/JWEqSzIH/sU9wI0mQXyfH2YxqD8QX6hivk3my5+u+OGwp0qD
 OH8nrdf+Iot6Zm6kp4HNjUIKXGFTRUrSr4dSo+f71msrfkX/9mW+iMf9TBS5xYeqFBsH
 vafA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9/4FDm1HhSm7OEMrvr76yx+6kbuknFuk9G5bs1xsAXb319ni7SS3Cn34jKRGSV0lbw1Tg3nMU6PA==@nongnu.org
X-Gm-Message-State: AOJu0YxrZ4PUkPLwMyR8JgGAjheyBblT4qCnCYwrhgtUmyKYxv505Y13
 U6kIxDuOEnLTlzV/J1knoBQ3XGXYaS5hBFx48anbhEfg7rgKi2lSRgsh13FQYC5cNPw=
X-Gm-Gg: Acq92OEEUM6KZ80a5rgKGW1mFqvFBwr9sO8KLyyHAce/tOqCxbs0dTXNdd21d/+v46g
 bWm+3JZbsZ6kMu/D3tizq14XiwBinZmfsb6Lgs425l5dyhvZMoXDLwhplaIoebkjB+3gHQpX/ab
 IDaRBOCxlCB09S7D9j5WkACDynx7rJhf4XxpD+piuqjmaCjLHoNxLFnhypsA27oRCsXvlZbpzMs
 6tbtOJeC/uFt7aw/UdWHc25FEJGqvCYfT/1oXNqsq8fhG30uSneUAgNWIKX/2yP9T62ltXX5ni1
 lxH6HFD/8r0CxDOR8lI3RKZNXo5EEWFunLvBx0whJ+VXQhK3bnNdHopvSJBhNboCAgn+sUdxxcy
 eRIY9vB5bdc07Opr9JTAJGUzv6luK/XsIPPy5meEOSQzi136yfVydtzhxx+g+jvK5D+WGNTow7w
 oNNDmtiMEokxt2rwPhHe/FMSw=
X-Received: by 2002:a05:600c:c8d:b0:490:6869:46d2 with SMTP id
 5b1f17b1804b1-490686947f8mr105066245e9.0.1779793365937; 
 Tue, 26 May 2026 04:02:45 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490428e6d68sm109150265e9.22.2026.05.26.04.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 04:02:44 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A06D95F83B;
 Tue, 26 May 2026 12:02:43 +0100 (BST)
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
Subject: [PATCH v3 01/14] Makefile: include tests/Makefile.include before
 ninja calculation
Date: Tue, 26 May 2026 12:02:29 +0100
Message-ID: <20260526110243.470002-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526110243.470002-1-alex.bennee@linaro.org>
References: <20260526110243.470002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

As the tests Makefile sets .ninja-goals we need it to be included
before we do the calculations in the main Makefile.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 54547a37b1a..829c51e364c 100644
--- a/Makefile
+++ b/Makefile
@@ -45,6 +45,8 @@ include config-host.mak
 include Makefile.prereqs
 Makefile.prereqs: config-host.mak
 
+include $(SRC_PATH)/tests/Makefile.include
+
 # 0. ensure the build tree is okay
 
 # Check that we're not trying to do an out-of-tree build from
@@ -180,8 +182,6 @@ endif # config-host.mak does not exist
 
 SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory --quiet)
 
-include $(SRC_PATH)/tests/Makefile.include
-
 all: recurse-all
 
 SUBDIR_RULES=$(foreach t, all clean distclean, $(addsuffix /$(t), $(SUBDIRS)))
-- 
2.47.3


