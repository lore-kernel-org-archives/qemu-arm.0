Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1471880ejb;
        Mon, 20 May 2024 07:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWj/g/GW7LcInjhtZVgg0gfd/KS8kF4UQtg7Cginil4olVzccTNnYmjgzOe2o5/5PUKBRT1zXGNTf/RPv7+d9pBEtONSJTo
X-Google-Smtp-Source: AGHT+IFQRu6iDo3Oh+lTz1+6tVA5xlRuGJJHj+hhhv+Q7hUNly+DodyymM6buAGwAlcyI7HXfvqS
X-Received: by 2002:a05:6358:7f9b:b0:18d:daac:f411 with SMTP id e5c5f4694b2df-193bd0005b6mr2779860355d.31.1716214506776;
        Mon, 20 May 2024 07:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716214506; cv=none;
        d=google.com; s=arc-20160816;
        b=QpQWd1J+22Vdz4sNd+S5zg+G6baSJki8wdMqlnojoWGzwQaYU58S6aVeLzHvGdIzE6
         lqmTa841JyIFnmbyoGkGBUrdfEeSK4gkbJqYEhHWZ6wxmYP8FYchsJ5Vl02sIpVLM0qd
         qS0U2uatc7KxSvU0xF4gXeK/Y/KWtj5Z9ArynogF+SukkZ4zWfbkgzF+JiS5euSK0LL8
         KmMk/bSn4j8fxkLP1OY999LJ/pa7lGGetIcqeuSscqmVRS8+TO27V4UK3QbfEirbTMeB
         bUUMvFlTbZA1Al+dMNRoNo2M0lGkIycaQr13IfZnbPBP79W/M8WDm++c+VwfpB47i3av
         r41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=a9DRv/RF9T6pLBQGRdcb4EE1+9iavHaVTAiqNXEwLK0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=rO+1kYzYPMjArjbCSJ2/tSJCwzfNG7r5l+Bt3vr7TLXlk/6YxQ2hqVeojpQW1PVGWg
         ZsZqwqrpl3HQgBHtEs9eqUZ7la63JFK5HHYqToDtyJy5dWsH6MuEEMjitCV6hGqyBieu
         bLbT8XqePBK+d1yb70SZdSMdhFgUhAgPQoGp4JpjtLrA9ZefiVG+n5Q+4Lm0ECKS/WpV
         uoSxgtuQuikhFaTDP9Slpc2ScdbVPmgC2E4SaT/cIOgL86sGLl9GE68kldndBcIkK0MA
         NpL88UUOJDXe3ctNjUVOdMz7ZG7fS1N5qGqu+fWfh/m+fiwzBk0zwmt4oIqPWajlZiBM
         Ndag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYheQFbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df56e3136si260156681cf.761.2024.05.20.07.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 07:15:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYheQFbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s93mW-0002Dh-Ih; Mon, 20 May 2024 10:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s93mU-0002D7-Gb
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:14:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s93mS-0003MB-W8
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:14:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41fe54cb0e3so17488185e9.2
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 07:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716214463; x=1716819263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=a9DRv/RF9T6pLBQGRdcb4EE1+9iavHaVTAiqNXEwLK0=;
 b=LYheQFbY1pyxApuVqrWfNQly3bgnVayjc9UiIZFs/gNvUv1r0ryEKo5LXkpG/a7eZa
 tcvW6VrOYxjGl8D64cMyy/bUjdN0nHmeTRLfErbD0gTaXRPVWIoZjoQrApLHOTmNXd8L
 8IwIdrLSK2YULzMzIn8/u4Ei3xgwoB2JY3xxMivp6UBWeudoz9+xhYwjeyOH55ToXpoC
 B+pHpz+GtEBsPyRvbc4jQhf9e3UN86+9EHbik32HR5kgqTTlFk/x9i3CT6OcbVe2kOhl
 202aWjF4S7m+qZYjpNROca4jqNG3MKavhRO4BjxPJjGA1uAynM6nlnUK0OpYYTTQz1Q4
 msnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716214463; x=1716819263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a9DRv/RF9T6pLBQGRdcb4EE1+9iavHaVTAiqNXEwLK0=;
 b=d2FxzovG58/5wtQSoeqInqzSN2mO478VYnFMA1WFMqN2jW6LirHoxD6apfeoJ0u9Qx
 YXUt/2nkRKTxeEqzZM9L32n1HDbqBrexSXlwc2tFBaF0vCWT1EyRX0EjBBl8mJHXfLxx
 X0tmIJPw2rSXcSEjvtYDF97DujOKpVrAQtyMOH0IlnL0qww4W1wVbLCyfuPOvu2vb4uP
 16VPUtF1Y3RpKB123zPsqdL51dJaNvd8SPt6tL5eJeCAd8SHlNwof3Xl1s4u38ZTTJHf
 9v7b6YFQIImKK5mSikcP1fxTHHTcvQX8w/hlC14c+yqTnZYRfE1CaGjuKho91/yORsv7
 g44g==
X-Gm-Message-State: AOJu0YyfI2lS4I+FBoUfXyYq0gP4IUsRA0pVNXW0adALMQAEMf940Pib
 jmSIuhQomkreGI1QovOrw7Bxib2KTLIZjmXgvr/1A4pyFUWDDBBf3wZ/3gZYyxQiHMEq0zDSNbg
 I
X-Received: by 2002:a05:600c:15c2:b0:41b:e0e5:a525 with SMTP id
 5b1f17b1804b1-41feaa44411mr255533515e9.17.1716214463078; 
 Mon, 20 May 2024 07:14:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbedbsm29234107f8f.92.2024.05.20.07.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 07:14:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] docs/system/target-arm: Re-alphabetize board list
Date: Mon, 20 May 2024 15:14:21 +0100
Message-Id: <20240520141421.1895138-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eJQHhEIOotzr

The board list in target-arm.rst is supposed to be in alphabetical
order by the title text of each file (which is not the same as
alphabetical order by filename).  A few items had got out of order;
correct them.

The entry for
"Facebook Yosemite v3.5 Platform and CraterLake Server (fby35)"
remains out-of-order, because this is not its own file
but is currently part of the aspeed.rst file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/target-arm.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index c9d7c0dda7e..870d30e3502 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -86,16 +86,16 @@ undocumented; you can get a complete list by running
    arm/bananapi_m2u.rst
    arm/b-l475e-iot01a.rst
    arm/sabrelite
+   arm/highbank
    arm/digic
    arm/cubieboard
    arm/emcraft-sf2
-   arm/highbank
    arm/musicpal
    arm/gumstix
    arm/mainstone
    arm/kzm
-   arm/nrf
    arm/nseries
+   arm/nrf
    arm/nuvoton
    arm/imx25-pdk
    arm/orangepi
@@ -107,8 +107,8 @@ undocumented; you can get a complete list by running
    arm/stellaris
    arm/stm32
    arm/virt
-   arm/xlnx-versal-virt
    arm/xenpvh
+   arm/xlnx-versal-virt
 
 Emulated CPU architecture support
 =================================
-- 
2.34.1

