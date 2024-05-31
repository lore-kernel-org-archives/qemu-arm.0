Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp396716ejs;
        Fri, 31 May 2024 02:38:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGljHj0wjfu44RPT4vPxNH3RqpINyPZriJizOapbw4g6m7N4/qxvvaW/1HXehebHtAHyFwg4y9oJbTP6HRAkIN2AqyAG1O
X-Google-Smtp-Source: AGHT+IHBL2TlmdGEXFHzC3hpc+NOdrhnAWYyGT4VIDEo0U4RezjAmUPsEjtG2UxISKhyDscWhdol
X-Received: by 2002:a05:6214:440a:b0:6a9:f5d8:1d36 with SMTP id 6a1803df08f44-6aecd6f97e2mr13911056d6.54.1717148302967;
        Fri, 31 May 2024 02:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717148302; cv=none;
        d=google.com; s=arc-20160816;
        b=jNLunV3e75bo1g4XSMYQBJSMdJLUMxv+9qgdrn5mz80/6KXWDx0TAhosVzmnKJQ1ba
         oZ4ph34wOpxe32FReStrc9Kue82FKpNoo08MpUA77btFYNUBVO7I1ZB6W//3nLqjq1FI
         o4CimMGU72oM3x6rUaXIem9/DJb95Ima0dUWCUnrl5YZoAJLmgE2FDeqd/LMCarmzAG1
         AgHyA977CLTLSJLWLem6ogpFOEj2nsfPDBd7px3H4gTIHfYx193M6zF/SzzCqnn888Dp
         NZm0Y5aPTxbpcQpwlPrKWYYn0fWXi1i8vYFIbWllg3WXoeyfB7f8yKKnQT/yYrEEGKPI
         gz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=M3ZIscMaejGETYMZJSTx9H9551c3EEofRva9gnU0vKY=;
        fh=nKl8/G0rxCW7ugooXfO2GeaKcEIa1k4pK3AumDOEz4g=;
        b=xr6Sc4gBU8fKVi4aPxs3/GjWSVhH+JMvGWiWq4ETRSo8SgwbCZoMW7E8HnLXyCfBWt
         RzhCjSIthPicstnG9dRwPY45hWaIMHrtx7FNTU8rtrlid5TOKcww2q56uZF7JVN2JWR6
         Y70M6WsY4bTmS4spdh8HPGIqgIPMKr+K680OTeKvBK3FsPOagoMQkJI5x0YaWI+3tzBP
         RiQBe/+qJzIBBTqrB1bE8Yo+royhxfU6HcdyX90PQMHRperxZRKgFbzgjQ42L+y+HImK
         qRKykgCCKfhs1PUe361VKqNP83VCW2AiEKIyNTWakBiJ0S2Wyien8Ad1jrlbyD+o+401
         2UlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b42b778si10360446d6.470.2024.05.31.02.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 02:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCyhm-0000rS-8W; Fri, 31 May 2024 05:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sCyhj-0000q2-GP; Fri, 31 May 2024 05:37:43 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sCyhh-0001pZ-Uv; Fri, 31 May 2024 05:37:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 2DA3C2619EB;
 Fri, 31 May 2024 11:37:38 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id yDjaLWZT2qHM; Fri, 31 May 2024 11:37:35 +0200 (CEST)
Received: from applejack.lan (83.11.37.15.ipv4.supernova.orange.pl
 [83.11.37.15])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 561DC2601D2;
 Fri, 31 May 2024 11:37:35 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 0/1] hw/arm/sbsa-ref: switch to 1GHz timer frequency
Date: Fri, 31 May 2024 11:37:28 +0200
Message-ID: <20240531093729.220758-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: fy5Lq1QYzhdn

Trusted Firmware 2.11 got released, EDK2 202405 got released as well.
Both were built for QEMU CI and proper patch is now in arm.next queue.

So all requirements to move from legacy 62.5MHz to armv8.6-ready 1GHz
frequency are fulfiled.

Marcin Juszkiewicz (1):
  hw/arm/sbsa-ref: switch to 1GHz timer frequency

 hw/arm/sbsa-ref.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.45.1

