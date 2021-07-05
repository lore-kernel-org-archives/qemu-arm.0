Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1172051lfk;
        Mon, 5 Jul 2021 05:20:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu16YMUqCcSgCf9gzPE4ttHl8XUkBqv7pd4XoKgo8y9/oB06KkVvohWGNrSLWH4p0P7cAS
X-Received: by 2002:a50:fe95:: with SMTP id d21mr16087455edt.257.1625487654109;
        Mon, 05 Jul 2021 05:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625487654; cv=none;
        d=google.com; s=arc-20160816;
        b=mGrGfGP1u+smgvwdPgjsc5xbNL0zwkO+abLA9MAmUPUa09rFKx7PqdEM0Rgr6XBfb/
         zZyW78R3h3ioo0hINQq4BvZWY2tzKL0XlrLilUlv9K0kNqTAuen96kMFiVLcPOHRNYAS
         25micYf75aq5a1VsB5l2iamWEAxFgb/eqkKiL/dgjFtzvCG/frJdnnACO0fot+p636rI
         k+Ouxs+6UNm+H8ewi7wtDPpLqzntrEw5ucO4EIusncjinEkDcnEY+UALXUbJ+7CjTfEa
         Od8KI+LeEcm4ctREqZcm6r+20uGE0inm4J4O6VojKsSe+D2iPy2Ta96sxHWk7rU3mu5B
         Eh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ivDqw6cb4tXEXKTbKqgdqyGHQY5fQsdGvOhlrmBitSE=;
        b=zZtjifGx5haPRvvoQjHAH2mneOFHmjpAktHEqc/NB0mOVIeD8qhxojbtQGkdLbcTHj
         7MQfUIgmtA3qrX2hyDSD+o4UKIcymWvvMs+3Ro9LACmS2DFUSAbQPGjkzpyssql5ZeFc
         DXQhjz21dqb21dvCYPlCMXyGZmypgF34VOXsaKGTBADWQ7+xUVkVmYPMynE+AG5v7hei
         tpuFqV14EPvRznFPfDVJs4jTFh/HpVXt5H2eBQszSQla9uoTIh03Rs1lomVX5tysNoGj
         OkzbCoPwNvHeoWMt/XBm8EjMQSNik0Tf4yyJq70dBF1LB5SfzYoPf/KXdGqZEp5eqBRe
         HXlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ODIFsi4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si10650022edo.475.2021.07.05.05.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 05:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ODIFsi4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0Nan-0003hp-45
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 08:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaO-0003gW-Tl
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 08:20:30 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaG-0001yL-6J
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 08:20:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so11106626wmh.2
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 05:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ivDqw6cb4tXEXKTbKqgdqyGHQY5fQsdGvOhlrmBitSE=;
 b=ODIFsi4lC/F0Y1pWfZ6Fm4H1HEjPqU7bzVpl9/mHRXS0cId3bCLWMv0asjIUbejywe
 hm34yPlAKbKnfDRli+74nNnQWW3C5hU/Hm/oE5EiztZah3q9XEIfSl9qbVI8ryaXgpjS
 KRqjNREO1K+RZYlmMVouHxFb4O+SBdGiZHp8teKDcHhX6QgXVkeoscsP3A1vuTTmPJNa
 FMcNkdEH2Qv1rDZxNrYGFeiN3GZy/lX0F8x0JHQWkkKfWI7WlLQlKsomrfkuGW0zmvHN
 yMpf0/koJeTnrsH9qy/jerIPxGITuNa0YqAVQul5C17cdGdoVbfYol33hsQF9q8mvsB5
 copQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ivDqw6cb4tXEXKTbKqgdqyGHQY5fQsdGvOhlrmBitSE=;
 b=HqsfM8qPf5zGlliv/MXnYQcDzxt3Sornbrc/rNlTUFF/uq91WOklnwyMc0oKG398Za
 P5l9hcO9Zhu5x0P5Fieh+QqJitQOOoUZly6XSPRPF1dGw0WLFAtobLpGEbtT9FVgz0Zf
 ZRlJcD95suY1q2sOnR0Ag3DudKPH1KV4ryi+ptUpiFouCmaxmzqJ9PGBNkDqLyoiOLXW
 KtlH6UBocL0XTMVwuqjzRy2J12yMRVjEkB3hVRT6YlwDLid5NfK9lC7uA1t6Jy4i1SQ+
 sFfIpDarVWOK836AjtcCaL+9Qlmvj52UGU/yy6hd/N/eMFJjB931AvwflAJYfm54yhHw
 4zjw==
X-Gm-Message-State: AOAM530pcFIX1y5+Cl3Xl2Q/L77HWM1H87x83ajujo3LBM3FHUT0+mrW
 qEbD5lmukmCwv+eShY0ub/q6kxwLu5PakD19
X-Received: by 2002:a05:600c:4e94:: with SMTP id
 f20mr14551275wmq.172.1625487618634; 
 Mon, 05 Jul 2021 05:20:18 -0700 (PDT)
Received: from orth.archaic.org.uk ([81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f18sm13450406wru.53.2021.07.05.05.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:20:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] docs: Add skeletal documentation of cubieboard
Date: Mon,  5 Jul 2021 13:20:09 +0100
Message-Id: <20210705122011.753-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705122011.753-1-peter.maydell@linaro.org>
References: <20210705122011.753-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7oM9U/41zv/7

Add skeletal documentation of the cubieboard machine.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cubieboard.rst | 6 ++++++
 docs/system/target-arm.rst     | 1 +
 MAINTAINERS                    | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 docs/system/arm/cubieboard.rst

diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
new file mode 100644
index 00000000000..2be8a278633
--- /dev/null
+++ b/docs/system/arm/cubieboard.rst
@@ -0,0 +1,6 @@
+Cubietech Cubieboard (``cubieboard``)
+=====================================
+
+The ``cubieboard`` model emulates the Cubietech Cubieboard,
+which is a Cortex-A8 based single-board computer using
+the AllWinner A10 SoC.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 13b3eeaf076..0a3ef309472 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -85,6 +85,7 @@ undocumented; you can get a complete list by running
    arm/aspeed
    arm/sabrelite
    arm/digic
+   arm/cubieboard
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index cb8f3ea2c2e..76a2c608d1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -559,6 +559,7 @@ S: Odd Fixes
 F: hw/*/allwinner*
 F: include/hw/*/allwinner*
 F: hw/arm/cubieboard.c
+F: docs/system/arm/cubieboard.rst
 
 Allwinner-h3
 M: Niek Linnenbank <nieklinnenbank@gmail.com>
-- 
2.20.1

