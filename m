Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp704201lfq;
        Fri, 8 Jan 2021 10:04:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgd8gdmfPp0JYVtqxHaWa2NCb0Ew6Hiw57svR1KQ/2HUdgDhuCiKm0n42RGP03/vKLKRLJ
X-Received: by 2002:ab0:43a7:: with SMTP id l36mr3953492ual.106.1610129065603;
        Fri, 08 Jan 2021 10:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610129065; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9+PxkhOy7W9+d7YnCBpMTwGSAPU8YLdQ/cmfU0hSrI4vdfZoMD3yYiLYICDZ/DE6N
         ROWgsM9gX42JhEpxG5FoYl8nrzcIGMcOEsu02U6wiJSAYvrm55F8Wd/9OLWtaExWYEyA
         FbuWGGefXf6qSVQoLfI8z7B1ACuFxBtGiRthqKjLc34QWBgVOjHVGoHEPhYT8zA3vWCQ
         46LWy7cP+KEY58dArCgP7urJOAwDyaTkeKgKeoXc3Iac6QCJf6h+owM8hivuIOY8GVK4
         O8Gb/4RcGGAyJFN12WQxv+tYGoU3SzUdoq3XhLZ5F0lvQ7REx99x+xIYjzP34460TwDe
         bwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=sLl9sUWU5h1UaKwkdvYGg+aIysds12c5wVsNDj2Vf+M=;
        b=egdBeSzlqws/wIpy70li4Kg/jI1Jwbfq7ZGjFPUN1y4D8Fx1YVEjXu7kKBzNxRXVny
         C3wvoo8Z8R5VTUhEV+JX8y411gjmyrnZZ4WHVzUIaYFCLTZCxILDcz5PuSFo8FBAvFih
         3qJsrwEBvuvrROzI3WrtFgT0pnDSAv/pgDDWi12WZfTY75IuF4j+WR+KipkCBQHxbXmF
         zJ5XTk7ASXVFMNMCU6bIX4BKrDv0weOuRdUmdBYQTzhTJoLG7SYMKIVNVnROotZxvzMV
         mEBULnfS2t5TeAV6RTftQQDBOfxhh4bk72VDe2VvldYZ0lxkqokPXV0NMqblciB7ydxm
         x7Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jNl9yJZ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si731027vkk.93.2021.01.08.10.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 10:04:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jNl9yJZ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxw7c-0000SG-V9
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 13:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxw7N-0000Hm-2u
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:04:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxw7K-0000of-1U
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:04:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c124so8470080wma.5
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sLl9sUWU5h1UaKwkdvYGg+aIysds12c5wVsNDj2Vf+M=;
 b=jNl9yJZ7H9EuXoiJUE+GCLCalCIeZA7XK+lgB2M9mdx1MUIBVgm18vzdMOKaOzOEj9
 mrLhLKYK/npPjTDe8nC8FunizcZNJ/E3oIpr65nQq40q1OCB0cW+4SH9sm5u8fOcDjak
 doLX0dyZTytslaClQ86fD8IyStuxIAP/elNFVvq9cuIyx35ehK9AZh/ChAge1O2sizNE
 p3KkoqFaLV6BlozLRwoPH2CpqXAP2uttsWxAd+zrfCwJaZpujmD6Ql4tu/ujxKWnOYMy
 B02Stu2tAZAuIoA4YhrubM9ZFTA7OTE0ma++9nIEVt0b3mvqKjrk80Qf7ONLn4juEtnG
 Qqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sLl9sUWU5h1UaKwkdvYGg+aIysds12c5wVsNDj2Vf+M=;
 b=s9UIOWfLEFjST6wQ5Qb9RMC+6x1qtn7/Zs/7hcbq1iRRXYUyyb/g/HplYwEvvTGs1I
 Eqznc0mVAY8fxvpoBZm5neliLV29rWS7sjJdde+TKTAXt4coGhC8wfZ+D+HtAy9SwCIA
 rHZ6pyWHtCu1oy2k6VunSq4hxJfCPv9YHOOYVl8aqgn2thKiGQMf1nw5S/ZHdqz21rtu
 7SsT6+bkNIrM3SzaLwa7LDDtL2lWPS6WF0itYI2K4tFaSD3Ftufg91iZ4pPyU5sQ+5pZ
 UicdADXJwWP65kyNngV/Pd/HQXRFvTruAkcnWPu63y59tdT3ou8uyRwucNZ3BGvPmS2L
 8HSw==
X-Gm-Message-State: AOAM532TGcUPXwFVZGm+z1fngyJSrE59g1xeH1ib5QtAI7RVj3RDYURS
 xSIoRbItBcInDSrHkOHR/DXOXtS423chJA==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr4059516wme.108.1610129043909; 
 Fri, 08 Jan 2021 10:04:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s1sm13423029wrv.97.2021.01.08.10.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:04:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] lan9118: Fix RX Status FIFO PEEK value
Date: Fri,  8 Jan 2021 18:03:59 +0000
Message-Id: <20210108180401.2263-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DvoASFDjtF+i

This patchset fixes https://bugs.launchpad.net/bugs/1904954 :
we give a bogus value for the RX Status FIFO peek register,
because of a copy-and-paste error. (This bug has been present since
2009 when the device model was first added.)

Patch 1 fixes the bug; patch 2 does a little bit of tidyup while
I was looking at this bit of the code.

thanks
-- PMM

Peter Maydell (2):
  hw/net/lan9118: Fix RX Status FIFO PEEK value
  hw/net/lan9118: Add symbolic constants for register offsets

 hw/net/lan9118.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

-- 
2.20.1

