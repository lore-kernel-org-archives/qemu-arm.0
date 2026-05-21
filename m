Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC27CD5BB4
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:18:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3Hi-00043l-6Z; Thu, 21 May 2026 09:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3HZ-00041M-Jq
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:17:50 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3HU-0008Q9-39
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:17:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43d75312379so5105892f8f.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369462; x=1779974262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Nc2l0giGtf+QZho3vf9MYXoNK00y4me0CSnyD/ZW0g=;
 b=x7/PXaYgfZxOCVQ44BhDT9jG1eVepm68xqVdGaIHhwU4rm+XRMLsSgzwqLPE940cgI
 FqmNzPUqeuprDoB6UmkCdNugqbxtblaGYkdweSZ8LkrxIeGPbR0cPBHC7BvB5oyOBbUa
 wcauAZTBSaL0vWTrG6Yw+7+bPMIkgDVUpv1Zc4DlCtKEmvRbrUGybbd3mJOhgpNiq8Im
 S8NhqmbjEoWbYslO4uOIEKjC/rlrJmWaW9/6FxB2ki01ZfxJpOerNw4+L6IlOJH9kVRk
 v+QIuxjGg9INcRj3g12tWPOwy9B9KQhBneIWMwioGLdWy4rej9EPgavmb5PyBjx6pAwA
 fZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369462; x=1779974262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0Nc2l0giGtf+QZho3vf9MYXoNK00y4me0CSnyD/ZW0g=;
 b=hCHOl8KZBcNO8Bl29wR8ulhHY4jIT/FW8mf44GtXlp4kv44G2jD/2oNQau+MvWMjGk
 5Cur+xdohrz1pg/FlZb1KJl9pLlSekBKXOiQag2kzzO3287SsPLC79wdY1zG/F5l34g3
 smhaEglo8kJ4iKeXOu1ZQ7Erg8kaAM6oydQfhUmHQSmw54BkEigZ34dagB7chvFjPj5I
 VMcJFRCViimuaUHn2n2AH1QBvHQ5cNyO/o77m5cgMm18kJwUaA4Wu3HOkV/xIipfmxT6
 xoihAPzgP+enrHJmG8DxPZ+MY4BgPnzQJy9xG25tkUcn9sweQi4BKS3RL9nw8sWfMbVU
 WNdA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9cWHbu231bU10AiKPWbIPBGe8WfcZCpgi7va1D8sDdAB/J/9hgSssiF07h9K9Pfn43vPsyEvyNlw==@nongnu.org
X-Gm-Message-State: AOJu0YwhwonJOQNz7vA3XlPOBYEkHk4HyfkRaNnjaD/hyW73F49Ccex5
 uJbELZ2kgLbdI4jvDniukoGABftEcpCyv+Xdo7RP3XfQfacINiqZ7df7NmEpqgdYOpQ=
X-Gm-Gg: Acq92OFdATfSPLS7TbT/e7MLzjlVOZiQ8lz4b6NCNF4WAZiBNJxN/c44v+PN+dv51D/
 +Z8pR/+sQ5wVbK8+rzi4YBSoT+e+UsI/qSDlpqg99ckwSZ1gsB4IWnG7Gn8zmEr9CqVMPe5b22t
 WxZtQtwWimnOoaS29cFkvUhNT1zJK7ciVImQpZkutN8AkPpCZsJuazSkMKQ8Dutd7yyxpdWyNXB
 N6l/gBzaR+ikmJLI/HOKodZoKicfLyUaimIFHtSJv10yB2yQw91SbH97ux8NtPINy/lVNHSD2N/
 yd78WgHGlJAbXBuWWIGRdafcsz9f/fpqc1UVUttNCWqKdbizJqwD+kpfPOMTjffb9bZv2/g379H
 pYsdq6KvFbIxC4CQBE18Nzrzdvfd+JL4D/9HEIn2DLOJyHU/lv2qgyCfyM60CDXgNHqEZ4y6Fhh
 BYMio+29wwnW4FjVnieOI+tmU=
X-Received: by 2002:a05:6000:430b:b0:448:908a:398b with SMTP id
 ffacd0b85a97d-45ea319686amr4306945f8f.14.1779369461553; 
 Thu, 21 May 2026 06:17:41 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa92f622sm3155839f8f.24.2026.05.21.06.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:40 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 55CEB5FA07;
 Thu, 21 May 2026 14:17:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 01/16] Makefile: include tests/Makefile.include before
 ninja calculation
Date: Thu, 21 May 2026 14:17:23 +0100
Message-ID: <20260521131739.540157-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521131739.540157-1-alex.bennee@linaro.org>
References: <20260521131739.540157-1-alex.bennee@linaro.org>
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


