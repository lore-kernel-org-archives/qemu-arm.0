Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C3EC98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMW1-0002Po-2W; Sat, 26 Sep 2026 03:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMS3-0005Wv-RF
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:09 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRx-0000fm-Qb
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:02 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-341d0522b4dso1978281eec.1
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406226; x=1791011026; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rabEc0gRpcSRWEsbtg5lwnY1j5Y5VrXCH6Smb/etghU=;
 b=iGfqU0mzmX0RJQI8E82gHCSId9rVLmG1cGLOqJqNhsF7lx6QamNH9/VxMlY6DwsoFs
 HRu+Nre4w0FG+CnmdozcBukZPap9ymsoqvALfpKUNHDCWdP0jNKAibMjaZOEjRB1+eNT
 a7yuT/vE5UhHAU4LPPh7iyIFYA1IwDt0qBHIdcPp82HLuMeC8QF3F0JUv3EawJ3+zHn2
 V0mrRJ8dTRvFdcHXqNDx1i3KEtE0jpG+AdFrClvQDad7txrmhtyRaD3RUHTyp2lkfcLb
 ibhBTvixuLfM8T0hz4h6+Wa/1BqqnRXjGtfVZ0gLpo5Zzzs5/dyB5k5RBpSujylQrwTD
 0jdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406226; x=1791011026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rabEc0gRpcSRWEsbtg5lwnY1j5Y5VrXCH6Smb/etghU=;
 b=i1du4EglF58kjvBvZ1i4sddf5EzSmhc301R39BHQoYJ2vYn7pO9IvdclusQ3HWqZjY
 fRoinfeymYVHkKxCuo0SQaV22dTVyZYeS0+zTZV6hsYHFQ+YCg442ERxGV2IzY3cI/E5
 v+jMhhrYwVQCsIi/3806g7vmidu8H11riljwD+sX2qhFwupcfy22FnouDzQsmMjEb4QA
 9tc4H8ZtBhp80pyhWRDUkNSaBFh+orh7CZo6WWOb4HIwxCQIpBwUbh049dgrHVtJND9Z
 L9zYHMYart1J8m4wTnzWngmjRvBwEPDP5IyhUwQ3IzVhfN+klsQF0TTpwyY/Ltry53Py
 40LQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxBcz9O2RmGE2o0pmLTsfC5q7RGd3QNWhtQKek1N8ljzlxxCtSEi/8k05UeRil029JgGCdXKaXI3Q==@nongnu.org
X-Gm-Message-State: AFuF++klWxzBNUi5P+a+EXkULjP3h8oRxCAcvhd/A/7uCM35B061ldOe
 iYUG9DDkUJ/rRgJixQUbxtOtJrPVISTvXC2kEKn67yR/QGXqn7k76oEq
X-Gm-Gg: AYBFou1bgvMwYIiWYNYCHI0m7bWZa8SMCpKFSxZ3rJJPXmCOjSFZ0J6ALhFNEGzyoVk
 1zJmWixrBrGMY9CXKaI995KRrjC/okPn2dl0mUqcL0c/x1CKQWDofFplKJwewNojP59omn3otpC
 YKUiZWW5KOE5B0BcdqaJ/21iXLudO0zEEdizGFjtRarf9S97aoYOeJRQNsjYrs/v/NdT08ISMoo
 tIWpzG8wnF0fQ04sv5u3dVdhMtJ0G1abucRaKLLd64VaMlomG1jvLYIYViFR9+Wn/U0HTBFW35H
 SlnHckitUxuP9TSCcE26CUYrxyAoLoK4OEqxekixHuCB7pOmXUwdi+SfXWGRyKL0E1zPjeDBhOC
 sB4qdtfJ1DECnJ8+27Bnshj8Mb21dqk0Zi0T2brKSb1PcP/wVFFtPGofAnmhh3fZTJH6yD9W7RI
 A6BGZsez2IeS1wuqZm9Nqrpc5CpW4Gq5GLAptqfApCXIcJLdPweiMEc+1SmvK15uTGTJeyWgc8S
 uIExUOxea012mZ884EMoMWPiZ3IhJs=
X-Received: by 2002:a05:7300:d20c:b0:339:7b3b:236d with SMTP id
 5a478bee46e88-34270ebf074mr2032360eec.15.1790406226335; 
 Sat, 26 Sep 2026 00:03:46 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:03:45 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 41/55] target-info: add SysEmuTarget none
Date: Sat, 26 Sep 2026 15:00:40 +0800
Message-ID: <20260926070057.1234-42-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add a none target for when no TargetInfo is selected. It is last
so existing SYS_EMU_TARGET_* values stay put, and it is not a
qemu-system- executable name. target_is_none() and target_none()
report that state.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info.h | 15 +++++++++++++++
 qapi/machine.json          | 13 +++++++++----
 target-info.c              | 10 ++++++++++
 3 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index a5dcf60dd9e..812e4b04a7b 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -90,6 +90,21 @@ bool target_big_endian(void);
  */
 bool target_is_any(const TargetInfo *ti);
 
+/**
+ * target_is_none:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is SYS_EMU_TARGET_NONE.
+ */
+bool target_is_none(const TargetInfo *ti);
+
+/**
+ * target_none:
+ *
+ * Returns: %true if the current TargetInfo is SYS_EMU_TARGET_NONE.
+ */
+bool target_none(void);
+
 /**
  * target_is_base_arm:
  * @ti: TargetInfo to inspect
diff --git a/qapi/machine.json b/qapi/machine.json
index b1be5608b61..6aaa2af709a 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -22,6 +22,10 @@
 # The individual target constants are not documented here, for the
 # time being.
 #
+# @none: no TargetInfo selected.  Not a qemu-system- executable name.
+#     Last enumerator so existing SYS_EMU_TARGET_* values stay put.
+#     (since 11.2)
+#
 # @rx: since 5.0
 #
 # @avr: since 5.1
@@ -30,9 +34,10 @@
 #
 # @hexagon: since 11.0
 #
-# .. note:: The resulting QMP strings can be appended to the
-#    "qemu-system-" prefix to produce the corresponding QEMU
-#    executable name.  This is true even for "qemu-system-x86_64".
+# .. note:: Except for ``none``, the resulting QMP strings can be
+#    appended to the "qemu-system-" prefix to produce the
+#    corresponding QEMU executable name.  This is true even for
+#    "qemu-system-x86_64".
 #
 # Since: 3.0
 ##
@@ -42,7 +47,7 @@
              'mips64el', 'mipsel', 'or1k', 'ppc',
              'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
              'sh4eb', 'sparc', 'sparc64', 'tricore',
-             'x86_64', 'xtensa', 'xtensaeb' ] }
+             'x86_64', 'xtensa', 'xtensaeb', 'none' ] }
 
 ##
 # @S390CpuState:
diff --git a/target-info.c b/target-info.c
index 1bdf3869605..b25e2ada438 100644
--- a/target-info.c
+++ b/target-info.c
@@ -112,6 +112,16 @@ bool target_is_any(const TargetInfo *ti)
     return true;
 }
 
+bool target_is_none(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_NONE;
+}
+
+bool target_none(void)
+{
+    return target_is_none(target_info());
+}
+
 bool target_is_base_arm(const TargetInfo *ti)
 {
     switch (ti->target_arch) {
-- 
2.52.0.windows.1


