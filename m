Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2167003ejb;
        Mon, 20 Feb 2023 03:03:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/CeUZT1bLw6v8vxoBpfa++x59P3ltAdk0YqNvOd6rqndiaPayQXveZrxdurrTE0ngCaMxm
X-Received: by 2002:a05:622a:1495:b0:3bd:1a07:2063 with SMTP id t21-20020a05622a149500b003bd1a072063mr18788831qtx.45.1676890997400;
        Mon, 20 Feb 2023 03:03:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676890997; cv=none;
        d=google.com; s=arc-20160816;
        b=Mg0G4Du0SW3AAzixG5J54Tk6/lVQsGTWzHN1RmImz3VIagFZH3vFAeYW+hY0DRCqCN
         HuIiU/auaV/Eb/UoFBkO1SfANhbyRr7UpX51O2yTqdOEXpPBK6Gv8c43N2kROxQ2T31D
         O3P5PMVdpE6uHqqWpz631I5i+pYSBMx8AAzcZAY5dKKZWkcKOsNfAOTnx0tcuuNcemmd
         K1PYtpCcQwOXEJh7OATk6aw+mkSnxZlYcPPCbhimrGf9TDcYjrhj8PewQaVt+YO46dXh
         tQTSjZXaleHhEywtpeARSJTY5he3reJ75rPi47RlbnP54XTJdt+oHuiaM1Qscp0uLreg
         2EjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=s91YepJIzI4sERJ/1vC1jIWysRJ2VZAsxC7nLTysVXk=;
        b=jWuGh/7748q/lLtnXw8o30Hy3uCN4PuE10l0dhl7Ii6pNQn36svBojecdQw+/Lzq8O
         v06Pzr7M5GQmemvkQv6uKu14Jis8C54hnHzOdpTFaakjBUfbo717cyBXipNhkn1kROxg
         /MHcA4N/txiydcLqP8LvTpM0LE0ev0Id1Yy3YUDteOG0nw8JOb5ibwbQfBk1XtY3A2PM
         cB2cy4q7sem8Te4bTWQSA97cPKTNeHP/2FN2WI7h76tzncER8JlehpNxTQqpI187suQd
         EU8Ocqn4Wyn6qV6hvG8gQFqc1tdr4F13FRrFj0fY9y5bQqOiC7ez6mguau8laiOLpnUZ
         S7Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OvEH3j8m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020ac85e4a000000b003b27a36b134si9587728qtx.782.2023.02.20.03.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 03:03:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OvEH3j8m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU3wU-00015f-44; Mon, 20 Feb 2023 06:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU3wQ-00014q-VU
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 06:02:42 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU3wP-0004Yz-2R
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 06:02:42 -0500
Received: by mail-wm1-x331.google.com with SMTP id n31so558369wms.2
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 03:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s91YepJIzI4sERJ/1vC1jIWysRJ2VZAsxC7nLTysVXk=;
 b=OvEH3j8m/xpYCbGC+inw8vQRYr6jfq3R2is2/xrPB270iMZNwsVOHqRB7vOsVuAtpw
 WVQ2QtDAZ8RGa4wQEe/tp3WAf+xg6jDFQNxz86brR6qIndh6yVEoHQvdYIfhfQtQ7wBB
 1Wk1g4rnNDZOnEg8gUPRndcfn5T5OSYghV1bLo6lUCavAJlxRjJCm0B0XIGZES4TecrL
 gSrq1yeC9o05GUQ1MRqB0CgY2yx1HUzY9hoBvsRbXW4V2ak6OEJrZlaRrWLmjpNso2SP
 oR1bAMflzclZSbQqJxoYsg8u4qspjJBhva3wHgvDqTeeItkCmvNFFqU+CcLdtqsFYjql
 m4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s91YepJIzI4sERJ/1vC1jIWysRJ2VZAsxC7nLTysVXk=;
 b=nPuLSrkmSdFkucHfo6D4ONb4xeWm2524zIrIgqWuIZQCyQ9jKWTitfzR1wRz5BvdT1
 56rfHNp4zQrv9VOuN2zK/ZZD6NuM6pcxjhkEuKRJkiN8f+G1C/4pb9EGplo/HA+417vD
 LcgLr/Ha2E4lV6NQM8B5wpG4TFv7YWfA6cOuimWLgaW21Xoa1ix4SifTuj2KmneaEtvR
 EwmKQAUI4HOlieaPOMCDbRw1ng6ikIoXohQmEbITYRk4W2LA7YBOPLxM1zZhIybaAw/j
 AGzDQyXxfQMq6BNe/rMJhz8TBmyFNPW/Z9KUE6gGsLGuz/f4dPl/BwLcBHVEGTCDFYFA
 mGkA==
X-Gm-Message-State: AO0yUKXvDI7fTq8UX9R4YkIowqpWxEslpYLg0dGdFffeHfZdYLR4bN56
 Fc09BNwp1xWXWaDlVj+9Q8N1Kg==
X-Received: by 2002:a05:600c:1608:b0:3e0:1a9:b1d7 with SMTP id
 m8-20020a05600c160800b003e001a9b1d7mr6158093wmn.19.1676890959119; 
 Mon, 20 Feb 2023 03:02:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a1c7714000000b003dc3f3d77e3sm801525wmi.7.2023.02.20.03.02.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:02:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Corey Minyard <cminyard@mvista.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] MAINTAINERS: Add section for overall sensors
Date: Mon, 20 Feb 2023 12:02:35 +0100
Message-Id: <20230220110235.24472-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: It34SVmEtprp

Sensor devices depend on some bus, not a particular board.
While merged for a particular board, sensor devices don't
depend on it. They depend on a bus technology, and can be
used by any board exposing such bus.

In order to help merging sensor patches, when they fall out
of a particular board tree, add a section covering overall
sensors, to help out with patch review and merge queue
handling.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Hi, would you like to help co-maintaining?

Cc: Titus Rwantare <titusr@google.com>
Cc: Hao Wu <wuhaotsh@google.com>
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Corey Minyard <cminyard@mvista.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Kevin Townsend <kevin.townsend@linaro.org>
Cc: Klaus Jensen <k.jensen@samsung.com>
Cc: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Cc: Peter Delevoryas <peter@pjd.dev>
Cc: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd54c1f140..657fadbd6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3255,6 +3255,12 @@ M: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
 S: Maintained
 F: contrib/elf2dmp/
 
+Overall sensors
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
+S: Odd Fixes
+F: hw/sensor
+F: include/hw/sensor
+
 I2C and SMBus
 M: Corey Minyard <cminyard@mvista.com>
 S: Maintained
-- 
2.38.1

