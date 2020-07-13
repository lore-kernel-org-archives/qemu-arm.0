Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3506911lfm;
        Mon, 13 Jul 2020 10:58:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdrn+JXYmf0WHW6+IkUftipzA3wEFOqcKPrBH5dJeYkRsHr+xiFIPnikHnIrqNhP7qJfYk
X-Received: by 2002:a25:c547:: with SMTP id v68mr1781446ybe.508.1594663097247;
        Mon, 13 Jul 2020 10:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594663097; cv=none;
        d=google.com; s=arc-20160816;
        b=eTUSmrO+6lFxh2AtEMKdp472jEprK0Pa8BRlV9JRLXkahphodTsFdsJX2cVRZCz/5p
         zkb5zPfMAueH51KKEajg/f9bNkYSOekyqjmaN57cngjcLMen4enJK+Bsvma3Ml78Xn+t
         6n+MLzUvPXRTxH50mbgX7KT9HXni8OjPFQReecWbXlgiBdkUQFH2aA5XDG5MQ+yV6k+n
         DsZPjDhSQ9SI1a8C9e/ly9kFTzlIbNyq974kSS+mIIJSsqtR65So8fPh8kJHH6kUGpjB
         n8k3WkhSIsGpmM4JbWHIYjpS4eNyQmcknikVL9Bpe+lkzcZnv3T0Mp4vjTn7I4sV8yRJ
         hOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fdwwwNahFXVwjejUuWZRnNtqLGJwsuxtV0zLzrE0XA4=;
        b=vJC6ymvIi48w1Qyvtx6Wv9RxLr7pJ0Oh5gO/gv0t9ZpLtPbgaHg3jWqta3c+7AqDEh
         4UZ2aSPNwHY2bqf0RPTn+LFfKfVptD7F4MvllTNgZzadLqabTNNav82705OE8mPPMhu3
         OMk7AhTgIBSLIwNXOkgVoN9C1nikAifL9zvANJll8pPIZPM7uoWxu6ITLI6hQ5HgsvoB
         u4Q+woVNLuhALVa+0bn5lBpSAPeH0W9mrICyEy+dJh1Eksd84PDyI5HBitQ2exnV8qfy
         x38g8rubMGveJFW1WIiBi6QmnJcrjAbOB7EIOtdaQmWintPYwWgBP+p6twJP5nTGM4ae
         5oHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fel9EeF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10si15406971ybb.351.2020.07.13.10.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 10:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fel9EeF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jv2iW-0002Vn-Ex
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 13:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv2i9-00027K-U5
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 13:57:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv2i7-00084j-JU
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 13:57:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id f7so17564570wrw.1
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2020 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fdwwwNahFXVwjejUuWZRnNtqLGJwsuxtV0zLzrE0XA4=;
 b=fel9EeF3QFTd1eW9Ypyysv6jyrqbsmHqt4673HKN14YXbp51+UBNzD9RiKspQtVGNJ
 OKBxDJkObaMb+SYJ2n7PK/Xe84cjR9uLGcZuYyZj8woek7LxbvfH0sMf6ni0ha44iOcf
 f1rBCuLXGN23vklZASQ3B0Gocyz2wHO5yo6/NAM+tfcfpGuaZnNI50PtVX19muRjmkix
 MDUe2cLHAJ14rn10GSyC0ly2gG8z1IGMTna0WXloZKJfrSWA4vmqqvGYhIGOtnTZLG2P
 1o0T+0rMCn9UDV5Q9HjRFMsICqG9bl5EgChCEDB4TvmNk6KdMLHz67viI+F6tQezSelR
 0F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fdwwwNahFXVwjejUuWZRnNtqLGJwsuxtV0zLzrE0XA4=;
 b=YhF2NpbJ9XIOhSd1YAjoAO2FcnnLsgDB9mHMcuKkfw82FfVB9lctycvLtTLe00YPPx
 ty1W2TCDk8otxMNgVEJwwglEjgKOlYkttrRCm+W6/+A0BdgFkOGLEGrgee8nSkm00ee5
 gg7PdTIb/i/BxmgcKwczWWq5X64OMBcaTz1T4fVPJGomf8pAdrvrT2Kc2DAXsJ8XmA0p
 ZowoMaimxyEz315Ou1d7lq8A5vX29pQswJ5vQlqt7eTNudim6c4u/aUoJ+Fn+3dzC+RH
 9XiQhp1pGoCb3eY83hZKKyCtYC3XtT1Fynib7pGo0JZl8TqtrWmDa9IKeZiz6L2NJzK5
 hPwg==
X-Gm-Message-State: AOAM533h8Qf7bfK+afy/n0xPW2GU/FD8lpnYP4keaXL2r8eIhsJXwlZi
 yARS94JXdt0Itxzz4zXsKA3Az6aC4ARkZw==
X-Received: by 2002:adf:9283:: with SMTP id 3mr569259wrn.231.1594663069770;
 Mon, 13 Jul 2020 10:57:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j4sm25723721wrp.51.2020.07.13.10.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 10:57:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1 1/4] docs/system: Briefly document canon-a1100 board
Date: Mon, 13 Jul 2020 18:57:43 +0100
Message-Id: <20200713175746.5936-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713175746.5936-1-peter.maydell@linaro.org>
References: <20200713175746.5936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RFpYUL325x8l

Add skeletal documentation of the canon-a1100 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/digic.rst  | 11 +++++++++++
 docs/system/target-arm.rst |  1 +
 MAINTAINERS                |  1 +
 3 files changed, 13 insertions(+)
 create mode 100644 docs/system/arm/digic.rst

diff --git a/docs/system/arm/digic.rst b/docs/system/arm/digic.rst
new file mode 100644
index 00000000000..2b3520ff5e1
--- /dev/null
+++ b/docs/system/arm/digic.rst
@@ -0,0 +1,11 @@
+Canon A1100 (``canon-a1100``)
+=============================
+
+This machine is a model of the Canon PowerShot A1100 camera, which
+uses the DIGIC SoC. This model is based on reverse engineering efforts
+by the contributors to the `CHDK <http://chdk.wikia.com/>`_ and
+`Magic Lantern <http://www.magiclantern.fm/>`_ projects.
+
+The emulation is incomplete. In particular it can't be used
+to run the original camera firmware, but it can successfully run
+an experimental version of the `barebox bootloader <http://www.barebox.org/>`_.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 1bd477a2936..8fa51a22817 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -82,6 +82,7 @@ undocumented; you can get a complete list by running
    arm/versatile
    arm/vexpress
    arm/aspeed
+   arm/digic
    arm/musicpal
    arm/nseries
    arm/orangepi
diff --git a/MAINTAINERS b/MAINTAINERS
index fe8139f3675..0f578040b99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -634,6 +634,7 @@ F: include/hw/arm/digic.h
 F: hw/*/digic*
 F: include/hw/*/digic*
 F: tests/acceptance/machine_arm_canona1100.py
+F: docs/system/arm/digic.rst
 
 Goldfish RTC
 M: Anup Patel <anup.patel@wdc.com>
-- 
2.20.1

