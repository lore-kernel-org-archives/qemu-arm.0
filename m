Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11CCCA9ED0
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 17:11:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGJYT-0005gk-6l; Mon, 12 Oct 2026 13:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJYQ-0005fN-4m
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:11:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJYO-0000Df-IR
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:11:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so25980705e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791825071; x=1792429871; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wzTxgcJt5LOfEvgdp0Bdy8cA6LUtFfiG4X3ZmZDEEX0=;
 b=fn04xcCjQxKTzoxxibn2XbBw4UuEJyKgv8Bl59uCq2tMFiscf6GO6TDxHQaV89CYCD
 EPuB5Kq9zwPqiKouPAXBig1djNpygLqfuGPTvu842FP+5DkUIP31AvZI3Q9IUYr7AwGP
 +FvVFgTWGmgN7SEDiWvU2/wU9Mdpvev9Yd2NplgWM1NU+Aaxtj0koHAeXRrXB/8ROzBY
 bZBkWsbpZOjgLLSsHOWbYioGq1GkVynwwFVYMrgBVHb3fHzC/f2DzCXvrJIvltwej/Ri
 vNc9Sch3dO6T9ncsPOFDBiK7pkFnpJtsJZqmsvIG4Q9YHOMrgU8RgmVtpcFT5HrYS5pg
 ztWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791825071; x=1792429871;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wzTxgcJt5LOfEvgdp0Bdy8cA6LUtFfiG4X3ZmZDEEX0=;
 b=u+DnYPl7adarkBGIkav+EgycGHlzpUnjQZz1iMYf6a8eXZyZP2iTWpF32qCFZvzMsc
 j0UIwzhDXG+KW3AifY+UIYgJkiSz+1MbvgKoQtWe7SHOMZ/0Uxbi7dTkOJwueb6AMn7m
 VHOWBCbmXS1YAUEuk8bTAiMs5inP6GJH1oeY4zG6e/Qy9W3COAnGhwRL+ZuFiAg1An8W
 /kJQTx/kVrTsGpsiw54JK5sjeVbMGtxxCQ2j8rP35yEi2gcjYvJDMa4SRtK7J3uB3EaG
 nmPRtaL4a3B74l5dhyOmjawjdFgYlOXwfH709t8cQ9iUct4E9iG8zOQm2xqPYJsbRnh1
 j0Qg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzlIhyADJZnGhC5FNumlh5uvN+yqsY/iQV2tfX6KyGqfkNkgv2sZ79OPdw0fzJ2r9mRLjgsGh6zMA==@nongnu.org
X-Gm-Message-State: AFq9FYKqFaEONzN0bhcrHvSdfoyjLGWD0KgHO+iOH7yGaH2ckRrjtI/r
 yKv65C0Lpg2g5uIX0oShHX9RftaocNSlZQ2xUsrEeEVh6DNNZb9a3UUxn3WUuNd0Qjs=
X-Gm-Gg: AYBFou3po1irOyy1/o3LQk1sT9gIZcCME91AYiRGhYeC46vsd+t735GNfKCSOndYEYP
 K1oXFsemZ5YhpQsmZXDG1ZJvuUpGVyLVUVYYx11dWGNTpn/iA7FXm06N5eGUiiw+w5Y/5sbq9+X
 TQnqMVacZtKz/MurYbQIs9DyA1qHv6esMtCOCm+VKug2S7Czf+/sENs2bVXqQQYZIK68a7bBTGr
 CArFeXvlJOubHiCM8vyvB5/NDPwQI3QoPM4iARfB/7MLaY4SwNZLn/OFnKeNuOT+FUQ0+bEKLG8
 fpp1Gf4vfh4jBwwrkaJAuIzbDfPCEU7DupeA9OoacGt6zmYAnK7jFVl1Vp71K79HRbVVCHsU10b
 RXtabNUc5H52bKvUC9W5eePRQr+nVKBXXbdRaVSuvrWoUnb/2vhMg1+rK/l262Ixe6KcZPlM0Xe
 2KpruukA5dcgE7C230IIyMPy48DQtkkV14wsCLZCF3sEC6iptsjR4qySLHw34s2yDl7tcGog==
X-Received: by 2002:a05:600c:c049:b0:4a1:9a97:c88 with SMTP id
 5b1f17b1804b1-4a19a971118mr69032095e9.5.1791825069052; 
 Mon, 12 Oct 2026 10:11:09 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf214a1sm346018185e9.7.2026.10.12.10.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:11:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 83B0462117;
 Mon, 12 Oct 2026 18:03:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, Ani Sinha <anisinha@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 15/16] tests/functional: update s390x tuxrun images
Date: Mon, 12 Oct 2026 18:03:29 +0100
Message-ID: <20261012170330.1144446-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012170330.1144446-1-alex.bennee@linaro.org>
References: <20261012170330.1144446-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

We now split the fetching of the buildroot image from the kernel
itself. This is because we will want to access additional metadata in
future tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/s390x/test_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/s390x/test_tuxrun.py b/tests/functional/s390x/test_tuxrun.py
index 086466af81f..8e0261e2b7f 100755
--- a/tests/functional/s390x/test_tuxrun.py
+++ b/tests/functional/s390x/test_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunS390xTest(TuxRunBaselineTest):
 
     ASSET_S390X_KERNEL = Asset(
-        'https://storage.tuxboot.com/buildroot/20241119/s390/bzImage',
-        'ee67e91db52a2aed104a7c72b2a08987c678f8179c029626789c35d6dd0fedf1')
+        'https://storage.tuxboot.com/kernels/6.18.54/s390/bzImage',
+        '5efeb31754b211440e1595ab11355bb006fe78a2c0604ed0a8c55c4598b71aec')
     ASSET_S390X_ROOTFS = Asset(
-        'https://storage.tuxboot.com/buildroot/20241119/s390/rootfs.ext4.zst',
-        'bff7971fc2fef56372d98afe4557b82fd0a785a241e44c29b058e577ad1bbb44')
+        'https://storage.tuxboot.com/buildroot/20260924/s390/rootfs.ext4.zst',
+        '5ba18c4d18831c50a0c743990f7bdee1d3b520629d423c55b668d8fbbac9c6f5')
 
     def test_s390(self):
         self.set_machine('s390-ccw-virtio')
-- 
2.47.3


