Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp785920lfy;
        Tue, 11 Aug 2020 13:35:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAkCsnjkJfgx2+106y0k+C0JX2DEE1XLLJ+knbjUvDWdxR1uumCKwNaULNXg6el7ZbjGUK
X-Received: by 2002:a25:5887:: with SMTP id m129mr54622381ybb.11.1597178128327;
        Tue, 11 Aug 2020 13:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597178128; cv=none;
        d=google.com; s=arc-20160816;
        b=X4DwryaV+xUnycL53kqrTUg/G4iogaODgo2Utp/2IFH3IASbLvEjhoVShivNpLptKq
         +45DY0FcJ4jeWIG1llih8pv19DfItGYyH3GrqLYGA66jKNPBSIThnIHZRakeKAcMT+AO
         r6I31X7Zx6Km/aFq1sNxIqptetZD1L+u9XbE1vENscPieTD3tKShFC9Rp9iUXvH9GzZ/
         OU72rBbegA5CWPhOMUhxcZZCjdZb1MIwXdpyuNMRrNA59ay8BfU00QP2C9xDdduVI7QT
         xGkuCHxHjtXOmUD6NVrtmi9suj0q68Dzb9sPC2HFXswGdlp1fMUNTmXuAonz/F6IkQEa
         WYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature;
        bh=GaI0JcgyClgP/ehHmByNK8vuutCiVY6/nRzPc+PljHA=;
        b=Y6ioXxsiqjfuLmcbYZQNWSbrF0zUtGyZtqto4sBuep2XoOc4ci/PFRFz+BtQbl6IOs
         2TJFxAUEXkqLugv0bOYj3kE/0fKvFk6vFz81CsvQdT+XOGSDT2WwkMMdGUUPH1GmBRzt
         /DGM7VEO+Rd/ORsCfIser+4FM1obzaPG+e9IrBUsK9Ip6hZ0P+xJEfFYQE+2J2J6SoEE
         FrG02RBXhZZPz8CfmEgWmfbyoiWom+c/uOA9FIZnWP02DAiJHg1ZrgsXsrXGI4QCc44p
         odX4Vi7O9i9Yg+Hd2VGrI8w/reoa6iIkhOIb+6RGR6JvI6vXrbK5LvilUTgK3lPlnqBf
         smbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=K0fUew25;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si91695ybs.54.2020.08.11.13.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 13:35:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=K0fUew25;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5azX-0005LE-Nj
	for alex.bennee@linaro.org; Tue, 11 Aug 2020 16:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kononenko@yadro.com>)
 id 1k5azQ-0005Kl-S7; Tue, 11 Aug 2020 16:35:20 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:60470 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kononenko@yadro.com>)
 id 1k5azP-0006wS-3q; Tue, 11 Aug 2020 16:35:20 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 559444C899;
 Tue, 11 Aug 2020 20:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from:received:received:received; s=
 mta-01; t=1597178114; x=1598992515; bh=2S8L47xmP1QTMKP6oDgMRdO+8
 w/28vsSYTIholTvuus=; b=K0fUew25cxKZfbfprlCoCkl2Bz5GjFkFQumLwyTvx
 UMLTCvCtdrDezdMM9AI6JCygPLg3utqJdnrpt5ShmjrMtV7drxmCF8XxFSHNG+0i
 V+X6PFrDQm5+6OeJmLjKxseIDvh/FCCQikc17kFeWo6cxOE3lY6SMG1fjjS1JDKl
 r0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRtTSxSaDhHe; Tue, 11 Aug 2020 23:35:14 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1AB424C878;
 Tue, 11 Aug 2020 23:35:12 +0300 (MSK)
Received: from ik-ThinkPad-T490.yadro.com (10.199.0.82) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 11 Aug 2020 23:35:12 +0300
From: Igor Kononenko <i.kononenko@yadro.com>
To: 
Subject: [PATCH] arm: aspeed: add strap define `25HZ` of AST2500
Date: Tue, 11 Aug 2020 23:35:01 +0300
Message-ID: <20200811203502.20382-1-i.kononenko@yadro.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.199.0.82]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=i.kononenko@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 16:35:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 Igor Kononenko <i.kononenko@yadro.com>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xm7OPSIkXWAb

Provide a definition for the "25Hz reference clock input mode" strap

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
---
 include/hw/misc/aspeed_scu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index a6739bb846..9cd530afa2 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -286,6 +286,7 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
 #define SCU_AST2500_HW_STRAP_ESPI_FLASH_ENABLE     (0x1 << 26)
 #define SCU_AST2500_HW_STRAP_ESPI_ENABLE           (0x1 << 25)
 #define SCU_AST2500_HW_STRAP_DDR4_ENABLE           (0x1 << 24)
+#define SCU_AST2500_HW_STRAP_25HZ_CLOCK_MODE       (0x1 << 23)
 
 #define SCU_AST2500_HW_STRAP_ACPI_ENABLE           (0x1 << 19)
 #define SCU_AST2500_HW_STRAP_USBCKI_FREQ           (0x1 << 18)
-- 
2.17.1

