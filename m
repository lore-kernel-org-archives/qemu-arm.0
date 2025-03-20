Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp806359njc;
        Thu, 20 Mar 2025 02:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUwDYGgLkBbLc+aG/b6qS5k/cEThnQ8c1p1MtG0deZmE1nRwgoxUVSTUzAxvs6NbhPl8HfKh21gTA/9Ng==@linaro.org
X-Google-Smtp-Source: AGHT+IH9Qu80R0/AhOOoGy/8+ThsT3hBDJtQtZwulF9UazYyamLlxDjp5h0kgInAyqXdPWphja/B
X-Received: by 2002:a05:620a:4107:b0:7c5:5d9b:b626 with SMTP id af79cd13be357-7c5a846202bmr1075334385a.36.1742462787241;
        Thu, 20 Mar 2025 02:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742462787; cv=none;
        d=google.com; s=arc-20240605;
        b=jg6UslHKpq466Aw7cBinxt47GwbmlWGwpfJa3FRJhZhOX+PIylEbAnR0hIWqzLHVNw
         5DZYQOUWKNO2PovOS1/galHTIqb43EqFyJnsMafv24cUDalZWxmDG/9Nk8QyCGR5WX/M
         tW3pXsyS+RiFQcWvSVmxdiSMg0Tg+pOT/NRnkIwz+eFqNOKeleWSjMNaL76VreJUUhs7
         CMbcNkDpuVUrmYe5H0x2xuM0rF6zZHSWdYGZKqiXkzxflp97WJypGzjpXRzMc/whN1ZZ
         7OMSWUiCrO0wd8B+KeAP8kZdQvTkkH6gZpid98/D2vfIfZa1S1obhzvgUey2h/jBrlPm
         Q79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=tstef6EXYjsrRRjCqfupbF9kVxtVhjXfi46cKlyuQ94=;
        fh=2H4UoRS0/Ye3UKg2DXxfbzP6hSQr3XkUMWx9xhUa1ts=;
        b=UmSvBUCXxwxANvT8d8lcz99/q8D8413JjvIAG/6zCFQk88XzpLKdiFH3iu6f25ngyQ
         3898YvkMXowzH28rT2mbplBIHPtGH/JNe31o51ncnPIp96SXZCOlfI9Kfkq33EqsM2zO
         I1yHbRNJizKoBgH6IEHAaeMSlaecN55hVH0XgTeEGT2ZW2mKJYkJPkn3PSny8zt29XSH
         spTGurrCLIvBHa4hb42iE+hn90EPno03CJCA0WAmGvEMxYf+IpRVg51o7s0TCLoPVPiQ
         aVBt+b3ioE4I9m+nlYa0DETFKW238JKByCTLUvzDPWtbk9Va9CCgG9p1Wj/2Qzgo/FpA
         qeGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573caa42fsi1540768185a.226.2025.03.20.02.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 02:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvCA5-0001gB-Bn; Thu, 20 Mar 2025 05:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tvCA1-0001fs-S2; Thu, 20 Mar 2025 05:25:58 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tvC9z-0004k9-Hq; Thu, 20 Mar 2025 05:25:57 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 20 Mar
 2025 17:25:43 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 20 Mar 2025 17:25:43 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH 0/1] hw/intc/aspeed: Fix IRQ handler mask check
Date: Thu, 20 Mar 2025 17:25:42 +0800
Message-ID: <20250320092543.4040672-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9qbRrKlvBbZl

Dear maintainers,

This patch addresses an issue in the ast27x0 interrupt controller where
the IRQ handler mask check does not correctly apply the select variable.
The fix ensures that the interrupt service routine (ISR) is triggered
appropriately for interrupts within the same IRQ group.

Please help to review this patch at your convenience.

Best regards,
Steven Lee

Steven Lee (1):
  hw/intc/aspeed: Fix IRQ handler mask check

 hw/intc/aspeed_intc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

