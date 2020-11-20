Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1414894lfb;
        Fri, 20 Nov 2020 07:46:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+WvtQsuuBJg4r2FvTPe2G8I0pLRE7UGq4Tg5ATSpV7tP+L46GJIYWhU+o2nR0RXV6Hfgc
X-Received: by 2002:a25:3b4f:: with SMTP id i76mr24984441yba.268.1605887189401;
        Fri, 20 Nov 2020 07:46:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605887189; cv=none;
        d=google.com; s=arc-20160816;
        b=S8C4KQ5nB7GO5YQidVlN0S3x185NeP97VaHQoDE0DSE4Hn6QrcySIcz52+htC9dANr
         3sbGTylpdWMK3dJwMBswgPUnUZM4cW3qK5irLDD1wXLI0DFFqfXpmP462B8ttp+bF/T7
         kybZgirUwKPkcEAhozR0ghdiNqZGiWHZyUD7Pw+T5OIag4ZyACtCrnnEbtR4uFYaqoqx
         +N7jayZuQA9Y56UYcyrQ1sRsD0OSsqJFNMzgrx56hR+rOWEKVbRKr3uZvPnlibJPC7fD
         aqd0wy1m7F3Ma1Tf5Ul36e4Kg+IM6NpGgcUFQ3lwgDlghKnbGrh0Y7u8BySFjm8dM2dj
         hweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qQRKb03hVueEi/f7KsFBu0gr21BcWoGubc/H1nLbXsg=;
        b=mT6ZMt9yRxT/OPt+4zhMzO2O4Vgp77WTa+33lD2dmwkMntqWhAxkLV4Zg4Mr7aUOXA
         CHcUE50zrvncmu29+e04R01KG2+GtNeDwrox2128q2DElPVjO5mfNDYTSTmyqee4XdJz
         XbUSfXDd0ca69iZhffrFXYL34c3JoCjRUrza9tR0dtq3XUQbt/F1KjArnczxhzo8jqwA
         xg+vhZdvveI5ipSRkezZwe6cPBA/qEkPhSJ846KhM2TE2JRQBL2cd50xkAOv2pqPVIdp
         LQOzM+cBcFiYXyc4qzWOz16NbtsBgjqc+tjdNQmOOaA2eFu25u5bqFIskJC7EwGScURc
         /55w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uyCqTvxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si2986984ybd.382.2020.11.20.07.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:46:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uyCqTvxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg8cG-0006su-ND
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bt-0006O4-9J; Fri, 20 Nov 2020 10:46:05 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bn-0002oh-Ot; Fri, 20 Nov 2020 10:46:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id d142so10760905wmd.4;
 Fri, 20 Nov 2020 07:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQRKb03hVueEi/f7KsFBu0gr21BcWoGubc/H1nLbXsg=;
 b=uyCqTvxJRyxwIiv2fh6pFGU8yjpMLoNxdxfU1avFSVEWTlzQg0Drpzi9dFt2hdzjo4
 YKXcXxXkADVxAfQ8QcaZe8WT12CTtyRJ9hi396bRLfeHEL8F5wsnzjv9ACelyRM2TGUS
 rw9ZqIcvcYqRUHzb56HML2/7ObDBSUHhz7zAHKdbS2NBqw/ep3VSLCSfBdmXCGnG9Pk2
 KK6HjqlQRzPi2sC3dPsCDKIB5SIz7F7hD9XcPpHKpyFwMcT2Bko+xHUH1FQi0HCHYza8
 BE61njz4yGCUjdT/hvrRyMs7XgaTbe7J74Vd6NN3gKCQn3N2g7dq5lzzRlh+Q6RACEJN
 WY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qQRKb03hVueEi/f7KsFBu0gr21BcWoGubc/H1nLbXsg=;
 b=VY2XRJeC6FbDKDrRgw5HI9c9ZplL+xrDu/q7/azQMmtEpxr61Ya/wog2Gxyfuwilw2
 Q6hZGHxzhro6EGQQEM6GOlVD113CpfshuX6qx97q6ZuywZ63jiOCgeVkgdkMDqwDlOm1
 o875Bwl3IjM8vg0ZB+yBgLmCIMNF44paTghOU3nv0S/uuMNqxUbFu+ecb6Xk/epYuHy0
 RYgZh96TxhNTI4N1nfaHvYsmUBSnH+E81CLmpgulNvaJ40RbOv/oK9Zho84nveLbnbSq
 OMbx7BYB3H3VeJDlP9xnQzhe9M96JtddviAlowRGOfbO5LGHNfM3uXA0arR7IAR7I/PI
 5RTg==
X-Gm-Message-State: AOAM532XuLTFyabhmaswDf3YvO+JZVmUDOfiX5nX1wRtTGuH36kAJzwf
 YMg/J3WprvmDLvRKUjHxmy9METyTEUY=
X-Received: by 2002:a1c:8085:: with SMTP id b127mr9465138wmd.142.1605887157646; 
 Fri, 20 Nov 2020 07:45:57 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id d3sm5407362wre.91.2020.11.20.07.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:45:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 2/6] MAINTAINERS: Cover system/arm/aspeed.rst with
 ASPEED BMC machines
Date: Fri, 20 Nov 2020 16:45:41 +0100
Message-Id: <20201120154545.2504625-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
References: <20201120154545.2504625-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fPdj3CoBkoIq

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d7a6026b91..cc883260d03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1001,6 +1001,7 @@ F: include/hw/*/*aspeed*
 F: include/hw/misc/pca9552*.h
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
+F: docs/system/arm/aspeed.rst
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
-- 
2.26.2

