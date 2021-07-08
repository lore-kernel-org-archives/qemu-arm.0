Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp403019lfg;
        Thu, 8 Jul 2021 07:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+EkyAnNA5fBjXm5m4VTMa+oa+YRsm+DUMhWWozCSOiaHPJfmMQioxHhP4L8gDINeIzAe5
X-Received: by 2002:a17:907:86a8:: with SMTP id qa40mr31091715ejc.385.1625756149375;
        Thu, 08 Jul 2021 07:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625756149; cv=none;
        d=google.com; s=arc-20160816;
        b=L/eTtY+SwT1tckub9ZWCl3dC22YVrJ5xu+DdjxzqG76ItrtpvsLmwAUcCznXrN4d1P
         IcEjHqQQtDGg/6zVofxfaEvbVY/bbeu/C32MAErzusbR2ejGdCSY2B2dhsAu/t/LRnkN
         /+oFsaChAZj848Kl0d2zMNv0FGhONRMSoXm3aWdjJ771d8Xq/tj6ZJfa1loPxwoa/R+g
         WZThasYnj/65r8LSgeupVCekX+5dW3mA5doxzrFLRIXytF0fGdJqI5Ea5vOnk77S6sdT
         6RuGG5zf1YCOwrQ9oQgX8dvVbdW9ysT/kOoiumCWslFtA3fzUSIAxMsapCdeou54SAGu
         RQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=JwQPj3QiBiCoFnnjQLaV3JCIX6LKlpqoJ1UyQ5vvgWo=;
        b=IgUHUxRrVWn8pneIRo5X9Zte+t/WDaFaMSZGlhADnFbU+kbHwk92GbbDs5xQtKDHKm
         gBIWBrLo53n6yW8nBn4fdLejeQSBQnBs7Ox3jk2a3Ga9i3TXkmID68+epT5KO+zpe4e7
         Yd+9mVqnGouusmV+M+gPZIZ5gbx8ZrEalGrUECRQcQR05Y7moA6botfRAAosiBGEP1Yc
         IkhIdEQY8YI3/n9kJXnrjpc1qgpyRWMXoR/QiP2H30ADZ7qx135x9ezoHT6+hrCS0yaB
         mdWmwpMsv2yqlI7HzoCFkF//49EiigFAius2GA5mq2ihbq23BBHzrpKlXhO/TRjuDye/
         0BVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M635SPt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si3674421edc.312.2021.07.08.07.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 07:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M635SPt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1VRM-0005bJ-H2
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 10:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1VQu-0005YL-MC; Thu, 08 Jul 2021 10:55:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1VQs-0000cV-FA; Thu, 08 Jul 2021 10:55:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r11so2633170wro.9;
 Thu, 08 Jul 2021 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JwQPj3QiBiCoFnnjQLaV3JCIX6LKlpqoJ1UyQ5vvgWo=;
 b=M635SPt2BA8HwEjuPVL2xBRENUZ90xwLvWvfJAjUfJtiMQXob5vUoZRYnRxeDS4Io/
 tOoxshiimyetk/mwm7GpBGWF5z2zdDNL7kjIsft8NQPyXwsL6lzHs17OLe3SZ1AP2moZ
 Hm9gXjacBm03HGKG7DLVzAFVjDxHs4ZxTCafudTdo621twRKbuAE0LpTx58Kiwyvn0IC
 KYalpfiJGO3dScwGCYo6W5rVyH+NuD/3yOoI9UubAsqe66Y2ggShYq/xxT/UF0N+eXeJ
 6dgSOmyOzKCp9hRPrdEIqoZIXAdlOgg/6GNwn40pt50tsayPXey2MpBWbESXuvDGdW9y
 WvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JwQPj3QiBiCoFnnjQLaV3JCIX6LKlpqoJ1UyQ5vvgWo=;
 b=jFPhO/26NlG1VjEE9o99bTDoxcXYDsE3PA9v7BCi/nveGfDl3MkV5Mw7thL23Kp7LN
 dYDlcii1JNgsgvLByLJs71qmsoIyn3D1l6jxHMvQrC1UzINVexoDUAnyBuUOCCkK1uT/
 F14L/1RiuV8W8P/lkyXd6aLodiceyzhzImE4u2CUgKGvMV6y3yZZyUsZEAe9vfZCFel9
 5QTufkvsX6I0b5KaE4DSY/yb0brvwh76bM9EzxEzFpejKtz9U5gySZd8iNpDKto0PQt+
 OKyPW0h36iALx/qnbvaz2BG99fveJDx7kQXlufz62CXPdNTeIp3uKWpHB3WZOHRIrpNM
 RZ0A==
X-Gm-Message-State: AOAM530phZtH3EC/Bun66TvJ4wjQwGOlyfjZynBZ+PQkjFAnEFCZYZRB
 0pS5jYhGuN8CFgpDWRDvyr0L3eWRSG0=
X-Received: by 2002:a05:6000:511:: with SMTP id
 a17mr35330793wrf.351.1625756115710; 
 Thu, 08 Jul 2021 07:55:15 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a4sm2508462wru.55.2021.07.08.07.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:55:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
Date: Thu,  8 Jul 2021 16:55:12 +0200
Message-Id: <20210708145514.1751773-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /U2mXzFZaHw5

Since v1:=0D
- renamed tests (Peter)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tests: Remove uses of deprecated raspi2/raspi3 machine names=0D
  hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases=0D
=0D
 docs/devel/qgraph.rst                   | 38 ++++++++++++-------------=0D
 docs/system/deprecated.rst              |  7 -----=0D
 docs/system/removed-features.rst        |  7 +++++=0D
 tests/qtest/libqos/qgraph.h             |  6 ++--=0D
 tests/qtest/libqos/qgraph_internal.h    |  2 +-=0D
 hw/arm/raspi.c                          |  2 --=0D
 tests/qtest/boot-serial-test.c          |  2 +-=0D
 tests/qtest/libqos/arm-raspi2-machine.c |  8 +++---=0D
 tests/unit/test-qgraph.c                |  2 +-=0D
 tests/acceptance/boot_linux_console.py  |  6 ++--=0D
 10 files changed, 39 insertions(+), 41 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
