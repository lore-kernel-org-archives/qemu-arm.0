Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1817488lfm;
        Wed, 19 May 2021 13:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmcAyne0TZKzmCfzlpfY22zFLbH8zcndozcs+vST0OSrap43odn/HvWcZkXc1Z/5PO7stT
X-Received: by 2002:a05:6e02:1b0f:: with SMTP id i15mr806560ilv.164.1621454998015;
        Wed, 19 May 2021 13:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621454998; cv=none;
        d=google.com; s=arc-20160816;
        b=Xh1tWZu5qwri+fwQZQcKizRwA6NxFbz09VWG34sM25ZCVa7JqzyHovlZY3RhL6xx0E
         j6hg0uk09mRG5GtGWHW/QI2RAiZw1T2LNdYFrX452aWGkA2Ljp3aPowZ81sAZ3Po9Lia
         ByT4wLTVcs9GfWPFYxuDzYKeBe/7uOuYHJhRYuGS8gzuM0a54DIuUbwFbkwvGV/wUNQp
         bYJHgmRHXPQNGjGm9UHcrBqJkKivJcZBpccmi9MejKqseRiHNsyHnIpEe2lMl32sBNFL
         oBK+atC8ACSsVyfgMkibAsLAMaNaS3XJ/nlLJQjnoA6L7kl6cRuoImHixozxtA9nwoui
         MXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ahi6YrYQf7WAwAkHHAGP1pB01oGjrRrpGjLNJFy3Gtk=;
        b=uBzniWezb5t1YjQluPCyIPlfxDi5REK4EOCMEqvnL2CgDq+XzRRDKcUZE2TokiXLPY
         CJVR1ifc5tG0DnLQO4THeSBuko3EaUe2AukqNzCOff0Fb/oZ2g+q7bk/awJYTnlxCob6
         tPXkvjhHDzXzLem8chkyOVeeoyRp336AJjI3KYNa6PGihe6P3Y0+iab3GX7MmVZ+oYbr
         twjpJdpglTAfWGZBn2U1M3Xizok/xMWj4PRpifjXSzkyi7mXwwiqSojDga4wwoUsiDOA
         IFtAdoVl7AHOpT0XVQRRXotps98qLwkcsO6VpUruv0dh6eBUloiPUrGXKr4hKJz8aVxs
         GWwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u8O63zq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si232580iow.86.2021.05.19.13.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u8O63zq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSVx-0001Sn-93
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljSVo-0001SW-D6; Wed, 19 May 2021 16:09:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljSVm-0003KM-UA; Wed, 19 May 2021 16:09:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q5so15288881wrs.4;
 Wed, 19 May 2021 13:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ahi6YrYQf7WAwAkHHAGP1pB01oGjrRrpGjLNJFy3Gtk=;
 b=u8O63zq4kNuuX3+iDnleGfpncd3ZqvgH1/rq1Xj6qd07YlFtUUdchoSHA1N9EVwwey
 be6d0IWRjEBh316/K1iXV9L8WiskGqmlM1N8SkA6MsWRPfUKZ7CIPSRxWK+6lz/RCgvf
 AKnSEjtAeM0iJ+hpp+HFwWxOR5c0yFB6ts1Is6Yp6Gf6IP8XPV7MoD0f3Ijc7FtfG2gT
 B7bZBPhepOYNUSutVc2omaCZc/Cdr0kvGDBG4KDapG0Mm6MVMs+j9evKzIO/OLm/OKDP
 gDRmkPX2619VBuFA5L/NcO0AFty1rR3LNbHbjqQuq/723K59W+Rj9w9FracYAIsh+KS8
 D+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ahi6YrYQf7WAwAkHHAGP1pB01oGjrRrpGjLNJFy3Gtk=;
 b=ohRidy9W34vKlfWMWjFVqqQQf8h3EDFWAeDGFreg6Y8oUW0zAMDPuUel4P0pJ386iz
 FHUa73/ZuQa/Co1Fv0VgfmqbUoLY3rP7Umbr5uG6YD9BDthpCHZXFDUmCTRuBnRM08HI
 sjr1o4mvZ2/7lfD+jC+q+i7tuzQW1TRUGmtDAHWWXmdtg3DZ4iD6NswTNYtl3pi/ratg
 BScMxSgD/JMnDd4QEcP6Qwop4Fw1R0B0Ys1x+RvZBON8hfBGE9yU0UfXPDZi09U7txXE
 hvzvFqTLXIEhLkRlkT6gdcsw1x2eU3AHjpITXw4J/izfL8ElY4p6pyXfJfQzpA3JSrqe
 wHew==
X-Gm-Message-State: AOAM531kxBS5vWLhDBOzCN1jty/A+HxK0wB/QcRBBxw7+CVKdsG5tpgX
 fycFqEApnvlOyV80pg/7tbOVrPQQ+GtISQ==
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr650526wrx.424.1621454984610; 
 Wed, 19 May 2021 13:09:44 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d3sm494412wrs.41.2021.05.19.13.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:09:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/arm/Kconfig: Fix issues with USB_CHIPIDEA / IMX_USBPHY
 symbols
Date: Wed, 19 May 2021 22:09:39 +0200
Message-Id: <20210519200942.2223292-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S3wvsM5nyc4A

Fix 2 more issues when using --without-default-devices builds=0D
(xilinx-zynq-a9 and mcimx6ul-evk machines).=0D
=0D
In an ideal world we'd have infinite compute power and would=0D
run all tests, but in this one I only test this configuration=0D
manually from time to time. We might start using it more...=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/usb/Kconfig: Introduce USB_CHIPIDEA symbol=0D
  hw/arm/Kconfig: Add missing dependency ZYNQ -> USB_CHIPIDEA=0D
  hw/arm/Kconfig: Add missing dependency IMX_USBPHY -> FSL_IMX6UL=0D
=0D
 hw/arm/Kconfig     | 6 ++++++=0D
 hw/usb/Kconfig     | 3 +++=0D
 hw/usb/meson.build | 2 +-=0D
 3 files changed, 10 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.26.3=0D
=0D
