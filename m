Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2C9606A85F
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgaG6Is4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNpUw-0008JI-TF; Mon, 02 Nov 2026 05:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNpUv-0008In-0F
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:42:41 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNpUt-00082Q-8a
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:42:40 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso19325875e9.2
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793616157; x=1794220957; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rpqGaBE1hPPTNKsqwFrLZc6umcuff4TfF9FfMyquneo=;
 b=jgaG6Is4yQKLqRpdX6kojmhjrpQqDK31J3Ii9wZc9KoaKOVdC8SwbIQrEAr6+/Brln
 q43toVuyQtRwNaH10WvBnBnZPPS0CiMaGwRWejoiv0PLWjDyNeZF+8I+lkcF6D/gk5dN
 fw5MNdLa+obFKSz0akC5mf70/xkHXb0zmJxYA9BevorcR24a40EV/8w4aWe58UUYavFq
 oSNeR4mO0G+Hw5+9ce5QPizopMKedi+tefeX5bH1G9eiFrOZF+d+sNjrteZuCx/AvglQ
 BAC3k+/9hY3fv3NYxzVammqhIuDyq2k3wjuBQ+gNsftpH81MjlcR5HlQaPjOW+9HX7mk
 3YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793616157; x=1794220957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rpqGaBE1hPPTNKsqwFrLZc6umcuff4TfF9FfMyquneo=;
 b=tJltWfoG5PYH8L4zxRKVc8H29rb85IV+Uis7v2fzU5Lz9l4PMuZLe4Z8UGB/aQJXKo
 UghpItW4yd/o9SxHhrQGfh+TPaVE62Eu8dnYDoxvfjo+Kj3FXYz9ask5r4+vpNo+6zTF
 q2nwlVNvXQGNOwri8o+lJcd9iWhbZGIenfMvkX+qUusaGvY/9ghGnrddRQ4eo7aO1Az5
 w9cisnqNU4mIyH2Fue4FyYocdw7fqA0yvV8EKvSnYXsscUc9Zyf+Lp1JIgZsaxFI6IXc
 Cvakf2v3O/+UxKBuWUHMWP8Gx2Wz/AlL3OiyG9WGszB4GqiWu74ZdKlnjJvpvynpPLDV
 0viw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkKZdnkO+ZBzAqkBBdAs/xgy4L9Q/MCaU4PEAaVQ0XlswY2+7WN6d+jjsGM/qQpTopNIUQeHD6vA==@nongnu.org
X-Gm-Message-State: AFq9FYJvQ5erdHPJZNotLe1ZCpgOGJzW3boNdCaHOJqfAOaW9bC0cLWn
 onhZJEMibEzNTYT5tmcO+FX0Xc5Er2v5jLQEu+63e62mNXi7/EWokPdv
X-Gm-Gg: AYBFou1e23J5C+2d4Z+LEM55TSgTj59hzRWACQqboYav8kGceEqI+8YH+9jLlbnIYtw
 4FScj0RFxGvESZmjywhnpeHdqsPuPVzLNsl6Pt6nEH3qD4wNFkyLPQSJalAVmkAJn2WRfDTwlAB
 lUyT09eRT+gBTVJgoCtX4MCzYEipjp+iSSKgIMjQl/5JdJJD/b8AC5bNJSvWkiHe/N8uiwHzdEr
 JWN7cHevnJ0EPh1qnUAycmXKDL1h+arIB4EmOtDUF9T6WkAV5q1S0+5AMoWTQZBpU4q4MRmwFTy
 1i3LL7nxgmyDlRbK9wgkFTaisIGt39BW4Jd/8mm1QtGVySLHOxDvP4Y5TANhRbeA6pxBhkR5q1l
 AJZAeRpjI65v9oRzhOfHH6APq6nEYY7nu80qRSmOceu8GHCCAC1qVCkrM9nY13FDFer3g/HbXcs
 4KS/O0D33VsgfLzCe1YVw57HEdXCv05fJPm0EFqMHcTzDWxYKAmB2l752qSHZX7RrVlM4waROik
 5IhUXAfivBvB+Oi+I42J/Tfr/RYV489UyW4zrrdHz4MULLGCd1FuNWNgIOqR8ro7XFxNlpGgr4x
 cgT5H7NYUdBH6G6NHsgBPDD0BnMCYpBwMDTy9QtPdUNAiqsSBT07tKgtuh/JrxD/eKk6IQhFf3x
 pnyOOzDGBb1JXs2JqbEbpsxI=
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id
 5b1f17b1804b1-4ac174711afmr213347655e9.18.1793616157439; 
 Mon, 02 Nov 2026 02:42:37 -0800 (PST)
Received: from localhost.localdomain (email.telematik-zentrum.de.
 [87.138.218.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf67aab10sm257253035e9.9.2026.11.02.02.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 02:42:36 -0800 (PST)
From: Lorand Marton <lorandmarton.dev@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org,
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com,
 jasowangio@gmail.com, marcelomanzo@gmail.com, serg.oker@gmail.com
Subject: [PATCH 0/2] hw/net/bcm2838_genet: TX index wrap and full RX ring
Date: Mon,  2 Nov 2026 11:42:36 +0100
Message-ID: <cover.1793613972.genet-ring-fixes-v1.git.lorandmarton.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=lorandmarton.dev@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Based-on: <20261027143036.44973-1-marcelomanzo@gmail.com>

Two fixes for the BCM2838 GENET model of "[PATCH v6 00/17]
hw/arm/raspi4b: working PCIe and GENET (real networking)", which is in
target-arm.next. They apply to target-arm.next; if that is simpler,
they can also be folded into patch 12/17 (implement GENET TX path) and
patch 13/17 (implement GENET RX path) of that series.

- The TX consumer index counted past 16 bits, so the first transmit
  across the wrap never ended: the device sent the ring's descriptors
  forever with the BQL held, and the guest and the monitor hung. A
  guest sending a sustained stream hung after about 65k descriptors.
- The RX path wrote frames past the consumer index of a full ring and
  overwrote frames the guest had not read. The fix keeps them queued
  in the net layer until the guest frees descriptors, as e1000 does;
  real GENET drops them and counts them in DISCARD_CNT.

Patch 1 adds tests/qtest/bcm2838-genet-test.c. Each test fails with
only its fix reverted (the TX test hangs).

I found these bugs while running Raspberry Pi OS images on a model of
the Compute Module 4: https://github.com/LorandMarton/boardtwin. Its
QEMU changes are on the boardtwin-develop branch of
https://github.com/LorandMarton/qemu. I intend to send the board model
(raspicm4) after the 11.2 release.

Checked: each patch builds and passes the test; the aarch64 qtests
pass (33, 3 skipped: the slow cdrom test and the two swtpm tests).

Lorand Marton (2):
  hw/net/bcm2838_genet: wrap the TX consumer index at 16 bits
  hw/net/bcm2838_genet: hold RX frames while the ring is full

 hw/net/bcm2838_genet.c           |  42 ++++++-
 tests/qtest/bcm2838-genet-test.c | 204 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build          |   2 +
 3 files changed, 247 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/bcm2838-genet-test.c


base-commit: eb5ac4b5bb4e221771cef0c53004f99499133f3e
-- 
2.56.0


