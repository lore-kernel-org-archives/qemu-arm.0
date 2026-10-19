Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B6606A31E
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:28:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIt17-0000Yg-0b; Mon, 19 Oct 2026 15:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0v-0000SK-5d
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:18 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0q-00033S-DL
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:16 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a1dfd49525so15079655e9.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438028; x=1793042828; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=R4RJkr92GUc2ZF3hnVHuHTKb4cA9SH2XyXh8JZQS20s=;
 b=Cz40t+3Qav7gx1qbx+PKVsxoSvW9UwnOOWydxeZfQjxdwrgMvaP9iWfXffZiQuT8G5
 lc84utKSchf6uR864hmR7SnXRkztWJco8IgMG39SpLOC3FSUy79yOjxWmAlzuHIa6nID
 VL9y3v1quGFa6khMRV4HDrv6ggxatBxnwJm5EAzHqemmuft0yzsPvMiKpwQuoXTp71H1
 TX663SEUvuTNAwmrD81dyltCotiQwOjh2jo9xx2bvqZqyfQ7zazJKMe+Ys5sPWtZCz4+
 ltY37fgV0erWWs+o3y0g6Oy9KUvaCWvxqgGFq//fHyyN1v77Z4QETQXOwzJA5AomfHS4
 sxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438028; x=1793042828;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=R4RJkr92GUc2ZF3hnVHuHTKb4cA9SH2XyXh8JZQS20s=;
 b=WGnW7XPN3fvlTtT4dCC3A7T4UE6jefqK0KxnVCROPbLkT7ExQ2GpOPdlB37PpAvlkq
 Da47ioob5k4qmi8LBhl6Fth5w/tQjXcW/cdHIXJxNd2xIxvABqFRgnBMv9mIr4CM0bKD
 C4Nu4Pcp6xs8+VUTMUIVlyYehxmX2aZjE+yavu/JaFahHZJiaShP5Jpcezbcrrz1RO7d
 W+I2pEVbF3ysYqaAgodAzelirSIR1HzEK54Z9I5wwBc8QRDfVMoIa35c2E0pmWHkb7tc
 aWNyF/oU1mF329LURwyp2tyHJ+e6BtHcDC9HkdtH3zxlnwWmqgD1DlpogDdPaZxO5w4y
 pTEw==
X-Forwarded-Encrypted: i=1;
 AKwUvBziU0X2hWD/MM9UFJbREtekfUJHZjqiBs1i+KgvFqDphJXno5nVz6Rr4ZuqRNbR0+n9ODlM7Z6hTA==@nongnu.org
X-Gm-Message-State: AFq9FYJrGAmah1qu9pCTU0yuQP1mosgfwMmuzOpF9K+eQ5GD6/F7FEf1
 7OZoDiDIG4r+R42e+qrj3AvEbU26GSefKbe9xwMZ7UbGi+1gFHav+O4DyyW1mN3lDmg=
X-Gm-Gg: AYBFou0Uf1Y5Yh+Zjbd796m/K72B1VB7QjaU7VaQ9dmbh0EAu8s47c0p1gxHLVI0lbf
 rTT5xbAhhwinQB+7+hzGUnvxmJm89GjcDOEp2p00jRMBBwMwFBwoP3nhLr8h7znNbMh1BzGIrCe
 8qSJofHExb4tkGsDjwHTHziemZtUEj7EDT2c5DN+kIbb5jZmbyybiUUrdQyAhrkZqds2mi/VUeg
 boE83qkOyoX5P13aH3Q0+t3XGesI+iV+vXmXmcKVq9+Jtq0bKhuVr1pVNftU36k+iHyYkioedVt
 SrL7Ngfj2EV5yZfWbmq7QktbYb1Q5nwdijQmdRK9fGKaYhygkAjJ4TZtG0xCzOxOvKANe1rUKvt
 eGmz1ObZ6WASivPJbEYKZkLl20dZF6eqFuG3ob6QjsTnH5d8544to4razZAWByGTxc3/xBHPy/Q
 MlvrREXBqBukiMLR7trdiIh7dk4C4mi/OfFUs3bCCJWmTm8yCYTtWS/qdokvBIPhQlA3//rg==
X-Received: by 2002:a05:600c:8485:b0:4a1:f0bc:90b with SMTP id
 5b1f17b1804b1-4a1f0ddfef8mr24336585e9.29.1792438028148; 
 Mon, 19 Oct 2026 12:27:08 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cf04ffe9sm209153285e9.0.2026.10.19.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:27:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 315955F957;
 Mon, 19 Oct 2026 20:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Ani Sinha <anisinha@redhat.com>, Anders Roxell <anders.roxell@linaro.org>,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brad Smith <brad@comstyle.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v3 02/19] tests/tcg: fix buffer overflow in
 multiarch/linux/linux-sigrtminmax
Date: Mon, 19 Oct 2026 20:26:47 +0100
Message-ID: <20261019192704.3220373-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Max Filippov <jcmvbkbc@gmail.com>

Fix new_argv allocation size to be `(argc + 2) * sizeof(char *)` bytes,
which matches the way it's used to store `argc + 2` pointers.

This fixes the test for me, which otherwise fails on xtensa with the
following message

  linux-sigrtminmax.c: 59: main: Assertion `execve(new_argv[0], new_argv, environ) == 0' failed.'.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Fixes: 6f58b090328 ("tests/tcg: Add SIGRTMIN/SIGRTMAX test")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-ID: <20260708150541.2137546-1-jcmvbkbc@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260930164649.433573-4-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/linux/linux-sigrtminmax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/linux/linux-sigrtminmax.c b/tests/tcg/multiarch/linux/linux-sigrtminmax.c
index a7059aacd9c..b5ea65f3d39 100644
--- a/tests/tcg/multiarch/linux/linux-sigrtminmax.c
+++ b/tests/tcg/multiarch/linux/linux-sigrtminmax.c
@@ -39,7 +39,7 @@ int main(int argc, char **argv)
     assert(qemu);
 
     if (!getenv("QEMU_RTSIG_MAP")) {
-        char **new_argv = malloc((argc + 2) + sizeof(char *));
+        char **new_argv = malloc((argc + 2) * sizeof(char *));
         int tsig1, hsig1, count1, tsig2, hsig2, count2;
         char rt_sigmap[64];
 
-- 
2.47.3


