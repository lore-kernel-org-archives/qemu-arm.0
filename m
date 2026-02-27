Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29543FEFB53
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 13:59:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvyLw-0006Ff-3p; Fri, 27 Feb 2026 08:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvyLi-0006A1-Bc
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 08:57:47 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvyLd-0007Uh-Rb
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 08:57:44 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4398f9e3b40so2145683f8f.1
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 05:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772200660; x=1772805460; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0r5tVTwr3FwSzfLr0irG0lziyL9H4aagQEDitRzfyJI=;
 b=ppBmVzzM6ln8tfKsIK5LisTWB9dvW82wEIBhMaZnPP6W+9ysDRIhYuyOBJDdeL1DTY
 JM9f/c/OwE8h7B2AaqzolR1KbdppGz5CTiDDaOJxwXhGzE6W7NvGqNBoDo4bWLriFLGD
 8v1MF+9I5x00lzPIbwFl4wbz6+2h3TM6q10Z4dksOVbkNvc+hffbwgUBEclwaYDDH1ih
 xAvPolO6GYMTK2Sb2FaTqQO8sTKG3u8AY/UajMVQfDRBc/Y5NcCxaHLgjbTFOzBcH7cC
 3npWjioGPzjYYJ4V2p2gRJR/GUg559wbVK4/GaeDYcGNVfnbPdz3MBjvq+hJGnMNepar
 W8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772200660; x=1772805460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0r5tVTwr3FwSzfLr0irG0lziyL9H4aagQEDitRzfyJI=;
 b=wOAKSEfUMlO4UT3G4N3TnuuJmSCVAXQyITAI/wGZ3RgdU1ELhaxeJr+TdRm2w2h0lQ
 051QKYllGxnyus9pql8FFHm2j/r46O17kJlDWpwgv2CJXnvJeCC0VGgmFQkaqMNzrF4I
 bQLrgO83cl0v1/lpIjQoCjqdgy0VkJ7CzgrIztprMR2qRSMsgLCKRfrwctwWAW88r525
 /VkGeLB5g0mV+M3iDNSjAtsDSUKrG1mzFVOdhXEQ9XMsT4MjOapRqKZQIyF02GZszNYe
 rnYYADWfu9S7RKuBkgY4tYPP8cIqdp82LTec6x14xCGMsxoBEldjRNyKXOT7FdsN+qlR
 4opw==
X-Gm-Message-State: AOJu0YwuFM3EuUoof0MiDqDjky3NU83b2h5Fh6DVYh9X/jjMljACnFtN
 /kbcDSBcHxGwt/FQxOK0JTQ5r1xrFB4I6B7zuXUHhRVDoxiLJ5ZIpCBJS3xq1HE8FAFQgL9aSLZ
 6MzP0
X-Gm-Gg: ATEYQzy8LmmIx+Pq/Pybamhf3wlRMIzrdk+FQSelphHb8gwBPQJ2rJz9CCde8W5q+9k
 +iz8aYi7RiygNlboQgy7UjDBia1XqokQutE0hsFl7urBS4uTSRMxNbxs3faWT5ELY5qLx8b2qH0
 +joW/+DLcYUKy42ZATmt6icHtEgg8JgS0qrrHe/4+UsrJABZgK+n7BKJrhe8ax76jPS5uYMHvYd
 hGWguyh5ZTmEWcmEPnEv2ifyUr3GixKJOS1qVCRiDjzi8z1sBKrlpiD+GEZJNB0Xsy5EZn9e8ZF
 7QUrpOo4W4YHxH1w8k2M/yusvdNmPa7gdmwm1Z2zLlL2FCAydbqnZ74wVEo0NBPjwsI8DKKE8sT
 YZm9+acJEqBFpXLdQu9GYsy1z0eXxTMN+rMmIDS5hs2miTIys2iliYwbw9NWuwp9aI4Lekiey/r
 XN/dAC3sDf1KzY05USXDvDWT+evsuV441qCGgP2/na57z4qgxRF8coWKyjKxWkbFtsXmWZcC0ll
 TiwBRLQoWUluFQPyiUONfrbNAGGSuM=
X-Received: by 2002:a05:6000:24c3:b0:439:8ddd:90be with SMTP id
 ffacd0b85a97d-4399de14ff7mr4836650f8f.24.1772200660100; 
 Fri, 27 Feb 2026 05:57:40 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c75b327sm7655163f8f.20.2026.02.27.05.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 05:57:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/4] scripts/lsan_suppressions.txt: Add more leaks
Date: Fri, 27 Feb 2026 13:57:34 +0000
Message-ID: <20260227135736.2280161-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227135736.2280161-1-peter.maydell@linaro.org>
References: <20260227135736.2280161-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/lsan_suppressions.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/lsan_suppressions.txt b/scripts/lsan_suppressions.txt
index ffade3ba5a..bd6ef07079 100644
--- a/scripts/lsan_suppressions.txt
+++ b/scripts/lsan_suppressions.txt
@@ -9,3 +9,23 @@ leak:/lib64/libtcmalloc_minimal.so.4
 
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
+# The walk_path() function in qos-test does free its memory,
+# but something about the setup with tests run in a subprocess
+# seems to confuse the sanitizer. Suppress the errors.
+leak:walk_path
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


