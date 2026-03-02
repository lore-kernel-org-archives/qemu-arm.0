Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF496C624C6
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 09:22:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vwzU2-0001GO-De; Mon, 02 Mar 2026 04:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU0-0001F5-Px
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:32 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzTz-0007fV-39
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:32 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4833115090dso42767455e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 01:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772443349; x=1773048149; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+M9u9CAKdsyvMMBdW8vER7FZNjwEryhm9BW6q3wRlRA=;
 b=cHC1YHCgzKHn/Za5LvmsmqfiepA+/i/wnGS0f0/kNzoBq6OkqNYosK9xa3l6ga0vm9
 vC7xoNYFiHX1v4Fbjjs2SwIousqJh/7MV8fHE6OejqsOny8x1+UwCDZr03XOfHNCYnzt
 j3kgmpF45DBWn+o5FAz+YPZXFx+HHeTtfJapIlNoLdAqbrovjnx1nnZo+kYOoj8PK9HW
 +TVdcQ6E4csX8zykluP4EsEMlNTFaDGr50GB6Z0nQ3FczK62gBd+fsOg1O+UslGJ3Atj
 Bl0KcC4ukdUzUUtOKZ/YUGnc/0HBsbITyLpBfQqyQ38Lu7iAM2+oPNlFzCKjCiXDCT8w
 BljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772443349; x=1773048149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+M9u9CAKdsyvMMBdW8vER7FZNjwEryhm9BW6q3wRlRA=;
 b=Cz0penmFJ9dM1dIpfDkWMpMmCuLA0JUPn5lZvSuamj/UG4gsrOqYxsTtJ6ZmRCg/1I
 XBZ7daMgiCZjSMpw0DBE2IL3mgDuCy5Z2hrD3l4LBic+6I48qR9FnXH0kPWk2+Y7UAzr
 /242KJWolrvg8jvq77Iqkt5N53EsL2ShzK+mwXJN6IW0A5tyfuVs+zUaoy9O9e4R4st4
 hRn8J0ZurI24k1wEAetocUSuvKCC31ESdgEwWUCSVR5Zy26MYWkPseV8VJ1jmLYPQLGX
 nydM2k8AMEOZORCg9mHuly8wcKEUk8fP2m7M7i65dNPi0hDElqSquVw7r9B/8VOkCWk5
 D8Mg==
X-Gm-Message-State: AOJu0YzE4RsQrRX/Ggxjy7INse+C8ODawpK4LreKVlcfkcciibVxZPVk
 NdX0rdgbQHM5nhZpiYYmqKQZvxyo2nAMIbuJFmnZcMnVNNuFM01XiGWKB40wcAKgtRrtwyX51Df
 1fovC
X-Gm-Gg: ATEYQzzKcQysxnaGV9yJ85RiA81iG+x2qeQ03cAtsV34POvN/aHR+UJJLuByqtzyMby
 n0SxwZEN5fy1NLajKvHEU5R8CK9SSc387GgoDaBG2lkXPK5hFi/TebZ00u5KqyPlaHaHQ8I4gzi
 UeMQ/bwN6g4XGYX92AnYG+IQwu4MzVMhOmXKAi/GnRcKhHU102xIq1gbJc5WDO8sekdJ9dr36yb
 foqyRFwG1SUlaqll6WAT0Q8VQW9krZmF26BznzX0bV38r+t+FHqZYNXI9Kl8DsWF9WonysjNlwr
 +NUKRqIH+D3LCWwksn9qPVlU7ynvw7hkGnwJM/fhtXluGkWBlEeO4pFQTkbHRu4gfhEsJO9WI03
 rT0UJCC87UNjd1lQzguh68ajAcx1VC5yH26WkOpUeCmTxpsims4k+0vAw+lES4uevfedSAo/y2A
 gy8YAmrr3wZmwbLv8v3HUolFE5Jbu0k/clDRoSqdYGumi4mfXbI6synvqtX7QZliF364AnKW0Ve
 PwNvZSLDzT+Fg23Co4Xf/mhk76z9rQ=
X-Received: by 2002:a05:600c:c490:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-483c9bb1fb0mr191573935e9.10.1772443349417; 
 Mon, 02 Mar 2026 01:22:29 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb9d9c6sm129435305e9.14.2026.03.02.01.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:22:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Yodel Eldar <yodel.eldar@yodel.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 2/9] scripts/lsan_suppressions.txt: Add more leaks
Date: Mon,  2 Mar 2026 09:22:18 +0000
Message-ID: <20260302092225.4088227-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302092225.4088227-1-peter.maydell@linaro.org>
References: <20260302092225.4088227-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Running "make check" with the clang leak sanitizer reveals some
leak reports which are either not our problem or else not
a leak which is worth our time to fix. Add some suppressions
for these.

While we're touching the file, add the usual SPDX header
and a comment explaining how to use it.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v2: header comment moved here from patch 1;
dropped walk_path suppression since Fabiano has a fix for it
---
 scripts/lsan_suppressions.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/scripts/lsan_suppressions.txt b/scripts/lsan_suppressions.txt
index 7d90c280d0..f88bbab18b 100644
--- a/scripts/lsan_suppressions.txt
+++ b/scripts/lsan_suppressions.txt
@@ -1,5 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# This is a set of suppressions for LeakSanitizer; you can use it by setting
+#   LSAN_OPTIONS="suppressions=/path/to/scripts/lsan_suppressions.txt"
+# when running a QEMU built with the leak-sanitizer.
+
 # The tcmalloc on Fedora37 confuses things
 leak:/lib64/libtcmalloc_minimal.so.4
 
 # libxkbcommon also leaks in qemu-keymap
 leak:/lib64/libxkbcommon.so.0
+
+# g_set_user_dirs() deliberately leaks the previous cached g_get_user_*
+# values. This is documented in upstream glib's valgrind-format
+# suppression file:
+# https://github.com/GNOME/glib/blob/main/tools/glib.supp
+# This avoids false positive leak reports for the qga-ssh-test.
+leak:g_set_user_dirs
+
+# qemu_irq_intercept_in is only used by the qtest harness, and
+# its API inherently involves a leak.
+# While we could keep track of the old IRQ data structure
+# in order to free it, it doesn't seem very important to fix
+# since it is only used by the qtest test harness.
+# Just ignore the leak, at least for the moment.
+leak:qemu_irq_intercept_in
-- 
2.43.0


