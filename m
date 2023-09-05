Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2253906ejb;
        Tue, 5 Sep 2023 13:15:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPVWyFBE8zhU2/fPrTwWRERSfALM6DHNZu5Al+sVHWnLVFFfQt51dqGzwBBKJ7sBQswZC1
X-Received: by 2002:a9d:4d85:0:b0:6b8:f588:2c79 with SMTP id u5-20020a9d4d85000000b006b8f5882c79mr14616277otk.1.1693944914315;
        Tue, 05 Sep 2023 13:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693944914; cv=none;
        d=google.com; s=arc-20160816;
        b=dhGQNop91v8Ie3Ik1QdIsDbxQOLRGXDbeI59PKzXPQXqdec3Wl1Qfwz9AutqySUWLF
         gw1zDEp9hX/uiWY7aIyQfPJRoksFIbRcpoJt9gtqAVlc8g53P88ERcZnzAbnbXh1OJKG
         8nItjAdmSt3D8OzFCGJA2+B9ccv4sXhyYtADlR716qCNJEJFeSBvvlJm/K7/CfnYfNLP
         uaezDJ6D9I1oDZ8KeNRDFOUh3AHpF+OmVtZheHG08MJpAr+aNKnhyq4ZZHumV3yIVWqj
         9M+8uXwHYAiRseS4oje8SQDgCQSHHTKV/LGVgo6HRrrtK5B3zH/YJigI8Al0m91HaUie
         6Zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8y2tTveHgptTrcnfgnWm3x/FwZdnV+E+gcbaUOc76YU=;
        fh=W7drrHLWlU6RviMr5u6Q2QLIvBBno/BcCW1G9hZvzcU=;
        b=ziQ2cV/9HK2jTEB8SLn+AEL6SP6kNLNd7ohAyVICAGDR6PNjrm1Aj3BZeGt1RMsnbx
         XemxTuxg3JTCpIg8HHZOK/r9XEP+5WvVYDDhzdruI/rRmUeQJa+QQzxMenpiX7Ve3CZ3
         1YwMP9z9gFxt65Mlwm4bHREBQphkUUPBC8/b5m4mSQwL5WiC+Pb2dQ2ygXu3kwwbeyqH
         3qN4HSWqzMROKfcyfPXq+iSv7St13i+t+FyNEd+w1J/ZncG3vd0FTasS9GkIIm/5GAbV
         utUqXS5LyQpFuWwx+rPFqbMNSc1wdevzKJAid5IhDcutacCpSl2c0JEEbIpFZ6hVftI1
         8zOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=R0fqOLrr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tn4-20020a05620a3c0400b007683fd3dec9si8224882qkn.121.2023.09.05.13.15.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 13:15:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=R0fqOLrr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdcRe-0004sm-77; Tue, 05 Sep 2023 16:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1qdcRc-0004sI-M4; Tue, 05 Sep 2023 16:14:40 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1qdcRa-00037N-C5; Tue, 05 Sep 2023 16:14:40 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5007c8308c3so4688279e87.0; 
 Tue, 05 Sep 2023 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693944875; x=1694549675; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8y2tTveHgptTrcnfgnWm3x/FwZdnV+E+gcbaUOc76YU=;
 b=R0fqOLrrMcpCTielUURch/Gq4aj+ZEAjDgzg6KaNilo2oydE87F2yNLBk4QP1M9yfj
 XqLMnV0OdScp+NcNnr7cvqw6mz9hyLISJzg/bW0OJqW2FbTm2zjC7eP2wRFCGvpZS3WW
 kyhc6PQojkcltUwR/5x1IBU+pik0bYkZy1cHCrWSlor9f/YWyuwLw+S+Tw9ezLw/Buau
 y9/fByG6k38WHChd23dDf7xsUnptbUCnUZDT4+wBOshL/SPOaBx3p+rs4zefHORyLuLD
 ia7FBg+NR5hXaFPb4NMYkjU82lmsepyFbgfx23QdAlZ9ZPK+lMY+/Vozf9ZI942/nbRV
 t8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693944875; x=1694549675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8y2tTveHgptTrcnfgnWm3x/FwZdnV+E+gcbaUOc76YU=;
 b=Wptp+dfCqDyS+lF/3Z7J9ZiZwsnSJqRYAdBT5ON3XxpncAhEg/K7GqVQ1tRz7Tm0EK
 VSvKLpGDl9nd05sym21YpGR1DyLBF4wUbKCoS14gOm2gjRN4dXbMvvnUH1NyRbkZThWD
 j8h4NNA+yKtFXsbIRXGuByQvSLr0/f0Ul8X04VfLtcOQXpVbr3Gal4aIq/yzNVeD1mwz
 dZT6+oh+LLD9szPdCP06Ws7s50maF2jFGyryG+N3Z1g5yIHsiUp2IOgNU+xjn2RBD+IE
 o/+0txTPIbcNed3xeaph3JrWWWkNDEmbu2zqL34P5oyAnjXvrsS5fu+pMH1mlpTQGiS4
 lWJA==
X-Gm-Message-State: AOJu0YwV6RmiexckkkNmhgSurcIXpqpVnaPTjfIEvHDfViHIELjuYIcH
 n8qbweAPTIOc0WzBkl6tmSwjF22wd/5wPA==
X-Received: by 2002:a05:6512:2212:b0:4fa:5e76:7ad4 with SMTP id
 h18-20020a056512221200b004fa5e767ad4mr934608lfu.10.1693944875061; 
 Tue, 05 Sep 2023 13:14:35 -0700 (PDT)
Received: from localhost.localdomain (81-233-187-21-no600.tbcn.telia.com.
 [81.233.187.21]) by smtp.gmail.com with ESMTPSA id
 b25-20020ac25e99000000b004ff725d1a27sm2489811lfq.234.2023.09.05.13.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 13:14:34 -0700 (PDT)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [RFC Patch 0/5] Allwinner A10 input/output peripherals
Date: Tue,  5 Sep 2023 22:14:20 +0200
Message-Id: <20230905201425.118918-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: 9uziiSDn+aBO

This patch set adds minimal support for PS2 input and HDMI output for
Allwinner A10 and Cubieboard.

For the display part, minimal emulation of HDMI, MALI GPU, Display
Engine Backend and LCD controller is added.

For the PS2 both keyboard and mouse support is added and attached to the
two PS2 contollers present in Allwinner A10.

Functionality has been tested with custom Yocto image.

This is sent as RFC for now, since there might be some use cases which
have not been tested.


Strahinja Jankovic (5):
  hw/display: Allwinner A10 HDMI controller emulation
  hw/display: Allwinner basic MALI GPU emulation
  hw/display: Allwinner A10 Display Engine Backend emulation
  hw/display: Allwinner A10 LCDC emulation
  hw/input: Add Allwinner-A10 PS2 emulation

 hw/arm/allwinner-a10.c                  |  51 ++++
 hw/display/allwinner-a10-debe.c         | 229 ++++++++++++++++
 hw/display/allwinner-a10-hdmi.c         | 214 +++++++++++++++
 hw/display/allwinner-a10-lcdc.c         | 275 +++++++++++++++++++
 hw/display/allwinner-gpu.c              | 212 +++++++++++++++
 hw/display/meson.build                  |   5 +
 hw/display/trace-events                 |  17 ++
 hw/input/allwinner-a10-ps2.c            | 345 ++++++++++++++++++++++++
 hw/input/meson.build                    |   2 +
 include/hw/arm/allwinner-a10.h          |  11 +
 include/hw/display/allwinner-a10-debe.h |  71 +++++
 include/hw/display/allwinner-a10-hdmi.h |  69 +++++
 include/hw/display/allwinner-a10-lcdc.h |  77 ++++++
 include/hw/display/allwinner-gpu.h      |  64 +++++
 include/hw/input/allwinner-a10-ps2.h    |  96 +++++++
 15 files changed, 1738 insertions(+)
 create mode 100644 hw/display/allwinner-a10-debe.c
 create mode 100644 hw/display/allwinner-a10-hdmi.c
 create mode 100644 hw/display/allwinner-a10-lcdc.c
 create mode 100644 hw/display/allwinner-gpu.c
 create mode 100644 hw/input/allwinner-a10-ps2.c
 create mode 100644 include/hw/display/allwinner-a10-debe.h
 create mode 100644 include/hw/display/allwinner-a10-hdmi.h
 create mode 100644 include/hw/display/allwinner-a10-lcdc.h
 create mode 100644 include/hw/display/allwinner-gpu.h
 create mode 100644 include/hw/input/allwinner-a10-ps2.h

-- 
2.34.1

