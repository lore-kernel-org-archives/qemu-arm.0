Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2828303lfo;
        Sun, 31 Jan 2021 10:50:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjgjxoTNpAVvpL8tHZR0l0aVTGURF6vmft2mEsjV/UwTcncBjW/iyyLQD3FWZRZQLIr7Kb
X-Received: by 2002:a25:1086:: with SMTP id 128mr19795748ybq.375.1612119040660;
        Sun, 31 Jan 2021 10:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612119040; cv=none;
        d=google.com; s=arc-20160816;
        b=uNgFIHmkwS9FXEN9ReJgNGpd2pEtkCzyoAAupNSKDD0KfnJykXQ6Vewu1VZGhYahEV
         Z68aNHM4q8xzMBsNehb8frP6B/NpMuUCXCwfEmyZg7O62qaBlqkmm5e+NLtBUUNLk7+b
         0Ynz8Q3cYAkglnrfNpKqcgC5dSNq056A4qiM0J2aGPsc4ZOfeMaSoL51xH+9K4LXkGLo
         TgNqxye9o7VJGCisZ9Kp+N+ShOfnn2uoHPQNRQ8R/MBHlY3KXi9iO1A5XgmAcBKYYrmc
         Os4n+WtiGzlmVXaWf71x1fqX4qh9OCvuVA6DHYswTxxlJpxq87vmYcYtzktYLZQQUNAA
         TMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wOeLzgMSRQZ8FekGiXtfrDvmIAILNb9yREGpHP0D6s0=;
        b=ur8wygKAI52OQt/8PfZf9KFJQqXMjmI7I7NiWYqI0g/BwclpB8LJrQNplikDPpcZP3
         xBV6t58YlpVDEtdfA2Bw+Tx1arRLYfMzpl9FQAUQkiIobDVS5uA6/lI20rMWjvAe+3ku
         klGvNW0RLoyLJ9Dx7qkzCamkguN3yuNO31Q3y1Gq8w09tPejmpzj0A0A6BAJkukCFqsV
         0kgans3ffcXXJ8tIQVfTYgDO/YV2J7K0B2YiAN0mUK9Ry2UhzfukX3PD3g0Kgk8GmtUg
         ns35MLkD0z/kribpdpXwrjyPwUrRxW7wdwto06d/3rVTQ715+c8BHtkSxUTTnDJLuMUm
         iGGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KVrY0B8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si4499447ybt.363.2021.01.31.10.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 10:50:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KVrY0B8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6Hnz-0006Kh-Hx
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 13:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hit-00020f-FH; Sun, 31 Jan 2021 13:45:23 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6His-0007ea-1J; Sun, 31 Jan 2021 13:45:23 -0500
Received: by mail-wr1-x430.google.com with SMTP id 6so14246779wri.3;
 Sun, 31 Jan 2021 10:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wOeLzgMSRQZ8FekGiXtfrDvmIAILNb9yREGpHP0D6s0=;
 b=KVrY0B8T6uPLzVgWQEfLIqHrX+zuPOpU57rhUUgJQpapXgcQLvl9AN0DHa4z1R9h3a
 eqQZjVURkG30FuFHHvhgvQyorW7RnbW79v3kuvRfDvFSGPXV1s7cKkY2kDchowABAhNS
 9U8EQ/OGtBZkDSsdl2EtQZQJ5aQRNtm6x/cvbHsS4fstxOeX7ubm/BCBsZxDQGq3QZ2b
 R5zN73nly7kxyAhIVu3J6uWfWpLrhprqk0Olf4NkdrOLN1/9l+RuqYdRGgGy29Gc213f
 gJATe5ihE2mtBBON4qLi1ZgosnvBMzTEskNYMwJECA7ez435oGIIYyP+onc7uOBqOl2I
 lohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wOeLzgMSRQZ8FekGiXtfrDvmIAILNb9yREGpHP0D6s0=;
 b=Ojqfn0PBgE+sPC9gbrW+J8JC0C8N05ZAMWNxGntaq5cZ8p2vhuRCuFYQO8s84alt/i
 QakrKTCIE+5uKn5SxGedVcEEnu/kX5rkOoW91xv7d+SXXtNgidpdipvxCKmNMHaDkRGz
 qgOCPLCBrNl9iH8SxHrW1s1l/2L9m7Qu05TVjwSAn7DBfG7TwvDh/7l5eZ6AFTRr2GGz
 RLz3g/kFlAfqIzHSuVoUqyx4t1kspEwh5pIxe/i1T6jjOqGeScFf98A4Xcv/KJ/oMOco
 IXY84ybGUqOA8YvAFz1lst0WkFCJQGloeLaWFcZeIAkdFAc9qe5dMuV3P8z+Qy7OsE4h
 pdxw==
X-Gm-Message-State: AOAM533GNE9UXki09O5d6Y23cRnN/FhGLPzaJpUaSEKyg04Pai4UGOrA
 ZfsPXak0eD8Acb1MCRTCsTLsKznzaJk=
X-Received: by 2002:adf:d850:: with SMTP id k16mr14517011wrl.191.1612118718139; 
 Sun, 31 Jan 2021 10:45:18 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id 17sm18042395wmk.48.2021.01.31.10.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 10:45:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] hw/net/can: ZynqMP CAN device requires PTIMER
Date: Sun, 31 Jan 2021 19:44:48 +0100
Message-Id: <20210131184449.382425-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
References: <20210131184449.382425-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EXQEsyL4rBHD

Add a dependency XLNX_ZYNQMP -> PTIMER to fix:

  /usr/bin/ld:
  libcommon.fa.p/hw_net_can_xlnx-zynqmp-can.c.o: in function `xlnx_zynqmp_can_realize':
  hw/net/can/xlnx-zynqmp-can.c:1082: undefined reference to `ptimer_init'
  hw/net/can/xlnx-zynqmp-can.c:1085: undefined reference to `ptimer_transaction_begin'
  hw/net/can/xlnx-zynqmp-can.c:1087: undefined reference to `ptimer_set_freq'
  hw/net/can/xlnx-zynqmp-can.c:1088: undefined reference to `ptimer_set_limit'
  hw/net/can/xlnx-zynqmp-can.c:1089: undefined reference to `ptimer_run'
  hw/net/can/xlnx-zynqmp-can.c:1090: undefined reference to `ptimer_transaction_commit'
  libcommon.fa.p/hw_net_can_xlnx-zynqmp-can.c.o:(.data.rel+0x2c8): undefined reference to `vmstate_ptimer'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b5a4b..d4cec9e476c 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -81,3 +81,4 @@ config XLNX_ZYNQMP
     bool
     select REGISTER
     select CAN_BUS
+    select PTIMER
-- 
2.26.2

