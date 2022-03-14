Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1843024lfo;
        Sun, 13 Mar 2022 21:44:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbEvdEzY4/8EBdQqreD0RLzgJ55nKRx/Q+z8E8Cw7A7+Hxnwjt+OInb/NcV46c/xM8fhpZ
X-Received: by 2002:a81:154:0:b0:2dd:1e6a:d509 with SMTP id 81-20020a810154000000b002dd1e6ad509mr17582480ywb.339.1647233040710;
        Sun, 13 Mar 2022 21:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647233040; cv=none;
        d=google.com; s=arc-20160816;
        b=tC2VXaCX5kZZoy0pegDGCWAl5zqvsnFKerdy7fJDlvif9wr0BZOC6NzT40khQRGzqX
         gQtTL21BBCGc6QWd/llykxkrfvmahvftYUp6yucC0HkRQk88gljpMLTeGaAisSJIdsnT
         vaHV6Ce/reVK/auxPwzZ3+ox+9UODk4LEHbGevz/zmNo0vb/k7c25u/lDrDhgl8mH0T+
         YeXMbE0MAzPMk3rEzkI9jqU3I8bgU2bp+d9yS/suCvbSXfQPOyV+Otm5MjA1rAfaS58d
         xyRB4VqDSMVRgvgw1y+clEfzAjTp8dR4e+eK6DtLtmjK/Kquy+0AyWrAc27cBGAPmYVZ
         kMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=21EFikrziO7J83eRzQSZ9JPnz4I2+1dw7lofMY4wC44=;
        b=m87nLIfZTO4MHOd+H4zYl/N8ht2HJSXUZrisVTOxzGsXLnU1qnYSWQDxQhCNo5BVdr
         gOF+ctI2JYhuadctY4PjdqAhvYC4hgggtK6+CmS4x5BjlgCejzffOV45guYNEp9fK9ZO
         FxymUYQ9k+7Ber1HgcFobpSQj2eqsBQLSoIEFaNQi9FyIRDlZGWsqd+tI7osrSr3Druf
         z4vyEV76z7cx3vwAqzpp5r/ZiaKULviZi24davqsgrazBllWB1m74B+kAIO4EZ522yiu
         +AIHf1gWN2yMcvQclt60M6Iz2zhD6L31cSeqZbnWsIO/jMSGrueTnE9mW1AjO/Oe5Y32
         Nq/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7+qViOI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o127-20020a257385000000b00628af0bdc1esi8804404ybc.414.2022.03.13.21.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Mar 2022 21:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7+qViOI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTcYq-0003Dv-4k
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 00:44:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY2-0003Cx-5X
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:43:10 -0400
Received: from [2607:f8b0:4864:20::632] (port=46829
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY0-0004OW-QM
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:43:09 -0400
Received: by mail-pl1-x632.google.com with SMTP id w4so12489481ply.13
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 21:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=21EFikrziO7J83eRzQSZ9JPnz4I2+1dw7lofMY4wC44=;
 b=A7+qViOIFGTVdV3BzhxhhB4JVkNwHSwpF1cd7iz6y16MvocEoAyOHd9DOBUDP1wFkV
 biepDQax1Zbvcg9t5Lih6jEGTSl2b6imB37JqX2ko6DgE/rY0R/mjoyG5y9iy8D2kUuH
 An7RFE8O2JAl7OUEkReQ0Me85jLy+u9giU4OKwK+ZtCgu+vsdO4s7N4IJUWtIme8FEFW
 zZvoK9bKB6W/WIM2AA1XWzpbZVgBH7MLmSMqtUnJazavBIDcDPhkOChekcVpbGKoO9XC
 WV+Pxb4nBcX1iChX4PmHEJ3G6nSh9iwzdbkEcjyEueJ3/tP9wT09nThXcoRhJiwkOanz
 Daog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=21EFikrziO7J83eRzQSZ9JPnz4I2+1dw7lofMY4wC44=;
 b=onErhuri2QAq+XD15wRoFr70AcmuBy3FnlW7dXwwsNyhlc3L7b8vqzz33G7K6/zmqU
 QE7Yp8rwuK9yv2lGb8VqlT74WgHkhajegFTUDUTWuVTtO5GGgM389ODGK+8nufGNdWlb
 fn2hLQ8g4EGdeUc4s2Utim7Udlk2X8zCwpDycPHn26HobkW5It7dpn1BmTdPwKlzSgZQ
 5YkBP1wqK0elf55snl9kjzaSujlVKHRm59/v7bzCPxiADaGefJQP7WYEq4C2DbmwQVxs
 smFKxEYZ4ArpCQkeuAyAJCfrl3ndNdQK5xAW1xOMLrh7Sg80wxGPOkJ/tlVV3RIEKMsy
 cvhQ==
X-Gm-Message-State: AOAM533R8jNuRkeQ/D2AI6qaPWShSLuO87JY8xLT44Y/u8xqFiNW6eGi
 l3OfiiCoJ0HvLOZO3WmrR5LkOo3WO0n7bw==
X-Received: by 2002:a17:902:ee53:b0:151:ec64:4ee7 with SMTP id
 19-20020a170902ee5300b00151ec644ee7mr22008616plo.89.1647232987140; 
 Sun, 13 Mar 2022 21:43:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm18258153pfu.150.2022.03.13.21.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 21:43:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] linux-user/arm: Improvements for commpage atomics
Date: Sun, 13 Mar 2022 21:43:02 -0700
Message-Id: <20220314044305.138794-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MeL/QqH8W8Ce

Only the memory_barrer one is a bug; the rest improve system-wide
interaction, and would only affect pre-armv6.


r~


Richard Henderson (3):
  linux-user/arm: Implement __kernel_memory_barrier
  linux-user/arm: Implement __kernel_cmpxchg with host atomics
  linux-user/arm: Implement __kernel_cmpxchg64 with host atomics

 linux-user/arm/cpu_loop.c | 166 +++++++++++++++++++++++---------------
 1 file changed, 99 insertions(+), 67 deletions(-)

-- 
2.25.1

