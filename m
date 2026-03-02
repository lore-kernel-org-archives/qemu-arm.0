Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DFEC624C6
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 09:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vwzU4-0001Ib-Vl; Mon, 02 Mar 2026 04:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU2-0001Gp-SG
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:34 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU1-0007g9-EW
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:34 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-437711e9195so3201769f8f.1
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 01:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772443352; x=1773048152; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QgoB5HfDRfRQ2Ou/Ss9qWoCChifI8a9FD/ElPyWHfHg=;
 b=E/euRnZcW/JfUEOUWU67vA30NnJde6NE4ILOQMQF1ziyLYGLXTlXFjDYV4JLHvGmlK
 p4R3MKh56Ro2J3wpnGVW3e3Is1thN509Dsb17pkct2SOcIt+5tsmue35zAsW4ZbLyAKy
 xyUpNMtw5WxjcJeg0TdYcflKr66iG21XKs4hzM3yCWFq/uXIgMqS7VB6VQtMal6sFzlg
 /1KRzSi3/xjr3uj5PeKvnni5FlU97Gc40EzM0zDUMXzj2gK2PRe3qRNZptZ792cdrmF3
 y4XMLRmu5aM0GEjmLGTvM5jFE6HnL82NikWIfMUghQBolJG6+3RKDLJNc7ZgLxdEi93M
 IOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772443352; x=1773048152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QgoB5HfDRfRQ2Ou/Ss9qWoCChifI8a9FD/ElPyWHfHg=;
 b=R+9FNvFkbMVTPdbjTFa9WB6Rjud8I6+kpT4aUHAh9ZuyjNQeNQ3TeCJAoPbR9EKm0R
 OjDnWFBVcWzH4KZGZFQLWH3BqPTfeb7C2lV9fYy0VjHnKeZKnxctjuYcU3H2svUAPXg4
 /BzSSIggpBhE0ImO6aYuHp7gDwfB9LRJYVD4b8hIxiWPTAgEcQIxXGBtrEPmIASoWnhR
 V5zCS1yOLlQZdE7WwzYp5c6Cc3evOWiwYGVwSQqw1HggyYOMcENsRGG7m8QDDkvyg5ei
 QsHnKeAx5HIMxzqkB2GlUXscUFcL7dJtcSQvxIDUxUNbM0t3ZWhY+uZzp+mqg5+wNrX9
 Etjg==
X-Gm-Message-State: AOJu0YyEQy44l1KazZE8Lud6W9F8uD/kwMUE9+fIpC+IMomhVvVrK5st
 aCXjlzVK/rNRtOgrzs/6QpQVRr7P+gLmNGDPDhXcRiuVq+xb7hxrQlrE43NCMQ1dW2L831JwjCo
 RnZKU
X-Gm-Gg: ATEYQzw97bubXKCThorRNZ2wVR0PAIYLKUhC58ydCA5a7AR1xq6rXmDMQ1N6TTRh8g4
 lRnzA0XL4PxVd5higSo15JTN35SaO1DuXEx4laCcyjJw5vxZirSxtBv+h1ovaRFt5MJrAL2aoFZ
 MWLs0rlsQIKgXKBORyesk/5jxGWdcylNxaheIXm9LqM1C4c6eo3uOG11fAXiE6XjYCZ/S1ZyiXc
 xynO8CzA2hFdEgMdvtkr+o1M0icd1BeQoz7s3cqHYo8SzkrjykpqkHm+kuos5uGlO2j18jtMgNk
 3LD5YpgYTUTXJMJ/Rl1mvmwZgcJI9pr7rKPECIkLjm6SkKcfHK+SQyeRWI+g5ToljMDBm/vfDUc
 0jNC1bDBYzRIGqFU1TsAAb4Yf/7NGwOATis0HWsyJFlWbHe+GGYtfbyWafqEtMwvK3s62yddGvb
 f3YzXx6Hi2G67RykUB+JwpJLCaRi0edQw9yWodigr5TSIizkI7PWMuEvRuQ8PSpT9mYuo8GYtRu
 bjmXnIonY1EV+KIuGtNOXURjhqxGQw=
X-Received: by 2002:a05:600c:548a:b0:47e:e20e:bb9c with SMTP id
 5b1f17b1804b1-483c9bdb16emr183788885e9.8.1772443351719; 
 Mon, 02 Mar 2026 01:22:31 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb9d9c6sm129435305e9.14.2026.03.02.01.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:22:31 -0800 (PST)
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
Subject: [PATCH v2 4/9] tests/qtest/iommu-smmuv3-test: Free QPCIDevice
Date: Mon,  2 Mar 2026 09:22:20 +0000
Message-ID: <20260302092225.4088227-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302092225.4088227-1-peter.maydell@linaro.org>
References: <20260302092225.4088227-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The QPCIDevice we get via qpci_device_foreach() is allocated
memory, and we need to g_free() it after use.

This fixes asan leaks like this:

Direct leak of 64 byte(s) in 1 object(s) allocated from:
    #0 0x622a5f16913d in calloc (/home/pm215/qemu/build/arm-clang/tests/qtest/iommu-smmuv3-test+0x1d413d) (BuildId: bc598be1f4ad6d1a9a600c55aeef36108bdb6a04)
    #1 0x73ee41c0f771 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x63771) (BuildId: 116e142b9b52c8a4dfd403e759e71ab8f95d8bb3)
    #2 0x622a5f1d4cec in qpci_device_find /home/pm215/qemu/build/arm-clang/../../tests/qtest/libqos/pci.c:82:11
    #3 0x622a5f1d4cec in qpci_device_foreach /home/pm215/qemu/build/arm-clang/../../tests/qtest/libqos/pci.c:34:19
    #4 0x622a5f23cc73 in setup_qtest_pci_device /home/pm215/qemu/build/arm-clang/../../tests/qtest/iommu-smmuv3-test.c:45:5
    #5 0x622a5f23cc73 in run_smmuv3_translation /home/pm215/qemu/build/arm-clang/../../tests/qtest/iommu-smmuv3-test.c:74:11

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/iommu-smmuv3-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/iommu-smmuv3-test.c b/tests/qtest/iommu-smmuv3-test.c
index cced49a9b6..dae9821b92 100644
--- a/tests/qtest/iommu-smmuv3-test.c
+++ b/tests/qtest/iommu-smmuv3-test.c
@@ -77,6 +77,7 @@ static void run_smmuv3_translation(const QSMMUTestConfig *cfg)
     g_test_message("### SMMUv3 translation mode=%d sec_sid=%d ###",
                    cfg->trans_mode, cfg->sec_sid);
     qsmmu_run_translation_case(qts, dev, bar, VIRT_SMMU_BASE, cfg);
+    g_free(dev);
     qtest_quit(qts);
 }
 
-- 
2.43.0


