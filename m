Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1625521lfo;
        Fri, 29 Jan 2021 18:05:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxThvt9AnEQqrxj9gpSxnPSQMG5ntPPbAB40GH+xTv183lkfQjl0zdIo00DgCSDbNQU0YSs
X-Received: by 2002:a25:b5cd:: with SMTP id d13mr10800772ybg.252.1611972358592;
        Fri, 29 Jan 2021 18:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611972358; cv=none;
        d=google.com; s=arc-20160816;
        b=fF2bE6VtGvgt2RwEGOkKREg8L6myxcP2xgNyifPVQDsUfxoDPWy+99+zZ+GCZ4fxLE
         TEBb9CTWwxIwAifM387IRzDR0NMuUyMqoBvz9/0FlNSS476uxle5RS9ppX7b98YQitWM
         WDBbKPglB4E/nyMTomIOVdkcM6W59kNklKEihHz5cQ4/3s6I4f87OSu9LKUbN1aJ7yOB
         HPHPl5aE/Hx7bqdfspcL0bcCcWC2f/H+YbeJYsmVKHDPLpwg83Sarjt8P9QtGtl4gxrx
         cP+oBb5oSiVQA9hN8txqXnUxmS3b9XwJlN7pjYCGpD2pthlGbfaPpHkrkv1yNlaWsfB0
         TF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=juwQODmtdvn6bCkwoawWQSLQCGd025TFqesErnaNJGk=;
        b=rSnPTomqi2sYkcHU1O3rg9wAPIgszvQEL7w9gYUfo/MzwMe8JKvewr+CrOP07+WACa
         fQCaGETK0WPo9zweBue5Y7zdSkgYvK8/KfETmFIPFMY+gA5ey1kp8aLhVw7O0IRK4OL0
         AbZ229B7LiBMlcHRGMpTSSS/q33G52A/WygfEljnRkO1UvcCHeIksTU5ekBuLjAwLzW6
         0SF7AW3155znsGL6r1qUdDPjwnAPeMr3AFOkYG2jHgMB57SDKNzitT0zMeNvU+AhnSrn
         gfV5KeS6lXBsHpGTH78KvMXh/j9OMybj29RWfVXpxYTOxQGa4imcUkWEjee/KHOLSt2Q
         LL5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="aXo/BvSN";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si10300270ybj.429.2021.01.29.18.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 18:05:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="aXo/BvSN";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5feA-0004g2-1J
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 21:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fTz-0002ka-FC; Fri, 29 Jan 2021 20:55:27 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fTy-0000qn-2h; Fri, 29 Jan 2021 20:55:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v15so10651638wrx.4;
 Fri, 29 Jan 2021 17:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=juwQODmtdvn6bCkwoawWQSLQCGd025TFqesErnaNJGk=;
 b=aXo/BvSNo1mvBU3NnkxeQi8TkxlnnlCBbz/JTlhSc1P2uBAB+GdYaWbRmPJz5Qo0hZ
 bqP98JT7yZHWwWWG0Q0DnOjejVaHk/DnK8A7ScGdZyfc2kOrbmTDDDvSmakyhsFveVwa
 dSNC13s6qE8DYs49ckmXtVma4e9CLG3h5wQQnOY7C3JJP2vMZf0Nt0heler6VZG/xE5+
 0nRfXqOfyozeweDklBeVEJQWir5aZkxCD2n663McgKgvLUQVJaGiS1hy6FArdD/tDkMo
 kcWUmHE3oiv/fXS5or4ZsZFbS414WIwvbU/YhO+IVWpzhxkcwpDUtnvqeSkiqKIlHsa2
 8sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=juwQODmtdvn6bCkwoawWQSLQCGd025TFqesErnaNJGk=;
 b=TGS8v2kJikgstAnbTy8xBAjoBwGEh63f4VjxiPPz67/0lsDmoIZFZPC12MM8RGgiyK
 aWAgLSsyvAb/NZ1fZA1Tt2PmCTWK7enJlukVxKic1r6y+57n1VoEA4glsS6IIovN5bXb
 6ekHS81ZJ/+/tMkhwaiZFZS4UnM7cdB7oSZfEhEPAAAUS9+1X104RQ+Fr8PMfj9kRxK6
 jZd74LuBPfQRzxhDokean20KKEK5y+8If55AGa/F9c0kzD17nudM80aKv97J7a/eukSH
 IaAHmCh3o3qe6rSiwSVk6JSDD/bHfYMY+LlkbGcEgxySGVfXXeL9jxigrztLUpsU42Y3
 kf9w==
X-Gm-Message-State: AOAM531DttIRhjzmppODCAKbToidT6/JKwAOBRuNECJ5OqmsKbf+yYSs
 8mWfG2RAyGqAnk0fyQZvlF8a+ggJ4fg=
X-Received: by 2002:adf:f452:: with SMTP id f18mr7158826wrp.11.1611971722179; 
 Fri, 29 Jan 2021 17:55:22 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s25sm16116986wrs.49.2021.01.29.17.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:55:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/arm: Misc trivial fixes/cleanups
Date: Sat, 30 Jan 2021 02:55:16 +0100
Message-Id: <20210130015519.4072469-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4iz8xcBr6Xd5

A pair of bugfixes and cleanup patches noticed while=0D
rebasing my "Support disabling TCG on ARM (part 2)" series.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/arm/Kconfig: Add missing dependency STM32F405 -> OR_IRQ=0D
  hw/arm/Kconfig: Add missing dependency EXYNOS4210 -> OR_IRQ=0D
  hw/arm: Display CPU type in machine description=0D
=0D
 hw/arm/digic_boards.c  | 2 +-=0D
 hw/arm/microbit.c      | 2 +-=0D
 hw/arm/netduino2.c     | 2 +-=0D
 hw/arm/netduinoplus2.c | 2 +-=0D
 hw/arm/orangepi.c      | 2 +-=0D
 hw/arm/stellaris.c     | 4 ++--=0D
 hw/arm/Kconfig         | 2 ++=0D
 7 files changed, 9 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D
